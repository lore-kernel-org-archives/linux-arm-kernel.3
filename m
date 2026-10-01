Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4055BCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFpB4EJBi1s9LW7Jn1CGcfuA6dJoseKjsF9HkV9MrYU=; b=x0XiQ3TUanYSOmCBGsMSODKOXH
	ftUnz9AinQoocUsMzyHKB3uPxCoSAKWMYfCI7D6rxVInBQjRsBdRp7kOH1B3Z7P4cWH3JN7O40OlQ
	ctleMbpjBivEOd7GmOwYjaD2sdAvKNLBxK0nMSwyFz40Y9lc1Z93bjOgm00hGwpCrI4NcQCLfa9NC
	eUQ9RZuEGJx11eowCMd41KwVBRybAP/Pxf4LyDFWgMqb9Hp3pzLhH2jj3C6vmSBrczABCPa9Jp0i0
	2QKiTMvUcGTLlZMKTINF/WcDPNqFOum57oBUkT60qNcWYjv6Gtt7z0wAfIpP0n/nLsR4evSDLKByr
	BHQEN0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJC-00000009J9N-43go;
	Thu, 01 Oct 2026 13:58:50 +0000
Received: from out-69.mta1.migadu.com ([95.215.58.69] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJA-00000009J6N-3TId
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:58:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=b9H/D2Oets9l+57/USH2X825QBQV4KSc1qXz5lM1WvE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790863127; v=1; x=1791467927;
 b=lzqxdZeaiq9rAMah9gWq4t6P/m4iiyss04uJ7Q3QXz+69BvXMghxdlL2lWuWGFtc5U4Tu5rh
 gGUWFgCpjqIZtS66gM9W3u//psno50bUOwBGaT3RnJ0JfOU73Icm9HGRFdhujrFrPHrZ8KSC5ox
 VCB2BNL9eC0htoxxFXX4Zwk8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2681ecfc4cecb241;
	Thu, 01 Oct 2026 13:58:47 +0000
X-Mizu-Trace-ID: 2681ecfc4cecb241
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v4 13/18] KVM: arm64: Inject an UNDEF at EL2 for unhandled protected guest exits
Date: Thu,  1 Oct 2026 14:57:06 +0100
Message-Id: <20261001135711.1640520-14-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001135711.1640520-1-fuad.tabba@linux.dev>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065849_016151_B5CD1B05 
X-CRM114-Status: GOOD (  13.34  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Make pvm_exit_handlers[] an allow-list: a protected guest's exit class
is handled at EL2, forwarded where the host emulates it, or results in
an UNDEF at EL2. Any other class, once forwarded, would re-execute
forever. The host resolves such an exit by injecting an exception or
incrementing the PC. The marshalling that follows allows neither: a
protected vCPU takes only the UNDEF on a SYS64 trap and the external
abort on a forwarded IABT or DABT that EL2 builds for it.

WFxT takes the UNDEF, as it isn't advertised to protected guests.
FP/SIMD keeps the lazy switch, and the watchpoint entry is dropped: a
protected vCPU runs with TDE clear.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/switch.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7318e3e6a5f36..91e1edf40bcd2 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -203,15 +203,36 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[ESR_ELx_EC_MOPS]		= kvm_hyp_handle_mops,
 };
 
+/* WFI/WFE exit to the host, which emulates them. WFxT is not advertised. */
+static bool kvm_handle_pvm_wfx(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	if (kvm_vcpu_get_esr(vcpu) & ESR_ELx_WFx_ISS_WFxT)
+		return kvm_handle_pvm_restricted(vcpu, exit_code);
+
+	return false;
+}
+
+/* Lazy FP/SIMD switch, or the UNDEF that would otherwise be left to the host. */
+static bool kvm_handle_pvm_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	if (kvm_hyp_handle_fpsimd(vcpu, exit_code))
+		return true;
+
+	return kvm_handle_pvm_restricted(vcpu, exit_code);
+}
+
+/*
+ * A class not listed takes an UNDEF at EL2: the host has no way to
+ * inject one into a protected vCPU.
+ */
 static const exit_handler_fn pvm_exit_handlers[] = {
-	[0 ... ESR_ELx_EC_MAX]		= NULL,
+	[0 ... ESR_ELx_EC_MAX]		= kvm_handle_pvm_restricted,
+	[ESR_ELx_EC_WFx]		= kvm_handle_pvm_wfx,
 	[ESR_ELx_EC_HVC64]		= kvm_handle_pvm_hvc64,
 	[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
-	[ESR_ELx_EC_SVE]		= kvm_handle_pvm_restricted,
-	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
+	[ESR_ELx_EC_FP_ASIMD]		= kvm_handle_pvm_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
 	[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
-	[ESR_ELx_EC_WATCHPT_LOW]	= kvm_hyp_handle_watchpt_low,
 	[ESR_ELx_EC_MOPS]		= kvm_hyp_handle_mops,
 };
 
-- 
2.39.5



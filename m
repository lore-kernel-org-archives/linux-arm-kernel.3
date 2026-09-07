Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9293FC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVHv+1qMD5dJ6GDL8aPmjBAyMw/yNgWr1F02TRS1KXQ=; b=HZjKlbejKjt54o/Y9tt8X6PKXc
	e18es0y488xvO82gueGId2jZTGqyLWGUx9iWLe5ioAfeNU/pBsqAD9gRt/6enWuMvvdt2KcsiuGkq
	YKgwgEsbmPzBA4zd9JoP4y5wfkkFyW/JCla1Ss4jpJR2d6Gmx8pNQL+iJtbIRQTNYB4etaSS/p2u+
	oQ977AqLzfHjcesoFVdyXp/RctPyw5l3aCaRyRPBRG4QYELFlOa+dJjEmSE4ZaeNNuXXBCo2ZcgcS
	SmkIWL+Uy0UYh5+bgS+7oDWBzirZwvmKfs7H2Wky+X7V1sU6v0RrA3Mf0cI4hhxrtil+jTLvXXYMl
	c19ha8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TMC-000000066NR-351w;
	Mon, 07 Sep 2026 07:01:32 +0000
Received: from out-250.mta1.migadu.com ([2001:41d0:203:375::fa] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TM8-000000066Jv-2Ttw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:01:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UrkAa/Ibk4oC0D29/DNAsgafr0M8SDNie/XH9u/vDGg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764486; v=1; x=1789369286;
 b=jsGVX4LjDrB/xxGxz1yid9sTviRdlwEXxqkVYIzswG3Rc0ZLGOjfGqmbwK/fczQCJD9jOcQQ
 TFFGWcd32hGRaDs/tCcOMvlIqFhH93TO7wBy+2x6bQg/UDDuB8fW2WhTTzkQCywKBSXIapB1rf9
 k7cztB5E11JqVQZzU3d7gIng=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 64311d740072dc6d;
	Mon, 07 Sep 2026 07:01:26 +0000
X-Mizu-Trace-ID: 64311d740072dc6d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 11/17] KVM: arm64: Inject an UNDEF at EL2 for unhandled protected guest exits
Date: Mon,  7 Sep 2026 07:59:56 +0100
Message-Id: <20260907070002.3333525-12-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000128_781123_E8D924C3 
X-CRM114-Status: GOOD (  12.90  )
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
index 7318e3e6a5f36..afddcf14f366e 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -203,15 +203,36 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[ESR_ELx_EC_MOPS]		= kvm_hyp_handle_mops,
 };
 
+/* WFI/WFE exit to the host, which emulates them. WFxT is not offered. */
+static bool kvm_handle_pvm_wfx(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	if (kvm_vcpu_get_esr(vcpu) & ESR_ELx_WFx_ISS_WFxT)
+		return kvm_handle_pvm_restricted(vcpu, exit_code);
+
+	return false;
+}
+
+/* Lazy FP/SIMD switch, or the UNDEF the host would otherwise be asked for. */
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



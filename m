Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEA4C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+P7shhjvj4jGl8Oj99Y+U9YcvQ8GI3dI5cVnZqFmdg=; b=qEBJ4sWlKlXqydf6jwdop5jlsZ
	FgbUkxhQfrr6EWJERnTuaH7966sbna9CU/Ck7E0S4yF6ImSepfXlqCXDKv2NlM4puaOjHF2c7mhCa
	KqvgdryQfiMoaWiUAmcogatQsW/q88fXBxfyEfSW3aXd9fQfAujQycUYAcD2Tydax07guRHgnFCUQ
	6X8psnlrMI72ePjHJnXidVLzxwgQqTijjVtKpgHrTMl9lBcfKe9bWzrR5AQAomkaD7CBTSx0sB8X0
	13+IFvhPiGFFrrSXGycnvRMNOoE0HvZsddk0Eo+CjdoUFH749p+2opgn7M+YDXTPSN3a21ZEOxJw/
	Q9FDmxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TMN-000000066XQ-22YX;
	Mon, 07 Sep 2026 07:01:43 +0000
Received: from out-15.mta1.migadu.com ([2001:41d0:203:375::f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TMK-000000066S9-3OM3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:01:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=U/axjWQAfQSFNwOk+gQLgXnGQvfOgoP7MHtzfv1LyiQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764498; v=1; x=1789369298;
 b=WGMKie+k9l0m1QyQdxO2azYFgoj8SFmFgBdU0oZioZ6vybLS2TXoEZktugpuEn6L5bof695P
 0bPT1V0dTTa09Fujr/E2StjZF2M7u0b3DTLPJiYg1rlrthNoH3UsiwRcjn0jcNhjQdmI6cTNqlO
 jZGOKmHPyJwD10igHXTEa2AE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d54cb9ebe02a4a1c;
	Mon, 07 Sep 2026 07:01:38 +0000
X-Mizu-Trace-ID: d54cb9ebe02a4a1c
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
Subject: [PATCH v2 13/17] KVM: arm64: Pend a protected guest's SError with HCR_EL2.VSE only
Date: Mon,  7 Sep 2026 07:59:58 +0100
Message-Id: <20260907070002.3333525-14-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000141_005130_C9CC8AD2 
X-CRM114-Status: GOOD (  12.10  )
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

kvm_inject_serror_esr() emulates the exception entry when
serror_is_masked() reads PSTATE.A clear, but the host has no view of a
protected guest's PSTATE.A, and an emulated entry never reaches the
guest: the SError is lost. Set VSE instead and let the guest's own
PSTATE.A mask it.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/inject_fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index d6c4fc16f8795..b88098a7e756c 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -378,8 +378,11 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 	 *
 	 * As we're emulating the SError injection we need to explicitly populate
 	 * ESR_ELx.EC because hardware will not do it on our behalf.
+	 *
+	 * The host does not see a protected guest's PSTATE.A: leave the
+	 * vSError to HCR_EL2.VSE below, which the guest masks itself.
 	 */
-	if (!serror_is_masked(vcpu)) {
+	if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu)) {
 		pend_serror_exception(vcpu);
 		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
 		vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
-- 
2.39.5



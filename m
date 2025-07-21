Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40601C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEWn8R6xTyTNY04jO6IV6mM8iK9PobyeNUDDr8nCo8A=; b=IXgshbIgh2e0nOxSOqRzTWeNva
	EZeLhIwRq8SyC/w+G6qkAZmR+6aEmYwhRO5FCxY1/5rPiZ6/cA45jX6yigU8v6+P/ebJqHZUO0u13
	o6rRiRQZzNmYpiS85PjUMyiK8EpHEkWHez64mMbdRQP4S1cy+snt4+rDFK8gus49fTnfbj262BmL+
	Pxmgv67nHlhKnJCQrxoTPD3EOmonV1nuojkpdqfpQmVJTguiWsKW87YARokqHIizA2wpTMq22ryaC
	IwFtL6baPnHpHInCWovfHQ2zjACgUNZeUoMrJLaQIxruwOVUvmWgSVY/m3aYDmAnl/Hk22oQCUdZg
	84sZrJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorg-0000000H7Zz-1V8N;
	Mon, 21 Jul 2025 11:39:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udncu-0000000Gwl1-25g9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFD8644C52;
	Mon, 21 Jul 2025 10:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE413C4CEF4;
	Mon, 21 Jul 2025 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753093207;
	bh=aU3ERR3QXKPxAdBKGuj6WvEx4vWELd23g27wVC/6O8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/bOeeGhumpGirTKEEVLNgLFpqIqkwkLHcrgMdCAha3qEZYikGGIf+lKbrEbzhnYt
	 6YAFSrv/CcZ259ma57vVPP1TUD8AK9P6EWlmo5Mt2+hKdumFMltsg3E6PGa0V9zZmw
	 qi7LMlZswL661VfvPUPfF/1kw5RFFWHoTT1O67RQ0nIH9AcGoIGi9if3ncSNNdmpSi
	 pIXT+Pvvd6rA0tMdAMP5Q9MNec4bEpvWNStI44mwoUzRz8Jyn7Xs4W1pVn5xIWLsUS
	 He3xgxGOCsfTfM8K1UaaaxIlw1i9wGHJIhiwaAhwgDpq7IdjH14ppB1afHhXFFLYEQ
	 EF0bONN3rUUVA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1udncs-00HZDF-17;
	Mon, 21 Jul 2025 11:20:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 3/7] KVM: arm64: Make RAS registers UNDEF when RAS isn't advertised
Date: Mon, 21 Jul 2025 11:19:51 +0100
Message-Id: <20250721101955.535159-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250721101955.535159-1-maz@kernel.org>
References: <20250721101955.535159-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_032008_586071_EDF944C4 
X-CRM114-Status: GOOD (  12.22  )
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

We currently always expose FEAT_RAS when available on the host.

As we are about to make this feature selectable from userspace,
check for it being present before emulating register accesses
as RAZ/WI, and inject an UNDEF otherwise.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 9d8c47e706b96..aea50870d9f11 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2688,6 +2688,23 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool access_ras(struct kvm_vcpu *vcpu,
+		       struct sys_reg_params *p,
+		       const struct sys_reg_desc *r)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	switch(reg_to_encoding(r)) {
+	default:
+		if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {
+			kvm_inject_undefined(vcpu);
+			return false;
+		}
+	}
+
+	return trap_raz_wi(vcpu, p, r);
+}
+
 /*
  * For historical (ahem ABI) reasons, KVM treated MIDR_EL1, REVIDR_EL1, and
  * AIDR_EL1 as "invariant" registers, meaning userspace cannot change them.
@@ -3035,14 +3052,14 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_AFSR1_EL1), access_vm_reg, reset_unknown, AFSR1_EL1 },
 	{ SYS_DESC(SYS_ESR_EL1), access_vm_reg, reset_unknown, ESR_EL1 },
 
-	{ SYS_DESC(SYS_ERRIDR_EL1), trap_raz_wi },
-	{ SYS_DESC(SYS_ERRSELR_EL1), trap_raz_wi },
-	{ SYS_DESC(SYS_ERXFR_EL1), trap_raz_wi },
-	{ SYS_DESC(SYS_ERXCTLR_EL1), trap_raz_wi },
-	{ SYS_DESC(SYS_ERXSTATUS_EL1), trap_raz_wi },
-	{ SYS_DESC(SYS_ERXADDR_EL1), trap_raz_wi },
-	{ SYS_DESC(SYS_ERXMISC0_EL1), trap_raz_wi },
-	{ SYS_DESC(SYS_ERXMISC1_EL1), trap_raz_wi },
+	{ SYS_DESC(SYS_ERRIDR_EL1), access_ras },
+	{ SYS_DESC(SYS_ERRSELR_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXFR_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXCTLR_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXSTATUS_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXADDR_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXMISC0_EL1), access_ras },
+	{ SYS_DESC(SYS_ERXMISC1_EL1), access_ras },
 
 	MTE_REG(TFSR_EL1),
 	MTE_REG(TFSRE0_EL1),
-- 
2.39.2



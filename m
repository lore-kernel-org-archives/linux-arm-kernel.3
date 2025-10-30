Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36F8CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxEywalnC5f9ZCIbNUte4Hzv1A03goTu5tJbvzMlI10=; b=DqbZCZAcK5VqwmRmgEZhu9KPkU
	JR3q2M9m4BWRVZbs5FZRPOPeeyDBn/uYD7r1Ck3netvOFqdmCrbxTEIy4eNyjDczGJYouxj9rQwhz
	9MSMc0TVCYsssyvPDpfK4ImdPfr8xGweAL8iRbqdzrRgZn/IoVyWVViwo8r1guhWZPBvbUpx026O3
	rZt/kTSdLtpQimuNgiiR+P0v4V88MHRSxDKP0clDrgM6EUkPreymg/Xg+NdQe7xgLzf/WIb08N8B+
	pK+5nN80fUmwQ0328uxFF7DSEKYZqrNlPkEal8Ec001n8MSfs6ymg4+tborOtYO9psuVMQAk6Ytzl
	fHTypx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERkO-0000000473e-3acY;
	Thu, 30 Oct 2025 12:27:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERkH-0000000470A-0HAh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C00DE44EF2;
	Thu, 30 Oct 2025 12:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF14C113D0;
	Thu, 30 Oct 2025 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761827232;
	bh=quI+MXewqLox811sEJGEWZFPLVZMqZcSPVJ2hRZJyH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SIXIKIPU7h2OGS1tFMdWRUfqDtUh/Y4zJ7xdpUNlaRq2yS0lH0T+7NJmImbJzolV3
	 5BkMdzqRnx/bO33JR/RO7eTpi3UFJnSv0R4off5W4MGMpJukA4O0HTMMDd6Od2LqUV
	 1WXPui8nomFYPnVQGmpAA1PUGYZ++/aVxziER5qPtfrQZ6yZATMERAxoP54myJfih6
	 jD7bZOYkCe0hIeJJ03nZk6SSbpKPvoqAp44CDgIEfmpq6zgHURYgBsrV0FKzQ5kwG3
	 CDojk4gKvgyR+c1ZF8XR3QnIRfTSbkCKKfGqXXbyfKSHmMZ4SiT4MacQ6/Bm35hRa2
	 UjA8tRlMHQWnA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vERkE-00000000yNP-39fN;
	Thu, 30 Oct 2025 12:27:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/3] KVM: arm64: Limit clearing of ID_{AA64PFR0,PFR1}_EL1.GIC to userspace irqchip
Date: Thu, 30 Oct 2025 12:27:07 +0000
Message-ID: <20251030122707.2033690-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030122707.2033690-1-maz@kernel.org>
References: <20251030122707.2033690-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_052713_126690_441AF757 
X-CRM114-Status: GOOD (  12.23  )
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

Now that the idreg's GIC field is in sync with the irqchip, limit
the runtime clearing of these fields to the pathological case where
we do not have an in-kernel GIC.

While we're at it, use the existing API instead of open-coded
accessors to access the ID regs.

Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ad82264c6cbe1..8ae2bca816148 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5609,11 +5609,13 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 
 	guard(mutex)(&kvm->arch.config_lock);
 
-	if (!(static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif) &&
-	      irqchip_in_kernel(kvm) &&
-	      kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)) {
-		kvm->arch.id_regs[IDREG_IDX(SYS_ID_AA64PFR0_EL1)] &= ~ID_AA64PFR0_EL1_GIC_MASK;
-		kvm->arch.id_regs[IDREG_IDX(SYS_ID_PFR1_EL1)] &= ~ID_PFR1_EL1_GIC_MASK;
+	if (!irqchip_in_kernel(kvm)) {
+		u64 val;
+
+		val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1) & ~ID_AA64PFR0_EL1_GIC;
+		kvm_set_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1, val);
+		val = kvm_read_vm_id_reg(kvm, SYS_ID_PFR1_EL1) & ~ID_PFR1_EL1_GIC;
+		kvm_set_vm_id_reg(kvm, SYS_ID_PFR1_EL1, val);
 	}
 
 	if (vcpu_has_nv(vcpu)) {
-- 
2.47.3



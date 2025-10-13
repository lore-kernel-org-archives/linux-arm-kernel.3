Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5769ACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjAHkCU8YsGGFZct+9fqvuBXzmdtdxGGZMlqsTVTm7k=; b=JLmTuGZehDl5FLLS3YIRcURmN0
	guJAo4dY/R+sHyl0UYoEvQ2RW998FAPfCoVV6etWcr8UF0dJkZ0Y9TDFHDyPFs9oMUlqP9uVL3K9u
	QiwsYuZw3Jtaxmp6ckHdrhKwujJfwLWSfhPtA47Tip5KWMRchg34ga5GC6dWBq2BqplnWj4nAJf+V
	Pr6wGFWfyXN/cnEJ7wfnsvTJvkW6sGQe8uK1qs6PrKWjZZ/SynwO56OUT822zL90j+hOzcdguaVcJ
	isWNRstEqVnxUVBz+AuiTFrp2Z3e80oSubP3KLiaj8MDnjx6psOHY83GJqHRH8B2txAjq2GSdtUej
	S9Ps1qvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dyh-0000000Cbqu-10Hi;
	Mon, 13 Oct 2025 08:32:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dyf-0000000CbpS-008F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36981456E0;
	Mon, 13 Oct 2025 08:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16096C4CEFE;
	Mon, 13 Oct 2025 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760344339;
	bh=HFbqiH3fVeEghecXQ5XW07ZfgkipM0nl6smfp7yY2AE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kb2exZYlc7VgJTXuZjUYTjJcuSv7qO5YyYoE221at/D1Ku+xCdvEMKyH6mFERxDch
	 9HSaCLzS34XpCKKGxb2XcdHKc8lqyZpz1RYi/ESs5DSwZNmp7bcev02GKhFqfbuBXS
	 gMLRJok23MELnXcijcYxxHsiNt2FOiI96Fi/8SdRNQBL5MJhk3Obx1ITRxxRT+lfSC
	 Xugq/VJqbDwbDFbENeBAH12gr03X9UZ6rueBsF/jk0uZowDZVqXldwZLPbUE0bYwQG
	 +FQVZWi8+1sC53JDwuUAmi44zqfuBF3l065N5yEOWwT8dbZDH4xkxL/APydxagXPJp
	 ajLymYjtnrCuA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8Dyb-0000000DRrP-11gd;
	Mon, 13 Oct 2025 08:32:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/3] KVM: arm64: Limit clearing of ID_{AA64PFR0,PFR1}_EL1.GIC to userspace irqchip
Date: Mon, 13 Oct 2025 09:32:07 +0100
Message-ID: <20251013083207.518998-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013083207.518998-1-maz@kernel.org>
References: <20251013083207.518998-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_013221_067231_9FC4E3F9 
X-CRM114-Status: GOOD (  11.08  )
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

Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 73dcefe51a3e7..25cfd0f9541f5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5494,9 +5494,7 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 
 	guard(mutex)(&kvm->arch.config_lock);
 
-	if (!(static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif) &&
-	      irqchip_in_kernel(kvm) &&
-	      kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)) {
+	if (!irqchip_in_kernel(kvm)) {
 		kvm->arch.id_regs[IDREG_IDX(SYS_ID_AA64PFR0_EL1)] &= ~ID_AA64PFR0_EL1_GIC_MASK;
 		kvm->arch.id_regs[IDREG_IDX(SYS_ID_PFR1_EL1)] &= ~ID_PFR1_EL1_GIC_MASK;
 	}
-- 
2.47.3



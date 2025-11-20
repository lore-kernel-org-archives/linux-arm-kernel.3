Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73039CF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fVVJNQa0v4wAsDKlChj/4mJbnx6HSvH9CC19aNl2XE=; b=G1hOkkDOdyu2ARYw2ddpz8jGfb
	zxj8obNstzQOPXL56t6S4ZNPhXYSCVOtJLpTGfWrwc9mdgw8QxGzo9aM7Pte4DaQYdDLFHlctitah
	TBY1Y31cpSFwC0YC2DIkYA9VKEQNfg9rLzwblRSzooZS/jbHN/aHNXIJ+/lXTdiRzzKdYUmDP+taz
	SJw2cDSZMCKlqzHk/2ASXBTfM2UFP7HN9L6tWlhHiBwzQGjECYBgMR7a16urGZgq8oY+pW5/+oqOF
	Td2LOeqBAcCvX2Hmm3n8CRe9yCsvH6EhysJJPod+vjufLTpbj/Ac8KhpNiNjAMQW0PymWL2yX5zDe
	0ken1q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Px-000000075cH-1INy;
	Thu, 20 Nov 2025 17:26:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pu-000000075Z4-0Fwe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 595A7601E3;
	Thu, 20 Nov 2025 17:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEE9C4CEF1;
	Thu, 20 Nov 2025 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659557;
	bh=7kelRFjUgActU5xiSytoyYN0KOzE8BSz1DCcl/nj/Cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rPeGkt1Mc8suuivKBw2eE2Q5GiLSLTVsunNR300EHpY821ccGVjT6GLbTtUh61gRK
	 hiOx7m093SnTkw1qkviRqgDD1u5Y/Psns/YXx2yeJxf2L1tpPwjr5X5ojar143sarx
	 E8+R1zoRTp1y1918iLV7Jpo5PmJwT2JueMFS+bqmwa0yTSmasV3j57NOcYaOVHIb5j
	 8+oJiYjfkbgaTxLuJK8HlwB0+bHRvHZDogrKIiVpziU31TiLJj/QH9DDHPfjKty83A
	 6/rr9GNDbP4lNv6MBZqY46hMcwztBlXLg6BjAo5s0TcU2gDqqXWDcLepM4RSmXd1nn
	 qBCeCKRJXZ70Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pq-00000006y6g-4BxX;
	Thu, 20 Nov 2025 17:25:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 05/49] KVM: arm64: vgic-v3: Fix GICv3 trapping in protected mode
Date: Thu, 20 Nov 2025 17:24:55 +0000
Message-ID: <20251120172540.2267180-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

As we are about to start trapping a bunch of extra things, augment
the pKVM trap description with all the registers trapped by ICH_HCR_EL2.TC,
making them legal instead of resulting in a UNDEF injection in the guest.

While we're at it, ensure that pKVM captures the vgic model so that it
can be checked by the emulation code.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 3 +++
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 43bde061b65de..8911338961c5b 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -337,6 +337,9 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	/* CTR_EL0 is always under host control, even for protected VMs. */
 	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
 
+	/* Preserve the vgic model so that GICv3 emulation works */
+	hyp_vm->kvm.arch.vgic.vgic_model = host_kvm->arch.vgic.vgic_model;
+
 	if (test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &host_kvm->arch.flags))
 		set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 82da9b03692d4..3108b5185c204 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -444,6 +444,8 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 
 	/* Scalable Vector Registers are restricted. */
 
+	HOST_HANDLED(SYS_ICC_PMR_EL1),
+
 	RAZ_WI(SYS_ERRIDR_EL1),
 	RAZ_WI(SYS_ERRSELR_EL1),
 	RAZ_WI(SYS_ERXFR_EL1),
@@ -457,9 +459,12 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 
 	/* Limited Ordering Regions Registers are restricted. */
 
+	HOST_HANDLED(SYS_ICC_DIR_EL1),
+	HOST_HANDLED(SYS_ICC_RPR_EL1),
 	HOST_HANDLED(SYS_ICC_SGI1R_EL1),
 	HOST_HANDLED(SYS_ICC_ASGI1R_EL1),
 	HOST_HANDLED(SYS_ICC_SGI0R_EL1),
+	HOST_HANDLED(SYS_ICC_CTLR_EL1),
 	{ SYS_DESC(SYS_ICC_SRE_EL1), .access = pvm_gic_read_sre, },
 
 	HOST_HANDLED(SYS_CCSIDR_EL1),
-- 
2.47.3



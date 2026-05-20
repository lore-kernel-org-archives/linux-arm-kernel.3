Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99AACD5BAE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsdMoOJmlRlzGp5zQP3AHVoH36EaiJADf+BAwxUcYWM=; b=vYE4EFvAdf/JVkEb+04bVnZpwe
	sVQlH9iaEW8ZEm91EcZrsBDJ+Vgd7whg3eL94r7zGfBlH3yjxD+JW/Z6ak3BRIvssHpzEsFII3oUI
	7wtVZg2vUh3Ns6nBBSnd+HKN9DuymFNy6OyzB2qqFKSjWSEg2Ik5JaBhdiPxiUPK9ZXWg/t97N+36
	ZDqtkhNYOPPp2Bs2zpse6sXbBpMsY0Dz2PZaY+oD4VY6EfGwU0VK0Mfgwc5EksY+wXFJneInxg+m/
	kdiw0HV5a21spdV0Yixt77adGNj41eICqScVLHTNrVw/wEpj0ZOGqghtsuQNNqxtcoZBn/9bMqlrC
	fHe9L/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6H-000000047ID-47Yp;
	Wed, 20 May 2026 09:20:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6C-000000047A5-2xug
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LsdMoOJmlRlzGp5zQP3AHVoH36EaiJADf+BAwxUcYWM=; b=fCI+NzkR7LPeUon/QY4tGZEZZK
	1BGEw/pZIGeml2q3+kAUxA34HF2z/iSET3uEDlAR4uRPkICw2mu5Xuq4PyCMU2UZ/WaquEvkOtGuR
	5ajkTu3jUoy/LFkBc4Ttqzsbo+d8nxKSvrdkB0wuxr4knagMTofV4K59x6A3d5FlwxDB/kNFtQH3P
	6JeURhWp10znMzG8IUX61IU/qk/Ug/8jLVheINvp1B/oRFgP8fywkqDMZCNQ9jaq1+f8OnH3JqgfN
	KEF2sNPbwrraPFB+gc3PFEkGvqivHLbwkoUkE1xwiUs59M7NbSDYd4Qs5CSF+7vj+ovUMGUXN+uSs
	/DZN7/xg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd65-0000000GKUC-40ub
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF5F54080B;
	Wed, 20 May 2026 09:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A531A1F000E9;
	Wed, 20 May 2026 09:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268812;
	bh=LsdMoOJmlRlzGp5zQP3AHVoH36EaiJADf+BAwxUcYWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FQRsryKrwtAkdpQCJoHYLOWkbHZTpt6ZyjfVxjH1O53zM/+xAUXiDif5hpwhsnZp7
	 S7vPpdm3ayXhhtuwcphlBOKDGravWKv0DnW87ByUIcXkvopQ8/qy1s419kXmJfA6ic
	 mlX/zacsgNzHBoMk3nXfWng7x34rtul2fLvq4T/vw99umGP2zsomQa/0F7bNWctUm4
	 iVTP+wQmvE2M7U6/IfCioD4nS/y3tjcarFMzpQRnqCWeJMIKbYkDRWJdSrKSlv7eMb
	 mAaZe6T4Lb6GRALvsT8vY+VtBDJDElrFuG0Ni+O8/54fafIT2+OpM73o3MQ75kdLYj
	 2t6DJaMmzC4ig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd62-00000004IaV-3KN1;
	Wed, 20 May 2026 09:20:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 03/18] KVM: arm64: vgic-v5: Remove use of __assign_bit() with a constant
Date: Wed, 20 May 2026 10:19:34 +0100
Message-ID: <20260520091949.542365-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102015_334044_2F3EAA8D 
X-CRM114-Status: GOOD (  15.97  )
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

Using __assign_bit() is very useful when the value of the bit is
not known at compile time. In all other cases, __set_bit() and
__clear_bit() are the correct tool for the job.

This also fixes an odd case of using VGIC_V5_NR_PRIVATE_IRQS as
the bit value...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 7c146fccc9689..4d62b1c31fe8b 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -25,13 +25,13 @@ static void vgic_v5_get_implemented_ppis(void)
 	 * If we have KVM, we have EL2, which means that we have support for the
 	 * EL1 and EL2 Physical & Virtual timers.
 	 */
-	__assign_bit(GICV5_ARCH_PPI_CNTHP, ppi_caps.impl_ppi_mask, 1);
-	__assign_bit(GICV5_ARCH_PPI_CNTV, ppi_caps.impl_ppi_mask, 1);
-	__assign_bit(GICV5_ARCH_PPI_CNTHV, ppi_caps.impl_ppi_mask, 1);
-	__assign_bit(GICV5_ARCH_PPI_CNTP, ppi_caps.impl_ppi_mask, 1);
+	__set_bit(GICV5_ARCH_PPI_CNTHP, ppi_caps.impl_ppi_mask);
+	__set_bit(GICV5_ARCH_PPI_CNTV, ppi_caps.impl_ppi_mask);
+	__set_bit(GICV5_ARCH_PPI_CNTHV, ppi_caps.impl_ppi_mask);
+	__set_bit(GICV5_ARCH_PPI_CNTP, ppi_caps.impl_ppi_mask);
 
 	/* The SW_PPI should be available */
-	__assign_bit(GICV5_ARCH_PPI_SW_PPI, ppi_caps.impl_ppi_mask, 1);
+	__set_bit(GICV5_ARCH_PPI_SW_PPI, ppi_caps.impl_ppi_mask);
 
 	/* The PMUIRQ is available if we have the PMU */
 	__assign_bit(GICV5_ARCH_PPI_PMUIRQ, ppi_caps.impl_ppi_mask, system_supports_pmuv3());
@@ -146,9 +146,7 @@ int vgic_v5_init(struct kvm *kvm)
 	/* We only allow userspace to drive the SW_PPI, if it is implemented. */
 	bitmap_zero(kvm->arch.vgic.gicv5_vm.userspace_ppis,
 		    VGIC_V5_NR_PRIVATE_IRQS);
-	__assign_bit(GICV5_ARCH_PPI_SW_PPI,
-		     kvm->arch.vgic.gicv5_vm.userspace_ppis,
-		     VGIC_V5_NR_PRIVATE_IRQS);
+	__set_bit(GICV5_ARCH_PPI_SW_PPI, kvm->arch.vgic.gicv5_vm.userspace_ppis);
 	bitmap_and(kvm->arch.vgic.gicv5_vm.userspace_ppis,
 		   kvm->arch.vgic.gicv5_vm.userspace_ppis,
 		   ppi_caps.impl_ppi_mask, VGIC_V5_NR_PRIVATE_IRQS);
@@ -197,7 +195,7 @@ int vgic_v5_finalize_ppi_state(struct kvm *kvm)
 		/* Expose PPIs with an owner or the SW_PPI, only */
 		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
 			if (irq->owner || i == GICV5_ARCH_PPI_SW_PPI) {
-				__assign_bit(i, kvm->arch.vgic.gicv5_vm.vgic_ppi_mask, 1);
+				__set_bit(i, kvm->arch.vgic.gicv5_vm.vgic_ppi_mask);
 				__assign_bit(i, kvm->arch.vgic.gicv5_vm.vgic_ppi_hmr,
 					     irq->config == VGIC_CONFIG_LEVEL);
 			}
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103CCCF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzRNVgh2o0L2ZH++RtGlfEjZNIRYnQnAE4e/sfdNAYU=; b=ZUmlozquloLsdWenP7qj5g6ry0
	JXd2P/SwxkIrvsTmieawbKoWwE+xNhHl3/z5AJ6rrgOOMRxrXTxPCek+BwRSELEL6yyIkMvJRf9Ny
	VLM0PyUo3zD2MOjaoQVAUodcRbt6GSMGmnxZTKhJla1QpeCiTAfjlKre8TpHjn295K800AbO9KC1z
	AFVXFgUQZ4xSW4KC4ga0/dAfa/gyKEwTxKs/NeMypVmiz2HyPP8juD9ZeVZ0AvwdYehnPu3RA3fyi
	Lvb16QxSJGtpZRarHegxBBZmQOq62T6V+SbnFKba0H2DNi6SS9qeQPeWbAomcBLCKTx842psW09oV
	H0tlph4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pw-000000075bH-0084;
	Thu, 20 Nov 2025 17:26:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Ps-000000075Y8-2khN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5600444278;
	Thu, 20 Nov 2025 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CA2C19421;
	Thu, 20 Nov 2025 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659556;
	bh=IOHO43jIEbpZ6exgIFp7G66rSWGZrGpoQxbfZnY9qH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T6noQmbjh2ZSHgRNeHXmad4h7H1wCYx1kSyoQoVbVya7x+TBgCnweEjPNEvvM23tL
	 ACd4InInLMH/QCKhYsvDvyHP9N3xMu84VwQ/rLmtdwKUrnOpdhLGv8sSGnMWG+1gNp
	 RQSJbvfbixUBIzozs4E4riRwGJfAbX1lO7C3R0LSiV9WfD+HWs+iUb793VXBnTxl+6
	 /GnYVnQ0TUXta0xijqrm6JMR4Sg9voN8ntjvctC3pi8oJwvTBz24J+mbkUEeSI+Hwy
	 5QaKH9sxEbVoOAlNHcBOQKwcvpFoR8lGA94rV2Bd7gdhbLjcLwcX9Q11NNmttAwTP7
	 3pRsvWIm2UlgA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pq-00000006y6g-10ZB;
	Thu, 20 Nov 2025 17:25:54 +0000
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
Subject: [PATCH v4 02/49] irqchip/gic: Expose CPU interface VA to KVM
Date: Thu, 20 Nov 2025 17:24:52 +0000
Message-ID: <20251120172540.2267180-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092556_776311_599DAB8F 
X-CRM114-Status: GOOD (  14.23  )
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

Future changes will require KVM to be able to perform deactivations
by writing to the physical CPU interface. Add the corresponding
VA to the kvm_info structure, and let KVM stash it.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c         | 1 +
 drivers/irqchip/irq-gic.c             | 3 +++
 include/kvm/arm_vgic.h                | 3 +++
 include/linux/irqchip/arm-vgic-info.h | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 381673f03c395..441efef80d609 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -385,6 +385,7 @@ int vgic_v2_probe(const struct gic_kvm_info *info)
 
 	kvm_vgic_global_state.can_emulate_gicv2 = true;
 	kvm_vgic_global_state.vcpu_base = info->vcpu.start;
+	kvm_vgic_global_state.gicc_base = info->gicc_base;
 	kvm_vgic_global_state.type = VGIC_V2;
 	kvm_vgic_global_state.max_gic_vcpus = VGIC_V2_MAX_CPUS;
 
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 1269ab8eb726a..ec70c84e9f91d 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1459,6 +1459,8 @@ static void __init gic_of_setup_kvm_info(struct device_node *node)
 	if (ret)
 		return;
 
+	gic_v2_kvm_info.gicc_base = gic_data[0].cpu_base.common_base;
+
 	if (static_branch_likely(&supports_deactivate_key))
 		vgic_set_kvm_info(&gic_v2_kvm_info);
 }
@@ -1620,6 +1622,7 @@ static void __init gic_acpi_setup_kvm_info(void)
 		return;
 
 	gic_v2_kvm_info.maint_irq = irq;
+	gic_v2_kvm_info.gicc_base = gic_data[0].cpu_base.common_base;
 
 	vgic_set_kvm_info(&gic_v2_kvm_info);
 }
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 7a0b972eb1b12..577723f5599bd 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -59,6 +59,9 @@ struct vgic_global {
 	/* virtual control interface mapping, HYP VA */
 	void __iomem		*vctrl_hyp;
 
+	/* Physical CPU interface, kernel VA */
+	void __iomem		*gicc_base;
+
 	/* Number of implemented list registers */
 	int			nr_lr;
 
diff --git a/include/linux/irqchip/arm-vgic-info.h b/include/linux/irqchip/arm-vgic-info.h
index a470a73a805aa..67d9d960273b9 100644
--- a/include/linux/irqchip/arm-vgic-info.h
+++ b/include/linux/irqchip/arm-vgic-info.h
@@ -24,6 +24,8 @@ struct gic_kvm_info {
 	enum gic_type	type;
 	/* Virtual CPU interface */
 	struct resource vcpu;
+	/* GICv2 GICC VA */
+	void __iomem	*gicc_base;
 	/* Interrupt number */
 	unsigned int	maint_irq;
 	/* No interrupt mask, no need to use the above field */
-- 
2.47.3



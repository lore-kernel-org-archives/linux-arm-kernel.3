Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9DECCFA09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+WPue3Iv+tL0BlR1BnmIWzrK4BlC2NcKrWH67LSbbY=; b=ou8Geo28mG81trol0O+TmgCLaX
	LwFeJmQHMizo5upiMQ27hNRN9nk6K/HNcn7M1kW8DroRQmrGk6pKjohlt4NjcetKATtsg5jWKPk5k
	fuitmaU1hw8ASJsWkI4zGnOMUhfweBo2fCTagcBpbhMcY54i4PmIXJpjYRJZasDpk94k+XDkO0/wl
	FjtiRoaYtWrOa4Q3vsUVseksqvk79y0Fui/qJf3WijJu7Hpep8eYOKw9WgGay8TwVa5vPDrwjMN7j
	3xMq06LnlbvFzCFi5zhRjM+3GnWzyVooSEIjnT6dN74/RD9tlgDHdoeFpuqMP9WPFPQgsnQFl6DCh
	aBhaWNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq9-0000000AK5K-2L8t;
	Mon, 03 Nov 2025 16:55:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq4-0000000AJww-10Qa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F0C043C22;
	Mon,  3 Nov 2025 16:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105D5C4CEFD;
	Mon,  3 Nov 2025 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188927;
	bh=aE6NVHx7vy+DwlsbkAM2LLXqEhMtJjN7ppqT+b+NJig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGKTkYrV2Q+lgqFmJqwvQZTZ73tIoRCd7hk2Q8NjxGs4cHCo3bi+ZKE07WEzGPAo9
	 PaofwytlaV3g0tGKG39nZFqpbB86zquSShAuT8ur+qeGr3AsvOKV8/ceXmWsU1vVlj
	 AsiVd2V13E3S7IHdBB3nvJSGmBJuK2xD6hDi2zwtzOfip1wAcqjv/6jJphtupcvcbJ
	 zYoJPCozRrtJmhNlu/UFhOVq2pAVcnH3bMJ2XSKUP/n6l2I+ajSB1Aqg4SZi/TUXTz
	 P7mOzdIUqDDiHnYIffkA/pB0dbM3MXpkMCj3RqdG3g6I80uxvXRwaNyz6tRNjHdGkZ
	 pbjlg9PwZDvpQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq1-000000021VN-0ZZB;
	Mon, 03 Nov 2025 16:55:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 02/33] irqchip/gic: Expose CPU interface VA to KVM
Date: Mon,  3 Nov 2025 16:54:46 +0000
Message-ID: <20251103165517.2960148-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085528_317190_D538F9B0 
X-CRM114-Status: GOOD (  14.15  )
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



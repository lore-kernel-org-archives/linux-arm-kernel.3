Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57983CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1njrYb0PIgICT8tyDMXLv26jsIJEzebP8jjVeYOU+mk=; b=Lv0EJWEd44R4Odr8GaDTw3qUd6
	K49+0VUDmZm3ypSDxO4AzJIY3Gt2SPdqJdf9ZsPGmT3comJmFw0FGPQ+A9vawvczvy8mSbIXZMKaq
	3NzMs4ty9XRdd7LAp+0RZMWYBg4JIx46mJxZxvsje5pc9vLCTlFPY587Z7v3kI1JXtt9D8cbNAiBx
	iDxcJ7hpjfXa6EsW4hCogfq1+RIlXK1tQXMM5mgF7dvMvvO7+q/BmXxdknlJahXTKmzcey6kIEfla
	DlwlWkbv8kayGLKhm8oyYc70L9JzHyEtDd4TsOZN+IO3SiiXeiw0GYG3v4eQTpo6tnvPf3q+4VC+W
	NoYSS8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkLN-00000003MhZ-1YsA;
	Fri, 16 Oct 2026 15:59:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkLJ-00000003MfU-2fmD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:59:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFD0D1516;
	Fri, 16 Oct 2026 08:59:33 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89C533F673;
	Fri, 16 Oct 2026 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792166377; bh=Woou9xoQQA5eHgTr5dy8Ls1aVYXvQgnffcgiQo5RjGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hcosBroQ1a2Va8tWOBxzhENCvzaGXwogYScY6j96Edd9+08wp9K6Dg3IeEbIoFk1F
	 mcF1WrdBPpEUn0fsB06eonC1JvElQmTXrJnRoFsPK450UWG4EqURoE5YVgCWzS+YO6
	 beCJqsvxew3XUl9xRpnlqQ0c68fMhSiuyyA66SFc=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	peter.maydell@linaro.org,
	lpieralisi@kernel.org,
	timothy.hayes@arm.com,
	fuad.tabba@linux.dev
Subject: [PATCH 11/16] irqchip/gic-v5: Enable direct injection in ITS
Date: Fri, 16 Oct 2026 16:57:36 +0100
Message-Id: <20261016155741.979985-12-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016155741.979985-1-sascha.bischoff@arm.com>
References: <20261016155741.979985-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_085937_789670_B4AC2FB6 
X-CRM114-Status: GOOD (  19.67  )
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

Allow KVM to replace a host ITTE with a virtual translation that
directly injects an interrupt into a guest. Add an irq_chip callback to
install and remove the virtual translation, and disable lazy masking
while the interrupt is forwarded. The KVM caller is added later.

The ITS writes the ITTE before invalidating its cache. If invalidation
times out, hardware may still use the virtual translation even though
setup failed. Allow disable to restore the host ITTE when the forwarded
flag is clear, and retain retryable state if restoration also times
out. Keep lazy masking disabled until the host mapping is restored.

Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c   | 134 +++++++++++++++++++++++++++++
 include/linux/irqchip/arm-gic-v5.h |   8 ++
 2 files changed, 142 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 28e39b065de0e..7de40a7cff403 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -61,6 +61,48 @@ static void its_writeq_relaxed(struct gicv5_its_chip_data *its_node, const u64 v
 	writeq_relaxed(val, its_node->its_base + reg_offset);
 }
 
+#ifdef CONFIG_KVM
+int gicv5_its_enable_direct_injection(int virq, u16 vm_id, u32 guest_lpi)
+{
+	struct virt_intr_data virt_intr = {
+		.vm_id		= vm_id,
+		.guest_lpi	= guest_lpi,
+	};
+	int ret;
+
+	/*
+	 * The host will never see that interrupt firing again, so it
+	 * is vital that we don't do any lazy masking.
+	 */
+	irq_set_status_flags(virq, IRQ_DISABLE_UNLAZY);
+
+	ret = irq_set_vcpu_affinity(virq, &virt_intr);
+	if (ret && ret != -ETIMEDOUT && ret != -EBUSY)
+		irq_clear_status_flags(virq, IRQ_DISABLE_UNLAZY);
+
+	return ret;
+}
+
+int gicv5_its_disable_direct_injection(int virq)
+{
+	int ret;
+
+	ret = irq_set_vcpu_affinity(virq, NULL);
+	if (ret) {
+		pr_err("Failed to restore host interrupt\n");
+		return ret;
+	}
+
+	/*
+	 * In theory the host could see the interrupt again now. Undo this
+	 * again.
+	 */
+	irq_clear_status_flags(virq, IRQ_DISABLE_UNLAZY);
+
+	return 0;
+}
+#endif /* CONFIG_KVM */
+
 static void gicv5_its_dcache_clean(struct gicv5_its_chip_data *its, void *start,
 				   size_t sz)
 {
@@ -723,6 +765,95 @@ static void gicv5_its_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
 	msi_msg_set_addr(irq_data_get_msi_desc(d), msg, addr);
 }
 
+#ifdef CONFIG_KVM
+static int gicv5_its_set_vcpu_affinity(struct irq_data *d, void *int_data)
+{
+	struct gicv5_its_dev *its_dev = irq_data_get_irq_chip_data(d);
+	u16 event_id = FIELD_GET(GICV5_ITS_HWIRQ_EVENT_ID, d->hwirq);
+	u32 dev_id = FIELD_GET(GICV5_ITS_HWIRQ_DEVICE_ID, d->hwirq);
+	struct virt_intr_data *data = int_data;
+	struct gicv5_its_chip_data *its;
+	__le64 *itte;
+	u64 itte_val, tmp;
+	int ret = 0;
+
+	if (IS_ERR(its_dev)) {
+		pr_err("Failed to find ITS entry for DeviceID 0x%x", dev_id);
+		return PTR_ERR(its_dev);
+	}
+
+	its = its_dev->its_node;
+
+	itte = gicv5_its_device_get_itte_ref(its_dev, event_id);
+	itte_val = le64_to_cpu(*itte);
+
+	/*
+	 * The host entry should be valid, else something strange is going on!
+	 */
+	if (!(itte_val & GICV5_ITTL2E_VALID)) {
+		if (data)
+			return -EINVAL;
+		if (!irqd_is_forwarded_to_vcpu(d))
+			return 0;
+		goto invalidate;
+	}
+
+	if (data) {
+		if (irqd_is_forwarded_to_vcpu(d)) {
+			if ((itte_val & GICV5_ITTL2E_VIRTUAL) &&
+			    FIELD_GET(GICV5_ITTL2E_LPI_ID, itte_val) == data->guest_lpi &&
+			    FIELD_GET(GICV5_ITTL2E_VM_ID, itte_val) == data->vm_id)
+				return 0;
+			return -EBUSY;
+		}
+
+		/* Stale virtual translation without forwarded state. */
+		if (itte_val & GICV5_ITTL2E_VIRTUAL)
+			return -EBUSY;
+
+		tmp = FIELD_PREP(GICV5_ITTL2E_LPI_ID, data->guest_lpi);
+		tmp |= FIELD_PREP(GICV5_ITTL2E_VM_ID, data->vm_id);
+		tmp |= GICV5_ITTL2E_VIRTUAL;
+		tmp |= GICV5_ITTL2E_VALID;
+
+		its_write_table_entry(its, itte, tmp);
+	} else {
+		/*
+		 * A failed sync still needs retrying, even if the ITTE is
+		 * host-owned.
+		 */
+		if (!(itte_val & GICV5_ITTL2E_VIRTUAL) &&
+		    !irqd_is_forwarded_to_vcpu(d))
+			return 0;
+
+		if (itte_val & GICV5_ITTL2E_VIRTUAL) {
+			tmp = FIELD_PREP(GICV5_ITTL2E_LPI_ID,
+					 d->parent_data->hwirq);
+			tmp |= GICV5_ITTL2E_VALID;
+			its_write_table_entry(its, itte, tmp);
+		}
+	}
+
+invalidate:
+	/* Make the change ITS-visible */
+	dsb(st);
+	ret = gicv5_its_itt_cache_inv(its, dev_id, event_id);
+	if (ret) {
+		/* Keep a failed restoration distinguishable from a clean host ITTE. */
+		if (!data)
+			irqd_set_forwarded_to_vcpu(d);
+		return ret;
+	}
+
+	if (data)
+		irqd_set_forwarded_to_vcpu(d);
+	else
+		irqd_clr_forwarded_to_vcpu(d);
+
+	return 0;
+}
+#endif /* CONFIG_KVM */
+
 static const struct irq_chip gicv5_its_irq_chip = {
 	.name			= "GICv5-ITS-MSI",
 	.irq_mask		= irq_chip_mask_parent,
@@ -732,6 +863,9 @@ static const struct irq_chip gicv5_its_irq_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_compose_msi_msg	= gicv5_its_compose_msi_msg,
+#ifdef CONFIG_KVM
+	.irq_set_vcpu_affinity	= gicv5_its_set_vcpu_affinity,
+#endif /* CONFIG_KVM */
 };
 
 static struct gicv5_its_dev *gicv5_its_find_device(struct gicv5_its_chip_data *its,
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 7e64eb0436394..791627bdf5436 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -727,4 +727,12 @@ enum gicv5_vcpu_cmd {
 	LPI_VIST_MAKE_INVALID,	/* Triggered by a guest */
 };
 
+struct virt_intr_data {
+	u16 vm_id;
+	u32 guest_lpi;
+};
+
+int gicv5_its_enable_direct_injection(int virq, u16 vm_id, u32 guest_lpi);
+int gicv5_its_disable_direct_injection(int virq);
+
 #endif
-- 
2.34.1



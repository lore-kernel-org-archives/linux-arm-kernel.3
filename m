Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85312606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rs6Q7lNA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MPvbGRsN;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RKaht33I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kMEGc0eVEgC2D9JP8FTGru/6bKm39/nf8BU8+sRFibw=; b=Rs6Q7lNAWTni7U
	yqnuVX6Fu8fKwlGY7uWHcS43hEE71c+k7sQn2+nhJfwJqP2qfrZ+jHaQgobB0olpo24vzKgDMppIk
	YFMB/jP331XpJty8mfDYEZg+zJNwPRxaHK1joUYLWB/Qtn/HZAymU2pNOzPxrqpyhKdT8fZqqG33C
	lD6CCpXQpU+SE8Gz7uG2sf2xCUou4WDw5OWfTPsT6gw/wofcJzIrM1LLdfmZFrjmCAVh075hl3TCU
	woTkUFPTeNUqLWFRZp1Q5ppBzQtPHnFs1wS5EcpvKrmEePJYCqqe8/WLFmZCK0cla3WPSyjaprlP0
	7qpaPFKXA3S7mH5icn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxzE-00000000AlI-3lVE;
	Mon, 02 Nov 2026 19:46:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyg-000000009Lv-46wW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 19:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kMEGc0eVEgC2D9JP8FTGru/6bKm39/nf8BU8+sRFibw=; b=MPvbGRsNyAM2mo0xlHPngKlKHI
	J1R1VDYoY07dFP7r8zpb173LkI2AiG1sQjBhb08TOxFQhFUJLvHbq/P9OYHiKu/yiAUhB5gKu71vF
	0cFHKZh/c0nDXVhjUQ4t25KjZa8AK/fXPvg5lMxiVLGTA07ozq5Gu+9Jllr45FlWXdx3G4OoK5s/m
	M9+QYLY3FMOIwI95VC96dqlC68XERL4QOcqt8zqMEzBIvTGgJ94hEw49F2WMpMq/uV0wH76OUv1nL
	gMLwvqsagKU5FshUWMOhUJVP992ro8bxK5t8Xa6RUbhbUhDcv1yeUJa7DI9/1mxaL6HW6BaSkyFru
	Kqs1RCDg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyd-000000031Mg-0D7r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:45:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78DE216A3;
	Mon,  2 Nov 2026 11:45:50 -0800 (PST)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C241D3F673;
	Mon,  2 Nov 2026 11:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793648753; bh=8ufYLTgExRcynqcSclIrqXjVMInyx7aBmEPJwxCFi+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKaht33Iu3Z85+5soFy0KwsJr5+zf06qBJMEj8pHg+XR1w5r1m9D0xdcw54jwWlUC
	 6I79icFOfYrsHZdWu//nhwXVv3FbSDp610yp/m0RvYHvX7YorKcLlkG5edv0GowYTZ
	 t2Yjx6tJuSSxnqE7HAh3TwsJMV9+PROFGwY+bYPw=
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
Subject: [PATCH v2 11/16] irqchip/gic-v5: Enable direct injection in ITS
Date: Mon,  2 Nov 2026 19:44:49 +0000
Message-Id: <20261102194454.4086911-12-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102194454.4086911-1-sascha.bischoff@arm.com>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_194556_056002_3B051A82 
X-CRM114-Status: GOOD (  21.93  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 drivers/irqchip/irq-gic-v5-its.c   | 141 +++++++++++++++++++++++++++++
 include/linux/irqchip/arm-gic-v5.h |   8 ++
 2 files changed, 149 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 28e39b065de0e..d91f4ea1ef440 100644
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
@@ -723,6 +765,102 @@ static void gicv5_its_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
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
+	if (!ret && !data) {
+		/*
+		 * Invalidation sends events using the old translation to the
+		 * IRS, but does not wait for them to be processed.
+		 */
+		gicv5_irs_syncr();
+	}
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
@@ -732,6 +870,9 @@ static const struct irq_chip gicv5_its_irq_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_compose_msi_msg	= gicv5_its_compose_msi_msg,
+#ifdef CONFIG_KVM
+	.irq_set_vcpu_affinity	= gicv5_its_set_vcpu_affinity,
+#endif /* CONFIG_KVM */
 };
 
 static struct gicv5_its_dev *gicv5_its_find_device(struct gicv5_its_chip_data *its,
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 6e8484fef9faf..26ca29794a960 100644
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



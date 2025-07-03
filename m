Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C724FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuiKy6HzLGMzTMoD6eaD/m/nf1gAtFL5nYBYhD5Qphs=; b=XREHdcorFMXNRvTzbhBA++tnOk
	DRYu1qGKSQNaoak9k1DD392skZef7HtH1objvstthtg4hG/CIU1eOdJ0Kcr4ilFO7GxD2FzW7rkss
	ReYMSHmoEiKdeYlPOJNmVv1nzC/pkKmtV6xTlSgaMaBSHlXUmmuGqCMu/C7tKmN1Ok8yxwJ36ZECX
	nqlwvoH5IfnkWb+eqIxoevKcM26VAaB4DI/PqlNmQpUxFWu8xx6cOojWKx+pj73LSmyP+9gXcWdLC
	U1Y6mUzVK9OjkWTwf+ZVutl6EXAqohn82K6c6kmvWuc/UGKBy1h51nuNVoq7NPxWBUihAO4JbaeQN
	70NItKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXz-0000000Cqzr-0NhW;
	Thu, 03 Jul 2025 23:40:55 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSfm-0000000Clxf-3ccB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:44:56 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 2C6602115816; Thu,  3 Jul 2025 15:44:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C6602115816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751582693;
	bh=yuiKy6HzLGMzTMoD6eaD/m/nf1gAtFL5nYBYhD5Qphs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oDblWI43lsxH9jUfMZeRB1+emFtnDegfbB6mjKyHcpOhYrcXlgm8Gu7Am5Kmj0HpG
	 71EJOHAo+qzhsCv8jE4vWyx5qbIbcBNn3Kwbvt+zUEpaFh6H8v9KrfGVnmOWkcG6RR
	 Tqm8oVDvfAIovGG7P/VQMNewAbD17k6t4ZCEBHDA=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mhklinux@outlook.com,
	tglx@linutronix.de,
	bhelgaas@google.com,
	romank@linux.microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH v2 5/6] x86: hyperv: Expose hv_map_msi_interrupt function
Date: Thu,  3 Jul 2025 15:44:36 -0700
Message-Id: <1751582677-30930-6-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_154455_005261_DC52A02D 
X-CRM114-Status: GOOD (  14.44  )
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

From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

This patch moves a part of currently internal logic into the
hv_map_msi_interrupt function and makes it globally available helper
function, which will be used to map PCI interrupts in case of root
partition.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
---
 arch/x86/hyperv/irqdomain.c     | 38 +++++++++++++++++++++++----------
 arch/x86/include/asm/mshyperv.h |  2 ++
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
index 75b25724b045..eca015563420 100644
--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -172,13 +172,32 @@ static union hv_device_id hv_build_pci_dev_id(struct pci_dev *dev)
 	return dev_id;
 }
 
-static int hv_map_msi_interrupt(struct pci_dev *dev, int cpu, int vector,
-				struct hv_interrupt_entry *entry)
+/**
+ * hv_map_msi_interrupt() - "Map" the MSI IRQ in the hypervisor.
+ * @data:      Describes the IRQ
+ * @out_entry: Hypervisor (MSI) interrupt entry (can be NULL)
+ *
+ * Map the IRQ in the hypervisor by issuing a MAP_DEVICE_INTERRUPT hypercall.
+ */
+int hv_map_msi_interrupt(struct irq_data *data,
+			 struct hv_interrupt_entry *out_entry)
 {
-	union hv_device_id device_id = hv_build_pci_dev_id(dev);
+	struct irq_cfg *cfg = irqd_cfg(data);
+	struct hv_interrupt_entry dummy;
+	union hv_device_id device_id;
+	struct msi_desc *msidesc;
+	struct pci_dev *dev;
+	int cpu;
 
-	return hv_map_interrupt(device_id, false, cpu, vector, entry);
+	msidesc = irq_data_get_msi_desc(data);
+	dev = msi_desc_to_pci_dev(msidesc);
+	device_id = hv_build_pci_dev_id(dev);
+	cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
+
+	return hv_map_interrupt(device_id, false, cpu, cfg->vector,
+				out_entry ? out_entry : &dummy);
 }
+EXPORT_SYMBOL_GPL(hv_map_msi_interrupt);
 
 static inline void entry_to_msi_msg(struct hv_interrupt_entry *entry, struct msi_msg *msg)
 {
@@ -191,11 +210,11 @@ static inline void entry_to_msi_msg(struct hv_interrupt_entry *entry, struct msi
 static int hv_unmap_msi_interrupt(struct pci_dev *dev, struct hv_interrupt_entry *old_entry);
 static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 {
-	struct hv_interrupt_entry out_entry, *stored_entry;
+	struct hv_interrupt_entry *stored_entry;
 	struct irq_cfg *cfg = irqd_cfg(data);
 	struct msi_desc *msidesc;
 	struct pci_dev *dev;
-	int cpu, ret;
+	int ret;
 
 	msidesc = irq_data_get_msi_desc(data);
 	dev = msi_desc_to_pci_dev(msidesc);
@@ -205,8 +224,6 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 		return;
 	}
 
-	cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
-
 	if (data->chip_data) {
 		/*
 		 * This interrupt is already mapped. Let's unmap first.
@@ -233,15 +250,14 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 		return;
 	}
 
-	ret = hv_map_msi_interrupt(dev, cpu, cfg->vector, &out_entry);
+	ret = hv_map_msi_interrupt(data, stored_entry);
 	if (ret) {
 		kfree(stored_entry);
 		return;
 	}
 
-	*stored_entry = out_entry;
 	data->chip_data = stored_entry;
-	entry_to_msi_msg(&out_entry, msg);
+	entry_to_msi_msg(data->chip_data, msg);
 
 	return;
 }
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index e00a8431ef8e..42ea9c68f8c8 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -241,6 +241,8 @@ static inline void hv_apic_init(void) {}
 
 struct irq_domain *hv_create_pci_msi_domain(void);
 
+int hv_map_msi_interrupt(struct irq_data *data,
+			 struct hv_interrupt_entry *out_entry);
 int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
 		struct hv_interrupt_entry *entry);
 int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D884C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXbxqdatFz0GsfdGns1ozciabfioI/E/Nkoi8/nxIJU=; b=yV10JR/ssXdVCDnk3HyseTYfhS
	Wo5QIm0Lzpz+37uevfpfjCoNvCmGYbNzXQK0gzHozL44gH+gWcJJLG28cLZ/E8Kp8oDNrRAIKCIH+
	AWS9fZURirvA3Xj0LWHh4NAHAQK7qKM5RhJ+GxHi5h+5gdhUt/9oCPoTyK29UlIn7xrvqzl8dpNgI
	CKhCr4912BIJNHP3UKxhqldswG4vaX9GtA0ZcBA0y5o/NqHHxOsZ6+qqDFLBozBmz2wxmhqaZ6w+9
	rpJRZckG66MWG/bRhOe8fSF7znA8xlzvSaq0niduOrc6QlwJud+iwbUkmOqQfbOsqvZHab86VAEky
	gu7D9HJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8w8-00000008RIr-1lBO;
	Wed, 11 Jun 2025 00:03:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8lM-00000008QGC-2S7C
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 23:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rXbxqdatFz0GsfdGns1ozciabfioI/E/Nkoi8/nxIJU=; b=qcRON/fqoPKayK+pkyBk+OQhCW
	UAGE+sT62aL51dH9egbK4/AV5wb52b3CF3kBDTFgqkyiFrBeulI42GKT1GMcCaSaDMKrr9nvewtJo
	ShaYyeWeCEPw+lfnn1RHrNMLjiRlEZ6chrD2hkmgSL/NtVgSiveVdc7yeuwBXmc4vYHoSxjL5MsiK
	ev66/tfJPxMoqW/k6SnAWAeynwEQVrbGHjs49GaS1Y+QC7Mt7MClGJdYU0bXiqP8nz6zVBZaIvjhz
	wx9uzZsfl9W4ie2cu9riZW3Qxldmp2xdpkp+/S3nT0wu22nDyLkD8wmuVtbj1sLqzsxRj9rV8yk/P
	DhwBMPmw==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8lK-0000000227D-1o0X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:52:16 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 728772115186; Tue, 10 Jun 2025 16:52:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 728772115186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749599529;
	bh=rXbxqdatFz0GsfdGns1ozciabfioI/E/Nkoi8/nxIJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g9SAmhmFHhM3ZQ09+FxENRwSu11O2tcnVikLE+HVGQ4JGLCVSQGM35dwAYYi96UTJ
	 PX12+2qkKWegodX2JEMAIDCQn3c2iGcyguzb1Ub4d6WXKYgN9ck+FzLYf8BzZNl9bw
	 u7T+TCzpQHBwomT2kdAgufKzn6z/pImmakqi8+wY=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH 3/4] x86: hyperv: Expose hv_map_msi_interrupt function
Date: Tue, 10 Jun 2025 16:52:05 -0700
Message-Id: <1749599526-19963-4-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_005214_854912_6B253823 
X-CRM114-Status: GOOD (  15.11  )
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
---
 arch/x86/hyperv/irqdomain.c     | 47 ++++++++++++++++++++++++---------
 arch/x86/include/asm/mshyperv.h |  2 ++
 2 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
index 31f0d29cbc5e..82f3bafb93d6 100644
--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -169,13 +169,40 @@ static union hv_device_id hv_build_pci_dev_id(struct pci_dev *dev)
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
+	struct msi_desc *msidesc;
+	struct pci_dev *dev;
+	union hv_device_id device_id;
+	struct hv_interrupt_entry dummy;
+	struct irq_cfg *cfg = irqd_cfg(data);
+	const cpumask_t *affinity;
+	int cpu;
+	u64 res;
 
-	return hv_map_interrupt(device_id, false, cpu, vector, entry);
+	msidesc = irq_data_get_msi_desc(data);
+	dev = msi_desc_to_pci_dev(msidesc);
+	device_id = hv_build_pci_dev_id(dev);
+	affinity = irq_data_get_effective_affinity_mask(data);
+	cpu = cpumask_first_and(affinity, cpu_online_mask);
+
+	res = hv_map_interrupt(device_id, false, cpu, cfg->vector,
+			       out_entry ? out_entry : &dummy);
+	if (!hv_result_success(res))
+		pr_err("%s: failed to map interrupt: %s",
+		       __func__, hv_result_to_string(res));
+
+	return hv_result_to_errno(res);
 }
+EXPORT_SYMBOL_GPL(hv_map_msi_interrupt);
 
 static inline void entry_to_msi_msg(struct hv_interrupt_entry *entry, struct msi_msg *msg)
 {
@@ -190,10 +217,8 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	struct msi_desc *msidesc;
 	struct pci_dev *dev;
-	struct hv_interrupt_entry out_entry, *stored_entry;
+	struct hv_interrupt_entry *stored_entry;
 	struct irq_cfg *cfg = irqd_cfg(data);
-	const cpumask_t *affinity;
-	int cpu;
 	u64 status;
 
 	msidesc = irq_data_get_msi_desc(data);
@@ -204,9 +229,6 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 		return;
 	}
 
-	affinity = irq_data_get_effective_affinity_mask(data);
-	cpu = cpumask_first_and(affinity, cpu_online_mask);
-
 	if (data->chip_data) {
 		/*
 		 * This interrupt is already mapped. Let's unmap first.
@@ -235,15 +257,14 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 		return;
 	}
 
-	status = hv_map_msi_interrupt(dev, cpu, cfg->vector, &out_entry);
+	status = hv_map_msi_interrupt(data, stored_entry);
 	if (status != HV_STATUS_SUCCESS) {
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
index 5ec92e3e2e37..843121465ddd 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -261,6 +261,8 @@ static inline void hv_apic_init(void) {}
 
 struct irq_domain *hv_create_pci_msi_domain(void);
 
+int hv_map_msi_interrupt(struct irq_data *data,
+			 struct hv_interrupt_entry *out_entry);
 int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
 		struct hv_interrupt_entry *entry);
 int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CD0D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OW5YDvS1bnMpcoEg7TkbfyRItoXlmLCY/FzGfytcf20=; b=YER6E/FrKZ63ACiOm8QK+fw2ga
	tF9u3pp3RE5pxmpOmXgTuGt4yI8sqha9J8fDkofX3ZdLidjuX16RJd2JKEQMH7esEORqxwESrzdHs
	pd30lhZ4eVw5NF2Ha25cHa53O3gv4uO01mGa1gbkLx4DdvGoyb+xDJyVIDFhPc0Lnxo2Mzz6SJrVd
	FrHwKg/LCTNXBsiT3/FUK/IzRoQ0f3mocGNwjEqTXfdHhHbU5AfR6WX0hYMoWHQTV6VF3aPlKp9+N
	9gjytTHru3oaU0h7WjA7J0TvF5hJHsbTc12PyoXp0BXc2ut7O2d7sqkUQzotzJtibXfpyM9d9TteE
	W4zOH4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Si-00000003HOF-2bLY;
	Tue, 20 Jan 2026 06:43:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sc-00000003HL5-3eoZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:32 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 61BB720B716B;
	Mon, 19 Jan 2026 22:43:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 61BB720B716B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891409;
	bh=OW5YDvS1bnMpcoEg7TkbfyRItoXlmLCY/FzGfytcf20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CtOkBlKD1snMCZLTU1RVXK4B70q0j/qdQdNToYjpfbrUk5q1CMAueGuNXVUUUNYGV
	 vyMLMpKqhA268xEuKMPv3jQvKewk211zA7VcqqqSDtn3PgISO8wPVMmPgV+GMAEjlu
	 0irIps+DTXZb3EICOgazglMYdg3TZSs3+MuikP7M=
From: Mukesh R <mrathor@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joro@8bytes.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	nunodasneves@linux.microsoft.com,
	mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: [PATCH v0 02/15] x86/hyperv: cosmetic changes in irqdomain.c for readability
Date: Mon, 19 Jan 2026 22:42:17 -0800
Message-ID: <20260120064230.3602565-3-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224330_972166_E481E1D8 
X-CRM114-Status: GOOD (  25.81  )
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

From: Mukesh Rathor <mrathor@linux.microsoft.com>

Make cosmetic changes:
 o Rename struct pci_dev *dev to *pdev since there are cases of
   struct device *dev in the file and all over the kernel
 o Rename hv_build_pci_dev_id to hv_build_devid_type_pci in anticipation
   of building different types of device ids
 o Fix checkpatch.pl issues with return and extraneous printk
 o Replace spaces with tabs
 o Rename struct hv_devid *xxx to struct hv_devid *hv_devid given code
   paths involve many types of device ids
 o Fix indentation in a large if block by using goto.

There are no functional changes.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 arch/x86/hyperv/irqdomain.c | 197 +++++++++++++++++++-----------------
 1 file changed, 103 insertions(+), 94 deletions(-)

diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
index c3ba12b1bc07..f6b61483b3b8 100644
--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
 /*
  * Irqdomain for Linux to run as the root partition on Microsoft Hypervisor.
  *
@@ -14,8 +13,8 @@
 #include <linux/irqchip/irq-msi-lib.h>
 #include <asm/mshyperv.h>
 
-static int hv_map_interrupt(union hv_device_id device_id, bool level,
-		int cpu, int vector, struct hv_interrupt_entry *entry)
+static int hv_map_interrupt(union hv_device_id hv_devid, bool level,
+		int cpu, int vector, struct hv_interrupt_entry *ret_entry)
 {
 	struct hv_input_map_device_interrupt *input;
 	struct hv_output_map_device_interrupt *output;
@@ -32,7 +31,7 @@ static int hv_map_interrupt(union hv_device_id device_id, bool level,
 	intr_desc = &input->interrupt_descriptor;
 	memset(input, 0, sizeof(*input));
 	input->partition_id = hv_current_partition_id;
-	input->device_id = device_id.as_uint64;
+	input->device_id = hv_devid.as_uint64;
 	intr_desc->interrupt_type = HV_X64_INTERRUPT_TYPE_FIXED;
 	intr_desc->vector_count = 1;
 	intr_desc->target.vector = vector;
@@ -44,7 +43,7 @@ static int hv_map_interrupt(union hv_device_id device_id, bool level,
 
 	intr_desc->target.vp_set.valid_bank_mask = 0;
 	intr_desc->target.vp_set.format = HV_GENERIC_SET_SPARSE_4K;
-	nr_bank = cpumask_to_vpset(&(intr_desc->target.vp_set), cpumask_of(cpu));
+	nr_bank = cpumask_to_vpset(&intr_desc->target.vp_set, cpumask_of(cpu));
 	if (nr_bank < 0) {
 		local_irq_restore(flags);
 		pr_err("%s: unable to generate VP set\n", __func__);
@@ -61,7 +60,7 @@ static int hv_map_interrupt(union hv_device_id device_id, bool level,
 
 	status = hv_do_rep_hypercall(HVCALL_MAP_DEVICE_INTERRUPT, 0, var_size,
 			input, output);
-	*entry = output->interrupt_entry;
+	*ret_entry = output->interrupt_entry;
 
 	local_irq_restore(flags);
 
@@ -71,21 +70,19 @@ static int hv_map_interrupt(union hv_device_id device_id, bool level,
 	return hv_result_to_errno(status);
 }
 
-static int hv_unmap_interrupt(u64 id, struct hv_interrupt_entry *old_entry)
+static int hv_unmap_interrupt(u64 id, struct hv_interrupt_entry *irq_entry)
 {
 	unsigned long flags;
 	struct hv_input_unmap_device_interrupt *input;
-	struct hv_interrupt_entry *intr_entry;
 	u64 status;
 
 	local_irq_save(flags);
 	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
 
 	memset(input, 0, sizeof(*input));
-	intr_entry = &input->interrupt_entry;
 	input->partition_id = hv_current_partition_id;
 	input->device_id = id;
-	*intr_entry = *old_entry;
+	input->interrupt_entry = *irq_entry;
 
 	status = hv_do_hypercall(HVCALL_UNMAP_DEVICE_INTERRUPT, input, NULL);
 	local_irq_restore(flags);
@@ -115,67 +112,71 @@ static int get_rid_cb(struct pci_dev *pdev, u16 alias, void *data)
 	return 0;
 }
 
-static union hv_device_id hv_build_pci_dev_id(struct pci_dev *dev)
+static union hv_device_id hv_build_devid_type_pci(struct pci_dev *pdev)
 {
-	union hv_device_id dev_id;
+	int pos;
+	union hv_device_id hv_devid;
 	struct rid_data data = {
 		.bridge = NULL,
-		.rid = PCI_DEVID(dev->bus->number, dev->devfn)
+		.rid = PCI_DEVID(pdev->bus->number, pdev->devfn)
 	};
 
-	pci_for_each_dma_alias(dev, get_rid_cb, &data);
+	pci_for_each_dma_alias(pdev, get_rid_cb, &data);
 
-	dev_id.as_uint64 = 0;
-	dev_id.device_type = HV_DEVICE_TYPE_PCI;
-	dev_id.pci.segment = pci_domain_nr(dev->bus);
+	hv_devid.as_uint64 = 0;
+	hv_devid.device_type = HV_DEVICE_TYPE_PCI;
+	hv_devid.pci.segment = pci_domain_nr(pdev->bus);
 
-	dev_id.pci.bdf.bus = PCI_BUS_NUM(data.rid);
-	dev_id.pci.bdf.device = PCI_SLOT(data.rid);
-	dev_id.pci.bdf.function = PCI_FUNC(data.rid);
-	dev_id.pci.source_shadow = HV_SOURCE_SHADOW_NONE;
+	hv_devid.pci.bdf.bus = PCI_BUS_NUM(data.rid);
+	hv_devid.pci.bdf.device = PCI_SLOT(data.rid);
+	hv_devid.pci.bdf.function = PCI_FUNC(data.rid);
+	hv_devid.pci.source_shadow = HV_SOURCE_SHADOW_NONE;
 
-	if (data.bridge) {
-		int pos;
+	if (data.bridge == NULL)
+		goto out;
 
-		/*
-		 * Microsoft Hypervisor requires a bus range when the bridge is
-		 * running in PCI-X mode.
-		 *
-		 * To distinguish conventional vs PCI-X bridge, we can check
-		 * the bridge's PCI-X Secondary Status Register, Secondary Bus
-		 * Mode and Frequency bits. See PCI Express to PCI/PCI-X Bridge
-		 * Specification Revision 1.0 5.2.2.1.3.
-		 *
-		 * Value zero means it is in conventional mode, otherwise it is
-		 * in PCI-X mode.
-		 */
+	/*
+	 * Microsoft Hypervisor requires a bus range when the bridge is
+	 * running in PCI-X mode.
+	 *
+	 * To distinguish conventional vs PCI-X bridge, we can check
+	 * the bridge's PCI-X Secondary Status Register, Secondary Bus
+	 * Mode and Frequency bits. See PCI Express to PCI/PCI-X Bridge
+	 * Specification Revision 1.0 5.2.2.1.3.
+	 *
+	 * Value zero means it is in conventional mode, otherwise it is
+	 * in PCI-X mode.
+	 */
 
-		pos = pci_find_capability(data.bridge, PCI_CAP_ID_PCIX);
-		if (pos) {
-			u16 status;
+	pos = pci_find_capability(data.bridge, PCI_CAP_ID_PCIX);
+	if (pos) {
+		u16 status;
 
-			pci_read_config_word(data.bridge, pos +
-					PCI_X_BRIDGE_SSTATUS, &status);
+		pci_read_config_word(data.bridge, pos + PCI_X_BRIDGE_SSTATUS,
+				     &status);
 
-			if (status & PCI_X_SSTATUS_FREQ) {
-				/* Non-zero, PCI-X mode */
-				u8 sec_bus, sub_bus;
+		if (status & PCI_X_SSTATUS_FREQ) {
+			/* Non-zero, PCI-X mode */
+			u8 sec_bus, sub_bus;
 
-				dev_id.pci.source_shadow = HV_SOURCE_SHADOW_BRIDGE_BUS_RANGE;
+			hv_devid.pci.source_shadow =
+					     HV_SOURCE_SHADOW_BRIDGE_BUS_RANGE;
 
-				pci_read_config_byte(data.bridge, PCI_SECONDARY_BUS, &sec_bus);
-				dev_id.pci.shadow_bus_range.secondary_bus = sec_bus;
-				pci_read_config_byte(data.bridge, PCI_SUBORDINATE_BUS, &sub_bus);
-				dev_id.pci.shadow_bus_range.subordinate_bus = sub_bus;
-			}
+			pci_read_config_byte(data.bridge, PCI_SECONDARY_BUS,
+					     &sec_bus);
+			hv_devid.pci.shadow_bus_range.secondary_bus = sec_bus;
+			pci_read_config_byte(data.bridge, PCI_SUBORDINATE_BUS,
+					     &sub_bus);
+			hv_devid.pci.shadow_bus_range.subordinate_bus = sub_bus;
 		}
 	}
 
-	return dev_id;
+out:
+	return hv_devid;
 }
 
-/**
- * hv_map_msi_interrupt() - "Map" the MSI IRQ in the hypervisor.
+/*
+ * hv_map_msi_interrupt() - Map the MSI IRQ in the hypervisor.
  * @data:      Describes the IRQ
  * @out_entry: Hypervisor (MSI) interrupt entry (can be NULL)
  *
@@ -188,22 +189,23 @@ int hv_map_msi_interrupt(struct irq_data *data,
 {
 	struct irq_cfg *cfg = irqd_cfg(data);
 	struct hv_interrupt_entry dummy;
-	union hv_device_id device_id;
+	union hv_device_id hv_devid;
 	struct msi_desc *msidesc;
-	struct pci_dev *dev;
+	struct pci_dev *pdev;
 	int cpu;
 
 	msidesc = irq_data_get_msi_desc(data);
-	dev = msi_desc_to_pci_dev(msidesc);
-	device_id = hv_build_pci_dev_id(dev);
+	pdev = msi_desc_to_pci_dev(msidesc);
+	hv_devid = hv_build_devid_type_pci(pdev);
 	cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
 
-	return hv_map_interrupt(device_id, false, cpu, cfg->vector,
+	return hv_map_interrupt(hv_devid, false, cpu, cfg->vector,
 				out_entry ? out_entry : &dummy);
 }
 EXPORT_SYMBOL_GPL(hv_map_msi_interrupt);
 
-static inline void entry_to_msi_msg(struct hv_interrupt_entry *entry, struct msi_msg *msg)
+static void entry_to_msi_msg(struct hv_interrupt_entry *entry,
+			     struct msi_msg *msg)
 {
 	/* High address is always 0 */
 	msg->address_hi = 0;
@@ -211,17 +213,19 @@ static inline void entry_to_msi_msg(struct hv_interrupt_entry *entry, struct msi
 	msg->data = entry->msi_entry.data.as_uint32;
 }
 
-static int hv_unmap_msi_interrupt(struct pci_dev *dev, struct hv_interrupt_entry *old_entry);
+static int hv_unmap_msi_interrupt(struct pci_dev *pdev,
+				  struct hv_interrupt_entry *irq_entry);
+
 static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	struct hv_interrupt_entry *stored_entry;
 	struct irq_cfg *cfg = irqd_cfg(data);
 	struct msi_desc *msidesc;
-	struct pci_dev *dev;
+	struct pci_dev *pdev;
 	int ret;
 
 	msidesc = irq_data_get_msi_desc(data);
-	dev = msi_desc_to_pci_dev(msidesc);
+	pdev = msi_desc_to_pci_dev(msidesc);
 
 	if (!cfg) {
 		pr_debug("%s: cfg is NULL", __func__);
@@ -240,7 +244,7 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 		stored_entry = data->chip_data;
 		data->chip_data = NULL;
 
-		ret = hv_unmap_msi_interrupt(dev, stored_entry);
+		ret = hv_unmap_msi_interrupt(pdev, stored_entry);
 
 		kfree(stored_entry);
 
@@ -249,10 +253,8 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	}
 
 	stored_entry = kzalloc(sizeof(*stored_entry), GFP_ATOMIC);
-	if (!stored_entry) {
-		pr_debug("%s: failed to allocate chip data\n", __func__);
+	if (!stored_entry)
 		return;
-	}
 
 	ret = hv_map_msi_interrupt(data, stored_entry);
 	if (ret) {
@@ -262,18 +264,21 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 
 	data->chip_data = stored_entry;
 	entry_to_msi_msg(data->chip_data, msg);
-
-	return;
 }
 
-static int hv_unmap_msi_interrupt(struct pci_dev *dev, struct hv_interrupt_entry *old_entry)
+static int hv_unmap_msi_interrupt(struct pci_dev *pdev,
+				  struct hv_interrupt_entry *irq_entry)
 {
-	return hv_unmap_interrupt(hv_build_pci_dev_id(dev).as_uint64, old_entry);
+	union hv_device_id hv_devid;
+
+	hv_devid = hv_build_devid_type_pci(pdev);
+	return hv_unmap_interrupt(hv_devid.as_uint64, irq_entry);
 }
 
-static void hv_teardown_msi_irq(struct pci_dev *dev, struct irq_data *irqd)
+/* NB: during map, hv_interrupt_entry is saved via data->chip_data */
+static void hv_teardown_msi_irq(struct pci_dev *pdev, struct irq_data *irqd)
 {
-	struct hv_interrupt_entry old_entry;
+	struct hv_interrupt_entry irq_entry;
 	struct msi_msg msg;
 
 	if (!irqd->chip_data) {
@@ -281,13 +286,13 @@ static void hv_teardown_msi_irq(struct pci_dev *dev, struct irq_data *irqd)
 		return;
 	}
 
-	old_entry = *(struct hv_interrupt_entry *)irqd->chip_data;
-	entry_to_msi_msg(&old_entry, &msg);
+	irq_entry = *(struct hv_interrupt_entry *)irqd->chip_data;
+	entry_to_msi_msg(&irq_entry, &msg);
 
 	kfree(irqd->chip_data);
 	irqd->chip_data = NULL;
 
-	(void)hv_unmap_msi_interrupt(dev, &old_entry);
+	(void)hv_unmap_msi_interrupt(pdev, &irq_entry);
 }
 
 /*
@@ -302,7 +307,8 @@ static struct irq_chip hv_pci_msi_controller = {
 };
 
 static bool hv_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
-				 struct irq_domain *real_parent, struct msi_domain_info *info)
+				 struct irq_domain *real_parent,
+				 struct msi_domain_info *info)
 {
 	struct irq_chip *chip = info->chip;
 
@@ -317,7 +323,8 @@ static bool hv_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 }
 
 #define HV_MSI_FLAGS_SUPPORTED	(MSI_GENERIC_FLAGS_MASK | MSI_FLAG_PCI_MSIX)
-#define HV_MSI_FLAGS_REQUIRED	(MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS)
+#define HV_MSI_FLAGS_REQUIRED	(MSI_FLAG_USE_DEF_DOM_OPS |	\
+				 MSI_FLAG_USE_DEF_CHIP_OPS)
 
 static struct msi_parent_ops hv_msi_parent_ops = {
 	.supported_flags	= HV_MSI_FLAGS_SUPPORTED,
@@ -329,14 +336,13 @@ static struct msi_parent_ops hv_msi_parent_ops = {
 	.init_dev_msi_info	= hv_init_dev_msi_info,
 };
 
-static int hv_msi_domain_alloc(struct irq_domain *d, unsigned int virq, unsigned int nr_irqs,
-			       void *arg)
+static int hv_msi_domain_alloc(struct irq_domain *d, unsigned int virq,
+			       unsigned int nr_irqs, void *arg)
 {
 	/*
-	 * TODO: The allocation bits of hv_irq_compose_msi_msg(), i.e. everything except
-	 * entry_to_msi_msg() should be in here.
+	 * TODO: The allocation bits of hv_irq_compose_msi_msg(), i.e.
+	 *	 everything except entry_to_msi_msg() should be in here.
 	 */
-
 	int ret;
 
 	ret = irq_domain_alloc_irqs_parent(d, virq, nr_irqs, arg);
@@ -344,13 +350,15 @@ static int hv_msi_domain_alloc(struct irq_domain *d, unsigned int virq, unsigned
 		return ret;
 
 	for (int i = 0; i < nr_irqs; ++i) {
-		irq_domain_set_info(d, virq + i, 0, &hv_pci_msi_controller, NULL,
-				    handle_edge_irq, NULL, "edge");
+		irq_domain_set_info(d, virq + i, 0, &hv_pci_msi_controller,
+				    NULL, handle_edge_irq, NULL, "edge");
 	}
+
 	return 0;
 }
 
-static void hv_msi_domain_free(struct irq_domain *d, unsigned int virq, unsigned int nr_irqs)
+static void hv_msi_domain_free(struct irq_domain *d, unsigned int virq,
+			       unsigned int nr_irqs)
 {
 	for (int i = 0; i < nr_irqs; ++i) {
 		struct irq_data *irqd = irq_domain_get_irq_data(d, virq);
@@ -362,6 +370,7 @@ static void hv_msi_domain_free(struct irq_domain *d, unsigned int virq, unsigned
 
 		hv_teardown_msi_irq(to_pci_dev(desc->dev), irqd);
 	}
+
 	irq_domain_free_irqs_top(d, virq, nr_irqs);
 }
 
@@ -394,25 +403,25 @@ struct irq_domain * __init hv_create_pci_msi_domain(void)
 
 int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry)
 {
-	union hv_device_id device_id;
+	union hv_device_id hv_devid;
 
-	device_id.as_uint64 = 0;
-	device_id.device_type = HV_DEVICE_TYPE_IOAPIC;
-	device_id.ioapic.ioapic_id = (u8)ioapic_id;
+	hv_devid.as_uint64 = 0;
+	hv_devid.device_type = HV_DEVICE_TYPE_IOAPIC;
+	hv_devid.ioapic.ioapic_id = (u8)ioapic_id;
 
-	return hv_unmap_interrupt(device_id.as_uint64, entry);
+	return hv_unmap_interrupt(hv_devid.as_uint64, entry);
 }
 EXPORT_SYMBOL_GPL(hv_unmap_ioapic_interrupt);
 
 int hv_map_ioapic_interrupt(int ioapic_id, bool level, int cpu, int vector,
 		struct hv_interrupt_entry *entry)
 {
-	union hv_device_id device_id;
+	union hv_device_id hv_devid;
 
-	device_id.as_uint64 = 0;
-	device_id.device_type = HV_DEVICE_TYPE_IOAPIC;
-	device_id.ioapic.ioapic_id = (u8)ioapic_id;
+	hv_devid.as_uint64 = 0;
+	hv_devid.device_type = HV_DEVICE_TYPE_IOAPIC;
+	hv_devid.ioapic.ioapic_id = (u8)ioapic_id;
 
-	return hv_map_interrupt(device_id, level, cpu, vector, entry);
+	return hv_map_interrupt(hv_devid, level, cpu, vector, entry);
 }
 EXPORT_SYMBOL_GPL(hv_map_ioapic_interrupt);
-- 
2.51.2.vfs.0.1



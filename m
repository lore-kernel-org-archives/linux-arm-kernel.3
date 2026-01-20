Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C37D2ECF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5zTidzD1l2EkEPlrmawzN2dIfFYQQCNH1hdqUaixrE=; b=PqXym6/lxF4sNua7+BvOO0P5hg
	ZKgxE6aNFqpkurbnR8qYmCFnJUuMbbIUB9R+8O75E8Q1aanA/LDeX2RLsQwuW/FYWwISU5FtLTnTv
	Y+yYMoqvugDbOwGc7YI7P3dYIU5Cpb7Do6Yrc5RPY2ggGLSQTL8/yvzPwqLLCTiyEzYUsmMXFeDNY
	Bm4sgHDr/oRCboMvk/cxqUKegqroQwnbfq6lqmRO97ELa3Nyk0rmCeBfHxUyvajeDve4bHredb3rH
	dRrwqwIdTv7uAMMettZLAuJVEyH6aFCJBk5xLxI3BpD8h2xHq7nncueG8UN8G+1EHHMYIzOpXH+bd
	1pSIw9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5TI-00000003HxY-1aPn;
	Tue, 20 Jan 2026 06:44:12 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ss-00000003HUO-0APq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:52 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id E60DA20B7175;
	Mon, 19 Jan 2026 22:43:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E60DA20B7175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891420;
	bh=e5zTidzD1l2EkEPlrmawzN2dIfFYQQCNH1hdqUaixrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UNMpFJkAxc0ipZ/uc95ODahk07NK6NWJyqWcGkaZVKyIZt1UDQiiBulzjGwCk91VX
	 jt0oLrxXe6iYTsRwRbf+EqSpgCO1gfUoGkAjX1AJ38Zyc7EB7vv0f3UcxIZZ6sNoFr
	 vdmcs3Bq/RId5HwNs85PYXjzf1VCUY/upizMZ+/c=
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
Subject: [PATCH v0 11/15] x86/hyperv: Build logical device ids for PCI passthru hcalls
Date: Mon, 19 Jan 2026 22:42:26 -0800
Message-ID: <20260120064230.3602565-12-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224346_203686_C0FC21C8 
X-CRM114-Status: GOOD (  17.05  )
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

On Hyper-V, most hypercalls related to PCI passthru to map/unmap regions,
interrupts, etc need a device id as a parameter. A device id refers
to a specific device. A device id is of two types:
   o Logical: used for direct attach (see below) hypercalls. A logical
              device id is a unique 62bit value that is created and
              sent during the initial device attach. Then all further
              communications (for interrupt remaps etc) must use this
              logical id.
   o PCI: used for device domain hypercalls such as map, unmap, etc.
          This is built using actual device BDF info.

   PS: Since an L1VH only supports direct attaches, a logical device id
       on an L1VH VM is always a VMBus device id. For non-L1VH cases,
       we just use PCI BDF info, altho not strictly needed, to build the
       logical device id.

At a high level, Hyper-V supports two ways to do PCI passthru:
  1. Device Domain: root must create a device domain in the hypervisor,
     and do map/unmap hypercalls for mapping and unmapping guest RAM.
     All hypervisor communications use device id of type PCI for
     identifying and referencing the device.

  2. Direct Attach: the hypervisor will simply use the guest's HW
     page table for mappings, thus the host need not do map/unmap
     hypercalls. A direct attached device must be referenced
     via logical device id and never via the PCI device id. For an
     L1VH root/parent, Hyper-V only supports direct attaches.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 arch/x86/hyperv/irqdomain.c     | 60 ++++++++++++++++++++++++++++++---
 arch/x86/include/asm/mshyperv.h | 14 ++++++++
 2 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
index ccbe5848a28f..33017aa0caa4 100644
--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -137,7 +137,7 @@ static int get_rid_cb(struct pci_dev *pdev, u16 alias, void *data)
 	return 0;
 }
 
-static union hv_device_id hv_build_devid_type_pci(struct pci_dev *pdev)
+static u64 hv_build_devid_type_pci(struct pci_dev *pdev)
 {
 	int pos;
 	union hv_device_id hv_devid;
@@ -197,7 +197,58 @@ static union hv_device_id hv_build_devid_type_pci(struct pci_dev *pdev)
 	}
 
 out:
-	return hv_devid;
+	return hv_devid.as_uint64;
+}
+
+/* Build device id for direct attached devices */
+static u64 hv_build_devid_type_logical(struct pci_dev *pdev)
+{
+	hv_pci_segment segment;
+	union hv_device_id hv_devid;
+	union hv_pci_bdf bdf = {.as_uint16 = 0};
+	struct rid_data data = {
+		.bridge = NULL,
+		.rid = PCI_DEVID(pdev->bus->number, pdev->devfn)
+	};
+
+	segment = pci_domain_nr(pdev->bus);
+	bdf.bus = PCI_BUS_NUM(data.rid);
+	bdf.device = PCI_SLOT(data.rid);
+	bdf.function = PCI_FUNC(data.rid);
+
+	hv_devid.as_uint64 = 0;
+	hv_devid.device_type = HV_DEVICE_TYPE_LOGICAL;
+	hv_devid.logical.id = (u64)segment << 16 | bdf.as_uint16;
+
+	return hv_devid.as_uint64;
+}
+
+/* Build device id after the device has been attached */
+u64 hv_build_devid_oftype(struct pci_dev *pdev, enum hv_device_type type)
+{
+	if (type == HV_DEVICE_TYPE_LOGICAL) {
+		if (hv_l1vh_partition())
+			return hv_pci_vmbus_device_id(pdev);
+		else
+			return hv_build_devid_type_logical(pdev);
+	} else if (type == HV_DEVICE_TYPE_PCI)
+		return hv_build_devid_type_pci(pdev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hv_build_devid_oftype);
+
+/* Build device id for the interrupt path */
+static u64 hv_build_irq_devid(struct pci_dev *pdev)
+{
+	enum hv_device_type dev_type;
+
+	if (hv_pcidev_is_attached_dev(pdev) || hv_l1vh_partition())
+		dev_type = HV_DEVICE_TYPE_LOGICAL;
+	else
+		dev_type = HV_DEVICE_TYPE_PCI;
+
+	return hv_build_devid_oftype(pdev, dev_type);
 }
 
 /*
@@ -221,7 +272,7 @@ int hv_map_msi_interrupt(struct irq_data *data,
 
 	msidesc = irq_data_get_msi_desc(data);
 	pdev = msi_desc_to_pci_dev(msidesc);
-	hv_devid = hv_build_devid_type_pci(pdev);
+	hv_devid.as_uint64 = hv_build_irq_devid(pdev);
 	cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
 
 	return hv_map_interrupt(hv_current_partition_id, hv_devid, false, cpu,
@@ -296,7 +347,8 @@ static int hv_unmap_msi_interrupt(struct pci_dev *pdev,
 {
 	union hv_device_id hv_devid;
 
-	hv_devid = hv_build_devid_type_pci(pdev);
+	hv_devid.as_uint64 = hv_build_irq_devid(pdev);
+
 	return hv_unmap_interrupt(hv_devid.as_uint64, irq_entry);
 }
 
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 0d7fdfb25e76..97477c5a8487 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -188,6 +188,20 @@ bool hv_vcpu_is_preempted(int vcpu);
 static inline void hv_apic_init(void) {}
 #endif
 
+#if IS_ENABLED(CONFIG_HYPERV_IOMMU)
+static inline bool hv_pcidev_is_attached_dev(struct pci_dev *pdev)
+{ return false; }       /* temporary */
+u64 hv_build_devid_oftype(struct pci_dev *pdev, enum hv_device_type type);
+#else	/* CONFIG_HYPERV_IOMMU */
+static inline bool hv_pcidev_is_attached_dev(struct pci_dev *pdev)
+{ return false; }
+
+static inline u64 hv_build_devid_oftype(struct pci_dev *pdev,
+				       enum hv_device_type type)
+{ return 0; }
+
+#endif	/* CONFIG_HYPERV_IOMMU */
+
 u64 hv_pci_vmbus_device_id(struct pci_dev *pdev);
 
 struct irq_domain *hv_create_pci_msi_domain(void);
-- 
2.51.2.vfs.0.1



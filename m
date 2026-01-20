Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972A2D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqmyheb8rD2njJBWwC6GothbZYR9ohwQrRX05s9s+ww=; b=FPj4IKg7l6CAaZ3C227yETbV5E
	s/6ZCVb4P/G5nLsQ7XcwD3yyIFac/Mnm9iI9vsRQwhY0G2y3L4nO3u33lCG2/ZcM88ae5JrcD0hna
	u/UitZspxReIJQoI/c6FN2Javzs0YciSGMqYfcNyh6a0Rst4UbOLPBqAZC1SN2vonTtrxEph18/EG
	9haWaZilWzmVTGRfdptF5ZG7WJ0pFnywhJG0YS7pOjnezMzzBTqeX78cftXyLV+gM/BdoY/80kb2F
	oIDIqF/wzCJhdbgEK1oAR0F/4OJ/U8k8uo4FLkD1XFLAirmkePPMS6/LiXTHo2GXbE6BeXRAPFv88
	5FMJQEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sy-00000003HbQ-0d1H;
	Tue, 20 Jan 2026 06:43:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sk-00000003HQK-2mCk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:39 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9907E20B7172;
	Mon, 19 Jan 2026 22:43:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9907E20B7172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891418;
	bh=wqmyheb8rD2njJBWwC6GothbZYR9ohwQrRX05s9s+ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdo0t0832V1O+P0nkREY95p7rRr4BZA+JyroNqivGh/7D1MngHH8XQJkpu98A9Foh
	 sOdWA6RVvsvFJst/F2Qz5wNtwXWijEPiDguG0XLtCIE+iAJVeRyD8L9S35pRYClIAm
	 ZSYLlmlmQgZZ6k9YxVuH6tdQjnmLOKCDy/BVySGU=
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
Subject: [PATCH v0 09/15] mshv: Import data structs around device domains and irq remapping
Date: Mon, 19 Jan 2026 22:42:24 -0800
Message-ID: <20260120064230.3602565-10-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224338_737727_E0FBE080 
X-CRM114-Status: GOOD (  11.56  )
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

Import/copy from Hyper-V public headers, definitions and declarations that
are related to attaching and detaching of device domains and interrupt
remapping, and building device ids for those purposes.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 include/hyperv/hvgdk_mini.h |  11 ++++
 include/hyperv/hvhdk_mini.h | 112 ++++++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/include/hyperv/hvgdk_mini.h b/include/hyperv/hvgdk_mini.h
index 04b18d0e37af..bda9fae5b1ef 100644
--- a/include/hyperv/hvgdk_mini.h
+++ b/include/hyperv/hvgdk_mini.h
@@ -323,6 +323,9 @@ union hv_hypervisor_version_info {
 /* stimer Direct Mode is available */
 #define HV_STIMER_DIRECT_MODE_AVAILABLE			BIT(19)
 
+#define HV_DEVICE_DOMAIN_AVAILABLE			BIT(24)
+#define HV_S1_DEVICE_DOMAIN_AVAILABLE			BIT(25)
+
 /*
  * Implementation recommendations. Indicates which behaviors the hypervisor
  * recommends the OS implement for optimal performance.
@@ -471,6 +474,8 @@ union hv_vp_assist_msr_contents {	 /* HV_REGISTER_VP_ASSIST_PAGE */
 #define HVCALL_MAP_DEVICE_INTERRUPT			0x007c
 #define HVCALL_UNMAP_DEVICE_INTERRUPT			0x007d
 #define HVCALL_RETARGET_INTERRUPT			0x007e
+#define HVCALL_ATTACH_DEVICE                            0x0082
+#define HVCALL_DETACH_DEVICE                            0x0083
 #define HVCALL_NOTIFY_PARTITION_EVENT                   0x0087
 #define HVCALL_ENTER_SLEEP_STATE			0x0084
 #define HVCALL_NOTIFY_PORT_RING_EMPTY			0x008b
@@ -482,9 +487,15 @@ union hv_vp_assist_msr_contents {	 /* HV_REGISTER_VP_ASSIST_PAGE */
 #define HVCALL_GET_VP_INDEX_FROM_APIC_ID		0x009a
 #define HVCALL_FLUSH_GUEST_PHYSICAL_ADDRESS_SPACE	0x00af
 #define HVCALL_FLUSH_GUEST_PHYSICAL_ADDRESS_LIST	0x00b0
+#define HVCALL_CREATE_DEVICE_DOMAIN                     0x00b1
+#define HVCALL_ATTACH_DEVICE_DOMAIN                     0x00b2
+#define HVCALL_MAP_DEVICE_GPA_PAGES                     0x00b3
+#define HVCALL_UNMAP_DEVICE_GPA_PAGES                   0x00b4
 #define HVCALL_SIGNAL_EVENT_DIRECT			0x00c0
 #define HVCALL_POST_MESSAGE_DIRECT			0x00c1
 #define HVCALL_DISPATCH_VP				0x00c2
+#define HVCALL_DETACH_DEVICE_DOMAIN                     0x00c4
+#define HVCALL_DELETE_DEVICE_DOMAIN                     0x00c5
 #define HVCALL_GET_GPA_PAGES_ACCESS_STATES		0x00c9
 #define HVCALL_ACQUIRE_SPARSE_SPA_PAGE_HOST_ACCESS	0x00d7
 #define HVCALL_RELEASE_SPARSE_SPA_PAGE_HOST_ACCESS	0x00d8
diff --git a/include/hyperv/hvhdk_mini.h b/include/hyperv/hvhdk_mini.h
index 41a29bf8ec14..57821d6ddb61 100644
--- a/include/hyperv/hvhdk_mini.h
+++ b/include/hyperv/hvhdk_mini.h
@@ -449,6 +449,32 @@ struct hv_send_ipi_ex { /* HV_INPUT_SEND_SYNTHETIC_CLUSTER_IPI_EX */
 	struct hv_vpset vp_set;
 } __packed;
 
+union hv_attdev_flags {		/* HV_ATTACH_DEVICE_FLAGS */
+	struct {
+		u32 logical_id : 1;
+		u32 resvd0 : 1;
+		u32 ats_enabled : 1;
+		u32 virt_func : 1;
+		u32 shared_irq_child : 1;
+		u32 virt_dev : 1;
+		u32 ats_supported : 1;
+		u32 small_irt : 1;
+		u32 resvd : 24;
+	} __packed;
+	u32 as_uint32;
+};
+
+union hv_dev_pci_caps {		/* HV_DEVICE_PCI_CAPABILITIES */
+	struct {
+		u32 max_pasid_width : 5;
+		u32 invalidate_qdepth : 5;
+		u32 global_inval : 1;
+		u32 prg_response_req : 1;
+		u32 resvd : 20;
+	} __packed;
+	u32 as_uint32;
+};
+
 typedef u16 hv_pci_rid;		/* HV_PCI_RID */
 typedef u16 hv_pci_segment;	/* HV_PCI_SEGMENT */
 typedef u64 hv_logical_device_id;
@@ -528,4 +554,90 @@ union hv_device_id {		/* HV_DEVICE_ID */
 	} acpi;
 } __packed;
 
+struct hv_input_attach_device {         /* HV_INPUT_ATTACH_DEVICE */
+	u64 partition_id;
+	union hv_device_id device_id;
+	union hv_attdev_flags attdev_flags;
+	u8  attdev_vtl;
+	u8  rsvd0;
+	u16 rsvd1;
+	u64 logical_devid;
+	union hv_dev_pci_caps dev_pcicaps;
+	u16 pf_pci_rid;
+	u16 resvd2;
+} __packed;
+
+struct hv_input_detach_device {		/* HV_INPUT_DETACH_DEVICE */
+	u64 partition_id;
+	u64 logical_devid;
+} __packed;
+
+
+/* 3 domain types: stage 1, stage 2, and SOC */
+#define HV_DEVICE_DOMAIN_TYPE_S2  0 /* HV_DEVICE_DOMAIN_ID_TYPE_S2 */
+#define HV_DEVICE_DOMAIN_TYPE_S1  1 /* HV_DEVICE_DOMAIN_ID_TYPE_S1 */
+#define HV_DEVICE_DOMAIN_TYPE_SOC 2 /* HV_DEVICE_DOMAIN_ID_TYPE_SOC */
+
+/* ID for stage 2 default domain and NULL domain */
+#define HV_DEVICE_DOMAIN_ID_S2_DEFAULT 0
+#define HV_DEVICE_DOMAIN_ID_S2_NULL    0xFFFFFFFFULL
+
+union hv_device_domain_id {
+	u64 as_uint64;
+	struct {
+		u32 type : 4;
+		u32 reserved : 28;
+		u32 id;
+	};
+} __packed;
+
+struct hv_input_device_domain { /* HV_INPUT_DEVICE_DOMAIN */
+	u64 partition_id;
+	union hv_input_vtl owner_vtl;
+	u8 padding[7];
+	union hv_device_domain_id domain_id;
+} __packed;
+
+union hv_create_device_domain_flags {	/* HV_CREATE_DEVICE_DOMAIN_FLAGS */
+	u32 as_uint32;
+	struct {
+		u32 forward_progress_required : 1;
+		u32 inherit_owning_vtl : 1;
+		u32 reserved : 30;
+	} __packed;
+} __packed;
+
+struct hv_input_create_device_domain {	/* HV_INPUT_CREATE_DEVICE_DOMAIN */
+	struct hv_input_device_domain device_domain;
+	union hv_create_device_domain_flags create_device_domain_flags;
+} __packed;
+
+struct hv_input_delete_device_domain {	/* HV_INPUT_DELETE_DEVICE_DOMAIN */
+	struct hv_input_device_domain device_domain;
+} __packed;
+
+struct hv_input_attach_device_domain {	/* HV_INPUT_ATTACH_DEVICE_DOMAIN */
+	struct hv_input_device_domain device_domain;
+	union hv_device_id device_id;
+} __packed;
+
+struct hv_input_detach_device_domain {	/* HV_INPUT_DETACH_DEVICE_DOMAIN */
+	u64 partition_id;
+	union hv_device_id device_id;
+} __packed;
+
+struct hv_input_map_device_gpa_pages {	/* HV_INPUT_MAP_DEVICE_GPA_PAGES */
+	struct hv_input_device_domain device_domain;
+	union hv_input_vtl target_vtl;
+	u8 padding[3];
+	u32 map_flags;
+	u64 target_device_va_base;
+	u64 gpa_page_list[];
+} __packed;
+
+struct hv_input_unmap_device_gpa_pages {  /* HV_INPUT_UNMAP_DEVICE_GPA_PAGES */
+	struct hv_input_device_domain device_domain;
+	u64 target_device_va_base;
+} __packed;
+
 #endif /* _HV_HVHDK_MINI_H */
-- 
2.51.2.vfs.0.1



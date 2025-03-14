Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DBAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg8QzT0gYO9ulLt5P+kHC5Rffwmr7DIIcXzpfblm82s=; b=h9YmiCFHCDUQX8ntetMXDOGvWn
	/D0WQBD71DsCMRA9S01WzMfe07wIZyZrDvOZVSe0KhXv5l0K9i+LNSifdJWzasDrhZuDe6BTik9tB
	T2trupQQgYVf00CR46tu6tylOg6jzGM1jSh78W45TJXkpiIKLJki/z3x9dUCVHIy1GHSaaawwMk1v
	QKc7QUWSUjF1i4ol/mijW5euaQAlYkvpeGgqDOKHwwU5Xy6+Y5x1mbaWzUGcDYen8/4rHzzfNUcLQ
	rgdKTyX+6jmqPdTjwsYy5lmbeM8/RirV/7GUfoDAN1KiDRF9CjSVsvFxd7WZHaEnREmXxfKFm8iYV
	/APYXfMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAkQ-0000000F7a9-1ZWQ;
	Fri, 14 Mar 2025 19:31:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAij-0000000F747-0HHy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:29:26 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0DDA22033455;
	Fri, 14 Mar 2025 12:29:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0DDA22033455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980564;
	bh=Rg8QzT0gYO9ulLt5P+kHC5Rffwmr7DIIcXzpfblm82s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Spvkn1HI8y97mzQU7blE6mpC0TN0J/iDXb0TWEIbaVGX45hg/0mPQkeZGu2d0GTpZ
	 u2RqZvyTT+wp7n0KeG0rmZw7mXdcvitXniQ45DqyPRM9lGS0FRNTJlXncL5z+EPFkD
	 qDIGj3P5DNt28Y5+HufZ5h2hProyYapv1sc2EfhQ=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com,
	ltykernel@gmail.com,
	stanislav.kinsburskiy@gmail.com,
	linux-acpi@vger.kernel.org,
	eahariha@linux.microsoft.com,
	jeff.johnson@oss.qualcomm.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v6 01/10] hyperv: Log hypercall status codes as strings
Date: Fri, 14 Mar 2025 12:28:47 -0700
Message-Id: <1741980536-3865-2-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122925_155570_C4FE5477 
X-CRM114-Status: GOOD (  20.40  )
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

Introduce hv_status_printk() macros as a convenience to log hypercall
errors, formatting them with the status code (HV_STATUS_*) as a raw hex
value and also as a string, which saves some time while debugging.

Create a table of HV_STATUS_ codes with strings and mapped errnos, and
use it for hv_result_to_string() and hv_result_to_errno().

Use the new hv_status_printk()s in hv_proc.c, hyperv-iommu.c, and
irqdomain.c hypercalls to aid debugging in the root partition.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
---
 arch/x86/hyperv/irqdomain.c    |   6 +-
 drivers/hv/hv_common.c         | 129 ++++++++++++++++++++++++---------
 drivers/hv/hv_proc.c           |  10 +--
 drivers/iommu/hyperv-iommu.c   |   4 +-
 include/asm-generic/mshyperv.h |  13 ++++
 5 files changed, 118 insertions(+), 44 deletions(-)

diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
index 64b921360b0f..31f0d29cbc5e 100644
--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -64,7 +64,7 @@ static int hv_map_interrupt(union hv_device_id device_id, bool level,
 	local_irq_restore(flags);
 
 	if (!hv_result_success(status))
-		pr_err("%s: hypercall failed, status %lld\n", __func__, status);
+		hv_status_err(status, "\n");
 
 	return hv_result(status);
 }
@@ -224,7 +224,7 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 		kfree(stored_entry);
 
 		if (status != HV_STATUS_SUCCESS) {
-			pr_debug("%s: failed to unmap, status %lld", __func__, status);
+			hv_status_debug(status, "failed to unmap\n");
 			return;
 		}
 	}
@@ -273,7 +273,7 @@ static void hv_teardown_msi_irq(struct pci_dev *dev, struct irq_data *irqd)
 	status = hv_unmap_msi_interrupt(dev, &old_entry);
 
 	if (status != HV_STATUS_SUCCESS)
-		pr_err("%s: hypercall failed, status %lld\n", __func__, status);
+		hv_status_err(status, "\n");
 }
 
 static void hv_msi_free_irq(struct irq_domain *domain,
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 9804adb4cc56..885bbc3d86d8 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -684,40 +684,6 @@ u64 __weak hv_tdx_hypercall(u64 control, u64 param1, u64 param2)
 }
 EXPORT_SYMBOL_GPL(hv_tdx_hypercall);
 
-/* Convert a hypercall result into a linux-friendly error code. */
-int hv_result_to_errno(u64 status)
-{
-	/* hv_do_hypercall() may return U64_MAX, hypercalls aren't possible */
-	if (unlikely(status == U64_MAX))
-		return -EOPNOTSUPP;
-	/*
-	 * A failed hypercall is usually only recoverable (or loggable) near
-	 * the call site where the HV_STATUS_* code is known. So the errno
-	 * it gets converted to is not too useful further up the stack.
-	 * Provide a few mappings that could be useful, and revert to -EIO
-	 * as a fallback.
-	 */
-	switch (hv_result(status)) {
-	case HV_STATUS_SUCCESS:
-		return 0;
-	case HV_STATUS_INVALID_HYPERCALL_CODE:
-	case HV_STATUS_INVALID_HYPERCALL_INPUT:
-	case HV_STATUS_INVALID_PARAMETER:
-	case HV_STATUS_INVALID_PARTITION_ID:
-	case HV_STATUS_INVALID_VP_INDEX:
-	case HV_STATUS_INVALID_PORT_ID:
-	case HV_STATUS_INVALID_CONNECTION_ID:
-	case HV_STATUS_INVALID_LP_INDEX:
-	case HV_STATUS_INVALID_REGISTER_VALUE:
-		return -EINVAL;
-	case HV_STATUS_INSUFFICIENT_MEMORY:
-		return -ENOMEM;
-	default:
-		break;
-	}
-	return -EIO;
-}
-
 void hv_identify_partition_type(void)
 {
 	/* Assume guest role */
@@ -740,3 +706,98 @@ void hv_identify_partition_type(void)
 			pr_crit("Hyper-V: CONFIG_MSHV_ROOT not enabled!\n");
 	}
 }
+
+struct hv_status_info {
+	char *string;
+	int errno;
+	u16 code;
+};
+
+/*
+ * Note on the errno mappings:
+ * A failed hypercall is usually only recoverable (or loggable) near
+ * the call site where the HV_STATUS_* code is known. So the errno
+ * it gets converted to is not too useful further up the stack.
+ * Provide a few mappings that could be useful, and revert to -EIO
+ * as a fallback.
+ */
+static const struct hv_status_info hv_status_infos[] = {
+#define _STATUS_INFO(status, errno) { #status, (errno), (status) }
+	_STATUS_INFO(HV_STATUS_SUCCESS,				0),
+	_STATUS_INFO(HV_STATUS_INVALID_HYPERCALL_CODE,		-EINVAL),
+	_STATUS_INFO(HV_STATUS_INVALID_HYPERCALL_INPUT,		-EINVAL),
+	_STATUS_INFO(HV_STATUS_INVALID_ALIGNMENT,		-EIO),
+	_STATUS_INFO(HV_STATUS_INVALID_PARAMETER,		-EINVAL),
+	_STATUS_INFO(HV_STATUS_ACCESS_DENIED,			-EIO),
+	_STATUS_INFO(HV_STATUS_INVALID_PARTITION_STATE,		-EIO),
+	_STATUS_INFO(HV_STATUS_OPERATION_DENIED,		-EIO),
+	_STATUS_INFO(HV_STATUS_UNKNOWN_PROPERTY,		-EIO),
+	_STATUS_INFO(HV_STATUS_PROPERTY_VALUE_OUT_OF_RANGE,	-EIO),
+	_STATUS_INFO(HV_STATUS_INSUFFICIENT_MEMORY,		-ENOMEM),
+	_STATUS_INFO(HV_STATUS_INVALID_PARTITION_ID,		-EINVAL),
+	_STATUS_INFO(HV_STATUS_INVALID_VP_INDEX,		-EINVAL),
+	_STATUS_INFO(HV_STATUS_NOT_FOUND,			-EIO),
+	_STATUS_INFO(HV_STATUS_INVALID_PORT_ID,			-EINVAL),
+	_STATUS_INFO(HV_STATUS_INVALID_CONNECTION_ID,		-EINVAL),
+	_STATUS_INFO(HV_STATUS_INSUFFICIENT_BUFFERS,		-EIO),
+	_STATUS_INFO(HV_STATUS_NOT_ACKNOWLEDGED,		-EIO),
+	_STATUS_INFO(HV_STATUS_INVALID_VP_STATE,		-EIO),
+	_STATUS_INFO(HV_STATUS_NO_RESOURCES,			-EIO),
+	_STATUS_INFO(HV_STATUS_PROCESSOR_FEATURE_NOT_SUPPORTED,	-EIO),
+	_STATUS_INFO(HV_STATUS_INVALID_LP_INDEX,		-EINVAL),
+	_STATUS_INFO(HV_STATUS_INVALID_REGISTER_VALUE,		-EINVAL),
+	_STATUS_INFO(HV_STATUS_INVALID_LP_INDEX,		-EIO),
+	_STATUS_INFO(HV_STATUS_INVALID_REGISTER_VALUE,		-EIO),
+	_STATUS_INFO(HV_STATUS_OPERATION_FAILED,		-EIO),
+	_STATUS_INFO(HV_STATUS_TIME_OUT,			-EIO),
+	_STATUS_INFO(HV_STATUS_CALL_PENDING,			-EIO),
+	_STATUS_INFO(HV_STATUS_VTL_ALREADY_ENABLED,		-EIO),
+#undef _STATUS_INFO
+};
+
+static inline const struct hv_status_info *find_hv_status_info(u64 hv_status)
+{
+	int i;
+	u16 code = hv_result(hv_status);
+
+	for (i = 0; i < ARRAY_SIZE(hv_status_infos); ++i) {
+		const struct hv_status_info *info = &hv_status_infos[i];
+
+		if (info->code == code)
+			return info;
+	}
+
+	return NULL;
+}
+
+/* Convert a hypercall result into a linux-friendly error code. */
+int hv_result_to_errno(u64 status)
+{
+	const struct hv_status_info *info;
+
+	/* hv_do_hypercall() may return U64_MAX, hypercalls aren't possible */
+	if (unlikely(status == U64_MAX))
+		return -EOPNOTSUPP;
+
+	info = find_hv_status_info(status);
+	if (info)
+		return info->errno;
+
+	return -EIO;
+}
+EXPORT_SYMBOL_GPL(hv_result_to_errno);
+
+const char *hv_result_to_string(u64 status)
+{
+	const struct hv_status_info *info;
+
+	if (unlikely(status == U64_MAX))
+		return "Hypercall page missing!";
+
+	info = find_hv_status_info(status);
+	if (info)
+		return info->string;
+
+	return "Unknown";
+}
+EXPORT_SYMBOL_GPL(hv_result_to_string);
diff --git a/drivers/hv/hv_proc.c b/drivers/hv/hv_proc.c
index 2fae18e4f7d2..605999f10e17 100644
--- a/drivers/hv/hv_proc.c
+++ b/drivers/hv/hv_proc.c
@@ -87,7 +87,7 @@ int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
 				     page_count, 0, input_page, NULL);
 	local_irq_restore(flags);
 	if (!hv_result_success(status)) {
-		pr_err("Failed to deposit pages: %lld\n", status);
+		hv_status_err(status, "\n");
 		ret = hv_result_to_errno(status);
 		goto err_free_allocations;
 	}
@@ -137,8 +137,8 @@ int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
 
 		if (hv_result(status) != HV_STATUS_INSUFFICIENT_MEMORY) {
 			if (!hv_result_success(status)) {
-				pr_err("%s: cpu %u apic ID %u, %lld\n", __func__,
-				       lp_index, apic_id, status);
+				hv_status_err(status, "cpu %u apic ID: %u\n",
+					      lp_index, apic_id);
 				ret = hv_result_to_errno(status);
 			}
 			break;
@@ -179,8 +179,8 @@ int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
 
 		if (hv_result(status) != HV_STATUS_INSUFFICIENT_MEMORY) {
 			if (!hv_result_success(status)) {
-				pr_err("%s: vcpu %u, lp %u, %lld\n", __func__,
-				       vp_index, flags, status);
+				hv_status_err(status, "vcpu: %u, lp: %u\n",
+					      vp_index, flags);
 				ret = hv_result_to_errno(status);
 			}
 			break;
diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
index 53e4b37716af..761ab647f372 100644
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-iommu.c
@@ -217,7 +217,7 @@ hyperv_root_ir_compose_msi_msg(struct irq_data *irq_data, struct msi_msg *msg)
 		status = hv_unmap_ioapic_interrupt(ioapic_id, &entry);
 
 		if (status != HV_STATUS_SUCCESS)
-			pr_debug("%s: unexpected unmap status %lld\n", __func__, status);
+			hv_status_debug(status, "failed to unmap\n");
 
 		data->entry.ioapic_rte.as_uint64 = 0;
 		data->entry.source = 0; /* Invalid source */
@@ -228,7 +228,7 @@ hyperv_root_ir_compose_msi_msg(struct irq_data *irq_data, struct msi_msg *msg)
 					vector, &entry);
 
 	if (status != HV_STATUS_SUCCESS) {
-		pr_err("%s: map hypercall failed, status %lld\n", __func__, status);
+		hv_status_err(status, "map failed\n");
 		return;
 	}
 
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index b13b0cda4ac8..250c65236919 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -298,6 +298,19 @@ static inline int cpumask_to_vpset_skip(struct hv_vpset *vpset,
 	return __cpumask_to_vpset(vpset, cpus, func);
 }
 
+#define _hv_status_fmt(fmt) "%s: Hyper-V status: %#x = %s: " fmt
+#define hv_status_printk(level, status, fmt, ...) \
+do { \
+	u64 __status = (status); \
+	pr_##level(_hv_status_fmt(fmt), __func__, hv_result(__status), \
+		   hv_result_to_string(__status), ##__VA_ARGS__); \
+} while (0)
+#define hv_status_err(status, fmt, ...) \
+	hv_status_printk(err, status, fmt, ##__VA_ARGS__)
+#define hv_status_debug(status, fmt, ...) \
+	hv_status_printk(debug, status, fmt, ##__VA_ARGS__)
+
+const char *hv_result_to_string(u64 hv_status);
 int hv_result_to_errno(u64 status);
 void hyperv_report_panic(struct pt_regs *regs, long err, bool in_die);
 bool hv_is_hyperv_initialized(void);
-- 
2.34.1



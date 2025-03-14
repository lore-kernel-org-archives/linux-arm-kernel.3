Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ECBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDrv/uiFf6I/CBc/jkbxtnGgzXTM90PbsfJSUc1CXPk=; b=ylp4l5XmGQaHHS6lo/sloKQeGL
	p/FWIpcXQshGJUmT7vj8Qnu39GVeVwm6WPXRdOui72tf2dWnqs6hlsEb6VRXZFQSfuuO9C5GH7o9X
	Yzxjh2aFO48PG/07TikhhbPhds1dq6x8tsC0hCBE3WFglHeqQVapGp9foMtX4gZlDuTMyXeH1upvX
	mWB+YnxQJLis+5Fv11acBgGHqokYUWywAWqHNbkPLS7Ppxh4dsEGmJ49j9/I4EnqimU+c7U/ifD5f
	EasqBBuqyAKFCpPFSYNxsyWkenXqjCoaihm4zBT9p2aMP9zWnnaU/3W0Hcq5tbx48j5N5L0fgIwIS
	gH6uFWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAvv-0000000F99d-13Ug;
	Fri, 14 Mar 2025 19:43:03 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAil-0000000F75o-0TPM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:29:28 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id D29982038A52;
	Fri, 14 Mar 2025 12:29:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D29982038A52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980564;
	bh=oDrv/uiFf6I/CBc/jkbxtnGgzXTM90PbsfJSUc1CXPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSqgRN2eSFL9v1ZQFtA0kI8kpOs8wA979X32O4UUnS5mMT/uW0RWZocOW8laLG7P0
	 x/M05Uy7BtaWIvlNN0C91FhL/jQ/4C3EWFQoTH7yI3r6pIruBlcldN7eQqu4PVQQXa
	 DCo9oCJycJG9dspA4lgqMWph7gXjWmnIFLV6BEMk=
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
Subject: [PATCH v6 07/10] Drivers: hv: Introduce per-cpu event ring tail
Date: Fri, 14 Mar 2025 12:28:53 -0700
Message-Id: <1741980536-3865-8-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122927_197450_4D8D0F85 
X-CRM114-Status: GOOD (  18.37  )
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

Add a pointer hv_synic_eventring_tail to track the tail pointer for the
SynIC event ring buffer for each SINT.

This will be used by the mshv driver, but must be tracked independently
since the driver module could be removed and re-inserted.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Wei Liu <wei.liu@kernel.org>
Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
---
 drivers/hv/hv_common.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 885bbc3d86d8..3cd9b96ffc67 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -68,6 +68,16 @@ static void hv_kmsg_dump_unregister(void);
 
 static struct ctl_table_header *hv_ctl_table_hdr;
 
+/*
+ * Per-cpu array holding the tail pointer for the SynIC event ring buffer
+ * for each SINT.
+ *
+ * We cannot maintain this in mshv driver because the tail pointer should
+ * persist even if the mshv driver is unloaded.
+ */
+u8 * __percpu *hv_synic_eventring_tail;
+EXPORT_SYMBOL_GPL(hv_synic_eventring_tail);
+
 /*
  * Hyper-V specific initialization and shutdown code that is
  * common across all architectures.  Called from architecture
@@ -90,6 +100,9 @@ void __init hv_common_free(void)
 
 	free_percpu(hyperv_pcpu_input_arg);
 	hyperv_pcpu_input_arg = NULL;
+
+	free_percpu(hv_synic_eventring_tail);
+	hv_synic_eventring_tail = NULL;
 }
 
 /*
@@ -372,6 +385,11 @@ int __init hv_common_init(void)
 		BUG_ON(!hyperv_pcpu_output_arg);
 	}
 
+	if (hv_root_partition()) {
+		hv_synic_eventring_tail = alloc_percpu(u8 *);
+		BUG_ON(!hv_synic_eventring_tail);
+	}
+
 	hv_vp_index = kmalloc_array(nr_cpu_ids, sizeof(*hv_vp_index),
 				    GFP_KERNEL);
 	if (!hv_vp_index) {
@@ -460,11 +478,12 @@ void __init ms_hyperv_late_init(void)
 int hv_common_cpu_init(unsigned int cpu)
 {
 	void **inputarg, **outputarg;
+	u8 **synic_eventring_tail;
 	u64 msr_vp_index;
 	gfp_t flags;
 	const int pgcount = hv_output_page_exists() ? 2 : 1;
 	void *mem;
-	int ret;
+	int ret = 0;
 
 	/* hv_cpu_init() can be called with IRQs disabled from hv_resume() */
 	flags = irqs_disabled() ? GFP_ATOMIC : GFP_KERNEL;
@@ -472,8 +491,8 @@ int hv_common_cpu_init(unsigned int cpu)
 	inputarg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
 
 	/*
-	 * hyperv_pcpu_input_arg and hyperv_pcpu_output_arg memory is already
-	 * allocated if this CPU was previously online and then taken offline
+	 * The per-cpu memory is already allocated if this CPU was previously
+	 * online and then taken offline
 	 */
 	if (!*inputarg) {
 		mem = kmalloc(pgcount * HV_HYP_PAGE_SIZE, flags);
@@ -520,11 +539,21 @@ int hv_common_cpu_init(unsigned int cpu)
 	if (msr_vp_index > hv_max_vp_index)
 		hv_max_vp_index = msr_vp_index;
 
-	return 0;
+	if (hv_root_partition()) {
+		synic_eventring_tail = (u8 **)this_cpu_ptr(hv_synic_eventring_tail);
+		*synic_eventring_tail = kcalloc(HV_SYNIC_SINT_COUNT,
+						sizeof(u8), flags);
+		/* No need to unwind any of the above on failure here */
+		if (unlikely(!*synic_eventring_tail))
+			ret = -ENOMEM;
+	}
+
+	return ret;
 }
 
 int hv_common_cpu_die(unsigned int cpu)
 {
+	u8 **synic_eventring_tail;
 	/*
 	 * The hyperv_pcpu_input_arg and hyperv_pcpu_output_arg memory
 	 * is not freed when the CPU goes offline as the hyperv_pcpu_input_arg
@@ -537,6 +566,10 @@ int hv_common_cpu_die(unsigned int cpu)
 	 * originally allocated memory is reused in hv_common_cpu_init().
 	 */
 
+	synic_eventring_tail = this_cpu_ptr(hv_synic_eventring_tail);
+	kfree(*synic_eventring_tail);
+	*synic_eventring_tail = NULL;
+
 	return 0;
 }
 
-- 
2.34.1



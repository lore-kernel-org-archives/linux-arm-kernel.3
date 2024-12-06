Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5737E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWhJO32QaX3zCsv7TE/p5YopM8ATfeZewveYiJmJv4o=; b=Fn97Wz8OErWnetz6843AoYPtJo
	oxNwGysRrLWnfrOsXX06qSKL7zIHkBqYKD1zfEzDbK8LQgfqlH0fA7NIF59Eccl5IRpD+vAsF/XSa
	IG6tPJQI0nveHs8/7kCgUt/qCQ4QmRAAiY5bVihlxVG0qOWB1bdh83DrqVtab62i3ic8GapOEihea
	Mx0GmVVzGHvR22k5mKNdXJFdOTgALWPDRYSY3K5+5b6812FQ3ktaKs83Djz4CIWmPh4IoL1exugqp
	t5L9dHZzuQWlLOcgHrMKSoHqHrhTaWJ90i6yPvkQQU+qIDc5dl9faDbr1sQD9qo96p3GCAKE8z/Nl
	Qul+oI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJglK-00000002tp3-1ZzX;
	Fri, 06 Dec 2024 22:25:26 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgiI-00000002tFn-2Fjh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:22:20 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5583F20ACD9A;
	Fri,  6 Dec 2024 14:22:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5583F20ACD9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733523737;
	bh=qWhJO32QaX3zCsv7TE/p5YopM8ATfeZewveYiJmJv4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sWQ0SH08qm9VeXGl27eQ7mStuAPq1heKmJyhk3J6cj9XUjc8DFgaG+08qqeATQszN
	 En7kA8JL0Zkwh0/pBwysDXySLzYD7lw6gRiinipklXpaQypollKkxKcmKs4gTZ/eWg
	 t9tL+IQodGWl8dNVT7ugatUSEdOW5unboz6+FCiQ=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
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
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com
Subject: [PATCH 2/2] hyperv: Move create_vp and deposit_pages hvcalls to hv_common.c
Date: Fri,  6 Dec 2024 14:21:47 -0800
Message-Id: <1733523707-15954-3-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733523707-15954-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1733523707-15954-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_142218_626598_EF720CA3 
X-CRM114-Status: GOOD (  20.21  )
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

From: Nuno Das Neves <nudasnev@microsoft.com>

These are not specific to x86_64 and will be needed by common code.

Signed-off-by: Nuno Das Neves <nudasnev@microsoft.com>
---
 arch/x86/hyperv/hv_proc.c       | 144 -------------------------------
 arch/x86/include/asm/mshyperv.h |   2 -
 drivers/hv/hv_common.c          | 145 ++++++++++++++++++++++++++++++++
 include/asm-generic/mshyperv.h  |   2 +
 4 files changed, 147 insertions(+), 146 deletions(-)

diff --git a/arch/x86/hyperv/hv_proc.c b/arch/x86/hyperv/hv_proc.c
index 3fa1f2ee7b0d..119354d00637 100644
--- a/arch/x86/hyperv/hv_proc.c
+++ b/arch/x86/hyperv/hv_proc.c
@@ -10,109 +10,8 @@
 #include <asm/hypervisor.h>
 #include <asm/mshyperv.h>
 #include <asm/apic.h>
-
 #include <asm/trace/hyperv.h>
 
-/*
- * See struct hv_deposit_memory. The first u64 is partition ID, the rest
- * are GPAs.
- */
-#define HV_DEPOSIT_MAX (HV_HYP_PAGE_SIZE / sizeof(u64) - 1)
-
-/* Deposits exact number of pages. Must be called with interrupts enabled.  */
-int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
-{
-	struct page **pages, *page;
-	int *counts;
-	int num_allocations;
-	int i, j, page_count;
-	int order;
-	u64 status;
-	int ret;
-	u64 base_pfn;
-	struct hv_deposit_memory *input_page;
-	unsigned long flags;
-
-	if (num_pages > HV_DEPOSIT_MAX)
-		return -E2BIG;
-	if (!num_pages)
-		return 0;
-
-	/* One buffer for page pointers and counts */
-	page = alloc_page(GFP_KERNEL);
-	if (!page)
-		return -ENOMEM;
-	pages = page_address(page);
-
-	counts = kcalloc(HV_DEPOSIT_MAX, sizeof(int), GFP_KERNEL);
-	if (!counts) {
-		free_page((unsigned long)pages);
-		return -ENOMEM;
-	}
-
-	/* Allocate all the pages before disabling interrupts */
-	i = 0;
-
-	while (num_pages) {
-		/* Find highest order we can actually allocate */
-		order = 31 - __builtin_clz(num_pages);
-
-		while (1) {
-			pages[i] = alloc_pages_node(node, GFP_KERNEL, order);
-			if (pages[i])
-				break;
-			if (!order) {
-				ret = -ENOMEM;
-				num_allocations = i;
-				goto err_free_allocations;
-			}
-			--order;
-		}
-
-		split_page(pages[i], order);
-		counts[i] = 1 << order;
-		num_pages -= counts[i];
-		i++;
-	}
-	num_allocations = i;
-
-	local_irq_save(flags);
-
-	input_page = *this_cpu_ptr(hyperv_pcpu_input_arg);
-
-	input_page->partition_id = partition_id;
-
-	/* Populate gpa_page_list - these will fit on the input page */
-	for (i = 0, page_count = 0; i < num_allocations; ++i) {
-		base_pfn = page_to_pfn(pages[i]);
-		for (j = 0; j < counts[i]; ++j, ++page_count)
-			input_page->gpa_page_list[page_count] = base_pfn + j;
-	}
-	status = hv_do_rep_hypercall(HVCALL_DEPOSIT_MEMORY,
-				     page_count, 0, input_page, NULL);
-	local_irq_restore(flags);
-	if (!hv_result_success(status)) {
-		pr_err("Failed to deposit pages: %lld\n", status);
-		ret = hv_result(status);
-		goto err_free_allocations;
-	}
-
-	ret = 0;
-	goto free_buf;
-
-err_free_allocations:
-	for (i = 0; i < num_allocations; ++i) {
-		base_pfn = page_to_pfn(pages[i]);
-		for (j = 0; j < counts[i]; ++j)
-			__free_page(pfn_to_page(base_pfn + j));
-	}
-
-free_buf:
-	free_page((unsigned long)pages);
-	kfree(counts);
-	return ret;
-}
-
 int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
 {
 	struct hv_input_add_logical_processor *input;
@@ -154,46 +53,3 @@ int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
 	return ret;
 }
 
-int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
-{
-	struct hv_create_vp *input;
-	u64 status;
-	unsigned long irq_flags;
-	int ret = HV_STATUS_SUCCESS;
-
-	/* Root VPs don't seem to need pages deposited */
-	if (partition_id != hv_current_partition_id) {
-		/* The value 90 is empirically determined. It may change. */
-		ret = hv_call_deposit_pages(node, partition_id, 90);
-		if (ret)
-			return ret;
-	}
-
-	do {
-		local_irq_save(irq_flags);
-
-		input = *this_cpu_ptr(hyperv_pcpu_input_arg);
-
-		input->partition_id = partition_id;
-		input->vp_index = vp_index;
-		input->flags = flags;
-		input->subnode_type = HvSubnodeAny;
-		input->proximity_domain_info = hv_numa_node_to_pxm_info(node);
-		status = hv_do_hypercall(HVCALL_CREATE_VP, input, NULL);
-		local_irq_restore(irq_flags);
-
-		if (hv_result(status) != HV_STATUS_INSUFFICIENT_MEMORY) {
-			if (!hv_result_success(status)) {
-				pr_err("%s: vcpu %u, lp %u, %lld\n", __func__,
-				       vp_index, flags, status);
-				ret = hv_result(status);
-			}
-			break;
-		}
-		ret = hv_call_deposit_pages(node, partition_id, 1);
-
-	} while (!ret);
-
-	return ret;
-}
-
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 9eeca2a6d047..5bad88cfccba 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -57,9 +57,7 @@ u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2);
 #define HV_AP_INIT_GPAT_DEFAULT		0x0007040600070406ULL
 #define HV_AP_SEGMENT_LIMIT		0xffffffff
 
-int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
 int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
-int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
 
 /*
  * If the hypercall involves no input or output parameters, the hypervisor
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 819bcfd2b149..591cc51e8817 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -679,3 +679,148 @@ u64 __weak hv_tdx_hypercall(u64 control, u64 param1, u64 param2)
 	return HV_STATUS_INVALID_PARAMETER;
 }
 EXPORT_SYMBOL_GPL(hv_tdx_hypercall);
+
+int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
+{
+	struct hv_create_vp *input;
+	u64 status;
+	unsigned long irq_flags;
+	int ret = HV_STATUS_SUCCESS;
+
+	/* Root VPs don't seem to need pages deposited */
+	if (partition_id != hv_current_partition_id) {
+		/* The value 90 is empirically determined. It may change. */
+		ret = hv_call_deposit_pages(node, partition_id, 90);
+		if (ret)
+			return ret;
+	}
+
+	do {
+		local_irq_save(irq_flags);
+
+		input = *this_cpu_ptr(hyperv_pcpu_input_arg);
+
+		input->partition_id = partition_id;
+		input->vp_index = vp_index;
+		input->flags = flags;
+		input->subnode_type = HvSubnodeAny;
+		input->proximity_domain_info = hv_numa_node_to_pxm_info(node);
+		status = hv_do_hypercall(HVCALL_CREATE_VP, input, NULL);
+		local_irq_restore(irq_flags);
+
+		if (hv_result(status) != HV_STATUS_INSUFFICIENT_MEMORY) {
+			if (!hv_result_success(status)) {
+				pr_err("%s: vcpu %u, lp %u, %lld\n", __func__,
+				       vp_index, flags, status);
+				ret = hv_result(status);
+			}
+			break;
+		}
+		ret = hv_call_deposit_pages(node, partition_id, 1);
+
+	} while (!ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hv_call_create_vp);
+
+/*
+ * See struct hv_deposit_memory. The first u64 is partition ID, the rest
+ * are GPAs.
+ */
+#define HV_DEPOSIT_MAX (HV_HYP_PAGE_SIZE / sizeof(u64) - 1)
+
+/* Deposits exact number of pages. Must be called with interrupts enabled.  */
+int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
+{
+	struct page **pages, *page;
+	int *counts;
+	int num_allocations;
+	int i, j, page_count;
+	int order;
+	u64 status;
+	int ret;
+	u64 base_pfn;
+	struct hv_deposit_memory *input_page;
+	unsigned long flags;
+
+	if (num_pages > HV_DEPOSIT_MAX)
+		return -E2BIG;
+	if (!num_pages)
+		return 0;
+
+	/* One buffer for page pointers and counts */
+	page = alloc_page(GFP_KERNEL);
+	if (!page)
+		return -ENOMEM;
+	pages = page_address(page);
+
+	counts = kcalloc(HV_DEPOSIT_MAX, sizeof(int), GFP_KERNEL);
+	if (!counts) {
+		free_page((unsigned long)pages);
+		return -ENOMEM;
+	}
+
+	/* Allocate all the pages before disabling interrupts */
+	i = 0;
+
+	while (num_pages) {
+		/* Find highest order we can actually allocate */
+		order = 31 - __builtin_clz(num_pages);
+
+		while (1) {
+			pages[i] = alloc_pages_node(node, GFP_KERNEL, order);
+			if (pages[i])
+				break;
+			if (!order) {
+				ret = -ENOMEM;
+				num_allocations = i;
+				goto err_free_allocations;
+			}
+			--order;
+		}
+
+		split_page(pages[i], order);
+		counts[i] = 1 << order;
+		num_pages -= counts[i];
+		i++;
+	}
+	num_allocations = i;
+
+	local_irq_save(flags);
+
+	input_page = *this_cpu_ptr(hyperv_pcpu_input_arg);
+
+	input_page->partition_id = partition_id;
+
+	/* Populate gpa_page_list - these will fit on the input page */
+	for (i = 0, page_count = 0; i < num_allocations; ++i) {
+		base_pfn = page_to_pfn(pages[i]);
+		for (j = 0; j < counts[i]; ++j, ++page_count)
+			input_page->gpa_page_list[page_count] = base_pfn + j;
+	}
+	status = hv_do_rep_hypercall(HVCALL_DEPOSIT_MEMORY,
+				     page_count, 0, input_page, NULL);
+	local_irq_restore(flags);
+	if (!hv_result_success(status)) {
+		pr_err("Failed to deposit pages: %lld\n", status);
+		ret = hv_result(status);
+		goto err_free_allocations;
+	}
+
+	ret = 0;
+	goto free_buf;
+
+err_free_allocations:
+	for (i = 0; i < num_allocations; ++i) {
+		base_pfn = page_to_pfn(pages[i]);
+		for (j = 0; j < counts[i]; ++j)
+			__free_page(pfn_to_page(base_pfn + j));
+	}
+
+free_buf:
+	free_page((unsigned long)pages);
+	kfree(counts);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hv_call_deposit_pages);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 8c4ff6e9aae7..46c0a6cae4e6 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -305,6 +305,8 @@ u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2);
 void hyperv_cleanup(void);
 bool hv_query_ext_cap(u64 cap_query);
 void hv_setup_dma_ops(struct device *dev, bool coherent);
+int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
+int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
 #else /* CONFIG_HYPERV */
 static inline bool hv_is_hyperv_initialized(void) { return false; }
 static inline bool hv_is_hibernation_supported(void) { return false; }
-- 
2.34.1



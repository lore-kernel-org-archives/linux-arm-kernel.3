Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E97BC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0r1JKvmv0MvX9Ul3IceSoM7nvnPjrhsrvOtLj+jBA4=; b=o/rY3np0f49v+B+m6uk6ZczmRD
	GTI4mO6Fq9AF4IqXScujULpf2DBBnq5oXE25noI41Um+03Tblfok+Ts+c0V0ZkZpMJ3F9B8/CQ8X1
	lY2DlCE7vosn0AKJ9NlB6FmwCSc3BjmXHlX5JxI75Xzq+LDs8oaZAXd51jW4AGQt3DX1t/4aZ2WAu
	C1GLlE85BeqxpZTNFRntyZAQDFcpUSWJiQ6Lw0WegoaZP2nnej8pbmxH0PfX65O4wwe8pSGw4lkK0
	yxS3cHfVcCK3ZRQEnWoR41UcjgsLwkcbJHFyeG09crSzIYzc2m3IcmujlDKYN7H+zQQVYIHsvJhLr
	MHtX9vQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W9L-00000006QmV-2zdc;
	Mon, 07 Sep 2026 10:00:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W9C-00000006QgB-2J0c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:00:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A32C21477;
	Mon,  7 Sep 2026 03:00:13 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 923163F7B4;
	Mon,  7 Sep 2026 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788775217; bh=OUCQPMUJW7TTVGc7oNgwJqrfut6BVN3OsAInh6zFCiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f3TBSzIhoKYuzOfTmmv5k7h07N7/pP7rqN+M027hcqlR8QjPvMdDnXVuZfAs9LjpF
	 OV92sUGUmAMPlZisdW09YBIhLu9oGsksDOdSq0m0aAH2zU43SuA6xkPOm4r09w0q6b
	 vhspVXMia33PeRUSnU57NxnHeaArjU7tZWS7mgn8=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries for memory
Date: Mon,  7 Sep 2026 10:59:40 +0100
Message-ID: <20260907095942.1140734-7-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907095942.1140734-1-suzuki.poulose@arm.com>
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_030018_667214_7F8A61B9 
X-CRM114-Status: GOOD (  23.59  )
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

From: Steven Price <steven.price@arm.com>

The RMM maintains the state of all the granules in the system to make
sure that the host is abiding by the rules. This state can be maintained
at different granularity, per page (TRACKING_FINE) or per region
(TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region, all pages
in the region must be of the same state, this implies we need to have "fine"
tracking for DRAM, so that we can delegate individual pages.

For now we only support a statically carved out memory for tracking
granules for the "fine" regions. This can be extended in the future to
allow modifying the tracking granularity and remove the need for a
static allocation by the firmware.

Similarly, the firmware may create L0 GPT entries describing the total
address space. But if we change the "PAS" (Physical Address Space) of a
granule, then the firmware may need to create L1 tables to track the PAS
at a finer granularity. Linux therefore checks if the platform firmware manages
the PAR region. i.e., the firmware is in charge of managing the L1 GPTs
(creation and the required memory for the GPT tables - via static carveouts)
without host intervention. Support for dynamic GPT creation by the host will be
added later.

If the firmware requires us to manage the tracking or GPT memory, Deactivate
the RMM and reclaim any memory donated at RMM activation.

Apply the same checks when hotplugged memory is brought online.

Signed-off-by: Steven Price <steven.price@arm.com>
[ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 Changes since v16:
     * Check fine tracking and create L1 GPTs for hotplug-added memory.
     * Clarify the L1 GPT setup and move the explanatory comment.
     * Switch to using RMI_GPT_INFO command for checking the GPTs.
     * Deactivate the RMM and reclaim the memory if we can't proceed.
 Changes since v15:
     * Skip firmware-reserved NOMAP memory in rmi_init_metadata()
     * Handle negative error codes from wrappers.
 Changes since v14:
     * Move the implementation into drivers/firmware/arm_rmm.
 Changes since v13:
     * Moved out of KVM
---
 drivers/firmware/arm_rmm/rmi.c | 139 +++++++++++++++++++++++++++++++++
 include/linux/arm-rmi-cmds.h   |  75 ++++++++++++++++++
 2 files changed, 214 insertions(+)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index d969c8738efde..34058e34188d3 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -5,6 +5,7 @@
 
 #include <linux/cpufeature.h>
 #include <linux/memblock.h>
+#include <linux/memory.h>
 #include <linux/arm-rmi-cmds.h>
 #include <linux/processor.h>
 #include <linux/slab.h>
@@ -12,6 +13,8 @@
 #include <asm/memory.h>
 #include <asm/pgtable-hwdef.h>
 
+static bool arm64_rmi_is_available;
+
 /* Currently only the first 2 registers are used by Linux */
 #define RMI_FEAT_REG_COUNT	2
 static __ro_after_init unsigned long rmi_feat_reg_cache[RMI_FEAT_REG_COUNT];
@@ -639,6 +642,124 @@ static int rmi_configure(void)
 	return ret;
 }
 
+/*
+ * Make sure the area is tracked by RMM at FINE granularity.
+ * We do not support changing the tracking yet.
+ */
+static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
+{
+	while (start < end) {
+		unsigned long ret, category, state, next;
+
+		ret = rmi_granule_tracking_get(start, end, &category, &state, &next);
+		if (ret != RMI_SUCCESS)
+			return -ENOMEM;
+
+		if (state != RMI_TRACKING_FINE ||
+		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
+			/* TODO: Set granule tracking in this case */
+			pr_err("Granule tracking for region isn't fine/conventional: %llx-%lx\n",
+			       start, next);
+			return -ENODEV;
+		}
+		start = next;
+	}
+
+	return 0;
+}
+
+/*
+ * We do not support creating L1 GPTs yet. So, make sure that
+ * all the regions are managed by the firmware.
+ */
+static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
+{
+	unsigned long l0gpt_sz;
+	unsigned long next, par_state;
+
+	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
+					  rmi_feat_reg(1)));
+	start = ALIGN_DOWN(start, l0gpt_sz);
+	end = ALIGN(end, l0gpt_sz);
+
+	while (start < end) {
+		long ret = rmi_gpt_info(start, end, &next, &par_state);
+
+		if (ret != RMI_SUCCESS)
+			return -ENOMEM;
+
+		if (par_state != RMI_GPT_PAR_PLAT) {
+			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
+				start, next);
+			return -ENOMEM;
+		}
+		start = next;
+	}
+
+	return 0;
+}
+
+static int rmi_prepare_memory(phys_addr_t start, phys_addr_t end)
+{
+	int ret;
+
+	ret = rmi_verify_memory_tracking(start, end);
+	if (ret)
+		return ret;
+
+	return rmi_verify_gpt_firmware_managed(start, end);
+}
+
+static int rmi_init_metadata(void)
+{
+	phys_addr_t start, end;
+	struct memblock_region *r;
+
+	for_each_mem_region(r) {
+		int ret;
+
+		/* Firmware-reserved NOMAP regions are not usable system RAM */
+		if (memblock_is_nomap(r))
+			continue;
+
+		start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
+		end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
+
+		ret = rmi_prepare_memory(start, end);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rmi_memory_notifier(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct memory_notify *arg = data;
+	phys_addr_t start, end;
+	int ret;
+
+	if (action != MEM_GOING_ONLINE)
+		return NOTIFY_DONE;
+
+	start = PFN_PHYS(arg->start_pfn);
+	end = PFN_PHYS(arg->start_pfn + arg->nr_pages);
+	ret = rmi_prepare_memory(start, end);
+
+	return notifier_from_errno(ret);
+}
+
+static struct notifier_block rmi_memory_nb = {
+	.notifier_call = rmi_memory_notifier,
+};
+
+bool is_rmi_available(void)
+{
+	return arm64_rmi_is_available;
+}
+EXPORT_SYMBOL_GPL(is_rmi_available);
+
 static int __init arm64_init_rmi(void)
 {
 	int ret = 0;
@@ -666,8 +787,26 @@ static int __init arm64_init_rmi(void)
 	if (ret) {
 		pr_err("RMM activate failed\n");
 		ret = ret < 0 ? ret : -ENXIO;
+		goto out_free_sro;
 	}
 
+	ret = rmi_init_metadata();
+	if (ret)
+		goto out_deactivate;
+
+	ret = register_memory_notifier(&rmi_memory_nb);
+	if (ret)
+		goto out_deactivate;
+
+	arm64_rmi_is_available = true;
+	pr_info("RMI configured\n");
+	kfree(sro);
+
+	return 0;
+
+out_deactivate:
+	rmi_rmm_deactivate(sro);
+out_free_sro:
 	kfree(sro);
 	return ret;
 }
diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
index dea7c7004d35f..79e2c1f165112 100644
--- a/include/linux/arm-rmi-cmds.h
+++ b/include/linux/arm-rmi-cmds.h
@@ -35,6 +35,8 @@ static inline int rmi_undelegate_page(phys_addr_t phys)
 	return rmi_undelegate_range(phys, PAGE_SIZE);
 }
 
+bool is_rmi_available(void);
+
 long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp);
 void rmi_sro_free(struct rmi_sro_state *sro);
 long rmi_sro_execute(struct arm_smccc_1_2_regs *regs);
@@ -64,6 +66,19 @@ static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
 	return res.a0;
 }
 
+/**
+ * rmi_rmm_deactivate() - Deactivate the RMM and reclaim any memory donated at
+ * rmi_rmm_activate()
+ *
+ * @sro: Preallocated SRO context to be used
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rmm_deactivate(struct rmi_sro_state *sro)
+{
+	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE);
+}
+
 /**
  * rmi_rmm_activate() - Activate the RMM
  * @sro: Preallocated SRO context to be used
@@ -75,6 +90,66 @@ static inline long rmi_rmm_activate(struct rmi_sro_state *sro)
 	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
 }
 
+/**
+ * rmi_granule_tracking_get() - Get configuration of a Granule tracking region
+ * @start: Base PA of the tracking region
+ * @end: End of the PA region
+ * @out_category: Memory category
+ * @out_state: Tracking region state
+ * @out_top: Top of the memory region
+ *
+ * Return: RMI return code
+ */
+static inline int rmi_granule_tracking_get(unsigned long start,
+					   unsigned long end,
+					   unsigned long *out_category,
+					   unsigned long *out_state,
+					   unsigned long *out_top)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_GRANULE_TRACKING_GET, start, end, &res);
+
+	if (res.a0 == RMI_SUCCESS) {
+		if (out_category)
+			*out_category = res.a1;
+		if (out_state)
+			*out_state = res.a2;
+		if (out_top)
+			*out_top = res.a3;
+	}
+
+	return res.a0;
+}
+
+/*
+ * rmi_gpt_info - Query the GPT info for the given PAR.
+ * @base: Base of the physical address region
+ * @top: Top of the physical address region
+ * @out_top: Top of the phyiscal address region for which
+ *		the GPT @out_gpt_par_state is valid
+ * @out_gpt_par_state: State of the GPT covered by [base, out_top)
+ */
+static inline long rmi_gpt_info(unsigned long base, unsigned long end,
+			       unsigned long *out_top,
+			       unsigned long *out_gpt_par_state)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_GPT_INFO, base, end,
+	};
+
+	long ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS) {
+		if (out_top)
+			*out_top = regs.a1;
+		if (out_gpt_par_state)
+			*out_gpt_par_state = regs.a2;
+	}
+
+	return ret;
+}
+
 /**
  * rmi_features() - Read feature register
  * @index: Feature register index
-- 
2.43.0



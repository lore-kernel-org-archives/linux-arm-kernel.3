Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA38CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AI0s37QLs9JGg1meNGAK6bMsf65ucIVk79x+r4hhiIQ=; b=1Cf79cQIKvTjKO0dHj9me9d9Zf
	Axn05eW71UkJhqYzbdwAJ+XoEJEXLH1CzTq2aOGEeiPwm4Bs61nj6hIj0nllJT9bSi6r67wY5Fjix
	/p/reuNd6E/hLKAl9bN3xNvFAkthgGUVDim99pevLWH+v167A6bcOXyAFKCE+bDy63CNbReGrXJ7s
	GiT7xN44d9DVBnOKT7cxkCizpY2eDSr2ToP16CfyQuv8vkrRjbwQf9Q06GTonJiNCErxsr2ifTp/S
	C3K/mqKxrD+5YqQk/iFppyuU5ZHPvIVbuzIJhk9dUpfNI9VNbV2Ay0V84a+o0i2tVYKPI+1pnmTSg
	3Y7iszdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCRJ-00000008Fcr-0ik6;
	Thu, 01 Oct 2026 08:46:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCRH-00000008Fas-247I
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 08:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AI0s37QLs9JGg1meNGAK6bMsf65ucIVk79x+r4hhiIQ=; b=YGa9simmPpXpFjaV9KhQ1ovPLY
	m/NcSwZUChms+jPlVHREK5FsCvvLGFDZdwY4o4HkF0iCWADOfPRzkBH4ISTFVsuFr7QT0EzjflWU4
	129FTEhpJY/Om0Tc0Z07c/nH9Ya926e7HFx9mMHdwX2xZ/CJEnnVc+SVhZSCsae9tsRrqvfxP7okW
	9ATu+NNlVYhGUOfNQfFhHWrnWpQJg0+7oS9Co88eB7aUyKs8tM2/S3m6LiMgje5YY0CXVoSgxccLL
	XnJqp2SbI+J/QkqXuiDxJvbt9bIcEDFl8af7EkvMmHuJQwcoS2vo3KVeQBIxUKtCYCDurIgvMZZmN
	0EQW7CMA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCCRC-00000004ksy-49uq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:46:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AAB8497;
	Thu,  1 Oct 2026 01:46:42 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F2F33F85F;
	Thu,  1 Oct 2026 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790844406; bh=hPWnn3uxFFa4B3ejTdOd9hL4sOZkCIoWJ0CoLVEg/I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JcnRy1PMpdJlegwkGpGcH/WQrU2m4w619KCDL3Gd44WQDxn+3zvG5XB0MMvpYyUep
	 HZxCy1MwAFDE3sUJFmJ055PVW9gRllQ6AvALtYCgI5u4yoDA7Xf0SDcyKti3DwwRAw
	 TU0MLTe/Y+ZTiGlLnPfY28YBvPmC6ROp9wFqCgmA=
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
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v21 6/9] firmware: arm_rmm: Ensure the RMM has GPT entries for memory
Date: Thu,  1 Oct 2026 09:45:52 +0100
Message-ID: <20261001084555.1456543-7-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001084555.1456543-1-suzuki.poulose@arm.com>
References: <20261001084555.1456543-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_094647_591738_A4003D38 
X-CRM114-Status: GOOD (  29.80  )
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
underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
all pages in the region must be of the same state, this implies we need to
have "fine" tracking for DRAM, so that we can delegate individual pages.

For now we only support a statically carved out memory for tracking
granules for the "fine" regions. This can be extended in the future to
allow modifying the tracking granularity and remove the need for a
static allocation by the firmware.

Similarly, the firmware may create L0 GPT entries describing the total
address space. But if we change the "PAS" (Physical Address Space) of a
granule, then the firmware may need to create L1 tables to track the PAS
at a finer granularity. Linux therefore checks if the platform firmware
manages the PAR region. i.e., the firmware is in charge of managing the
L1 GPTs (creation and the required memory for the GPT tables - via static
carveouts) without host intervention. Support for dynamic GPT creation by
the host will be added later.

If the firmware requires us to manage the tracking or GPT memory,
deactivate the RMM and reclaim any memory donated at RMM activation.

Apply the same checks when hotplugged memory is brought online.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 Changes since v19:
   * Wrap comments to 80spaces.
   * Add a comment on ALIGN_DOWN the end of memory range.
   * Add is_rmm_active() to indicate if the RMM is active
   * Switch errors to -ENODEV from -ENOMEM when RMM doesn't manage the region
   * Print error messages when RMI_GPT_INFO/RMI_GRANULE_TRACKIN_GET fails
 Changes since v18:
   * Avoid mixing gotos with __free cleanups for arm64_init_rmi()
   * Handle buggy RMM to make forward progress for RMI_GPT_INFO and
     RMI_GRANULE_TRACKING_GET
   * Make sure the memory ranges are not inverted and reject such ranges.
   * Move granule_tracking_get/gpt_info wrappers closer to the callers
     Drop "inline", let the compiler do its job
 Changes since v17:
   * Move wrappers that may not be used elsewhere, out of arm-rmi-cmds.h
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
 drivers/firmware/arm_rmm/rmi.c | 247 ++++++++++++++++++++++++++++++++-
 include/linux/arm-rmi-cmds.h   |  18 +++
 2 files changed, 264 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index a09056a5d269f..d0842d621cd4b 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -6,6 +6,7 @@
 #include <linux/arm-rmi-cmds.h>
 #include <linux/cpufeature.h>
 #include <linux/memblock.h>
+#include <linux/memory.h>
 #include <linux/mmzone.h>
 #include <linux/slab.h>
 
@@ -14,6 +15,25 @@
 
 /* RMM v2.0 defines RmiFeatureRegister0 to RmiFeatureRegister4. */
 static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
+static bool arm64_rmm_active;
+static bool arm64_rmi_is_available;
+
+/* is_rmm_active: Returns if the RMM is ACTIVE */
+bool is_rmm_active(void)
+{
+	return READ_ONCE(arm64_rmm_active);
+}
+EXPORT_SYMBOL_GPL(is_rmm_active);
+
+/*
+ * is_rmi_available: Returns if the RMM is ACTIVE and is configured with static
+ * carveout for metadata nad L1GPTs.
+ */
+bool is_rmi_available(void)
+{
+	return READ_ONCE(arm64_rmi_is_available);
+}
+EXPORT_SYMBOL_GPL(is_rmi_available);
 
 /*
  * rmi_granule_range_delegate() - Delegate granules
@@ -833,6 +853,216 @@ static int rmi_configure(void)
 	return 0;
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
+static int rmi_granule_tracking_get(unsigned long start,
+				    unsigned long end,
+				    unsigned long *out_category,
+				    unsigned long *out_state,
+				    unsigned long *out_top)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_GRANULE_TRACKING_GET, start, end,
+	};
+
+	rmi_smccc_invoke(&regs);
+
+	if (regs.a0 != RMI_SUCCESS)
+		return regs.a0;
+
+	if (out_category)
+		*out_category = regs.a1;
+	if (out_state)
+		*out_state = regs.a2;
+	if (out_top)
+		*out_top = regs.a3;
+
+	return RMI_SUCCESS;
+}
+
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
+		if (ret != RMI_SUCCESS) {
+			pr_err("RMI_GRANULE_TRACKING_GET failed for %llx-%llx: (%lu)\n",
+				start, end, ret);
+			return -ENXIO;
+		}
+
+		if (WARN_ON(next <= start))
+			return -ENXIO;
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
+ * rmi_gpt_info - Query the GPT info for the given PAR.
+ * @start: Base of the physical address region
+ * @end: Top of the physical address region
+ * @out_top: Top of the physical address region for which the GPT @out_gpt_par_state
+ *		is valid
+ * @out_gpt_par_state: State of the GPT covered by [start, out_top)
+ */
+static long rmi_gpt_info(unsigned long start, unsigned long end,
+			 unsigned long *out_top,
+			 unsigned long *out_gpt_par_state)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_GPT_INFO, start, end,
+	};
+
+	rmi_smccc_invoke(&regs);
+	if (regs.a0 != RMI_SUCCESS)
+		return regs.a0;
+
+	if (out_top)
+		*out_top = regs.a1;
+	if (out_gpt_par_state)
+		*out_gpt_par_state = regs.a2;
+
+	return RMI_SUCCESS;
+}
+
+/*
+ * We do not support creating L1 GPTs yet. So, make sure that all the regions
+ * are managed by the firmware.
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
+		if (ret != RMI_SUCCESS) {
+			pr_err("RMI_GPT_INFO failed for %llx-%llx: (%ld)\n",
+				start, end, ret);
+			return -ENXIO;
+		}
+
+		if (WARN_ON(next <= start))
+			return -ENXIO;
+
+		if (par_state != RMI_GPT_PAR_PLAT) {
+			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
+				start, next);
+			return -ENODEV;
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
+	if (start >= end)
+		return -EINVAL;
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
+		start = PAGE_ALIGN(r->base);
+		/*
+		 * We always deal with PAGE_SIZE and if in the odd case this
+		 * region boundary is not PAGE aligned, we stick to the page
+		 * that we can use from the region.
+		 */
+		end = PAGE_ALIGN_DOWN(r->base + r->size);
+		/* Too small ? */
+		if (start >= end)
+			continue;
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
+
+	ret = rmi_prepare_memory(start, end);
+
+	return notifier_from_errno(ret);
+}
+
+static struct notifier_block rmi_memory_nb = {
+	.notifier_call = rmi_memory_notifier,
+};
+
+static int rmi_init_memory(void)
+{
+	int ret;
+
+	ret = rmi_init_metadata();
+	if (ret)
+		return ret;
+
+	return register_memory_notifier(&rmi_memory_nb);
+}
+
 static int __init arm64_init_rmi(void)
 {
 	int ret;
@@ -859,9 +1089,24 @@ static int __init arm64_init_rmi(void)
 	if (ret) {
 		pr_err("RMM activate failed (%d)\n", ret);
 		ret = ret < 0 ? ret : -ENXIO;
+		return ret;
 	}
 
-	return ret;
+	WRITE_ONCE(arm64_rmm_active, true);
+
+	ret = rmi_init_memory();
+	if (ret) {
+		/* Deactivate the RMM */
+		if (!WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE)))
+			WRITE_ONCE(arm64_rmm_active, false);
+		return ret;
+	}
+
+	/* Mark the RMM is usable */
+	WRITE_ONCE(arm64_rmi_is_available, true);
+	pr_info("RMI configured\n");
+
+	return 0;
 }
 
 /*
diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
index 5354839d76077..5d005054f3c6c 100644
--- a/include/linux/arm-rmi-cmds.h
+++ b/include/linux/arm-rmi-cmds.h
@@ -86,4 +86,22 @@ long rmi_sro_execute(struct arm_smccc_1_2_regs *regs);
 	__ret;								\
 })
 
+#ifdef CONFIG_ARM_RMM_RMI
+
+bool is_rmm_active(void);
+bool is_rmi_available(void);
+
+#else
+
+static inline bool is_rmm_active(void)
+{
+	return false;
+}
+
+static inline bool is_rmi_available(void)
+{
+	return false;
+}
+#endif	/* CONFIG_ARM_RMM_RMI */
+
 #endif	/* __LINUX_ARM_RMI_CMDS_H_ */
-- 
2.43.0



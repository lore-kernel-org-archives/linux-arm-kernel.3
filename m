Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01D0E67499
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbcgRIezxDawY7xcu3ovX9hkaM5X1wVXgi1CFgzLbWo=; b=BsaCUl4L+II1Rs0u87DVTIodSx
	rdNO13vez57ajEuVHoxLd2FbFTPZJLdsc75XJefjOoI1MsrROiholgoQBIFDLPN7NsWjwmqygX8rj
	J8/EokLbqjzA9M2ZNFeOXnK+jx9sVrPz7+FMjuzuKGrmi+Ab9SXmh6ZKChO+ozN2HZ+3d39/D2kBl
	HvZ+BPsiZJeYcVbI0ScB23WMMILoWfM9NSY8kZwaQHVbtkvPXl8fpLBNmyClg2zXn+dunP0ir+n/H
	VQ07qPhRgKeIzMIeYbNi5IAhgFVFjelFxrNcEmK+Hmbfs1mvMk+2mv6LSsrqp5pFpPwO7i8nHGKh0
	043DYmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcTD-0000000DXvr-31c8;
	Mon, 22 Dec 2025 09:44:51 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcT4-0000000DXkS-1qeM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766396680; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=LbcgRIezxDawY7xcu3ovX9hkaM5X1wVXgi1CFgzLbWo=;
	b=Ku57ssgwqOHnVqXgkLqDzFJyA9D5k4VN5r56fnkh9puTYRx2NLOjEbC0h3gWugW4FEefxoldeGymGzlRPpzd4V/fy7Vqdgu70KOCVmJyFZegJjmcLBf4WEdS6qQ0okDTDeSp8JrnA2hKn6jRpy3gK9BpI9+eCbbbn7pVdg28aTI=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvOT.Y9_1766396676 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 22 Dec 2025 17:44:37 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com,
	misono.tomohiro@fujitsu.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v4 14/17] ras: ATL: Unified ATL interface for ARM64 and AMD
Date: Mon, 22 Dec 2025 17:43:47 +0800
Message-Id: <20251222094351.38792-15-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
References: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_014442_842586_99CF7852 
X-CRM114-Status: GOOD (  15.71  )
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

Translate device normalize address in AMD, also named logical address,
to system physical address is a common interface in RAS. Provides common
interface both for AMD and ARM.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/edac/amd64_edac.c      |  2 +-
 drivers/ras/aest/aest-core.c   |  3 +++
 drivers/ras/amd/atl/core.c     |  4 ++--
 drivers/ras/amd/atl/internal.h |  2 +-
 drivers/ras/amd/atl/umc.c      |  3 ++-
 drivers/ras/ras.c              | 24 +++++++++++-------------
 include/linux/ras.h            |  9 ++++-----
 7 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 2391f3469961..478cfef37892 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2847,7 +2847,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 	a_err.ipid = m->ipid;
 	a_err.cpu  = m->extcpu;
 
-	sys_addr = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
+	sys_addr = convert_ras_la_to_spa(&a_err);
 	if (IS_ERR_VALUE(sys_addr)) {
 		err.err_code = ERR_NORM_ADDR;
 		goto log_error;
diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index a290b482bf8b..052211ca3e2a 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -235,6 +235,9 @@ static void aest_node_pool_process(struct work_struct *work)
 		    (status & (ERR_STATUS_UE | ERR_STATUS_DE))) {
 			if (event->addressing_mode == AEST_ADDREESS_SPA)
 				addr = event->regs.err_addr & PHYS_MASK;
+			else
+				addr = convert_ras_la_to_spa(event);
+
 			aest_handle_memory_failure(addr);
 		}
 
diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index 0f7cd6dab0b0..4f44c0ce97ec 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -210,7 +210,7 @@ static int __init amd_atl_init(void)
 
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
-	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
+	atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
@@ -222,7 +222,7 @@ static int __init amd_atl_init(void)
  */
 static void __exit amd_atl_exit(void)
 {
-	amd_atl_unregister_decoder();
+	atl_unregister_decoder();
 }
 
 module_init(amd_atl_init);
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 82a56d9c2be1..423a6193fdc7 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -279,7 +279,7 @@ int denormalize_address(struct addr_ctx *ctx);
 int dehash_address(struct addr_ctx *ctx);
 
 unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsigned long addr);
-unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+unsigned long convert_umc_mca_addr_to_sys_addr(void *data);
 
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
 u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index befc616d5e8a..57a78c380467 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -399,8 +399,9 @@ static u8 get_coh_st_inst_id(struct atl_err *err)
 	return FIELD_GET(UMC_CHANNEL_NUM, err->ipid);
 }
 
-unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
+unsigned long convert_umc_mca_addr_to_sys_addr(void *data)
 {
+	struct atl_err *err = data;
 	u8 socket_id = topology_physical_package_id(err->cpu);
 	u8 coh_st_inst_id = get_coh_st_inst_id(err);
 	unsigned long addr = get_addr(err->addr);
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 2a5b5a9fdcb3..050b49466a18 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -10,36 +10,34 @@
 #include <linux/ras.h>
 #include <linux/uuid.h>
 
-#if IS_ENABLED(CONFIG_AMD_ATL)
 /*
  * Once set, this function pointer should never be unset.
  *
  * The library module will set this pointer if it successfully loads. The module
  * should not be unloaded except for testing and debug purposes.
  */
-static unsigned long (*amd_atl_umc_na_to_spa)(struct atl_err *err);
+static unsigned long (*atl_ras_la_to_spa)(void *err);
 
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *))
+void atl_register_decoder(unsigned long (*f)(void *))
 {
-	amd_atl_umc_na_to_spa = f;
+	atl_ras_la_to_spa = f;
 }
-EXPORT_SYMBOL_GPL(amd_atl_register_decoder);
+EXPORT_SYMBOL_GPL(atl_register_decoder);
 
-void amd_atl_unregister_decoder(void)
+void atl_unregister_decoder(void)
 {
-	amd_atl_umc_na_to_spa = NULL;
+	atl_ras_la_to_spa = NULL;
 }
-EXPORT_SYMBOL_GPL(amd_atl_unregister_decoder);
+EXPORT_SYMBOL_GPL(atl_unregister_decoder);
 
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
+unsigned long convert_ras_la_to_spa(void *err)
 {
-	if (!amd_atl_umc_na_to_spa)
+	if (!atl_ras_la_to_spa)
 		return -EINVAL;
 
-	return amd_atl_umc_na_to_spa(err);
+	return atl_ras_la_to_spa(err);
 }
-EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_sys_addr);
-#endif /* CONFIG_AMD_ATL */
+EXPORT_SYMBOL_GPL(convert_ras_la_to_spa);
 
 #define CREATE_TRACE_POINTS
 #define TRACE_INCLUDE_PATH ../../include/ras
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 05096f049dac..2270a8eb1038 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -42,14 +42,9 @@ struct atl_err {
 };
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
-void amd_atl_register_decoder(unsigned long (*f)(struct atl_err *));
-void amd_atl_unregister_decoder(void);
 void amd_retire_dram_row(struct atl_err *err);
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
-static inline unsigned long
-amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
 #endif /* CONFIG_AMD_ATL */
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
@@ -63,6 +58,10 @@ amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
 #define GET_LOGICAL_INDEX(mpidr) -EINVAL
 #endif /* CONFIG_ARM || CONFIG_ARM64 */
 
+void atl_register_decoder(unsigned long (*f)(void *));
+void atl_unregister_decoder(void);
+unsigned long convert_ras_la_to_spa(void *err);
+
 #if IS_ENABLED(CONFIG_AEST)
 void aest_register_decode_chain(struct notifier_block *nb);
 void aest_unregister_decode_chain(struct notifier_block *nb);
-- 
2.51.2.612.gdc70283dfc



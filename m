Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFEBE9412E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNa/fpvPn0Z1TlWVzlYTuc3CsiURx6FTNkQ2E5NF740=; b=jDXcr3zbY/qm/g79Z/TZouKUC7
	C17H6uiWsTVazgihNyLhcgAacteWrg0JgDWl/OwlzTYl1yFYIfMCs/5oyiZmLf0EmrmlJbqHKrgF3
	elb3zw/2wu2tTX+kRTn0c1WGMTjn/S7jbSqVWIM4VZs1i+uuMhPaKSwlfI2fsqXl2Wh7yYCTTHC/J
	yOhqlULHBazmfj4PES6NhzOpyQAiHsVIe6+bhI10RNK06QSWhjilb0245pgIjWldZx7y48llcGV3B
	38oTE2orUDunW7yPPbHn7jaWY8C/DW14sl9tqCyFDbCOgSTIlhsZCsRInUlo9JCZb02g2i9r03w5m
	7Wlh3pyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVnH-00000004eQp-1F3i;
	Tue, 30 Dec 2025 09:13:31 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVnE-00000004ePZ-2KUf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 09:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767086006; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=nNa/fpvPn0Z1TlWVzlYTuc3CsiURx6FTNkQ2E5NF740=;
	b=cnyYtidYHwqS763V7K1jEBg9IM92FAyt4zN/LBxN3gsZK0yhKoWxKMpQO8xDQfAsvBVJBsqcXorFvf3/CChyLZazqI3jxTE/2XIB6N1UFdxWCduOQcvdn8UOtFjdj45DkszYGKWCPGdrozTuMxDMjA7ZimRH3ZWrpbSx9qJKEhI=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvzYKvz_1767086003 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 30 Dec 2025 17:13:25 +0800
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
	misono.tomohiro@fujitsu.com,
	fengwei_yin@linux.alibaba.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v5 14/17] ras: ATL: Unify ATL interface for ARM64 and AMD
Date: Tue, 30 Dec 2025 17:13:22 +0800
Message-Id: <20251230091322.50015-1-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011328_876315_D0A567E5 
X-CRM114-Status: GOOD (  17.99  )
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

Certain components report errors using their internal physical
addresses. For instance, on AMD platforms, the UMC reports
normalized addresses, while on Arm systems, memory controllers
may report logical addresses. These addresses must be translated
into System Physical Addresses (SPA) before the OS can utilize
them effectively.

AMD already provides the amd_atl_umc_na_to_spa interface for
physical address translation. This patch introduces a common
function, atl_ras_la_to_spa, intended for use by both AMD and
Arm64 architectures. The parameters of this function are
architecture-specific data required for the address translation
process.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/edac/amd64_edac.c      |  2 +-
 drivers/ras/aest/aest-core.c   |  3 +++
 drivers/ras/amd/atl/core.c     |  4 ++--
 drivers/ras/amd/atl/internal.h |  2 +-
 drivers/ras/amd/atl/umc.c      |  5 +++--
 drivers/ras/amd/fmpm.c         |  2 +-
 drivers/ras/ras.c              | 24 +++++++++++-------------
 include/linux/ras.h            |  9 ++++-----
 8 files changed, 26 insertions(+), 25 deletions(-)

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
index befc616d5e8a..a688550604bd 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -318,7 +318,7 @@ static void _retire_row_mi300(struct atl_err *a_err)
 		a_err->addr &= ~MI300_UMC_MCA_COL;
 		a_err->addr |= FIELD_PREP(MI300_UMC_MCA_COL, col);
 
-		addr = amd_convert_umc_mca_addr_to_sys_addr(a_err);
+		addr = convert_ras_la_to_spa(a_err);
 		if (IS_ERR_VALUE(addr))
 			continue;
 
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
diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 8877c6ff64c4..d9fdd367644f 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -333,7 +333,7 @@ static void save_spa(struct fru_rec *rec, unsigned int entry,
 	a_err.ipid = id;
 	a_err.cpu  = cpu;
 
-	spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
+	spa = convert_ras_la_to_spa(&a_err);
 	if (IS_ERR_VALUE(spa)) {
 		pr_debug("Failed to get system address\n");
 		return;
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
2.47.3



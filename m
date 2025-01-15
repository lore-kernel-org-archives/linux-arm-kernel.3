Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BEBC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsWp3M42+F04T5O8bZhRK9JAw+edoq0ObaIcimjdwxU=; b=O5yyscMZ2M7UcjvVrmV/J1x/K0
	rRjGRK9E8/DKH8nx6NFVAA5FPrwduaDyCu3ioNFgFUAR5/A0eY2qRSyh/HFBwdANRSUT5mz/u4h4p
	YuGiB4XiW32QwikTTcIyG52Tqmi4zkEga2mAvBcWD5JAYmLRmKGOpq09BKxHEaohKHS0ESkyLvSpY
	gGn404XjYAifUrKFv/3lL3bl+ERYY8aP3p9FeZyDbPPvzMf2VexhaRse9fuYz+4DnazKO78ypr+Xd
	e8Jz17eIwSjv54q4ME/ybgaNCWvZFN4mIagdHUa4iEc6gPpEpz77hUkSCdB9zGSHpJMrgnhxmy7k3
	aGSiNCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXz5D-0000000B9XM-1Onk;
	Wed, 15 Jan 2025 08:49:03 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyz9-0000000B8Lr-3YNQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736930565; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=HsWp3M42+F04T5O8bZhRK9JAw+edoq0ObaIcimjdwxU=;
	b=hMeN4b6fn9m/CYG4ACSOl4QKfmI2H8NMl34pRDrEuLe0P081eoclXXMmG7iZeTl8j/dclYoBDgXfS91yoDBdRJdXIJRtiRKCkeSEkWdahu5oK0sogDxrf6iYi/0KZXyCirUrnZKOx1a51gPefLgxS2CslZmO6LEIkCdsPwcHdDY=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WNi.6jE_1736930562 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Jan 2025 16:42:44 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	baolin.wang@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v3 4/5] RAS/ATL: Unified ATL interface for ARM64 and AMD
Date: Wed, 15 Jan 2025 16:42:27 +0800
Message-Id: <20250115084228.107573-5-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
References: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_004248_058188_9D5D2413 
X-CRM114-Status: GOOD (  17.61  )
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
 drivers/ras/aest/aest-core.c   | 12 ++++++------
 drivers/ras/amd/atl/core.c     |  4 ++--
 drivers/ras/amd/atl/internal.h |  2 +-
 drivers/ras/amd/atl/umc.c      |  3 ++-
 drivers/ras/ras.c              | 24 +++++++++++-------------
 include/linux/ras.h            |  9 ++++-----
 7 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index ddfbdb66b794..1e9c96e4daa8 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2832,7 +2832,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 	a_err.ipid = m->ipid;
 	a_err.cpu  = m->extcpu;
 
-	sys_addr = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
+	sys_addr = convert_ras_la_to_spa(&a_err);
 	if (IS_ERR_VALUE(sys_addr)) {
 		err.err_code = ERR_NORM_ADDR;
 		goto log_error;
diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 12d0a32ecda9..0530880ded3e 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -228,16 +228,16 @@ static void aest_node_pool_process(struct work_struct *work)
 	llist_for_each_entry(event, head, llnode) {
 		aest_print(event);
 
-		/* TODO: translate Logical Addresses to System Physical Addresses */
+		addr = event->regs.err_addr & (1UL << CONFIG_ARM64_PA_BITS);
+
 		if (event->addressing_mode == AEST_ADDREESS_LA ||
-			(event->regs.err_addr & ERR_ADDR_AI)) {
-			pr_notice("Can not translate LA to SPA\n");
-			addr = 0;
-		} else
+			(event->regs.err_addr & ERR_ADDR_AI))
+			addr = convert_ras_la_to_spa(event);
+		else
 			addr = event->regs.err_addr & (1UL << CONFIG_ARM64_PA_BITS);
 
 		status = event->regs.err_status;
-		if (addr && ((status & ERR_STATUS_UE) || (status & ERR_STATUS_DE)))
+		if (addr > 0 && ((status & ERR_STATUS_UE) || (status & ERR_STATUS_DE)))
 			aest_handle_memory_failure(addr);
 
 		blocking_notifier_call_chain(&aest_decoder_chain, 0, event);
diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index 4197e10993ac..6b5f0f65bf8e 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -207,7 +207,7 @@ static int __init amd_atl_init(void)
 
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
-	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
+	atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
@@ -219,7 +219,7 @@ static int __init amd_atl_init(void)
  */
 static void __exit amd_atl_exit(void)
 {
-	amd_atl_unregister_decoder();
+	atl_unregister_decoder();
 }
 
 module_init(amd_atl_init);
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 143d04c779a8..42686189decb 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -277,7 +277,7 @@ int denormalize_address(struct addr_ctx *ctx);
 int dehash_address(struct addr_ctx *ctx);
 
 unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsigned long addr);
-unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
+unsigned long convert_umc_mca_addr_to_sys_addr(void *data);
 
 u64 add_base_and_hole(struct addr_ctx *ctx, u64 addr);
 u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index dc8aa12f63c8..aa13f7fd7ba4 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -395,8 +395,9 @@ static u8 get_coh_st_inst_id(struct atl_err *err)
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
index a6e4792a1b2e..e5f23a8279c2 100644
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
index 1c777af6a1af..2e90556779d2 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -43,16 +43,15 @@ struct atl_err {
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
 
+void atl_register_decoder(unsigned long (*f)(void *));
+void atl_unregister_decoder(void);
+unsigned long convert_ras_la_to_spa(void *err);
+
 #if IS_ENABLED(CONFIG_AEST)
 void aest_register_decode_chain(struct notifier_block *nb);
 void aest_unregister_decode_chain(struct notifier_block *nb);
-- 
2.33.1



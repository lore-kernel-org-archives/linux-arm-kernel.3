Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5902C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 01:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSI2xwI9QZ06lvhTUlSfhrs+Ca0FIbBhBy6W+YPd1No=; b=vCUPRokw6rTPagqYSo75s8362v
	LortA2zvuvS/MFW3ApiUfw4A+Cpy0StALBvsX/hCvh1xD+ablOimokeM2zat1fxMg+tdFMjxojTR/
	bbYubHGsKYaWxz4C2XcmabjiHxOqT5UIgMsbIvZ1e5WOxdyN0OWhHGgKX4OUeOHNVXlSFRvGE4mN+
	upuotLxBGzXBYqu9UXfvyN/ziHPWAUsxICVS7fIMto29JPcmB3WY9s6Cb8Ur/NmnRonJA503TEKLN
	oO5saLDtrf2DuaN42xbBmHIorw0d37v68qdwRlFGY5s4AXiT9wsqkPmnfnh0Hcs5xjhb8ElvbIRwr
	ATGIAecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uikCE-00000009Ro7-3OnU;
	Mon, 04 Aug 2025 01:41:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijCX-00000009M6t-2XGE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C71E25C10F4;
	Mon,  4 Aug 2025 00:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3E0C4CEFF;
	Mon,  4 Aug 2025 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267836;
	bh=IpKtns3P/ErqCS+qIP+WUyXuDEeMvAW/gGi8BpPbWtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rijg34osuvfm6u/3WFWpiSfzV4ateRsl7ptfHGMrO+2JHeVEEy4m3KjlBeEg4hunv
	 NiSd26LiHXv8M9jtugIysB/dD67OL71tHNFA1HHhwGyQJhdH800ooZMYOGKmrf6oEs
	 q4X/tEiiSaS/mRHzBk/23fdPgogmrvadhvjY6XwN4ELH43lhz7Z8R8FFHaHfZHaaiM
	 x5+SAyKOgTncAEV2cZnWnUvRAgP6fBjhGUSXvrHmJbjFB8eyGChLtNuoE/LT3G/xmn
	 dEfP9adRqbkjvPPc3J9iGbxVC1lm2ptXCHf72eQZy2ry218RMfVevFvFKAHGO5t7zw
	 aoUmJPhWSFNiA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Sasha Levin <sashal@kernel.org>,
	michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-edac@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 14/51] EDAC/synopsys: Clear the ECC counters on init
Date: Sun,  3 Aug 2025 20:36:06 -0400
Message-Id: <20250804003643.3625204-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003643.3625204-1-sashal@kernel.org>
References: <20250804003643.3625204-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.147
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_173717_745737_0C55FEA0 
X-CRM114-Status: GOOD (  20.43  )
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

From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

[ Upstream commit b1dc7f097b78eb8d25b071ead2384b07a549692b ]

Clear the ECC error and counter registers during initialization/probe to avoid
reporting stale errors that may have occurred before EDAC registration.

For that, unify the Zynq and ZynqMP ECC state reading paths and simplify the
code.

  [ bp: Massage commit message.
    Fix an -Wsometimes-uninitialized warning as reported by
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202507141048.obUv3ZUm-lkp@intel.com ]

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/20250713050753.7042-1-shubhrajyoti.datta@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit is suitable for backporting to stable kernel trees based on
the following analysis:

## Bug Fix Nature
The commit fixes a clear bug where the EDAC driver could report stale
ECC errors from before the driver was initialized. This is evident from
the commit message: "Clear the ECC error and counter registers during
initialization/probe to avoid reporting stale errors that may have
occurred before EDAC registration."

## Code Changes Analysis

1. **Problem Being Fixed**:
   - The driver wasn't clearing ECC error counters during initialization
   - This could lead to false error reports from pre-boot or pre-driver-
     load errors
   - Users could see incorrect ECC error counts that don't reflect
     actual runtime errors

2. **Solution Implementation**:
   - The patch consolidates the ECC state checking into a single
     `get_ecc_state()` function
   - Adds counter clearing logic for both Zynq and ZynqMP platforms:
     ```c
     // For Zynq:
     clearval = ECC_CTRL_CLR_CE_ERR | ECC_CTRL_CLR_UE_ERR;
     writel(clearval, priv->baseaddr + ECC_CTRL_OFST);
     writel(0x0, priv->baseaddr + ECC_CTRL_OFST);

     // For ZynqMP:
     clearval = readl(priv->baseaddr + ECC_CLR_OFST) |
     ECC_CTRL_CLR_CE_ERR | ECC_CTRL_CLR_CE_ERRCNT |
     ECC_CTRL_CLR_UE_ERR | ECC_CTRL_CLR_UE_ERRCNT;
     writel(clearval, priv->baseaddr + ECC_CLR_OFST);
     ```

3. **Scope and Risk Assessment**:
   - Changes are confined to the synopsys_edac driver
   - No API changes or interface modifications
   - The refactoring simplifies code by removing duplicate
     `zynq_get_ecc_state()` and `zynqmp_get_ecc_state()` functions
   - Adds platform type enum for cleaner platform identification
   - Risk is minimal as it only affects initialization path

4. **Stable Tree Criteria Compliance**:
   - ✓ Fixes a real bug (stale error reporting)
   - ✓ Small and contained changes (~150 lines)
   - ✓ No new features added
   - ✓ No architectural changes
   - ✓ Low regression risk
   - ✓ Clear fix for a specific problem

5. **Additional Evidence**:
   - The maintainer (Borislav Petkov) accepted and massaged the patch
   - Fixed a compiler warning caught by kernel test robot
   - The bug could affect production systems by showing false ECC errors

This is a textbook example of a stable-worthy patch: it fixes a specific
bug (stale ECC error reporting) with minimal, focused changes that don't
introduce new functionality or risk.

 drivers/edac/synopsys_edac.c | 97 +++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 51 deletions(-)

diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
index e7c18bb61f81..c02ad4f984ad 100644
--- a/drivers/edac/synopsys_edac.c
+++ b/drivers/edac/synopsys_edac.c
@@ -333,20 +333,26 @@ struct synps_edac_priv {
 #endif
 };
 
+enum synps_platform_type {
+	ZYNQ,
+	ZYNQMP,
+	SYNPS,
+};
+
 /**
  * struct synps_platform_data -  synps platform data structure.
+ * @platform:		Identifies the target hardware platform
  * @get_error_info:	Get EDAC error info.
  * @get_mtype:		Get mtype.
  * @get_dtype:		Get dtype.
- * @get_ecc_state:	Get ECC state.
  * @get_mem_info:	Get EDAC memory info
  * @quirks:		To differentiate IPs.
  */
 struct synps_platform_data {
+	enum synps_platform_type platform;
 	int (*get_error_info)(struct synps_edac_priv *priv);
 	enum mem_type (*get_mtype)(const void __iomem *base);
 	enum dev_type (*get_dtype)(const void __iomem *base);
-	bool (*get_ecc_state)(void __iomem *base);
 #ifdef CONFIG_EDAC_DEBUG
 	u64 (*get_mem_info)(struct synps_edac_priv *priv);
 #endif
@@ -721,51 +727,38 @@ static enum dev_type zynqmp_get_dtype(const void __iomem *base)
 	return dt;
 }
 
-/**
- * zynq_get_ecc_state - Return the controller ECC enable/disable status.
- * @base:	DDR memory controller base address.
- *
- * Get the ECC enable/disable status of the controller.
- *
- * Return: true if enabled, otherwise false.
- */
-static bool zynq_get_ecc_state(void __iomem *base)
+static bool get_ecc_state(struct synps_edac_priv *priv)
 {
+	u32 ecctype, clearval;
 	enum dev_type dt;
-	u32 ecctype;
-
-	dt = zynq_get_dtype(base);
-	if (dt == DEV_UNKNOWN)
-		return false;
 
-	ecctype = readl(base + SCRUB_OFST) & SCRUB_MODE_MASK;
-	if ((ecctype == SCRUB_MODE_SECDED) && (dt == DEV_X2))
-		return true;
-
-	return false;
-}
-
-/**
- * zynqmp_get_ecc_state - Return the controller ECC enable/disable status.
- * @base:	DDR memory controller base address.
- *
- * Get the ECC enable/disable status for the controller.
- *
- * Return: a ECC status boolean i.e true/false - enabled/disabled.
- */
-static bool zynqmp_get_ecc_state(void __iomem *base)
-{
-	enum dev_type dt;
-	u32 ecctype;
-
-	dt = zynqmp_get_dtype(base);
-	if (dt == DEV_UNKNOWN)
-		return false;
-
-	ecctype = readl(base + ECC_CFG0_OFST) & SCRUB_MODE_MASK;
-	if ((ecctype == SCRUB_MODE_SECDED) &&
-	    ((dt == DEV_X2) || (dt == DEV_X4) || (dt == DEV_X8)))
-		return true;
+	if (priv->p_data->platform == ZYNQ) {
+		dt = zynq_get_dtype(priv->baseaddr);
+		if (dt == DEV_UNKNOWN)
+			return false;
+
+		ecctype = readl(priv->baseaddr + SCRUB_OFST) & SCRUB_MODE_MASK;
+		if (ecctype == SCRUB_MODE_SECDED && dt == DEV_X2) {
+			clearval = ECC_CTRL_CLR_CE_ERR | ECC_CTRL_CLR_UE_ERR;
+			writel(clearval, priv->baseaddr + ECC_CTRL_OFST);
+			writel(0x0, priv->baseaddr + ECC_CTRL_OFST);
+			return true;
+		}
+	} else {
+		dt = zynqmp_get_dtype(priv->baseaddr);
+		if (dt == DEV_UNKNOWN)
+			return false;
+
+		ecctype = readl(priv->baseaddr + ECC_CFG0_OFST) & SCRUB_MODE_MASK;
+		if (ecctype == SCRUB_MODE_SECDED &&
+		    (dt == DEV_X2 || dt == DEV_X4 || dt == DEV_X8)) {
+			clearval = readl(priv->baseaddr + ECC_CLR_OFST) |
+			ECC_CTRL_CLR_CE_ERR | ECC_CTRL_CLR_CE_ERRCNT |
+			ECC_CTRL_CLR_UE_ERR | ECC_CTRL_CLR_UE_ERRCNT;
+			writel(clearval, priv->baseaddr + ECC_CLR_OFST);
+			return true;
+		}
+	}
 
 	return false;
 }
@@ -935,18 +928,18 @@ static int setup_irq(struct mem_ctl_info *mci,
 }
 
 static const struct synps_platform_data zynq_edac_def = {
+	.platform = ZYNQ,
 	.get_error_info	= zynq_get_error_info,
 	.get_mtype	= zynq_get_mtype,
 	.get_dtype	= zynq_get_dtype,
-	.get_ecc_state	= zynq_get_ecc_state,
 	.quirks		= 0,
 };
 
 static const struct synps_platform_data zynqmp_edac_def = {
+	.platform = ZYNQMP,
 	.get_error_info	= zynqmp_get_error_info,
 	.get_mtype	= zynqmp_get_mtype,
 	.get_dtype	= zynqmp_get_dtype,
-	.get_ecc_state	= zynqmp_get_ecc_state,
 #ifdef CONFIG_EDAC_DEBUG
 	.get_mem_info	= zynqmp_get_mem_info,
 #endif
@@ -958,10 +951,10 @@ static const struct synps_platform_data zynqmp_edac_def = {
 };
 
 static const struct synps_platform_data synopsys_edac_def = {
+	.platform = SYNPS,
 	.get_error_info	= zynqmp_get_error_info,
 	.get_mtype	= zynqmp_get_mtype,
 	.get_dtype	= zynqmp_get_dtype,
-	.get_ecc_state	= zynqmp_get_ecc_state,
 	.quirks         = (DDR_ECC_INTR_SUPPORT | DDR_ECC_INTR_SELF_CLEAR
 #ifdef CONFIG_EDAC_DEBUG
 			  | DDR_ECC_DATA_POISON_SUPPORT
@@ -1393,10 +1386,6 @@ static int mc_probe(struct platform_device *pdev)
 	if (!p_data)
 		return -ENODEV;
 
-	if (!p_data->get_ecc_state(baseaddr)) {
-		edac_printk(KERN_INFO, EDAC_MC, "ECC not enabled\n");
-		return -ENXIO;
-	}
 
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = SYNPS_EDAC_NR_CSROWS;
@@ -1416,6 +1405,12 @@ static int mc_probe(struct platform_device *pdev)
 	priv = mci->pvt_info;
 	priv->baseaddr = baseaddr;
 	priv->p_data = p_data;
+	if (!get_ecc_state(priv)) {
+		edac_printk(KERN_INFO, EDAC_MC, "ECC not enabled\n");
+		rc = -ENODEV;
+		goto free_edac_mc;
+	}
+
 	spin_lock_init(&priv->reglock);
 
 	mc_init(mci, pdev);
-- 
2.39.5



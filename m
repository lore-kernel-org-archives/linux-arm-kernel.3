Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E921DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOGjJkW3Jp7ZQTjs+Fn9AWtKjQyxraz8q0kcog9cj8Q=; b=JGv1Gv3Dn08pKQiHYh3NP8G2am
	tDR0ld0y4b1MN5KDApejkbZPUGbs/5tHhULrKyVvB9IWtsvCNVP2LrtBKBCPXykpgErjc1vpGQF4x
	ISdbylJqlRYxvuJzNF6Xb6Liwgmk00WTPkzbux9KXC4eywTlCJQuMWXhVSwpRz9YeE1UjQgBcCKK2
	9x53Bxxgg51gdTTqXlpS52mLR1QS8UNgIXJGcH3yzmieDLU/XkmF2Mro7uCe7IUrB9GyoBNcGIr5p
	iqkPJqkvgTY0RlQWS7NIQcwLnjRPsjb0iZ1s/3UN7n0F5jDev3h9NS85SShbhV/gHG114XC0DPSXu
	2KU6pwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgtj-0000000BRBo-2mUf;
	Sat, 25 Oct 2025 16:13:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgtd-0000000BR8C-49YJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B13D744983;
	Sat, 25 Oct 2025 16:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611DDC116B1;
	Sat, 25 Oct 2025 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408817;
	bh=ykKpstcD/nFFD4tx9FG9wgDXP6IoofyoYUuh6BLPYos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Art3gyvDW7YsLgQ5MxH+GlcxwIzMPREX21vtGRhHmDvVZQ726tFnJwKu9xbWSffg0
	 n9k2ivCgkAoXufNNPf667R/D2HEGklyhCxdXzaTf34cVaMwRC9gGtwbA51NPEyfGmF
	 tQOL7dfb4svQH8NOI4FfEbvVxSYE3QtitM7jFCAV6B55twSUHxJ/ixZ7jCyeaIhFKd
	 T7OVkS1Q7hV7kQAhAeMs7OLBnJFuYEWLmQtzrjWRVvBx51I13GW/XOMwWE6UxQd4QY
	 BWGsjhVG80hC4JPz6H8WbbsN23jSqTU+skGN4y+YTdkARwUNvcADNCSwxYCIrN46/F
	 IKLBa5XHnSv/A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.6] iio: adc: imx93_adc: load calibrated values even calibration failed
Date: Sat, 25 Oct 2025 11:55:13 -0400
Message-ID: <20251025160905.3857885-82-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_091338_213190_15ABC142 
X-CRM114-Status: GOOD (  21.67  )
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

From: Haibo Chen <haibo.chen@nxp.com>

[ Upstream commit 12c9b09e981ab14ebec8e4eefa946cbd26dd306b ]

ADC calibration might fail because of the noise on reference voltage.
To avoid calibration fail, need to meet the following requirement:
    ADC reference voltage Noise < 1.8V * 1/2^ENOB

For the case which the ADC reference voltage on board do not meet
the requirement, still load the calibrated values, so ADC can also
work but maybe not that accurate.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
Link: https://patch.msgid.link/20250812-adc-v2-2-0260833f13b8@nxp.com
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation
- Problem addressed: On some boards the i.MX93 ADC calibration fails due
  to reference voltage noise (commit message). In the current code, a
  calibration failure aborts driver probe, leaving the ADC unusable for
  users.
- Current failure path: `imx93_adc_calibration()` returns `-EAGAIN` on
  calibration failure, explicitly powering down the ADC and aborting
  probe:
  - Failure check/return: drivers/iio/adc/imx93_adc.c:181 (checks
    `IMX93_ADC_MSR_CALFAIL_MASK`) and drivers/iio/adc/imx93_adc.c:185
    (returns `-EAGAIN`).
  - Probe abort on error: drivers/iio/adc/imx93_adc.c:367 (calibration
    call) and drivers/iio/adc/imx93_adc.c:368–396 (error unwinding).
- What the patch changes:
  - Adds `IMX93_ADC_CALCFG0` (0x3A0) and `IMX93_ADC_CALCFG0_LDFAIL_MASK`
    (BIT(4)) so the driver can instruct hardware to load calibrated
    values even if calibration “fails”.
  - In `imx93_adc_calibration()` (drivers/iio/adc/imx93_adc.c:146),
    before starting calibration, it writes
    `IMX93_ADC_CALCFG0_LDFAIL_MASK` to `IMX93_ADC_CALCFG0` to enable
    “load-on-fail”.
  - It changes the failure handling on `CALFAIL`: instead of returning
    `-EAGAIN`, it logs a warning and continues, allowing the driver to
    register and the ADC to function, albeit with potentially reduced
    accuracy.
  - The timeout path remains unchanged and still returns an error if
    calibration never completes (drivers/iio/adc/imx93_adc.c:171–178),
    preserving safety for a hard failure.
- User impact: This is a practical fix for real boards where Vref noise
  is above the stated threshold; without it, the ADC never comes up.
  With it, the ADC works (possibly with lower accuracy), which is
  typically preferable to complete unavailability.
- Scope and risk:
  - Small, contained change in a single driver
    (`drivers/iio/adc/imx93_adc.c`) with no ABI or framework changes.
  - No architectural refactoring; only adds a register define and a
    single bit write plus relaxed error handling.
  - Timeout/hard-error behavior is unchanged; only soft failure
    (CALFAIL) behavior is relaxed.
  - The driver matches only `nxp,imx93-adc`
    (drivers/iio/adc/imx93_adc.c:465–469), so the change is isolated to
    this hardware.
- Stable criteria:
  - Fixes a user-visible bug (driver failing to probe on noisy Vref
    boards).
  - Minimal and low risk; confined to probe/calibration logic.
  - No new features; behavior change is a robustness fix with guarded
    warning.
  - No broader side effects beyond this ADC device.

Given these points, this is a solid candidate for backporting to any
stable trees that contain the i.MX93 ADC driver and its current fail-
hard calibration path.

 drivers/iio/adc/imx93_adc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/imx93_adc.c b/drivers/iio/adc/imx93_adc.c
index 7feaafd2316f2..9f1546c3d39d5 100644
--- a/drivers/iio/adc/imx93_adc.c
+++ b/drivers/iio/adc/imx93_adc.c
@@ -38,6 +38,7 @@
 #define IMX93_ADC_PCDR6		0x118
 #define IMX93_ADC_PCDR7		0x11c
 #define IMX93_ADC_CALSTAT	0x39C
+#define IMX93_ADC_CALCFG0	0x3A0
 
 /* ADC bit shift */
 #define IMX93_ADC_MCR_MODE_MASK			BIT(29)
@@ -58,6 +59,8 @@
 #define IMX93_ADC_IMR_ECH_MASK			BIT(0)
 #define IMX93_ADC_PCDR_CDATA_MASK		GENMASK(11, 0)
 
+#define IMX93_ADC_CALCFG0_LDFAIL_MASK		BIT(4)
+
 /* ADC status */
 #define IMX93_ADC_MSR_ADCSTATUS_IDLE			0
 #define IMX93_ADC_MSR_ADCSTATUS_POWER_DOWN		1
@@ -145,7 +148,7 @@ static void imx93_adc_config_ad_clk(struct imx93_adc *adc)
 
 static int imx93_adc_calibration(struct imx93_adc *adc)
 {
-	u32 mcr, msr;
+	u32 mcr, msr, calcfg;
 	int ret;
 
 	/* make sure ADC in power down mode */
@@ -158,6 +161,11 @@ static int imx93_adc_calibration(struct imx93_adc *adc)
 
 	imx93_adc_power_up(adc);
 
+	/* Enable loading of calibrated values even in fail condition */
+	calcfg = readl(adc->regs + IMX93_ADC_CALCFG0);
+	calcfg |= IMX93_ADC_CALCFG0_LDFAIL_MASK;
+	writel(calcfg, adc->regs + IMX93_ADC_CALCFG0);
+
 	/*
 	 * TODO: we use the default TSAMP/NRSMPL/AVGEN in MCR,
 	 * can add the setting of these bit if need in future.
@@ -180,9 +188,13 @@ static int imx93_adc_calibration(struct imx93_adc *adc)
 	/* check whether calbration is success or not */
 	msr = readl(adc->regs + IMX93_ADC_MSR);
 	if (msr & IMX93_ADC_MSR_CALFAIL_MASK) {
+		/*
+		 * Only give warning here, this means the noise of the
+		 * reference voltage do not meet the requirement:
+		 *     ADC reference voltage Noise < 1.8V * 1/2^ENOB
+		 * And the resault of ADC is not that accurate.
+		 */
 		dev_warn(adc->dev, "ADC calibration failed!\n");
-		imx93_adc_power_down(adc);
-		return -EAGAIN;
 	}
 
 	return 0;
-- 
2.51.0



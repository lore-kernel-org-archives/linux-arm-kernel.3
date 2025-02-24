Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4078C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cs7t9yYlqzv4YN0HD7elj1semSKrTp6ZNSbNhngTkWU=; b=LwiLnjp20O+B+gXDk3F7raAJcA
	oV3nnqcgwQW0VngE6McBnp1VwI2EWLOCRRLIv/I7HtYIKxP74tNz2gtnW1J2rKtlrY+vPCrc1VY7r
	6HO+EWGWX367J01c/RciMVP5avIN5NSKUagPI3PreH/hAZMPXr9hLutcdqevsJA2ftXPrFgARMn78
	2bjoC1DEuHfFlJHACrnWkayim8KHAunJflJjG5qqdjyyqC2AFRiOZAcNuX8scOgGgMtMn9svM4rRf
	1nKKb4JpDnYotNuk+RJNwlBkXreUQFYl9/Pp7o2SMu/3yH6tOMu9TaYcnxm+v7TXVGKBkc5e08IZE
	770TgiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd8P-0000000EnKp-2ixa;
	Mon, 24 Feb 2025 18:24:53 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcyD-0000000ElFW-04ji
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:14:22 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OHE4Y5028322;
	Mon, 24 Feb 2025 19:14:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	cs7t9yYlqzv4YN0HD7elj1semSKrTp6ZNSbNhngTkWU=; b=8Yzg+y7UWMflXClg
	obv1uTwhz+bq4xUET27pnNg+kvad923XGuYQna/LEey+LqdTk47GES+4UfOFrLwh
	sVzG2nLRMsOBY7Ew9A+gvHT0Uhj1nIs1YeoE7QDLvGWaf02hcFSHpIezRLcDMJ0a
	tfHh1Y+W5lJQtCwKVbx+OvIE8Mfe86BepLjf8TAMDvmOVmu1IXF2uHHs15Gaawc6
	VRREwRQwJ8mjwUNu6R2x2DlS0uWtSQE+HuQiX6aYhc7NRYJAEgDcKCMfEGsFhHYQ
	KEpGPpc4BeZQSxYr+iTgpoxu4B/8GOKgFNEKUhVbz1f5SfvcXa33r6Hl91b+Eyz1
	RkFx6Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ytdn68f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 19:14:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ED66B40079;
	Mon, 24 Feb 2025 19:12:29 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8323B545158;
	Mon, 24 Feb 2025 19:02:31 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 19:02:31 +0100
Received: from localhost (10.252.23.75) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 19:02:31 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH 2/8] mfd: stm32-lptimer: add support for stm32mp25
Date: Mon, 24 Feb 2025 19:01:44 +0100
Message-ID: <20250224180150.3689638-3-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.23.75]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_09,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_101421_349325_8F9F233B 
X-CRM114-Status: GOOD (  20.70  )
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

Add support for STM32MP25 SoC. Use newly introduced compatible, to handle
new features along with registers and bits diversity.

A new hardware configuration register (HWCFGR2) has been added, to gather
number of capture/compare channels, autonomous mode and input capture
capability. The full feature set is implemented in LPTIM1/2/3/4. LPTIM5
supports a smaller set of features. This can now be read from HWCFGR
registers.

Add new registers to the stm32-lptimer.h: CCMR1, CCR2 and HWCFGR1/2.
Update the stm32_lptimer data struct so signal the number of
capture/compare channels to the child devices.
Also Remove some unused bit masks (CMPOK_ARROK / CMPOKCF_ARROKCF).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/mfd/stm32-lptimer.c       | 30 ++++++++++++++++++++++++++++-
 include/linux/mfd/stm32-lptimer.h | 32 +++++++++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/stm32-lptimer.c b/drivers/mfd/stm32-lptimer.c
index b2704a9809c7..e5a9ceb78c10 100644
--- a/drivers/mfd/stm32-lptimer.c
+++ b/drivers/mfd/stm32-lptimer.c
@@ -6,6 +6,7 @@
  * Inspired by Benjamin Gaignard's stm32-timers driver
  */
 
+#include <linux/bitfield.h>
 #include <linux/mfd/stm32-lptimer.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -49,6 +50,32 @@ static int stm32_lptimer_detect_encoder(struct stm32_lptimer *ddata)
 	return 0;
 }
 
+static int stm32_lptimer_detect_hwcfgr(struct stm32_lptimer *ddata)
+{
+	u32 val;
+	int ret;
+
+	/* Try to guess parameters from HWCFGR: e.g. encodrer mode (STM32MP15) */
+	ret = regmap_read(ddata->regmap, STM32MP15_LPTIM_HWCFGR, &val);
+	if (ret)
+		return ret;
+
+	/* Fallback to legacy init if HWCFGR isn't present */
+	if (!val)
+		return stm32_lptimer_detect_encoder(ddata);
+
+	ddata->has_encoder = FIELD_GET(STM32MP15_LPTIM_HWCFGR_ENCODER, val);
+
+	ret = regmap_read(ddata->regmap, STM32MP25_LPTIM_HWCFGR2, &val);
+	if (ret)
+		return ret;
+
+	/* Number of capture/compare channels */
+	ddata->num_cc_chans = FIELD_GET(STM32MP25_LPTIM_HWCFGR2_CHAN_NUM, val);
+
+	return 0;
+}
+
 static int stm32_lptimer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -73,7 +100,7 @@ static int stm32_lptimer_probe(struct platform_device *pdev)
 	if (IS_ERR(ddata->clk))
 		return PTR_ERR(ddata->clk);
 
-	ret = stm32_lptimer_detect_encoder(ddata);
+	ret = stm32_lptimer_detect_hwcfgr(ddata);
 	if (ret)
 		return ret;
 
@@ -84,6 +111,7 @@ static int stm32_lptimer_probe(struct platform_device *pdev)
 
 static const struct of_device_id stm32_lptimer_of_match[] = {
 	{ .compatible = "st,stm32-lptimer", },
+	{ .compatible = "st,stm32mp25-lptimer", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_lptimer_of_match);
diff --git a/include/linux/mfd/stm32-lptimer.h b/include/linux/mfd/stm32-lptimer.h
index 06d3f11dc3c9..b9da7d0d2a36 100644
--- a/include/linux/mfd/stm32-lptimer.h
+++ b/include/linux/mfd/stm32-lptimer.h
@@ -17,18 +17,26 @@
 #define STM32_LPTIM_IER		0x08	/* Interrupt Enable Reg      */
 #define STM32_LPTIM_CFGR	0x0C	/* Configuration Reg         */
 #define STM32_LPTIM_CR		0x10	/* Control Reg               */
-#define STM32_LPTIM_CMP		0x14	/* Compare Reg               */
+#define STM32_LPTIM_CMP		0x14	/* Compare Reg (CCR1 on mp25) */
 #define STM32_LPTIM_ARR		0x18	/* Autoreload Reg            */
 #define STM32_LPTIM_CNT		0x1C	/* Counter Reg               */
+#define STM32MP25_LPTIM_CCMR1	0x2C	/* Capture/Compare Mode Reg  */
+#define STM32MP25_LPTIM_CCR2	0x34	/* Compare Reg2              */
+
+#define STM32MP25_LPTIM_HWCFGR2	0x3EC	/* Hardware configuration register 2 */
+#define STM32MP15_LPTIM_HWCFGR	0x3F0	/* Hardware configuration register 1 */
+#define STM32MP15_LPTIM_VERR	0x3F4	/* Version identification register   */
 
 /* STM32_LPTIM_ISR - bit fields */
+#define STM32_LPTIM_CMP2_ARROK		(BIT(19) | BIT(4))
 #define STM32_LPTIM_CMPOK_ARROK		GENMASK(4, 3)
 #define STM32_LPTIM_ARROK		BIT(4)
 #define STM32_LPTIM_CMPOK		BIT(3)
 
 /* STM32_LPTIM_ICR - bit fields */
-#define STM32_LPTIM_ARRMCF		BIT(1)
+#define STM32_LPTIM_CMP2OKCF_ARROKCF	(BIT(19) | BIT(4))
 #define STM32_LPTIM_CMPOKCF_ARROKCF	GENMASK(4, 3)
+#define STM32_LPTIM_ARRMCF		BIT(1)
 
 /* STM32_LPTIM_IER - bit flieds */
 #define STM32_LPTIM_ARRMIE	BIT(1)
@@ -53,16 +61,36 @@
 /* STM32_LPTIM_ARR */
 #define STM32_LPTIM_MAX_ARR	0xFFFF
 
+/* STM32MP25_LPTIM_CCMR1 */
+#define STM32MP25_LPTIM_CC2P	GENMASK(19, 18)
+#define STM32MP25_LPTIM_CC2E	BIT(17)
+#define STM32MP25_LPTIM_CC2SEL	BIT(16)
+#define STM32MP25_LPTIM_CC1P	GENMASK(3, 2)
+#define STM32MP25_LPTIM_CC1E	BIT(1)
+#define STM32MP25_LPTIM_CC1SEL	BIT(0)
+
+/* STM32MP15_LPTIM_HWCFGR */
+#define STM32MP15_LPTIM_HWCFGR_ENCODER	BIT(16)
+
+/* STM32MP25_LPTIM_HWCFGR2 */
+#define STM32MP25_LPTIM_HWCFGR2_CHAN_NUM	GENMASK(3, 0)
+
+/* STM32MP15_LPTIM_VERR */
+#define STM32MP15_MINREV_MASK		GENMASK(3, 0)
+#define STM32MP15_MAJREV_MASK		GENMASK(7, 4)
+
 /**
  * struct stm32_lptimer - STM32 Low-Power Timer data assigned by parent device
  * @clk: clock reference for this instance
  * @regmap: register map reference for this instance
  * @has_encoder: indicates this Low-Power Timer supports encoder mode
+ * @num_cc_chans: indicates the number of capture/compare channels
  */
 struct stm32_lptimer {
 	struct clk *clk;
 	struct regmap *regmap;
 	bool has_encoder;
+	unsigned int num_cc_chans;
 };
 
 #endif
-- 
2.25.1



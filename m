Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC49DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fxe+1BqeMw88KkIco0sHqplA8QMWdxh1ONHDTZ6Mzls=; b=p94BOx2OjYdOFf6mq2Xwkgo+lN
	oxMoyDB6jyjdnjjwKFivOVhz/LQjrFewruRR1E3xJ2vTbx+hujiqwKSyHh0RmfMLITF1bpSR1F/UK
	ml0CVfXVOdxOslggZ2dXq4SAOPvpxA3n0eHzQP7B8RqNUuOQy09YXt+fYhCTBnPSxhRAtFo39ixue
	+a8bvuciMQLH27xcfnaIdj9HPbSWSqXpp4DToKrOkfQwRMtw3Sr2BoP67AKsCXcTed6hJklvCaQ3f
	zpnRbcFrHQQ1SO0RiQnEkxbBP9T3VkVvZqess/CKj7YTEgAtN3kFy/9zBEU103HpnS4aQuWzWxBTJ
	gMp93jFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt95o-0000000EvVt-3nWT;
	Fri, 14 Mar 2025 17:45:08 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8vc-0000000Et6o-2hzb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:34:38 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EEjmbX003926;
	Fri, 14 Mar 2025 18:34:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Fxe+1BqeMw88KkIco0sHqplA8QMWdxh1ONHDTZ6Mzls=; b=WGU9xbYaKLNEOuGL
	y0U8qc7X8WjIIQDLmGl5di9XXmw9rMg2BSdHa6jsBVAJR2H1Tgb9ewnYBgtC1ie/
	xYVpFaQOSTX0O6u3NB6RqAaMwRV8Mf3FTC6MKv5tWQWitYMJASY5RsfMV6LAOBQZ
	6gjzIcNgtz9ixvX1BaEM2y1y6+ViAf7kTOtd18PWiiP4G9nEI8ftlhjVJJRCjkzm
	fijz7x1utZp5CD4GrUxKDRIVR8e0ghSOkfTpNOnsKcQGX0+4A379iLTL6s/yXEo8
	O/X7eI4JFC4T8SqRNpBdGLTtUXpU5KZwJObbivmu2HU9/dw3jeAsScWI+jCE5/TG
	IyPHfg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45c2pf5ee2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 18:34:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4560540062;
	Fri, 14 Mar 2025 18:33:04 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94AAF6D8E74;
	Fri, 14 Mar 2025 18:15:05 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 18:15:05 +0100
Received: from localhost (10.252.1.141) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 18:15:05 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jic23@kernel.org>,
        <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <robh@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v4 2/8] mfd: stm32-lptimer: add support for stm32mp25
Date: Fri, 14 Mar 2025 18:14:45 +0100
Message-ID: <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.1.141]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_103436_989963_794BCE88 
X-CRM114-Status: GOOD (  21.38  )
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

Add support for STM32MP25 SoC.
A new hardware configuration register (HWCFGR2) has been added, to gather
number of capture/compare channels, autonomous mode and input capture
capability. The full feature set is implemented in LPTIM1/2/3/4. LPTIM5
supports a smaller set of features. This can now be read from HWCFGR
registers.

Add new registers to the stm32-lptimer.h: CCMR1, CCR2, HWCFGR1/2 and VERR.
Update the stm32_lptimer data struct so signal the number of
capture/compare channels to the child devices.
Also Remove some unused bit masks (CMPOK_ARROK / CMPOKCF_ARROKCF).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in V4:
- Add DIEROK, ARROK status flags, and their clear flags.
Changes in V2:
- rely on fallback compatible as no specific .data is associated to the
  driver. Compatibility is added by reading hardware configuration
  registers.
- read version register, to be used by clockevent child driver
- rename register/bits definitions
---
 drivers/mfd/stm32-lptimer.c       | 33 ++++++++++++++++++++++++++-
 include/linux/mfd/stm32-lptimer.h | 37 ++++++++++++++++++++++++++++---
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/stm32-lptimer.c b/drivers/mfd/stm32-lptimer.c
index b2704a9809c7..09073dbc9c80 100644
--- a/drivers/mfd/stm32-lptimer.c
+++ b/drivers/mfd/stm32-lptimer.c
@@ -6,6 +6,7 @@
  * Inspired by Benjamin Gaignard's stm32-timers driver
  */
 
+#include <linux/bitfield.h>
 #include <linux/mfd/stm32-lptimer.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -49,6 +50,36 @@ static int stm32_lptimer_detect_encoder(struct stm32_lptimer *ddata)
 	return 0;
 }
 
+static int stm32_lptimer_detect_hwcfgr(struct stm32_lptimer *ddata)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read(ddata->regmap, STM32_LPTIM_VERR, &ddata->version);
+	if (ret)
+		return ret;
+
+	/* Try to guess parameters from HWCFGR: e.g. encoder mode (STM32MP15) */
+	ret = regmap_read(ddata->regmap, STM32_LPTIM_HWCFGR1, &val);
+	if (ret)
+		return ret;
+
+	/* Fallback to legacy init if HWCFGR isn't present */
+	if (!val)
+		return stm32_lptimer_detect_encoder(ddata);
+
+	ddata->has_encoder = FIELD_GET(STM32_LPTIM_HWCFGR1_ENCODER, val);
+
+	ret = regmap_read(ddata->regmap, STM32_LPTIM_HWCFGR2, &val);
+	if (ret)
+		return ret;
+
+	/* Number of capture/compare channels */
+	ddata->num_cc_chans = FIELD_GET(STM32_LPTIM_HWCFGR2_CHAN_NUM, val);
+
+	return 0;
+}
+
 static int stm32_lptimer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -73,7 +104,7 @@ static int stm32_lptimer_probe(struct platform_device *pdev)
 	if (IS_ERR(ddata->clk))
 		return PTR_ERR(ddata->clk);
 
-	ret = stm32_lptimer_detect_encoder(ddata);
+	ret = stm32_lptimer_detect_hwcfgr(ddata);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/mfd/stm32-lptimer.h b/include/linux/mfd/stm32-lptimer.h
index 06d3f11dc3c9..a592c8dc716d 100644
--- a/include/linux/mfd/stm32-lptimer.h
+++ b/include/linux/mfd/stm32-lptimer.h
@@ -17,20 +17,30 @@
 #define STM32_LPTIM_IER		0x08	/* Interrupt Enable Reg      */
 #define STM32_LPTIM_CFGR	0x0C	/* Configuration Reg         */
 #define STM32_LPTIM_CR		0x10	/* Control Reg               */
-#define STM32_LPTIM_CMP		0x14	/* Compare Reg               */
+#define STM32_LPTIM_CMP		0x14	/* Compare Reg (MP25 CCR1)   */
 #define STM32_LPTIM_ARR		0x18	/* Autoreload Reg            */
 #define STM32_LPTIM_CNT		0x1C	/* Counter Reg               */
+#define STM32_LPTIM_CCMR1	0x2C	/* Capture/Compare Mode MP25 */
+#define STM32_LPTIM_CCR2	0x34	/* Compare Reg2 MP25         */
+
+#define STM32_LPTIM_HWCFGR2	0x3EC	/* Hardware configuration register 2 - MP25 */
+#define STM32_LPTIM_HWCFGR1	0x3F0	/* Hardware configuration register 1 - MP15 */
+#define STM32_LPTIM_VERR	0x3F4	/* Version identification register - MP15 */
 
 /* STM32_LPTIM_ISR - bit fields */
+#define STM32_LPTIM_DIEROK_ARROK	(BIT(24) | BIT(4)) /* MP25 */
+#define STM32_LPTIM_CMP2_ARROK		(BIT(19) | BIT(4))
 #define STM32_LPTIM_CMPOK_ARROK		GENMASK(4, 3)
 #define STM32_LPTIM_ARROK		BIT(4)
 #define STM32_LPTIM_CMPOK		BIT(3)
 
 /* STM32_LPTIM_ICR - bit fields */
-#define STM32_LPTIM_ARRMCF		BIT(1)
+#define STM32_LPTIM_DIEROKCF_ARROKCF	(BIT(24) | BIT(4)) /* MP25 */
+#define STM32_LPTIM_CMP2OKCF_ARROKCF	(BIT(19) | BIT(4))
 #define STM32_LPTIM_CMPOKCF_ARROKCF	GENMASK(4, 3)
+#define STM32_LPTIM_ARRMCF		BIT(1)
 
-/* STM32_LPTIM_IER - bit flieds */
+/* STM32_LPTIM_IER - bit fields */
 #define STM32_LPTIM_ARRMIE	BIT(1)
 
 /* STM32_LPTIM_CR - bit fields */
@@ -53,16 +63,37 @@
 /* STM32_LPTIM_ARR */
 #define STM32_LPTIM_MAX_ARR	0xFFFF
 
+/* STM32_LPTIM_CCMR1 */
+#define STM32_LPTIM_CC2P	GENMASK(19, 18)
+#define STM32_LPTIM_CC2E	BIT(17)
+#define STM32_LPTIM_CC2SEL	BIT(16)
+#define STM32_LPTIM_CC1P	GENMASK(3, 2)
+#define STM32_LPTIM_CC1E	BIT(1)
+#define STM32_LPTIM_CC1SEL	BIT(0)
+
+/* STM32_LPTIM_HWCFGR1 */
+#define STM32_LPTIM_HWCFGR1_ENCODER	BIT(16)
+
+/* STM32_LPTIM_HWCFGR2 */
+#define STM32_LPTIM_HWCFGR2_CHAN_NUM	GENMASK(3, 0)
+
+/* STM32_LPTIM_VERR */
+#define STM32_LPTIM_VERR_23	0x23	/* STM32MP25 */
+
 /**
  * struct stm32_lptimer - STM32 Low-Power Timer data assigned by parent device
  * @clk: clock reference for this instance
  * @regmap: register map reference for this instance
  * @has_encoder: indicates this Low-Power Timer supports encoder mode
+ * @num_cc_chans: indicates the number of capture/compare channels
+ * @version: indicates the major and minor revision of the controller
  */
 struct stm32_lptimer {
 	struct clk *clk;
 	struct regmap *regmap;
 	bool has_encoder;
+	unsigned int num_cc_chans;
+	u32 version;
 };
 
 #endif
-- 
2.25.1



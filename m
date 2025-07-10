Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF736C83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kVCapFGdG0gRHQhSRUGUM3fGitSOZCS1rMndaGOheE=; b=pBZwSMpldSawXpNf5HvKC22PHC
	n6UHOiyQ9k2KQPM9g8SK18PZieDxvsuWHQKMF1e68zHU8Awu3JKwRsXfx9N4CBHUZsMjvA9xRGnZi
	7maKUMWmJepAwRE+Urok6FZwWxfvkKYrq3VJ+4HvLpM3FShw+5rbSHX8o+HcZbL4EysadOmmD792k
	38FhIY5NAlyeEA+kppauC5un/QYa2qgJJRzgYXhdtdXsvblb8+Ru7AwEveMRRP497C+L9npg9fmI9
	yOa4s23D5ZYqykKn4TnNl1rm0c7ZAwejpHSuLOhI8yOwrql/HFyMp+5nc2eT3THrDpiKe+6HjNftB
	yaf4G5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZn8I-0000000BGOu-3zdz;
	Thu, 10 Jul 2025 08:59:58 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZls7-0000000B2Ta-26RA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7kVCapFGdG0gRHQhSRUGUM3fGitSOZCS1rMndaGOheE=; b=p5XXN1fiONAQE6w4z3DXP0epP3
	W+0AnvD6kwo2+3JjLjBxGY2ZrvM47itZ94wu+zku2xmM+4D6/vm4TXUrKSb2vXZfCC++9LgTPxlu7
	sdnw8HXmtXvnJg6IEjUkrfcrocttP/kyWabdAUk39VKA2jbvUkSQp+4JLp2bx8AuPNg+nmL7672Nq
	BjxBJpWBc86PA5La/Vh9VTAIO3Rp5lq/YwnJLbJ6NM/p4ZmXyjBM4h2JokBH3C8qfFO1LcoBlnSPX
	dWNPrFbMPwzQdVQDAddi2AScEMrk6sluM2CbzgTQleOJ1NpzapCXPyQUWdXCTuZPbTLy9T75I0kiG
	nmfSMtug==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:48064 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uZls3-006IV5-1A;
	Thu, 10 Jul 2025 09:39:06 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Haibo Chen <haibo.chen@nxp.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH 2/2] iio: adc: imx93: Make calibration parameters configurable
Date: Thu, 10 Jul 2025 09:39:04 +0200
Message-Id: <20250710073905.1105417-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710073905.1105417-1-primoz.fiser@norik.com>
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_003911_997137_2722476F 
X-CRM114-Status: GOOD (  10.42  )
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

From: Andrej Picej <andrej.picej@norik.com>

Make i.MX93 ADC calibration parameters:
 - AVGEN: Enable calibration averaging function,
 - NRSMPL: Select number of calibration samples,
 - TSAMP: Select sample time of calibration conversions,

in the MCR register configurable with the corresponding device-tree
properties:
 - nxp,calib-avg-en,
 - nxp,calib-nr-samples and
 - nxp,calib-t-sample.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/iio/adc/imx93_adc.c | 75 ++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/imx93_adc.c b/drivers/iio/adc/imx93_adc.c
index 7feaafd2316f..da9b5c179240 100644
--- a/drivers/iio/adc/imx93_adc.c
+++ b/drivers/iio/adc/imx93_adc.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/property.h>
 
 #define IMX93_ADC_DRIVER_NAME	"imx93-adc"
 
@@ -43,6 +44,9 @@
 #define IMX93_ADC_MCR_MODE_MASK			BIT(29)
 #define IMX93_ADC_MCR_NSTART_MASK		BIT(24)
 #define IMX93_ADC_MCR_CALSTART_MASK		BIT(14)
+#define IMX93_ADC_MCR_AVGEN_MASK		BIT(13)
+#define IMX93_ADC_MCR_NRSMPL_MASK		GENMASK(12, 11)
+#define IMX93_ADC_MCR_TSAMP_MASK		GENMASK(10, 9)
 #define IMX93_ADC_MCR_ADCLKSE_MASK		BIT(8)
 #define IMX93_ADC_MCR_PWDN_MASK			BIT(0)
 #define IMX93_ADC_MSR_CALFAIL_MASK		BIT(30)
@@ -145,7 +149,7 @@ static void imx93_adc_config_ad_clk(struct imx93_adc *adc)
 
 static int imx93_adc_calibration(struct imx93_adc *adc)
 {
-	u32 mcr, msr;
+	u32 mcr, msr, val, reg;
 	int ret;
 
 	/* make sure ADC in power down mode */
@@ -156,12 +160,73 @@ static int imx93_adc_calibration(struct imx93_adc *adc)
 	mcr &= ~FIELD_PREP(IMX93_ADC_MCR_ADCLKSE_MASK, 1);
 	writel(mcr, adc->regs + IMX93_ADC_MCR);
 
-	imx93_adc_power_up(adc);
-
 	/*
-	 * TODO: we use the default TSAMP/NRSMPL/AVGEN in MCR,
-	 * can add the setting of these bit if need in future.
+	 * Optionally configure desired ADC calibration settings in MCR
+	 * - MCR[AVGEN]: Enable/disable calibration averaging function (default: on)
+	 * - MCR[NRSMPL]: Select the number of calibration samples (default: 512)
+	 * - MCR[TSAMP]: Select sample time of calibration conversions (default: 22)
 	 */
+	ret = device_property_read_u32(adc->dev, "nxp,calib-avg-en", &val);
+	if (!ret) {
+		if (val != 0 && val != 1) {
+			dev_err(adc->dev, "invalid nxp,calib-avg-en: %d\n", val);
+			return -EINVAL;
+		}
+		reg = val;
+		mcr &= ~IMX93_ADC_MCR_AVGEN_MASK;
+		mcr |= FIELD_PREP(IMX93_ADC_MCR_AVGEN_MASK, reg);
+	}
+
+	ret = device_property_read_u32(adc->dev, "nxp,calib-nr-samples", &val);
+	if (!ret) {
+		switch (val) {
+		case 16:
+			reg = 0x0;
+			break;
+		case 32:
+			reg = 0x1;
+			break;
+		case 128:
+			reg = 0x2;
+			break;
+		case 512:
+			reg = 0x3;
+			break;
+		default:
+			dev_err(adc->dev, "invalid nxp,calib-nr-samples: %d\n", val);
+			return -EINVAL;
+		}
+		mcr &= ~IMX93_ADC_MCR_NRSMPL_MASK;
+		mcr |= FIELD_PREP(IMX93_ADC_MCR_NRSMPL_MASK, reg);
+	}
+
+	ret = device_property_read_u32(adc->dev, "nxp,calib-t-sample", &val);
+	if (!ret) {
+		switch (val) {
+		case 8:
+			reg = 0x1;
+			break;
+		case 16:
+			reg = 0x2;
+			break;
+		case 22:
+			reg = 0x0;
+			break;
+		case 32:
+			reg = 0x3;
+			break;
+		default:
+			dev_err(adc->dev, "invalid nxp,calib-t-sample: %d\n", val);
+			return -EINVAL;
+		}
+		mcr &= ~IMX93_ADC_MCR_TSAMP_MASK;
+		mcr |= FIELD_PREP(IMX93_ADC_MCR_TSAMP_MASK, reg);
+	}
+
+	/* write calibration settings to MCR */
+	writel(mcr, adc->regs + IMX93_ADC_MCR);
+
+	imx93_adc_power_up(adc);
 
 	/* run calibration */
 	mcr = readl(adc->regs + IMX93_ADC_MCR);
-- 
2.34.1



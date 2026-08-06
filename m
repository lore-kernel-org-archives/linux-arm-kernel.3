Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7D1C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQ3q5oQkI2bWg1M1o7+xk+SkmJtF+QCSqDyWyw94Zuc=; b=SdiFRxFQIipvEoLpn/XHIT5hZj
	HkUal+nu8u2T6EwX5ZK4eHPZEGnm0BA1FmhYTZ2didggbFHxpoPixJ5e0zZbwTgAdpchHLdDjA0Fn
	1zfyZIBEc4mAh5BbP+bPCaBvai6Iv/iFaGLYXEV3Rjxqdf6lhFMCbE8pxUyjx1k2xOVQ60cDv06rB
	8fiXQHLZYWqiVH7e6fVRHX8R7/T282F4jc7HHThKoH0yNAUyqG1Gmi25zdp2OiFTlT89D/8Njsq5F
	YPgyZNBDGRLt+cx+mfkcS1wJxmNiTe2VtB4lgYcNVctD37cPl0lPCAe/dd2phJodnX1RoiJpebvtX
	cBuLNgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtlf-00000005Hoo-1M2J;
	Thu, 06 Aug 2026 08:47:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtlc-00000005Hmy-2Ej8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786006076; x=1817542076;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9TV+tsofy6TCtX8zVKSBqg0wGh2pcJEEZrqQnPraG7U=;
  b=wyeVV8TnUjaobRPsgxLygP9zF3gxfe2qXZyYEj5l+h9Ev8ZrgtPfdrkO
   CFOoEP5Kh0S3F9s5Ug2ZRbHW8IWcd4d8HhD6ojBZr4PUZ/VQkfsQQk8LT
   YCgvC9/aoXb4bhDi+VdNF7Ndc3L3OHSDbvctjmm7e30rahMPD06AMv9oz
   FyFkcxFipWPnMmgUvgK+0aBQAfNU9YmF21WmY+goH/0lfW5h/q1G/EgSi
   l6yGuUuZFGeusLTQ4VWxmYmQF51D+VUeqQ+jYx2gwRFfbpIryCI700LvI
   wy4Q5ST+jPmK2pLaqVoc61rAvhUDfCfcbNohZFKKGJodpzmdMjv/JCHIw
   w==;
X-CSE-ConnectionGUID: dLx6FcJJTU68ufzJ4BcPDg==
X-CSE-MsgGUID: 3Sl4veB/RH+ZX1I+jniI1g==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="60854103"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Aug 2026 01:47:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 6 Aug 2026 01:47:54 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 01:47:45 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 07/17] iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65
Date: Thu, 6 Aug 2026 13:10:14 +0530
Message-ID: <20260806074024.531259-8-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806074024.531259-1-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014756_631611_53E413D8 
X-CRM114-Status: GOOD (  14.57  )
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

Add support for sama7d65 ADC. The differences are highlighted with the
compatible. The calibration data layout is the main difference.

Update Kconfig help text to mention SAMA7 SoC family support.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/Kconfig            |  2 +-
 drivers/iio/adc/at91-sama5d2_adc.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 3755a81c1efd..85b443853a08 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -647,7 +647,7 @@ config AT91_SAMA5D2_ADC
 	select IIO_TRIGGERED_BUFFER
 	help
 	  Say yes here to build support for Atmel SAMA5D2 ADC which is
-	  available on SAMA5D2 SoC family.
+	  available on SAMA5D2 and SAMA7 SoC families.
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called at91-sama5d2_adc.
diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 3e9feb824a66..c1e5139a058c 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -528,6 +528,15 @@ static const struct at91_adc_temp_calib_layout sama7g5_temp_calib = {
 	.p1_scale = { .numerator = 1000, .denominator = 1 },
 };
 
+static const struct at91_adc_temp_calib_layout sama7d65_temp_calib = {
+	.tag_idx = 1,
+	.p1_idx = 3,
+	.p4_idx = 2,
+	.p6_idx = 5,
+	.min_len = 11,
+	.p1_scale = { .numerator = 1, .denominator = 1000 },
+};
+
 /* Temperature sensor calibration - Vtemp voltage sensitivity to temperature. */
 #define AT91_ADC_TS_VTEMP_DT		(2080U)
 
@@ -766,6 +775,24 @@ static const struct at91_adc_platform sama7g5_platform = {
 	.temp_calib_layout = &sama7g5_temp_calib,
 };
 
+static const struct at91_adc_platform sama7d65_platform = {
+	.layout = &sama7g5_layout,
+	.adc_channels = &at91_sama7g5_adc_channels,
+	.nr_channels = AT91_SAMA7G5_SINGLE_CHAN_CNT +
+		       AT91_SAMA7G5_DIFF_CHAN_CNT +
+		       AT91_SAMA7G5_TEMP_CHAN_CNT,
+	.max_channels = ARRAY_SIZE(at91_sama7g5_adc_channels),
+	.max_index = AT91_SAMA7G5_MAX_CHAN_IDX,
+	.hw_trig_cnt = AT91_SAMA7G5_HW_TRIG_CNT,
+	.osr_mask = GENMASK(18, 16),
+	.oversampling_avail = { 1, 4, 16, 64, 256 },
+	.oversampling_avail_no = 5,
+	.chan_realbits = 16,
+	.temp_sensor = true,
+	.temp_chan = AT91_SAMA7G5_ADC_TEMP_CHANNEL,
+	.temp_calib_layout = &sama7d65_temp_calib,
+};
+
 static int at91_adc_chan_xlate(struct iio_dev *indio_dev, int chan)
 {
 	int i;
@@ -2632,6 +2659,9 @@ static const struct of_device_id at91_adc_dt_match[] = {
 	}, {
 		.compatible = "microchip,sama7g5-adc",
 		.data = &sama7g5_platform,
+	}, {
+		.compatible = "microchip,sama7d65-adc",
+		.data = &sama7d65_platform,
 	}, {
 		/* sentinel */
 	}
-- 
2.34.1



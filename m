Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE7FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHEYUHAJ0JcUhqdR05lmGFvMkv0l6hEOK+7lcI+/3c8=; b=FL374v6auVz2Aivc9oQqJ3HLBo
	9kP8G00mk3apRBBkNcwH0MT79vEfujBG/QoUblHIC9ao5mWdnDmy69lnuMWl5p69hORCDsqGsuOS9
	2X/31x+td6eP0Q4YiQs5kG2fzRD2Ee59xG+COYKmzLcQHDdarYnXcdkzzQTu+1Eb1bAHi7iTup0Nh
	CRQVEkLbHrXAoIT57O9SPbc9PtzVXI4o9qPed7ZHTgJHlrcBf283R2d7fqPBnVaiObHFgMPYlB9Eh
	eL3W/Iere3h91jXVtqqZ4X8nTNCSFWmUAiKjc3uj3355KgLog9RowB0jUcK2L/JjUAYChiMTLEx+S
	WyrVjOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUuA-0000000GSY0-3VmR;
	Tue, 30 Jun 2026 09:37:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUu8-0000000GSWR-26tF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782812240; x=1814348240;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=14iKVjIbPt4BXpZNPCTRWlVVhuV9b7Zz5uk1BB4yLSM=;
  b=LeYg0r6o6J7pnoBntb07v5w6jovKmwhk3WbeuSe/WOGKitRzPrUxyG4K
   ZFrDudHFz9ImX8uxLF1DwFUBeZqT2pGZZMXBetPWATNqCpfNaZdLkpvsv
   kdnRLZPE9oCqotcPkUgWqR9JKNTqFxLj9AKg+lohdSmkQez08t1PEpue/
   TQcbXqGDcgT0GU/uogf15tm3b45a8aUcMIDmFeuYMnpQCFjj3+tCMl060
   fNbljJVDBOlySNu+zmIFZvVwMx/mR9q14GkCbI6gzmE0ro2ZfX+liQh5I
   gaGhebZ/t9aAw2uaVvltAdTJQKxRYhmlfZYCBI9aKW5k0gRZXolCuj2gu
   g==;
X-CSE-ConnectionGUID: RYdOZI3+SAqAgq9+5DMc4A==
X-CSE-MsgGUID: vt6FXm27SiOmsmupIS4Fkg==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="69114899"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:37:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Tue, 30 Jun 2026 02:37:19 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:37:10 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <jorge.marques@analog.com>,
	<mazziesaccount@gmail.com>, <Jonathan.Santos@analog.com>,
	<jishnu.prakash@oss.qualcomm.com>, <antoniu.miclaus@analog.com>,
	<duje@dujemihanovic.xyz>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 04/13] iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65
Date: Tue, 30 Jun 2026 15:05:54 +0530
Message-ID: <20260630093603.38663-5-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630093603.38663-1-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_023720_590332_53C477A3 
X-CRM114-Status: GOOD (  15.31  )
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
 drivers/iio/adc/at91-sama5d2_adc.c | 31 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a9dedbb8eb46..cf28755a6109 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -626,7 +626,7 @@ config AT91_SAMA5D2_ADC
 	select IIO_TRIGGERED_BUFFER
 	help
 	  Say yes here to build support for Atmel SAMA5D2 ADC which is
-	  available on SAMA5D2 SoC family.
+	  available on SAMA5D2 and SAMA7 SoC families.
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called at91-sama5d2_adc.
diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 2a25165bc874..7e3e347bb6a5 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -531,6 +531,16 @@ static const struct at91_adc_temp_calib_layout sama7g5_temp_calib = {
 	.p1_div = 1,
 };
 
+static const struct at91_adc_temp_calib_layout sama7d65_temp_calib = {
+	.tag_idx = 1,
+	.p1_idx = 3,
+	.p4_idx = 2,
+	.p6_idx = 5,
+	.min_len = 11,
+	.p1_mul = 1,
+	.p1_div = 1000,
+};
+
 /* Temperature sensor calibration - Vtemp voltage sensitivity to temperature. */
 #define AT91_ADC_TS_VTEMP_DT		(2080U)
 
@@ -769,6 +779,24 @@ static const struct at91_adc_platform sama7g5_platform = {
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
+	.oversampling_avail = { 1, 4, 16, 64, 256, },
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
@@ -2639,6 +2667,9 @@ static const struct of_device_id at91_adc_dt_match[] = {
 	}, {
 		.compatible = "microchip,sama7g5-adc",
 		.data = (const void *)&sama7g5_platform,
+	}, {
+		.compatible = "microchip,sama7d65-adc",
+		.data = (const void *)&sama7d65_platform,
 	}, {
 		/* sentinel */
 	}
-- 
2.34.1



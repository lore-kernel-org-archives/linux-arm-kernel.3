Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344BBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGUc1Dw95NGkPy6wDXCTVgmvMYSywBzZex+bTlBVj98=; b=Xy5AzG2PD5Bp3MZahtndcXlFWV
	Aw3m7ir0JmHLc98CBb4IE6xvcT6Yh6AJ7DfX1SnDyChG4tmJXK6+I8UQEs2E64SwTgdteE0i5Oa9C
	h1JCAY13gTvG7LbpwMBy8x5o2izhGVap3IFcd97VRBayeLyKZMwkDPtisd7ItOKV3k5VLVW9In45n
	JYJDTfi6GSwncvkHGJkAxVc7f+nRdrNkDlWPfHdZ9za9lG5ej6/HCrdQHy1L3de+l6HFVDUiwrtBe
	28ltwSUe2aFAfsshhOBesvkQGp5udQ8WJZcF5gmNpFjoDJqMxMFdzt0WHQxO++viD3yCCR9Dd6b8l
	x1vBiZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisEk-0000000AAYS-3JKe;
	Mon, 04 Aug 2025 10:16:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis2D-0000000A8ra-2X6c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301793; x=1785837793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Co7gfwT4mHYrZjebZQxjjmc0VfEU+S5rAP9qwyGGqg8=;
  b=dwYx94w15rN73FPcxSL/W3p0pTy0IMAaONPRt8Wz3HPmUK9Frk/ohqWj
   rsESjOyYbiuE/anIvrokggzg0zfAly0c+F9dCuWko3FBjz+F8JHRJ5Htv
   8sy+8v7BKgxIICc1ygp31pRNdjn1JcLFyZXd3p3jN4/Vokfv5cH+jdBD5
   DUEflWT/SETKDeRWHvSGfqLT0FxghA6owNA4sFPAbPTShuT2DQSUmqlbH
   By68nYqQBWORfvonWHQE+tE57pNPt46Zw2o+TkzZJNdXcntbYDUuTB6cL
   Gn2xtpkJujEeyMxQezgLZ0mFts2mf940VgP1mf+NTS++adEzX5kI045Iu
   Q==;
X-CSE-ConnectionGUID: Liqowa5KRuKZ85yXFKRAhg==
X-CSE-MsgGUID: V6sbAXJ8TPW8PGSA1Xm7yg==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="50182876"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:03:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:02:54 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:02:48 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 04/15] iio: adc: at91-sama5d2_adc: update calibration index, validation condition
Date: Mon, 4 Aug 2025 15:32:08 +0530
Message-ID: <20250804100219.63325-5-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030313_653998_353D2130 
X-CRM114-Status: GOOD (  14.09  )
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

Add additional condition for validating the calibration data read from
the OTP through nvmem device interface. Adjust the calibration indexes
of sama7g5 according to the buffer received from the OTP memory.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index c3450246730e..d952109a64a9 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -445,6 +445,14 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 #define at91_adc_writel(st, reg, val)					\
 	writel_relaxed(val, (st)->base + (st)->soc_info.platform->layout->reg)
 
+/*
+ * The calibration data has a TAG to recognize the packet
+ * The tag has a constant value "ACST" with the ASCII
+ * equivalent 0x41435354. This is used to validate the
+ * calibration data obtained from the OTP.
+ */
+#define AT91_TEMP_CALIB_TAG	0x41435354
+
 /**
  * struct at91_adc_platform - at91-sama5d2 platform information struct
  * @layout:		pointer to the reg layout struct
@@ -504,10 +512,10 @@ struct at91_adc_temp_sensor_clb {
  * @AT91_ADC_TS_CLB_IDX_MAX: max index for temperature calibration packet in OTP
  */
 enum at91_adc_ts_clb_idx {
-	AT91_ADC_TS_CLB_IDX_P1 = 2,
-	AT91_ADC_TS_CLB_IDX_P4 = 5,
-	AT91_ADC_TS_CLB_IDX_P6 = 7,
-	AT91_ADC_TS_CLB_IDX_MAX = 19,
+	AT91_ADC_TS_CLB_IDX_P1 = 1,
+	AT91_ADC_TS_CLB_IDX_P4 = 4,
+	AT91_ADC_TS_CLB_IDX_P6 = 6,
+	AT91_ADC_TS_CLB_IDX_MAX = 18,
 };
 
 /* Temperature sensor calibration - Vtemp voltage sensitivity to temperature. */
@@ -2281,7 +2289,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 		dev_err(dev, "Failed to read calibration data!\n");
 		return PTR_ERR(buf);
 	}
-	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4) {
+	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4  || buf[0] != AT91_TEMP_CALIB_TAG) {
 		dev_err(dev, "Invalid calibration data!\n");
 		ret = -EINVAL;
 		goto free_buf;
-- 
2.34.1



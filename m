Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEE2C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2MS7R1XquFI5ZgUyt7volv7TIDP5Jo6QUDiJmnMvlE=; b=Ok9LDMfPTzXdVP5jQ84jwzJ3YQ
	AFMZ76DpWKOycPphmbA5a3oiDqYxwVWwMruAfKgqMfMDnSwtvSjYEn/gOe4YcTudlm4m5+U30JTm9
	MxFf3tNQDsw0GsP6+Uia+ZJbJmTfjb0hmtKMK5YjZm3x1GCUjBAOcfBoDNJqHSXTm3wef2/kEDd73
	pCKWHOEk+fP504pVD+bO2Yno1fD+D+7RsQR24RZBzgqfQJKpa6hkMfjkj+5lEsupbHXJ/XGgp7UCJ
	++pjdaX1chjl/hyXajCcfaB6zci7ehrgag3sj4bX/HuaFNQB5/gBS+jUP1KxTpUoEaIAyN0A+ZaUy
	LLSB7SSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQ2-00000001i1Q-49hC;
	Tue, 04 Aug 2026 11:34:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQ0-00000001hzs-2Bpz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785843288; x=1817379288;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HAGc0aQvGQ6xckPzuGtbesPxW4BhT95FbIaJJrF46dg=;
  b=HrO/n72YOgoj6IKC5vRMCBvoaRV3WEFAutdeL4b2xRh6BTOIn/EmytLk
   RNQH/zbWcq8kGuDIHbvasxoQcLKXfbe5WEKDN89Nod25+IXpKQORz1iLd
   ZCraQGWoLOCNFHVeBliXcRuheAG0KzPkfszylXMecT97xVcfxjpWYiR0V
   8J6YtKNKzs6yEW2ymROHE6EG3+NC1Zm14rRcn2dbzOKqkT2qQvCtzfgKa
   g34JNNr23FDXpYRKEDP43EgIft0iewTeHlU5yNsfsLRWxKI/itbMOvMVo
   2gOWLFTU0iRua1QU6MrTa/M78NjXN1UvFhnVkyleAtaDkhOc5CMHkf921
   w==;
X-CSE-ConnectionGUID: hQ0YnYp7SQGjHFa3FSHSsg==
X-CSE-MsgGUID: nSraFaAjTEum1TRTSW9ddw==
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="61934860"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:34:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 4 Aug 2026 04:34:47 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 4 Aug 2026 04:34:36 -0700
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
Subject: [PATCH v5 05/17] iio: adc: at91-sama5d2_adc: add condition to validate calibration data
Date: Tue, 4 Aug 2026 17:03:26 +0530
Message-ID: <20260804113338.261782-6-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804113338.261782-1-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043448_618616_C995B2EF 
X-CRM114-Status: GOOD (  11.13  )
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

Add additional condition to validate the calibration data read from the
NVMEM cell using the TAG of the packet.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 82db8f2f4db0..5b21367cf6b4 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2297,7 +2297,8 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 		return dev_err_probe(dev, PTR_ERR(buf),
 				     "Failed to read calibration data!\n");
 
-	if (len < layout->min_len * sizeof(*buf)) {
+	if (len < layout->min_len * sizeof(*buf) ||
+	    buf[layout->tag_idx] != AT91_TEMP_CALIB_TAG_ACST) {
 		dev_err(dev, "Invalid calibration data!\n");
 		return -EINVAL;
 	}
-- 
2.34.1



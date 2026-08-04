Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39793C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UliVIMjPkcrnUjtlG/RFOwMuvkzIo5uov+ptOFZ2Jwc=; b=Okd+G497dm8NkzVtL4gqnB2GQz
	jPfjUW7Qankk6IhnTfFjGGJEirvUZ8wbLg7H5ycikGfxCyBesWwL/H/6CYLLhtd6Px5IYqnOU/5KU
	OseWeQWG1cFuuAwU6PLWudlODVYER2beeNoTjr5l0cCqnWqDSwJWzHokxjv74OMnqTmExO7kyUzfE
	+H+dlHw6EGbyTAehKSCOEJekXNBU9EmRllkqq5t8EYDDT9bAm+kd/ZvZCW8Q0z+Cakmhiu8ggyEWD
	7eFjxV5O78bd7UV71y2jkzrt+71cVp0M1ANXVaPWKbbkLKuX4Dc4WbE3gsJO3e+E8dJBwAGiUfwq/
	itndnrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDPM-00000001hgw-1mwS;
	Tue, 04 Aug 2026 11:34:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDPI-00000001hfW-0j7N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785843244; x=1817379244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G59VGDA6rhTXCxCP3iHlNCuRW3WqGdznOrZvREZZi/0=;
  b=H+sXVw+a+Pg4TJvaKM34JdV+4FL3jenkUmRSk9AHwDQM3w3zI1bTjD5n
   99ZMEYQhfPg0IGloI8Ro0ZY8XcNOhjYj8ARjqlA1AwaTTESqrFV6tcc4k
   3Q4fFxxtXsZYjI2IYiXxaOq3l4WLSr5GTkBhUkjLBa13LNUPMc0rmXLq1
   /mOSyz8qh6VM1sOzBr+JDoLfjkBbOAdW5E0E/cmbZUXOzMM30Ueyn5nVb
   0cw0sqXtDcb09Zu1XcnhQi0gdU2Wfy63Thzgi003V6CWbQ8CLHMsY/v6W
   c0JaIw45yz9G/ktvDyU2QPMVT95tEZtzFnVGsLUztnahVuy8oDuVLPZz/
   A==;
X-CSE-ConnectionGUID: ZAh7y7BsQI2UUJU92+Rbdw==
X-CSE-MsgGUID: 6x+8kSwqS3qVFry6LfnbDg==
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="60737105"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:34:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 4 Aug 2026 04:34:03 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 4 Aug 2026 04:33:52 -0700
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
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 01/17] dt-bindings: iio: adc: at91-sama5d2: document sama7d65
Date: Tue, 4 Aug 2026 17:03:22 +0530
Message-ID: <20260804113338.261782-2-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804113338.261782-1-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043404_280743_8A87312D 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

Add dt-binding documentation for sama7d65 ADC.

sama7d65 requires an individual compatible to address the differences
from its predecessor sama7g5. The main difference is the temperature
calibration layout and its handling.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
index 4817b840977a..e8a65fdcd018 100644
--- a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
@@ -15,6 +15,7 @@ properties:
       - atmel,sama5d2-adc
       - microchip,sam9x60-adc
       - microchip,sama7g5-adc
+      - microchip,sama7d65-adc
 
   reg:
     maxItems: 1
-- 
2.34.1



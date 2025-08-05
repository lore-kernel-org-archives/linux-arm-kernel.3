Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD38C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPSSNM5Uns+INIry66RqV5Y/ulgWx5u9mG1zVlsZhu8=; b=o6wd7+x+hYYOyfblJd/COXNdXC
	ZdJ/D2v3niXrIX88GvQ7kVopjdS+8hBXuGwCKOv5VQXMM5kncKaPIRvgFelVBA28LgVQD8jLGGWUC
	/zYJu0op5LQaoxgzRJ5mfAX1om4lDiOPwDNfr5ImxZ8Sj3gOD1d228JwEsgdhJcPIwBjYKmkKYfXe
	evjKPRilL7XSf5IvXCL7nxNhWotAxDWi+krqzT8TalGvN6UCwVmpso8Fl0HSMKvKDS7B+m8LFPKW2
	1t/R2Oa03b1BtAvjPBVMjYAAU4E20+DbFOOqRS6Xeg1XhD3646e8jxaN1I3uY2FRlymK8FRRtcuaf
	DbG0m2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFF2-0000000CX7b-4BkS;
	Tue, 05 Aug 2025 10:50:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEsW-0000000CUMa-1zzA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754389604; x=1785925604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jcHluiS23Qnyxsx+eLhpXfKCtwkHXmfK8TuIezg/KNo=;
  b=QaQOyQkad7wnVi9WDs4LKNfByUkQ3aEIQyxUYzCHitRq40ZjjnAODpWi
   oIS5y/WnqirB0T8VcUk8l7jlBGVN/IvvBV9HJ2UEkfg0Vzrnekh3V6Wws
   jX1j1rkcQyyZ3jf57/ptn02dZG3HhTqDfkP/6FGDpOvZDCL7GuEbvqdPj
   DIrFtjdtg+cLzle6p2UcE4C1fVMs0eagEdmOQ8OBPX7SClVDJA6Lgx6Y6
   2zdykS8CQbVp+pCIdDgnhyXaHpx5JZ6CeICvNn/P5QdTXxXCQ6gRg18ih
   uKzMLS4AN1rN0+fNnLEyaKsn70jPqQy0O/QIEqPNMasl0nsj2Hea8hSub
   Q==;
X-CSE-ConnectionGUID: 5giYSL7rQRGsqPqo2rqYFw==
X-CSE-MsgGUID: K2sezLbaS86OHGPP6tSfdg==
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="212248019"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Aug 2025 03:26:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 5 Aug 2025 03:26:20 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 5 Aug 2025 03:26:15 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<ryan.wanner@microchip.com>, <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 2/3] spi: dt-bindings: atmel,at91rm9200-spi: Add support for optional 'spi_gclk' clock
Date: Tue, 5 Aug 2025 15:55:09 +0530
Message-ID: <20250805102510.36507-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250805102510.36507-1-manikandan.m@microchip.com>
References: <20250805102510.36507-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_032644_580622_83D28061 
X-CRM114-Status: GOOD (  10.41  )
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

The Atmel SPI controller supports both the peripheral clock and the
Generic Clock (GCLK) as sources for SPCK generation. On platforms like
the SAM9X7 SoC, the peripheral clock can reach frequencies up to
266 MHz, which may exceed the maximum value supported by the Serial
Clock Baud Rate (SCBR) divider, leading to SPI transfer failures. In such
cases, the GCLK can be used as an alternative source for SPCK generation"

This patch updates the Atmel SPI DT binding to support an optional
programmable SPI generic clock, specified as 'spi_gclk', in addition to
the required 'spi_clk'.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
index d29772994cf5..11885d0cc209 100644
--- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
@@ -31,11 +31,16 @@ properties:
     maxItems: 1
 
   clock-names:
-    contains:
-      const: spi_clk
+    items:
+      - const: spi_clk
+      - const: spi_gclk
+    minItems: 1
 
   clocks:
-    maxItems: 1
+    items:
+      - description: Peripheral Bus clock
+      - description: Programmable Generic clock
+    minItems: 1
 
   dmas:
     items:
-- 
2.25.1



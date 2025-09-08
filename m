Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705D2CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nu38ABDGBNDvGIIeyGWtZX++p8vXJSmdMCc/Zce2XMY=; b=wHkFDlf3BWBfp7TgLzdqUk5zc3
	ZVloNK+B+v8PYLo8IYvaeQSpw8Zs9l2SeCe5OrUcKbQu9wfXbBjXMx7dCICligizt0uMKm73Qb6N5
	WsKzaFxaXlP150xArx61rzNPE/izabaYV+ziCFANNKkqCO4NNCg3A8GEHfyI3iyGb1LTv9tBrp2ck
	2UOQaW3nvJTberYfOvyDgfM8Gy394rGSKsPpcVFvxpk7PG6kwMu1z2FC/zSXAKKWZH5euElQ2Xc9y
	BPkXr8enLDujy7Ty1q33EQDHGyJ9i/Ycttp32Hnpv2rKCv+H0HZXfcV3yd9hELFSKxim+/XjVdjB+
	D9p/e/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTPY-0000000ESwV-3PtJ;
	Mon, 08 Sep 2025 04:23:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTHD-0000000EQeI-1jPi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757304887; x=1788840887;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=e9VWFRSwNpYXqnNmw9kbScIHMnZuxvIjyF1UMqscb90=;
  b=rJNE83hi+4sQ4D565fKssFaSTrvnGL1fMjd995gtfjNYHD2s/0MLL9qt
   YYxfOyUF6NTVp6/CbGBHDGwWO6xNsuE9wY5pm+rEWKpbK5qUelMSSuOn6
   fx6BTZHuAWXUnEdXUZ/uEfYUgJHkL7UFUVelzwi4qGo21+m3Y26hmWyg4
   pVXSMxbEtrknWxjqVTq4sOcBGXYB+gk8yx2pn4n/cKMaR3uEbMejwoOf4
   OlfSAOMp4jN7llN2Iw/uAVINvb4eguPxMGK5UD88ao25ZV2F2V15Ao9EQ
   uQclquUFiWZKwbT98ZCYLboPhuteppeEWkcDKoXA+vm8BUuZaGmXCR49B
   g==;
X-CSE-ConnectionGUID: YPpoJm/ATHeRsyPuBZAjnw==
X-CSE-MsgGUID: 4Igph96/SsG5PGgXO/ZyWQ==
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="213580665"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Sep 2025 21:14:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 7 Sep 2025 21:14:37 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 7 Sep 2025 21:14:31 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 8 Sep 2025 09:44:17 +0530
Subject: [PATCH v2 2/5] dt-bindings: spi: Define sama7d65 QSPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250908-microchip-qspi-v2-2-8f3d69fdd5c9@microchip.com>
References: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
In-Reply-To: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757304860; l=1008;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=e9VWFRSwNpYXqnNmw9kbScIHMnZuxvIjyF1UMqscb90=;
 b=6jOxPORoqvCAYlEQ2RH11LrjiHEQFOayPVVeqs6SddsJiROpczeZmNLAGV8voKzkBebeQND/V
 5yUM/g0bDFfA6ZsMtqIqwfhw6zGMOxnJ3DwNLIxVJ+30TDbCw31CRlR
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_211447_516564_DA060F57 
X-CRM114-Status: UNSURE (   8.64  )
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

sama7d65 has 2 instances of the QSPI controller:

• One Octal Serial Peripheral Interface (QSPI0) supporting DDR. Octal,
Twin-Quad, HyperFlashTM and OctaFlashTM protocols supported.

• One Quad Serial Peripheral Interface (QSPI1) supporting DDR/SDR.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 Documentation/devicetree/bindings/spi/atmel,quadspi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
index c17114123034..30ab42c95c08 100644
--- a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
@@ -18,6 +18,8 @@ properties:
       - atmel,sama5d2-qspi
       - microchip,sam9x60-qspi
       - microchip,sam9x7-ospi
+      - microchip,sama7d65-qspi
+      - microchip,sama7d65-ospi
       - microchip,sama7g5-qspi
       - microchip,sama7g5-ospi
 

-- 
2.43.0



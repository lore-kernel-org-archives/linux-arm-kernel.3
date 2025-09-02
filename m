Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9206DCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 06:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nu38ABDGBNDvGIIeyGWtZX++p8vXJSmdMCc/Zce2XMY=; b=XvuMPfXK/+/lC5mDbshT3F03YK
	ZLDPTG+xiEaxlBXrr4SRYUEn7r/KXR7FT0b/oqyBkXV4y9hju0D7Yk6bPLRzJHE44Sn6ct1y6BSmV
	yVCtZl5k/fKNy0tSXZ5volA9Fbbm7N+13Koc2uHjp1DHnM5ksvyvJaSbxkzTJ6QkPg6PoxXqWxwhx
	Dxa/4qK1tGG+LD90HqbKxQT7ErVDNrWEwumtjzbQlzImMihZC6lQJzDGiH2VADuKlOmDnCPHLDyUo
	JBhsfwbtSlQB70cGkizj9m8ImvZlm5ARLFK8WlgtkHy8PfsJETZvl7IOOJ3/hk1xhNSacVIGXYep+
	Q7Tes3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utK4p-0000000FQLx-3Osp;
	Tue, 02 Sep 2025 06:01:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJwz-0000000FOVy-3GY3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 05:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756792381; x=1788328381;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=e9VWFRSwNpYXqnNmw9kbScIHMnZuxvIjyF1UMqscb90=;
  b=bOvy8mRnEB3fOltQfkI/W/3tpLFA7BW35O2x9IbvmyOND6MUvjb0wxXK
   gJFVQEMUxTZBb0RVl1KdcKpYwq7sU1LncMjfGNtFob7E139u/0JaNYDhT
   mc1DRq6vBHYgU2jmuTw6jaKefoolIb223qUo5REcXxTCGJ4nI0Fq2+IgH
   g5xoIt6PEBXPnI/Nq5nXVosCV3e+rs8fg7/ECeH+bH14NV9qFGneoanZi
   uyl9p/V5p9iKcrQ6AecfC+fepHCid2Tbv+Rdxwv9ME+nQRy09Sx3yuT8D
   K0ch40QvOi1JzcTpdU50VjMNjDcMONynzi9uVN/aaPIBT+hudA/2r9qzL
   w==;
X-CSE-ConnectionGUID: Yz3ewosWRva47VEyLax1Mw==
X-CSE-MsgGUID: n99+6iJ8QaW6djCFN23PmQ==
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="213332112"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Sep 2025 22:53:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 1 Sep 2025 22:52:40 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 1 Sep 2025 22:52:35 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 2 Sep 2025 11:22:19 +0530
Subject: [PATCH 2/5] spi: atmel,quadspi: Define sama7d65 QSPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250902-microchip-qspi-v1-2-37af59a0406a@microchip.com>
References: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
In-Reply-To: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756792344; l=1008;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=e9VWFRSwNpYXqnNmw9kbScIHMnZuxvIjyF1UMqscb90=;
 b=CO/fzW2/g67HTEueiWARb6WQARJam9NyTFZ58DKURxITPnaOkQ9Gdva4yY1aw6hsH3A0ZaB+z
 LQHJWeg68T2DEZZmD6ea3x1LT8SbjjXKLDnC+/PocJ2pOok16NkwDqE
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_225301_879876_BC4E98E2 
X-CRM114-Status: UNSURE (   8.12  )
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



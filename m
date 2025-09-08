Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789ADCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfgABIab4awy2eoHXZCsjef8xmZaH9XT3FsHML7rNlM=; b=o+0+eEl3MakdM6aua5SmxVFDko
	c9vcmIcixqoXVeLRUhOo6ZpVhiiLGvMiteCcJQLpBv6M7ssD1Zv+B/js5tvZfbekOHvHdvcu4ju9e
	MyYwtK4efCOzqRV4UXhgM5a5wXMOd9BISVyX4PT0SVxTa0j9UHqDlJyhz6pUoxYhbDl9hM9jmk1bP
	Oclw9ao9Q1bEAy4jgtf2CPinQighH9XhsZBIA9zhrb3mzGoYzaFtea3bPTo1aQ6UIQ9832GucX7PB
	s42kKD7yUKcc5e5rS5k0qyQ7+kwQh+URtV/T/k2Xp6rrVEoB5zMJN48Uj3fC3cN2TEcdm4q8MZRYm
	SBD8AH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTK1-0000000ERbR-0bSk;
	Mon, 08 Sep 2025 04:17:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTHC-0000000EQeI-0bKa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757304885; x=1788840885;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=TaxTNHBdSP7EOxa2FDGkct94U6DiFXOc0lCmhlPSLXo=;
  b=EgLvWgJgsXTSZ0Wk6vfGBPaBAe5dczqqMFNV4HY6DKvKptHYEp0d2/Xf
   P4Uh/TmS8pU++cBvmKM5ZuauW9EtMCOS2hCO5NopjZt4HhE+jIPeLmtq7
   19XPJrGLCSJUnPpWc9m41UUHDmndOagdG88lyfHdM2xZ6SWzFSlXl+pKN
   UDUfuF9hU8Hvi46431BMM4In8Jj91unDJyGon8300ht0h1ojiOKNbUXRi
   VSokQnWFRTerl6nTW6bD39a73HR5A7nStbNQg+qCEdxnZYy598jkJ/6vP
   LrcaBnMcA3AzzrxpuZhPczXTv00RLpa34MnI7dXWFpat5mf/hYw0xc2uR
   g==;
X-CSE-ConnectionGUID: YPpoJm/ATHeRsyPuBZAjnw==
X-CSE-MsgGUID: iE5TQrUwRqSlvvSizkydqA==
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="213580664"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Sep 2025 21:14:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 7 Sep 2025 21:14:31 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 7 Sep 2025 21:14:25 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 8 Sep 2025 09:44:16 +0530
Subject: [PATCH v2 1/5] dt-bindings: spi: Document sam9x7 QSPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250908-microchip-qspi-v2-1-8f3d69fdd5c9@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757304860; l=877;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=TaxTNHBdSP7EOxa2FDGkct94U6DiFXOc0lCmhlPSLXo=;
 b=DLoXyTlSpsFareduqI73PqFwjH7aGX3JHj6RS6MuMTORSH6v5mlfGLJRzb8RKkbOLr9UMNHYY
 xlfR6JbXnskAqNPvAb8UNDD1Z7bZH3nbQ9t+5keQ6R3jSxNKRz9daKH
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_211446_300459_0AE37F1F 
X-CRM114-Status: UNSURE (   9.03  )
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

Document the sam9x7 quad spi that supports interface to serial memories
operating in

- Single-bit SPI, Dual SPI, Quad SPI and Octal SPI
- Single Data Rate or Double Data Rate modes

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 Documentation/devicetree/bindings/spi/atmel,quadspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
index b0d99bc10535..c17114123034 100644
--- a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - atmel,sama5d2-qspi
       - microchip,sam9x60-qspi
+      - microchip,sam9x7-ospi
       - microchip,sama7g5-qspi
       - microchip,sama7g5-ospi
 

-- 
2.43.0



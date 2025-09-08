Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9EECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qfHINblPSOpFubOZWj+AIQXx5LmntQxaS5ooViIe8qE=; b=wH/oJDxQKhUIfc
	GxauBGvDv1E/ZQ4OMlCQF8kfqZag1e5Xf6BATsHwRDtXFlJg1+n/EJQ9QKVFJjwWreyDPyotqcrIW
	aU3po6zyJQHSjCI4lqd1AgDU1jx8GJRwaNPkFSN5glX6BhoS8HYixiI+edZB5FdPykFM2DrEvubVz
	8jdiv0Qz5GPUCRhHlK0woG48voMc1xWZivyD0abP6oNhIcUr+WCAPfTnsnv8ceB4+GNb6tokfc+pF
	t70JCGBRBKHfLlxBiFdfTXxF1CqT5OlQm8a/LUOo7LFczecgX8AMDNgSv5qalbP7d7pKXLlqOvsCv
	hGf1cfEsBbwgoFI82u1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTMm-0000000ES8H-3zlP;
	Mon, 08 Sep 2025 04:20:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTHC-0000000EQeH-0MsT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757304885; x=1788840885;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=y6SgL0SvA8lYYyF90rTpTwKWfC2+R7sLAcCo0vATj4w=;
  b=wAKP3kHATIqm5GMG2Y3+0D0Ca9tw4qhNFpP54+inz2OSHklwnKaBheE4
   y3KN473WQMdtfmdS5fzQicKIO+5syhgXbHVFM+AELWUp5osEh2totzLHj
   mzBjv7sxkO2L3WSyzTrUkFcF3QqOAtR+1lPmiJXmLIL6v6M5tVzs7U2N+
   0WnpfAYc9xzLPb+e/4AE6xREKVXQPhFic6UQhMqA++TMbRzRvhwHmPzAr
   odeXU1unxyZ6QTfhNeGFVUJQjP+LL4p0fwwbB7ew5bDyh+geGfaetIRCP
   EJ27nLrRKDnBxLbTUrTfqNirQOOvVXjc7pDWHKCC+C6MQpsuRl1GTneN3
   Q==;
X-CSE-ConnectionGUID: YPpoJm/ATHeRsyPuBZAjnw==
X-CSE-MsgGUID: 2h/b4mq/R1mRAd5Ns6IGCQ==
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="213580662"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Sep 2025 21:14:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 7 Sep 2025 21:14:24 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 7 Sep 2025 21:14:19 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH v2 0/5] Add QSPI support for sam9x7 and sama7d65 SoCs
Date: Mon, 8 Sep 2025 09:44:15 +0530
Message-ID: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABdYvmgC/3WMQQ7CIBBFr9LMWsxAiw2uvIfpAnEqs2hpwRBNw
 93FLty5fD//vQ0SRaYE52aDSJkTh7mCOjTgvJ0fJPheGRQqjQaVmNjF4DwvYk0LC7r1znRSS9c
 SVGmJNPJrD16Hyp7TM8T33s/yu/5NZSlQtL0dtbHY4clefoejCxMMpZQPkppai7AAAAA=
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>, Varshini Rajendran
	<varshini.rajendran@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757304860; l=1238;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=y6SgL0SvA8lYYyF90rTpTwKWfC2+R7sLAcCo0vATj4w=;
 b=4pCMZOglzoprKTucas/IJXmT44MJpXJYol6/3hHpS0nGui4xFpvPjSPDGTnT8aYDaS1pgMwTv
 wwLOyEqU7LoBxHT2D73t1pOgRMt0qlQg2ga5/lx5jfQuOKjSfO4jciT
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_211446_300258_1CDB717C 
X-CRM114-Status: GOOD (  10.89  )
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

This patch series adds support for SAM9X7 and sama7d65 QSPI controller
along with the SoC-specific capabilities.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changes in v2:
- Fix typo sam9x75 to sam9x7 in commit message.
- Fix subject prefix for dt-bindings.
- Retain original author for some commits that changed during squashing and
  resolving merge conflicts from internal tree.
- Link to v1: https://lore.kernel.org/r/20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com

---
Dharma Balasubiramani (2):
      dt-bindings: spi: Document sam9x7 QSPI
      dt-bindings: spi: Define sama7d65 QSPI

Varshini Rajendran (3):
      spi: atmel-quadspi: add padcalib, 2xgclk, and dllon capabilities
      spi: atmel-quadspi: add support for SAM9X7 QSPI controller
      spi: atmel-quadspi: Add support for sama7d65 QSPI

 .../devicetree/bindings/spi/atmel,quadspi.yaml     |   3 +
 drivers/spi/atmel-quadspi.c                        | 134 ++++++++++++++++-----
 2 files changed, 105 insertions(+), 32 deletions(-)
---
base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
change-id: 20250902-microchip-qspi-eb7c94151c3e

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>



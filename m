Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7F4C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oLmTxcOtpQetRauLXWOZCRRLrXNtljDrfMzipV98NVw=; b=R0BS8aaOhPLCM+4oPu3AbLeUDH
	P4ti+AXNfHI5sh9DsvQaCDkhKWXxzZamifC4DX94AixoLW8au9/g9nHAMM1VbPOhV/sv+2SmgB433
	7KKRRqdhahBXJMwzLMtr/BfNkS4YLF8ywkUQi2m406O4fLc229akgOnqIfCLoKuX0/08RHleYZHhT
	zLn0yVhTGZqm2I2TS6pBbQ5pqYtMTeSSXfEte3tQbfefbRdSz0tWrVJNb+Wwr4KOlRgiyaTxXE5Zb
	r+3XJjtojdmOf+DdO7juabieeVl5GTM7+bVOpPOkjQ7OwB63sgqHtWAh8rvNl0dTvwDLx8bXVHOkv
	1BU1kTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujF78-0000000CWA9-1yrD;
	Tue, 05 Aug 2025 10:41:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujErS-0000000CU86-0m4H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754389537; x=1785925537;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/hLTx8DnHTD5nKVwpN/tqzkn2H4ZOTqkf/3P6143jtk=;
  b=HEpwL5PC1S4bnUT/beYhOL9yoSx23001/5zfG2E0+F7YmWkghr4mozo8
   p5YKCEDHuWq+m7hA2JxaZ1b9unTLiUdQqcOyp0G4EgwkdHqLHfZDrmqpv
   g/gVOifnNAJMgS14WZrA1uJKjcA5e1jxFGW5m+qQBmUG7X0f20zA9dKTz
   W7r1XIKzc1yCnoXwYHjBGhJ5MTiUr+T1BjgEw6NCflLHTWDeuEIONjRtU
   BSlW/eJmggkrmuWycg7ZgCM2ytFrbTNFA+pShYW5TvAgmvR3zZjVl23V7
   zwef6XJz5Jwl3wNDlf1iS7ThkHYQCWlBqn6e9UkS7O76d9IvfAOcwQ1oK
   Q==;
X-CSE-ConnectionGUID: CC5+32jcTAyMHulNICypyQ==
X-CSE-MsgGUID: aRRWOeUKS3em5aoeRe+qYw==
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="44291422"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Aug 2025 03:25:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 5 Aug 2025 03:25:29 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 5 Aug 2025 03:25:24 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<ryan.wanner@microchip.com>, <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 0/3] spi: atmel: Add GCLK support and simplify MR update
Date: Tue, 5 Aug 2025 15:55:07 +0530
Message-ID: <20250805102510.36507-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_032538_494834_3649B437 
X-CRM114-Status: UNSURE (   8.81  )
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

This patch series introduces support for using the Generic Clock (GCLK)
as a clock source in the Atmel SPI controller, and also includes a small
cleanup to simplify MR register handling in cs_activate().

On platforms like the SAM9X7 SoC, the SPI peripheral clock can run at
266 MHz. This can exceed the maximum value supported by the Serial Clock
Baud Rate (SCBR) divider, leading to SPI transfer failures. To address
this, the Atmel SPI controller can use an alternate clock source — the
Generic Clock (GCLK) — for SPCK generation.

--------
changes in v3:
- Add cover letter
- 2/3 - add explanation for the spi_gclk addition

changes in v2:
- 1/3 - Fixed mail threading
--------

Manikandan Muralidharan (3):
  spi: atmel: simplify MR register update in cs_activate()
  spi: dt-bindings: atmel,at91rm9200-spi: Add support for optional
    'spi_gclk' clock
  spi: atmel: Add support for handling GCLK as a clock source

 .../bindings/spi/atmel,at91rm9200-spi.yaml    | 11 ++-
 drivers/spi/spi-atmel.c                       | 78 ++++++++++++++-----
 2 files changed, 66 insertions(+), 23 deletions(-)


base-commit: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
-- 
2.25.1



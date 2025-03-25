Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C5BC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VHY4Od039hNPWxrnWT/61aFK8Dh3ZqTuK1afnWJ5tQY=; b=Pd5Z9cdpr6bSwo7LKjP6iH1FU8
	jK6FgltDtJPsTD4qy/5byXZAYMxKu4XSBcxtzEXrQ3Ik7Upl+Ll3JvtYFK8pooLsk43AIyvzV0cUR
	OrhxtBrsJ/SuiYLq7+U60YGQ05pRZiKEFgZ+xk/c1Am/u6Kw7gKAoOX2dqD6azUTsKPDSSC9pf5df
	L84iU1AXcQLxFcXNh20QAYYc5bbPpyZAyNHLuUH7Kr6PP0iwHUuCugbjrRFz0srBog5y2jJMs4+Z3
	8ep56dgGmbjSPh8WZE0347P0R4dJRd4DvTouRALyRoWKVH+OGkwcf+cBDKtDeWjK2DW2wB4ySrPi0
	jPHUMrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6eR-00000006P06-23gW;
	Tue, 25 Mar 2025 15:57:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6cg-00000006Ohq-3rEH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1742918127; x=1774454127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RjnIcXoOqxE+zxLIlZuGZ3NgudIunxk4QATpRpSyCrI=;
  b=HOPBjzLMB0DrJ2qbL1ChWUd4IUauGV7AM34q3Rs+NI/F/tl4vKA2vTK+
   tpxkRs8A9Pu/q7rsd5FtTIYhDhix3f1KaUxP7mizGSz8Pq/H9Fl8lpVwL
   mhrhBK4vMeaRTxvbDkguATukDo1Kq+MtxrqDEF2ESvkST+jD4RrQ5z8sj
   sGP9oeA+dmqhDci7PejnCHAuyhkHs9gdXUPf7geRIklMkR1GLsE72g8ll
   aOd1pOhhozcx0eLOA8pIU+lv748K9pGGETx5UHURp6Q6kbfTXiCwVtELd
   N2Pa7/2TOVQhNqOVLZ6xz7qlt2JZqFYb6vyd+2aF2w6CUFDO3fh4B8ozI
   Q==;
X-CSE-ConnectionGUID: 5ZRRXf5LQVCIU2dRAgtdWw==
X-CSE-MsgGUID: 6hQuaWmuSxy8lOAwfp4MQQ==
X-IronPort-AV: E=Sophos;i="6.14,275,1736838000"; 
   d="scan'208";a="40152225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Mar 2025 08:55:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 08:54:53 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 08:54:53 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>
CC: <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 0/4] AT91 SAMA7 SoC Clock Adjustments
Date: Tue, 25 Mar 2025 08:55:06 -0700
Message-ID: <cover.1742916867.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_085527_225326_C2780205 
X-CRM114-Status: GOOD (  10.73  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This set has clock system adjustments for the AT91 clock system for
sama7 SoC family.

The first is to adjust the slow clock driver to account for the updated
DT node-naming for clocks and xtals and ensuring the driver is still
backwards compatible.

The second and third are adding a missing clk_hw struct that are not added into
parent_data struct causing a incorrect parent for main_osc for both
sama7d65 and sama7g54 SoCs.

The last patch updates the device tree phandle formatting for the
sama7g54 SoC.

Changes v1 -> v2:
- Add clk_hw struct to parent_data adjustment for the sama7g5.c driver.
- Add correction to sama7g54 dtsi main xtal phandles.

Ryan Wanner (4):
  clk: at91: sckc: Fix parent_data struct for slow osc
  clk: at91: sama7d65: Add missing clk_hw to parent_data
  clk: at91: sama7g5: Add missing clk_hw to parent_data
  ARM: dts: microchip: sama7g5: Adjust clock xtal phandle

 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  4 ++--
 drivers/clk/at91/sama7d65.c                    |  1 +
 drivers/clk/at91/sama7g5.c                     |  1 +
 drivers/clk/at91/sckc.c                        | 12 ++++++------
 5 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.43.0



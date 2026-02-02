Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56384E73156
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5MCqTL1Km9Ip9GxV+ZnY3qCzppt0KzRciz4w5RiHdA=; b=Zqj/zBd2Qon0CJgzw46s2cnQoR
	vjdRGBObPUjN025oX1nozSQ+NPQXVngn0dig16ppkc71YhV2AZnCpxfSfJhIFjFdjylIEUof6OvDi
	FzxmNq5EAHNbbkeXYBtiK2XtsqRLfOQS2VE0EbHD662xZYDxf6Rg0RxnP50eFtVFHSFZZydaiq9Wf
	RvoDXR5//KFP/Fmt9X0CEfUc9PzZxRAMUWnZoZS7oFkZ3lmYrRdDD7IHv/kCQJxvzBE2wUQMTOPJE
	sAe/P64QHRQC5fCZiW4crVRFm//2fV1yxdHDRkgLU4QIw5PS3e5JmB336KSEkah6qRHpSWczDzqrn
	dyeRgbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrMw-00000004q84-0XfG;
	Mon, 02 Feb 2026 10:41:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrMr-00000004q5K-3DSz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770028877; x=1801564877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9g5CCiQU1ItiH0FskuKxbTunuhIDJpCKXVV65BaI9V0=;
  b=gS7jbU4ctC7h5pHmrBSF8BOIVNj5MZrrsefSOmamlLvH4V6ru9tHKO1Y
   tj/zARDKpSFsiNhgaaE7FLui9x5E1e/p7LX4EBs2tk0B6tQGgX1+4xUkk
   0xFSPKuWjoKE9q1lXYbX7TG+KP3mvZQT21FM4KN+pwtCbaiz42YLu3pA2
   E22poOcW4dmrmC1ZXmUU4tT5ypW6VzH28h/3/9Pi/UcGKcisTqBByGMlC
   HWkq577CJVpW/3GyJEVmWk+kCIDUW5bwuXllWMHJ62umwXtx4wMg3pk9q
   0SIIHG6QlpEU4PQr6crPtAhO2fEobULRH1+BgN3+QcSo3oSzbor8jqGhU
   Q==;
X-CSE-ConnectionGUID: 4Ir6ehGOSMSwNcM0kpvUsg==
X-CSE-MsgGUID: hIZX4jERQv6ymGlGZoEvMA==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="59959601"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Feb 2026 03:41:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Feb 2026 03:40:52 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:49 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 4/5] ARM: dts: microchip: sam9x7: Remove the tx_clk from gmac node
Date: Mon, 2 Feb 2026 12:40:24 +0200
Message-ID: <20260202104025.3781-5-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202104025.3781-1-mihai.sain@microchip.com>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_024118_037335_65E82E67 
X-CRM114-Status: GOOD (  11.12  )
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

The gmac controller on sam9x7 has no internal pll to generate
the 125MHz clock source for rgmii mode.
This clock is generated on external board by eth-phy or
clock oscillator.
This change drops the tx_clk entry from gmac node.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 46dacbbd201d..da94865c57e9 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -991,7 +991,7 @@ gmac: ethernet@f802c000 {
 				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
 				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>, <&pmc PMC_TYPE_GCK 67>;
-			clock-names = "hclk", "pclk", "tx_clk", "tsu_clk";
+			clock-names = "hclk", "pclk", "tsu_clk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
 			assigned-clock-rates = <266666666>;
 			status = "disabled";
-- 
2.52.0



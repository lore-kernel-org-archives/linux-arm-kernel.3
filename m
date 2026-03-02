Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0457EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c4I+HxGj0gSEtRaDim1lceLzxjdcoWKeWz4v8/UrcM=; b=dgBR2WzIRmbkPRPLQoJopWGLtI
	m3I8xzYJBh2r1pJL0+6ZNq6t2/0ofS/ogLF0J1gEO17/0g4jnHvFH32XE7oX/nXwtg7dpwqbNlMkK
	E9bR/kYo1nRLr0jxWCr05QYr/FYNqs7g/d3Vh4oytDlRIzJcybRbjpYE/aue75YPmUCuGHjTG6s84
	LV2NonhHq7OS8Wy2jZJ3hA6wLIkrCfCs05zMIABwBgz8XU46SkeSpw4FX3Q4sOhOtfzVmNWJLjYPG
	MX3P1TTuHayzunrhTDQPL7g+wkP5+ZFGQ/aYTZEc9h2vFp8MdysccgPLDuj1nRyr/gyvye9aQ0ZaO
	2EOcE44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx48u-0000000DDhi-0Cz0;
	Mon, 02 Mar 2026 14:21:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx48q-0000000DDfT-1fUf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772461260; x=1803997260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HJY0wdSVelljhVy5XonzAMfl6FFec1mLbXSyxYUN/sQ=;
  b=R9y+iTXEhxTS0SYADJSoepzPtQJEKqBYelepcEDo/u9dpfrgxzpnoDY0
   j+/8YTf5pgWZcc928zjGm1MN6x7TOw1bkJAghdpNmCoofACQXuHFic+Bh
   tYlLlJZArueeper9fDdQutGhbpiPklhJZ/LMmiLWVnSzIA/UynWdvstec
   /Zvvv5wTz5v/balsQEQ1dPNM+KhHBkELr80/tDZd/DBE30FlBprHBOcom
   3KJpdrj2/9iB+1+1vKZYm+3KCOFIXnwsGYB8JjJ9DqXcCDrx/c8aOalf6
   e5HB4xKKPQ23JLfmndhpchS+vs3ag4mz022bklfJoMtNuTrsTnHBWdL1a
   Q==;
X-CSE-ConnectionGUID: QKICduWAQ5ynFNkWd4cNxQ==
X-CSE-MsgGUID: zY7Ptu/AQQyv8r4ZKbZDKw==
X-IronPort-AV: E=Sophos;i="6.21,320,1763449200"; 
   d="scan'208";a="221349855"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:20:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 07:20:33 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 07:20:29 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 4/4] ARM: dts: microchip: sam9x7: fix GMAC clock configuration
Date: Mon, 2 Mar 2026 16:20:08 +0200
Message-ID: <20260302142008.3253-5-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302142008.3253-1-mihai.sain@microchip.com>
References: <20260302142008.3253-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_062100_526067_B9DFE965 
X-CRM114-Status: GOOD (  11.60  )
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

The GMAC node incorrectly listed four clocks, including a separate
tx_clk and a TSU GCK clock sourced from ID 67.
According to the SAM9X7 clocking scheme, the GMAC uses only three
clocks: HCLK, PCLK, and the TSU GCK derived from the GMAC peripheral
clock (ID 24).

This patch removes the unused tx_clk, updates the clock-names accordingly,
and corrects the assigned clock to use GCK 24 instead of GCK 67.
This aligns the device tree with the actual hardware clock topology
and prevents misconfiguration of the GMAC clock tree.

[root@SAM9X75 ~]$ cat /sys/kernel/debug/clk/clk_summary | grep gmac

gmac_gclk      1       1        1        266666666   0          0     50000      Y         f802c000.ethernet           tsu_clk
                                                                                           f802c000.ethernet           tsu_clk
gmac_clk       2       2        0        266666666   0          0     50000      Y         f802c000.ethernet           hclk
                                                                                           f802c000.ethernet           pclk

Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 46dacbbd201d..a42716e18da3 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -990,9 +990,9 @@ gmac: ethernet@f802c000 {
 				     <62 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 3 */
 				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
 				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>, <&pmc PMC_TYPE_GCK 67>;
-			clock-names = "hclk", "pclk", "tx_clk", "tsu_clk";
-			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>;
+			clock-names = "hclk", "pclk", "tsu_clk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 24>;
 			assigned-clock-rates = <266666666>;
 			status = "disabled";
 		};
-- 
2.53.0



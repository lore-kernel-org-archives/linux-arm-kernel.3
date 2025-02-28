Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FFBC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5Qp1OiMoX1ASh3/9ndULyi1wpZF4IWUdmCta6U5gPc=; b=KWek0cLJ03DIHJy59x7BnzC50a
	WpewsJ5zsDAWlayzXCT/6cnDMJXG9O0Cp6MUjfgT4g62tQUDIlsrqINZ7u4MTUiQzg6U4JTcurbMQ
	b1jkPW/SAcXiVfOzuU4T/xn+leaHw2lPoc0X4RQJN0dPfsw+Pe6Rzqrk5dF04+RuOuMxL36iZRruI
	9CiEumvJE6pglMKhqRlibLMR6REFFlcffuCHF1RUjzsau0RPjNyo11LTW04Hc+YZk5rEAxiLdpY0m
	v/+mXQriRsozPzlfhFraLGvd9EqtrkllulafZJq25ka1wZ9CJ6x2GjZqPSE0QuUmdyi2N0LaRW2IG
	aGSu6/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2c1-0000000BXYk-1xpR;
	Fri, 28 Feb 2025 15:49:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Ds-0000000BSOb-16f3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740756260; x=1772292260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C+WJBpj9bMXThG9QJfuqTXTLi4bYFGvQeKIFgFhaMJQ=;
  b=FGQDUXSkmzhlBXa7XHJHTDRoZnCWVpyd1Y5Bpk2m1J3f7OSXApTaYjMU
   zIkU0ah1J8HzxWVIZtIDlTMksHNx9U77Abz42BvP7bXYdPN+4cpA5AcZA
   pVOPN0SNKI1/+ShCEr0cDP49zMf9hkNxeVexwAxozjevMZMEZCu5H+Cu8
   UghdVpL7Dtz387UdOxCx/FuGMPhRE2/16HjcBL54kfXbj141qWcYlyGca
   ui7OKHWpLNlHpzuYY1fbAAFLCN5thLMfTxKUlGAldSp6sYxUpYWU9wXL1
   7RTNVZlGcTTGi0bKrSB0QFUcU3wF0BDECfmRc274gQcjZzzfpY/35GwHF
   Q==;
X-CSE-ConnectionGUID: YRQSNli+QiSyLIXFC1GTlQ==
X-CSE-MsgGUID: DEk0ug21RBa+XoE4zvTP+Q==
X-IronPort-AV: E=Sophos;i="6.13,322,1732604400"; 
   d="scan'208";a="42415303"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2025 08:24:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Feb 2025 08:23:55 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Feb 2025 08:23:55 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-watchdog@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v2 2/2] ARM: dts: microchip: sama7d65: Add watchdog for sama7d65
Date: Fri, 28 Feb 2025 08:24:11 -0700
Message-ID: <05785a34b9181b7debb57c1896cc733bd3088c56.1740675317.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740675317.git.Ryan.Wanner@microchip.com>
References: <cover.1740675317.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_072420_313536_EC6B1652 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add watchdog timer support for SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 92a5347e35b5..179d7f54cc7f 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -77,6 +77,13 @@ pmc: clock-controller@e0018000 {
 			clock-names = "td_slck", "md_slck", "main_xtal";
 		};
 
+		ps_wdt: watchdog@e001d000 {
+			compatible = "microchip,sama7d65-wdt", "microchip,sama7g5-wdt";
+			reg = <0xe001d000 0x30>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk32k 0>;
+		};
+
 		clk32k: clock-controller@e001d500 {
 			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
 			reg = <0xe001d500 0x4>;
-- 
2.43.0



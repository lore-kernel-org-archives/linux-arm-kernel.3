Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965F3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7uIzqxrII4dpIhflr5onZs4gSlW/uez7mZXoT6BJNk=; b=vtewZ2iyBfRMryRV/3CtcQl0+R
	52LJOym7w3cmH4A2EcoCvrwx5ZyRG53AHuU10OD2sRlZkIRZejzZbMn0yWxUZP2IaKMqA98WV6XKt
	Zz3NJisIo0ZJZgJXmUifBXkrNlcYMLZUMypDgpd0J/tP15IRNNoiOAgX8uQPyhne33c7yvkFey93l
	0WylXg7uRvw1VPr/Ss3qrBNEbthK6VwEK2WlivY7KF7rRJdlI6Y7cXNhTyb+rXg6iZHJQoPysuFWE
	nNJ4e088kyu7XpES5Eb+kKrEjhBH082zLGWcx/GmdXKTqY0KZELN/B/D5o1ADcCYuDY0J5foRzVpL
	GUKP/ZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZ8Q-0000000AZgs-12Rq;
	Mon, 12 May 2025 19:48:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYqN-0000000AXJ3-3HFk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 19:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747078183; x=1778614183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7g4YU5RvMdO8nUKIAvi8SziBhELB9C+O6jh6PDYC3HM=;
  b=JATgDiln4Nj2PiaMd/R6N70++lhfKE6+xf+Z+lFq2geOgCxdy17YOn4H
   W43h92rhWeJ8yLHzbcIgONs/kTThJO+6l+AGmHXO1Wmom22JlsDSVtR0L
   C3uCtx25yB4gBt/Py5ooQUtuLNP3cYyWkJCuLrNQSSxwwYFPBE58oSHyw
   eozDGQ9wk4FZ8WEAvUf1gQydKbIPaDjIu/DvhUZ7ztD5UbGhWqpxCWQxD
   RnHYS4syB9W53VOSnrF4sQndIa8tzbYRrI5ODYxXEQlTrrN4TpwFhRe/3
   n6h7ivKQ9b8ukuLVHL8I5wO5v8Kf7C+AdtYk/ktiUl99ghl0QeWw9//au
   g==;
X-CSE-ConnectionGUID: hYKpzzHaRPOvLPNNOvU8gw==
X-CSE-MsgGUID: pCEDP93tTVWVq4rPvoMskA==
X-IronPort-AV: E=Sophos;i="6.15,283,1739862000"; 
   d="scan'208";a="209006615"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 12:29:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 12 May 2025 12:28:57 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 12 May 2025 12:28:57 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH 9/9] ARM: dts: microchip: sama7d65: Enable CAN bus
Date: Mon, 12 May 2025 12:27:35 -0700
Message-ID: <0e34e0416c43f4de6d2cef5cea46087af4577a50.1747077616.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_122943_879342_0F88A5D6 
X-CRM114-Status: UNSURE (   8.73  )
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

Enable CAN bus for SAMA7D65 curiosity board.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 53a657cf4efb..34935179897e 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -38,7 +38,24 @@ reg_5v: regulator-5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1_default>;
+	status = "okay";
+};
 
+&can2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can2_default>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3_default>;
+	status = "okay";
 };
 
 &dma0 {
@@ -278,6 +295,24 @@ &main_xtal {
 };
 
 &pioa {
+	pinctrl_can1_default: can1-default {
+		pinmux = <PIN_PD10__CANTX1>,
+			<PIN_PD11__CANRX1>;
+		bias-disable;
+	};
+
+	pinctrl_can2_default: can2-default {
+		pinmux = <PIN_PD12__CANTX2>,
+			<PIN_PD13__CANRX2>;
+		bias-disable;
+	};
+
+	pinctrl_can3_default: can3-default {
+		pinmux = <PIN_PD14__CANTX3>,
+			<PIN_PD15__CANRX3>;
+		bias-disable;
+	};
+
 	pinctrl_gmac0_default: gmac0-default {
 		pinmux = <PIN_PA26__G0_TX0>,
 			 <PIN_PA27__G0_TX1>,
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BC4C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYsP4ku/s2ZmlGIKcWVAUTJaxKyLYtQ76A2A7rjgHX0=; b=0XhRANkjGFqY6Bkp54oRnDNdLg
	8TnPRuiNmBkiAoB+F2QCDBU+fOZQHIxE6a9pOUIJ+RGJIZnmX+6Gs5gPw4fzNygaNOVwIzOi6P+MW
	DxCktg1fBYyEuyJCxvIlENExwzANDMuXbk2x13aVfbs8NhE11GRrp28//+f/05ctKAbr+XuLef1ZA
	bc5R9Fdv11vmkWzUFZWzyN4cXIh/MOtfiokmE4MRa4CxKlRsgZQ0t67cDQwEBC4ituiP7WGLt2gKu
	Tvi/BI3Li1CnA6y3MQBTwR0StFFrz6Daz1JqTt4JqlC7OyeKhj+I+h/lkOG+pJIqlp9tgZ7AmV+sY
	ri6D1R+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTit-0000000BRZZ-3TkO;
	Wed, 11 Jun 2025 22:15:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRRL-0000000AzA7-2s4W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671331; x=1781207331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aDdyZCDm5RtgTX/poDkJ6S5z8PkXxnmyIfnGWdKweUk=;
  b=ZggPgCI/+N7h9FTWw9oT6UDkUz34OJwitkqW8ao7QE/7y8OH+GCX87/g
   OQWn3lbaXM/TWgdgXGN3r9DIO9zT9Z9qw+vWFH9hK//42/UGMqbtRWKfc
   HjvFAtaolAL1sGt7PWTYLLpuI515adCOa9I9s5tMmfzih8jMKgbRH9nL3
   zow7Zt2kX9cV2MtoIBcfukT+F5XiMOPxNZPBEWRa+FyZt7wBlO7hhrIvB
   A1Y8U0Vh/p62woKlShtLjC3vS1/Z3EhE5YJCtWcmtPsILVpA+tvYxoh97
   aXlCgPLMIeehNUcQn3W5DEeChTP64vjcP9udqOqRWNga6mftpVE0s7au1
   A==;
X-CSE-ConnectionGUID: Mlj04rVUS3aXDCaAEgxBzw==
X-CSE-MsgGUID: 6Xo02CoxSyS+i1Yy/BDTYg==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175099"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:48:17 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 12:48:17 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 10/10] ARM: dts: microchip: sama7d65: Enable CAN bus
Date: Wed, 11 Jun 2025 12:47:34 -0700
Message-ID: <ab719861de53432bdf19593fa4eee40adf57aed9.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124851_781554_1D334B67 
X-CRM114-Status: UNSURE (   8.99  )
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
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 759b963d987c..7eaf6ca233ec 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -40,6 +40,24 @@ reg_5v: regulator-5v {
 	};
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1_default>;
+	status = "okay";
+};
+
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
+};
+
 &dma0 {
 	status = "okay";
 };
@@ -277,6 +295,24 @@ &main_xtal {
 };
 
 &pioa {
+	pinctrl_can1_default: can1-default {
+		pinmux = <PIN_PD10__CANTX1>,
+			 <PIN_PD11__CANRX1>;
+		bias-disable;
+	};
+
+	pinctrl_can2_default: can2-default {
+		pinmux = <PIN_PD12__CANTX2>,
+			 <PIN_PD13__CANRX2>;
+		bias-disable;
+	};
+
+	pinctrl_can3_default: can3-default {
+		pinmux = <PIN_PD14__CANTX3>,
+			 <PIN_PD15__CANRX3>;
+		bias-disable;
+	};
+
 	pinctrl_gmac0_default: gmac0-default {
 		pinmux = <PIN_PA26__G0_TX0>,
 			 <PIN_PA27__G0_TX1>,
-- 
2.43.0



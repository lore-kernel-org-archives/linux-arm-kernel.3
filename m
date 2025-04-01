Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E11C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR4/f0mtsKc73YjsiQgnvXVXnZKOt/bG2klPE2s3dVw=; b=FVTI6yiAMXTRbF+ecPHOQ3TfRn
	ek9Irw0UtkfpLbojMj/5lUSrLpCComjBXSWoQjbRWzy6M48q067rQP39fHiKnS67VmKNWCh86jPAB
	LVVn5p1pxDPfZlGlbu6vqbHvc6VEjyaJqLoEoBwZl5nrku8U2rV0pMZPMmHJ15+JGACtZxcG0bj+M
	lbWZq2cGP7x7Y/2TeeMCIaKlyI0UX8taJhwwgVAutZOpsrKV7EG0LlS17QM24UVV6P70tRnQubuN2
	DUYFWCRMb6lJFamOBY+guy24bZ6udgMGCd5X75a/dsUTkQi7Ynvn9W5XvDmPhKYjhmBseUAvUqyoB
	/jX/Whpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeNn-00000003rIY-06Nb;
	Tue, 01 Apr 2025 16:22:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeEx-00000003pTK-0AjK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743524006; x=1775060006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yIQlV+xSWp6m0A0vkyE28xWvYegA9yXQmu6qD2GvGss=;
  b=XaUvc9BZ6ybfOCJuwIFJkMC/SzSad+ERuyIV9WTT2tdK0BJm+aZhh0Re
   k+k19Axnyiy1vSfr+x+fazgFLwJeJu4shLZiFHRfB+Q5yLIVYBfDLYBTm
   GPwTAZeGEDJ1oyjws478a88D65sDQZffUQ4PcC0+w84dFEwmkTJTw2zLp
   6U+OinWIXIgiqXpvariXpMzBuTonJ82zNR64seFz5IrHeavsROK6SIkXL
   IOY7jtgjrl2cKij8rohYE0i+fpZLgVyEX9IKoAT/CK9lHbMQrPM74j3w/
   PZy6VtWh6umecOczRG1uOOvS1wKLg6XDojbRlKO/7a36m5Q1nKmNaB5V6
   w==;
X-CSE-ConnectionGUID: ggLzNIpETriZ0zPViMY9HA==
X-CSE-MsgGUID: 2gYnf6TSRa2gsktm+Ip4hg==
X-IronPort-AV: E=Sophos;i="6.14,293,1736838000"; 
   d="scan'208";a="39512780"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Apr 2025 09:13:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 09:13:01 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 09:13:01 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <onor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <nicolas.ferre@microchip.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 4/6] ARM: dts: microchip: sama7d65: Enable GMAC interface
Date: Tue, 1 Apr 2025 09:13:20 -0700
Message-ID: <fca0c1deb74006cdedbdd71061dec9dabf1e9b9a.1743523114.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743523114.git.Ryan.Wanner@microchip.com>
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091327_152113_EBBE8E6D 
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

Enable GMAC0 interface for sama7d65_curiosity board.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 30fdc4f55a3b..441370dbb4c2 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -105,7 +105,58 @@ &main_xtal {
 	clock-frequency = <24000000>;
 };
 
+&gmac0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gmac0_default
+		     &pinctrl_gmac0_mdio_default
+		     &pinctrl_gmac0_txck_default
+		     &pinctrl_gmac0_phy_irq>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	ethernet-phy@7 {
+		reg = <0x7>;
+		interrupt-parent = <&pioa>;
+		interrupts = <PIN_PC1 IRQ_TYPE_LEVEL_LOW>;
+		status = "okay";
+	};
+};
 &pioa {
+	pinctrl_gmac0_default: gmac0-default {
+		pinmux = <PIN_PA26__G0_TX0>,
+			 <PIN_PA27__G0_TX1>,
+			 <PIN_PB4__G0_TX2>,
+			 <PIN_PB5__G0_TX3>,
+			 <PIN_PA29__G0_RX0>,
+			 <PIN_PA30__G0_RX1>,
+			 <PIN_PB2__G0_RX2>,
+			 <PIN_PB6__G0_RX3>,
+			 <PIN_PA25__G0_TXCTL>,
+			 <PIN_PB3__G0_RXCK>,
+			 <PIN_PA28__G0_RXCTL>;
+		slew-rate = <0>;
+		bias-disable;
+	};
+
+	pinctrl_gmac0_mdio_default: gmac0-mdio-default {
+		pinmux = <PIN_PA31__G0_MDC>,
+			 <PIN_PB0__G0_MDIO>;
+		bias-disable;
+	};
+
+	pinctrl_gmac0_phy_irq: gmac0-phy-irq {
+		pinmux = <PIN_PC1__GPIO>;
+		bias-disable;
+	};
+
+	pinctrl_gmac0_txck_default: gmac0-txck-default {
+		pinmux = <PIN_PB1__G0_REFCK>;
+		slew-rate = <0>;
+		bias-pull-up;
+	};
+
 	pinctrl_i2c10_default: i2c10-default{
 		pinmux = <PIN_PB19__FLEXCOM10_IO1>,
 			 <PIN_PB20__FLEXCOM10_IO0>;
-- 
2.43.0



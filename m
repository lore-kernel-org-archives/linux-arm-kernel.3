Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D19CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftODCMJWq6xxBVzz35BWN/b7GEhpvIJPEY0znOy+1pQ=; b=H6Cg7tbMH/e+A9WFXieac9YVC2
	5vsIeSTBoHBNU6YqCTAlMPaOoBcfhf+LOZd+Nl/Txw/V/c6X69XnFm9MQKK643l5utk+lEU3QMMn8
	A2vzXL3Xnuf9ZlBdBMd1asnKXLlgCrkIxFH7YZvry6Inr8eIEiQh8umdFhmwLuXKIIrfjxccByOER
	3IDsjNftW0BSiwSb7Fe/Py9FaiDaClVeUv7OV6/PBeMY70mVTMEY8Ms4th0Hy3SYrABZFcFRti7YS
	seEtCpiXNovIuWZtPw+cj7L2s0wW8PIX5PF3v5X6OE7b780J6XwQdOpB5fR7SjO53dJrRGfrprrL5
	JgupUZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET67-00000004FDm-0b5X;
	Thu, 30 Oct 2025 13:53:51 +0000
Received: from mx-relay17-hz2.antispameurope.com ([83.246.65.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET5s-00000004F9v-1gTV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:41 +0000
ARC-Authentication-Results: i=1; mx-gate17-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ftODCMJWq6xxBVzz35BWN/b7GEhpvIJPEY0znOy+1pQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832406;
 b=nVEr8TbguXCTXdawgP13ypW6xpV6BCWtzGzy2jZmDpnEVA9Y9+ynyZHSZtUytl0ll88qlhyX
 aO8llq5TRX/4NIF3ba3rKftCZ66xKYuiOfqOZB+vquPcmPkLxVkMhub9gJmNPInlEB2puqFYS3+
 sfyPpltT0WqFPI4DlZ1fM+eJwTs/2A0tOBBoBaYoQKC3x4o5XPJXPbZ8pQU8UsjZ4f22/tCKhQE
 rzxxL0Wb+ySD7iilXMTjqWh1ouG4r2zWh4Oi9PWOoUS3B6Ye1fSJEruUZoINEwB5SkFLYd66Mir
 qB/QP6Lem/nGmfOo1unpn4jfB5v/f4ZRKjHc9wUgWHbaA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832406;
 b=dZLuHNp58YK9kRFoFSL1blC/3XGVo4XgZDtuznbIAyNM1WjxQscq4d28ZFdikNjgzlW8snSa
 XOCJKk29EPgkYX4+Zt0P3xbwLo7nTrSbhxNyOZLyw3p2WOjKtNuIPIrLy41m0NSSXUsQouX/apY
 Y50Mc92qc727pRXWNCs+jZHfDE4WoOVZx7SvBmRLw87KsTzRtqhNhs77icpB4wwH4kUB2TguHeI
 vC79XsIIuPLKtJXp9LOaMgFNo0uNmWIj80Ni6RX6EYg18t2DvveAmHs207IkhKsbkap06nC2XJW
 nx3X7+r+AAP2xC16YFi8+6WyDZmjWuxuQpUwhVZ74nDEw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay17-hz2.antispameurope.com;
 Thu, 30 Oct 2025 14:53:26 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D53C65A04FC;
	Thu, 30 Oct 2025 14:53:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/19] arm64: dts: imx95-tqma9596sa: add gpio bus recovery for i2c
Date: Thu, 30 Oct 2025 14:52:55 +0100
Message-ID: <20251030135306.1421154-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay17-hz2.antispameurope.com with 4cy5D94wS6zdbpV
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4ebec40930e540c73b0a44225c3aa667
X-cloud-security: scantime:1.733
DKIM-Signature: a=rsa-sha256;
 bh=ftODCMJWq6xxBVzz35BWN/b7GEhpvIJPEY0znOy+1pQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832406; v=1;
 b=cCglES1hT273wx8jiW+rSanIxPIQxQ5yKTYZk/nOqoSazesY6ciXYOTKMQHkq0vtXBfawthy
 JuMvuznCD2Q7nEXg4bF7xBk4f3gyi+jl9HElngfrpQw/HIc0v+7ncfeSLo3Nvt/Jfzzr5NSgx2F
 CAUoNzOEPzDj4AXJRzBE0TFHa3hJlapvSMEIeQ+Ve5Ic+s23VNfnnCjqBagJ+6txEgbuHFjE8tl
 jVOU4Dwn1Aycvkj4V0EkTSAaoLwGf4aJh/oMCc7Y/X8wi9iZenqxe9JhAfyIQrR2XnjeadYB/oJ
 KiiToXUBqpyGO/aw0W25pI/+4jmB4Z6rLtukzcQVTZkwg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065336_928406_07E119BA 
X-CRM114-Status: GOOD (  12.49  )
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

Add pinctrl group for GPIO based bus recovery.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 30 +++++++++++++++++--
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index cc251505f6280..9c892cd8ff215 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -263,8 +263,11 @@ expander1: gpio@75 {
 /* I2C_CAM0 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	dp_bridge: dp-bridge@f {
@@ -299,16 +302,22 @@ dp_dsi_in: endpoint {
 /* I2C_CAM1 */
 &lpi2c4 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-1 = <&pinctrl_lpi2c4_gpio>;
+	sda-gpios = <&gpio2 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio2 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 };
 
 /* I2C_LCD */
 &lpi2c6 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
+	pinctrl-1 = <&pinctrl_lpi2c6_gpio>;
+	sda-gpios = <&gpio2 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio2 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 };
 
@@ -606,16 +615,31 @@ pinctrl_lpi2c3: lpi2c3grp {
 			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x4000191e>;
 	};
 
+	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29		0x4000191e>;
+	};
+
 	pinctrl_lpi2c4: lpi2c4grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO30__LPI2C4_SDA             0x4000191e>,
 			   <IMX95_PAD_GPIO_IO31__LPI2C4_SCL             0x4000191e>;
 	};
 
+	pinctrl_lpi2c4_gpio: lpi2c4-gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO30__GPIO2_IO_BIT30		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO31__GPIO2_IO_BIT31		0x4000191e>;
+	};
+
 	pinctrl_lpi2c6: lpi2c6grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO02__LPI2C6_SDA             0x4000191e>,
 			   <IMX95_PAD_GPIO_IO03__LPI2C6_SCL             0x4000191e>;
 	};
 
+	pinctrl_lpi2c6_gpio: lpi2c6-gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO02__GPIO2_IO_BIT2		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO03__GPIO2_IO_BIT3		0x4000191e>;
+	};
+
 	pinctrl_lpspi3: lpspi3grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO07__GPIO2_IO_BIT7		0x51e>,
 			   <IMX95_PAD_GPIO_IO08__GPIO2_IO_BIT8		0x51e>,
-- 
2.43.0



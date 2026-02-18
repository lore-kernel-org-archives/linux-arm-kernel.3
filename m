Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1864AE9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiUApqg4zpJm71bJ2yvGeNBnzVM6fE7lB1v/XBjmBkI=; b=Em/Le9kkphQuugPfwuLvLiHbE+
	Um0yGb2HgZHbAt3Qw2OKZHw1o2/xBsA7KPBgt7iIVpBC5nrHkkYtjoS7ZRDFv9/rHyXcGeK1HvXm7
	hoisZPJ8D/BbA7woLWZC6BokorEU+a1c3VHaPGvExx2gi/5b7XThEuczyvIhlU2T/uAod1Ei9u/fd
	ZhGrpCteSZfpNh5eesvLlBnmvud1AooZMJ5QaWwBiSfkokBg9dpKNCZ4bWaskUJKirNFSHMIjxEjX
	TjuYnQbyQ/FWP/bDDY71p7e8JYxjd5KMFe2gEZjDw3S0tHVQSsMHQJF53EtH/DeoB4KsDDGk58SJ5
	VFzH4WjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWx-00000009r4Z-1vWp;
	Wed, 18 Feb 2026 13:23:51 +0000
Received: from mx-relay20-hz2.antispameurope.com ([83.246.65.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWs-00000009r1a-0s7H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:23:48 +0000
ARC-Authentication-Results: i=1; mx-gate20-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=UiUApqg4zpJm71bJ2yvGeNBnzVM6fE7lB1v/XBjmBkI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421015;
 b=o4S0Jxpng4FeAnSg7+GV5NgNzh1tDbh31IeFDhfyQmRtdUn97A7D9bDkZTwODJ1hf1NvA7Al
 8ImV0EliRaPMCptFlMRnBmF1Qj1SrTI9kXD6yzG6xNcJA69kFtChY6czyrFXVGkoVMO3TVweFVS
 tUfdMbcudLogEAM6ZioBWc4UuG5yxggy6fQaaw7Y0O9Z06ikYwCSDS3bjfpa4acbXZkU4OCxT/W
 I8Ig0oeshjwMK/SCVpy57yzjQ4wUVnUdWgP5DX0F0YX728OzYpn0Jz3syBUPU+QVpaho0LIBjdm
 F4qXOuhxwMTLJrStraaOJtfvGxcbUznPN6lo160NUvfjg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421015;
 b=CGwXYfWAPl8JAbh4sxlOrJiHhUL1yR3VKw1qmSohKITDxNoNsyV6P/yazB+C13eeJ8MmY7f3
 c+3Xa7PKM8meboNSu6dLbyBgVet8za3UjI8GTV5BPJm+KQZ6HrYA9jvFTxsTclHw26lZjOTIYL7
 W5PhhxUCqvBGD3Bxkpoa5Kxac8DBo0w3P1EiSJUplPgKku3Y5c642jQGMU6XHGE43sUCadEQEC6
 Wn9bCLBdn2hluDMua23CUTcnodWGlu4vASmfV+R73slJeVW7XO5CQC/7EmJ5Wa0Ld2Aaxq7sFXF
 gDGWOoD0FVdrhLUVn1eYzZ6syXKd1wko6Rpoj5qh6jKnQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay20-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:23:35 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DB5C8CC0CC6;
	Wed, 18 Feb 2026 14:23:13 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: imx6qdl-mba6: add boot phase properties
Date: Wed, 18 Feb 2026 14:22:25 +0100
Message-ID: <20260218132228.32056-5-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
References: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay20-hz2.antispameurope.com with 4fGHJR1X1VzwTfF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: cfeeac45ac8ac4b72b7eb30bc089e8fc
X-cloud-security: scantime:2.013
DKIM-Signature: a=rsa-sha256;
 bh=UiUApqg4zpJm71bJ2yvGeNBnzVM6fE7lB1v/XBjmBkI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421014; v=1;
 b=Ng5pbXhqQvz4/C7b20xM+9m7eMs/eDwYXthelXvgANu3g83mLFhQ7TXslL7rCWmBKoYEwq+N
 SFPvd/yuGm2Vpv1b/EzzpN/RP+MR96TiF/N3MmV+J5qtcZmmQ3kawii8MmCbWnPmKzNGJ6TB9Sc
 56QILXmERk/baqsO/vb+zKnPR8mJhCytpUq2pN9K3GT70z7ViauE2hvac34O9IwahwphqQJx9RU
 H5vBT5J0a9LALmG32WlbWJmv1RKDco+E27iRV7v8+2qA7njwoj7G+zWanAEVg3vGAnCqBaMqkFo
 HAUuZBwSihITv5LwJHDa4KeK/VQ6ezNLGP24GvoW9q4fA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052346_397314_F3454E3B 
X-CRM114-Status: GOOD (  12.89  )
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

Add boot phase properties to MBa6 device tree.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index ee2c6bec92e8..74ccfe56828f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -206,6 +206,10 @@ ethphy: ethernet-phy@3 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
 &hdmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hdmi>;
@@ -214,6 +218,8 @@ &hdmi {
 };
 
 &i2c1 {
+	bootph-pre-ram;
+
 	tlv320aic32x4: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
 		reg = <0x18>;
@@ -274,6 +280,7 @@ &ssi1 {
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -346,6 +353,7 @@ &usdhc2 {
 	no-sdio;
 	cd-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -354,6 +362,7 @@ &wdog1 {
 	pinctrl-0 = <&pinctrl_wdog1>;
 	/* does not work on unmodified starter kit */
 	/* fsl,ext-reset-output; */
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -544,6 +553,7 @@ pinctrl_uart2: uart2grp {
 			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA 0x1b099
 			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA 0x1b099
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart3: uart3grp {
@@ -587,6 +597,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x00017059
 			MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x0001b099 /* usdhc2 CD */
 			MX6QDL_PAD_GPIO_2__GPIO1_IO02  0x0001b099 /* usdhc2 WP */
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usbotg: usbotggrp {
@@ -602,5 +613,6 @@ pinctrl_wdog1: wdog1grp {
 			 /* Watchdog out */
 			MX6QDL_PAD_SD1_DAT2__WDOG1_B 0x0000b099
 		>;
+		bootph-pre-ram;
 	};
 };
-- 
2.43.0



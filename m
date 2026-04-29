Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7FACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ei2I23cxbDY7cAitx1gRFwNnFrB/uSmdwFv7/9roIc=; b=G01nR+1cGU3dtv6W/wP0o/UD1R
	5Gd5Bk1YNYaZ8ard/9OifzcVNyYjnn1Bda2Z+mB4fjFBT2taFgCTlYUoQoPckIW3EBVMu8mLdMddv
	egk17qjMBLOv5o70gyjB8NlqUAKdxVJAoK/rwFGRMneGYVXX3rnNXEnxxbIMRl46B1nhkxun3mCl8
	0LiNfqr3JF2p7vDHqVeRMXCj7IrX91xwA2VZ15WCShaEzOZkhAkMPpakcfTKrA3y+PV+MzziTgYlP
	2YWyG3Q3oZRIJ+vl5Wa5pv6jnmz53WBfbpQ+y8ZIn658DTZdxyHEVplFsrI1UpYGuOGyqLip6Xoxl
	Ji91ptng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Ps-00000003iPJ-31JZ;
	Wed, 29 Apr 2026 13:57:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Pq-00000003iO2-1X8N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:57:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso128824645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google; t=1777471044; x=1778075844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ei2I23cxbDY7cAitx1gRFwNnFrB/uSmdwFv7/9roIc=;
        b=LEPQWfQL6495pU5JA581IMHmEv2JZrS7k+GOBCDm9Zl0q08Cojw9oLhzxzyzmo47Nf
         0o3EC0yvfj8W1G05IZZUmK0pPPpmglEl20bsaL2Nv22fkViIhZNwiE0S6QUJmawhRcVr
         zcVw7rwhoUIQp7HnH5suul97U5ZLSRNOzy5RgbpE0qUTSwy3x0J8msooGEkJlyLTL5ux
         RVmjly7S+zIkQkdtwf12aaQZwM4JlPQ2r3aUJZLb9V1484qdjwHPm9tqO3r9B3z0RVxD
         XlXDs6mocJi7BlHUuQqst+8YPHuzSnqH4ulJGXOdId3K/0WGOWe71E2Ld3+zdCeGWeEt
         bc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471044; x=1778075844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ei2I23cxbDY7cAitx1gRFwNnFrB/uSmdwFv7/9roIc=;
        b=LAqzVTV7VxNEQu6M314BZh+5RNWWGUKndmqlbxgNOlA6LEEgiGWl0T3Jufp2ZpcTY2
         ur6sCmC6hWWErCXj/oc3qCGdpdmdyK2t15R3clbk1JqfCdqeDPISdXmNXTAC/+tPch8t
         khak565MBwRBQpGyYTL/5k4urYHgrFmvr7ZPzrwnWYUOlztr0T6aWJpmnglhUvRRcjlM
         0I0fCuWct8b+bEb0Ut6WaLpl6thE4SAvyDgz+bUXgEqd6YgLd8pLQ179oCOKJTzN5FIk
         dOkiuXfc79tS4HHfQ6LX3l49JS4y/7piNjXsNCffaFy9l5SSFDvm6OXsirK+f4kXHSgR
         pFig==
X-Forwarded-Encrypted: i=1; AFNElJ+YhHAZbwDM93816XqlhgLDYB38e7bJY7PI2JXTze4gP1ChYu+0bM+wSTnZpGpBXamx3/w3Yb18MwSwWsDec9Hh@lists.infradead.org
X-Gm-Message-State: AOJu0YyIM/2svCl+679hFqDnNzZzDNR4wSySx7bLLH8Y1qiPlpQt7UeR
	UX4NsgV0oAdlqglzH31ZaNqpC1uLcDBEdLchTUuofB7UH93hOjQIN0RQFfRbVF/8GcixmPZPyVl
	iQalB
X-Gm-Gg: AeBDieu0r+0s2B8OmW0TmQfnU3KvHm5yhOBNk3EzIVsdUgGvS11R0hvsheXaXWK+w+Z
	HIBnfnCp9iVFHcRvAqRkzpJebpKzRlOp2k5CiFXwH39JgY/txDpJa5G2wC7cIcJJQPuxoOAGjGZ
	nw4Jv9Oi7csHEoYnd8Bg4IfhJSvuraBXOS8w3O/fSKdYSTF7rFxP1tk62Eih5VX+spKJbL1CK/t
	bQYPeEq+gZkqSaMMXTOBrw81RbGIvlDpKx3rSY0487y6qWUqAOcg1DBxeagdb+++wC/5/3l3n+7
	uxHtV8JPQlBJy5r1c2OgUCKFYanGNUAp92rhH7qQxMkFFYH78l7EDbdLcnlJ30Ndy1rf1s1tdeC
	KxhN510NSX00vJv7Pj+kVFLic2yXOLxTXHxtD/cCCiJOoXsK346/clXoHowsik5qqUr1rb1j6s+
	511a2WPSukAuYlXahc7GHIBmv4n1AhswTu
X-Received: by 2002:a05:600c:4e91:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48a7b54b1c7mr69612835e9.25.1777471044190;
        Wed, 29 Apr 2026 06:57:24 -0700 (PDT)
Received: from mercury.. ([188.24.13.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc1cbfesm68516515e9.4.2026.04.29.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:57:23 -0700 (PDT)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: festevam@gmail.com,
	kernel@pengutronix.de,
	s.hauer@pengutronix.de,
	Frank.Li@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Alexandru Ardelean <aardelean@deviqon.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: [PATCH] arm64: dts: imx8mp-frdm: add support for SD-card
Date: Wed, 29 Apr 2026 16:57:17 +0300
Message-ID: <20260429135717.178982-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_065726_435093_EC1235C0 
X-CRM114-Status: GOOD (  10.94  )
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

The i.MX8MP FRDM board also has an SD-card slot, which is useful during.
development.
This change picks it up from NXP's BSP repo:
  https://github.com/nxp-imx-support/meta-imx-frdm

Adding Xiaofeng Wei's as he is the original author of the DT.

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index 55690f5e53d7e..84034b0ccb12d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -42,6 +42,17 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0xc0000000>,
 		      <0x1 0x00000000 0 0x40000000>;
 	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &A53_0 {
@@ -237,6 +248,19 @@ &uart3 {
 	status = "okay";
 };
 
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <400000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
 	assigned-clock-rates = <400000000>;
@@ -289,6 +313,12 @@ MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
 		>;
 	};
 
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
@@ -305,6 +335,48 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
 		>;
 	};
 
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+		>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
-- 
2.43.0



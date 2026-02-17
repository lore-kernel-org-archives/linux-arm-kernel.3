Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C4CE9A036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozOixa4IFnis7hOv1BdsjCzbYXYnC7+PJ6nqzXPd9iE=; b=HHmExpCsB7PIwkMqO2Vp2OjOeS
	gUEzm2mG3SDbnpS11Q4z3urUC6v8/H2VDUpka13a0D6MCVrbaYJLWT0dcJBidRmYUwLEk0jY6ROG1
	G2V5QH1sAMU4dP+Ti4uBi0YYgsiFBIJW830+7k0qEl25PkdcDIhD1bGKdgem2gglGbuI8U5Z14yjv
	4F69NW+6kRJAq6apH53MD4qzOO+S64FAQx1NLPrl6FaTFOmcYGGato9en6DG3mdBDF70UshCQF8qQ
	NLjYwTTApLx8oMuy9wMkWdPmEadu4qCS7xlvhb2BHzbDwcikn0DnRHwyfuApKO1sFLJIfND0RU8Z0
	Jc97/wCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ32-00000008kTA-20Tn;
	Tue, 17 Feb 2026 18:43:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2q-00000008kI8-1xA4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-483770e0b25so40317775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353814; x=1771958614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozOixa4IFnis7hOv1BdsjCzbYXYnC7+PJ6nqzXPd9iE=;
        b=GvAOJm9vS8xoE4o8TPUtc6QE1WK3hTpRzgvZEtzCwcTsFlAzh1jTRhDTfKDm3rW05U
         PssKLOkZGKK72UzGb1wQFbMi20+B3labfRFrUc39guBmSLcSqSA7KrB/w8H/Lsm9uKZv
         I58AQfc2wwY3XtaR3rPuuUIBsV6IVycv5pVFIHLQkFEgF5cr27tUU66daqlAFF2Jxmx0
         0EsiJkfkcUNpMa+tysEowoLYQHfRv5rkIuCmX1DV0ewpuGAfGrUP2gwTizC/pUQgb/Ez
         b+Lsh6/rED5sNeXsgoq9qebRpt4r5zJQkW1nNC4TmQ73W4+VdD0+VTJDC3xc2Wi7KCyb
         FKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353814; x=1771958614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozOixa4IFnis7hOv1BdsjCzbYXYnC7+PJ6nqzXPd9iE=;
        b=urhSp41tnfjJztDgD0DTSuA13cAr0B1+3KR5CCQpq6Ih66VzV19ACgrc7RFJc0EZhn
         1ahje4ieUYy80Dv0UWSeNKFK5gkIjA3+ccKyAcSnqiG/CjhFb/IJhztmBwYIJHocUylt
         auVDZYiHORPXvusr612R8hBx71NqgHA8m/+MY+GI995WUlvECViaafUKj2LyYb3lByhw
         79VmO0rSmbz8f0uyFuw5ptA+AYAs0CkNpt9b6ZDcznbBNHMYiCD1KREPCiyBkvfStXnr
         PhFtf6S9CexeKOid8u6s7FFwrQRIn1VZr0JsvgSPMyqnb9TJhJz8SqptNe2S8ZrfG3gL
         tbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Nr9ufMnH7fmUo7W0xqIsXkVs/HzfCW1WRPfu5JUguXQWQyO2+YkzJ7yPEBTCsU4Pnu1ImxkKZTkqzp27F23v@lists.infradead.org
X-Gm-Message-State: AOJu0YwEjgqCdB0Un2eWKLsTqb3OcyDiHjIej60tvHxYrNc6lQFlXepf
	VaO2+3fnhiPINLBNHO3FwW5m7e8cIphsugN2SxnDXc/kh5PigTXCy4TZ
X-Gm-Gg: AZuq6aLbbe9E/7GvwFt8VZkuzEEQilZlSgXoio++P3x61jpdjoW26HMVJU5CMxqkFgL
	djO6CmXWFRaC5/lFrGJwoUsWwQaW+73ajj39e2ZDcuaQe01vRxzT0TaHtuvV4Rdbl2uK1Ho0SeN
	NvclTWUKp43jHV5UM3/xvR0dgpWzRV4YqIgToEWVIlrCQR5+RUFMaUp5HVdtOzZeqn6mb17z5Y2
	QspwyCFSoILOPRlD8Nm8Mt1Bc335IX17lXtLhM18byGmuEY6f7SeGHdfgQlJTCTfDFmeoeNP/nS
	P5pgGIlX4hd74eRupIsBpelxo4VtWXjCepGWX3iYoGh7aW8m8HelNdaJvxPs/NFWf1w9W7+Tcq8
	z+MfOhzmS3YI2jDETRf3ar9XFvVOis+2+Q2cB3ktJ3p6ULLe720Eht15cIJ/qPKfBG+BdtnE6kF
	xCrCwHJ8bkQnI765Z7MFiXGwx45M/nvVi9gEnET66rHXhOYGWDjLXIHuP+mekkBkHPwEimPnjeI
	6OCcu5Bga6yyVPLO8b80NVwoh+FQQJgCuPHDrBN
X-Received: by 2002:a05:600c:6912:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-4837108fed4mr260857485e9.25.1771353814118;
        Tue, 17 Feb 2026 10:43:34 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:33 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
Date: Tue, 17 Feb 2026 19:42:41 +0100
Message-ID: <d4d51b3ffb9b65564fa0eae82c4bdb5abb8ac1ff.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104336_545217_4B51496E 
X-CRM114-Status: GOOD (  16.03  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Move the USB controller configuration out of the i.MX8MM VAR-SOM dtsi
and into the VAR-SOM Symphony carrier board dts.

The SOM does not provide any USB connectors and carrier boards may
choose whether and how to route USB, therefore USB should be described
in the carrier-specific device tree instead of the SOM include.

While moving the nodes, align the Symphony USB description with the
carrier design by enabling both USB controllers, wiring USB1 to the
PTN5150 Type-C controller for dual-role operation, and updating the
PHY tuning and VBUS regulator pinctrl (including a sleep state).

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts | 52 ++++++++++++-------
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 12 -----
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 689894405b27..3242a0b739f6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -30,6 +30,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_usb_otg2_vbus>;
+		pinctrl-1 = <&pinctrl_reg_usb_otg2_vbus_sleep>;
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -117,13 +118,20 @@ enet-sel-hog {
 		};
 	};
 
-	extcon_usbotg1: typec@3d {
+	/* USB Type-C Controller */
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <11 IRQ_TYPE_NONE>;
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
 	};
 };
 
@@ -171,27 +179,29 @@ &uart4 {
 };
 
 &usbotg1 {
-	disable-over-current;
-	extcon = <&extcon_usbotg1>, <&extcon_usbotg1>;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
 };
 
 &usbotg2 {
 	dr_mode = "host";
 	vbus-supply = <&reg_usb_otg2_vbus>;
-	srp-disable;
-	hnp-disable;
-	adp-disable;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	disable-over-current;
-	/delete-property/ usb-role-switch;
-	/*
-	 * FIXME: having USB2 enabled hangs the boot just after:
-	 * [    1.943365] ci_hdrc ci_hdrc.1: EHCI Host Controller
-	 * [    1.948287] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
-	 * [    1.971006] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
-	 * [    1.977203] hub 1-0:1.0: USB hub found
-	 * [    1.980987] hub 1-0:1.0: 1 port detected
-	 */
-	status = "disabled";
+	status = "okay";
 };
 
 &pinctrl_fec1 {
@@ -246,6 +256,12 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x16
 		>;
 	};
 
+	pinctrl_reg_usb_otg2_vbus_sleep: regusbotg2vbus-sleepgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index e2b1919d7188..96293036a4d4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -411,18 +411,6 @@ bluetooth_iw61x: bluetooth {
 	};
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
-&usbotg2 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 /* WIFI */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.47.3



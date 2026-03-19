Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57517109190F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8vxnjwZOXE7HlXyNRQ9zVADAHm3YyuOJfN0fYbFcx0=; b=anIGdl3erincTnS7EfPb6wgGYC
	p604UC4v1uaqyB5LJSvAANH0oxhkBM3jwIw8ifeq+siSlBwFEVx9CM+7nn37yvuNbriTQCAHrx47C
	Sn1cYL9GaVA/b44Z3is9y9PmxVieajwjifkisGVHBraDCJgnS7toev/OjtAm22hSBzYl7n+U2TYy8
	DaH6WwrKAM21EjkcwiWaQwb+5GvMjHa7X49En9XhU+LWNA6FO4af7mUJMPPgACqey6NzxNErJ5Fda
	f+WyTTLKjQ18yDc0Jqg2QMbS+6kY4BIInaEjgxv1DaLbviSLzPZ2Yv7iQkBIhCYD4lbF3T+gxq+mg
	a77S5y3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJw-0000000BNYC-3IjM;
	Thu, 19 Mar 2026 18:42:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJm-0000000BNOt-15tG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 18:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s8vxnjwZOXE7HlXyNRQ9zVADAHm3YyuOJfN0fYbFcx0=; b=e6UhrZ08951AAT9igeldCJH46E
	fSBwmf59VNefbDjWUa3Qii7RB06pobZViqP5plrB1NtWB6GWOFtS8EB9gVPj+QvLNtgdu1fMfliiq
	Xz57vU/BC956hcc1LBqiXw3slU4OLEXpfM1YBCro6NCxYOXubtgx7f2KS4sDnxN5QBobJDzElynch
	vXkulpg3cV2uBoC7xtksNEDLdgf9XV0QfJNiUe5IDMwx1mFABSkEZHo5eurHCIA2r1PObnCcAqh7q
	+qC1yH3VrTImi2XYRdMNqiubXtAwFw3Xe420PYoh+rDsmKAxGCIh8ax9JpOOwkySYxlAGtL7TtKdv
	1uI5t/yg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJj-0000000EH6p-1VNJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:42:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so10780035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945718; x=1774550518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8vxnjwZOXE7HlXyNRQ9zVADAHm3YyuOJfN0fYbFcx0=;
        b=E5aUtiSamhjn0hVaikatFDW3OtNQb0tlnifm/JMAvJaW0I5stVE6swz2POq34ckqV3
         m/O4eV5GvZ9KZrA13nDi1RhssKPW7GzUYGwvlmJh/Kfr+4aPdrhH2BS3MUDrI7v15daS
         sM8nI9NyyDsZ792yaNlgJ2HJHHQHxOqGU7xGJIoyd0QgTQB+uXQij8xmfpdDbzsgveEm
         gDRQMWGSxEftcAV0WYp2aikmbx3lV7msidI9s6eQ2InmmrEEyHDI4Ox5zc3IwiPT8OQN
         C8rGSzsiC/PT1GHw5aIM+ixp2ovADhPAdPXJ/a835BscqV4BMqtb/if0vqgGd5tWCUgt
         YFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945718; x=1774550518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s8vxnjwZOXE7HlXyNRQ9zVADAHm3YyuOJfN0fYbFcx0=;
        b=pbtHP+vIb4Uol7XuliClL2UiwPvDtk0uJwx4DoTMYgLvVboFzoUiSnjLX6AS+qY0/z
         fqtz9xI5WUgGlfDbxSCVlRUXqyBvlIhCfLUziwuE8UYYztZv/25MBdS5ka3tCcg/cVnD
         yOb127Fe/JyP6EeGL7/gM/u4cquE0DdGuybFOM8iiiqUIANfQ32OZgKUOK1bf31TKmfU
         56/5624ffQUuw46i3fbNNm0dR8bkM3bNDaa2jYNUZi34NrnmAmgvMfZMljXanYQYqUAD
         SiRtTeOsONt1VahOY5VJTtek8EGNT4h+qtxHCWEfCcLRD1qbYiimxl977xsNH+BQhsdI
         Dn9w==
X-Forwarded-Encrypted: i=1; AJvYcCV1Il2ARDfeGp+BbRxQN3wKnvwDDfv2D7is/XLqmRnkDH1LwZ9QbskLgEOsT2O72J888v3CeDr9O4BieAsB7m3Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi+adI7rNtlmwvLp8v8f11V6gpmPDtG1YTnPvNnroD8iJtorwa
	bnpGUPionhvmH89h99hQ6Z3qnPs2Y4/yT162Xx4krsv+4FOQ5JZrVEnKj7hZLg==
X-Gm-Gg: ATEYQzyc/7ipWFZcqTBrU8jtAiQEBcsLu5Lc4/qh5uotntx+7sORQtYSWAxv0JIb4MY
	C50fEU+z5iaX1L267K9+7oC3xCRjAniVAc4Qb9gvtnzhx8jjAnrvSrsfky/NcOxvbYZhkXYSejS
	H5iKc09MLbxrHoz8tsQbcbTlYGQ6BRmC5b9ZnrBwuSR9ZAZVmGqPVQBAHx72hL+aR8sOw+x951g
	aCke1Pg5dGs8LZcllzMdAVx50hQX65H267oyll0OW80/fAryxk1dwHyIZ3yHhLDfBRztp+6U2wW
	vSzqrd3uRc5nHOUVTb8euhvLvBelhx5ZBYRIpgxePsVvamWQMS8sx7QbdblIBlf93wXKKtpdeTZ
	S5DmodHwORL0u2RI4pgMb+CkUL3W6teCkh0a/80k4q3i4a41FEcLfluPScJnu7Sh0EuLovUIXJ1
	ZDmSB89s40KoTYJAxNa+Ci45P/UUAMxvu/biVb3RnMiComhm0BZWjgrMCM9LUYgAV+U+D73lDFi
	v8OXA79HP+AWsRiJ6oIqQKeqxY7xRCcyKhTGgxojqaVRkjkHw==
X-Received: by 2002:a05:600c:8b31:b0:485:40a4:364 with SMTP id 5b1f17b1804b1-486fee1af50mr2335955e9.26.1773945717254;
        Thu, 19 Mar 2026 11:41:57 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:56 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
Date: Thu, 19 Mar 2026 19:40:27 +0100
Message-ID: <c0b7513b9a6247f3d11bc3292f3b4e6d6602ea69.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_184159_492044_C22F0A6B 
X-CRM114-Status: GOOD (  15.68  )
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 48 ++++++++++++-------
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 12 -----
 2 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 2b608470da8e..a425ee0ed8a9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -32,6 +32,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_usb_otg2_vbus>;
+		pinctrl-1 = <&pinctrl_reg_usb_otg2_vbus_sleep>;
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -133,13 +134,20 @@ enet-sel-hog {
 		};
 	};
 
-	extcon_usbotg1: typec@3d {
+	/* USB Type-C Controller */
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ptn5150>;
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
 	};
 };
 
@@ -187,27 +195,29 @@ &uart4 {
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
@@ -262,6 +272,12 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x16
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
index c37badc4cf27..75f56dc89b8e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -378,18 +378,6 @@ &uart2 {
 	status = "okay";
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
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.47.3



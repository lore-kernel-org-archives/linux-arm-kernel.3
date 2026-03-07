Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA2EFCC057
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXppVponufibYNJUrEWp0KeVC13KUsLoWozvPsPqHDc=; b=l662GbROS/lY20BR67ZPVHawS2
	aY5zjDrcIS4Sur4npWYiaddjXqWNLLKz43cjSshlvIjmM0b1hOMozULSZFWnyuCNqEcT0ta6JeVqR
	ytAjK8RjvI61VoKV4LmpR7wiKhyeU/LYXWeIZrkPs0H8SQjOB+jYX8vB8lRYZEHGNkdDo1fI97Rfg
	jARQvlsjgWBHxMq+A0PM3fVvV/49R5N4RkXARr/edCAAKA8dvvISvfPFa+5j6AxpLXjyQuKHnmiwh
	fClpnAq8WaH9n33Y0UCVSk4kjzZ7f1CInrqDTlkRf2YPRoUfPFSMacoyGWk79/Gb8enFWB4EKahBg
	8YgqhrBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyu00-00000005K6z-09NS;
	Sat, 07 Mar 2026 15:55:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzt-00000005K0a-0zUc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-483a233819aso101141745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898919; x=1773503719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXppVponufibYNJUrEWp0KeVC13KUsLoWozvPsPqHDc=;
        b=j6gGftqi3jKWUqkBID/JRuoKWC0A4gH/5RdxWRXAWgKh0sAAt3nBnx3pd612S+Jjzj
         JKFOyS4kHcD/h1rGc/YGJ6chM7fBwmkvu3xHKfM/wBNt+VMz1KRwivAbLpdvin6+ba38
         g8myFi9lLB3ELrqgbj/iQTF0BmyKqrUJae+JchEfbcmPa/LXXwINSZQ0TetBvPKBugwU
         F99ALZ6/dYNjnVbylRcV9coa8nTJFtIRLGkrsED3ejMfAE5okzYgtA6gbgXRAut3ID7K
         MJMI1ev2+lx+k97oHRVk+fkWVJmMFU+MJPZCO5Q5/hYOY5Zrmh6RkvnUVH2IKMq3YkAH
         CdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898919; x=1773503719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXppVponufibYNJUrEWp0KeVC13KUsLoWozvPsPqHDc=;
        b=rEFq7ixqDVf81B00YWT8n5LNh88XdWH5RI4ZzVHS3kehwSZLeQZ1CDP5YPiFS54GQZ
         PljW0DBdOZyU9ajVQ9dcSODibgMOxnXFhZ85Ao1LZuMG26PVDmDyQI9RZPZQCN0Ld0HC
         UhQQWntf71J1w/nMarOJ5hAbRUqnSegeSVD3xcYIUTWd5cjvyWXUmWKThHH2w1GdPyLm
         kcqKZI/HwudwKVZAZ8+zpSzEG4cOoRhmCPL1ujhaUaS7bZ/UAJ/FnFmJWXkPtJF226Du
         H80H/iGT7sb0qNk+1KCTyTwMAL84gyrcwZ45E103rQ3YCrkIRACdHsZwV2v3/japOPkX
         2Kng==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/mXpxqmOGnc2uR86BfgBV19s3dRwGhRW4WRgDsmo/YWw5YhTr74p1LJwSs32lDd6XohKlrfG0JhuFTn3rAux@lists.infradead.org
X-Gm-Message-State: AOJu0YxUlu7auX6MhtmdhivMSgudQnC4MXbglj1Nnz+YZZlu5+dlzo2Q
	+VWT60RfOyq0QfpOGVRCyinOQhrJXUPp3S3I/agVvcCQXQ9lWeNhFa4i
X-Gm-Gg: ATEYQzxfVhYpaUboXcASfD/0wlqHOT8sHam+JC91pSX6YqS+xYY6DzzD4rH9Opr5GTi
	hOkhlo1PyPm1oJC6lmAzkpGb5ViublTQ2HjsLgZPnjav5+QXly9ZSbu1Aqi4t68nlue8tJ0/ACJ
	bORMEPCnKOIG+ZBMHWRQO35CC3TJJjTClZY6wMw7OREmCWwYJurSZ+qCpqRDJ+OzLPE3lg75H4I
	6shSxTJbo4rr4YaGHMtFk0888R4otD13IE8CzL842aUcSYqPdJxx2nG0kdJpkKknkuKNtOGmFtw
	EGhgVwA+Nr++q2LnG6k3URLvsYt2FoWV0UW5uKmyCubfXpgTlRsgtgFGaCtAFZbqKeoIgu5fZ5s
	R3iPQIDPeg3skHM+7z/1utU/qFhjMCCSwYVPqZLKTBX7aXTaDAF3QjpOKt2heTK/ULD30/ix9G/
	zH5jSo5Kxv+6wV7jOJf21VmRtjdw0OGCNc3xb9fWptncpJ3+WFKINaqNsQ0u/odZAB3nx8HWlF4
	Gjif07mCShXzjBKpXzMLdiVOA==
X-Received: by 2002:a05:600d:8445:10b0:485:2f8b:55f2 with SMTP id 5b1f17b1804b1-4852f8b5ceemr22161775e9.24.1772898918961;
        Sat, 07 Mar 2026 07:55:18 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:18 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
Date: Sat,  7 Mar 2026 16:54:43 +0100
Message-ID: <04b20cb1abdea86c551a851a19eba8fce1640c87.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075521_335259_7AD907C7 
X-CRM114-Status: GOOD (  15.23  )
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
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 52 ++++++++++++-------
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 12 -----
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 51ac8ee34c3b..86246de8f36f 100644
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
@@ -140,13 +141,20 @@ enet-sel-hog {
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
 
@@ -194,27 +202,29 @@ &uart4 {
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
@@ -269,6 +279,12 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x16
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



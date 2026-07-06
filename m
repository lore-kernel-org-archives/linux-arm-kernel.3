Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/2A7YnOroeJEFO5nPIrjvO/9o42R/QUT3pw+IoCgcU=; b=Od8v/zhM8KouR+jLvlUa7PRE+h
	fzdVfZO2cdLVkISKZlKFKtS83h6T+VsC0jLo5WQKQ1dkN6F9TmfLY7wdAYFGlgeVQDirjjzdN5GLl
	9VJSrs/bZtV/b/dxNXcwf/PlywVaE5wgoES7o7t51CaarVvFpEckBT5wf0xm1BmFoyRGFY/kmsSVq
	1mauTU0xE61LfRmhbTMfwRG/Zy/CwutXQK1vRdsDnE4PvEOXh9Ssu5Ry7oLbHVhSLuvOCI/Gz8CRr
	aG6v/nYRQrvPHwbgr3haV80YpmzGv4CDurvL49mjshLWN2i1PH85hwRfbYpE9UT1spcMtYJSX8cbR
	q59LARNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfj5-0000000C36C-2xqO;
	Mon, 06 Jul 2026 09:34:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfj3-0000000C34E-3bsJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:34:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so10826405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330492; x=1783935292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/2A7YnOroeJEFO5nPIrjvO/9o42R/QUT3pw+IoCgcU=;
        b=EBwYfZul+FLk/OqQ9ijCGkVBX4jReFjHyl1UkO5xOfqsMX6d4yAitSXH9mhF+CtQ/8
         4d7v27dpyX7XXdrDanmcy0CV0jpCb+++0ta6OpzuNqjaVGO+j1CjcGIfnlithJU3+FGO
         tshE3mbRqaqBc4MBk3AEi7KIatioRTXiSPxcUngQ08CLb9NqHsNhMlqe/JRfvL1iWEgP
         eKSX4C1IZyT/qOeNtd2L3JMA5rAq2TpcLXef6Pq+7bNGR+F2ZKketaMHM6Ccx/ZP+fPZ
         uznQJXqKg9Q8J1QFlu1hg0lwRchxWRQhV1/jxCAN8PtHaIOu7VFrpaiMLsSXv2sFjwtf
         O1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330492; x=1783935292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g/2A7YnOroeJEFO5nPIrjvO/9o42R/QUT3pw+IoCgcU=;
        b=cgecAghoLRtz8DMjIBpbtn1aHRN66OsDbDXtNRG7RG+is8eeTi9aHLi9sXq8Xta1DN
         JJJ7RMycPQp1LWMrg9Dv8ESjaOyb0CrXQm9c8PslQ4HVk8Lxshit+5bbcVsMpPzEBavk
         ZnHeaqj/7QFazkkgTMYXY6AQuIIPXNqRnz+uDhhnNk+UQ3a4BsAzsOdzANhkTxFEuiYO
         KMqCNJK9G1hK3vrg7FgS1k0AWoZO9WaeRkcAg8EtlPaz54GLIZRlTe+HKzD04xaArkg4
         QW20TfBjbmLXUK+b8Uco0yvF2+8uIK7nlz5t/UOn9UgyGttH/cxBGl8fvZ4xV7akYjjD
         G4nA==
X-Forwarded-Encrypted: i=1; AHgh+RoRB/A+jGWIqjN2EA2oKKN1u/kZiduAG93Vx/aRKxLgjlRndLoxma1CH8Kua5BNMlZm2/kroYTUGAqOkxaxm9Bf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi0u01zt+vpQfxuuz4B6Q1QZj7MDZz1F/uCxjKSnuOK+AScTBS
	92RLYKyr8TcsFmefd3WXTLPQvj/jVwVxyRY1Y41otCoY4dFYsIf43PSo
X-Gm-Gg: AfdE7cmjcb44r1tccaZ+2ug+NybuSV7k6c/LMR18Tp8J6FoP1VVKiBZwECWzl7BiLv9
	4ZYWnVdif+OR0iAlz21jv7kvkUV+1IighhRViDcP7Xw23jWld7YvvRgLUocbuIaJAaFULCmGGLK
	iXCejzp9G4qEY9kxQwnwkJVcr0FinYpOy8s82PBKU4wPMBcsqiC5J1112QymgE92rMTy9AXqmT3
	Hi5/2uEcyVmiQamnridM7Y7eEGKO37T8aEMB1sTATEW5exwywauoAjyhlIevPKRTH0/xnPvi7j4
	jGmAsycQEOkHDjc+2cD+N8QvMPeMidZx8xtWalRIS4r4zGnER9cBl2M4EhvZhevzoF8Yq93Tu2X
	Dop7hTqt24qMpKmDwVg/Mg40OxdX9SOXVEcrv+gQ6lxOQMwasiQ2OgxplY+rFvbUPapYwU8rQ6b
	761q+YMVxXrCwdsyA2GHsUulpvO0WBZZj058Hqo5LTNUkxUEEakclutavUrXdNVM79S9mhIqN6F
	J5j0n4zXTDMntloJKdkBO9zzA==
X-Received: by 2002:a05:600d:844f:10b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-493d11f03acmr74713315e9.20.1783330491864;
        Mon, 06 Jul 2026 02:34:51 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:51 -0700 (PDT)
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
Subject: [PATCH v2 01/15] arm64: dts: freescale: imx8mn-var-som: Move UART4 description to Symphony
Date: Mon,  6 Jul 2026 11:34:31 +0200
Message-ID: <3ddf65049a048dc4760df1e8ae5af4d3e91ca77f.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023453_915249_89CDA23C 
X-CRM114-Status: GOOD (  13.24  )
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

The VAR-SOM-MX8MN module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mn-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 3434b189fa58..b07e71d3adee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -15,6 +15,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MN Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mn-symphony", "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -171,6 +175,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -234,4 +245,11 @@ MX8MN_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MN_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 38ef9e4fdf07..32f101ef2850 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,10 +11,6 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -432,13 +421,6 @@ MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3



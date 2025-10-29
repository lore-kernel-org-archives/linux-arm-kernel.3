Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B528ACCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAZL73WPFIHN2VTWaQ6XP1b9wcDV8dTDSuc2UCDs70I=; b=Ym1B335/yadeJvkzL8sLnyFlrl
	tF2TeN0hW72/hTfr2Wa2I2Ijqo2J4sMerj3RbiX+VhhfHECvyhigOJPsvIlT/P2rMH3eos3Y0ol09
	cqkrWnkGy7bFIkxG7ZNOgAODwR+YhJL43LyuOpfZ6yoOtBi8QopPGcvrSfEgzdso7GKL4B1zn0lz1
	RmLqt0rCphy7oHEaVXAQK9B8jM/NqzZNWOjFOhrC5Aa/MqSwvSW8rHGDZ6REf+yEKLv8UchwfoO3w
	gtP3q5Yspju/vWnPMWEinlhAHkdeOzSSD6/2SbRC9dLQATwCweVUZ2uud0cmmNa2RZj7/m3DhC7Rh
	Ibn767XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBrG-00000002bWD-2QhN;
	Wed, 29 Oct 2025 19:29:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBr5-00000002bPS-2iLL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:29:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b6d345d7ff7so290515766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766150; x=1762370950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAZL73WPFIHN2VTWaQ6XP1b9wcDV8dTDSuc2UCDs70I=;
        b=fKr5OHlbbMFyZg9KbOWGj9qHqa8jmIK0vmoVyyParmduTXaMxUnySzPcF+gwgINL6q
         CFdO8HxqaNJ8B5t1tG6HSnl2Pgx8oeLq1ztx4PgFDI1RE1wDLY5Zte0oG3PfItNbvDsn
         PXPJ6C9tZd5wOJl5VepthSC3JZI3LoMe5bwkJxP0ZD5zxbprK6JLHwMJivlOkf95McnH
         InVIRp1zhLXJwdrZj/icOKd/N5KJMnOggazRHRr7mgRqhX47hIG+nHfg5qlc4wVXXVq6
         /+OVGTwQC0ecEoyMBB+i6PCTdPPgYPqfp13GHEbrtavpFp6tld164PyEnVSWnoPJqsuW
         DiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766150; x=1762370950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAZL73WPFIHN2VTWaQ6XP1b9wcDV8dTDSuc2UCDs70I=;
        b=cVJ3ET+068RpVhmfSI6KJZ0cJbnpOm3Rj2iqHmXIAQGMg1WuQ0/SkPTIOdQ6gbgcAu
         0iOPkdC+QKk+2uqyCcIlI3cxvF/gLeLkdZSLnF8vKpF5x3DW8q8WpTLxGCXkBLIg2tna
         zp/yGs/VRCLu1IioZ+T3lv+goc01qKUId0lvX4/JiYpegp8M26BN9/TX2EaBDHinpNd/
         XEgTTdtQZnRAhL3hXw+aHyU0nwOF2yiTFHTVQPye4eej2JwzxoSwJnGsvlTll6dfMCeS
         hmguCllOD60XMuRIsHagLgSWNqvmjAYKbSHyZ7X5v9L8y3No/PX/MzHPCuvam3of43Ir
         ja2g==
X-Forwarded-Encrypted: i=1; AJvYcCWUu3N/XrJBbUT8bVlE1JgC/gFzTC6peh6/jyvXQgr9amBRDGNLxwI7EcgZIDZjiM+bfpqeGbf3xSYaAsSNinIr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh9Psc4cxzwucLeWQ6Gk33owM8u544G4DItm23u7flv6V2i60d
	U7DgnP28ogdS05PNVX913rGUzx1usoeI1tOo0kj9PpPgC/Qxd2AlaTlW
X-Gm-Gg: ASbGnctBX5+NEc5ocg0bdcHLE8SQrmtEfWvseGJXLXqfJDcqwtOmn0x/kZ0SP47Dt11
	mNF8v4vp+B+yZTvTvLeNH0sVcSKFazDkioampay56z16OWQOsjnEQoEm1f+vDQaLzcYGVar0WDF
	7PydEtZ1Er+KlLCEIxNcw1o3bGZxTGYD3WbvVmLyLVui1f6STipOe/5sL8krayMHPL9l0PMNFd5
	R1ME/yVQJ5uCY1Us1RseBRKj3+acORSy/vADu8JtmKP9xx+LQynfqHUiui57FY2Rt07UnKx79UK
	y9W3vMA7E4DUeh2mJpKWRB1Yur/Fgel94tXomrIDfVANyErraJvVfdG3uDSEk6AzlKP79D1ZuB3
	U9l/RpnrGEZlp8h/BlpWCNlwJTCAz5YssL4Xa/tmXE8p2LTu7dPkHo2WbqK/Sdpl7t29mUpcyIU
	SzzzuXt3xRyQTrRte2RDeDyIFTh34cYh0prIy3yPlJ8YuSyQB65tHVun8mF5f7hA==
X-Google-Smtp-Source: AGHT+IFoA8vHjH7L7A7O5BYxTWm3kdq9AbZkEIotO1WtkkfV9Jwy/FnFo8J2wfIiFOBVGEd666tsSA==
X-Received: by 2002:a17:906:7947:b0:b6d:545e:44f6 with SMTP id a640c23a62f3a-b7051f630abmr98050966b.12.1761766149655;
        Wed, 29 Oct 2025 12:29:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/4] arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
Date: Wed, 29 Oct 2025 20:28:46 +0100
Message-ID: <20251029192852.656806-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
References: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_122911_736671_8CE884A9 
X-CRM114-Status: GOOD (  13.36  )
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

Add device tree nodes for the WiFi and Bluetooth module mounted on the
VAR-SOM-MX93. The module can be based on either the NXP IW612 or IW611
chipset, depending on the configuration chosen by the customer.

Regardless of the chipset used, WiFi communicates over SDIO and Bluetooth
over UART.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx93-var-som.dtsi     | 94 ++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index a5f09487d803..97198007b545 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -12,7 +12,7 @@ /{
 	model = "Variscite VAR-SOM-MX93 module";
 	compatible = "variscite,var-som-mx93", "fsl,imx93";
 
-	mmc_pwrseq: mmc-pwrseq {
+	usdhc3_pwrseq: mmc-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		post-power-on-delay-ms = <100>;
 		power-off-delay-us = <10000>;
@@ -70,6 +70,18 @@ led@1 {
 	};
 };
 
+/* BT module */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart5>, <&pinctrl_bluetooth>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 /* eMMC */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -81,7 +93,27 @@ &usdhc1 {
 	status = "okay";
 };
 
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &iomuxc {
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15                         0x51e
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
@@ -108,6 +140,15 @@ MX93_PAD_UART2_TXD__GPIO1_IO07			0x51e
 		>;
 	};
 
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX            0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B   0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
@@ -123,4 +164,55 @@ MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
 		>;
 	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK                    0x1582 /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD                    0x40001382 /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0                0x40001382 /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1                0x40001382 /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2                0x40001382 /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3                0x40001382 /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK                    0x158e /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD                    0x4000138e /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0                0x4000138e /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1                0x4000138e /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2                0x4000138e /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3                0x4000138e /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK                    0x15fe /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD                    0x400013fe /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0                0x400013fe /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1                0x400013fe /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2                0x400013fe /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3                0x400013fe /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20            0x400
+			MX93_PAD_SD3_CMD__GPIO3_IO21            0x400
+			MX93_PAD_SD3_DATA0__GPIO3_IO22          0x400
+			MX93_PAD_SD3_DATA1__GPIO3_IO23          0x400
+			MX93_PAD_SD3_DATA2__GPIO3_IO24          0x400
+			MX93_PAD_SD3_DATA3__GPIO3_IO25          0x400
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3-wlangrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14                  0x51e /* WIFI_REG_ON     */
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07                0x51e /* WIFI_PWR_EN     */
+		>;
+	};
 };
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA2FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfctJJbkEm6DO1IKYG0xNdxuUwUS/0B22DblND1pchw=; b=v0SiB7W3On1NxYZDksmVb996A5
	wSx+KIvEsiTb5Lwdl1TKR0bsvm6NECirGuw9/pKJr6H3wArnrBecMbjFStC085VqjwJvIZHIYuq9v
	vPywh9fi95Tpld9sy9iFcOZgVS36zKWbB1IplH9BhQRHQKtTBvePwpL/23pglTfvPky2vCF/2IfBT
	qdLdowB6yRzOP2hz8VIv8gDgZdPez+zsQ/jD+FPfjupy38GhXIp2ow/sXTdEfBDPUmCzQvDSev5Dh
	YlaNJr2kUlUMsH0xE39MP41W4Sv9jbv/9UlxWkkwnByVvVAYveiIfr/wW7k0utgewtt+SLnEtv0Jr
	tPZUGx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fdn-0000000FMgV-3p9w;
	Fri, 18 Apr 2025 06:55:59 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFu-0000000FGhN-04jP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lfctJJbkEm6DO1IKYG0xNdxuUwUS/0B22DblND1pchw=; b=R0WU6BpdkEQ3DtzDOlOOjCrBr7
	AQIndtJRRgwGT9czb60DqqlEY5b0wor1QOeBhQixLnl7tGl47ti1Lh/W8ChogpTZ8RPIRk9LNCU/6
	MHVBX6FVVZxacEMGZ7Wyk/y49jgSuOyXIwAyregIL2ZOWfbnGHhy4MuQWbWRjSrl6P5Ca+bbNXimo
	prOf+hjMiztrxIvw9ciJBxoiCwn+l5LIhHiInyj8s20xbGdwBHwLK0D3ffd9ljHCh6wpBPjKETFrP
	Wgu5Xx0fKyPmswHaqq1Zs4/TgGutJ3pOZjP0rMNBt4ex1Js75/KGn/1PWZLGCb5uMrkQC3n0vj59+
	hpeNN3tQ==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFs-00AbM0-30;
	Fri, 18 Apr 2025 08:31:16 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 10/15] arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
Date: Fri, 18 Apr 2025 08:30:59 +0200
Message-Id: <20250418063104.2202085-11-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_233118_227638_EB15FEC3 
X-CRM114-Status: UNSURE (   7.61  )
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

Add support for RTC connected via I2C on phyBOARD-Segin-i.MX93. Set
default RTC by configuring the aliases.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v3:
- no changes

 .../dts/freescale/imx93-phyboard-segin.dts    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 525f52789f8b..38b89398e646 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -17,6 +17,11 @@ /{
 	compatible = "phytec,imx93-phyboard-segin", "phytec,imx93-phycore-som",
 		     "fsl,imx93";
 
+	aliases {
+		rtc0 = &i2c_rtc;
+		rtc1 = &bbnsm_rtc;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -33,6 +38,24 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 	};
 };
 
+/* I2C2 */
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	/* RTC */
+	i2c_rtc: rtc@68 {
+		compatible = "microcrystal,rv4162";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 /* Console */
 &lpuart1 {
 	pinctrl-names = "default";
@@ -56,6 +79,13 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
+			MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
@@ -69,6 +99,12 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_cd: usdhc2cdgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.34.1



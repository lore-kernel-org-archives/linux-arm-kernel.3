Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B008C56207
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lSimGn8R/KlKdPR732stuvnpUl5cin/7RFYylcQ41o=; b=Waj6BmasKzVn1rxd/iuh+QiZXv
	EWum8mrkwO5WMOZO0pH0j25OvyOU5LdujNaV24Ud1fxZv2iHeA57pjTRJ9XLXHTdEfqN7B7AEBo3h
	zSWpyApP7lrc78m36sXQqHItGaVf3ysVu9FzskBikIspVVYexZC68bcY3sowrmITNSjkaBcQu0h2K
	1mP110n0dZFHq0U6rSTlFaha6i04SmKehffla9+dwSb0IHHlqz9I4X+7+CG+CXl8PiQAJ3mu6a78j
	n9gA5etTPPmwIaCrGRRkWD03O9m8qr8JIS+8lvgb/6YrIyHwuCxRlZT6K4wlSwucERoY8JegXM+yP
	B2Yo5jbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRz1-0000000Ev9P-2Hen;
	Fri, 20 Feb 2026 14:59:55 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRyv-0000000Ev6z-2uVj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:59:51 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=/lSimGn8R/KlKdPR732stuvnpUl5cin/7RFYylcQ41o=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771599581;
 b=GrpQypfdfF28PR5245/iHXPO9hMbd17qsnTHVAqd13V0IjglD1AyeJQxb99v9szC7R6SD44O
 bjWYO0OMNMLMrmjIK8OZGvr+MI1rVQP8DEGzI6EcLe64uZdhjC/KgiSdHLQpcOH6meWhI3zf0BH
 ykPHqmfebreHfV8fMmylbaTzmWm+VPWDzdrUK4EaGkTJ7UlmSNRjMp0PXk/VWIfMA+cKBKDm/GR
 ZDdPpFu0/HG9mh3Slj2Xw0ly6IrexXra2mfBojaJs0Ko4m13ilnwlzXqrupoAQGnzha1imA1lsC
 KAWZGwOvwyadGFi8EhOYvqg5uLpgGUBLZnkQj2bVoduJw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771599581;
 b=iEKheprPAMaW00qc7ou1znI35EZcS8+rWXB3nn1bLDW+bEThuhYeej81lRlI+t5GmcSSRw+Z
 f11AtA3GJ4IqPxAZLjyshi0exbu2B1nOCHD3HN68hUF90Pd7KDWGGq+UPCjGb+OK4IIpRzHFg5H
 hb29Aom97xyfGb7XvWTB1Mc+A1tYeNiubNkotpxJHg1jnnQte1JcLaTUAamebSG29z2wlhHSl1P
 e9EXfyYLHo1qEnSLg8RQZ6i4jxLHgZPdnEUcEiQX1h0cxzeUZRKAUvbO5p/rOMFIqdP+Jg7iOTV
 tAPDmgKeowIUQFBVcyoR1WGhQQeDpxKIk41oPA4tgTEFA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:59:40 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 08E0B220B97;
	Fri, 20 Feb 2026 15:59:22 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Feilke <alexander.feilke@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Subject: [PATCH v2 2/3] ARM: dts: tqma7: add boot phase properties
Date: Fri, 20 Feb 2026 15:59:08 +0100
Message-ID: <20260220145917.1797286-3-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fHYLL4ymKz3yZPl
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 49a31fb894d709dca0bc3171073ce3ec
X-cloud-security: scantime:2.031
DKIM-Signature: a=rsa-sha256;
 bh=/lSimGn8R/KlKdPR732stuvnpUl5cin/7RFYylcQ41o=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771599580; v=1;
 b=JLIB4BkeI1HrRUwj0rYiCAW2Ys9RyWeSnrYmcO+MUMx01htvbDJOWNfMegcpt26FTe/j2Au9
 JZgZq7lZ8eQoa+Enn/Psk74egkU/8ol4Fgyz7AeKfV0qxs0HbS80qSXGEVYP0mI7KDMrsblFV7C
 ivENie9SZ9ju96cPDnVxvpicwXYy+RMrPh6i7+BMio946S16xmeNgQ9LhFl97iSSRE3RS985dvW
 HNy/GUZT7bMLG6KJ9Z7SFbM2vhy39BRxFdaQkDms83sxL5Q5U4QniQvUrzbozdpr5PSPN/2Bg6p
 5u+orehGfslxIgt4xr9yo5OcptkaDLsH0IQHJxDaIzlPA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_065949_873408_EAF40930 
X-CRM114-Status: GOOD (  11.40  )
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

From: Alexander Feilke <alexander.feilke@ew.tq-group.com>

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

Adds boot phase properties to essential resources in
tqma7 device trees. This includes UART, SD-Card, eMMC and QSPI.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 4 ++++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 4d948a9757f9..03f2f2cbdfbc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -477,6 +477,7 @@ pinctrl_uart5: uart5grp {
 	};
 
 	pinctrl_uart6: uart6grp {
+		bootph-pre-ram;
 		fsl,pins =
 			<MX7D_PAD_EPDC_DATA08__UART6_DCE_RX	0x7d>,
 			<MX7D_PAD_EPDC_DATA09__UART6_DCE_TX	0x75>,
@@ -511,6 +512,7 @@ pinctrl_usdhc1: usdhc1grp {
 			<MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5e>,
 			<MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5e>,
 			<MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5e>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1_100mhzgrp {
@@ -602,6 +604,7 @@ &uart6 {
 	pinctrl-0 = <&pinctrl_uart6>;
 	assigned-clocks = <&clks IMX7D_UART6_ROOT_SRC>;
 	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -646,6 +649,7 @@ &usdhc1 {
 	no-1-8-v;
 	no-sdio;
 	no-mmc;
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 2966a33bc528..f3d7a2d0cb7b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -193,6 +193,7 @@ pinctrl_qspi: qspigrp {
 			<MX7D_PAD_EPDC_DATA05__QSPI_A_SCLK	0x11>,
 			<MX7D_PAD_EPDC_DATA06__QSPI_A_SS0_B	0x54>,
 			<MX7D_PAD_EPDC_DATA07__QSPI_A_SS1_B	0x54>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_qspi_reset: qspi_resetgrp {
@@ -214,6 +215,7 @@ pinctrl_usdhc3: usdhc3grp {
 			<MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59>,
 			<MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59>,
 			<MX7D_PAD_SD3_STROBE__SD3_STROBE	0x19>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3_100mhzgrp {
@@ -257,6 +259,7 @@ pinctrl_wdog1: wdog1grp {
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_qspi &pinctrl_qspi_reset>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -266,6 +269,7 @@ flash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		vcc-supply = <&vgen4_reg>;
+		bootph-pre-ram;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -288,6 +292,7 @@ &usdhc3 {
 	no-sdio;
 	vmmc-supply = <&vgen4_reg>;
 	vqmmc-supply = <&sw2_reg>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
-- 
2.43.0



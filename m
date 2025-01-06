Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDD7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MxNRP3B1WjEHO6fS7xHIZNcuo8McnpWuJM7vdeXhqU=; b=pm6FY0Hxfo5VuxA8i0eN7NgjQ/
	yez+oyCQTcbolpDtQxuLHRoyomPvuTXVlgZ/AZYQlFqTVPD2mhTHjpc34DudXIGMSyjvaw2V4mGOT
	QmzbobQ3nTWSpyc+vSnL0ITDlTZ6yBXP+MV1axm98V3Z1cdK92pkbX6Sfjs7sQxYJr/xWF0v7yjPS
	p+7w4Nj98khprUmEP2drp8HxrT5CIw+9m8Ou/devJV5SZqPOyn3rSAThAHi2Xqm2eN0j0JzC2GXAv
	gwLrwxG/5mvqGCaWPg48SzIqtvY2B6BH2uX83/PPgihwCtIagXzRHDFE/rZoALQWr2k5tlymaeXlM
	31Qifpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpl6-00000001ufA-2lYQ;
	Mon, 06 Jan 2025 16:15:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpdJ-00000001tYI-1YMn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jan 2025 16:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/MxNRP3B1WjEHO6fS7xHIZNcuo8McnpWuJM7vdeXhqU=; b=Ua4D7ObCtJ/R3TJyrRJO9QyqW2
	pULsNKmtU+1+j5zvr1QZ1y9yqOxVCpVy06TikUYgCHlvhBaAuoxH17ygPl4+GrFc9hsYMDXhovv9s
	VfNAgmvw1sbuzv/cjBC9MJCcPkQsIvq0UQAwjANuVBzDd0ylvirPzF7VHDjrLWknSt4uI/dPrkFsJ
	bN1DdkcOI4XWEuwiw/5HxWsfS2K+bHcoOytqU0vN2Rx0YbEzsOVY7a1FEYq12l/T32TdkXfiygdOP
	Q2RxBG9C7ARTwkXu8JbbIrJaAgzOMp2tAnmiHECZ1c42ypfRctOvSETdIHlM8W1BRsS6ODLecu8vS
	M9D7/Vng==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpdG-00000008xqN-2cRG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:07:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcx-0000C8-KC; Mon, 06 Jan 2025 17:06:51 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-007C9r-15;
	Mon, 06 Jan 2025 17:06:51 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-009dVc-38;
	Mon, 06 Jan 2025 17:06:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 06 Jan 2025 17:06:42 +0100
Subject: [PATCH v2 07/10] arm64: dts: imx8mp-skov: configure uart1 for
 RS485
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-skov-dt-updates-v2-7-4504d3f00ecb@pengutronix.de>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_160710_839864_A076956B 
X-CRM114-Status: GOOD (  12.02  )
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

uart1 TX, RX and RTS signals go off the base board and to a RS485
transceiver. Describe this in the device tree.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - no change
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 7ae686d37ddaca7a323e2cb1ec7d807c2e3bd3f5..bce23d62cd277b89ec9ce5ed3651cfe787987158 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -404,6 +404,13 @@ &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
+	/*
+	 * While there is no CTS line, the property "uart-has-rtscts" is still
+	 * the right thing to do to enable the UART to do RS485. In RS485-Mode
+	 * CTS isn't used anyhow and there is no dedicated property
+	 * "uart-has-rts-but-no-cts".
+	 */
+	uart-has-rtscts;
 };
 
 &uart2 {
@@ -618,6 +625,8 @@ pinctrl_uart1: uart1grp {
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX			0x140
 			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX			0x140
 			MX8MP_IOMUXC_UART3_RXD__UART1_DTE_RTS			0x140
+			/* CTS pin is not connected, but needed as workaround */
+			MX8MP_IOMUXC_UART3_TXD__UART1_DTE_CTS			0x140
 		>;
 	};
 

-- 
2.39.5



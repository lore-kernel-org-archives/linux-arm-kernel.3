Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16784D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I0SIJKX9tZQSfmZscwDLxEmvBbRFMw4s1nyXcFylYtY=; b=gV2KcDbBSmhgcYhP6vpOyb6sa5
	cHyKzMeIvQ64jfCq9DE0seEpsqYvrfcIc6xteSk8RaovKJxxX/SOWy+XSQNH1kN4w9qw3h5YEVGQf
	i3ymw2syP1m7QISJZGFoQCg7vXEl9q73EVC7O/ObdxArBOTQdBoPv+epAn5zIOSBFwVoAZsERIod2
	Vn+5Y0hz6yRV1P2t8gmrvgmdvQYBgDaK64Uhze2EcPp84AVlnfGd00vki98HS0VK6LNVaZDVvQ/zo
	ox7QKtSjRw1Ixs9ix33AFvH6t1Ngi8HHytw+aqillNIds+GNqntUNGVdADxN3wbmSYaHjYOPiKADd
	qK8BKK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQe7-00000005SLu-1ZgF;
	Tue, 02 Dec 2025 13:42:23 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQe5-00000005SKz-0bcO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:42:22 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLMQ64hWpz9tBD;
	Tue,  2 Dec 2025 14:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764682926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I0SIJKX9tZQSfmZscwDLxEmvBbRFMw4s1nyXcFylYtY=;
	b=Zbh2TrvKZ0UDXVv986Hs/XYg0Vo7XiszfkiBSyLU6Kmo2upVqHHc0e3WQcc+pJ1JaFJjdY
	yIUvjwaDite8wifZfdPvFSLUEfmNQhajWt+SD/qz9u9L7EQkShNS/PvBCQm30la+4zceaF
	f3nhyr/xe3ECYNyiG/2MkNy+TKz9djW3/uXddQomREVK8dR86LZHk5NDKDa2QDamJeQBXH
	wpSJ65XKKkPaTbftV+xHm8PcxLYToJWOA4VeQWzzRupZEfTswW01gDqftnGohgTumFVVCT
	TSevwZF0qJhVP4YAauLLOpAgqUVXT/8Z/O6pR/ipKqkRC7v+CdO+bzR4wjOn4w==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764682924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I0SIJKX9tZQSfmZscwDLxEmvBbRFMw4s1nyXcFylYtY=;
	b=tbGibNpJxAY4qNsUW32sYPHZrLzYTky+M5WIPTmYLRqN1uTSonMf522c/6GC8Ej6wmcqzO
	coebMplSN4Z4r1qOOz0d/9gzQhtRZ/LeyCs56Fl3aesQ4yghDsgota8EI421icAN2ENU3r
	S4PlcCczqtxRJL+nRQ/r31WmVhY0c/YGbQ2LoD0dRSESseYPc5DmTa6hqrLcY9UQXDZPNL
	mcV8WaOY+rVn2uo7QDEZsBHtH7cBXIxbTUgoxReELqg7viR/AAyUTXBz5B+4mrfA8OVeiV
	zfR8aclx0D097W+oA3RXzN3IdfOd2M4SHoIe0a3lYTDiuozmtApt56mHJGleZg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com
Subject: [PATCH] arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on DH electronics i.MX8M Plus DHCOM
Date: Tue,  2 Dec 2025 14:41:51 +0100
Message-ID: <20251202134200.8397-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 19aa33e691b1c0446b7
X-MBO-RS-META: dkcxn7cuarhsocuktk5766e9tug3h93f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_054221_351972_652FFEC4 
X-CRM114-Status: GOOD (  10.77  )
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

Add missing 'clocks' property to LAN8740Ai PHY node, to allow the PHY driver
to manage LAN8740Ai CLKIN reference clock supply. This fixes sporadic link
bouncing caused by interruptions on the PHY reference clock, by letting the
PHY driver manage the reference clock and assure there are no interruptions.

This follows the matching PHY driver recommendation described in commit
bedd8d78aba3 ("net: phy: smsc: LAN8710/20: add phy refclk in support")

Fixes: 8d6712695bc8 ("arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index 68c2e0156a5c8..f8303b7e2bd22 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -113,6 +113,7 @@ mdio {
 		ethphy0f: ethernet-phy@1 { /* SMSC LAN8740Ai */
 			compatible = "ethernet-phy-id0007.c110",
 				     "ethernet-phy-ieee802.3-c22";
+			clocks = <&clk IMX8MP_CLK_ENET_QOS>;
 			interrupt-parent = <&gpio3>;
 			interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
 			pinctrl-0 = <&pinctrl_ethphy0>;
-- 
2.51.0



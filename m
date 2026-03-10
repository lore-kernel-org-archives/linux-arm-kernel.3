Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681E4FD2D64
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X00DINjny10pJkrIip7rxsFClLG334fLS7NCE08ywPw=; b=TmSPrXQ/NnpQHpLX3RpHTC7Vzz
	p+0Sxqw1RUOPKZy4AOwQ1fSuiRkfT9F/5LOEH+ShlyDN6C3TMeloia8Tk2XlCnXF+erOXlQ79xi1G
	mgu7rzQq+UxF5NnAB2pP4qPVkZeS4KzlNXI8RWyYPOYwGfDR2+3pJcKhVuZXNI3VYVgxbDHRUcwk6
	/njLzyHwcbNCcpH6Z4Ht6ZCVxauP/FKfNmDoHwAQLZtSSVp80zD5ADuIQwlE1+6wqdcmWcLzd2T3j
	oFgCzYn9D5HC73BIz+tgtGo2DcYAGNnm4cMgLFIV5Gtg5zi7oYfScRt8rNGJ9hWOhVFxbcoI2uuyx
	sLYhv+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvlN-00000009RF7-1t8W;
	Tue, 10 Mar 2026 12:00:37 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvlK-00000009RDc-16CW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=X00DINjny10pJkrIip7rxsFClLG334fLS7NCE08ywPw=; b=HxJYz9fxTtmGgfC1kgdlHSNe8B
	UCW4Yoh1UEG/O/x2O9H6sg2+J+aAE+Q9X59THJXWcoWvcU+MM6GEDXGP4B56yMRlvEADsmTmkXU9a
	WYMOfiensrn2SPnacmDWOYAwEQhnmmJWQwiB1aBQfbBXke76yLMQTKsNSLEDvGHn3+lOkSYw1Qitp
	arUsArHOihat4DwJm+klZ4No8ZNmrsL9i4w+oayR9/4s18EXRUohUMPV8uGmTSBdjg2eBD8oKd1J6
	/50U0HoNej8XwdpNdNY142UXINFdPBxsnxyRyP75PKHzOrMM/Nb397c74lhUK/d5dthzJaWzJcUDs
	7PrWT1zw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vzvlD-000ONW-0a;
	Tue, 10 Mar 2026 13:00:27 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vzvlC-000CgW-27;
	Tue, 10 Mar 2026 13:00:26 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: imx8mm: Explicitly set DSI_PHY_REF clock as a child of CLK_24M
Date: Tue, 10 Mar 2026 13:00:10 +0100
Message-ID: <20260310120014.3178231-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27936/Tue Mar 10 07:24:39 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_050034_415364_E6B4928A 
X-CRM114-Status: UNSURE (   9.01  )
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

Since commits a0deedcc0cf0 ("arm64: dts: imx8mm: Slow default video_pll1
clock rate") and 5fe6ec93f10b0 ("clk: imx8mm: Let IMX8MM_CLK_LCDIF_PIXEL
set parent rate") VIDEO_PLL1 is dynamically programmed by CLK_LCDIF_PIXEL.
On imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso this results in a
VIDEO_PLL1 frequency of 68.2 MHz and DSI_PHY_REF of 17.05MHz (1/4).
Instead use the 24 MHz clock as parent for DSI PHY reference clock.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index f2e1854f38a0a..eb23ca27e8597 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1149,8 +1149,10 @@ mipi_dsi: dsi@32e10000 {
 				clocks = <&clk IMX8MM_CLK_DSI_CORE>,
 					 <&clk IMX8MM_CLK_DSI_PHY_REF>;
 				clock-names = "bus_clk", "sclk_mipi";
-				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>;
+				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+						  <&clk IMX8MM_CLK_DSI_PHY_REF>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+							 <&clk IMX8MM_CLK_24M>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
 				status = "disabled";
-- 
2.43.0



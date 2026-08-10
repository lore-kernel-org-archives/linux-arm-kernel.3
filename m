Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC4DC5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y76GiRMrYgaa2B8p3vMOOGelYc4wcU4Ng2CgUWCP/+8=; b=uiF9Uvzo/7UcXYFZN3F5s1ZZVT
	bF6MojU7e6fwUcBfbum6AIeGY0b/nNd6I51PdIMnvXjozrKF06exyaVy1lUmjqYa5dMc2TNlMYaYR
	DIehaYxk90sGZpmEwD3jVSdBmQj0l2DFIKvV7qDiINRt2PFNskRE1+pPl4ru6oOurRtfcR87LjT9L
	GH4LDl+I39TjaMCJ5aV6xsQOJjOSXRaad104u8CGBJsIJV8+U233CeAWjWpiBOscv0cgqjLXgUs7i
	RAja8RV/lFk+pVMJ6AvdPhX8jN2tTbB01iy0xClgvgu9R+dAcIi0Pub02D1mLOlel705EMgnnaz7a
	g/TusmoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvf-0000000BjVp-1oRq;
	Mon, 10 Aug 2026 12:16:31 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvN-0000000Birm-3gcb;
	Mon, 10 Aug 2026 12:16:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7956EC051C;
	Mon, 10 Aug 2026 15:16:10 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364171; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=y76GiRMrYgaa2B8p3vMOOGelYc4wcU4Ng2CgUWCP/+8=;
	b=FEA1uvjJ/gAdaqCdVA4iEr3nLxsWN3Y3LAraMdFZ4L0eCPIiHBAeALZMI7HcxZjdA3k9Co
	CttneTiVFmFUDc3VtV5PZwUFjQ0tasP4h4y7xtt7LrWZpBOpNI3CHW/p9rnlgYO1on6jTX
	ikFubHptQqlHkDovSK47DX+lWriCWk68cX719kqFWQOdjMdQ3Agk3fE3YG4k5uw2uonMed
	wyWoRJyBSHNTGmBdthldBZlvLPgFjS8pN3rRMSkYR/LDKqEXV8sk4SNgH9gobKQE2svOup
	ejL9N76BuRjN9eNS9kyj69hUWcLV8c6iuPRHfT7M53oJXNoX8yi1eJ3KUMIG3w==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 14/25] ARM: dts: rockchip: Add DMA support to UART nodes
Date: Mon, 10 Aug 2026 15:11:05 +0300
Message-ID: <20260810121121.210040-15-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051614_195395_289AD9FF 
X-CRM114-Status: UNSURE (   9.63  )
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

Add dmas/dma-names properties to uart0-uart5 so the dw-abp-uart
driver can use the RV1106 DMAC for TX/RX.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 4abc333ab370..58ac297e4d75 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -298,6 +298,8 @@ uart0: serial@ff4a0000 {
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 7>, <&dmac 6>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -309,6 +311,8 @@ uart1: serial@ff4b0000 {
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 9>, <&dmac 8>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -320,6 +324,8 @@ uart2: serial@ff4c0000 {
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 11>, <&dmac 10>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -331,6 +337,8 @@ uart3: serial@ff4d0000 {
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 13>, <&dmac 12>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -342,6 +350,8 @@ uart4: serial@ff4e0000 {
 			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 15>, <&dmac 14>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -353,6 +363,8 @@ uart5: serial@ff4f0000 {
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 17>, <&dmac 16>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
-- 
2.47.3



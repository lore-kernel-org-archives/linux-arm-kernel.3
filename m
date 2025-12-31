Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669C4EE6441
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3b6z2INvKd+o/M16xLiLwtsoiuaXh4xrEcgK8ysqto=; b=VINonp1N4mPeZDPyDWu7X6Qa3z
	cl9iiRKYbrcJzy35JEvr4HyW8MXnHXpVXdFpf0ZKx5cOFEkZwrvi5dboKLHbNYeaFoCCm0ah05Cmb
	1i3cGhoDRQczgkNVWaCDgTw8CL6ivD/CiF2B7sfDe3DQQ3EmTNU5zDXP6RXviTJXr7J2Su54YhF23
	SL4p28Rh26n43WYV/z7A8FgXCrqSMYA/PIwN3lRxvawoy/6NgCw/amW6Y6sjqcJ5k0ziyEUSF2juD
	ZaOqf2Oz6FhW5d0gsbx/4w/wH+aFX5v0WdMTCkH1+lJTWL4c77SzAw305xj5FxEijWCouPoQyqmwv
	MQNwHlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4D7-00000006NLH-1hQE;
	Wed, 31 Dec 2025 21:58:29 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4Cy-00000006NHv-2ewF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218299; bh=nAQpSiX9cztVCMP9D4cWPsbvQDddnDAyGcd4tMO7LU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GX1knakicIsZKhFLS/NvQZmy0dbme0AnVVfBG0Nc1TiVGxxQGFQ02UYgGbBYObrfp
	 HBHUB+b58WOIm47btAnd9XIT76i7tT7EgyPWosFiJaZ8urdT7BnbRAcAfk3myVDdF1
	 RadSb9rELjRcoSoXUjS50yAb+86SqSn0GuN6baelYEjgPpfgyOxZKBOzQrl2pj7ANo
	 x5KNF1rg9UB+FN+Ke+bP5AnpiIRnqx7jucri71fkqjRDbC+wHnU1LgbRzzwWLdc9qt
	 12XX6mCyDISsBwZDNesvLRez7DPJ2yTxJLARh4rPpK75IMA3jfLqFwj8SZiGanmRZR
	 DLoCvjR1hHUGQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 267543E99A5;
	Wed, 31 Dec 2025 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218299; bh=nAQpSiX9cztVCMP9D4cWPsbvQDddnDAyGcd4tMO7LU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GX1knakicIsZKhFLS/NvQZmy0dbme0AnVVfBG0Nc1TiVGxxQGFQ02UYgGbBYObrfp
	 HBHUB+b58WOIm47btAnd9XIT76i7tT7EgyPWosFiJaZ8urdT7BnbRAcAfk3myVDdF1
	 RadSb9rELjRcoSoXUjS50yAb+86SqSn0GuN6baelYEjgPpfgyOxZKBOzQrl2pj7ANo
	 x5KNF1rg9UB+FN+Ke+bP5AnpiIRnqx7jucri71fkqjRDbC+wHnU1LgbRzzwWLdc9qt
	 12XX6mCyDISsBwZDNesvLRez7DPJ2yTxJLARh4rPpK75IMA3jfLqFwj8SZiGanmRZR
	 DLoCvjR1hHUGQ==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 955273E99A7;
	Wed, 31 Dec 2025 21:58:18 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: lpc32xx: Add missing DMA properties
Date: Wed, 31 Dec 2025 23:57:52 +0200
Message-ID: <20251231215754.2222308-4-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231215754.2222308-1-vz@mleia.com>
References: <20251231215754.2222308-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251231_215819_175314_410A11F8 
X-CRM114-Status: GOOD (  13.39  )
/bin/ln: failed to access 'reaver_cache/texts/20251231_215819_175314_410A11F8': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_215819_175314_410A11F8 
X-CRM114-Status: GOOD (  11.89  )
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

From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

Add properties declared in the new DT binding nxp,lpc3220-dmamux.yaml
and corresponding phandles.

[vzapolskiy]:
1. rebased the change,
2. dmamux unit address shall be 0x78 instead of 0x7c,
3. removed unsupported 'dmas' properties from sd, ssp0, ssp1 and HS UARTs,
4. more non-functional updates by reordering properies,
5. minor updates to the commit message.

Link to the original change:
* https://lore.kernel.org/linux-arm-kernel/20240627150046.258795-6-piotr.wojtaszczyk@timesys.com/

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 89e621dfb950..4f3944d6d765 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -66,6 +66,8 @@ slc: flash@20020000 {
 			compatible = "nxp,lpc3220-slc";
 			reg = <0x20020000 0x1000>;
 			clocks = <&clk LPC32XX_CLK_SLC>;
+			dmas = <&dma 1 1>;
+			dma-names = "rx-tx";
 			status = "disabled";
 		};
 
@@ -74,6 +76,8 @@ mlc: flash@200a8000 {
 			reg = <0x200a8000 0x11000>;
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_MLC>;
+			dmas = <&dma 12 1>;
+			dma-names = "rx-tx";
 			status = "disabled";
 		};
 
@@ -83,6 +87,12 @@ dma: dma-controller@31000000 {
 			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_DMA>;
 			clock-names = "apb_pclk";
+			dma-channels = <8>;
+			dma-requests = <16>;
+			lli-bus-interface-ahb1;
+			mem-bus-interface-ahb1;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
 			#dma-cells = <2>;
 		};
 
@@ -190,6 +200,8 @@ spi1: spi@20088000 {
 				compatible = "nxp,lpc3220-spi";
 				reg = <0x20088000 0x1000>;
 				clocks = <&clk LPC32XX_CLK_SPI1>;
+				dmas = <&dmamux 11 1 0>;
+				dma-names = "rx-tx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -214,6 +226,8 @@ spi2: spi@20090000 {
 				compatible = "nxp,lpc3220-spi";
 				reg = <0x20090000 0x1000>;
 				clocks = <&clk LPC32XX_CLK_SPI2>;
+				dmas = <&dmamux 3 1 0>;
+				dma-names = "rx-tx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -222,6 +236,8 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				dmas = <&dma 0 1>, <&dma 13 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -238,6 +254,8 @@ sd: mmc@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -328,6 +346,13 @@ clk: clock-controller@0 {
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
+
+				dmamux: dma-router@78 {
+					compatible = "nxp,lpc3220-dmamux";
+					reg = <0x78 0x8>;
+					dma-masters = <&dma>;
+					#dma-cells = <3>;
+				};
 			};
 
 			mic: interrupt-controller@40008000 {
-- 
2.43.0



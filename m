Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1472DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 21:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVdlb3WFF0Fl3Y7uXYVCDmcgfL8tnu8Ea2WG8L6Ditk=; b=b5JjLW3PFuf3Us2XLyyqNn+IOo
	yaXhRytCZuAJ+P1fQlsWlKzwEx/dY2COvVOYFEnFHKEjzqhKiBHSn9zsgdOFAhXKOVPCuv50cJYpH
	uzTOEEmbyUMBhtA/UESfRfEIc2zUigdTEMtjDhbDwek+JFVuMmgwV/qZTom11NdP3u+Z8NoQ2xtkS
	kgZmp+WsSs3sNoFXY8wCnzcm5X9HXqTAr1aHHnCoUTy5BEeD0/4ydOGoa76WlMo0p7twcw4yAHFpE
	SEdiEB/Ojo503agnD8ActAtKKrNKezKa/n+WizOyrB4ZAHuLXRLNV6oGund18T0B1bRKRmlMWKhmG
	ATnpEwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6Dp-00000004vkg-0aUr;
	Thu, 07 May 2026 21:25:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6Dn-00000004vjv-1JQU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 21:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC8DC61143;
	Thu,  7 May 2026 21:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2A3C2BCB2;
	Thu,  7 May 2026 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778189126;
	bh=967SAUmoPk5dGwXhSfxFZoiPaIjGZ3mUvj6JEmqje9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rlKD61xAhMKu5ZX4Hq85D9ZIRD5bUHdYUyYrpi6ltiG1xmOgkZUNm9Z3tfQCmlF32
	 aO0RZBr8JX+eaDtVy8fLCDuwx+MUFB8ho6nDxSbE4eSU/8SLrsNAgfe69YkkaHNN6N
	 d3FcwoN81brfqvtFtklJvFf/2dzcGqKGcIqcuPsNJZ8Uwvjco1CTmEbn81joVF4evN
	 KMVouQY80ASy9nYs817jqoEnSMIkE8dx8qunj4rsUfvU6utz+5t4t/9En9bgLdln5Z
	 +a+DyTNNU36AXLx2NBRAmu88SdD9s1UD1BbMkzW3nOfj6sPq7ur0m3l3lnov3huPGd
	 qgffZ3wGsod/g==
From: Arnd Bergmann <arnd@kernel.org>
To: netdev@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Andreas Kemnade" <andreas@kemnade.info>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	"Roger Quadros" <rogerq@kernel.org>,
	"Tony Lindgren" <tony@atomide.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] [v5 omap] ARM: dts: omap2: add stlc4560 spi-wireless node
Date: Thu,  7 May 2026 23:24:51 +0200
Message-Id: <20260507212451.3333185-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260507212451.3333185-1-arnd@kernel.org>
References: <20260507212451.3333185-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

Converted from the platform_device creation in board-n8x0.c.

Link: https://lore.kernel.org/all/20230314163201.955689-1-arnd@kernel.org/
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/ti/omap/omap2.dtsi                |  4 ++++
 arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap2.dtsi b/arch/arm/boot/dts/ti/omap/omap2.dtsi
index afabb36a8ac1..fdc1790adf43 100644
--- a/arch/arm/boot/dts/ti/omap/omap2.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap2.dtsi
@@ -129,6 +129,8 @@ i2c2: i2c@48072000 {
 		};
 
 		mcspi1: spi@48098000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			compatible = "ti,omap2-mcspi";
 			ti,hwmods = "mcspi1";
 			reg = <0x48098000 0x100>;
@@ -140,6 +142,8 @@ mcspi1: spi@48098000 {
 		};
 
 		mcspi2: spi@4809a000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			compatible = "ti,omap2-mcspi";
 			ti,hwmods = "mcspi2";
 			reg = <0x4809a000 0x100>;
diff --git a/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi b/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi
index 63b0b4921e4e..fe9dd8bbfc85 100644
--- a/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi
@@ -109,3 +109,15 @@ partition@5 {
 		};
 	};
 };
+
+&mcspi2 {
+	status = "okay";
+
+	wifi@0 {
+		reg = <0>;
+		compatible = "st,stlc4560";
+		spi-max-frequency = <48000000>;
+		interrupts-extended = <&gpio3 23 IRQ_TYPE_EDGE_RISING>;
+		powerdown-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>; /* gpio 97 */
+	};
+};
-- 
2.39.5



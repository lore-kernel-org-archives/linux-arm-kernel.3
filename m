Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF0BE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9hPErXTdwLp5IW3pCKiEtkuK0CEhM9JayXYPR1JIJg=; b=DjW32TilXm2m7f84eEd5b2ooAZ
	ezfJwVVDwk80ZrfRRmWr/UqrwNF+BL0jfk7g4wRjd0IXAr0/9+YaR4Q+eNni2Cp6lL8ZQsLaiiiY4
	q0M/geHtGheWOQGcA3GKVhLIX1uCURiblsPcyACjSwrgw1Kuia8RhbJQ3AaP94Tc1kd/JRZdj2G80
	mYMmXhqIdP89g7WOIH9BAZBKxvEmKvtmd0tn6iufBq2U71vXQbvRncA4qivY6VxokKul3mDTT4UJl
	WRYFGv+9/zyzvqpYl/yyvyh3Hpvh5o+0yNz3HvyCj530X3h1FhET43HFVQW/G3Mw9LkkLK2hA5YSg
	WUtLg8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHFh-0000000CMuc-3u5h;
	Sun, 21 Dec 2025 11:05:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHFY-0000000CMrH-2OED
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 11:05:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B0744441;
	Sun, 21 Dec 2025 11:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E52C19421;
	Sun, 21 Dec 2025 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766315119;
	bh=WIWtUvOCXqllobCBnum35H1c/nzaFuG9Bf2t7pmwke8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RdXw/GcX/Plbh9yviOIp+D7R73fpZzTGKvozTLxjXdP3f8OtJz+UdndQUKskJWTd0
	 VikTloCkvRmaDve4AqT8n0MOyg86SO9MdwzprKMMmOUWWGeWskO0qTGCYa5zLkI/4U
	 V0m0MH7YtMz1/ebRfT/69PdYSZGNrCGXZFg+G0uOvfHRNbJ2NO9pRawHW9vLhmNoiE
	 tXcNE/S4YOX+n5raBFuL8rR0OP4VEmmJbEBwcPh66IWHUSDIDjljmab7rBQdO+jl1d
	 WLcaLbW386OU+JabmttYqN0EeYMyu3FKzM4WYx1eVBdWHSkDNCkYNhORG/NUGH5kPI
	 dax1zsgEr+l1g==
Received: by wens.tw (Postfix, from userid 1000)
	id 5FDF85FE52; Sun, 21 Dec 2025 19:05:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: allwinner: t527: orangepi-4a: Enable SPI-NOR flash
Date: Sun, 21 Dec 2025 19:05:11 +0800
Message-ID: <20251221110513.1850535-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221110513.1850535-1-wens@kernel.org>
References: <20251221110513.1850535-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_030520_653113_67A4FFE8 
X-CRM114-Status: GOOD (  10.39  )
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

The Orangepi 4A has a SPI-NOR flash connected to spi0 on the PC pins.
The HOLD and WP pins are not connected, and are instead pulled up by the
supply rail.

Enable spi0 and add a device node for the SPI-NOR flash.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 9e6b21cf293e..055be86e5fae 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -400,6 +400,21 @@ &rtc {
 	assigned-clock-rates = <32768>;
 };
 
+&spi0  {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>;
+	status = "okay";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		vcc-supply = <&reg_cldo1>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF4DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD1i5hY8aJGQC31SLVZPrEE7DjpJ9widgoJsqpszpfI=; b=GtJtIDVYqRRdkqQwxQ1Og+Q3ak
	mLUm1jz5KISJiUD42YAPa3nvPCCpj5P7XNGfiU/zxFOs2O7N67ZmgpgJo1JlzeRGwstCGNik24hU7
	cmAOhcsIlRyth0di7FjfpF7n6d8Uc8jajd6nyM7VuGbyZvYBdox1yTpY4W4rTAxd4Zn+2i9uYwsTd
	B1d52O0qVL+lBnr+zVtBnco7hS3dFMfPT707DSDstQyb7kZsp7g0cC9kaYOvoRg+bu+inJRBZh2tq
	WVDYG5oC0oRrprFFRiU5HrXjpeGD9OnpTTUdCx4fCncSIxwlIg/rseTrbZKxnC7JGuaKG++wjuLsk
	XYc00SVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDT-0000000CNAq-4AB7;
	Mon, 20 Oct 2025 08:26:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDI-0000000CMqw-0SFp;
	Mon, 20 Oct 2025 08:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=zD1i5hY8aJGQC31SLVZPrEE7DjpJ9widgoJsqpszpfI=; b=OnR1WhTLsmdP/YviSTC3RUvI1P
	9XF91ESj+STDF3GHeVMC5gLQPQ4Q017qjzFJT6nvIduGvq+5WdxkAMR9BQHa5MOVqmC/0wBfbs3rb
	DfTs821JoN3FB8hWmyKS6v/SnYDWhYq8h2S2vQjN4Xj3QvWRGBPcrjvUd32CkXrvsInhq8lRik8on
	VzJiFWiMjLFEnMSBNVHMz9R3LSbn1BBk6NFzx3nA01xRDhkj1MNK461LnJ4rMWbxullc9Q0UUqXTW
	WH6vo5tTf3BShr/ZOSY2/oQPT0+hYg3KOk2hqr1BArsvHbpe+C6lMyI6dSyD+F3K2WwWFEaZ/eMsz
	A9vaWdfA==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAlD0-00078O-3D; Mon, 20 Oct 2025 10:25:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 6/9] arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion haikou
Date: Mon, 20 Oct 2025 10:25:05 +0200
Message-ID: <20251020082508.3636511-7-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012556_182718_B1C5081F 
X-CRM114-Status: GOOD (  12.72  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

i2c@0 on i2cmux2 does already have a phandle i2c_lvds_blc defined.

Use this one instead of replicating the hirarchy again, as this might
result in strange errors if the lion dtsi is change at some point
in the future.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../boot/dts/rockchip/rk3368-lion-haikou.dts   | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
index ab70ee5f561a..abd1af97456a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
@@ -18,16 +18,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	i2cmux2 {
-		i2c@0 {
-			eeprom: eeprom@50 {
-				compatible = "atmel,24c01";
-				pagesize = <8>;
-				reg = <0x50>;
-			};
-		};
-	};
-
 	leds {
 		pinctrl-0 = <&module_led_pins>, <&sd_card_led_pin>;
 
@@ -68,6 +58,14 @@ vcc5v0_otg: regulator-vcc5v0-otg {
 	};
 };
 
+&i2c_lvds_blc {
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		pagesize = <8>;
+		reg = <0x50>;
+	};
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.47.2



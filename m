Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E5EC55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=; b=r/dzIC4yAa2U6M8YQYUMypqosZ
	UmI7jw9AHZYNRhAWrZFNOqFwLd1Evgjf6Cl8H0sOo1PDAL4rIQCkt9qupUvxbUTXanN/c9TN5tbCh
	f3HEIU4fAVTY+PWuVlMIO4PsDqANQ3yCoZlR8XOmjO+BBIFMmfnY7S0mfbOgZErRQU55m9BQL8YKg
	aWkGnAMl4gbIa0OFpu0mZPJLtvzBAx0XCy9G2eCB8dj78IXv96SUng08MevRxrJkKwdkGWoIRXwbZ
	Cf9ImzGj0PQaOgLmp2teqU68vVsI1dnZrp2FmWfLaUEW/19ZnHpO8OqLai/9/igqCiF4V61C2kEKf
	Jxr5tyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1z-0000000GLqI-0k8x;
	Mon, 03 Aug 2026 05:16:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1v-0000000GLg3-3wXT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Aug 2026 05:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=; b=UibCkEzhw0NLJfTiOqRMzrGkKC
	QAtFPTV5nFEKJ50WWzjX5l+JZItGkcfuLnrNeYRISSjDxhu4V0E/uvnBpYNXYrAhmaWIOh1gbqoa7
	YLY2HIlIzqzZ51qrM796Qnt1k//59gyxXDKWH8smPC9k61OP1XV/CiROfxfv3o9E8n+dDx5RVd1+g
	OVrcGCMOuG93XrN4DwOo7mxIhJBpxUAHaANsEyPTzlMws3hzvDbxlZ88Le/Tv/tNGULz9jrQ5DmNX
	+QrDAZ+BYJRAleO68LWh2wvfUj7SPcF5pQQSU8hbBWuQqXWXz/Y/acjA6RCvyM1b8tYkc87yWdgOO
	k0xxQokA==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1r-00000004v2l-1B2C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:16:02 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so1828722a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734153; x=1786338953; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=;
        b=Rky9C7t+nCwKIsNXV3+ewp5KxdOjLuITNdk+dY9/EwBEdWJqtSAzZIVIcIGjXiieWE
         2OYhUcxFeeAUuxzjzIWpOyRi8dr7GpsWrMhZBMKTP98qOxhEyvzHjtszs67Hdl9H5QRD
         uuHPkhgeIpso/Iy2Iy2lt/bHEXKPEVN7TB81OTI7VZe8c7thP2TC4mk+E1q5CA7+0oZF
         4wmHdggrY5MI5WQH3J4Pv9mL0vlN0deCvmvbdYtU00JPZ04OEqDWlOhOeDSKoJz6Gcam
         L7XQnKywXwR/bUy4hHdVTHT9csjzGOCWgSU8fpG03EZvkXDp1NC1Ow4ICxtYMsvOTzXn
         Og0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734153; x=1786338953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=;
        b=JRmE7obUxw3qiOaMaAu6FoBidGefRtH6XXT2gyGpAa7fogApcaUrkBMdecv0jkQi5o
         smhQi5D11UF8Y7QsfsG8F1smIVrz2iF5WebqFX5RGhMtlWNvaC/9UtqDrYJqM286h8HP
         jZk+ZtaUYGh5mjX0S5ncvZZ53shsvJIbkeJX8ISvtpKWXIonE9NRljz55PkcvYlYuyVY
         udB4HrD0qzDesnMSx0kLlJjUcWKnOiJ6hlKtBsdyXooDZhqw9IsRiMQVtTBzzb5LLZbs
         TGuE3CheSvJLiH5onS3mveIj/d0amT1lYVRHSMkLouVZfa6VWoCBREnhHG9bYikpl4wz
         eTjA==
X-Forwarded-Encrypted: i=1; AHgh+RrlV1SiJeityTcuUjsW1c7MsyvHn5/H10Y1vz/IHLp6DhFjED/jMk3jiUUXbn6yE85hcQuvvvWigYyo0lvmG1r8@lists.infradead.org
X-Gm-Message-State: AOJu0YxM5ApikbXvmGJSWhhVaFarWdThfY9xJoA25w1w5hEUFIiPHyPA
	GBsoCqmjKPheJItQKsz+dL4KvRR4YZjkX+SxlLxTWatRidcdYjHkMELQ1abaXNGK
X-Gm-Gg: AR+sD12aOXH3MhtLyC8hUD6FDmsAUVTqu3bmXxm84KH0fPb1JtL4V0rUM1/Zc+FGGwf
	PN3mFICx8EX5QJCGYGYHzxYCjtY1Mx49USDqPdphjkUsefQ/3uEP/Ib0CcxTJvbiy1ZFB8tC1rN
	LXzY6S66DLXkQEk8RSsJxIRZs3UZSFdb4x4BxMObhmIdZqeWElRukeVLyMYoAlY+hvAsj7L1DzG
	1psGSehgZvW8GCZJ9VUNrjUC1aetErIDjy2j66kKEBXuCFvZsDUqzlQjqLlF14LjHyEVBSKHj73
	uppWMgQObp3xZ36xNXq6XzlM4uiOcpGZTRKKEmaoZcijC/TeyjFkbovFE3J4eaHJaIJFjdPqBDz
	9oU8YFtPSKsntn18/j/VuzULkvQ7NbbSBTiXW1Xnz/hus6SAwHzs600765qPiUrnvxEWrtO4AGR
	ErFs7u2tZROF3oJdX3/GXKRvWwU2qQL3hpYcckkce5ju9IrKa2ebul7D2hBvxp1DLgqVPe04QDw
	4MBy2/WaIhuOs2Yf2uWUaGvgM3fZvpnygAhddyL9Vyg6uaD9bOCeNUwC5YzdXo+Xmy/4WChUge/
	irPxzteeawBoWqCB3Vvpq0I/Azl2Cd1cSfH9UvTeF4KFdv1DjcXZFYwsxBiM/yo0v8E3bGMrPnL
	MMO/Xoa/ufZgO4Ip1
X-Received: by 2002:a05:6830:398d:b0:7dc:e090:68a with SMTP id 46e09a7af769-7f1969181f7mr14873339a34.0.1785734152850;
        Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:30 -0600
Subject: [PATCH 20/21] arm64: dts: allwinner: h6: tanix: enable AC200 EPHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-20-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_061559_562549_FF33D575 
X-CRM114-Status: GOOD (  11.21  )
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

Enable the AC200 control path and RMII Ethernet link on the Tanix TX6
family, and provide the board's 3.3 V rail to the AC200 function supplies.

Route the PHY interrupt through the AC200 interrupt controller and mark
it as a wakeup source for link interrupts and magic-packet wake.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..6cd75961e3cc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -7,9 +7,11 @@
 #include "sun50i-h6-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/x-powers,ac200.h>
 
 / {
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 	};
 
@@ -84,6 +86,22 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200 {
+	ac-ldoin-supply = <&reg_vcc3v3>;
+	ephy-vcc-supply = <&reg_vcc3v3>;
+	rtc-vcc-supply = <&reg_vcc3v3>;
+	tv-vcc-supply = <&reg_vcc3v3>;
+	status = "okay";
+};
+
+&ac200_ephy_ctl {
+	status = "okay";
+};
+
+&ac200_pwm_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpu_gpu>;
 };
@@ -104,6 +122,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
@@ -119,6 +145,21 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ac200_ephy: ethernet-phy@1 {
+		compatible = "ethernet-phy-id0044.1400";
+		reg = <1>;
+		interrupts-extended = <&ac200 AC200_IRQ_EPHY>;
+		wakeup-source;
+		x-powers,ac200-control = <&ac200_ephy_ctl>;
+		x-powers,xmii-rx-clock-inverted;
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -162,6 +203,10 @@ &pio {
 	vcc-pg-supply = <&reg_vcc1v8>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_ir {
 	status = "okay";
 };

-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85553C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=; b=aiPDdNzwR8c1qyYS28qJn5DG+g
	R+0mHg0CDqei0CJrhN1r39/oNRU2RkaHSj6+XDs1QRBtDxdFHeQhZYyn7KJt3jd5iAVv+GvO2yyJx
	ac9L7n2UOObD7Mi7N/QjZcP9U7kku1L+EBs1EUuh2Z5YbuEYiW5A4y7AYsaZvHn3csewdnwSXsWjJ
	85z+732IbMpkevBl3QIpky5+V55QcLo+ReSCpHrwogSG2hvvZdzda/BaECRdkuVagM03wXyld/J5n
	Cmla60C1wbrajehxlEvLrDHBIFuYJsQ8NnScnyq0gw4JMW/10mGGC4XXybRF3xMKQEQaCSmEdPpGs
	rzLsZXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGe-0000000CWVP-20N0;
	Thu, 17 Sep 2026 21:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGa-0000000CWRD-16aB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 21:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=; b=ZQThzQ9Gm0NS16MSn9vwk+9WSl
	t0OF9fac196muksfp3XrUsLX2GR3ypcfLitx0G8QqNZTNAJIitDQuiGvrKZAu0nQgTMSxzxzI7Yzc
	rK/o0kG7D5Ah2XZ150ViNJQQJE/rVzEtPVCCrdK2PlfbmZtiEzlXm+JnQtnYhzRQ7nshAaDM/knv4
	1Wy03iFtn0v3NB1oAHlDi1Vm6nr65uTeym/BELZ0TiDWhehduXe17uELGF+WoK25ekUp/qfwKZPAU
	a5Zasv8XtGbVv8wacUJyg9qIRC+pW+IKnE9c6dz4TRQDVzh2rVWnZiRSgEDjjrBo5++801Ssq3Qbz
	wzttErRg==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7JFs-00000009GdC-251H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:03:35 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so352515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678966; x=1790283766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=kXUGaWTM9fdq8Zh4mY0n9lJcdoZvZL5rtfM6EnoWHmkCrNytdpHjfn48p+jrXI/HJj
         a0Zn6xxRaaLjAcehHEXyXts9DQt2R6/aCkGLkUWxTafozeE+kfqb3H8Ub/3rHO5kmXgV
         6dms5tLAH2onVRTRH4RrMLQkoIyiFLe7xDHBkk6q737qpdK14M+jvMP3Can6NZuJu3Gi
         62xnwOk3a7A0d1QFzTxl2HUr7r7MCPyOyJWav32ilXCjgwkj/CBRRybsnCR75Gm1A9Kd
         aHBcreh+Ks31mAAMNYYvZvADMWNzc2LFu+EDLWwIwLRoUKWAAGEB9GdfGwG1vT0Ui3oF
         LaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678966; x=1790283766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=Akf+abzonhPLP8EO93fOz3yaPf088jO22pEfs/MRBhtVePwfFdyT2hZCL49ccjQ7WN
         KB3LXO33wtx1EZGsgPeKSF0YRn8/FmAk9HPnnOZgvJ8NUYV8L+1swG8f56vgu/Q6lpm9
         kmkUBkFcgYtKQr2XmWvwy0ZBoBXkaq8UlBlr2ivb4INbLcD13tCI5mtfEnxqBsA2E5iq
         6S4rHhN5OWGFmHX9RtvYnSqD8qRkYnZjTRIWHoZHRsi3+Fib7eaFNjhrOso94GtibLr+
         /QT5kpJYXcLwDFQVxJKmv7IvV8anKovDk7oTNyP9PuuEhdXRG7aBcblXK+Ldt60iKrvY
         K83A==
X-Forwarded-Encrypted: i=1; AKwUvBxOUKHukmt3UCIMFgqhE9OCGBZcwmV2C7/LPkp5xx1PAz7WDNsP3TkVAZ4UGLsmy2iigucBAN/hqPvU5qQ6ZPrk@lists.infradead.org
X-Gm-Message-State: AFuF++nFAANCM/7EFpnmcSmJMqWuT7J5qUxzfCqFRRB2j/qyaIOgcsTq
	MqwZjxW+Ck+BDzifDTsypjl88s1MsaKmqAfR+i5PrPFMmaSqdfDLs8jwSYQOm49asbg=
X-Gm-Gg: AYBFou1xBx0Gi2o7CwstlM4qrsi++UAUgSAx4pn8QEX2kAR1h0AorCQyKlEEZV/msuv
	iUFwxwEzDhsafLULS8bNSs740m0oAVeRqMa7pxwHO47E4fNkDvjMUsx+C1VyWfBV2akRnU7Twux
	5u/RnKAtLY0l7J5JyRnwGDckxbSwblqwMtQ26G+zUce/3OwpR0xkKNVV311wH89ZxZwP4lBLcFE
	TUWJ8yC90WOx/PnrhUTTw9WrETJCDRQPQXe6XNsaxy2zSA2MJD9tC0hUawxOrP1XAGlpv06f7GA
	j2cBzVDNQyw1bhsLoMhPStSYxuPkAcRONADSHXK9sDDKuE78sTYEXwF72jB92hw7jWN+FigsqHh
	y/y07GeXdypuLTUS1BuNXvfp1S+0hsv6GXd9VQRIaTeoLezfx2ZErgZpi5eg9HIRUIM2tetmrMF
	WGhgMWgAapDeOv8hU147QvGjRigYhcKhhaIi23qiLvcmI4sJwMEgA9yGbLONh0mnSUl+hd4MDX9
	RM7
X-Received: by 2002:a05:600c:1d06:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fc5001358mr4202515e9.14.1789678966047;
        Thu, 17 Sep 2026 14:02:46 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:45 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:36 +0200
Subject: [PATCH v2 6/6] arm64: dts: amlogic: gx: add AUDIN node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-6-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=TZWXiYpGe3PgSXyHXeQpQDxriAYLZIkbRgm507qkSqQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQvNmvF8unFH9eH6EzySORvUZecWKr2zfpoin7n3IZ
 Pr0cfujjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkUTIjw8en9zJ2svh/+rbU
 ff5ZllW67KenBohvO8zx3b2e5fi9Un6G/9GnGbPtczkErYJuBjNXp/QLT67Xi2s6cP1A6E+3vFf
 OrAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_220311_976888_04ACD74F 
X-CRM114-Status: GOOD (  11.05  )
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

AUDIN provides audio input support to Amlogic Meson GXBB/GXL platforms.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (Meson GXBB) board
using a custom hat board.

The following additions/overlay are required on top of
'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:

    &sound {
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin 0>;
            };
    };

    &audin {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..54b6cc0bb8ff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gx-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..7ad69992a226 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..9181eba81eb7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3



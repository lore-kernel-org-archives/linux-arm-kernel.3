Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA169F3ED40
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrO2iFz4Z0GuSJeWJfHrEvIwriyj07FmYaMKOU66HDg=; b=L38GXhR0do/2b62H7Y4QPlywnN
	9vNTDaXa7DSNFGjtowRjCO/xIxh+I+QryOZLhTas7VYEx91Va8bb+ws+L+L1pG1+xVdWlEDk8Qv7M
	R4zdv4rTOrwsv/LOPkreCF7T8xkVPlOdQuJqKCD12GTwBFGlpij/jfX2ybfTpoZ6V4HeJ3flCx+zT
	p5iPEVrDXe3fG+3U/1ICdZQ5I3Wmf1i7pIlQYApaNOksUUxJbhqLEn1rtYpVtOUC+UvCInG+wyRYw
	Cpih1Gdb9ARY5pUWFZR67K+Z6KHRyqtaYJYzrUNOGkT2e2cCdvLkKgmZiCThZCY+U4xVm1IXaqHhP
	SySRJX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmu-0000000DXyz-1Lby;
	Sat, 11 Apr 2026 14:58:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmn-0000000DXlY-2AmO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so28384125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919491; x=1776524291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrO2iFz4Z0GuSJeWJfHrEvIwriyj07FmYaMKOU66HDg=;
        b=OALozFtHMn+IHpNUtT7Cep3PtjkwzBe2fVPfoW3voCWVZ8lRkqG/VE1nPW1yoEzNTn
         RZvnZXGY6Y5q7TCA21+/brRFvuFOkVkuVIwp5FfEoI4FqQWxywYlc+LuTuNxUdgM8dBs
         lYQ1B4t0+HHOFeeLXJM/DraRVUoAqrNMCi7gr6xg8h83gbxapbYpAyASe7zxl2N9jmbl
         7C/9N2vwSIc792np5qsxJgAOJNr8ae+l4is/xL5M24rbzbwdHuji3IiZO91dytehFPHM
         XphGXC3ovlWjVqS4jsN05Ws4UG6Ku99UGJ15nblWvPrAmHz+bDwmTDtFEti1IVGEBbvS
         jg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919491; x=1776524291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KrO2iFz4Z0GuSJeWJfHrEvIwriyj07FmYaMKOU66HDg=;
        b=D9SOkZQu2ospaRBZYN9Mdk3rPvxZdTccbOadfcnl/vkP+bpuYOPxXnknYGuVHY/Lyb
         RQU7WSWeOFbsrTymDDugwBrQH2RzCUr/EHit7AZ2sgeo8wh7F56In+6JakidSj0qOX1S
         ertvNaWN87LGJw17tpXBnDMBhOo7wxNqVWl/wQB0RlJFEn9xX77qpIzdErIclhKThKES
         3Q4NCBTDhPT3V5ZvRqK49F1Ntl2MQJ5nL4Dhg5eq1x8+B/bDYc7VkJy9cEqR0SndfuA5
         xzvzpD6EAlOZvFE+KxYvN6M52gk+RGVb2s3EkZ1ZgEllsr87TLSCYtWTREkr1Fu3/ots
         ABWw==
X-Forwarded-Encrypted: i=1; AJvYcCXvvJLugqzkdj+Y2eR0Eqgk8Gvy/7k9VZ14S8I87tgemmxZTVmMyow+M0zXqDojn+nriTgzqQCOy6gCiFn8fEQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YzN9V4QjN+088AjOI4pfAriXY6QN8NApWl+mnZ5hHfKgbFGkbMe
	kTN4PGfjw+iGyBtPPida3wY803fqfxpll5Dnxn2ErhGAiYTLVwZkSXq+zAunWlbQ18c=
X-Gm-Gg: AeBDietRf/NfMM18KcjmRMvsUhNuHD1XI3nvgCFx0bPrVb51tcCzm9nemT08rtq6qKN
	WU0lBPIddSQ+5bjaf+lW7EQ7l8gSVbn9rZvSwNePkQUEGJHuDekK4ATZU/XXu4sFf6RP3Wck3Sg
	RtXwzlSLSjmT5B/QmbFWcTIH/fYkVOT/Q7Argc1YVe3TOLa3L+qmGUwwzAxqkMFkOF7aIGhto6Q
	uvu0xvyzYkYdTxb5uB0hRf0ymN85diM2NNmERNuDg0k55Likjhz6ZYgFbPcXIPLUiMUbr6aEwjE
	TC5+yQ+ndEcgarIsFppK/ClNI29m5l/DBXjpn2JFsDijlke7A6og3RubIG42V+w7sWMRWHIP5QL
	/3EPFa3ZkScr3Eufz77Ia1IpJXtNobQTkkvDpDGFWmJFyVKAgNuHsngCipvXupFtaZ6/Wd0YZrY
	9okUbnxWADijTQzppN+MKh
X-Received: by 2002:a05:600c:4504:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-488d6868606mr90101705e9.25.1775919491498;
        Sat, 11 Apr 2026 07:58:11 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:11 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:35 +0200
Subject: [PATCH RFC v2 10/11] arm64: dts: amlogic: gx: add nodes for AUDIN
 decoder and FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-10-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3024; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=aDwPIUOhLISPNgSObRWxfYDDxExbNsQWmTRb2VnYogA=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EkuEXh4QS9zvce7AJ4Hcul29fcbzhSO4T5RvKzsrM
 UfodUBCRykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZiE83wT2fmrGSHy90/Kt8x
 uhU85PdLLk3fcb9K2IovhlG3WtlDjOG/u+fOMjMLrZVHfSOcDrluiVfOM6hi1fghOs9+w0Hhw2Y
 MAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075813_626323_ED4A24CB 
X-CRM114-Status: UNSURE (   9.98  )
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

Adding nodes for "amlogic,meson-gx-audin-decoder-i2s" and
"amlogic,meson-gx-audin-fifo". These provide support for I2S capture on
the GX platform.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 32 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 26 +++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb9b7758d8d12c230be13d4311e5e4..411b3e82f3ce1e535a23d9966ba82099d5be2282 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -331,6 +331,38 @@ aiu: audio-controller@5400 {
 				status = "disabled";
 			};
 
+			audin_decoder_i2s: audio-controller@a040 {
+				compatible = "amlogic,meson-gx-audin-decoder-i2s";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN I2S Decoder";
+				reg = <0x0 0xa040 0x0 0x4>;
+				status = "disabled";
+			};
+
+			audin_fifo0: audio-controller@a080 {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO0";
+				reg = <0x0 0xa080 0x0 0x1c>;
+				status = "disabled";
+			};
+
+			audin_fifo1: audio-controller@a0cc {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO1";
+				reg = <0x0 0xa0cc 0x0 0x1c>;
+				status = "disabled";
+			};
+
+			audin_fifo2: audio-controller@a114 {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO2";
+				reg = <0x0 0xa114 0x0 0x1c>;
+				status = "disabled";
+			};
+
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x84c0 0x0 0x18>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc6cd2875553fa9b0e3ef72a2f6478..71a47aa4c2fc72195386a11c905723b3c6f6943c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,32 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin_decoder_i2s {
+	compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
+		     "amlogic,meson-gx-audin-decoder-i2s";
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";

-- 
2.39.5



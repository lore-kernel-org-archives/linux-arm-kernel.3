Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6649CC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeSlDRgaiFiP620nk2cfLEt5zYVqqWMK+mQKVyliaDE=; b=TrJxOog805ScQcCN9gc/yg4FBS
	bVa6utoWu1j0KIbixDzRrzu7MImtJ7/mEDW2sUt6QGGAFWOTubDVyIHO/0atwWrPGHQNr6679yR0s
	ZZ5RUfQAFXqUI8NOv7V/T4bQVU4YlcbNnxzzCUms0l3RscbsqscFDmc40H1XbXuU+j7yZTvjvPPhH
	fCzqg9Of4nrBuCL9/tUnFhGm1ivVHKVhRUFaNknqqlwsh4rDkW9zMm0I290cR0z6OxJNDM7y7k/Ck
	sm2gxQeS3EdRBkhOH0xDwjmWZdNdnpMJo2TsgcggXUcsHMUbBeOoZ+YSYffMLwgClxVMTM/SL8vAd
	W6QgpuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Ws-00000000FPD-3xfh;
	Fri, 11 Sep 2026 22:15:30 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wg-00000000FGQ-401g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:23 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so261835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164917; x=1789769717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeSlDRgaiFiP620nk2cfLEt5zYVqqWMK+mQKVyliaDE=;
        b=PE9PcYDnMyKr7neNSGXysiH1/8KT+qY1cC68rj4UTVbf73Q2lUgehtzG3qi9bL2GrM
         UQ8M4zoy6BNp9kvCmgPF6fhsFb+cD5w8ZnRDlAGseaaY5SGcG6nQvnQhkDzSpugVG9LL
         BwpE3ra6hK0mbj4n2MWjSCjr+MbxVPMgDN8Mo4nvAdB3PV/wk+gwBYmf8YmW33H2rLCR
         kVjIx1QGxQKTycak+vPKyHaFCFyPV4YpBDwLofgUGYFhNqVlIdDJFWlCbsKM3S3NeM90
         ougJyK2mpMErv1ZKxxyTEz8rG2wfNIL6VhAkmsZzUJXqivGPq4neJHZdPCwF6bdeddWS
         TBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164917; x=1789769717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeSlDRgaiFiP620nk2cfLEt5zYVqqWMK+mQKVyliaDE=;
        b=MG9GreqwZBvPueiB9+ko3hMEkXtaNiwj4dXu/ITAUTz1rw9tr+o8G2/OliFGOmZk4V
         0+/CXyDqnJRZEBZOs/mC/jyc8EP64VwFGJtmVFJrMlMoBEPtpGpFoFRgldkPoSaHSK/d
         aQRzj8kzUSej551fcJp/UMucw+A8D95ZJOdJL9e5CqlELwoO4sDmF9DUeO5qtpxraxJL
         ZIEZs06clxD9Z/xH4ATDG8REZiDmoqkIEmhqqr5uUEB5lB/1QsVtYQUGdm3NuKEEmbE/
         6QgAQ08yUQfy25EOODCjiDUvyCF6HX+jAVY3gUYNDstvJQzXxdgmo98qg2GbXCd4rynk
         2L6g==
X-Forwarded-Encrypted: i=1; AKwUvBxz2KQqAD3Q/FXBbmubH4mL5JO6laSbdVI+rPewFyM/7dINzUrJ41IO0HtQl3kQ8GCgO5n1Bc3KMVcMmqQI80h2@lists.infradead.org
X-Gm-Message-State: AFuF++m6m4Y28jbRLyKakSarKTzKRW+Hj6ujIrs5wt9N5I8zrfkoVzzW
	NzMbljqruEDc+f0BMDneO3iCm36p7RdymwejewOkMOe6xOm6wEwG9eCQIe1bH7AU8Z8=
X-Gm-Gg: AYBFou1SQU4zyU4OO9hxsSJHT2m1C9JvsnDLBS0F2LMP6U/7zr7nw10GmI9vLFqZUDT
	H/so860IgyY9Texnw/xmcLbKzvvXnRhKg/EFXaFVq3ehOZf3CZQ9wuMud5aFNElLY8eUaDOCuOn
	NvBzRmtJNlCDqcLtlF7FulaWlkYIdrxuncWY27cu7bbrD3JGL8/YO4D3GxY60xUOXYckHF3n+YM
	CNbPQm0BnlzNJ9CmFbVubyhv7XAYgC5dQIo2JB5Lb8y1mRi+WPL5jAunnaEGdLYb9Y3lxIsdJwQ
	h6N/WZCsETwfi8LEX/dd5PaSW3qrQBkHVCBh7enwnmA4zF4nVaigpbAwQkzt9CSkJIDYzp6/ks5
	ybGUPl5+qzko2GQV3BKR/pl0aZG+7RA5TuwYcUH/Gl3TT4BNnhdTd5giLFSO4u0vd+NCZrxZqXm
	0QPpixRJBKIpa/59yp/M5wHQQclpayPFWGvEBivx/WYJIl81kv0pKqSkW2mpsbqmDmug==
X-Received: by 2002:a05:600c:1547:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49e6cc0ac84mr1059775e9.23.1789164917318;
        Fri, 11 Sep 2026 15:15:17 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:36 +0200
Subject: [PATCH 6/6] arm64: dts: amlogic: gx: add nodes for audin and its
 FIFOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-6-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=EUGGUwRpDjNyAsnmTwsH+7qy3pCx+bRE90pl3e8XqMc=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanMn9J9aIburev1R2ddz4/cemHtN0X3PRU0urU1+S
 zwfLZywsqOUhUGMi0FWTJGFZfq93wWlag+NE04WwMxhZQIZwsDFKQATqZ3F8N9rQ+sXZ+ZHhp/k
 Dh+ZUv1toVF8w/YZodcnWK37/HJjYK4RI8O/5S9Kz3ZJbef5zJFp/PBv1d7/885bTRAS1vwe4/K
 u6xAjAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151519_091897_5E92B65A 
X-CRM114-Status: GOOD (  13.12  )
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

Add nodes to provide audio input support to Amlogic Meson GXBB/GXL
platforms:
- audin is the parent node that spans the entire register range and
  implements the data formatters.
- audin_fifo are the child nodes that implement the FIFO: they receive
  formatted data from the interfaces and then bulk transfer it to RAM
  when the FIFO is full.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to and OdroidC2 (Meson GXBB) board
using a custom hat board.

The following additions are required on 'amlogic/meson-gxbb-odroidc2.dts'
to make that hat board to work:

    &sound {
            audio-aux-devs = <&audin>;
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture",
                            "AUDIN FIFO0 I2S IN", "AUDIN I2S Formatter";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-2 {
                    sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
                    dai-format = "i2s";
                    mclk-fs = <256>;

                    codec-0 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin_fifo0>;
            };
    };

    &audin {
            status = "okay";
    };

    &audin_fifo0 {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 35 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 22 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 22 ++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..68632ed86e8c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,41 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,meson-gx-audin";
+				reg = <0x0 0xa000 0x0 0x308>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x0 0xa000 0x308>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				status = "disabled";
+
+				audin_fifo0: audio-controller@80 {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0x80 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO0";
+					status = "disabled";
+				};
+
+				audin_fifo1: audio-controller@cc {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0xcc 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO1";
+					status = "disabled";
+				};
+
+				audin_fifo2: audio-controller@114 {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0x114 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO2";
+					status = "disabled";
+				};
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..53cc92ebbc9f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,28 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,meson-gxbb-audin",
+		     "amlogic,meson-gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..be8fac36fb59 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,28 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,meson-gxl-audin",
+		     "amlogic,meson-gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3



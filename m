Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E414CCF2CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsXHC8OVQ58Ws2YIlszVdC880xyahIkcilQ/PKtCso0=; b=SfKHPVsGlyMuJ3rMed6ExwKd8V
	AJL0BxdiVMvIcRCPmJJA02DRlWC8z794lri6DF9QFqqj+2tZGzqwALGSz6AUw7E/u6FaqPJNPpPdU
	bLJOfct4g8k19lqBW5kCUXCmq/LwE1oaat5oSEjSbl2pCBrSDYjswS/UiKHpwIKOVLzY7qk7Ycme4
	sTniXwzq8EOBmMhLUfkq26DEbKoN+SZnOdYu5QHcmGykD+KN9qwDTXHDxikg22r4As4vjVjqqM3Qv
	1YFjFm5Qg9vENq159+q4ba97+MnWCznItz/4uJDSrPzC8Ty3vAvXUxYGFD+zcdgqzl/JmGZW4DG1A
	6oAKpSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyw-00000005jxo-08xI;
	Sun, 18 Oct 2026 10:19:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyb-00000005jiW-2HaZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dee593f18so797259f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318728; x=1792923528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsXHC8OVQ58Ws2YIlszVdC880xyahIkcilQ/PKtCso0=;
        b=OZwh2l9EtsKF+8BKP0c6pH7R9xSp4UplleL+x49SrkK9zqgDU3pJ0UeGN4LY3MPJol
         gbdq0lwuA1KyA7kfPFFTtgSn7QoLmUxoaUhxbULw1yIHSUzyf3j2As7fqL4T5nA7x33K
         vNzPGnnbwg8civU6Q8SRFXp1DhKo5VPxtLKbsaJJXZJc/h5TbgtRSntpE71Pp8MUm2JZ
         yVHbmVXQWI/ZzawKn064SR88rIbu+1Me152TgItEpfhaG9kYBfjhRc2nc7kkYXm0/xxf
         16JlQIPsJF2QXLFpuCDoPLM1fb5XnZ6Wf1Z9AQ353Jb7yqy5/HVOccUeFwkASUI/Avjh
         0Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318728; x=1792923528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsXHC8OVQ58Ws2YIlszVdC880xyahIkcilQ/PKtCso0=;
        b=FurGt9vWq2o/fqPhQ7FYHih5iBjIy06oolIfhpLnQPBynTfMAl7f43YLwJq8+kB5FH
         gXR7GwWeAMywyqR+QOTyB2tCspBV/XG5xHiTnbUIleyFNKxmgCvvRq7NLgXpEJKw356o
         /PhC39RhSKBx4ZHCTX521fbgzCHfyw2xFfN0Xko5sIbFvT2fSrs/+ti1aR7LYop4DISG
         b9Bb0hXo/4zLn5AW3DGM9OwV/+Ph7YtDwqAfm6kzDGicl2Ia6LGYrR0lB7QqmVVFCfWZ
         S9r+Dbe65I6uVV8cSnsmjcQIe/DU4mgLfLsEN6vqS1Wh2OC8R6xpVb+cM6i6KEtJTpKx
         liSg==
X-Forwarded-Encrypted: i=1; AKwUvByK1cIbFr1dMBSWuZfWVgu0X2OvSzMvTRPL4Nz5kahXutGD2ysn4TKTEyCyur3IQSIx+p+TUPXAvUdlJOoAaxO2@lists.infradead.org
X-Gm-Message-State: AFq9FYI5cUw9D1+4f/RW6riMTnAciEEupMCkwQnSL3NeGvK0n6qfJKaC
	+xY7DQAzA730WQ30z/CndRApCfmNUI9olB3OInnDdwWOiBrlHA/HolECp0MLBtVJQYg=
X-Gm-Gg: AYBFou3f3++rN2vnhCRPhD9azZXyGt1o0lRu4YhiaWfRcaMj6qtAsEzlBSMQa5ndm7N
	i19RsvcdUEly9HBuQrbAn6gtsUEOirM5Zs5/BPlX33Q6FO4rxHH85V7XjmQVdZc/9BdUoVOvI9q
	gfCNkey/4vHlhfZr7n/NTQDi+jUliSiLtGf7dN4ccnYdVRwtqIXKPx8DdSK9p3g4J/7I+LxKikW
	vaJQGleMfFYrFLJ/1CQZQoIZFuCeARK8iB/KOzSNDjeFjXZouyCnMZlSdLjAh86ckpNHTFuOlLS
	4B30BpWtbmZ71sCwC6mOY0+idEFotxf24NHHtzYpUM7pcjBHQWfusAru0sDYDY4LA7IeRzWkxZN
	T+0wFF149/fvpeETSbInJDNy6L/9Rnri1MKTdYnAdnurADHcb5p7kiWaEoXtY2E+RaOOPydt+g/
	064zk2LWQUrNYmTNY+RM3VYWuIax0qcFszpR8LdHDNth0X9mSB8pCXEZqASC1fxdUVY/H2
X-Received: by 2002:a05:6000:1ac9:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48e07f98f93mr8926555f8f.21.1792318727874;
        Sun, 18 Oct 2026 03:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:47 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:04 +0200
Subject: [PATCH v5 7/7] arm64: dts: amlogic: gx: add AUDIN node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-7-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3059; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=BTkEujrtoKKaX+uvUffHfwFOsZT0LAV0Uau20Y5fzNw=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vxZs/znn10vTz1aVGtx7rD7yobH01tLBeL+LxKb0
 6M7vXTe6o5SFgYxLgZZMUUWlun3fheUqj00TjhZADOHlQlkCAMXpwBMRPU1w/+ord/1ttfu4qzv
 r311//sN2QCOWYkLT8wy6a1qU/m1zn0yI8O36bNiixwvHVhRL5ybXfGIl2HrQicZw0uCrMsfnNG
 4eIwbAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031849_615577_F4BC4B04 
X-CRM114-Status: GOOD (  11.60  )
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

AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
custom hat board.

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

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..2b92a99ab2cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gxbb-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..8f3c7ca06a3c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,11 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..de213c0b63a3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3



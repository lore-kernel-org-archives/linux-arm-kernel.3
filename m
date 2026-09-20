Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25AFC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxSmsJzbIneEXZndIf7W1mbqPxGSYMwHTFZOXNa27kw=; b=lKoPFUCWgR0nTJ8Kvu6eQSf2QJ
	3wMbpg9izsi2I2+IkUWLHfMQHrs3Jq36rq6upSP5oVoh/Rg/AP+diVyTcauTG6u0OHqWnOxITwo7O
	Q0se2SgrT5BrgzYcQ+76fLZD56CJAInVEq5LPXFiwM0zDCHNxVc7mFkTBZYHL+t29tQomnL9h+9ny
	NNSfRZJeRelVHOmq2A3SsdAKdDk1YTA/fe0A4JWcu2tDvilDpc55azCTD6TJC1tqgelTLd0uGxef4
	NMPQsB5fAgofEzJL0c71NAOGsVitQiY5emLgtCuIgbE4SnMxJNXBRr8vvXUa+H9ZRb7PLaAzSSoKT
	9zUj6Wlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89du-0000000GuaH-0xC6;
	Sun, 20 Sep 2026 04:59:10 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dr-0000000GuY4-44HM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:59:09 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ec6188so11907405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880347; x=1790485147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxSmsJzbIneEXZndIf7W1mbqPxGSYMwHTFZOXNa27kw=;
        b=HugKko2cGfps6tRdjl4JXlSyQolMkU4EWHTCTVsv4u0+A9sOuqJjpPQAPlDYlluw3H
         kG9p3PWQjYDpaEDYZmvoaBDz+wSwiwvRNlaRENcDvsn84EDN0v+yfgEyzXp30+DmF16i
         z75o0yKIu+OwdlarshJtXdLhOmkPuuK9T9O9fbfOKDiNKYiIHYIAx1wuvjhpxnB8EViZ
         dThcbirEtUnmBB9x722mdga7zlpEk49UlPhHov0Q11dP1uLr4r1C3TbjAE4Bf4nd7SIE
         qARBg8maY0uZMrF6N2vckga2NyxLyfQdl7OXtoah2X3hL5eNFEThcBp8FxsYoeVWDC2M
         dp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880347; x=1790485147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxSmsJzbIneEXZndIf7W1mbqPxGSYMwHTFZOXNa27kw=;
        b=2r912cajgNKmOHc0SHRJmjHxnXqvaJa0Dul912zDkWmjbB3mKddAdrO4tnkjTm/F8A
         CeI14h3xZqoBkITyRIgb0YJp48LgQlKIFY9Bv2UEMpLfTLU2AIZPq7Wb02Hflr/QyEQO
         I8zTrVpoVLoeqZM1Ahwe+Po4jrFWftYExSBI8RrJ3DEtYZSdvGOGd1P3vWhxA0Cr9Z75
         n82G7/U+jkNekNP/7JgB7TVATQ0HvApmbl+ZBoMWKoXiVjEHZTaWKz2WZOfmwzrTlWor
         Mif/Eqt2iiq75AxMM6IdblhKvuqMbkHgFiEdPyYYbS/xZjSis9qSdotLu2lkU+h0RSKI
         RBkg==
X-Forwarded-Encrypted: i=1; AKwUvBw+pKgVRYMs4lkBdok29zG4vjXPf4CH7CAlGmaWpsDa0muvDKQmSxsd0l+CVRXVAXF7ZLklJo744uFq3HXGr0nW@lists.infradead.org
X-Gm-Message-State: AFuF++lrfTa4nJ/ZSLsD5Lj8jVu7wiR05EHLYCqkmYLqLvvcAJRC26K+
	7IiTMEd2DXppmgPmXuAgC+q2jA4oFUJpvOUEI01XqyEUP3LQjuy+U9hU
X-Gm-Gg: AYBFou0emtIFgvAGxquNMJv9nqJvpcDHbFx1rOnn6ez/ZywaJ3YCVc/TA+GWnxaDwnA
	9C/iBSWUYpZeFkvOeVpa71zMl0aSFMmbFRkW6h8bCJkgeW4+1VxE4QKtyDKCHHFAz1ODsJzq4iL
	nsM4qHwbr80VJXE/Lm2FUAs0l38l07r+7s5rhXEA5lZtScPyh9qDcofibGPLMDK13diihZfynmY
	LblGkWbPzcGYW4LAFrkQojFMt/MS1JWMfiJo/qpKFuxWXo+aROpHcdLDcSPOGCRIzWNSRUEOGnz
	pWlZ+kPCWIxaArVqY9Ou/un424cZMkBRWBWazHGRfrdOgPBBczfsccy1FOPa3+hAj54W9x8c0cd
	G7DCiSruis/8OrFPS7RPj3DfE5EjTolCFCyBVFLlT72GfIuuo/3w//ZnyD8OgOVaghOXFD2OVwm
	SjifM6el4EQnpwgaUEQcAY+d3tH/msGmy9kZ2FcRHrHTwzkiyVV8b40zjTamcCSkLk5+Y0xpa6A
	LbgDVo1Kt2hBzNxtgbgNDAVbvVc17BOapiomQoxT8ToXrrOJ8oGmUiSnsFu5czLSn+RD/rcN10G
	bQI12o4u2AAa+mul/MvkEBJPKDxlE+Txqt7jUNRWaKyd1cM=
X-Received: by 2002:a17:903:3e2c:b0:2dd:c053:ec72 with SMTP id d9443c01a7336-2ddc054095cmr43098755ad.37.1789880347267;
        Sat, 19 Sep 2026 21:59:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:05 +1000
Subject: [PATCH 26/28] arm64: dts: apple: t600x-j375: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-26-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=exZLW1orbjDOjAe+qhZ0AJwTOY6a9pj0Hwu8KuUxZmI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05U5024/rGw+4x47c0Wpg89398uRqpM0UgS0mNaHP
 9p+/rBQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpTBBn+CurZBnuuFVRcb2G+qCRkWnS0haEb70yxdzeuti+XFjSuY/grvDPw3QH
 pAqdzXnd5RB8xKt4rsBd1iJAN7/PsFHsXqM8DAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215908_008721_9F095710 
X-CRM114-Status: GOOD (  13.02  )
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

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts |  5 +++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  5 +++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 58 +++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..bfaafad6f60b 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..2f37784357a8 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..60aa9a870bd9 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,34 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		dai-link@0 {
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"

-- 
2.55.0



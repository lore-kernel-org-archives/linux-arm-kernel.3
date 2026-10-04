Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BA1CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=; b=og/2TEdI1jE+5foyL5fur+9CW9
	EACngsncKdvoo9d08HOrBEPUuOMqXbGqka9RTKADs8hk7vn9Ml0qBZO+hkqbMfYoFwfAQjAvzRgIy
	MVzTCdkVjvjJAE6h3hWbOYu2LUMzlp/Y9XoilqueCubcbj571PolxN4QwPiLbJYkwcR3Lz2yNfjnY
	56PzBzDG0Z+P4K/MYug2LOvGIWPqbmlcYgzpfzwuv71SasxWKuoK5HLmh51anCs7SRr5IgorgyHMa
	g2dS5VPk/3T6uoj06ZdvcsahkilLj+NKceCV+ireMKP6GDZxqqDgpjwmMGvk3Xjo9D+Ar5fq2EVqd
	XIWKq/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFN8-0000000EP1t-39OG;
	Sun, 04 Oct 2026 06:06:54 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFN0-0000000EOsh-1LC8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:53 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso353519a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094005; x=1791698805; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=;
        b=G+9KS8FJoiR6MJKexOAnAOGFiOlVv8gJ1q6Kvy7v4hAbXKUxbOAKrT3SbWKRex/nyc
         Zp0wygfvugrxUgVmC5VyBQaf31D+a7FFR5YcznSRZxYTiLidjI0ttx5HRvaMIDboGmjB
         x16m8OtWjPTwdylRWZOFXtyaK8ZwN2Ilz8c4C33ktj4IKa3Av/1XRHISVsobXkW90ldl
         A7HrGcLjhbIzJCYvPWYMN7M6rRza7iG4hYzBDa5WCl/akE+UXuer+XTsRoyq/Kz4ijkK
         9TANrT/FZSjt4vQPgZF8iDf5dtlyvM8ZxIwo9aLsTENZW4xbi5mb9nBQIts85UO5Ab10
         J2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094005; x=1791698805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=;
        b=ZMrIxolUJlaacjakfEFK2hxrsbngRHvxjhRp+7Z32J4zrpYX79EWMJqZjnkpEj1rjM
         U6WG0Pz2+8Uaj6Eyebs+O+ugMhaRypGJFPXFbn7kT5jKFwTI7ytVS4TeK9iACM6Cvlm6
         PWOMgSPAYDKAiY6WWcYErytNjoEnBE3Y9oMngbfELH58DHPBWmlqJ3VjUWvFwgmqNvWy
         +Nnps7/ME2yBf6BGxVxrtOXKs1pbS856fGs6P7aqMfUjTXtrzVVikSNvqZLXXFpWcST9
         tPJR3zRsVZ5QJDuj4KlJ5/T3+tePwinO3gFZ+zI7JC82WQO0Mu2Fr8k6aFiBpEbNxKTJ
         sQog==
X-Forwarded-Encrypted: i=1; AKwUvBxJ5gKA69hIXfoLwLCVqkfyArbh+NkPdw4x9EcDZGSHIdaprpxMVBxs9cjGgHqShdmqQXO05mUhILFLvtGxWfQQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1JwV6/AO5q+LS17VldWM1UPv3DImzyAtFdZU0cUIVGdGIhpvj
	pGeWrV2hTzMN+5t1d/cM5TWKGAN5GA7F6phFi+aZszu+xl1JorHUX+oo
X-Gm-Gg: AYBFou2hMJlB1VVmmWPLkNbx3feH7tRhcz1IH0+7BcsDyxRYmQDfyNs3Bl4dRAAFdqT
	h5+UFcHtobmKuiE734R5ahw4toSSm30QCZufntbp64N0ylr/vGGakeG822OtV7j+VtrJiXt1x2l
	FjDmysEJ8i3bwGxWVtjkt6EuRTh3kYNxOQ7jJA0Qd0DoxRkbptXf1yIm0KaEtd/Li05Cbq3jw1N
	S8vSRiHExCt3GTA6rlkfvc7C0LnLCiS7o3yZjr0wISVVs1+Olc4M+zpRcZ0hFmuo5jc3USVS37Y
	SyxXmwlDIDTkVA4E4ktOfIKHo8jdWTWvph17MQ26N/dK016zIw3v/CrPORSQfAIvDzt8WAQA4iU
	GNvFllFA5ute1K22B95jzL87YDXr6X5illhNcrfjc31xhf62+bHMMaDaSrI8eCTP5ZOfUFhcG+K
	TEeQReXUlzVQnYggqwPLDg6Q/299rcN7/JOVW3Cos+duxTjBhfpcGGgwwlFCMlPI3Ex4kjmsM+i
	8iWhUiTLhiCa0qTG2Nc90yXXru9FUGlp+9CJBIQQlRsvIgQMzxCzOEu7cU44VvB3AHb4VWZ+abB
	hPV/m5SwvYAjv0JDjHt/TjY6ijKypHsRIqHZn9gyVlGIi9g=
X-Received: by 2002:a17:90b:4a51:b0:3a7:cdf9:902f with SMTP id 98e67ed59e1d1-3a7ce18735emr442657a91.1.1791094005403;
        Sat, 03 Oct 2026 23:06:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:44 +1000
Subject: [PATCH v2 17/21] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-17-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+HjgVzM6hrxGzffR6UpBVCEFiz9mMaK4Qwhq2WWzE18=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QxC34/UMd1dwtXfvSXfTwzpr185aO26s+XrVPWm
 cgpMvU0dkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ60ntGhm8TvCI1f0Xfna2j67bCJVz39TzObS7lcwp2X/l+bndn2hNGho+S6RV
 5T+59vpkwscoqvlzc+5X27klWLgu/LQmd//ryRgYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230646_368708_2C941B25 
X-CRM114-Status: GOOD (  10.64  )
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

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..8993775da9ab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,113 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
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
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"

-- 
2.55.0



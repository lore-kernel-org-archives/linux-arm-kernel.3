Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1A7CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMAvukaRhIvNfRDcaKZkT8BhbpfgN9KgcwyWQPsSqzs=; b=D5FBgLY1uXjm0GHeTdOXKtWnlC
	7/H5QSh39uvpgpjPxYSjiBlIElbKQB/SWd4bYWqxFdKmBBsnKG8H4Sxb6VybwkuobnUZiwebKjLev
	bQqIi0FyX+vVsY6SMdbpIW7bOi2vIuxYNYISk+n9/Nban0Tf9EfkVsXD0KC4uMTT6GAcbCbas0tgW
	l2In2YrNyFnU0dIuYiIwtyVmpC0VQMYh8vNiaD5LspYCpCSwxiWrtZ65YMRYJIZ6ZK5ajmLvg+4lf
	vH9nHONDG/Uj8A7uxX13j5pPKVB5u+FkutB9M/ky0tki5ZaK1SYZ1doVY3j9CJLUoJt+MVRKpJ6nv
	a3hTIWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsm-00000005aas-1ThQ;
	Sun, 18 Oct 2026 05:56:32 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsj-00000005aXU-2lh0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:56:30 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso760010a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302989; x=1792907789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMAvukaRhIvNfRDcaKZkT8BhbpfgN9KgcwyWQPsSqzs=;
        b=r43hPXenRuf2tbboUCvd8LRqrv7h49EXAEzsu3vGeTVKyAZysunxJinp8gawAbiGKk
         tJeArqwOtRmroJ98aWFP6twX6Y3fgB/WaI7liypMQn9vLMpQO6V823d7fewAEgSUBnvS
         5gfbhWuGJVms4vLtIwZLWPKG3Onu15TIBT0SLU3tLJe0bW5e4QNBtRHwpHr87yWWx94b
         8agqSgEeM+Anyk2+lJHfd5r7Som1pcIriIPA1M681lyynIXwLsXoVahJeMVAqGIZP8DV
         15TYTKPeUyUxRjXmaJSlupUQduUc3S/giG1iHkEz2dUBm7b517JOwKHPLN6HdWsSPu5+
         pyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302989; x=1792907789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMAvukaRhIvNfRDcaKZkT8BhbpfgN9KgcwyWQPsSqzs=;
        b=N2GYb5Ki+dNw2km8LmZXAMZYCnoYPLGfwQyOu92PnD2qaswpAXeKcpCjVcZUon+rjh
         KEbQ/KDpHbvnZ22qV/IaUN4eQBK4wqE3KrhZscUj06HSZWILsXfz/TsydSLHt4Sw/+Rj
         n00Ws1jBiOxFNXutjzzW7J/n0h5rri2LdF8kR1I3egah9ExkscGb/cj7DB05jZ89tfdc
         ujv0Y9aFh43mwL87NdKmg8AxOWVDqbvWdapwAkRgLEBdk6TqHoLv9bqZ5ZogZfE8pTfT
         MwAcZwNCFAFPDfasGp73EUNiXujl0HrrN8kLHfyI/7Rt3kGZ2cX4TyUPEZDkzHeHFLxO
         3fWA==
X-Forwarded-Encrypted: i=1; AKwUvBzboZQoaWJaQ3MLkRin7VE1yd2vFmEXK/nCTQTBMBdduJKriUUU7srSAko8l87LtSt6d0hjPgesvHsoNyVDGciy@lists.infradead.org
X-Gm-Message-State: AFq9FYKJZQWC6f0iTWdfg2o1KlLsgFW+pss4LCojTm5Mxd9sq4Sx6Dbq
	Lv0WY/6E4/u+SPvK85kMDkA19gjbKweTviIAcrrLJJBYiaJtsGxpaIFA
X-Gm-Gg: AYBFou0TSJtnt/7vAdAwwNqjqrINEpL+rW5yJeza+pDWNPa0YhOSuPvTU/5LgwMk/KA
	Ub1N+Hbrmf9XxsbY+4q5Kn0VDpO1EGTUBfCBVkTREwhcXq5AXDMytXAJJ5BkFumpxWbgp8VyjPE
	E6ZymQ1DR9K+vyu1wNkuX+CGab/5P160vXGb5uZB2DLJIWePRbzEHATYPkZgahDgGlsAR1S9aLh
	D/YM4T8cOYwsqKYNh4kxaJZ4DiJqWCPufuTI3FQZcmWE+HOjdESRxk7IPSu+xdCM81cj7cg1/RZ
	4Xr4BLUhUl4b67597ZVguzjiawoMKb8UOQkfkDADKOFXTYR3UVJ/BeK6TVvltgPJiccNiZR/sxe
	duNalatHm1Mvvp8gWxc7FrzzLFGyz0syfLfWh7dHep/o2YQTbSTIAmsiEAGA0iBpVInIgz96uvI
	S4Uv0GgAfmif8STEXw6ypCRKKlmVLQfSi5XeZ67Acu48W2cbgLLggN9a+fzvPaLh3SPKz7p0Mbj
	ulclZM8fZ9/4pg/xIA4Y0h0TRIy6BiVKm7tuVLW+gDkv47s8k/vjGQz9+cul2WdF2Qnj/zXITMY
	Yw7U/2uGb8sMwyXGstA2Q1YDpEaHeW348nnKurAx6FiFUA==
X-Received: by 2002:a17:90b:1805:b0:3ac:aa8d:19d8 with SMTP id 98e67ed59e1d1-3acef29cf14mr3792642a91.38.1792302988848;
        Sat, 17 Oct 2026 22:56:28 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:28 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:06 +1000
Subject: [PATCH v3 12/21] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-12-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3395;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=c4pOMeYRPHNd56Heby+nLsdCOiGFtaCe6E8JAhxsVKk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnvLXed9mPfNOGEF0eOGOvLS8zz+vw8bK9GvdFSJ
 h93TZbqjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFS/1WZkeHxxxsXblQHl92JZ+qveH6qq+PzjVbHtmruHpXdxS8vMPsXI0LRupuY
 Fdv6IDCbnFV/dCxVeHtOofvfxRfciP8Ubc3tPMwIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225629_714760_AF18CB76 
X-CRM114-Status: GOOD (  10.54  )
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

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 116 +++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..7d4907cefca9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,121 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
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
2.56.0



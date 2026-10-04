Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100FECA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEEmgDILRhIEA8VUTy7J3z7No/+m/NGeZn0Fr0Kfpew=; b=NXhayoyKooRGoqxux9xk5O7RN2
	y/o6rGsMPkjYe0bFLvkKDKsO5WuWi9LM6SHUVz6C0fg2p3HxkHvA24CsT3UkD3cpv5QhWBERmCpvV
	6QVx2D3QivAMMLBwb7L9vER2BoU0paKcVnmpXP8JDH/pVvMImszSyDql7q9JUE6zCFNuJN7SOpwWH
	FcFeTswdDUOIE4KtwV1MicTACfrBo1B3fHEcw9GFrnfN++61wGGuDjEXKFRtmPpTrWlYYA30RTrB5
	39TfdQfm2573FxYerr2RgpHfPDj4kcxF5zLmV6Wbw+zIvvdPviuyE5nqrELYNUFAgLEj5KdCJ99BK
	/Uo70bkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMi-0000000EObi-2Gdd;
	Sun, 04 Oct 2026 06:06:28 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMd-0000000EOWJ-2GwN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:27 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so107909a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093983; x=1791698783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEEmgDILRhIEA8VUTy7J3z7No/+m/NGeZn0Fr0Kfpew=;
        b=Lx3qlRP3g2K/uRFqddCets2lpStIDTxzZ9Ja2gNW8RXA6zrqu3WfFx5JgjRw3sb4O0
         zB0NsU59EwFPeBSIrkB7j7VqkbfQZJf06krcPibba9WVGECb+/d1RS9NjqP8yVSQZwOU
         Sez7tXSYvB/BYqdJGNIqXlXt7ky9QLRkXKCT2YIn7yFKZDRrQFO9m0mlUZnYs0cK+ptm
         XGBNxKxptZcrteOB7cJ1GVogQ/Yavnfsf5nCdRe6OC+oUnldjWx60GXtKltWR3OqNCYI
         V8PI7SpB1K9xzZ9HvNL4fTgmHHEjZJojX8Ncg//Y9U1Anjn5hHCCN+6+dfTT82XInL4/
         qhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093983; x=1791698783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEEmgDILRhIEA8VUTy7J3z7No/+m/NGeZn0Fr0Kfpew=;
        b=xWb5gYpyIvRGNxb39SfM/7VtkIC86Nobi7aPYDG9CSv3cGfR8jwd0Wbq8EJpfQv8IZ
         iv7kVl0xY1K1eUiScinlc6ZtGDq4X1pGiINEl0k1NY4SFDqbxlgYKX2pGtBARYgby8dd
         xUCnvr9TcDAEBOy4GNy0v43Z2FHvEg3hxsbPJnswBd4//7Usq9WXcsvH+qK8FSyZ7ivx
         CYTQJ1ssiMEA5Q93r48f9RuM050niBlXmB1eR+/c2P4zjb2+Pg6hygl0izlUvRA41MNM
         xqXGP8OsjyRJxfiEqaNTo9mfKr0Fu9GTAUaRLU2luVZEEPlGXMT4Ex7a1wCr0BQefd+L
         Lp5A==
X-Forwarded-Encrypted: i=1; AKwUvByz6jgEfxcjz2Hr6THGLs2YDIfEcAjfSUOqK4Ubc3VOfBftH+aJQ16ToAX+KU2VDWRN7/B+/i//Iw1R8nTvKiSA@lists.infradead.org
X-Gm-Message-State: AFq9FYIypPWnc08h02rTiDxKG4KMFMkKQ0rXopjN9HZiTMjPhJ1AlRjP
	WQh+U8vlRuJrjBPPzy4Y3WNnjA6elsCWCDdE5oP0JF9yeIQkTIP65ntV
X-Gm-Gg: AYBFou3CVA8lsYM0bvSYaWZzr+R/+XtbnyNlST6oRnRpOs0ywl7bUXAMLx10KNkRhgm
	lofbuOh488X/ygk11g1FlNioGNi90S1x+tisWDq2GGRUhnK0lxhQHAcIhOIl/cPrP9YD5DX3ZxH
	UEhF//y8UhgnS2ulBIc2jsn77p/HBCWAjLgITaMoYdVyDLfh1/eNT45Rk48x9rmbTEBzCC8Pm3D
	ValfcJnKNvFL2EjGZicV44Z1mSHXYwY+gltCE02C68BvBvL8SCiXhkMjKmiAVH2hYgaLvO2TJB3
	qRmxZXVXR8y2IGDMp6VYW7RCseR++i/zVV7i7b1gyqxak+8Ss1LGscxvO+etc8Tt44QJTXy7pRI
	wZqHzA/HytHp91ehrMxgSeJtee5WnFnKtoJ7jh1hCqvEJ2/sp1JUSyBfJOiu/jQ6hFIGky5GdcF
	exry57vQwt5YKIeR8l1ibCSAn9cr1Sel6SZvjPmpsHZxfFyEC16jsCWbSmdPpcbXxqG2wRN2ADw
	Cfk+lhaky09Cra08hbV0gP9H5E9mvlE3shkL+I5SWW+NPpfHnZgEwAtooAulHBEy1vtQSf382FS
	Fyl9fkY2mBe5ycEC1zr+dRYD+SxTawOuNOWmrDHGeMkmfiIU
X-Received: by 2002:a17:90b:6c7:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a6ce97d00bmr4272307a91.7.1791093982802;
        Sat, 03 Oct 2026 23:06:22 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:41 +1000
Subject: [PATCH v2 14/21] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-14-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vCW3fxOJkBinIg7sVkVmqG3Z3g/7JrWUIeRSo8E+Iow=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+St/vRVrMtqLbPodA5vI7HnVZnR2lXxE8IMjM63n
 tA9emBFx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrzyhn+Suj37xTkrZ/kZvugg6exaKKM1GzuW+kn/x3XqStTmeaiwMjwW+Ny+45
 Gp/tbjzlvfpLv9djH+or04+zeuD/CTjX7/zzkAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230624_940043_19698AA5 
X-CRM114-Status: GOOD (  10.59  )
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

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..5f8768832e1e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,112 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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

-- 
2.55.0



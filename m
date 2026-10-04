Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E4ACA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3QHSkSxST2zAhLEr4m0t2e0b9c14pDjRMyYQ78t1Ts=; b=mmKT1d1Orkbr3rz9jN1r1B5SbF
	JVoy/uwxjX9CoNkBVgVLF2GicxHoRyhllTFuSsYOSHiq/zErv6qxpGOD7LpZDR4bBLK1XhRldavHv
	wI59IX5Ya1DrIQxCHU5Z/TnY+Zcb1ohAmSPJo5s2rVP7T+SQpV6nJ6OnR6LaXTa+PurWEDEuB7MsY
	SsheItYpjdmmnoA9RH/njt6LvX0bSpoAmofQlsRI10CeeUuCi+CfgFIz3dqbiK+sehh1ffyuIQnbq
	ZJwJ9GY5b/vQg3CeSnxb47Pi0oTHHsuPTSk9i6obF084obtImOi+/qjEgDRMTVG3+ORIz56GHU/p/
	Q1ngg/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMR-0000000EOKD-0NKU;
	Sun, 04 Oct 2026 06:06:11 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMO-0000000EOHZ-1qYA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:09 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so409090a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093968; x=1791698768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3QHSkSxST2zAhLEr4m0t2e0b9c14pDjRMyYQ78t1Ts=;
        b=VnFR/ANLG/KDZw5NS7mBxjul/uk3EdC7mQmTlnmoLcsvbbo4gQsYLgW00T4MNdSl7f
         9WpYG3aOWGyZwsUfRUgh+W/rIgC8QkdB/RC2n7myStnGRlS78o1VZoIL46xWZPcHEM5Q
         JJMAW+IktScvD0S6PVDprUEhlzF6+miVMmyJWFTD6/gbSsDsn7EQb/9ugV8rkx14q3/z
         GfXun3TMXf/QifBoKXkBcgNJ0tYFrSxuHZf0NzV+/+FxBg5jZ8iG8QjUdfN2SPJ7BuMt
         wm92vYsbWImd80fyRk0hxUL9thJSgFKj4yUBAx1eAL642YwPjKYg6+EHcTlTKLp2dGl8
         DgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093968; x=1791698768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3QHSkSxST2zAhLEr4m0t2e0b9c14pDjRMyYQ78t1Ts=;
        b=1iQtkxsBLT8hbEf3czZ1w+Z7gE9J6+zDP8z/cSpiwlsJoIC5aLYS97TtzQ7mvd9jtq
         M+68N59wuJfFIYaylBycbv8g8AiKBorlmYztOikGTiheakQqzNIUAjOPZZU7pgFge5J/
         EswO3eod5QoTvChD3p/ajavbCkkoiuBq2utujoaVLTcWK0XhDmeIGuyoEu4FRSvdLtzl
         hrAN0mA0Xbg2j/A9K+I1Cgrr+l5pKYatjrkzChqafo54FjjVoqRsLmxJtn/az6FDzUzy
         YP/7gcFAltpELVJ0HmRC+0b2uXQp8kMy8TitaPh+V9oKGMybx1p6UR6YJAeqGUUx8o8b
         XFTg==
X-Forwarded-Encrypted: i=1; AKwUvBz8e/jPew40XAVNNJPRJzD8V86DxTnm1H1v1JeKaKj49KYGokwfe5YZXFGwjcQW1hthRpiKCjy4xcQ2/day1ZIy@lists.infradead.org
X-Gm-Message-State: AFq9FYLcFtnroIWk5wehSKOF906WMokcvtxM4PtRuJ15EsxE1bc++T4A
	D5scutbHXCgYnW/8Mg0DCjfXJ0qboLYfQ+M96c7dmxC/cyvpT5ipz+MI
X-Gm-Gg: AYBFou0OmzsBNRSelsdR5V35MmmVBpntCJ2PWFXobyvRHWLeSwddAvMrJdSUOz8fk+C
	Yfgl5uv50EvsDwIuk6Te9/XUc5+ifWhO7Azmk+PEXjiQAZcB0mQcKLCVz3mWL7YyNnWKET98w9w
	KtzaaqCheCyGV+i415xBkXUgesZf5JHLieAY1Xsh1wigxlpgqIV3i5sCOc2Rm5pGps8AIgVyWrc
	CpMl7rCHZoAS4Zf6olB9SoyE9YoENUwGoUXbjJmdNdTHXa+oBRFMzlKTv6cXRvxipgnH4PpPf8b
	SGjr4WrKEJcjODRJzIoLq/7icBiy/TeombO7wVJftsZzWLYg1FtU7ZRiOb783MvkhNCrx6GtyzZ
	wlBdpBDUQ9PyXziqyd86v3PWVOtFQqq+STsgNU6hOP3BQ2AlI7H85304o0BdXrSie3jMBEQnYKD
	hSXBN+Z1tXGWMUgJ33zJRBddCOo2L3jdHfrTFwZgX757idZEwlE/DCCvlVewSLOOHpAkj3D/T4U
	//frvLu2BLYoH9esTNcDNDJ2895zq1YQvYAS7ElDebrXMN/vTDw2y7Bjh1B8hZe48rvIMdpKTpf
	ABD/GxiLVUYVRk6HjAFpp9YQSX4WPCTzirdGnUPqTq/GcBg=
X-Received: by 2002:a17:90b:3903:b0:39e:261:4e0d with SMTP id 98e67ed59e1d1-3a6ce75d5a2mr6439953a91.25.1791093967799;
        Sat, 03 Oct 2026 23:06:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:39 +1000
Subject: [PATCH v2 12/21] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-12-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fs1ai4BpjRrKf1Z6N1gXbBVEIUvHZAvrJK8NPJKhhz0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+ReN1+v3V95y/atworQPe6OPrPKF8wxlV2+xsjf9
 d8uj7PFHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+9pnhf3BKnfevWe4+XwXOOdVorvkdZB1/evG3vruFp/ZclNK3d2L4KzMldv8
 9gQd+zm2zt4cVreSS4jp5f9uBCDPud7ZPmHVmsQMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230608_531872_515117A2 
X-CRM114-Status: GOOD (  10.60  )
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
 arch/arm64/boot/dts/apple/t8103-j293.dts | 111 +++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..42f1127151fa 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,116 @@ &displaydfr_dart {
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
2.55.0



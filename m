Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AE3C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpYqy9sPpPsDPZvvN4y29k8KbffQ5LKsND+nwCRIinE=; b=b9fFucNan4NC36j6cSvrWenyxW
	V/T1ggG8nO6QSwU1r4rq8C+yNUvRmE/GLKSP+/TBLXb9UF4AE7hhyxtLWSaNnPEVuVlWyDMCTioAU
	n+BqBJ+1xtcmXZBiPCHs62baHzQh310QmGEL1RuSdTU4ElzK102V9dBdSqxciPDwaYohoN1lfyezb
	LozYmpYLVA4MttwGGuvbevcUi1LDb6mqKxZ6BV4o1JQLhgLazMt9kiiHuw/9ZGV2aEn6BhjB37dLl
	lRzZ9mCb+DI3XPmoqtT6AWppRK/Gkm6aWVsq585M/JGMXy6N2eZuKnODJ0UrAYnbKuGahuWRyyF/F
	mHOuSWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cs-0000000GtoO-07mx;
	Sun, 20 Sep 2026 04:58:06 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cp-0000000Gtms-4AyB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:05 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d91ede8035so23823375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880283; x=1790485083; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpYqy9sPpPsDPZvvN4y29k8KbffQ5LKsND+nwCRIinE=;
        b=eG3sIzfPju2yCRdklo2Bd1Ak6xBlBlmbAXk23lfu4DCBD9wnVpB7mAmSTjWnTbuMVF
         f052G7gyrOuI181sG4HlKBOH4Ab0XgxJM/edCV9msSpvwvpM5l91JCY/0ArwMBKGy1ip
         DXeRslBM7sp/N5fvQ4BAxR8/7yVLo6dH40SpQ3wmOTo9o+9sRIq3nbG8EAFXAkOSGiVc
         SoOxouEaBYCuFDplovZWxQ06TMbhYPv0mTjSMx2NQnUvtb+rdbzwGoOQMEuPgILzt9aI
         Rm8ssazmuxJRyQ4cEicJIDGbD7/qViMybwmVNm3k7Dycs/+xIIVg7aJmoUozS5u/UjF8
         1T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880283; x=1790485083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpYqy9sPpPsDPZvvN4y29k8KbffQ5LKsND+nwCRIinE=;
        b=MVfPHcyRa+PhWh1qeteR0TQiteyS1fWulU1Tq38dYhPo95WGPEfga3DAepmpKSw/pj
         M+iKNwPBvNIE46cTY2QwFXpe5e8QfE8enatoBRgrP0OsUNRLdj4g+r8H8CixOnCuzllH
         Mc6w5WjccfAXimiV032GJtIMFFqFH7Sjbuw2Q/lYytGvBwAnoFUSfRzRLdRDA3vZMWDk
         Y551JHLt5SSbfXva6vIhuepunze9cw+Bo13ugelHCjN4Vj9pXH876CDhMDR01oJ69okG
         ZLeO+/nrMMzurNZT2hdHDRDkEVQLc2l/Luz8WUy71ufbXvjg6wNDUJ7J8T/ZvI8m2stQ
         cmtQ==
X-Forwarded-Encrypted: i=1; AKwUvBz43I7Y8CsvSCc8Y0jTPMkY17u94alv8lUFmDzkGWEld6lCN3jY6ba6SV1k7XnFRndBod/s0Yz6XxjxjhtS91kR@lists.infradead.org
X-Gm-Message-State: AFuF++nEiarIsU7sDQ5eU0et/ce2LnDOV7T9+8sIRlh2foR9AziPLhP/
	2ICgVvPOjwobJjpdCKj+2mnwLfAha4fZxcQ1Un6PnzWLYW42BnkdTpNi
X-Gm-Gg: AYBFou3FHe/sfBP2CxtdP2LQaDIoulsExCeh+rhqhpvNAD1uok8raMKdeh6a46T3cum
	x7uSIz27nupEyhYPAc4+P/I+Bx/K0dzzxr/U3XcENvGP1Fia4i/WuASDpaDjtseRW5EUbu5bGEB
	z2jleGewj8sJTkb2mhreFateaIMAjq/Ih5QBge+CzkPRLuf7lD2BbgnBrm0MlQZp1kWMH91oD+S
	oADJAt46GA9TpRU9Yr2uJ0lFd6UxpOtR/etpUQ7NowJdP4axnZ3vrjSJ6f7KSzj9sr2ix9sxNib
	vrBUj6F8Mx1WUUjwic4ZeXnz6zr0qV0u0Qt1PzazqerNOCapxOEJHwxa6LFkWbMwUQWPJ8mjczZ
	MYjukqWMBOPCL9zmXgaBaJDZb50bDQKQ77ZmBdrVezA5e1L9d/ZBHrpBQPaDhFcGSuWdnOToeLV
	9euUUK/fAo0BUfAASnBvFgeNGuM7pkzKid0KemviEWlh06NmvmcOaFIebRl3CXnDBtYFpDq46PS
	35mC/9983SniIxsJdjdwVDd03yDkmOH4gX0rXpSSYq8fMgq2wyMeGLwdKJdhrTwWzN42MvESS/w
	biyXGdWvSfb+2GXwYQoDrxVH/A0D8d+aj+Ov1aD9C+arbfXl
X-Received: by 2002:a17:902:e746:b0:2d9:54:fc69 with SMTP id d9443c01a7336-2ddb1af4f8emr115717635ad.7.1789880283230;
        Sat, 19 Sep 2026 21:58:03 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:58 +1000
Subject: [PATCH 19/28] arm64: dts: apple: t8103-j293: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-19-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3212;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+B+jPv7EkmgtOQeTinSPKUZXk0Lm8pE7GSzX4ECkQug=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXbFkxPfyYrYbfLomRP9IdrIjNM0s6zFdY/2R7Ku
 91jud3DjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSndjD84RTiVi2ZW7NbRnPp9WfFuqxsqkuO5j7i7t8hoHrx6ry2SQz/veWyws5
 f/XDwe6ZMEef9l/O/VSwW2V4xdZbzxF3FHRy3eQE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215804_043898_93512761 
X-CRM114-Status: GOOD (  11.35  )
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
 arch/arm64/boot/dts/apple/t8103-j293.dts | 104 +++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..24d0b512fac4 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,109 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+		compatible = "apple,j293-macaudio", "apple,macaudio";
+		model = "MacBook Pro J293";
+
+		dai-link@0 {
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



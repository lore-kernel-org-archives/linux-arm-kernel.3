Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17328C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZxE7qtOQPvQOMl18UomFCfaDsFGa2ddpzMEh9Wx8L8=; b=Xj7kbE3JRXZJVNhwu+I0M53Aro
	lr3vA0tVLfsyYJf2A/Pd0t26q9iuW/pqvVfc0KnhwsRoKMhbYc9s9VGvwCZkwt+E9lVMOundBYpZE
	GLqE2u1w3HL0edaXxWOKyw1S8QHLRar2TZZza6gBfdeOR/ldKcajXODEVIKrEIY2DGCLvR1ntqP6A
	JPJSJSlJN3VSKUPRRX7dtG22Ih6HwtvPRbI0hvh16mRrjhBiSz/seEbZ9cyrGE5vPeJaWxrX20gRa
	51GxI8a970tED7zi1x/YYhDKwj7YI+dXvFCXZU9AaOGT+ZAU5LMSDm2vEAO+Nmp83uvqKC8VKxIu8
	2NQI3pVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89d9-0000000Gu2p-2nIl;
	Sun, 20 Sep 2026 04:58:23 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89d7-0000000Gu1L-2qE3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:22 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d93ff61046so19907045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880301; x=1790485101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZxE7qtOQPvQOMl18UomFCfaDsFGa2ddpzMEh9Wx8L8=;
        b=fgWHDkQ+Xn+IwMe1KYe8syIGpUZyNnEnqo2JkSoTVq8293ILvlnnFxOOI5Ys0A+Yg2
         t6O1o0MNjTnFwEaRhxO793aTM9f8WVZNnfEEtgUEYkKC/nTP3gy/2NXUPciodYqdKNKl
         GuZwi8q3c8WumX4ojH6cCx7tlVz7uZI9ChJBApY5PVo1kx+E4Z8IpiSMyQ27smn0VO9c
         Dsg7TcXDIf/ivIIMwtrPBN84HChhSaJerU/KQvftO3XFcYJwg3vFOYlie2T4QePmkKH7
         Lf0Yc9dicd8mbbga6v74ZC4QUC7hdEsnBlha1Ygbpdges2GDC4zvPPpOf7wq1oVPhYWc
         PmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880301; x=1790485101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZxE7qtOQPvQOMl18UomFCfaDsFGa2ddpzMEh9Wx8L8=;
        b=vTEHGvxBg8sIL4Fio/n923N9YtxGDTqm/wqphTRodythBM1b45MiF1KUfSv+AIG0lA
         Ec2ZdjFswiyFINCBaT2zU7OH2RDSrvKxGVB1VOXmDiGkp+eb9xBMqP5d6qngraPb8nOw
         X/XMLUKnCtSfpf+zh70OpIWPD7PHoCetg2H73U6M5UYlsXdvBUK/i3UdbS7wTXkgzvpu
         HmoMWcVgAfvDHUyx1tgIawNGne5yy50hu781pGS+iyU+NPNXexOPzkGHdEDi+Z4UByPI
         G2XMpEaakvuwNovt1Cww3tI9gZrCpqkZJJ1kplDhrwkClxxbNP3QaZ40AcNC9WC3xwOy
         Yvfg==
X-Forwarded-Encrypted: i=1; AKwUvBw4p/NN70r5SzAvXgz5iKI2ONPp+0EyKhjzH26GS+XkQgwE+Q63/SgvoSuCrZTu0B1ZxY/JO+DN1DheTtcyQXHH@lists.infradead.org
X-Gm-Message-State: AFuF++k3NcUS2gECXW/p1dylM9kJJgkyoDdaNtKhpqRtA/EZgP5s2Nup
	pjwen5qJSzAGgqIApMr/tMQPz4TUuEI/87MgWoXbcNBsZt5LFdSzehVo
X-Gm-Gg: AYBFou0F/y+GN1+JGKrn+Qp+NDjtHfPxF07a3F+D/TbTs4FIPYNL0c1yYAc0fIpyscL
	TW02qC8Tfn5mDA/9WEf6eTfSZ/a/A1gqMhtQp7PKvQxyABYfmkVAcYQ0dEKUYbZCCMIls+ZyT49
	wungYSk4RLlxgZ3ld+AmVzjWvg/8S9krx3fXbFc+4iwnKfAXiww+/6awj/57JRv4SdinvHnDDtU
	CShn2ov40mskRwWJVfyFJjx1SijbftuCW6kyjIoGiVHfn7SLV4gyWrdxtWL+rtigAcWFKMjKWUG
	mPmop6dIc3YURyzDVLbEOQIlU3GES50g7dHw16dseNishgy2sJ6jZXG/6D8kuoa8KtWLe/RyPYQ
	rQRe9iY9hfoEIEjhlSMAUUPXZTJ1CyCDEC9dX0PpekGjDH+7U30LOkffHccuxvQ5bZyHzum1Xqd
	k43zI26sArVMlxM09Hh5aDM/fGMlj9O2xUDrLeIIoHLEa9HwVNRHjyBWl0OA4H2lnLcaiXwZ0It
	MUyVy/PMxDx5yCTRRwS3cTo/cKQlyXFPWKlqRW4U0Q15N05H7K1+Ew99acuunP3UqEGfKLE664K
	lPKfE/x55HDCh66sTDjr4w1K65AwWMgfO5VS0+GW0P+0ZAE=
X-Received: by 2002:a17:902:eccf:b0:2db:210f:c111 with SMTP id d9443c01a7336-2ddb1ab4ef6mr125516895ad.2.1789880301114;
        Sat, 19 Sep 2026 21:58:21 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:20 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:00 +1000
Subject: [PATCH 21/28] arm64: dts: apple: t8112-j413: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-21-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cMTjWQ2NYQrAfPSCsxwJy6m7qzo21To+mIsntW6H2OY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuP+DMftLnqRZtuGTlf3b/ValBqobdPzubNFVFO
 RcEp1/pmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPXWbYwMk/+Z3n3DFRUan37nVNuMtc4q8mc2s7MsW5H9P3H+FbdnWgx/xdtnmzw
 vucN5cprA1im5nl5GBpIXljl2/tp07eZyTZdgHgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215821_728990_DB39913C 
X-CRM114-Status: GOOD (  11.43  )
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
 arch/arm64/boot/dts/apple/t8112-j413.dts | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..38d0e33c701c 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,105 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweet";
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
+		compatible = "apple,j413-macaudio", "apple,macaudio";
+		model = "MacBook Air J413";
+
+		dai-link@0 {
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



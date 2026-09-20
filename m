Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C5C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=; b=fZweDb48SxpfQzP2xpOFMT+GK3
	FbdzMfmyXSkuX/Vu6/YwdHA54i5GuEJ3AkJMQihm2wJLG7W/hBw7bYr0taVWiquD1Ug+k3M0YJQU7
	fTIUv2JNYw/Uj+1ppq8fACCKnDj8X3Bvw22YyUBN45kkGey2+PtsKHJJNOiVRZSTEOZng2C9asJCx
	/YkmhXypJPwe1XJRQ2ZcZ/ufN2rmXv9YlX2UPGJISfk4CX5UBTukBryDLZMVl68UADmlwyi7yYuuJ
	doAMPKEOtcOgx2rcoxkZABniehCmgsoA+Lj3Ya88pyzZHRYbCUKQ/JVI4kNbUH7UjFbZ6YlM5bZTy
	bDH1+2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dK-0000000GuAK-40ii;
	Sun, 20 Sep 2026 04:58:34 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dH-0000000Gu82-2wKA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:33 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ee1f38so19500265ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880311; x=1790485111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=;
        b=XZFd5jpGnwVISVw1vtxOXpdhlo5d9M2OPR6b4UAy75+6Vn98rXCtQfksCejwHwxJt4
         8GA1qyVjJmp/U9zwZ017K14DFR1U+vIit+wzcJXk5GR77C1GTu+ZckfUJMPgByUjVD6T
         N65yCvBkmQt3JEex9i6fj4WHiXK6ZxVvJSTWADCPey91H/2L0Mt6bi4s53cjTxH1pRL9
         20Wl2sIxlkV2nT9Eg9n+NgoxKAg/jUyNXbRjvY3jEtJnykNR3bFFc4kwj40QIcWZwgCP
         r7Jd/4odMymRl8HMbMxhDgUm/eAayqsrRhuQF7ncyrZeO8kgw3swOJttORmeuMz8N0xA
         pqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880311; x=1790485111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=;
        b=t0Lb5oTUzUA8T7pyqVthTugfgl9MdGVWju+P3oM4o/Kw/g8tLeuvZ+wKIVOcKCSDIE
         q2JxnbgzNfseq9/LqLgvlt9Qr2vDbPb3z3NQRcjIi3dlvdafCNfo4csSiV1hyYn3BZDz
         wAVc9ThzebjXQzdeauDM3EvCANAkRn03d2/r65hqceqDzx9q8sKhVAt7r82W8M9cbFur
         QlEWT4eZQGwwUAy7nvdjx5hpYzx/F9p6lqTQ3NbnG1e11xN3C01Cu5saSL2FCZ4ex7S2
         46ZyGNUwA2qe/gU6RIh/s+C1Fyck/sim6cZkcZyYNhSw9m+KJOn3c8E2BsPwsjPtM9nm
         kISw==
X-Forwarded-Encrypted: i=1; AKwUvBwtVr6Vd8GKeYU3Xe87fnjpl5978+kuzbfgpDnqcMOxBblH5R6FYVzFqCJFiI2EMAIP5Pc2KkbIci5cdz7GeiFh@lists.infradead.org
X-Gm-Message-State: AFuF++neeyT9p0VKmigCxZGchQwe0TVQz7jmcIKgige/zQ51RMz3aGBn
	zS6c9z/UYYQjev8BeBx8nyQmxdfbktdkqPHDD2e9XLlmf1oIGyHYbJ0+
X-Gm-Gg: AYBFou28swKr2pdDWDGOh44jg08RpcS4u6b6bOoWG60LEfFezGGqOu56dzZ8AN3qrc4
	Ix45lVaHXWl5SkRaXuH7xi8fo06WBlojPviRjvXkJTo3mPktlm4PWxxUqF6jfQJy4/yy46FjDuI
	y9fnkeA0+PlvxW+iaT0e/6B1E6FpGq3nFRBAV3r0aW8M3fIDspQuk9R8ziobU11NjhhHVuH60PH
	nvIG0IJvFaYoH1y6mvyCJJPgufb0tk2C22EdajPXlFoIUZ1NocxZxX9AuFDYSpVoQMajTKAsIFp
	6XR5ib7J7TCKlhfRqrVGYG9mERiAoaJQwFp1JFymQjZ6ZChOjKYtNKI3F+ZkHpnmj6yuMnB8D1n
	m5LxBsLXWx3sGP+fLneVK1QGBKxecPfhqm1UFGPoAoQKKcGKZ+hQf89cvbrxSS1/mK7VWStnFDA
	aOCROv9mLGqej6jKCwuXJtSBqEiD0OYlsKFdZ0aIQYzsEh4apMcYK5wBVYJus4wC1jramllRamp
	l7Dyjjsd0urZ36opHOYv+kGxftJ9IyIBAKGWL7ZFqU/0N1DZA30KzMWVOdX1CgV0Vv0A7EqRUpY
	rEmgqRwHBM2R0Ncnu9awEBprPNjm3oq5aK+40d1IQgPPQ1c=
X-Received: by 2002:a17:902:ce0c:b0:2df:336b:9c2a with SMTP id d9443c01a7336-2df336b9c5bmr36073685ad.70.1789880311051;
        Sat, 19 Sep 2026 21:58:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:01 +1000
Subject: [PATCH 22/28] arm64: dts: apple: t8112-j415: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-22-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3974;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=35yLsTXZt5swGMfuhMDygKEChMzE5kiCXJnWEUcydSA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05WquSsFpwoUim+YWmBgy24j0P72fv6G5Q/nVsbZJ
 W/wZ17UMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOquNoafjJvYzyr9844pFNAM/iGur//4e1/lxXUnnHVSzdstmrwjGRmalJomLJf
 fYxJ7j81F7eX3p3b7nxjnnzqf2szswb5m5R5mAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215831_738154_89CB61F4 
X-CRM114-Status: GOOD (  11.34  )
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
 arch/arm64/boot/dts/apple/t8112-j415.dts | 125 +++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..5f245ef1c4bf 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,129 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
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
+
+	speaker_left_woof2: codec@3a {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
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
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
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
+		compatible = "apple,j415-macaudio", "apple,macaudio";
+		model = "MacBook Air J415";
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
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



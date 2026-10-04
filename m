Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F875CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=; b=RyZB+Q0KO5lMqQhyBlwheFAtes
	/R1oJAvWFRqxN0cVU72b2X/RZ8IVi4dZoXOEKl8s8EXKtp7EN09dgm+HUS1eKgRRSYgapu7ZY6yq9
	PLJ0ua7XhNe2cHVA968YqDZs3YaBeQ9ME+Pjl+PIKjgyM/9Qw+BLYGdNHLXuDm4Y5gys+dmT69mn7
	bHndbLl56cdWyZwcSKU60Dq9F0RK5ncfzsEVrS7JFTUzyk2slHqsMUPX0p/K2gF+HfwRsX12BN+h/
	gvgepRI9aAY9ELReGPfthLuz75C4rSeNCVtT1PMpNVYt6g891jUWXakMmXT/PqNArd1LbFuk1vnxR
	FfAUIZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMJ-0000000EODz-40rj;
	Sun, 04 Oct 2026 06:06:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMH-0000000EO8x-145z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-398a5aad413so404944a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093960; x=1791698760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=;
        b=ZGdllZa7beFgM3bxImGf+xONTbNqrWGq3cKpQknYJR011UccArRAS8eYOIZ33B7J73
         aCOViob0dsD39TyGgfCYjaP9GGIgYIKeGbXYe4JfSx5QvroMRaZgxNoXRXV9ldiYwiFI
         2Wajr/Q9hEhBUSRAF9MQhY5V8iDUpUhQdZnI3uVMiGJtD4G/Ee2VDAAfqoBalhy69536
         7rRdAcA9+L4AW1/wJcytoFISgYgmdAjCh+aT7wZAf5M6H96uVjGWE04LVVcMzGu9AX0C
         LuETpOztFpjzy3TZebyUTgCiea/rEHZrGtpxA+OsVKk7JMLSwbfHdfhZ8dgU0JOIS6rf
         lHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093960; x=1791698760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=;
        b=Vj9vRNMXI3OSUgOrXTXRvSd5asADTFojxnHNydLMJGbX5qtj5YcUijOmIvquDEbvDx
         ufTqQcijcYqVWUpboxkXfRSWouwrk2BmhjAVYSdmRiPoBvxLLq6zemod7mr1ZLikZ1Uo
         xNJdQXOzp8PS5meV1dqT4wqUgD/jSpZGv6JYRcfAhbxoOITzQzNpdbKHEz0mep25P591
         F91xHGGKZLifk1+sEsf4PPGaxfH+zoBYinwXvxImDRNyIWHWJLXzZbZ7Bdmz0b7zMCGF
         xV0OqIIrzdSORkJI8dv7B8em9bp/Sp6TBifwKwZbG00oXPbTeCZsbOesaVJMWigKinSh
         1Sng==
X-Forwarded-Encrypted: i=1; AKwUvBzyYxV46NXpeJojgYIu4IcI9cQEgVoF4FlFVRsFzsv++3qaU1FdnRUn27hh0mJsyYXgqYzD2Uh/apUKz1HsnMkg@lists.infradead.org
X-Gm-Message-State: AFq9FYK4eDQB0T5zbXduIvbnSI6RTgRK3TSj9dP9+ivZYQoXh8W6j7Lo
	nonUxpyMTNgLjqdtz7mA36VcwLzJszRl5vfPZ9yVHGmHFaISdyWuTytK
X-Gm-Gg: AYBFou3nM/vyE42CcF3LfoEDEF0g+x4mBgqXLCo8M0aDe58oHpLEYFcAhNHRu62Vm5n
	SesvEuk4mZOc87mLcMs4aq5tWxmeJmZu92uV7qaHq6E1KTtMvPEMQWk9wFHY9y9F8dQtk5EnT/v
	rEnGG4F5XeKVsFupgIZT4aLfDW9PuzU9DOnxjNPVRmAp5316TWEgq4MrDtpdBqmPJ3owClvoURY
	4bQZnf0NiLrIcc/6lR0A/BTHY2Fh4zf2tatrcH1Vs3/VEdm8X+46abCTVzIkD30KQ2ruOGbDANH
	tfPoah4cJE2L93VVNtFx1BrMA+YSJW/4siW5pkDsNRPMsFdlrT16sTnsQdyAZyKNN61Mf3USYpQ
	L2GGkhfjR53I4sXc3P8dz3vD8qCGnaH0xnuMkyEqNDbfO4/DiheTtR1x+PnFMbGyHHKjuInkusS
	aBkUOJ+MrDHJ8roiTYUeGWcz+vNcHLlM/QZ7vnJoRehcA8bHQgYyZFJBMxjVrFrfEM5ULxJCisP
	kRyibyhG7+sw7s/Zz94wBHfF++UeU/15Qc4ZGcxljArdtmrlkyNdvO0pTGJFb0w9Xf1ijdQTxLi
	J2iKI58t94mFQpg/8TRednbwj5hGA1CDe0SIYXC3zIU80ZI=
X-Received: by 2002:a17:90b:5345:b0:3a7:1339:c454 with SMTP id 98e67ed59e1d1-3a78750ccdamr3295837a91.47.1791093960302;
        Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:38 +1000
Subject: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mJddJwm7KZ1uNbWRbS6abM2+DhqXtUFRofNbxKEJICc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Ty8flGpH+8zah85ePzDT7f9z23WbqmeWefwPw0b
 e/0s5crOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9/iLDX+nXfjbNp7y3RS+TkE1IixG9Xb0+mrPL1rbCq7zroWmjG8P/GF2xxj6
 2/x8j8oJjHA7z5xTVMWwJWZyd5fDw08aS6hJmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230601_309154_530AC220 
X-CRM114-Status: GOOD (  10.50  )
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

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 82 +++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..cdda63ca8b34 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,86 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
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
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64488C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=; b=ho8rcJCbFG6DsTAuMKJ4sUMUr1
	vQPR7gHnh4bqm/k3xZTWO/ieKVQZUzT0FpQ692y59vN33Z7fRukyR1vZN7b1Mzaoht0bb7JAuTGEN
	6zdwls7R6Di0dR4KlemzfZlMYdo2PHksu/GOD5+y0Bdzl/oOy27SfH+uTe5OFPKlqx3gxfALabzv4
	rVeQ9o7BHvCVdgKzll2GIAr9NKqOur6bK9W5tnqIRT7dJtQw87FaMfQLYyIVGB9j//9SGEhQAijJw
	cOvP+CZC7+LVRNqAROG2Hk7QAYpVjbrGn+ktgpHR1yhuGldznbU6GATtgs4cRZo/O2bnAXjYHBqQl
	xvdwj5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cj-0000000Gtiv-3sIu;
	Sun, 20 Sep 2026 04:57:57 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89ch-0000000GtgZ-00jb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:57 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747eb79f6so12414555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880274; x=1790485074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=mArTD/fBCyPX6KzOF3mMPxf08Yi+Dp+tj4EDIRlDt1T2Rv1oqt9D0IffdmI1y4/zNH
         SvYXgeGZzZ/Yq88AzB7JIRTEmT9K7W0cNEaj0qgR3C7YwtWGcv/NClzy+jJ9ASFi3ZVb
         m/4SYdj1bK1Zs/DfaTPatPkcPyGgnvcMZtwvut84sAmwQo/Hr80T6/wft11CXTRTKxoZ
         hLTHEyLX2GXfrKUBfe6yaUBkWRRqTRVxWfHn7Eoen2MnhvTSL7Gv41BEvQsilFg3UzzA
         aK0+GrI8cAMJBGojxensKlem665ZAi7GaVG9eWfmTr6wCfskdXWIQgsyKa5ADVKjWdZx
         psDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880274; x=1790485074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=YTnZiCEk7GQ5ntISx0DRdhVhIIZ6mfSwUP3EYAx2jO4dxF0lcqqvI40ff6Y1zM2VC1
         L6fRH+Co0fGkR5p632k5BCnju0FBiifYQF821o27ghzVKvGdVU2Z4Luv8YzKSM8Hs5yn
         cdQ8WoRHYG2MzMfQYnen/W5wctg3dulSX3tgOc+ksBUy3tNaEZtLtyxyQBe2PDHO/ZdX
         RYG+R5mvOk63vkCHje7HJ2Upfxvv2ddjV8f7CUuA2Soapw2uCv/xYSSKzXrgt68a8mcg
         pYemmLbmK/HUw1KFej9E5qrBsWid++9ZEOYPH4WxrfwVHxx28tg4zrD3amuYTXoNgyVs
         +Qeg==
X-Forwarded-Encrypted: i=1; AKwUvBxm1ZD6BvfO1MxJwOTNyf0Dk+zU8gKPIF2OiOLWUT4PyVVfDi96aVKLvcwwHRz+C4FusBvPEt4W6KUnLSvGgeCf@lists.infradead.org
X-Gm-Message-State: AFuF++kqhZkhtmf0QK3wqt/ctvd3HuskgYiJ5Ev0x8A8LqBi1RcQ5otr
	f6Jp0AjOZfqQ6lHjvcXBedRAe+yOeYtnDOvxa9LgwREpKfLA2dn1tLG9
X-Gm-Gg: AYBFou0eq92J/4X8Nbh2f3CZARPWnrnfIf7RFMo+8ysBlPyzTEockzXDu6JTyF/hM8x
	0hc5SInsoQXdXz5WZIl7/JIER4jdLKHhX7CYd0CL/+CjuNFnV1OejjTos3iYCIyDdeWnb6RPoeG
	qvP89jWoFVp16OdXTgz09tTHQZtkgsWsLcWwpCOm5bbHQ7tcbzbdVjSeobHEaX8FrMMu30PI/QC
	qR7bQ/6YQxCBvDMExiM5JJYc2LXE1Uax3rcz3KgJRUpAI/LcpMD4JL1KP3nH4sQrHtnB+L1l/q0
	0z6NdCergTJhHzajuK8kjLYCCIrTVss8iDzW1KiZkyLnYau+Rz1qHLS6AGGH7RUXyBUNnLIqoxZ
	mvclc5xCFtMmDsKDIHwgwrP6WnPOGcNAqemRnLyXiYX2DeIokPNl0FSw0gGFsQKSYt97QSb74LZ
	KV8t468a5sprZdn05dI2nZY0vyF1yLtyOeAmk09gsRwEKh0w5Rqdh1TbWWus2s9dFyUyBDsSttm
	68T9wOudZQLIJrXKHzE4w9IuJQm4OFpAPNVsnxGVflaA3jkkgwo7bOyYfpX3GSWo/GtkcHDIVxF
	oEoQDAFl5Wi8ZlctCi+AFRT8+tsaaVd7iLScNfz8GPxHmtA=
X-Received: by 2002:a17:903:1a0f:b0:2dd:c053:82ef with SMTP id d9443c01a7336-2ddc0538401mr56050135ad.38.1789880274403;
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:57 +1000
Subject: [PATCH 18/28] arm64: dts: apple: t8103-j313: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-18-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=R5y0xujUvUXkSP7Xsswza01bR/jBq8AIplidrHgUeyE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWb21c66G3M4JvHv35y8tKklc9PTDVZ/u9cp9Se1
 TM7LBnEOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPNLMTIMOnKCZnG5Qc/2M6KzS1409PptySZccGOP+mzG6/GRCytbmVk2J6X9P9
 4R3Mos7D4tdcO8pv3FzRPULvT+sC76gqvaqwXEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215755_194207_400E0E21 
X-CRM114-Status: GOOD (  11.04  )
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
 arch/arm64/boot/dts/apple/t8103-j313.dts | 75 +++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..514dd56bc9f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,79 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+		compatible = "apple,j313-macaudio", "apple,macaudio";
+		model = "MacBook Air J313";
+
+		dai-link@0 {
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



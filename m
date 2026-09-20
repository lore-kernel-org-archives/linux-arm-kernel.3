Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED5FC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wNW58H2E9LvctZSyWkCkKi9IlEj3updz7FkHJDkZcU=; b=U7sXsbBrEVU33ORabVWFH/NGk1
	r0E558A4PjEnoPJoNQkFxIdRJzGRzY4EtQpiaBQNWuglo+cXUp79C3dL6MilCPNECPvXank1YNEOM
	X3vtBlnwIvpAlyB9eAxZWTxbDGpaS4D3OjpHH4TY0pig0SusUaTpQ5M/Gy++G5ZnSUTuO7J3f/XRX
	KcuB6vP2dNPPEDsm/mc8aKSSe4mgsHHzwoZaQbDJdsS1gj94wK+7rN4J1QpJKazI/XIOKlDPT6pDH
	dmg/92LzTZyyTdXhyk8OpfAijHcRSgQ0WKFguhoEc3VNA5VshYllNGQGrjTWnzqJWKb2gGS6J4ltd
	NojeocSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89e3-0000000Guhx-1xnV;
	Sun, 20 Sep 2026 04:59:19 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89e0-0000000Guft-3Dhw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:59:18 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d9004a1ac0so12574465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880356; x=1790485156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wNW58H2E9LvctZSyWkCkKi9IlEj3updz7FkHJDkZcU=;
        b=KyUeR9MkM4lNzw6Smea+EKe0hcYTORKKE/qmenxAyZrFesqcUoo6wARD7vGws+mIh5
         wBeDDNDsfmjLizbPqk/VblSTlmAlexmCx9eqfeNLFK6YdAP1f5VVGYH3GFL0mXLH24uh
         R+TFyfLRZiAhXaPYQviDGp5tmCpePv+N54s3Id18qTl5FPoZbj0YepKz+inBxMzRsgJQ
         WAUvMCxH7Hwv7ZgktmxR1r+XI5QGT0yW4Gj6XU0R5565MGOXXRjRLQ5BcbQrVQv40bis
         8s5GxSiNDTWW1l8kJbsgrjB1l3fZJfkuLv5o/bCZQyGmEvoTPeNz4weaCe7vSO+w/wD9
         8+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880356; x=1790485156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wNW58H2E9LvctZSyWkCkKi9IlEj3updz7FkHJDkZcU=;
        b=NCZg+bpY0lENal3tufCjpVperLwlr0dvExnPFPwrh73BL4kpycIahwXPQYftIXqMi7
         LkL2UO7y78/cwGAVsfnus61BUupuJ/5JGUodDKffm0Ya5FqiGPDnke8uG+nxU11pE1Hg
         L8JjxGtC/POpfr+kLyc6evv6kbNFs7gzTBUbfRU334BQHE4hF1NTsrUKriBmX/zjJuXS
         xVILEAO9ruHcudvjFmHtaqpJn7CE7vVAhy5/yerLibgNzkhmavcvlqSJ8p4Qmsjqa2BM
         DeFkjFYW8a8gns5S+JFVgfhb8SiJi8IiaLeDcyj/NoKgkQROXiNVXqg0jI2gle4w4JQM
         ebCA==
X-Forwarded-Encrypted: i=1; AKwUvBy3lXwDNF27Ev5J+GOZdPACMbfiTeuJq1m/0VjCoHrE83c23hNarYzWdvQ6ZYx63/hrFVKghDU2MpIFIrGcdIly@lists.infradead.org
X-Gm-Message-State: AFuF++lPdHFMh6R8hU5FKgZW8DgL9ykuQosYcRhUl2nvs/odSzlTbNNV
	hle2myiRvHPoIL5gfkOdzel3wYxnz1NYFtS20IDIbchyIXnPnHYapyPm
X-Gm-Gg: AYBFou2oRLryUVItJT+dUVvz1aKowcqK3SOGye6LAk7wnTGPyYllxBZZoi0N1zRNNgL
	Nl1H5f+hdRDQhvZkdMe9oDhF8L+ZROqKKNT4QQCkm4p0cjaI1+LX9vlyZn9POOYeu3pjz5s/AZ8
	bP9CVwv4d0qPSZgRzKgsXJit72SSzVXx1E6dxz7zvCAdSwTHhsVQtmG4+UNHQvb34y7aosGEAi3
	h9ajEM1uh2khgRinIpwkkn8YIHq68PX4B4bj0OJAZJMA6MelSfX1d8EnJxQH9ti5AG4kZv8K4q3
	GbyOUTLiHh9BRjWluI7br2H5HHNDNUDq0jeFmug7lCKlLCF2pG2KGEqJjEjq6c9Zshun9q8V6K2
	/vwroRy/DYsCJsKp1GhIsWxErpS883VCDITu9bJkhV5QTAXUO/ZR7jWKYrW0v0RXVe21l+51tfo
	HjLZw/2C54E3BVGEGEHtLAP2xVmoX4q2CUqh5ujlpzgOlNW3xvnCl47pqKqgj6gGeRg5kC5TJw7
	+o12uAN016WtuG0CrciX1b1Ip2+BOur1JQH2HHeoUxNG4bS/uXqn4gM0QWjqlIjxI2lxIUIpCEc
	+z0kgtFOTI48gl/Ku1uH4sCLtJgNEHF8M4RVEHgVuW8xjtU=
X-Received: by 2002:a17:902:e549:b0:2dd:c1a0:c7e0 with SMTP id d9443c01a7336-2ddc1a0c90emr52143865ad.15.1789880356108;
        Sat, 19 Sep 2026 21:59:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:06 +1000
Subject: [PATCH 27/28] arm64: dts: apple: t602x-j41x: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-27-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3776;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QYtiLlOA1qm5LKu0Z+66im/X8d3VR2WwNILFXW4q0n8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05XPTGNt3/WoMq6/4MYqMYPpp/m36vq7eT2aWFHVs
 GL60dczOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOt58/IsD4s4cR7/Wj2Vz4BV5SmBH5fkXHibatD78cr9h5NuU+l+Rj+ytw/sUX
 9/FmD7bVn4sSZ/P5WvdeS5Pp+0+dSuOPprgnvOQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215916_822415_68B794DC 
X-CRM114-Status: GOOD (  10.82  )
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

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j414s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6020-j416s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j414c.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j416c.dts |  5 ++++
 .../boot/dts/apple/t602x-j414-j416.dtsi  | 35 +++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..b42750fc9404 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..98caa29e3bdd 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..b945b75e518c 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0d4a7ef7dcac 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.55.0



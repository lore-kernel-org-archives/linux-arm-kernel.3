Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C32CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=; b=VFkK2zTxqyooVctG5qy3mh2oIT
	hOaJV2AycS37Q7+kh62OCb2/CXcPzaBStFeFGZ5N0/oRB2sJRLDY3yzXs1HA1Yf6GR3TPt3oFrhoJ
	XZ072Fr7+t6g+6peu/QE1EILgJvBGNQ4HznojgymjX+DH7DTkbh+9++OtjhpN4czce/Im3PQZeTy9
	jwaSTi4uBcxJcJWdDcTW5GROQBJBZVvi6JSDzbdyI2uO+zwCa+sQkv/WqqDq8v4I/xPHiwF1qGjJK
	d1YL1Tnz2hgniyz9482Tb+AcJ0a/xF3ERzTcXJgcZWT1ChKLTxzkf8HfhlPKMUykWDco/DY454UFS
	F9lB2OIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMf-0000000EOYH-14lZ;
	Sun, 04 Oct 2026 06:06:25 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMW-0000000EOQY-1hVS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:21 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso274027a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093975; x=1791698775; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=;
        b=eEIqDS9eRsgTt8+ISdX2iJFV4Ot6+TkWEFzQyNPe2mnlJrOzhFRW72ug6q1pQolgti
         5gSPWMOPVhUjZ9xS25yZjJhduavafzAi+jVUAaPXP8jfLlIXbyN6/L0zuZDG+Q4LXUen
         ReMkiU0MlnJbmO9Yp2HcTdVgxUKQPoxY5i7aQKS9wkwf2mF+ddpnbAv4vOz2OhmX6ivw
         fETocdFaBL6N9W85h1EWAnA/WJtdy17eEcZojRR5+M36+aHq+BTTxdNXLHMq0j/4crRk
         vRDmiT25v/7VSa+FMxkuxMf/504tvS8PJOO0xKfH6SIH8p803rZqHSMGKzwgB4rK5bQd
         7ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093975; x=1791698775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=;
        b=B4fffP6C1/0t8hYPl0IfeRCXaQoIYP503lv66UvaUlM07lcpW3TKIg9i4ujd4aCrfk
         hWpiO/IwAA6ElFCMsMKgn9ngQs0W8QlW/Cv1hlg4Brza9YzIEGwHiM9vbI7gu+AwlSma
         QJjgDg24xvFVlEd2HZ+EpaAadmOEcPkpfdYucaD0r+XabStyAg6gk5PLB7AlpoKz6Qk3
         x9vZ4p7QuG5AXcr7bFlUZc6ybdhUEaxJMHz9WAI17khQm9cjr3rusgKrLfTPEkfrDypd
         u1PDKodPIVwghFXwW266p1gaQVHg4q8MdfNbZAyZf4P9r69m+EFCljEbALBHG+D9asL6
         wurg==
X-Forwarded-Encrypted: i=1; AKwUvBwXsg9W1wUgJ+JIblsdqxBE0QZCn2iMLNMB8KLUsAk+QpcnHkTYL7PgJr2t1PA4GTR9Oj1rJ1VjXulLhdp/ADMS@lists.infradead.org
X-Gm-Message-State: AFq9FYLhd1df/X/p1Q6ISocoadISXdesH0TwOSxYJmENoeLCRgEYTtNM
	nuny0pwlkuhAJtvsUbfHqtWvs+WzFoivSXMh9tI9MnVNujTt8PFks1ok
X-Gm-Gg: AYBFou1FiXkSyowqkrF/k/Vy/8/pZpt56lkDLYgP+o407hXnR3y53ioP4TXEk8VEv8s
	zBZ0tBZDoncYtVhnl99NgHJCGYKayj1yuxBL4CBuEHB9uasi7v+75CsmepN99+FjBL7rvOYASn8
	rDlKU6Bgfd04kTtzGM+coKzcyz7ynf3fkWUC33asbG8OIkIWCqRytS+C5xlKxDbadFDw4CjLo/I
	nJkQwgo+2rYR8nvLquT8cFKd1Eqx4TwD0P3keax79vDraXbXjhP17RM7IGwteYUqHZPj5+K0t5d
	EUOfXHvWZRDqCv91Y1sBFMtzxyJPnGgr6uzEMSqHKzvI5LrwcjOXgoEmKwJGP4SMf8NeO2qKNFL
	NvVtmfK7t/dKod2JtZ9+b3NOxospETbk7Ny1aLhfoQtMGNScmPcXn9Gck8XeRUmL4pqRrg0Wlow
	d9C+/cTGM5O7OUEvWThiuA6/htC9yROzsmiFEwMxVEVHoneRQMRr04XIK5sp4TELHCETkw4WqAp
	eoiQF2HhW+HHIwE3BdVOIYAFXfNE+apZdj20Jvwyvkgv5hoCJnO0zYh0l/wbuBEkWUe/m1Imgup
	F+7DLKchh7p+gdtPc/Re/6XZ4+cWohbdRfdThSjnG2lcecY=
X-Received: by 2002:a17:90b:17ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3a70ef41b96mr1617600a91.2.1791093975353;
        Sat, 03 Oct 2026 23:06:15 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:40 +1000
Subject: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xSEWuiivvLImBm73BetJSsdcZ+ZyPP0PeM5RNvPqaaw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Q5LFjL3RtSMiU/o6jw7r5DE+WVkp1unFFRPeVzz
 tbsxi7FjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSLRjEy/P6odGs570MmjXX1dZrfd/o9K659JXrLfrv0x2mTor4trWb4p9l83uF
 9lXVt+ubJZZkaTmalMmuOTnc/9ipA8vL/3a+YuQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230616_447017_12643593 
X-CRM114-Status: GOOD (  11.68  )
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

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..1fc74ebf9ab2 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,41 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
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
+/ {
+	sound: sound {
+		compatible = "apple,j456-macaudio";
+		model = "iMac J456";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..d8ea6bb53b3f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
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
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio";
+		model = "iMac J457";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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

-- 
2.55.0



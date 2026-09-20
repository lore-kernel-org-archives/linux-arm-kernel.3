Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FDDC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=; b=URqijBK6u80kiG9/AzvFL7r4xg
	smAsVL05AMLMiIq7AYBDZ+17N9reC6D1ehkt171lsB8pLS0vyiMeB5ML/aWNXEpLPyfB9TIdCub4m
	D6ZAuz83BzsExLLkTTnC6k3NkBfkF95HvYiOeUuo5Xa3oiybQ85LB00EdIVqtMs/UeQknGmkDmEth
	9o4jcEJ3rcoNsbA4RdFfntkQLs3mzNx53xAyvhMR/Sstt1rB2r2hLxi36FF5ib+dP8AGiPUqd2Uqj
	wUdbuh1A30uQvpzSrYjbnUTMqERRaI1TX/S/vSPIWXH8Vg0yi7o2wXJL0k0lyWPO/w1OoQJScCWvm
	Kn3DOZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89eC-0000000GupF-3Xj0;
	Sun, 20 Sep 2026 04:59:28 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89e9-0000000GumY-2RKE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:59:26 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f05ffcso15050655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880365; x=1790485165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=;
        b=eJSQBw36+C2IBBncb2FDNUnQWhK3nSf0cIPcXbxssbU8WTdPS9cxEMe7gam8YHa13u
         WzVz8myVyDXHAwJgL4PbCPXZpQ5JgUzIRwdNco89mc09E4hA+ndf5JfK4a4CEoZ9KcNw
         mj8tlJ6bNhGE8VGl1cmHBjBGlaB83J+4G+TwFhAAcSqhZ+vs1UuP46++fV8oKZPDpbjl
         Fsv7i1CRxYiO19RpDShf7ijZpuILjZuVBPo+nJaN1CjjUkSQ6RrFChlJSeoakE0SbNi0
         1I0SGsOHbeSzQF/eCL3Yqq5gwlVz8JvUSRBSfHLRlk3KIQk1diHlLuWomIEiw/xRXE/I
         gAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880365; x=1790485165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=;
        b=rRSFNs42Ahl5dAhzTspgraQMKfXyfb1suGXZM9h3gBsynx9ZXKDHxnXDLdwvlCZIlw
         CZTSQs2IxUkjDT03yBrKz2cJDn6aMxajk47J4qzXm+Z2Urtsjuh0oHuC7Qd7q9TU8eQJ
         DJJjhRBn3EXeOTK5WGhRX/2l9KsD/rUSwBkdroZD4wyGeyhgFGaqh017U4zaKvVfPR5C
         p+4xuNUUP1n+PofFRbat8+91keqUWDu7m6xbfnGGyVxBv1W0CfxsgXfyXF9QCHprdI1F
         7jL4Cxqm6sK4TXvOpXJ9CHuUCF3sJcN+qSqSCdBg31F2LvVHTW6PwDDpQmMxPzj2fruO
         QweQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvxdCK5kdWhDRIjPrZmizVCLoSs+1RQurfh0Lj4UzMwcUnJmnOAPYXJOGM6FW9IxbHwXzB0AyP7AtFmyTaEpiX@lists.infradead.org
X-Gm-Message-State: AFuF++n52TsplaANHMtqJmSuuLbX00pcY/1JV1QfACZw8AmwQ7y2Eu+o
	4JR9r6mDXlDCX1dg5UaxeRb2NnK55yUNn0kplg4gKHtgIJVHYvGUe7yu
X-Gm-Gg: AYBFou0WBFlpNhDxPCe/RsWr+JBtOnsPXPDfz9XozyDruDNsqUTmVMvxF07oMtU/ny6
	TdYa/BuYVgP4sHeEwevosHC3s7T6ZobMTyxvn/Mbl0/JZfsVIsfDEmsOI4SiAF9IPRgVrRNV0PI
	88qs83/o8UTdom1EPoTq2svAJjEcw4JF2SnqMZlXDJXxE4xFP0LOEKkgLwKCJsXjcz/cRmX8Kn7
	LzDVFgOi5oyTsfpQfTAk9tbOil7ko6c1hsuS9oF+OAd6W7f+02oKYQM984oiqCS6dimx/8RNw8a
	S/X23JUl4poGY7vCaeHUXyXTbwMfu87pyym5qmocAm/h3cgzwfCO+AbWJrFRpBD1U4uhRnu7px7
	4+EkZQ44+tbmZ66IX03St6qRiasUZpKCnjG8TCM9vakEmN3SkYon5LCfEBa/FV1qHK7ZXmxceGT
	5IIoruN8h9mA0DqDFtKURfa6MfXBsJ/eVOvMSBkA/cLwFF8HX+791LvSv++OZNIdqvloi6tG79E
	Lttzm0T89DbWaZ0K3TyCbBSuaQAyjj1+QgbcyLyv83+ztEFIz8iL66BARO7cMta9gZAFXWnmqmw
	guCVPjVkdP2tHsx9F2saqReKmkcdwpM5ga0DPoDfH2zqhNM=
X-Received: by 2002:a17:902:d4cb:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2ddc053e14amr57727015ad.38.1789880364897;
        Sat, 19 Sep 2026 21:59:24 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:07 +1000
Subject: [PATCH 28/28] arm64: dts: apple: t602x-j47x: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-28-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2560;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=wZ33HmVJ/5Act5G23FfyEoldMO69+O+FCZBZLHA6YUE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VFbxtZ2sxO6rz5yvjZ5FtlffdnP/XfybTQ3vFf9
 vQgWa01HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlebcbIsNF/880JArN/VbEXGrKU3y9d/+feZy3e5XYinUf3PvpbEcvwv3o111H
 9zCXse1hj/pyY9fsPb83NyDkbHzH1O+07w70vhgkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215925_654991_E2D0CEA6 
X-CRM114-Status: GOOD (  11.48  )
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

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..e79315b15f11 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio", "apple,macaudio";
+	model = "Mac Studio J473";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..8aecd23e0ac3 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..91ba7c1d2612 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
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



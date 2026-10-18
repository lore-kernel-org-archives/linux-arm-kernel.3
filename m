Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D89CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=; b=HyzntgqMnWeVqj2ptAB2QDFuaj
	2cxYmz7nNdx/I/QF37Dcptf9VRH4WFxnU7BGtSInxJFzMlo5pKZWQd+pOcU+5Vv2pXeP2wXUCoGDT
	/TDS0IoJlvWUGgmlqV4YaIj840Fl2Wj+x8DoZ85EFT35mYxEuSC1Bgz84k0SrJYsnyNcevGKhCxKU
	AWH7WMfjOckA1tQOR3ka+fs6XZvThJbxK/quo/mVBWgF9nxfpkYhWpmfV1ExPP7+2O1rG8VEZ4j69
	ag8IFIAY4AA1HgAmZhF1D7dJp+myj2EgpsIUdishBPoClWw9VaVYpAOIYsTRB7NzUAk+PVzpOm++3
	xEevmjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtz-00000005bIe-3npq;
	Sun, 18 Oct 2026 05:57:47 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtx-00000005bG5-0yYO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so891621a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303064; x=1792907864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=;
        b=ajRq5Zql6TgtJ43d1yjWWr8CIw+uINoBlmd4oJntWtww8QWVM9sueuqmHosdf+cBYO
         3x7uZ0yWzbozFXihSFxIDsp6gNE1NKVFzc9NHrkzpeLQnhpCNPSfsjJhtv3vzXNKz+WZ
         x0JixwubKSNk74pbCDuGoxP734wBmS2fEpxjKmL1hL5S4TM2a7AuI/VYa2V6R3PByXRy
         MtZhrdmBlABPwqQlyDlanEtZDng82HK3MbIA2knUJKpHFIMubT0/8W/6CHBUoSmi85ez
         ImIod4egv5ziBLc9V91VwGcVg5cM0o3K92mw7dmI34R4TvEM5fhr9zOlO0srLuVJr4vY
         NG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303064; x=1792907864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=;
        b=YlMt6nTQa37T/QG6ITbEzUh3V0BdA7INbChG8do00EqZPFaSBysz7Tnu1Wqmdaq/to
         EuTJcGUGsaX39hHQursg5Sas5iXrFCM67IK+DyLBjCk89S4z2UjeEk/wTS3B/NCNFFuM
         HSY/eyQtqCbK1Jmd2EcIoyq6FoVtUf5gp0OITmY9aZiaX/k+fzhm4M7Z7O4dKOy7bulR
         RtZtGG6lqA3D6+ppSCP+jRDiwjpfJ11/Vl8qKSe9Mef7qhl2dQ1AK+5NTzblDtb8H60/
         l5X7GTCP2TYABY5/Kl1EFHYn/bIUL7Fj6B/nRnfZURseI1UTa0bIJS+0sPh9jUjqQuVH
         YfaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuni/5xzSO8nmFSfdrrjZPT3vuerdER6HR5ZVrthqGTt+jwVTfKDYv2OSE+px4Bz5IundVsww3DNAYMW33Kpt0@lists.infradead.org
X-Gm-Message-State: AFq9FYKKL0VuqhvPaRg84oQbNhi3TMi5/fSrFXGU0yzoQWituRwnuye8
	QmZjgJu007nGBdUqhpFDoSHj4QEYbPK+qxokJonklEGMm63RyrjvhuUQ
X-Gm-Gg: AYBFou3TjgvFh9NBMA0mL+guXf0YrZXWsf+/jb6Qo+39dfiZ9NaQG+QRsM54WOaxh6q
	5FnUdzv5q2BSSpBNic8CdD+Th4piik69g8sy2kUUhfhkGh8/CJEBJaK5sKA1qaVLGpgkDwm090i
	I8Y+/hWoqc763dHkr96iQsm1fuHIFiUwFmQtYd8jVJyWknbzxcMbbveKk9iVmnFkCjc7XAHgVQQ
	7reYNW+/ybZhYdkkiEPsMDbBa/DRkZXuxoaHTMJTeZYdxNPDuL/gm8wl5XnQkpQ97a4hBKbkhmw
	VGgOj4N7wL/tHvLKu1M7x8itWH0bhm1dkFjyZADcwu2QqwdidRPdTgLWY9EfIHP18c5AXIDX/Y/
	p3aB9HalrXbEFD/5KKkpwRxYhjVKtT/2j1km59K1y7cwBI66PWQr6q5nx3XEs6sdGPKmNhjhV4n
	G9qGGJJfeLkK9RNKSUDefvkqCwDRdw+9M+FkioTLsmOqbz1mMIFW364vnZlgE1pQRX+Rsl7bjbm
	DjItuzVJKgi02+4lJ3v8fnfprPkbFibaAfbfosbcDUFeAQzFNgW7gszUQKSo0Ptsndgvyz0bxx3
	Cne06RxBIqodGjZR7Dq/LyRyM4nj6cvkHkqcaGWOdvaPqg==
X-Received: by 2002:a17:90b:1d4d:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3acef5f0687mr3345724a91.64.1792303064515;
        Sat, 17 Oct 2026 22:57:44 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:14 +1000
Subject: [PATCH v3 20/21] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-20-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=4umqbHnPcmDvTKDGGgoaHBxvCxbbxjsr11wiU95vPB0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vl8PtYHuD+eEiw6QW/zjcuLwwLOnjK6MtFAdca+J
 OFmLv0bHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKl+ocfwP2qvi6NfdVpUzax1+SV/rKyM/zzf3fDra8ud4yf895leMWP4Z9/W3rb
 3QsqbCfUhy1efkTi6uDKdv+Rc04NNLtdCO2LkGQE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225745_487064_7D1F8BCC 
X-CRM114-Status: GOOD (  10.01  )
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
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
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
2.56.0



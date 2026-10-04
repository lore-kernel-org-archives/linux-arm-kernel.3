Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F336CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=; b=AjLErVuca87BV2vEuG+d10TZb+
	ppmNgS40UME2AwphuTeHHfCTh48VVlxWIE9B3SAT45YYg7EBzWAwCiQEhFaZ/BiILoDYII2l3shCk
	CmH2KmUiccpJsxglWk5uJE7Jaf52j0bI7p6zoAWy1rrWYcwd8FdMUZwinBCwFPOklK4JiO5mwTH+W
	3uKAKjKp2mX4oxJEr0E+VTouDtOVt02NLnB0wnuwhSu1jHTvLMswJ1MK4QqJ4F3nNtIV2Z0jsBM6s
	CPUqJYnV75PtYNWODG0hxdjO7kw53XM0w8dapTDjnVzxpab4yI+BOieQz4MXR0AAl3qEGIML60onl
	h7iEU4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFNV-0000000EPOI-0ily;
	Sun, 04 Oct 2026 06:07:17 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFNN-0000000EPI4-0GLN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:07:15 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so220812a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094028; x=1791698828; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=;
        b=dX91T00jyjfZS0T32vUIDB+TTEYiEwoXp0xdNcxrSbmAQOWAW31v84JBmGi2bdPJFV
         k46ThcEM4locd1y+OJ4xsNdH5TWtrNNLKuOXz0E0KWrni1O5rNjDIzRhyCML9rHEUv7u
         KU0v2EYdzrODPdcArm57Fr7y16L95oyb3F6oTqKeKKVlGukODL3sxX3xd74anFncWP89
         D5KFrM/0reppP56KzUeLCyAQ+uLpVKSdeI0Zdt6Se3XKleT+I+1uPww9QlBSQxdkvtCp
         muIXecCuvSUzGbybATYy1ghTplupJP5Ix0/UMqVPbkpHWO7FydAR55Ab2gwiKvFoOqvs
         cBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094028; x=1791698828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=;
        b=liYtlO7Mo4/UdSbD7sxXcsrjTEvWAp/LXtyLoaUwDPiSw4I6JZ7Quy7Np9NykbS3Ru
         lhlgnSYTHCcbm4ky+JK8WSRXVxY+KC67XNt8bo5cVCdDCoIfHxaD9927OZw8QaO9nj4j
         Y2kuWKlMk9pVHgdcu6WVxLtwLTdLZ/ooQHU0lPF3FR9X1WVB1MXSy32RvGrhQZvsfnOR
         h8m77ynEuO9Yy8PNWMPGMfQS1BrIfykoXR3noQUnG1/PU2k8gTPmY47BlyvR9BQbsXkj
         wIGSnExTdSfmXJI7AiWURzhfGzT8BDhyX8ijFQDUNHPs21XIjvzqrQme4Mj6IkQHi7HB
         vS8A==
X-Forwarded-Encrypted: i=1; AKwUvBxfeGHiqR8g2u8MFiBmtFWwJL+/4wyD3Nwx8UgMELQQdoOYxxPw0a3z8WSfhSPtOp3CHYd68PsIf4NE2VS2eRn3@lists.infradead.org
X-Gm-Message-State: AFq9FYIjBeqMml4dx0eY23eybYmlxCKUSRn1ypAIQgJLaerCnAoWeCEd
	QBlcXgaZ+ploGALVCKO/u0huA/EeL/UFTxNmiSQGICWLMUizQa/Wq9PH
X-Gm-Gg: AYBFou0Pr3Fte/9V/VzDlwAoQZqopRciACqAtBrg21H3i+R/fhz9Vawm0A6dt/9YmSU
	EFkuxKWARRwkrsax8JPI1Pt/EF7FG4+/npjuqR+dqa/FwNWP2+YCRZS5RmQS7CJJkpkwRslHgKC
	Vs9iubLTBs7r/M3ZcXQKKR3Is91dxplz11u6CwVNW/Bfs0ux9fKPhih6bLalXNX45w30L0vf9aa
	CdBbJB/Nbzw8gtvxpIYD7JpIuh6KB7gLqSaBIEc1QpeiRIBxh8Cwg95heuwuhorOk/SHgtsstq1
	53Iar3Q5QQYru1voT3D+WFCKtIbml+hbiVM8B7FJNhZTbVIlPBaWRApkIIoPU2qBRMaDaB+kfLA
	8QMqq/ukCM6Q+agzjO6bTnRM2PQntEWtHcjKzrGxMvuhnRSQyuR4/kLAdagFPgRz7pGVhV7clqg
	nyJOs5MICs2xFHsP5WX/AwjXZUFWRoJohPZvzV+1cVX93Z9VBova2JTV4oQfI3EFBJVCwZ/csEe
	c9lY1tyC5eunhXgTSnjH3N9nLRm+227/e/qzzODbDFWjt1s2B7Rs2Xpcw1d/5Z9rjp2+AlO6y6r
	DsohKooztv85ndBe6gSHlXl9N0OsjtFIPiUOEd1hbBvR9VE=
X-Received: by 2002:a17:90a:dfd0:b0:3a4:bc68:310e with SMTP id 98e67ed59e1d1-3a6ce7f684amr5172343a91.39.1791094028414;
        Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:47 +1000
Subject: [PATCH v2 20/21] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-20-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gcEmnx4AWZiPV2AjRp0zlkie8hCkMFmgpjBnY4FNmw4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RHeG2cdUNOvI+5MOZVKn+MVrvVx4OTZhY9W+sw1
 zhwynKjjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQfX8fIcNHTODT83Aq+rLku32+9V2lzY+za66QQt6UuLm12cvnh9YwMHR3d36K
 upVVnf9232mbCnOgoM5NJFSfvCcT+3bzyZFQcCwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230709_117571_957A231F 
X-CRM114-Status: GOOD (  10.06  )
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
2.55.0



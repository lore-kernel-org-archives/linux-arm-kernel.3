Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2654C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=; b=C02MeFJUcHH6HyX3tfAk/hpDQC
	ZyOVam2/SPIB+mAwXQkrdMWpiLbXYGWBuerenUTGU4dupJrAkDRZlxz+MNe9lrGuQ2YIHGV+Z/liR
	/B1d37GhKNmKIoccFkjTnHryYFB4vwLjBVki4Z4OA+8ejy32MglR1qsVf1vHI6n3l8OocRVMft9AX
	mFUZekFkFySHcdbtHv7j4ey1DqhlyxczwzSP6tyi1mjA1rSYJEbUkiz9HDdJ+rthXtFotQBTwF/HW
	PKSuKssg1u+7HCWbIY6sPKRnRsiBRE1l63LeHPqF1VtBmXXI6rvrIVqTWI84b9q+RA0BZansfw4zw
	13SXAv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89d1-0000000GtxF-2CMj;
	Sun, 20 Sep 2026 04:58:15 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cy-0000000Gttp-3JjZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:14 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f066d8so6966025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880292; x=1790485092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=PvOAoYbLXlu5CrEhQWcX2FQe+GV2GfeVbnkzL/id7SsO5gzwMAQt3SBSoeqry5y1SG
         BDBPUHrwKeKsjnaUzudKklrSCU6EgQtoDa3eumM3Ei1x0O/z+UjZUEe/zz9bkLNwxzoS
         tmkhsF7rl7sTpDNyJUf2QAUL6UfXIzUnuZYln2nfKKugGOQ06WGBL3UOMcOUuPxqJOkg
         rTqJkNDJlgh1vdUquhR9riZtT71F5np4ekdLKzEOT1s5IaOutmKpnPL3tYIiqm0fsECu
         2yOujbwhckc3m+L5X7C8zxtHzRL3+flmscY3UDvMUS6Ff+l1pKr+N+R1RTTyvC1LDMxz
         GL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880292; x=1790485092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=AJtxwLqbchD/KBae+nkOu4FmB2Lyox0Zpz5nH2/Yu6XZcP7+nB43q2SrxAjIlMeZSK
         h3ve+Ei12NbZtjGmvwULgDBd8R+pCPFJSIzT83zkpLgE+DdHPiLaRcVep7d50OrhqAvZ
         Rj46zmltjIKDPOB5jF8N+MSvjjKHCW+Scpg+3IDFah88d5Ysvx8UxMQpYkAStZFaC+Ui
         XzMwXrgOCNKvluLItVBSC6NzAw3bqDtPmpBhZjNFl5JG8E5Wh3jhXhh3lFCNhrq1GyOV
         Kg4+RpH4rYqUHk1Bh+N+0Bgnd0/VVstfuKtb7766RL0X/8JS1dCZei2XvKS3snftN3UQ
         KKbw==
X-Forwarded-Encrypted: i=1; AKwUvBwDCM2e8ELpIfRq8WAnLsSBY4+0PboF8KSxcwDNzCyxWaZ+IH1VG2Un1RqMN1z0XmpFx/cuYaue/Y5OaOZYU1rD@lists.infradead.org
X-Gm-Message-State: AFuF++lHzCUY7LyR502xjoVtVH7EszlleiGOdimL6XzzuBNtw6t2kB3u
	BNj4hjRoL3Nk7KkQrZT8pujepAVsxV3RzozTIxaOQajtvpeg9BvCIWmC
X-Gm-Gg: AYBFou37LUkLoGPwxwUHL7G1PgT11MDcvK/XJRIaVZ7UywwDsdJLfB/6WvJRHKlYbae
	xqQYk9LXFXu1LGGon4+yhAPmsxY24WXaCHqBkzMoGwOx33UuxpToieLv5iI1kQADBABslgbRum+
	53mL6qKdoJ2WJwtGIptUPjvkD3uEG0nNQdTtwqdXrupc0Gp9t4n0qkSHN6pcGxrGsTXaVhNi/wd
	2AKbcwS8nocE81R45IefJfnTfhRLeRVMnSWG+yBOd5dZ+bYp8i0bQ8gmg9UQI+NQulA8QBa0XsJ
	VoMSf5FuIJ+QWqyoR9fIf0+/5geK1IMB83JDi5FOcjTz7sXKNKzKwvZ/+i43suYEuU8G1kmsTo9
	hf9n2PVQk+0w1WEo/cpG9h+sQSdpF85MrzcQYkVnFWWpQyoPTwJwFId5U9AhyMZQg2s/keRBcD/
	XAk1g9djgcb44eITr83l4HrF/VaFIp1vh3ryCxiV153MaxS5O59+AYyPet9HG37QZGKU7Yt2ffJ
	xfXkG5H3jnKxzmhHkB5bCbPbSAra5asdW/R0m9ue3ieiInbs/bRN3X/cnQB0wH/165YnRVlqvrc
	6YXAe90dr3kyHAC6yfJxiU8KvWkYI7LDbSsw1DS8BdXqYeNkl/BL4igTXg==
X-Received: by 2002:a17:903:38c7:b0:2dd:c100:2517 with SMTP id d9443c01a7336-2ddc10025aemr41443735ad.32.1789880292039;
        Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:59 +1000
Subject: [PATCH 20/28] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-20-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuyhvMW7Ds9h3dXNYauaI1fvENjrYLNloXfE7/+
 /9FwcL2joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT/msPIsGD6SeetzNUyV32e1hbMDmx9b/3btb5snUCd1rEgJq2buYwMVwW3aDW
 dXZGUEtGZUOsgVbG4d47hzTtOzj7lP3bJzRLjAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215812_837092_558C7407 
X-CRM114-Status: GOOD (  12.50  )
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
 arch/arm64/boot/dts/apple/t8103-j456.dts | 33 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 33 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..41ec1398f981 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,36 @@ &pcie0_dart_1 {
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
+		compatible = "apple,j456-macaudio", "apple,macaudio";
+		model = "iMac J456";
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
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..aa2a08cb22cb 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,36 @@ ethernet0: ethernet@0,0 {
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
+		compatible = "apple,j457-macaudio", "apple,macaudio";
+		model = "iMac J457";
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

-- 
2.55.0



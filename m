Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE73CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSJXdBfbrIw2IxZWLS1S7ToPjqCUAXDZQMF1IOWmL0k=; b=FzIHnIXcNLGUmEQjZDmUB/RuWZ
	RJqyyCZJPrruwRT3zGXqyCkZmTFau3s2WxDKGNE8t6qyvqwSPPAe1x31Cggr3tblG8M1Dc95G9a0Y
	bDsEF3z270BlKR8YFkgW3PivyEDIi+hUWAqLzpckn+zdD2rX2lo01PoUZ/3R6NumZaoCGFMsY4M8T
	xLv+ckgx286EHWiAXcqFMgTieN963BkPulztJ/XpGvpLuXTVMV3GXsxNEkxE1PaI46VE31zRpKarr
	GTYd421ccDsz+mSWOk8SgxtyZ5hq2WAiC/t/cRxSKIpFfm317lG7fgVCUo2abNCP7BRMT0RiVK9r4
	yyDSsEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtP-00000005asq-2hiq;
	Sun, 18 Oct 2026 05:57:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtG-00000005aoG-1YTc
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 18 Oct 2026 05:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bSJXdBfbrIw2IxZWLS1S7ToPjqCUAXDZQMF1IOWmL0k=; b=rMFA+713ojBynTFqBpDX78I8AY
	BaBZqixcTVvAKBARnQNSjoEQdva3cs7vfeRMl45G1dE3uyoFvCyUVY/jcHGPaFv2kCOGpnNHdBIse
	bWxaXkVfmIzOGIltBQubgJsx7Je6/2drVQoKhEWYU3WWuNqatc0gZ9pCJgin4I+kvGPL2SFjgrah6
	hNEHMGdHqdep2efHx0R93ysL5xPa+Z30s/9p+fH1ebaKQSsA3WV/CQWxdBqaPA2P8jVLYpjGWlXZY
	lxXSf9DDLtxSAfXLZNkUeniSz8DJmy/TEj4Ls7ycdoOg6KU8sWTTyNQEG4plJ9XF4A+96I0qUMFLg
	Gb8uwruQ==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xIJtD-00000002kJ2-0vHy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:01 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1099423a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303017; x=1792907817; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSJXdBfbrIw2IxZWLS1S7ToPjqCUAXDZQMF1IOWmL0k=;
        b=YXQzivqng+Q1JVnpEwlLqY0Cv0GAfhD4jrAghzYCEvMiavj4Xhiz/fzQn14FnZ7Ny7
         g3eIngpzjptkUqRhrdST0aBlz9/Mt3gOpaENQFA4D1kahxoTUIfuR/EPk7hBh+C47T5T
         Fq3iTCwXLH84RdG2Uxzvu6qRfH0BYx3+0MnGO6Qy3zNiiHXdNaiJu/aIOPitLIFWhLqx
         xcI9U1gl5dpH4vHBcP/KCeWg2eowVg3YWUxR2FSCKDDvBpg4U01hjRTkkYJT4w9obYCj
         uLbDiZdDYsYv16gAzsxRSe4u0NvT0Eh7aRFWnpaLvcH5sgwym0b8jdsaLE1FJHWJm7Ry
         HbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303017; x=1792907817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSJXdBfbrIw2IxZWLS1S7ToPjqCUAXDZQMF1IOWmL0k=;
        b=nJZ0BJReEndAwf03WUdQV1F610/P0nbpGhfXrkG1FZ8ufCYEYk6o4sM5WJz8TDTPv/
         zrYej3j2QHpyhBEX9ixx7SFLqAQIB3szOh3oCBC1A3KH/x4LD7fSHNvDxqj8l3btTK0G
         TaLQGitkrvtB5bLrFmlVrtbBlpE/caQmTpzJ6fmBkFg15sRI8WMEQGerGhQGN4FFyc5C
         dbBYePe+ZW+KqvmTYJkVo8al7DKbtTXzPlNYioBQ/8AmxUnVF50nbVOQHA4TwZpC4yNR
         qf7LLRh/Sg/qAHvjS3FzpTwDTJraSsNXpW6uApg4hCFwBfSzzTNykx7kYWe0HXXVc1KU
         HHrg==
X-Forwarded-Encrypted: i=1; AKwUvBxIYxu4a2mgctvZBnXICFKIP0aI+VQ5WtfyVeHOExAPwSFw4oOgBxW42kJ8wr30VpAxuKJrkdHOvh+5SZXoPjRw@lists.infradead.org
X-Gm-Message-State: AFq9FYLpDD/72rNSHdWRmzc9SHGKSzokqMhn3AuV15OqiUs5b7FBBYfP
	rdOrB/Kroc9VIRfkBENQtWh9mmKq2O3IwnLT9NI20yVtd0waylsb8otK
X-Gm-Gg: AYBFou0A6WlXjByzeMb4HH8y29ZkkJwHt7gn3PjkhzEaha+EJ4zVkqC7afBT0dRdukp
	e7oVk0YwdrqkStUIsnQSX66WNyEMF1ZL42J4KPvubVsXCUqSnHcWME2VhCYfkV+/so0yugCoyx3
	h1tHrWt6vaWofoYPtCfgdb3WLXRmX4eqb/XaSKwD3V/XVw3q1ORjx/Lq5aFIil0EFbpkl5N713L
	XWIzjnJI3KUj5d+AZks2hTw9Sa9Q42AG2NurjtP8Mfpp8+yrIsXPhx9y5bDsH6uqTeRfambjx2y
	QToqCcbdyhl9DJ3FPdV/c4y1ePd/QCHrVjeda9SWns4xrFk3LPaxQqmUtDjc3O3W3E5qeJtK8Ho
	xlNSqwzFC3hSmIHOQLuXv57LaXvoAXRYWwnKgyp4cTSP805cSeO0fS5+LW9uE3y2AQgT8UJRDwh
	IXz2iKccf95i8xYiE7bM8l3phV9LFjPdn6a/FTuCtYdKUiR6etY68OFoXj3wMakogt4BweqgZOp
	k1seCfZXi9qOshIr7Hq1NelVGeXZg+3nXrSVECRcKUTcaLFxgpvLx/7l0oZJ7qz14WbfcEPkehb
	5xOY/PMcdSjeG2DH205jJANWD+qFEO8azTs8qFd/DPtGkA==
X-Received: by 2002:a17:90b:5643:b0:3ac:95d7:2f9e with SMTP id 98e67ed59e1d1-3acef4e492fmr3875435a91.38.1792303017082;
        Sat, 17 Oct 2026 22:56:57 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:09 +1000
Subject: [PATCH v3 15/21] arm64: dts: apple: t8112-j415: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-15-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3964;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JxN80yGgi8dxQy++Lgr6IUGkCUjCTAVvVbG02jgBSPE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnfSi9caHVep7JTrWylnMyGpTn3vO/Krg32PZdR4
 vzDPut2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqrVRkZesRPF50+GsHhvVho36TPntreW05NzQmeOUPX7smzX8U29xkZbi7UXt/
 /ZcokoRMx9rwJr++cETs7J/I2Q9aDQPmvPatP8AEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_065659_693491_230B1832 
X-CRM114-Status: GOOD (  11.61  )
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
 arch/arm64/boot/dts/apple/t8112-j415.dts | 132 +++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..099b9837b633 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,136 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776";
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
+		compatible = "apple,j415-macaudio";
+		model = "MacBook Air J415";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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
2.56.0



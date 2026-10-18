Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C03ECCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uj/FtW3Fwh1R62fLY15kbSsO1v6D6kwyz703Fo9gvw=; b=Bp6Ij2RVXqxebeTDyVoSqcbVOK
	I6SIauFURBCwSfLNhOE+QJvbNWXp2x+2cQGVVimJfDcR6d0uF/7VN++0eacKqbQ7P8OcYeiHJjeI2
	a7Hm7gogOVX/f+KQzXtNBwWxxvg1g8WpsMvt+UVDWu+gt3y8sfCVgLQ5BjpN+ndPLOROoXbdCGy6p
	mxtWx7+5S2ak0aQ/hjVSrq/z0EmtzM2v0r69cJeGQoX/Xtbdh++JWAVFLzybkj0zGeyqCnP2sZ5TN
	qiIPbLz6GsdjiLw4IAO9+3U14jjVCvBnivRiJ5N3atXaK+Tq+gyQHclsM9aMnZl96vW/WdSuI0JvY
	drts7ZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtX-00000005b1H-2Hrc;
	Sun, 18 Oct 2026 05:57:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtU-00000005ayO-2dJq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:18 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso683769a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303036; x=1792907836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uj/FtW3Fwh1R62fLY15kbSsO1v6D6kwyz703Fo9gvw=;
        b=BbEMgXDwxb+ya3QkDYohAyLMApsZ5LUM6RQhvQs+/WGgv4XQBRBDuX7U5+cV+YNXdx
         f47MXl/6l8yPM3dJQXVdIIn9qTsfelDZRxGaHPSLKlJnqj6xWBkdSCiQ5El9qMuCf6aJ
         p2t0H5n6VTP88/D2f8iQt8IStxXwo2rWRPWIe63aYrRby3tJfNGeEJdTgOpxpIcssFL7
         fnHHDN3YB82B+NBp+wNs7wY35IHKWMgimphrz+EhVMVvXb8Ac6yypXBS+GIaxAa3nrB0
         hG2tlRbvHsEuvZ4Z+VZUS/sDrGE9C/gKrIDtkuZRs/5te2feK0cTIFah+vtjpxb4k8/M
         ADIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303036; x=1792907836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uj/FtW3Fwh1R62fLY15kbSsO1v6D6kwyz703Fo9gvw=;
        b=Kv6ccMv7fKsQUcC6KRIUx9CcAP3H7mudkSe6xineAC8HEclRxe0XHCHYJxJ9PbGdRo
         jFcAuoIpUzTvVMxJLJMmc5KGYbq/ez3xQ263s0ezWXzkbVMdnve2MyJJSyI2Z+gBXON/
         cZkekmwK7QdIkxO7FcX2cFHB8RG5uICYt+alY4zdaNFfAkuSwZhMDV4EKzfPbwLAitIO
         q22NgqboOvS6nGDQUlDBpODClgkgNDCdiLpCpr7LgLyGIzQygQGW7wBAi6pEY4MKFkiH
         ZnAcHcQkeAoyXlR+aJe7nXEeVOJWXQVrPQaOROZ2BtnAmcnjjyY1mLFLLbghgx1iEG/F
         q/aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHd8Jtzpn09QvpoiL/CISCT8llLdwpl2setVeuwaiuuOBpMypi8wIIK+1tRYJ/vve07RpB7r9X8fJf2jdlhFuh@lists.infradead.org
X-Gm-Message-State: AFq9FYJDU0QZIdWaWDNF7b+BtowLYRfDve5eMStVfnsvZqk6fw7qICR4
	CcUBRx/t54S8ObwvZc/g45WbUlLnbG6orlHL2AOCQZIRlkYLKKsiXvee
X-Gm-Gg: AYBFou24tuLoc88wqMomoJfjNvfxKb2JxFqst/f2z5Ir2S+UT19KLGddnkYZ+Gn2qNF
	hme2ArRd9W51VGZqMnwO8t1j4Yy0AekSn85ierKAh+6HyjvsJkdbM0szoo5pdg2oMSrLPB0+vFQ
	POF0FVVJ8tee6azWRvUNjC0xZ+3p2gHO/cmUObE3FpDA2qCu06AteMCvlMwPTaty5ittGpQhzxj
	nchRJ6wZWb6EaFQw2jVOQRbCMXTpaJbl/o1WfyzecIFSdDlT98EKRkUxAbxqNCcaincwfvleWSB
	/0/yskv/w5CW3UCO9KvW36Yz17K7lDMls5tBDgDimvHxpee55Puy/f21FgmIxiLCQlf8hE8lUUn
	NXDcqmoCGNYjfY9L4eyT0O6H4dBbc8YklIP+s+v3KWlpmtKHYaw0Mgs4fQdzNe/+Dc4JVOMFuLX
	v40pqpRic6fRo8SS+DMJf7YTUrXDFbOZluH+sgAY7K/Dn85y6tJ1sakjGiXfRmEHVyn5HL8qxwn
	jVnPB/GGnXBrL84sHeiTSVg8+bGOzWa+/Qm87VhDKij1UVK8iTbjXKj16UMaq7Qk9kbbO06vbhB
	l0goPFQL2nNj32u6+ulSEmwWKLROQ+f+QyiFSjTM8yOvI9c=
X-Received: by 2002:a17:90a:fc48:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3acef51e2a9mr4377352a91.55.1792303036007;
        Sat, 17 Oct 2026 22:57:16 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:11 +1000
Subject: [PATCH v3 17/21] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-17-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Ra2ADqrZxWw8PcYD08Ad73OxCM3L+RBKl//X4m5oIQM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vm8RPZdtn//cm8/66ZbZ3qkfylJuE6dvH9y69mAU
 5EfcvsyOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMt+Inhf1Ziz499nNYf3vmJb0hZXCkrl79m/eGqY8e1N81jnj75WSojwxrLe/Y
 H4/2tN4qrdy8w23DGfcGM8G8LQ9em3DuTeyj3HQcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225716_679524_06379267 
X-CRM114-Status: GOOD (  10.58  )
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

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..8993775da9ab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,113 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
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
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-fan.dtsi"

-- 
2.56.0



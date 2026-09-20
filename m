Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B5C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwMS+SCTdXpEwJqRYlXmGmIQiKyrThQd9kYVEal5MRA=; b=SN16NG2/dvOtFJ0IewAwgtrrxs
	zH0jRO64VC+HKTaS310LoSxV9Mc9bY5vH47ogmLYxp9Km+Zh+AH+4t/xwSqRPKYj2u57Mqj2hkLdP
	h3UbBLZTdwtEPfHrBvcqsZo1cj3Nt3uHLppobCSryt1Cr4DqPwesrrSzVbpz93eTJqhe7KKJaLDQ5
	Xlp05dyvkSqlXqEFnrbWFJgYe/aqaHqlZP5CgKwzId4iPiLRDogklfEsEEMO/0UjfYxKyw3GMbqVx
	em2CJFPW0Za/dB+PDUHqrEhZFxHUsJep6MY4GUIdqAHhlMhaPCFQRfuRGOWdTOyR11Pdu+wHbx3rs
	MjB/hXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dc-0000000GuMv-2mDg;
	Sun, 20 Sep 2026 04:58:52 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89da-0000000GuKc-0Dyv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:51 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2dd88a115ebso16267945ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880329; x=1790485129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwMS+SCTdXpEwJqRYlXmGmIQiKyrThQd9kYVEal5MRA=;
        b=XGDilQCxV/fbvZ7gLHQvpCU9NA0ExlXFFO2lOUe/z+nY6sINDTYJSFLjU2wfuRp5m4
         opK1jkBZt40xSjNtD+CMtXvdIwZ5SATtQ9W+AmiFjLXPSmCn5PZRGyYEa59omxx3z+AF
         m6KreijxJNOHQvBYatc6Ssqe3+/pyxBegK35/eezHcupDJExFovl/cu8V2X+YkKA/tSI
         TPSZB39NfOl9HfMDjQUcKEOvOvSJl2LAzPX/HOTij5EqWHRxQ86rvKLAujxY4j7qF7PA
         cO8WcIWWqKUPzauwjBDtNDg7L1ynnHQoxRF/fbtl2kA+SqbeEBgRV6M7TqYrcqTFBhe8
         +dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880329; x=1790485129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwMS+SCTdXpEwJqRYlXmGmIQiKyrThQd9kYVEal5MRA=;
        b=saDXV9HwLMfuDqxyq1oKbOJUYSxS/7QZueE80MJov9ktC0836LW1A18teES/eGAbMf
         WdpQtaNFT8W0uVJZKLuzBAh2yWqUaAADper2M7IhZV+re4Xfxj07wgldSV58B9trYI8u
         SiF7ERBLWUZNtEdhdaL8V/7XJeW1hoQctwlCcMTm4saU+GSIGsxyIZeGUatAtYSSdlCa
         ivucJ1oQXE/E8OXa/S6jihikSqc7R0nzyz3G8/haB8EI9pa1PfFsOaqBqa5mI/qWR6+5
         HwkyFXvZBG6X5AYY5/WUmdH4oej8CIwYQY58nAnEQSajVhdbJnU/5GwEKSJvgvKt0NaZ
         ZEmA==
X-Forwarded-Encrypted: i=1; AKwUvBxnvqgJ6Jhk22mpnzXPbFHEoiiKZdi+JXeESjQmo1+fZG10XrqxF5m4Htks5/H0dq0KuDxGw/wE296hQIIdIGeo@lists.infradead.org
X-Gm-Message-State: AFuF++m/aPUhDSMzgrf00kH2+xLuv3fRB7s09VGAMexHUpZCryzKkRxh
	fIp5Ce2uI+B3pvhUYySB/SkAPmmclk21GLmul2VCivxIcC4X2qnR2DDG
X-Gm-Gg: AYBFou0fS573e9BVlcZJnQFVvlhobZfUvalZ092byEJcIRHkf3z1AlZQETLM7TxSkRj
	kaD1W1EHJP93Su0Pw3HQRbsZSYVal3VSU/DJO+QmTWf9RwxMe6kCwUzhUvHEsYdPHrobVMh8Ql2
	Nre3jSUl8eNNQrha47wfD0vV6KfUe0XpAeekTvGIqaXDXo1cQuTQaW1WwgF2Tzixk1RCVciWcNw
	W4IPwtjR/zcGB9g/qtmgy+vJ0RT/+6V90nO49ytDTHvibOak/aKIDTgzQQ9WIMRPhERvQTx0rzZ
	txAMepJxr6Jtq6PH0ZY27r9Q49nIElXORZxmci0Zvf5Akt+3UMFYcEYzIRzCdhja9H6c7g9Uktp
	e4uGBFNYTEFMkfe3yTSoL+DI7Yi/AKkrwDhLlVecS1KxktStMcldrd/uh3S082ATix5rRqF7DpY
	btzE8POxYoJqB3F+FvspC1YP9cc0prDQPrITUfftEiX1qht0cOXXTDbxgmpjDHo4wQKuYlxaIVu
	K4Ei3vVu4lR0u1Nu+H+h3ZQ5Nd+wAChscIz8qPV0Ri701nUnGuQ059JW/lDvFwSW6dBSk9vCT78
	wA3Hvu4lkoxpJEV4oijGe1E0pf6mqlJE6N2JkXkg1QfuG48=
X-Received: by 2002:a17:903:28e:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2ddc10044f8mr51674075ad.55.1789880329399;
        Sat, 19 Sep 2026 21:58:49 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:03 +1000
Subject: [PATCH 24/28] arm64: dts: apple: t8112-j493: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-24-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=StMdE/41Quj7yIXSIiTM/Hm7dUYYyFp2jqXhWfbLNVs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05UuHtmzzNTy5hyeCe56m3uqbz8rKFxy4t6Kd/9Ug
 gV1Vj0X6pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1VD1GhqtHy95unr6tZnfMpnu71vU79bx5xat/K1qC4eaHrgUpGusYGbZctnv
 2QkFJ57zSUeMVVvO2Tj2/2eDbYy7OQxbb7C1PLWMGAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215850_110191_0D86F41D 
X-CRM114-Status: GOOD (  11.36  )
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
 arch/arm64/boot/dts/apple/t8112-j493.dts | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..eb401ae8773e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,106 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "apple,j493-macaudio", "apple,macaudio";
+		model = "MacBook Pro J493";
+
+		dai-link@0 {
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
2.55.0



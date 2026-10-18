Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD77CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=; b=3sI+1/OgkpDcFf/2efTpNNKR15
	oP6ZMS6DKocJNiN+XiKVPecYhfg9C05AFXecgE6ewZRHtSNCRfPJG9TWIkQy7QqdzwjHO2rXt/29P
	HSNWuD1U8tyRh/pkNmf2wFL4qGejAP6uGcrDl9WUd98C0xdH4azwcN5XpdtBxdENuFXbxuQEBX6GJ
	VxRPW4t8zxSth3pLPL0n0OIaXXUxWVRHr1ZOxXDVbNjmJWC3d93q6hBZHpaOrpHsoe5NShLlzDMze
	3Eejgat0iZKw3LPau4Ny3tXkOj9ayIgNxUQkpNCXhHEoQT0MJ+vVAsfWoV6xNwIqQrenEpMpTCTjq
	K/vzGpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsT-00000005aLR-1bFl;
	Sun, 18 Oct 2026 05:56:13 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsQ-00000005aJO-32vD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:56:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1098874a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302970; x=1792907770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=KotsXi88Kr/y5BNUJDPMheT+HN4XdHwEPwwBt+Q2c3+Alz23OGxXDVTs+i+jIH57lE
         qDzrQ5wo4hyulNbyYN1caMo8CDXsjpF/rEdvaFAxZ1CD6nAk//DnNEknbWkOZXegFDR2
         v8EEPlnVTNot4ClJIsgZitEvwjcZ4ZUqkeaM/Puh+9YxeMaYbo/Zyw3lWeLJNa4IlwBX
         tp03BOYfWFlXCQYWjHaNEM1Wt/lJ7v76ZXHEREwiLH1ATe0IfvWPh0Tr28ajl4E6D82E
         KLl+pQiHAPw4gG7Cj1v6S61x2kSjjcyUPbjTOt7uX4nk3JAayE3xrDDbgs2Jj0U8ONVS
         cmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302970; x=1792907770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=ak4lKgV4OEi+6pbiUCFB/nOKkUokcNFYkQPJaGova33twz+RMMtYKw2BU5CQz3FEMa
         OSkO9wRpssl1RMP5KrFC72iGR6OGj4HU0oeS/6Phry/COrM8G0WrMJcgbCVN4dbq6Dw3
         lsahjwgqcHqvBiu+z/7Pmz7Moqa8ruPUaeOLMc4bRxZbECGK8XW3AbVGvJZmb4qLlT7h
         rHweniPs6gpB6cVoKzBhgpRAMKZfxwfPMfdyETEkzpJ1w1r8eZgi4jWQTKvDaSe/STXq
         oPwzcCLlxObPmBK8eS/LtDLBT9KLC6d3VTni7isP7PyUtKLJBkWBaVXlaDVjEcj/pyfb
         SAWg==
X-Forwarded-Encrypted: i=1; AKwUvBwzEO00r7TSRuWzNvppoFHtTEXU370jHHvMBBrQXKFZ2atLyOuYhLfEalhtt9pKwGFd2c0z0ITNMcMJ1cC5pdeu@lists.infradead.org
X-Gm-Message-State: AFq9FYKFo4DS2fCtWqmamkkZLkVnG/uDCZC5kPH5e6v/BRQ3sfeXqjHE
	BdFz6eU8GoxuyDwVuofDk+tKPFQChgRQh6F7FTKLF1f8N6HWBZI/Br+M
X-Gm-Gg: AYBFou1G+5S/8zZOqK5dxoSP2ZuHzJ4vYD5VN7KR5rwwsQvBF6wN74EZdBvbJnDeK3J
	S/iZYXz8hk+LJPJb7MuPmY+jvzkA4TiaJt79KSfPay18OO5ABM0PpPo71XV/TH9Z1oW5wE0N7yy
	zk4qv3sluk5UqvNBbIChSGS9ibcCDEZfCjD+l9Tl8hD49N+Y3Cz0r8m0cN2e6yes9T+fDjrDs4H
	ngcTTRp8ESG49EcjKo6Sjqb7IzH9DO1QFXUJSPVWFFJfkx8jqRbRCW7oicSqZmmbHhPr8kvdzHi
	NhsOWIFggIBa0RCMfQOTDCSe9RVTgKVLVOVybWDObRcM/pWEKlaYLKfL86RJmOHRj/wZmLVRTtQ
	fBinK9L5RcR+CgQgARbsIdhVYXnDx/uwc0rhjldrElmPsJ51lPp1smmeLPBXQxKAfkOfZhxnX19
	od55RFIOk0ZuSNDMReoiG/sHo+eTNpDVYfUGdKSPAyDjkQh1y4ZmhceXXSy7etXnithOld2+/qg
	x/bOsL6VLESFHSfL4LS4gMdFgNAHICw0WBnKVjeVJpTZky45c3OncE8iU/RE/9lgsBiVoKKMB7u
	ojNzOiyj+mIjLD9ahxFjVSbfM9dWekxEEGn2KB0cgiHuZqOfyzMJmqMJ
X-Received: by 2002:a17:90a:c10e:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3acef10a76emr3948159a91.58.1792302970047;
        Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:04 +1000
Subject: [PATCH v3 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-10-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnv5xU5ifpW3Y8/1tgrVHjA1jpI9H2itEec0gq5j
 cLG1eIdE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqdafychw6fvlqiSXi6yOnRG7j4qU8a7tZ3v0/xjfpoCN0V+n9UyRZ2RYk7e4/Dy
 XRAJ37yHxqKNftsdpXTjstlGpi+NdoK04pwMnAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225610_791688_43BC9F92 
X-CRM114-Status: GOOD (  10.54  )
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

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..150d778565f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,76 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
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
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
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
 #include "hwmon-mini.dtsi"

-- 
2.56.0



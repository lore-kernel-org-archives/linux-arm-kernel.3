Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78027CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=; b=GhrzSEGTkQkaQgGUAA5NxNtKDO
	BFLA1p80/DJJseZ/Hh4LakvxLenBKcwIDhPutkgjf8gV7lLHwY5OcByGiYT/KkfnBCHkT0c+kowNV
	LCcxPfP5eJTd9jIxu15K8VQkwhyF9jcl0GjZeMXt6c+NK9ebM5XYtxX+IqS/6xXK1/T3rmlQWgjy/
	hcwWzDe5i2ljnwgZi2D+PB5WC9TT/ivE1FDZTHeLXfqmUL8Cubsazlp33BicqqNHe2AjLxWGSZq2K
	TwgNiW4QmzGsuowAXHvwA3xTwUaQnSTAVqtCqUPigmX8dU7/pgwq7qBVYivuCVeM/ac4bHFDgT/3T
	pxjBcVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsM-00000005aFq-1fAh;
	Sun, 18 Oct 2026 05:56:06 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsH-00000005aCB-0uEe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:56:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3a706146559so914853a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302960; x=1792907760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=sOAvbxgDFdbNYmGTbEgTI8h1aHNkYBqQM5eh36wUdF2yEj37NFZ8ztc3pLCGyyPTOm
         +fCmA9t/Rurd3EZciwdiCtt8P9e1dbJmR6tlCI4qyUIs2+ojMs3xw8hODN0QOwkOIYFJ
         Oswv2In9yHwo9Gk/J6Ovo/PQjYKN6vrYzM3un3aS5LpfcVJNXTx1xQ3oRcJEZSuL6M4/
         CmZxbzPTBYPav8qbZbM30GVJmQ7X+vO/74ju8+1t1/uls5t8fd9T4ntbBoipPvxmqGzx
         /YtBqELh2WGuYUZjdEHuOGyj0GgiX6WrKop0HAMojrRv+K4GiKhB5TFehSvrJmy1BpnJ
         QD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302960; x=1792907760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=N+adPCtSzqU2KrWChKebrbhxfhb3s4DMJhtiMVX+deDK12BQXFxpIsFHBQG7r3dnKz
         P4Tw00oW5HAfpf3uLl9vwvOVahknSBsb+atiy2EYuJ/ZlvfKkzB2WV3Peolm4c3ucOYq
         vXA+mBEucBQYOYivB/w0sWSCX5PsT4ihuIzy4L4sQ6TS/ll4bGzvvahaynZcZZEHknnz
         KhFaabLDNDIfKBLKkWlIDMIYXy17MSl/eosbQB5k4HiSBECnclRZzNWTx1VUyc2K7s9e
         bPoVJLaUVRtj3f0fSs4p/lCLTWIuIuuBly32kTvi1fcM9Wltv44g3jB8jiAr4Tf5oMZX
         Ivew==
X-Forwarded-Encrypted: i=1; AKwUvBxN4WT+C6uRSIhdt5S3U/7j1oWqGm1+/pse0teJvHW2uEsXgeg5yYPxzKQ87xugbyLkV9n56wQIivk0uH/jXBkq@lists.infradead.org
X-Gm-Message-State: AFq9FYJQUtbNxW/w9RM3QAwrYZFgx8iKga6rOmw7HFxSztux345MzuuE
	xlgQq2MwXVxFOlR3bz/pai+MftQM/2ZCHk31TZX62dTr9q16Mcl4Ta76
X-Gm-Gg: AYBFou3Tb3pBtJX+fOZ6RdzeWay6gwdY1vn+TipJJ9ttjKpLjdTv2i7hL8DaOAhpjTA
	wi1Lg7hhxVVmOdkFsDN9jXa59kxBGjXZElj55GLoDWxoZbM+U6J59mWvmrN/i2uwnDTila/LYpE
	5lYqk4z5naPNijGtFoIV1VJIAinNwlKHFQ+JpL3x91PD5yMhnCYm85yfQukYRS3tbO32GfcfAQB
	QG45S9okXqXftlFayM8zmj+KMx/vB2IMUKGlFJGzQAL7twlivxzCx0KyYIMsCyhPXolnrKIPNOO
	a3PtYBXBv+O1wmyI0xxWhp5mjHeKcrInAt3q7LFqxIXPTlZFdlB8r5PNXqZwSHp/1ZvogFRhsY+
	qT6pYCUR8E3n1USbbDz2QJMNAseAF8y3iNGwNn29gpssBgReH4vgZR5BbE0Uo9m7n9w+X1GnXXU
	6/9E0WyDYdpOXvJMl1m+KDR6GuGjVXCiFspziwfu9nXyaShS/2MZDIVeTL23NmILWbvOJuWCw9I
	y9+HKwb/VcxrkzBQaMPObdgEi/KOspcUOkYwOPKLLFOVdJkpu827BsX66VDhWFVrSwDs+KAl4nj
	w2XsHegFa062mvDrtvVqsn67+06K/NeI02KrE+UrC+Nkrg==
X-Received: by 2002:a17:90b:5643:b0:3ac:95d7:2f9e with SMTP id 98e67ed59e1d1-3acef4e492fmr3874379a91.38.1792302960536;
        Sat, 17 Oct 2026 22:56:00 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:03 +1000
Subject: [PATCH v3 09/21] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-9-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KU3BimG1w/tGdivUHCFc4QDicVE1ue8ULpff7ZYuYZc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nkOfZBinBN/YGlX0O5SvnfvnwlviQh5vf3pG8Wow
 u1aYrPYOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtH8vwV0hFKrt3PdNppgyXZRkNSyQVK5OOKKUtnDtdWvvKqVv31RgZnvPLX/9
 g9pT3TfXN1ROaHBufK3Ku+GX6Y3bd+yu27Cw5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225603_574861_9E1B2860 
X-CRM114-Status: GOOD (  12.35  )
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

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..7483fc5cbd20 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0



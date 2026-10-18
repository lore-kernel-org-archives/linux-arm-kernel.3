Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73F4CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=; b=UwTTepCk+85/16sihhfRQ9HRXV
	lztA+Ro4/dtNilDNYldHoTBuBjpI5JJj6E0+g2vY3liaRs/N2XtETl8cNrwsjsSHpvxsmZvK18+cW
	twy4vwtmBdRngHEcSrqhotZkHMCpPq0lvDMRfEWnEMkDvSlqdY64AYQEl2+1Sou269Ok7Bl7I2BEo
	EfBAOnzJw7jHSWqlz78qkg8dqy8rLWL8SEQTps1rxhW9wEUnkiPYDGDWBjwUZn69gqdreYjNfYZyq
	XH86QaRmHNBGyontJHenMnaw2yNW5yDWHJB/U3EXWmwdWrDzToxPqVh5nI52yzU8AQgHmyOMs4ye2
	y1Ek1IEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyw-00000005jyH-0xqc;
	Sun, 18 Oct 2026 10:19:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyZ-00000005jhK-13DE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48df8fe8513so855873f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318725; x=1792923525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=;
        b=eIe9lIl2aW4CkzcQHMERvQr/Sn4XyhgSP0sTY0jn2dUHC6oe9Hy2Xds5mYTbzxmopM
         V1fa6Z/6KwoLy5ATKFqQP4DOWlrCWQ3RsBZtp2DLr70V/voKT4Y4XNXTvvWwsW6pdZaW
         4un92pqbe0ryXsnvxPMBcHAQ3U3TObgvduZe5VzvZFvNZQHvYUScgXYAI3o+7Vhkbb5N
         xNXslF3XnjtNyPFpWQGJDnXwgzE4n7FmqUVfhGyHC9uHaPy0Awz2d8kDmvMF7aruCE14
         bLLp87fUOgILBmQlheR66G2FqwiOVMXfJaPZo7fUUy2Zmt0FoS/DvUMiv7fYdgw0jShf
         07Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318725; x=1792923525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=;
        b=WULPpTD7Hq6dEnxRQekhujRcFnHrw7Bt+ix1VNWITlnFIcen6qwgP0jnH1tGnjo84s
         NkQ0H5mNy1TTdXV/gNJOMUsoY1mFIMozmhHsVw+3lLComIENEOEmO6aJuOGljLblknc1
         5xT1ugSrFMFFt+zD2hFuxK4c0CJ2+5Et1gtzGV5lAsnG4ly4Y2RCBWD9ikacC34rub4Q
         rb/1KvB4gN6KNXjPW6BUH6T6Du8T7LPBfD0V6FjFEnLn89vT76zEA1scCUh1uJ2kbFTE
         w+KzddYQwTnL7zsjwVPcnes+wr2xs5y18GKQOxf8lPcA848GcF9E7mCUxxRb+7jTUJHn
         6s4w==
X-Forwarded-Encrypted: i=1; AKwUvBy6GrWuvPOZ25eZhHtN1pwyQrv2FpZGGuUgW5yYEWtsshaBCiuTuz+saFnIRoVwTANYjWAVl6AiX082KF+mwLpM@lists.infradead.org
X-Gm-Message-State: AFq9FYINNGYGTs5fN45eOoYUpReMdEnRbes4aD5I4CZLBj4q4ht8AbXu
	WuBo/eBIGee05xrVBHNMUqtBM+u1ByveW5aL52J2TedskWvnn2Mq7Gup704ifCRge+8=
X-Gm-Gg: AYBFou3ttvp0S6jfnCMfhm0vjShkoxqzPss32OtfHVkZ038D919FS8o2YqB/Pw7FIrX
	+On8ktrGBGjwwyWOWwfkXIP5EKiGCng289D0pt6shTjsF0cZ4X0ZYWcc0CBLQdGkdS0gATiFvtM
	XGyX53AhqVH5yRQhHwufU9G5m8K6PkrTRXciRzZTq4C/6tonPn2g2IlqyS0bwEv9t0dgrnFVDv/
	Oy4RJI2esdJ6kOpKyHrUCYz8eW8Q6mH3Rq2/K2jXlaEFI4Bz7VKouWtI609e3b30IrpYI6r++iD
	B05qd+h6aBkUStfhiQi4cKBq+jIhejjx5fsbt/aCIpH3jj03BHm3EmdQuIxv/UigM+G3q+0YKS7
	3NwnRWugWiyBRracdw7iW0XtR0l6xAeGdBbmvf2Yg2JFxySzMdw+ydkPTi5P+EC0Qn2pqHNQDCP
	kksOShF+gjGZ3IhX/QGqXi10/rHlTtNlZD61yfmKuZc2rNtR2XZm0mZwc0ccwgsiJ86lw9
X-Received: by 2002:adf:f8cb:0:b0:48a:eeef:b4a7 with SMTP id ffacd0b85a97d-48e07fa40camr6081304f8f.48.1792318725277;
        Sun, 18 Oct 2026 03:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:02 +0200
Subject: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=fGNM8hiWzIiQkrVUGPIW+8kpmbrfO/8gvWaDINH0zhU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vyW17Gfsjqy4bPUv23K+y0TruzSyPMN/cPRHPJpH
 he3cuP3jlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzkdzDD/3RrjuULFd6EWv53
 Tlg6c2rKc/ew30zM51b+Xq6xncnhIRsjw7nwrhuaopp80cpyRxwWhjfulVuze+urLyzTddOzDAz
 auAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031849_001131_B705EC08 
X-CRM114-Status: GOOD (  12.46  )
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

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3



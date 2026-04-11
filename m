Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240B0F3ED4F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZFZpdr1MV/6QAPj7KJDoF0hCAuAn+fdtvXvgF3G4yk=; b=Iy0BovM1KcD9Hy2nUo0/njMdXj
	MYrDNBMMHjI7TO+VkLe42G7s68X2m4KwAohoWm6VjAnz3UY/hMJ2E8mCwdb1lvR1geGaI4gKCfd9+
	DAtzohThcBXE0sEZYRzY9P6m79CgEnmHOLux7szqH/ncU83BDcgcFTOilC0S/26RVLO5W/KAJPdbr
	Z3L7Q/MINvAM2NgOrnpZ+TiWK/eSI4DeSFrYd9sLIRLkftirF4247+PfrI6vUPnmaC58VaM7Qu7F9
	Y/O7FUgHmxkTX8Eh91Lwl+uYSI7+1Y9ZYxzmUqNVA6f29hfzLF6K203HbHbTmN+UP0ugf2XFUdQLL
	zs9Gga7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZms-0000000DXvA-1JlW;
	Sat, 11 Apr 2026 14:58:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmk-0000000DXhZ-3K1e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488b8efed61so27352025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919489; x=1776524289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZFZpdr1MV/6QAPj7KJDoF0hCAuAn+fdtvXvgF3G4yk=;
        b=ZjhpH1yd1wnuYD+0v80UAQKbEB5/zs6Naq4QSs6r6TKUVstNkGsafirABaEr2CMiSD
         UIHWfCCqrMeqi3tBtzQyRtpfR1hXnEA+z/t+c5+KlI+qrw3Rn69BE8TgzIICKcpk5iHK
         kYojgCyT4kjABtxnokdm+cNbYTN2boZ7HTJTVocdz3VpJFkVdEaxrGwQlXd89TxNY1FE
         h5SyI3YmmmF5lpabDCbOUq0ZqvDD4pRI6bLQHcJf+WcUMRPf7IOHIBhETt7yQoeIvonj
         YSUhOVsINQ9ZjQ7H6SV8W6q5L6sG+WaB6HnovIhGgNk6zeBORI/mO2GSL5U6K/00s6cb
         E4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919489; x=1776524289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZZFZpdr1MV/6QAPj7KJDoF0hCAuAn+fdtvXvgF3G4yk=;
        b=Zs0rENyal1LbrvG/ZdI3eQ8Pn+Jrtlg7dqZy9XaHqK+EuhcJ/pzgbMUnYbwkqm40VS
         N+M13RiG5EAA2m6AAMzuq15VXlgMe4XacUccFbYulMtxoD5pojHQ23twyBbI2kQnPzLi
         Yj0FQ0wOo2FiH89817rAYZnIu3Zw1NqmkC5pcbH/WhFfZBOStNnORWpmFAuhrH9BvQl0
         M4RbQSJ+t/H+G/SiOlRSXfqfJXybsglhWIu8lzaZGKPtOeDHHef5f0cHGkSLO31unS0z
         FbPT2q8mcBsRNd2bCSJ1IswGWZqhvgJ2BsyzLgCZQQD8o4YLInqVp3igPug8gg6y6WWx
         Sj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3wE1IAmMEAb+rOY42RKSMJQfNtZFRy2jLrAuhAtsW7F1LHaTYWSQ8ut12pi9645yIvlVWydiuA2jSStEGEqp1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdcm2v4jOQePL/Jj5UzOGGcaqyvs651ZnEqw9+5tw+hoSOCyuV
	GJXUUKb6KnihNFL8Z1+nh3FQDHzKnBcVuthZPaVlsgwI1Pvzt83xGbTSujmHZCFOQ7g=
X-Gm-Gg: AeBDieu8JOox4NVdL38OVFRt3+Z6JllB064NJ6OwYqbn5VLoFzoBEqO0R8Xghh/bVKE
	lojsCQUZU764ptU5gmR9Qi4RbbADHJplKqyUvWer0yE49BVNOlVTKyCRlTctmc0+TlF6EXSZWnu
	ZWvbqKDXnnvakP24TzIeTrFTeDUwm8oWW12MNM20otaakwSIjazdLpL97R7vOEuPWrUvnMZCw2N
	gDJHWCxFr3P4aeQ7FcW0Pr4Pw6keDWmOfs6qsfefzCrlcajY6oW9gbwhAzdOrbzkirox+UxE5PW
	C8+ZHV4pXvgsrmqJ8mphJG+INjkNCwg7eyJuGXUU6CLa8wTpztimMel5mHVHhc+MZW+waM+Xkrr
	ZDBOtZngsJNYy6Aieo2i8FgfwtDp/SAR+nWA47kUDkWKiRiG80n586rKrd0ZxkGJfEyNyKuLYXL
	gM2mynvse82+JJ8AG5+yki
X-Received: by 2002:a05:600c:3ba4:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488d6847de9mr87734405e9.5.1775919488826;
        Sat, 11 Apr 2026 07:58:08 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:08 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:33 +0200
Subject: [PATCH RFC v2 08/11] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-8-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=6j3v3mDrlDrlzFC6qKMxljaBySrCYlr4KNLaCiaa91M=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3Ekt27DBdU6rFqj7t7+P5ibppX97/M9BYJ++QMKe1t
 cS5WHp1RykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACYy5SQjw6zSF59O/F7VUOUe
 +/OU/g9BQ5HD823mHpnc7d+7Ol74Kh/D/+xT3U9uKKUnLRd+JfJ163SuSvHNMh6CjbmK5ltFft5
 p5wEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075810_857491_385B3F76 
X-CRM114-Status: GOOD (  10.99  )
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

Add capture stream to CPU_I2S_ENCODER. This is the final step to add
support for I2S capture following the recent addition of
"audin-decoder-i2s" and "audin-fifo".

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index bb3e0364190766ab4ce9ea3ebd313eecf220a244..2b6b94957b051976191d9b1e0dbdb4ca01ba2a94 100644
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
 	},
 	[CPU_SPDIF_ENCODER] = {

-- 
2.39.5



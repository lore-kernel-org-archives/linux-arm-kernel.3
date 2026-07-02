Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A61C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgDVuxY1KD6XzliacX6/nWGKC8dFyYuIdBWxcG4BfyI=; b=qdHrFpKC/lb3BrGKqotmAmN9cY
	KQFSUbtMK5eP7AcoOqxe/MIExqzS1+tdLWLvXVlsA7cAKfJMNZWtFac/zjAB03fGMTkBTb365c36N
	Syp1YVA6UdbmyZtVi6d/ugjcpsv5kCuSCxzMw411JEbcqD0LSvDlDz/K7EjQK5wRRM2iS2bWY6tLP
	aYJ4hXji2HkGOADKDVh8dTKcbm4TQHnzHLVoi3rKf6QuTea+OumBH5jINkr4YBTZkDaeD7MyUKnYA
	Of82SsCZKQBUPgcCFVOdqmidWvUEDyXuc3RwO2UksovzMe8jHwL33b8pJupi7DLnLsjdBSFQYTBP9
	VYknwvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF6N-00000004FC7-3ocE;
	Thu, 02 Jul 2026 10:57:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF6H-00000004F56-36nb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:57:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493c7902f47so2281435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782989816; x=1783594616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgDVuxY1KD6XzliacX6/nWGKC8dFyYuIdBWxcG4BfyI=;
        b=RTEFWXbnndFg6TcmHQLbRlwaxs8ECYC6R7K3eOYJ4WxNneWRCBadyb40pJZWPrlgLX
         7vCiGM34sezGh6DNx78dtv+bby23lAgnhFAMs0sMrnWDaW88Zb20lj7eFCefvIbIDo5m
         TlTom4R0gBoGOPt+vklzEF1RjYoCm9LkkjWQAc2T97I3tAoEVybvii15i8/pEsoQb8tt
         hSIILGv6eENVP9jrS08UYwm8reiz4cZheGLgXDINy8rTZ4k4x7TD9xshtwiBy+IF8/JE
         sFo/2ByPAOZzLKO4BgH9k1E4fdvdm+F1qvN6q+DDzie1IsPSNttGGZLZGKY4RNnUS0lD
         mDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989816; x=1783594616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgDVuxY1KD6XzliacX6/nWGKC8dFyYuIdBWxcG4BfyI=;
        b=YcO++jLGCTmk14rHvxLyZVW3zDbFOqDaCrDTBrWC/Go0euIuTKQzCYhafgk1ShVMH2
         m2miQH1ULeQ+Jw4i/to088g0Z9Zc8n/O7psSgu/MP6fdriIf1MRpmTXtcr719N0pr9Xb
         yBQH7nM3cWDGTgLLAYI6RLRu4CIZaByY4WGA/ZB0dSchpzxO2RW8WHoWEQvbVqpnQCGp
         26owQ7uhSFFB6fYhYljgQwz8LVMi6YGIJdOjn7j9BjyezWpZVApF329ornO2aMgpSpOq
         IGXPeunK6e80aPNhvHBLqYv5NcGVy6wd4B1AhUzXzqqwONlgzojh0ukNZIy6DJTmXZEM
         X+zw==
X-Forwarded-Encrypted: i=1; AFNElJ8gXqHi6akuZ7gWGGazeuc3jlpDbOjdEsQCUm/4keweqW5lKbuqdzVSwzFY+Wy1LVDB0MObl+8xvg1Rx/Lg01BX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr6E70iNWLg9AyCTsi9gZmwGd/DEw/fMmAd7+uhg8PM2XCUy/u
	LL6iNhLcIyEYSQJs6dR4xAPdW9drtDsSzGyxI6dxXD9bOcgmIEnddGAuopjfDH13wGk=
X-Gm-Gg: AfdE7ckF98G8omAQpfo5nvxUnMfLBSDKHIRuMGfcXNkTqYFNfT64iWU5OV30dp/Nq1D
	gDU9qY/obmc4YPE+KAbDqcp1PmdFPnNPVrWoIA71EQ0gYwjEQ4+rYSD5qoqof4IOfRH4rw61g4c
	+gonSfeCmfdFML/aXCcXdGsKtLPXwWt4kbf9dguzGRzzq5/E04RPTSsOwvuXjQY0Mw+9xkYlsba
	caDVkrpbhHnF48MEa1vHZH5ArbM1QILItqZlqp87/XS3Wmn1XoNIB1woKWR3hYYUzUkb/+BEOJj
	cAWBiNzhk9lfIAskwBDCIcbgfLEJl4ICiOhGn0rTcoZKA3ipSQOX+XMeqM3Bc9CgYmSkOPvJKXn
	92/TFWxF5o3pETFgxZDptpuwyUtWXH0v87OXcRl/1zm4sBIG/Baj8/0l1CodBTmeoCFBnYFGcfz
	QsSxy31EVLrQ==
X-Received: by 2002:a05:600c:c3cd:10b0:493:b7c8:6530 with SMTP id 5b1f17b1804b1-493c2b56d6dmr58237385e9.16.1782989816159;
        Thu, 02 Jul 2026 03:56:56 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372a31sm42649685e9.13.2026.07.02.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:56:55 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 02 Jul 2026 12:56:41 +0200
Subject: [PATCH 2/2] ASoC: meson: aiu-formatter: remove pipeline reset from
 prepare
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=4RUGcMFAUmz4WZn+oUeIShFgv+Faz7ysyRFbheUvpog=;
 b=kA0DAAoW3kuTbdE6AQAByyZiAGpGQ/Sgr43tFvQDLVWfktUEH2N4EZ4yRZb+Gfs4KRffN0R+h
 4h1BAAWCgAdFiEEBJfe+3B1JuEzYMlw3kuTbdE6AQAFAmpGQ/QACgkQ3kuTbdE6AQD5mAD/Qntp
 SFISL2mv7knxonSk71KphYdR6KENd59KnmN+luUBAP3VB++RaKUjr3VxQ0tqKnyc3ANTCrvX31+
 XLiMN8doF
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_035657_830561_F77828FC 
X-CRM114-Status: GOOD (  14.10  )
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

'aiu-formatter-i2s' already performs the very same reset in
'aiu_fifo_i2s_trigger' for all relevant trigger scenarios. There is no
need to duplicate the operation in the formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-formatter-i2s.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
index b4604734fe88..cb554c2e7ce4 100644
--- a/sound/soc/meson/aiu-formatter-i2s.c
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -13,7 +13,6 @@
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
 #define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
 #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 
@@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
 {
 	/* Always operate in split (classic interleaved) mode */
 	unsigned int desc = 0;
-	unsigned int tmp;
 
-	/* Reset required to update the pipeline */
-	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
-	regmap_read(map, AIU_I2S_SYNC, &tmp);
+	/*
+	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
+	 * trigger time.
+	 */
 
 	switch (ts->physical_width) {
 	case 16: /* Nothing to do */

-- 
2.47.3



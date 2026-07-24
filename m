Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BA7C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 01:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLZq0Oq4iriy5IZuUphLNLAdeQc/1NhQeDrqKXhuu30=; b=y/B1AOozBfPBuN7EYOZvura9D2
	7+WAXaB7QBeYJeTiCLYlkdSF+UVU7cXCMLy4kNqL+mrS1qHvJ+7i8tKo141tsBRP1zjGTdVB411x+
	3swQCfb/f1gxxZQxr4GOAmwzBX14nlrqfUWd/+3TGmi5T0TT8jmMk9uH50GDziTe4LRsSMdK36Ekr
	gzDsa88ZW2oyS/e0bcBtyE2JY4ihsxSuNoj7ZCS8z3djlLOEXzU/rwRpfJY6nPpsVN3P/ihhOi7lb
	Yr65QOPTLvWZeJPHDiuOrnyVV1PosyGr9WN7O6fd4ZgQuwWiggsM+eXz9tTtwX6IJSaMy+DIM/q8J
	g7Z1To+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4v8-0000000FLvh-2xTP;
	Fri, 24 Jul 2026 01:41:50 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4v3-0000000FLtv-0r9e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 01:41:46 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1353738a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 18:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784857304; x=1785462104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLZq0Oq4iriy5IZuUphLNLAdeQc/1NhQeDrqKXhuu30=;
        b=oiRq8fJRKNakDPIHsL+PcQnkspbDVxf+15gNsIBQzxTafhBhCi+5a+r4Z1YSyreWXS
         iuDpLAbQIenZ7VxAYzoPxP5ej+iv96OwtOThIjwjyiESMQ5LE5T5oXrFzqsq+Kbp/Mw/
         lzYfW2vPttDOHKYccWOtcCGhWLJInYyOCXGxxugWcAdkQ+okjT8JKS+CsVq6oZjJILam
         YHNsMAvxcTyBmaFTaJH2ukFxDfdR3yr5wYCVEJjkzn7ygrBSB7Xd5jdCWxp5uxbqqpDg
         YPevZa4Evp8doJnFt9GdIO1otyhD+2xzLghhl9MEHYbVBwiArzVU3qmQAoTvYwtqliup
         eU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784857304; x=1785462104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLZq0Oq4iriy5IZuUphLNLAdeQc/1NhQeDrqKXhuu30=;
        b=YdrOcZ6uETb/GgeGP0rL7CsSVse5y10YSVdu84UIU6qgcRZCwzuvFl8PsuQOWE21Kc
         6pOkF/B/xkRFPJA1VJadUmIfZDUVEnXl3sgeFI6hdi0HY/UmI1svPEaTVW1loO5+OkU0
         Frx/qgYA77059z+2gNN2yYpmLiHV+H/n53K+tp15YhAmuSI5FUzRucSM9g02qtGbbQtc
         lXYrzv4GbJBFmEucz5oqrSviFaG/w1vnvxFKCbZjeTyV8E+IVJhqbMPUK++FS+/vqaB2
         jRvaEUvF61vJ26EFA5ZNpJjcmkSIGmYzydav67BlYo7PDwQr/Ar6ZPXYMqg1pBBT6jWk
         ygvA==
X-Forwarded-Encrypted: i=1; AHgh+RrORGFqRlByaflkBHavZT/BVoQluRAAaejLIa6xWE2G639L0DleNrG/OFdUXO3HqDeJjBYks+PqjgKHbhJ/Dt4L@lists.infradead.org
X-Gm-Message-State: AOJu0YwSNNJdFT0rfPtFe8SmwSCT7/96eqQciEY83+YZSLZSEomJ/nyE
	Mbj9nmewdTaCIT/qBz0hhWK0Qsdebr/453fgz2jrfrC/OZfFU5l5PY5L
X-Gm-Gg: AR+sD10F+MWycG25wISoqv3fmGj3EI7j40UOOclEaw7yCWW+m0w9kqjazNCTmTtBELG
	uHviMQR4+mFQOCzY3LIoiDw10dNsRWVeatwlHCng2+5ptZ+YzTuFlxtD0V4btlokGYUlhygCmA0
	Sgt0SEEgCY/5ilpU+qeXcMz4Z5YLtMPQs6zXkmC+g9JdPHOFXR2TXwjpPhyAXunqjJpoUFweqXm
	ZHfRmdVWNly4CaC6S571t8pzKqFn/Y56MDGQrvak27sxfLrMpsUEN+iHhRc0Nt0Y7lNWx5gG57o
	em5IWG7KGy6q6tGsKx7AnSlYXxBKTmUSifJbwGM9ftg8OwHlZVoG92d6Xy0POcG2VdlqzMOJ8+y
	PvannL3kloNsAtg2uUeOtmQdIpv2sPYokQbIPMc2ryVsKrmFxFAdApTDl1qMfaMgi4RNojBFAiE
	iO+OrU15QDC78JOAFE4bgaHY8ovPmLoT6QUEAUCebGjF3k5o6CWJ1tqygfC8Y4f9aOtXqV3bEJU
	g==
X-Received: by 2002:a17:90b:57e4:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38ec6566203mr5592434a91.23.1784857304339;
        Thu, 23 Jul 2026 18:41:44 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm647015a91.5.2026.07.23.18.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:41:43 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
Date: Fri, 24 Jul 2026 09:40:38 +0800
Message-ID: <20260724014039.1239552-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724014039.1239552-1-a0987203069@gmail.com>
References: <20260724014039.1239552-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_184145_249664_91969796 
X-CRM114-Status: GOOD (  12.17  )
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

PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
The hardware fractional field occupies bits [31:8] (24 bits), so the
mask must be GENMASK(31, 8).

The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
as the denominator to obtain 2 decimal places.  With the corrected 24-bit
mask the old divisor is wrong; replace the arithmetic with a proper
24-bit fixed-point rounding to 3 decimal places using the kernel's
DIV_ROUND_CLOSEST_ULL helper:

  n_frac = n * 1000 + DIV_ROUND_CLOSEST_ULL(x * 1000, 1 << 24)

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index bfedd45bd04b..eb9d69d2077b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -48,7 +48,7 @@
 #define PLL_CTL1_PD		BIT(0)
 #define PLL_CTL1_BP		BIT(1)
 #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
-#define PLL_CTL1_FRAC		GENMASK(31, 24)
+#define PLL_CTL1_FRAC		GENMASK(31, 8)
 #define PLL_CTL2_SLOPE		GENMASK(23, 0)
 
 #define INDIV_MIN		1
@@ -113,9 +113,9 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
-		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
-		pll_freq = div_u64(parent_rate * n, 100 * m * p);
+		/* convert 24-bit fraction to 3 decimal digits, rounding to closest */
+		n = n * 1000 + DIV_ROUND_CLOSEST_ULL((u64)x * 1000, 1ULL << 24);
+		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
 	}
 	return pll_freq;
 }
-- 
2.43.0



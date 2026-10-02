Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0236CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJOT7+NCf5K/5kFKuz5HB9vHPxvovBR55Pk8e6dUoC4=; b=oLcnwsu2xcvTqjEsyQxxwXeVHc
	KZv/JcUSdgDUyIZH71CyrYT+PzGAx/+UJ8HI89Zoq8zc+D8co/e/d1saGlmYMZjx7c3TrSvUAWjI4
	aSnSdT/mHH/stRjaEVjnjjbec8WZVD9TjXvvN44pt5cJD9rcA0kZNkUpQh5A2/NY/2vIK3iC9HERf
	OzWQPfQJZl3pfNln123rjaytzTz+mU3TgbpPUNEyxd598FCNsGKA8BwF08PsS1drRmBX6AYjh8K3d
	KkCWzZ2YKCttE/IHa/+onW9QrfTqdNM0g3KmEKNNn5g39/hTdPBZMbEMs0qeMpZFLCnswMghdEUbv
	wEobuiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3Z-0000000Ac4x-0WlT;
	Fri, 02 Oct 2026 04:39:37 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3X-0000000Ac3Y-1dHi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 04:39:36 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d8fb334e72so30391885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 21:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915975; x=1791520775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJOT7+NCf5K/5kFKuz5HB9vHPxvovBR55Pk8e6dUoC4=;
        b=G68VAVMHjNxopoyznsSDu6bZptMABkDOb4aytnKvEEFWxLDQJq8QE/Wa/Xw5lP7nM8
         QlRWHrWn5B/D5KF9Y6f+1idkaqnbzwu4kbc0Uq0pMzPygQTK/CqsqdApP2cnSRxAahNz
         pS6b6iEg4GKj/J0BgWQeY8wMOmrKXaV3dVmimxhIH6wnLFcx88hrXvn12Ig3ovw1ldbY
         EX7dZhnkbGWpodvCZ9a3OK4nebPxvOOu3xcKtLt2L0R514i4xAzjCYGQw3jwpAvggK//
         FDFVRzu6KNIvD+VDjOtPESprTAtHe4vs7mZvLYkwu0lBhUtf5oMhfERgTsWddGDi9Hto
         uYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915975; x=1791520775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJOT7+NCf5K/5kFKuz5HB9vHPxvovBR55Pk8e6dUoC4=;
        b=QBwSw25aoTWJ4uWmvOZvcaSo1fQFJ1Bijzw9Lu/tdF8uiufzt7uq5UX7nj4QZxEOy6
         +c6xZWEHooOhQ3yUz+f82neQhgjCOsxFtSjf+j4rYppkuQNv1IKM/pz/H2dx9KwF7LIs
         HLKfsZ3qstoPZndWQmkRDXG5orv5EvbTPJ4tTF4tTbEi/RwbeuZ99JqRDO1lgSU5SqJz
         WIjJSLjHe5k8SMb+2LAV31qJEoHmM88Mqf13hJvDhC4QtumtZ+iiGD/q9fEBfGTNIPWw
         GcA+Zf9d/arJyjfghl4DoCaI00OO1mU+8Qsx20dOVWhvMBP8kut3zZf3kzolQJ5F/IZf
         jNWw==
X-Forwarded-Encrypted: i=1; AKwUvBwTZ0g+kc1sJvbfBpfHx0jw0xyYHqTIoomD++HW9GcYtmE1oWSYUOpWC00sw7iXftnD1xL9VOqQayJsaRVQQkxd@lists.infradead.org
X-Gm-Message-State: AFq9FYKgoU6QD6RU51cHwphAJsIp2OJVfUzP1kWfGRNNRpWdzMsWDs9f
	Y2TVHLXJunWKP1VJ7zGMcnM4TjZKARJbYNAuE0aXSWFSs4RUga/0qFhT
X-Gm-Gg: AYBFou3Bs3nqi9+bI/y4K0Sxk4V1q3uIDh11+qKjuhbEObv7Z+RDZ4C0R5y2mayw5TA
	pUs78TCwfucq7QLjhRKFByVoX4ulsq0Sv0HwMYknP1Nl0Jp1twtgBTpB0VjaKmweh2Jg7Ypmqrt
	SZw46qKVGR9NltZ6oFjdrYYoKi4BvcqfGeH3pZ5Pj4f5gPsVU9bfMcwrfNOgSKtiGM+FjSQhYfv
	UU0e822tLS9GXMYK4mBT3leXEB+73UHi79+kQbdOWQBJErpPmUBymh6t/x+q0N/Pw5g5WWWC3wG
	FdvJofLELmJf2/3XPkzwyYUfUv8J6nm9ZUtQXPgkYFg6612i0ww3hI870jWsyL4IyyeapQGzqve
	1q+PJXm3DHPr3qyaYoV5KiEY9+nO6N4M0cPUF60qeoUTWhL0TC4DbpwlsWq1RoQU9ZJhTW2wGdP
	IzqOmKRArxUpgoDzFBBPnnbMNkqr1r41mnIfQ9opiGu529p9JogGOIULIPyWCufdEx3xkcVSp8A
	/z40cwWZGthgZ4Mv2QyRE+jedcLuKJSYVwjS/QJkHXa/Dzi3w++t+Lo8xbtd7C7+ILiVojQcV5m
	QIwz/dwXC+JoQQ==
X-Received: by 2002:a17:903:32c5:b0:2df:b047:72d8 with SMTP id d9443c01a7336-2e49b7ffbf2mr13420335ad.74.1790915974574;
        Thu, 01 Oct 2026 21:39:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] ASoC: atmel-i2s: use optional API for gclk
Date: Fri,  2 Oct 2026 11:38:54 +0700
Message-ID: <20261002043856.97295-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_213935_482279_603A175D 
X-CRM114-Status: GOOD (  13.57  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The gclk is an optional clock according to the device tree binding.

Use devm_clk_get_optional() to handle the optional gclk directly.

Unlike the existing code, errors other than -EPROBE_DEFER are now
returned instead of being silently ignored.

Fixes: 73ad0df57290 ("ASoC: atmel-i2s: Remove unnecessary audio PLL clock (aclk)")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index c52d048449f8..6ca230f8adc8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -670,13 +670,10 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	}
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
-	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		if (PTR_ERR(dev->gclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/* Master Mode not supported */
-		dev->gclk = NULL;
-	}
+	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
+	if (IS_ERR(dev->gclk))
+		return PTR_ERR(dev->gclk);
+
 	dev->dev = &pdev->dev;
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
-- 
2.43.0



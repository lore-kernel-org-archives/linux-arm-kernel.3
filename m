Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C05C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwl7+pllkWzrn1RgXG9uolVfkLN1JlFHNAzydC3b9xY=; b=1S2nVFf7pTf1TcJYnzLQJk1iBm
	fJL4VIIV/sK1R5OhfQ8OXBNAuIJPhglrwKoVjEd9khJMXl6dtyGsPMR8jrLavK8M0XYagwrRv6GZD
	+mRSFN5l0ywMd6VgOfkDhtkdhZMTt9Rs9o9IHsFRaWihZ265aSGEQzpdNusIf5RYI0EGLkcDXoDdv
	Ghad4KEsQiVmODhKNLNH4SbDY9UUBfeCXrVFS27vbdk+tSZpHhhI4IQ9LN7XHv7CYeC140Tjxs0Il
	OSvIempbmkiLRRzjz7mcQvFL8nEejEdODWur7TyEOHoM1It1T9p77ufsAbXTn3meldBhH4bgjTLHr
	zqn95q/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Zr-000000000kt-1Q04;
	Mon, 03 Mar 2025 08:55:07 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1N1-0000000HZIp-46Ck
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:41:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30613802a59so47603551fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991310; x=1741596110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwl7+pllkWzrn1RgXG9uolVfkLN1JlFHNAzydC3b9xY=;
        b=L36HJcM+WmZuYL26E17abc2AUelw5mHfinjfQ6CcEjRs0op5TSuLwrJ71yx1E2a5EY
         /gZDZdMjN3kr8qUG91F6ZDNSZCFSDMofThM+Y2oJoO1TDHUTwE6wWG0Hp6xvIH3H3ZSk
         CvFWtk/nabY3FwKdeVKwDQVL4frFD6F+lqHF9vXy1ehOcRcDVRChHjHYdD6DwLxvaa88
         YZHgcOLnBF0fNO5OU9ul07IuqL0fRbFLWlLzJWklliWHWYsJrkd0d3Np/5XxS+I8W0ub
         7IR9D63L446dpWfGGxD/gHJAmbQsGfBCtrpPdVDS0iZBNZ0Zb7CNwZaQ1PVYZk/uulmU
         vdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991310; x=1741596110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwl7+pllkWzrn1RgXG9uolVfkLN1JlFHNAzydC3b9xY=;
        b=m+d72sri36Jw7q1veyNKuQDa2L5T1ebFIMrML+9gwdbsHpwgR1qWD0x3DyJfSaQh1J
         w7RTZhO1jHgJOgCUgBbhRl69mUw9LESpPbQBhcHaY0WEesPF5tGEOJcKa46MUYnhw5UK
         pVIA+rCFx3VCYaXtEAbxo7ClM1V24j/UOm3Q3T9CXlDtsB2GTzbtrPcdtvaogHMdkEwO
         KI0q2W+lmqOfiIfsWZDuIw06PsIcwk8rh8sHJ/2TNdpDSvaJ/heu6geccckWDGlcRgrQ
         forvkhT0RDUsOiLBBwF2StBfx549V6Yr/shDSVQBvt37KfRFEcpeBsuz+pd5gUqSQaPw
         XkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5X5eeptIu30M7vlqFHvA19B90+1Rzkxr/rAYLu3laBBBglFRTbos3NpG41MtlAWoop26dN2W51LjEqYH2uHaD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9h5Ij/13rv25o+bX35Iaxn8VSEA77yURP6qme/qEvylL8sYNz
	Hq6T10jIShf/HYiYtMgwyyPoYNJkoDNP52TXv6JLqzVHhWYJI9HijXU/ne0q6oE=
X-Gm-Gg: ASbGncu4hvHj6HseeEs4YRPiNoKxVJsqNhTXqUSggW2+ZmNinj/QodumKQEQjDMTRn/
	3ONjjau/Cs+u1EJ9bn2t13lRKLEWK3y+xxVVOlwaHEgrmDWFzdzXigU/WL1PSVS/hPIvxzLqCFb
	GY6PMRzFBMUgLGqLHPTDDGY2zwFDv3/f8QHFC6VOt3tp/RvHEDwGRkaWV9GzK07L2e7DulWhMhJ
	dJDMnJaGUxOA2VjNwEymQmEupSSBu6SldEcqbvSldUiDbvyBawSrZsAWusWeGPJeWP5pp9yCHlG
	5e1t3jhyQXR0E9QirS+s+43zGepkvOca19vDlRxICW35UdG0T88mGxs=
X-Google-Smtp-Source: AGHT+IGGU3RCEseQiiJjdkvq8zg4yqcm1ewTmddMWoo37YSveo5ACFl0sVfwHB6fh77iqxJDQ5B/QA==
X-Received: by 2002:a05:651c:1541:b0:308:f6cf:3619 with SMTP id 38308e7fff4ca-30b931fb851mr39880601fa.6.1740991310492;
        Mon, 03 Mar 2025 00:41:50 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:46 +0100
Subject: [PATCH 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_004152_022762_B06ECF4D 
X-CRM114-Status: GOOD (  10.87  )
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

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45acf9a28720fdde158 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -6,7 +6,6 @@
 //          Sylwester Nawrocki <s.nawrocki@samsung.com>
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.48.1



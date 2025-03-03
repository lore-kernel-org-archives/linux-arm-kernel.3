Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA09C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyJvoamu1vQ7QlWJuNua8499N8G4uM9VfUW5xFlMx0A=; b=GHlJzuMTx0PaWsnYv9NCqMYsf4
	v+3UaafTrboDyKQmiWNie9EIv9A1PymX92cCRamg4Ad7yilEBGbsqx+8fgBjNINBb9k+dorc9isbA
	DwcdTZT7VfDldNfp0C7FNBjakKbIpwVtu0jZGCb4tbU6AhK1VwqRuoGZUQgz24raXgfBbSx5VQa/H
	oiK2Cu8UE2UyuS7iwjcshOHHFrL2kxicuNZ/z/AlKCVMueyMefyJeyZraiNHHzETaNfDcuXqyIc+C
	af7ENB+QMKKoq5UARz8GZohfGEZhqRNqz0XNJ5pRNvZfFUtzhscoxPh7h0fZkFP6qRaYqTyKt1wjb
	pAW+XHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1VF-0000000HawG-0Hav;
	Mon, 03 Mar 2025 08:50:21 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1My-0000000HZHL-0ll4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:41:49 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30761be8fa8so45324491fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991306; x=1741596106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyJvoamu1vQ7QlWJuNua8499N8G4uM9VfUW5xFlMx0A=;
        b=pKlXIW9gWfyqRZofnBFlXWvtef818bAGeubbSZ9m016+Rcm8idWpehMLcjtOX307r/
         IocWM/1HDyozoigFJD9q87hL9i9KFmns65bPNhtUqRuM5Rv9II6j3HugajvrJYCjdFYx
         sIe5EqsqXXIHfSehOkz/QD8hj11ddXqw5jyIQYH2FVjbYrjZjJsqRtgBHHyK2sXNEEfc
         dg4RZ0SI5FiLNnGSBRFLmksRBAog5LGZz4i7/R+b1uuZJ3TijrhHtcka93aBdAo0kpgx
         WL8+ciYjSnTiWc6WpHJRY3lKkthk1Cbiu6UVgOnpz0ZBgp/cpYRRxlft63aa1VJird3b
         q9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991306; x=1741596106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyJvoamu1vQ7QlWJuNua8499N8G4uM9VfUW5xFlMx0A=;
        b=L2Mo9uyqHhXzXG15hk4O9Y8Zdw8JXlwEYLMjJIXuz4vIphGMlX8bATYlU2lcLTZXPq
         gtT7uJrZAQG7qX/756ojk3E6mFK+cHx/nEJs/93fNJOHCBUtLjFKP3ADnpzcxRt58RTQ
         McJJXFAdkYbhHxJgbM0HAxv/m3N90rLaQ37sGy7uR4AWU5KK5Bpp5fCXAhj2TvR4BlZD
         SC13EE/21flpAtmRB64qzv2yvfPQJ18FWHur9CJ3QkPm2Zl8+hl8J1L/y31Vd/Le86rI
         93q3YBDV5iFDYKjTrzetJstXBsT3Aaxe8ZcJlWiJKxcKa328dCuqs5a6MrE4E3msro36
         cj2g==
X-Forwarded-Encrypted: i=1; AJvYcCVqwqxLUzHq12NJZr3PiYZI8L0K3oYU08pjYd7DDROKjJt5v0IKG6vtfEZPuFD+0c2PvpDlamv6roUyIRTNtzpV@lists.infradead.org
X-Gm-Message-State: AOJu0YwuWOCNi9HNUm53o6z18wpNlI8zZkXl9WqDmQBI5mQEQstSxijn
	CosFExw3ZtH5lVedbyiE1FPm350lzrnlpWaEWPek7yC/JasEoZE0cjqOwRZVec0=
X-Gm-Gg: ASbGncvAPs7656smQlSEuEFlfXcgQaWmmU7kJ9+QQzuqVYpsGvgVi3YMaOgXWDvOu+e
	wj8Cn3xfnQ1L77AdwN8boo09CVuAcKbHx+bygDIqVl1xTd67P/nD7Cr9yuMAgpz/XlY3aB9hoJn
	jBo6GKJ2+ecpN6yQ+IEbhSu/DWp9Ip7LdoQEF+IlZiQqBVPxYYiBZR2gtudGRUi2NhA6PD6mYtD
	CKOyBIhjQaTExbaY7evY4F/Kyxy7hkJ/mG9RUT81Q1PSRNpw/BpU4+c0NteYZnzkE4/o94+GtPE
	zylvsJcSqQXCIhJMUQN8S8qm+m0WGW6XdMGNgPubmTRGfVBQOfzP5D0=
X-Google-Smtp-Source: AGHT+IE7d1s8wsnrWzBD67JSiku6358hpjkfkoPXJoyaB/3LYLJ1ZI/ks6pTUv6jycEvlm+SBkMXxA==
X-Received: by 2002:a05:651c:b29:b0:30b:bf4e:f6fa with SMTP id 38308e7fff4ca-30bbf4ef932mr8626391fa.17.1740991306166;
        Mon, 03 Mar 2025 00:41:46 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:45 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:43 +0100
Subject: [PATCH 3/6] ASoC: samsung: lowland: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-3-56a2299dd928@linaro.org>
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
X-CRM114-CacheID: sfid-20250303_004148_223957_3A58956F 
X-CRM114-Status: GOOD (  11.18  )
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
 sound/soc/samsung/lowland.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 702cb4cc1ce9f07e55ddf9435b19c4691e0236e5..d4088b72d43c2295102d850197f8b9eac50d7120 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5100.h"

-- 
2.48.1



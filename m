Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB16C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9O2qXfR8B101GmR82kjgNZDoLonCMfebNSZtNGz6z3s=; b=I/XWX1Hpx7uEo5qdPeIY1DAFh4
	hN33hR0PZnS81l4Av0zhEVOA/rnlYJpDhLYcMoz4tcddFnHMXQVdu/WPRP81/e93YQ+M01oy97hZc
	fAJ+yKusb6Zlv53YWSLOdjLtyZH3CDQUuQfkZFYKqBuejysoh+MHUqYFJ3j2qjbr2zANOuI1FfHuc
	A0V54WWmTrsVB3cRUMSqTlGKlzXonN+eG1ApRRIpon7tu/dAvwvvUFUH6K49rGSITqiWFIDZIxpKv
	EYcQ0Ha2piy0txWpkCnVDpAE9K5US/0gky9viWyt7ra184ZUy5ey33cmPp2l3+y4xhpBfhrtd6a3l
	8TE9b+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjOk-00000007Gdh-404R;
	Wed, 05 Mar 2025 07:42:34 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjLa-00000007G83-1PEl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:39:19 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bb75492e4so30669211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160356; x=1741765156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9O2qXfR8B101GmR82kjgNZDoLonCMfebNSZtNGz6z3s=;
        b=OTvbewqhi58oNt7Oq+ITmXsPY2JNYhiwG5VkYRqMTuarU35DY3JL+0oLooCGP/f44J
         rD5Myl5lUH+VfPEoxHpXTWQUOgoAiInqN/PtwTeZUOtNuq/ZZuVXKrEOGbythBr9ijGt
         j9ynnjgTU8gZiq1zYppnV04OX0wNc1vJfuRWRUABl3lsIFdgcErz7dRyDcOvuHJIhxkw
         LeyWuFOwGPFs/hFmf8ti+OIp+TJMyj+k8EEHg5JssOiOTT/0/g1LdByThsBK9ts6jSYN
         2yp+F5jZ4T0h31sUU0fNBhyT1v3xdMqHnFTGg9OFs9E615DO5z+UYV7DRUzUyrRGC0P5
         FW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160356; x=1741765156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9O2qXfR8B101GmR82kjgNZDoLonCMfebNSZtNGz6z3s=;
        b=dHX+ugDT8XEGpJcsat/+RUk/RYoAEQifwB3/+Jj2erkaR0eG2a7TYMLpp8mfftYKVQ
         HMV6vq6xugOSOdIuIk5A0BEA22hj0XwteIofJ1dyCz7ck+2S/qZ5tjR9zSBFZE2P2PmE
         7OvkYRzghIFEOxrBkkpXaYxLSHeGReCn/sIlkEars/RXDNOilhvI2Noe5U4YFAW41zCl
         QCwPlfhwoKLqzSeyCt9qZlJGgud/+k3FBDUeUkDc4IN5vNynQsGIoLVFFTxxV7jv4gD9
         EKx9TFNsSGAh5iONW368MIL7Y2kXIWq23Du5UCLmeRKBQk5ozn2xa4DlRlm7fBzlaejW
         VzFA==
X-Forwarded-Encrypted: i=1; AJvYcCUVSp9flR53DiB9kKtgtIjGcV2MKb9IQtm0gV/7Hxj9r97t7L/QW9kBPBADJqcjIl2lofH/o3yQdmYRy4Rk56mQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxyjHSwme06IQqI5hLwX7rUh/44HcVig3Sgd7ydGB1XhwB/07OU
	PXcpQGqoaoNArPqlxoHhLoEU+6KdVBfKvq9KiWABWxvHgoQ3bg++lUkhM4eZBLfk0MVL1AkU44/
	3
X-Gm-Gg: ASbGnctAf01Q0ntaxo3no6KhJAIOjm8eH2NJtqeiiPI912c1PkDAJLelZQFG+qfDIOc
	KlPC8IUBs0jVCVZHssVmb+AXGmFDaUVHPbtvoJ68msTUuSpn83XybDVC5QtKfXkdkFF0YF+qfWY
	UOYmZ/rn5sz9lystmk9poiQqMKZL2lF037h47h5oOQgy0MOA/9uDVCR9U1dvpHK5yQJEtrJaz9o
	mU7+ycMo6tN904ZHGxOXeCd/rYDSmgiTJ71f8Ds2UqrV6Q80ujw5nD+3epy4Jv/YU+yRHK2C6Q3
	PPoOJ+GqMNR2HtO2aXTY7DEe/Nf6RaGkdZyq+p8gCmHJPxVqYKhow1A=
X-Google-Smtp-Source: AGHT+IHPSQp1sMr7Rrf/l9lcn+EQseF/Qe+jZ3cFqBGhxMioF6AUDMWmKnx6hoowTamZYf5w+OgQoA==
X-Received: by 2002:a05:651c:508:b0:30a:4428:dead with SMTP id 38308e7fff4ca-30bd7af5f94mr8944781fa.27.1741160356428;
        Tue, 04 Mar 2025 23:39:16 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:13 +0100
Subject: [PATCH v2 1/6] ASoC: samsung: bells: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-1-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_233918_379011_2C82646D 
X-CRM114-Status: GOOD (  11.74  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/bells.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 365b1aca4855c885e0b59a1101475d8edb86374f..b4c0857ae35134b58a125b0746af07a5fff040fa 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5102.h"

-- 
2.48.1



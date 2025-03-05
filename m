Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7162CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Xq6WCZuy53SY6E5JRkLaEWKcw/1LYZzsuxTVSWOWMU=; b=2xZqrYGdOp7os8tryUzATpMDc9
	bNX8l7FXPXq0QT9x5yC03/PkwITVW54TVS/EHgB4yFLVcJF4iuxImMwJtHeUVxPq4SGQREKINhd0x
	3cYJSQ5CkQaGU5fCyTV3btOA+adF8p878ITsjPkqrZmV8oGnjj6mk5W7pwfE2zg3xUKwVrhe1YquU
	dl7+mkqI+6pXbMa6CnHYJYVlAlVO2KbQ5QmL2EgcTFR+cd0NN/FbZtq11Y7l+cEcaADYw7bKx9oXd
	fEY0JXbhILr/Cw/ByP5+xIJE2ndDaKmiQBJRDxP9vSRb/CmjxOySuySY/Zl9cKu5DKfSll/UMxpPM
	kTA1WQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjV1-00000007HY6-0cfJ;
	Wed, 05 Mar 2025 07:49:03 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjLe-00000007G9i-2ok4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:39:23 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bab0ad5a8so35605501fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160361; x=1741765161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Xq6WCZuy53SY6E5JRkLaEWKcw/1LYZzsuxTVSWOWMU=;
        b=k1pA/NtLukQNHCZp5c5izbPSV3SnrwQPH3TFIKPve46dDO0l25KPrdfs8gb3jh345b
         eO5ysgiVrkxWqdZn/B+meMGG/LePYuD3RHwc3aOG0YfWzjuDkuWh/mIR3JnQiwkmYAoy
         pNO0xogWodc1yLoLIyOTai4hVtI3CvVqYgRgipob5XHLjLqb7uJi5H14lIuUwKJvAE/h
         w6HgrwRaE0CheVMry2adDYJUgc1qGJcVy+g3OMAVlK692qlKQV0Dd+WyeikRQitQ+J9m
         X0ndJvROiDfMEYX5deXWGgPmL1TRzj16gOhXEVrFBmh6dgFOi1X4T+GQHL/G/vH9+qVP
         82UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160361; x=1741765161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xq6WCZuy53SY6E5JRkLaEWKcw/1LYZzsuxTVSWOWMU=;
        b=bVNKZAo9wKvH+2mdozTKpJ50TrwOTvG3twbA4F+5eRGZTkxbzCFSOJE1YOKp1BrYsV
         3dAfHOGcPezIEgGUZSEAb/TDwJdSm3+7F8J0qw8CMgr3lvJUfs5uybJs0KrUZN0mpv1a
         te//9h9m3Qb9OealMrBpqdL6HgpOGL09dOLNvkcZFdEI1g1SYqkh9WEZ1RBURUGtsq8A
         dERtphrYNfhqWSH2diZzNrqeG/noQIpwo0mtrYU/+uXuSSpJv+IXwR8DUsBuoNDxfuWO
         JG1djNG41EjkfiXpwnFaIIWBbFgQoo2v3DcUlgNu3TBRaP8N2OO28FDm0PPkHkYcbLLq
         3T5w==
X-Forwarded-Encrypted: i=1; AJvYcCU4+6RMNfBfKwgaBRvElEt0SrjP1ErgpfKN9y3lFY8kYUj6PykZHDd6Sc/Xj9hh+mbRyeMJc1ubG+rm9YoHgynu@lists.infradead.org
X-Gm-Message-State: AOJu0YyR95wYoqFni01UkQlldzgBdW1mQi/NVb6AE9Pei3jSUC2y179K
	Megrg3Jibn5ICivxY68JCW0s2m3/SvdD5f+4Ktnbfcw7/83nIW5ErEAM9SIeSXQ=
X-Gm-Gg: ASbGncvAuF8Sef7pnm/5Ax0/vmv80QBCjS8O3q7Fkc9GuiM8X49zfnvoMM/MhPgbG3r
	vndRxYwhqiYWusiN+zWPhj/C3BpXEBV81hnf95gFqpWJeJBQ9TbWm2/DnUzfCbKiCQ9JS15FBpM
	ZEnzAXxlqfqV9tHy6YlMHU6BPOIMV7P0x69oAzxpNXG3bqHmeT/hBcKg5iVKO49hc4djGImz3P9
	+1IEZW/W9gW+FcOjgq4V4UPgkGl2gRxBjPshmMs+bPA9JhMRa2YRXYSbcNf25RvUsaz5MNQKW0M
	tTfEGoYGrc6fkcgP9x0MSW98vrhA7w4K+vcmXT5vke/tNkoYtBUubY4=
X-Google-Smtp-Source: AGHT+IFuOFGm7cWUgm1XubEB6Y5DzlSM0d1dNuDSjZteOLgYTKgJYxkyoZBk7U8n5a+V22Y4944yLg==
X-Received: by 2002:a2e:b888:0:b0:30b:cd68:b6c4 with SMTP id 38308e7fff4ca-30bd7a4f493mr8310471fa.13.1741160361110;
        Tue, 04 Mar 2025 23:39:21 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:17 +0100
Subject: [PATCH v2 5/6] ASoC: samsung: tobermory: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-5-20bc980c6445@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_233922_711826_8267D30C 
X-CRM114-Status: GOOD (  11.75  )
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
 sound/soc/samsung/tobermory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 2bdd81bf821a5b9bdc56479bb2cd5d0089fab339..bc2608dbaddc4feeb9af77639699fed89540b44b 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8962.h"

-- 
2.48.1



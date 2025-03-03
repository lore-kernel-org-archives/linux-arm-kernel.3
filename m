Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C886C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kmkkrf+ULKLb1rk8K4EIvV0fKSzN/tbTSC+F4L4NGxw=; b=nKZnRfdvBzhAmEY/8qo6w0yVCe
	4C50Lje0UqtR8JMFz5B55jg7LQUNMiv9hRpuJzeF09qv9IICzDQNhptCQ9hKCL8cYbXvO7N8htksV
	iAZYBn9euhHSdz1D613seNb1YyyCQ0VwKicrbVbZV5Wfb+rYkjGw8Sv5y4smRdraR8owUNkRjZxdj
	JHzmE87+Ydlyq8urQ4VMSy40aSglCG32cHZ6MMajTgZM0RHv+GiQEG02OqiHRiLsIKu4QaUjRnXld
	XZF5KjJN63h5g4lWRHz5O9N2q8e6zq81eWZrlja60Sk0u5SDKQio/OdPVnrVtRi25MKuswmQqKZHU
	PyaCwpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Ti-0000000HadL-1dpf;
	Mon, 03 Mar 2025 08:48:46 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Mw-0000000HZGe-2j1m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:41:47 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30737db1aa9so38935571fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991305; x=1741596105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kmkkrf+ULKLb1rk8K4EIvV0fKSzN/tbTSC+F4L4NGxw=;
        b=mqEF8cWSSPmotBa+ap5GyJ/YpDCNvbKaEiFxcT/IdFaUCa6TzNpg3razRNIwbCqIZw
         6z7noEqDPohlK+56NNN2LhDd45yP48xueQBAatwS7Pmosf1Iz+uasiqRaixkLt4igP7s
         S0IPfDON9qC263Vrw8sjvp6KZmuK+VQXVoSRbAK6CiOYq2B0SasId3gOyxdwEX5ewn0g
         5r4ARcpXD9ZVn6fnmLQ0NWlbCjN3GKFf1ntk2ufoT1T+8MCOKIybaYkigT3iOF3jrOIp
         BJmBxYF27OXYMI00gYJuupI5jeRzFgA23n0xFueqheWX7TlptulxK065GlhQ0fkItUKW
         1hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991305; x=1741596105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kmkkrf+ULKLb1rk8K4EIvV0fKSzN/tbTSC+F4L4NGxw=;
        b=WhsqAXo8M989bAkBIWfqg/JpqS/NHjpcpAwR9Etb4+3aggdAP0rM0XEtJd3GQQ0/3V
         7zRh3AL9pY8U2/YYHJdTtyHcEdG4FBem4q/EiF2afelUzTzf1NVRCOzL/yLbfaIDzUJO
         YcX8YMrmdc6jra7NAsSO0ugwJN/iMylNH+7EnQwSWMvR77ukNF5bSJO5MuaCJQ+8OySO
         70SARix+U441A8q+hqC6nUFfl1fRvZhAgiv6S0APK4xC8zyLb2Ak/fG9OlWwNdhnquAx
         3XCeBSc8Tgs5ICiQ3OMjhQExkL3Tlb6sP7Ki8IgSHciQsTgD1mbQ6zdlS8X89dCcWQmp
         2Dzw==
X-Forwarded-Encrypted: i=1; AJvYcCX/yvx8uLBD7BOKRV0uJVZZ3DaEC8bqFkoz1RKCycNUvvn/6fPKNp5xhL4hGrqmlRkYPygS/FarWfNFBvMjsOB6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx74jAlq10cC7x4NKVPV2GlPbYUf5r5NJXYhYhYaM2yGp3GRxFU
	3veV0vnfsIYiEzdoOHLDnYCc5dvXx9IGVEZXqagrUeIXqPQwIuaFCFHxt7+VWw4=
X-Gm-Gg: ASbGncsD41lB+QfH5W9JNgWYA2EmMpebaN5JCtaPJ+bTAjPx2MuX3emqd+3jwF0DsWr
	h5QlQd1cbdDCTvUCpt8C7zIfvVjlqfX1OMTqaReDU2V9WN9l5kBaJpl6VHHPhSsOun+wAw8UL1f
	ID3q+90jz3ffQInJ46Xa8Y+NJwRoHZDObD3PtRQDjERL2mgXZQGuH45kdUkPJ3rW8A3LA1a1wi0
	nIvVMYG2mCHuZ6crJjGDN9BUgoFijQ+kEgmPEVCgNZS7/GAV2oYoyGm0V0FcmZ4EKoB68Mx7APg
	KFFzkaYy88h1cJjCIFQWITD5p/mXTk7fh9C+6MoaAkcJ+ZqUy9zQEk4=
X-Google-Smtp-Source: AGHT+IEf+WBH4U7D1mLtWBRggy3cAAJWEZH/7SBq/nZSNOR1wS6qXstBv+1295UUt712TMSOJEx8AQ==
X-Received: by 2002:a05:651c:400f:b0:306:124c:69d5 with SMTP id 38308e7fff4ca-30b9345fd1fmr33846181fa.34.1740991304639;
        Mon, 03 Mar 2025 00:41:44 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:42 +0100
Subject: [PATCH 2/6] ASoC: samsung: littlemill: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
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
X-CRM114-CacheID: sfid-20250303_004146_690600_E574F738 
X-CRM114-Status: GOOD (  11.08  )
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
 sound/soc/samsung/littlemill.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ffdf499a3eeadfbaa 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8994.h"

-- 
2.48.1



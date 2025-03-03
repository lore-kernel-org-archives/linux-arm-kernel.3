Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9059C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9claMY/sNtDyulRMPNNacKp+7WCrxALqvfdJWL7Clw=; b=ruKeQLhUeU7hxE65pW4vkD7+za
	1mB55qiXESAvDXjz2u2G67091IF0Qn0tW6NPurS4Jxv5BTbExPC0sy7rmkVXm96I+kvk04bFRczTi
	aGU4EcBhL6HYaSxeAFwonMzewabYdDcWXqVokSaIvIE1UaQ9zdYMPtKyCeozf7edImdqGyJ6duNR1
	r36XCJQNvCTPT7uvpEHFKG8veFYXU35RIYOBqR+vEL9Wja35J7vSHommUqsABSK2KM5EfesEP9fXr
	0FFhSVQgExjZCizlFzmumHWf3ddNvDMiWqbbc3JySuNvNO+ksXcqhXC5qe6agIcFyQ8Z25+7/GTKv
	nHxLxm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1YJ-000000000QK-2a1Y;
	Mon, 03 Mar 2025 08:53:31 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1N0-0000000HZIE-41Bz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:41:52 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so35704781fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991309; x=1741596109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9claMY/sNtDyulRMPNNacKp+7WCrxALqvfdJWL7Clw=;
        b=FWCmiQgPeZXnDOtbwfGLURXMhb/Qv7PPAWZgUUlpeBUdDXw/r0CpsvPcon6U2whpht
         nBqiSJU9XMBYEmDLvu8wabIZG5gsgEXESslZOotVMYY3QJxsvW1WYR+Am0K/9FDcvLiv
         1ZUIWLrH07+fVWK4O6iQRouPMDKG2sz+301aYa2AncDR3wpGHFZO/+rZ0+W6QNUZfHir
         x6egkpg5SU2jUkBNHFnOcQI/dvn1PXLEVoixea7aZ3RnmH0tJpYUVtHWtXI0rNYRgZ7H
         l60cm8gh3+uzbo4pCgdYlRZqgJiQh8xWsF1LyJXX7hIgeQcyBgYkmgMWV7R/kKRGhQfC
         YYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991309; x=1741596109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9claMY/sNtDyulRMPNNacKp+7WCrxALqvfdJWL7Clw=;
        b=W7DRcuZXDLeRW2dehwl9WUqSbX81qhOvBsQVEC5dnd2d3oVxOos92YwGAxcMAkuVjM
         Sh30ojenvIclTrr8M4OJWrPL3g299Ys7yhqOuZqnmZuvQsMldp5lTqHH+i40r/1IPJFF
         UbHCIwM/5xLTHLgXjtPeP1Alwj1zgyiJ9LS3KsGwXOQKXeJN4EpE4U2vWF1B53kUNR7U
         oIiVM4q4Xg5S16Rj0luS2ExPaCWiOstTTgItCXrVvgMmwcLQKtF5CEAGT3OATCMCq6aj
         lXlYLT5+kElf67g9DNDtzuscXlybqYfa89qYo3Z3YdUlkG0WjNMG6Ebq+0/7GIYiyFsa
         oZ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhp+CYrWD9VsrxMTXTZ3MkMAGWojPA66kY16GkZ7BbJwn/R7EVrsbeOJQzhekZ6D3Z7v5SUB4VHrF8zwYgU4Px@lists.infradead.org
X-Gm-Message-State: AOJu0YzDLGm5hO9KL7UD2CZzfPCtJp+o2NfDrFyJ/NyEFiG0/vukWwMs
	UVetwwzs8gI5eT/1zqlTVnQ5/AFZzuWiMU9lzZGCnbaeKXtJT0DOEUtnWvYl9X8=
X-Gm-Gg: ASbGncvJS/uTxO7zO8q+w+DB3U2Li9RmX0lmDBiEGOgW0WBFbwU/1KjsP/2RUs0AeSp
	Y5lBxvZ05S04u4vwFPFyC7QYBE+/vRY35Kl9Xo2EUtxpGI04wPh4NxGJdtQ85SSUArpv3EM5qOc
	hng4yaMng/s9UhoFZDBSe0uHiLCIXF/usWqX9+B1/N5MbzxKs6R6ueaHhAU6+hOmHl0JOle4LOK
	K2V+N2GMoIrsVWpnCFUmuRRhjfxgiUb5HL7zkRqCH3QdVHNS5EnzHc+jssOhlvqWgVgS9e+uZBr
	QOeohQXYfmZaY8MXPA5CvNBc3X71+P3rN/yzg2ER7ZKXxdnU8Aj1Elw=
X-Google-Smtp-Source: AGHT+IFlG0cFLlp/U+9q8TUe6ZVM05em2vtvWiVqlg2cfGZLyTmw4b771FRJAKQSUOIVLv3jJxlrSA==
X-Received: by 2002:a05:651c:19a2:b0:30b:c6c2:43bc with SMTP id 38308e7fff4ca-30bc6c24656mr881241fa.19.1740991308967;
        Mon, 03 Mar 2025 00:41:48 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:45 +0100
Subject: [PATCH 5/6] ASoC: samsung: tobermory: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-5-56a2299dd928@linaro.org>
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
X-CRM114-CacheID: sfid-20250303_004150_998433_8C33665F 
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



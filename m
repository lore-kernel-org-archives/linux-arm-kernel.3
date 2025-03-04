Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2404EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3K/LcKqtOkyKdbJPvYlfinf1m8ideZSsXyRIMH0tEQ=; b=nIa8Q2uPaEpK/GZe2mvWdNFkGt
	4Gn4FaNKEhNVumMZRjoVnZvhqgu9PYZvs63Z59Wg7dbwuorpVmC+yZIkGiVLf/gT/hlvAHrgGyTMk
	MM5yTEgLsURuqbnTgZiqJt2444J4SJlOmB3FymthXrxtRlYS9+w9JjZk3/fqqNCd8PXofrqxKn76y
	TCds00T9Q5gX3ePHI60uonhXgOu4RtKzJvCh4yHiGSsZ8j7eDUCzB7RVKa8/iq2kNO1es/v936bp5
	gw4J5bSTN36dhUDF9rGufVY168bhNZhd4DiuX9GlLa4EgpFypKcpV1+rh9d5N+Dm9JyNC9dEhOlhU
	GmkcSung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPqW-00000004Glz-0xGA;
	Tue, 04 Mar 2025 10:49:56 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPj6-00000004EXJ-3M6S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:42:17 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5495078cd59so4238429e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084935; x=1741689735; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3K/LcKqtOkyKdbJPvYlfinf1m8ideZSsXyRIMH0tEQ=;
        b=UFC1FUv0XlqwClamFTj2kNsEkOffRmCTRZlCwJxuzISdMsoDU2teKs2CZghe8mRwkM
         smGZU2/cs46GBvnp4S9SOZ+FCTmDSAZfd5DvCd4xycjgnOsxVi2fYmBmcXV21pLCRLbh
         lBAV5RdeXsFQQOyuPNpWQkBPFYNik395nQq1Zc64t87nB8RPzPfTuhnnVtwu9Q/lrD0R
         ImY7k8n7Bpfaw0A+vkU6I5QZLwDXOwHfjB3ptYaL0t9oniQ6mx8KNOFwK3fGWTBUDt5R
         AikYGY7W55m1rX3X5PjojFgACtGh4cW9jSOWvVlauP2RlaPclJfu91k5Svz2u6ruoQi/
         9HOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084935; x=1741689735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3K/LcKqtOkyKdbJPvYlfinf1m8ideZSsXyRIMH0tEQ=;
        b=MlWkOwUXKaNg7mu27g4U0lJbshLvajLLaYFHYsVFbm6mESj0Os8t/UKaXg7QxHv+OE
         KAw9fet27Xn50svmk/ZR5MnwkmDXBwYnI1dtoElIWOT2w5rapkOnUqXvMv7brY4yUhWP
         X7n5yoWSlbaFkaeAZxDIGmO0Y0eWWKWVwK5CymtE9UO3kiYBoUkJnRGD+Yyc+FRFc672
         1KbLBsFRQk65dTPqnP/klAF0vI+pFewC15zll9xryaoVV+89mN9Aeud2WY7LpA1lZV0G
         dQhtpMEsRLaqJ/JfrjAlcVOG0JV7UyQrofCvZ/qVto6/l/AQ3Mkd3CaiYzYH44IolGyc
         IE4w==
X-Forwarded-Encrypted: i=1; AJvYcCXy3SwCTK3lId16KascgDcfDP0zdB7QeGofbB8U08q4kwBkcgi8k/O2d1lx5RUK881I29nEArOoPs4wihNlc1h3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4yqoAS6YyfuoooxeDuYOENK+PWwgE+VU8WMTi8UrBFnqf4vYL
	tXBiCQ70r+J2irjdjF04MvMHRgOoZqInE2IPpSwteWHc/qEqclJPKcu0emwhLvKXu3idbP897IP
	12dBB6FfHaDBGig1FLssnGzCYk08hgqQ1uc7CFJYmFvHqjDFnVCg=
X-Gm-Gg: ASbGnctRnWIG/lR9q+7Ow67OGImL1kQK5d85EMn+11HnLvUoz+dXqoQPVqq/Uly+eSO
	J8+r8IsodtSPE2KXoD9G1Fmvdp7Uz/QIhrlDkLc+g2LzkJNX/1Mx/fLOekoTtrs7CdI+wddOEvL
	pps8T6cFAq5cKPtobp2zzy+UGHl61j0W1aNLdkRAf5h9eQjR6l/jY+AUdu9w==
X-Google-Smtp-Source: AGHT+IGDNSudfFFzjYqFrM8y6kc064hj36m920RZvLgMZC0Na/fCdcQtaQhlOFDOArIsQb1iaYRQKjijvj//5BehIcI=
X-Received: by 2002:a19:521a:0:b0:549:4d78:2418 with SMTP id
 2adb3069b0e04-5494d78261emr5767689e87.27.1741084935146; Tue, 04 Mar 2025
 02:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-3-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-3-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:42:03 +0100
X-Gm-Features: AQ5f1JrCOkNsO-_LmSd0i-zdQ5ywyJGyS5xBtupnKd3oNTQMfbL3qs4qw3hPkug
Message-ID: <CAMRc=MdqV7bm+zbi=mrBhS0506CTXOn09=rJj+pR7RMYmhn-MA@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: samsung: lowland: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024216_836742_6EDF3592 
X-CRM114-Status: GOOD (  15.39  )
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

On Mon, Mar 3, 2025 at 9:41=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> This file does not use the symbols from the legacy
> <linux/gpio.h> header, so let's drop it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  sound/soc/samsung/lowland.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
> index 702cb4cc1ce9f07e55ddf9435b19c4691e0236e5..d4088b72d43c2295102d85019=
7f8b9eac50d7120 100644
> --- a/sound/soc/samsung/lowland.c
> +++ b/sound/soc/samsung/lowland.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm5100.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


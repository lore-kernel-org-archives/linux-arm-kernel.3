Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FB6C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epMSf47ns8yAb3YJF/FdVNBVirEA8Ks5JMLAsym0/0U=; b=rdpPHf1W3dcMJl9ILIlipfekVJ
	7BtMeYMl6jXXeweHoSlEzcG5aIS+vtLhQMWWwGF6btniGekMKhshr+OFVYl6ronE1ZPhPQSVWBPI0
	PaaWdLGQG2N2uCBowjoBtupe0FCh6/2e/zHgSBAH+4V6iqJcVTvYNOUQ2ak0UDG6yTCmJmZgaUV/H
	tkykeiRfieLSJEFN5315YJX5BrY7KVhaT7401maZr0aeC5u+MjE6/2qfAh95VvYe5/phpLJMw+1zE
	RXcCNEeC2ImGiuFni6rwqpyf45aysQYVqNOXGj1jO4isnCQ+6LYVNAT1mKIrDz5VM/12ji4U1DRoy
	btQ7rmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4m-00000004Wav-1BDO;
	Tue, 04 Mar 2025 12:08:44 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPmA-00000004FRf-43Ay
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:45:28 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30615661f98so57994741fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741085125; x=1741689925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epMSf47ns8yAb3YJF/FdVNBVirEA8Ks5JMLAsym0/0U=;
        b=kSofYUpekx5IiG5c4Kx8LOsmUIpVhKbbot6iBQUDyhw3kBMuf/eLEgF+VuuR21DgVM
         brLWmOGHYaxu7flP3XIhg9N3SKae3pF+p1M2qGRoKD+AklHiac1MgOhYzWmuDmXSdnEJ
         ikjCJfkQxbVmgE/YIIhD6MpoVFQBRlvK2nkl9J1lElsYX4SARbO7W/CzRk6I60hQFKek
         5ckimjDYHch30vW7OPQNbLQRCyBcdlez2cAgpbP7KxqsIbU7Nu+ERktCdFM0zZSeHme9
         yz0rghnDQL5YXmrrSskxW2Zp4lFwVZK/fdBPULmJ8Fm8tnBv2nnbrgl81sVPgPx+LGd1
         ZklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085125; x=1741689925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epMSf47ns8yAb3YJF/FdVNBVirEA8Ks5JMLAsym0/0U=;
        b=ou+qfdHes7pWHWnYb1JJofp6mYmLHjGg/qDjn7bR+l4rD+AyGy1whN+AW/cyU0wT9S
         xXqEUZ4+VA7/oOOCdN+jygy0FsQHLG9Nzgh8BsDRExV/M1T3wiXg9WW1pbb6jL9zwPxD
         FXnAEbW0FCUW1FbnjoXifm2p/R7eTaLqZGGi986I66NT3z9kwQQfSHcty5TxIoOwST3c
         nwTnHrHHDzfTae+I//jaTgmH53JON8u0pM2e5L+tAO13hken8cnRiamu6YiohEyi3+cp
         TlP2+ZjztDuP2/tpfT6tPcnNcH0u6EqF1evHbN25eF/+y9fGbUxPxcFt/yl8BD4WZB2U
         YniA==
X-Forwarded-Encrypted: i=1; AJvYcCWMmKKuRiGr0kDfj+Bks5QueEad+BhpYo7ZWH02nLGXy707zl/kgke93kMx5b8qABveMK5Cxg/2b5fLRRUXHaGg@lists.infradead.org
X-Gm-Message-State: AOJu0YznREfNRbin+/A6eOQT4ILGBDENZxJe0k9NhiYs2ZheNCb3we/+
	av02W6BNh1Q0tLMQ45r9gCL699jgn9u7rSaohyOegF0kdCGy7ahYvNA0hwyi67fWLPuno1p1y7U
	tXZUOhiVk0E3J7GtLR7uVNPSlw1/eULtjYhNLsg==
X-Gm-Gg: ASbGnctSylEZmwj2vSXJF6QuxAN5rtmTtS1t77IfQZf4qPP2fCPLL7G9LBbY3nGanCS
	jJ3ggLs/B+CbVoxb3hZxjvWXNes/eYYA1uoxGk1OLhjy6E8CfZ7MlyjA3AO/st37bN3G+2LFVSd
	YarMSJ6iUK/8c5ZwTXg+Yl5ueWbry6sf1emzECWjw1aN0td1HhEPRCTIo06Q==
X-Google-Smtp-Source: AGHT+IEDjizBZuoKcVJzTvYSj7vwl65RVcrwqkiBwiEL6QNm0uEz+vKrfiVjezbf5nMFjCyjKA6bvZCgsmKvfmqPHJE=
X-Received: by 2002:a05:6512:a8e:b0:549:5850:f275 with SMTP id
 2adb3069b0e04-5495850f375mr5706338e87.50.1741085125142; Tue, 04 Mar 2025
 02:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-5-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-5-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:45:14 +0100
X-Gm-Features: AQ5f1JphOoQ1tHR1pinYEgCRRxUl9CA1Qxe3jW8NE3pmYkIdk5RPI6bGrAoFaOE
Message-ID: <CAMRc=MeWNT9k6o55UjsLypuNzpwDKRmNs7Mh6TgTchxq-9+QPg@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: samsung: tobermory: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024527_006694_DAE14FD3 
X-CRM114-Status: GOOD (  15.10  )
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
>  sound/soc/samsung/tobermory.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.=
c
> index 2bdd81bf821a5b9bdc56479bb2cd5d0089fab339..bc2608dbaddc4feeb9af77639=
699fed89540b44b 100644
> --- a/sound/soc/samsung/tobermory.c
> +++ b/sound/soc/samsung/tobermory.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm8962.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


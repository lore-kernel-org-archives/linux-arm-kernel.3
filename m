Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F68C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B53w3MQPaxkNrF0zClZsbBbaKHU29woPD5v5NTL/nAY=; b=1ua8KEOoBy9xGkybr3a93/bESK
	ujhATcJpHI5SYHfaEyvPDJ1/F4JlH1oK4bcual3y0WX+U7nZ+wcm3/9cSSdi2QrwAPG0wdcK1dbJI
	Ar93IszlSQINWZtYEjXoIV/dyWem96x4w1POIj8rRWuAaqfOBUE2gAAEWOG2rvWqJCtS34cex7e02
	7gxCepSByy+yazWeDbVwrLXFeBJn8Mi/6IYpodSj+AXRcDvVe04/VuUbo4u/x+bQm+K83mplPomgr
	tv1j/c3Fq24Pm6GMqFfZHig4XCsXPcZzd/dzKrxXgmfGXALrXloWcGjIYYlGWMANYpBeEDVRXjcGX
	2MwMNgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPoy-00000004GE7-0aHs;
	Tue, 04 Mar 2025 10:48:20 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPiw-00000004ERA-0Lwe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:42:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3061513d353so56018381fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084924; x=1741689724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B53w3MQPaxkNrF0zClZsbBbaKHU29woPD5v5NTL/nAY=;
        b=IXByrAcio/6Evgf5wv2GOMVOxF4tPChU2pXqJMWLgD5eaANf5w1UuN5LYhetzb+y7z
         j2ttgvgjMg4KJu11KugPTycwT7IaVmU8Q0hz06iIsJuA1mt395EItAhmjqD7xJ0l3+wL
         tO0QmrTVordFWUZugQmNcoVf/yBbChjXZcG7xPBh8vJHLQf+va2PrkEzULF/owSU0X0+
         Z795k4M37mHUzBYIkYOWVQ43CQyWklR4QChv102KeNaugg+OLyeSsoq7qeTE3ABWjXUr
         rATfvwgZZVuRaT7cSnDu3rv2dtwIZwom/kT59UDEPqKXbEpMgizFGPjkWMg7N+QwZ1vv
         ppRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084924; x=1741689724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B53w3MQPaxkNrF0zClZsbBbaKHU29woPD5v5NTL/nAY=;
        b=NfWS67NXmyxugOrHbK4enCV+/9VyFVJ7aWsN9Vah/P6DbnKlYdJzKqSKFEHFe1/PZf
         I3c8EhThas/BhUNXLj8MPx70mALiwbyT9xqDKLFqAuUhQztWvHyLo311fCO0vUkgqOcZ
         Y5clDFCHUKTgFRCy2ZtUGUB5JfuFolykfaZcmEFivyMkdSrUPbpr9dknkU6Ei3aeyL9E
         reHDXRQdKosoXr7EQxOFQqfhLxnzdrMt89lbzyFX5UwwLbzWF6YuhpA310rLzystWoyy
         GezQitq4olncRJYBRZT4aMzNnveE5updJQFAPLWiOPclzVgq6fdqh/v2hbyd9r3/zZRX
         H4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU3O/R6QuCOmb4cM1MBpYDA7yTuaiKcLqTvz8ko3qcdj8PSvfkPnYOhb7xd/mswD6q4DkAFO+jE/5mwpvfxmAka@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1c4wT7YisEzcRUpWPJaoyCvhJ2aulc3E21M6e0yyvkIgbloN7
	h4Mzh/ZSK5Jbq2UrngTYFSbrIm+NdWGW7gXVWqZ6vqWbciDFxG468DI/1b+tHxaYs5K5amwjUSs
	Nk1KKl2q90xwt9INWO1s7thX9w/RU97WjvMOorQ==
X-Gm-Gg: ASbGncseEGjJzqjuu5EbplH/9+r3rXHkTfM/SzV/QkMIn0mDZbhDjrYBCOJi/2wefxP
	qEf3ycv7TuYITnxGzUN3A7emCVT0ZPC3kj5A0kmjyHxuQdI6VizrKahuyFtXlsq8EdcyIiA7zGJ
	WbNf7e5DXSAZqYWO1oeBF496sy3YbGjPIeCnpGtDQbAUMm3H4kfHrjG9ygFw==
X-Google-Smtp-Source: AGHT+IFjk1UnA0sx0Kef7boBRo1bABdfDdyjC8ITpkOL63KQEFB5T3AVF3JlEQ15FCRpk+EGUuIFoCvwxuTHq4w+81o=
X-Received: by 2002:a05:6512:3189:b0:545:3032:bc50 with SMTP id
 2adb3069b0e04-5494c320d3cmr6862388e87.19.1741084924101; Tue, 04 Mar 2025
 02:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:41:52 +0100
X-Gm-Features: AQ5f1JqqeOex0JCLsht-e_FnDn4g_HMa-cLCOz8gTdBj2tCIzQrrIWUji1KdsEY
Message-ID: <CAMRc=Me7kcLvYPgRF38ahNtq4J0e8yHPRyd9yMnsjN4dB7Y8Ag@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: samsung: littlemill: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024206_141169_25578105 
X-CRM114-Status: GOOD (  15.13  )
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
>  sound/soc/samsung/littlemill.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemil=
l.c
> index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ff=
df499a3eeadfbaa 100644
> --- a/sound/soc/samsung/littlemill.c
> +++ b/sound/soc/samsung/littlemill.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm8994.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CCAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+CLe9wyo94MK43cR0KkLcVm2hrSOi/FbrLlXKM/n+c=; b=wWr5hCfUoufZ1hSxeXKn9P92lI
	E8RYpHV9P5xJJ9hf+7s56/7WfU56qeu739ivqRwjkeFUp4in21rX5Ilp1X5LXrJY1oX15x6qqM9dD
	NyrAb7Otu85yLsTEZ/mYO6LWkI8yq/lVVrzrn8q3rGOtoz9AqnmiVz8gEHE4jngvKWZn2HarmlxrN
	2qIvDGZBXOZWSE5DgCXu4s92sqg4HTo0/0UUPhONweuUCvhUEkslaRAoCQ3l3GsgOAEL7H0428FBq
	VYyPnT8V8pUGVA1RloxZBZ/nz2XQIgLAtUX/vocVPswf8wTaF8eJyOWyBiLeQfRS/yFSYjp4uQFMi
	zG3K5ayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPkJ-00000004EwF-3nwD;
	Tue, 04 Mar 2025 10:43:31 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPik-00000004ENC-0eOb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:41:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54959d1a856so3008320e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084912; x=1741689712; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+CLe9wyo94MK43cR0KkLcVm2hrSOi/FbrLlXKM/n+c=;
        b=LQzbj1BNQcQZSlXNoMAqa6kfoyD9R9uUYGl7zUmlg0C/TLPGmh3z3TX4BWIdfm+ndW
         xCT47quH5fZxJoYLNQzBDbTxi56HGJMzaZumanjzpsskFYZow12oZBLx8kK13lrICIl1
         JykegGAxFA8U5DToYQW1lea4KD+D0dHiNw5IQdaHllspUDmPAmqu4zPU92fDVbbgimnr
         iVazTkG/69cbEbfEpQZ217thhlEaXn0mCzhHQ5vUIZ3K9TE9ufCJg792yHJMYnN2P0vT
         w/ky2+YbyGWBusoyOUWkVT7dTo+89wfjiKfG6CMMJNbuLvYsE9rgvDrvFa96JOc0NnoD
         1xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084912; x=1741689712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+CLe9wyo94MK43cR0KkLcVm2hrSOi/FbrLlXKM/n+c=;
        b=MWfDahVVf38ufNRfhkJanQADcS4uHUydhjAPqSCKE5ClLsE9qw0l66KF7213DOOfgA
         ojiLfN94le7lBUN3vxNflySVtunLEi2vIQoAcDP5z7mV/d/QCwjWULk7Vncr1CX+kzI1
         cvYgv8AbdUCNecsa5S3E/mhDWOiCe4XMizz6bNh6qofrNMyn6uLp0EzDOE7PgWyEihek
         D8F/k7XDazxj6S+MmuO+6rOpygSKXhLw7Qa5c4hSmDJyxlesTwmqDXNxLz5Z1F5Cot7I
         1ynL7cLPEy90FOueIyUkiZCC1P9v4SPy+kN4QH+xmFDhWfHkq/wVsZiypu0c9Z9eMT16
         rksg==
X-Forwarded-Encrypted: i=1; AJvYcCVs5Mr4dZoECfPT8QT1Ui4zN2ZuZ0EIr8DYlUXUGQimow96fP9R+SjN0TH71IqMHykmYokrL5C2igl8Nec8wWrx@lists.infradead.org
X-Gm-Message-State: AOJu0YxtA8snMrzRNzFoQH68A49LHnUu9q7hJ0cR8XztvqYYneuUDDj+
	ljHH7qsdzI1l4OYeCYnm4DXYull7vR7NyHxfyCr6oSGtNAHVRoj+645rc99pgAnyuZiEnnQ/X+Z
	OfbI/Q6wsPaRqfbLFJ/30pVqADg+X7z5kG6obhGBA7M7lkvkB
X-Gm-Gg: ASbGncskpYZrdyDY117F/jJz9jlvjQSmn2hDFqCzp9wntJXj4ORdC32ppzW+LxFvnNE
	upx2CuupkB7ZA0wdBZ7vBKVE/w+jsg+Ggk4ucPEJZwPZqvwXTSf0RPlPhvXo/eo3+nPAkZDt8V6
	MMqMfQeiQ8Oqu48vIXyHW4ff4znUY3DjBTRhIfZQNMsyn6cptkHNJTIv3k3Q==
X-Google-Smtp-Source: AGHT+IFW1dwugcBOwVBAmZrS6CMIuhv8KAFq4W6OW9+G0v4HXawDePl2UapUTtV4ZF3rFz9ZUUYtAhog6ikYaHBlhNI=
X-Received: by 2002:a05:6512:a93:b0:545:dc8:9376 with SMTP id
 2adb3069b0e04-549756bb8b2mr865753e87.5.1741084912286; Tue, 04 Mar 2025
 02:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-1-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-1-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:41:40 +0100
X-Gm-Features: AQ5f1JrTREE44_9-N9d1KpC5QVfqU80Q79Wuacg5Co0HVa8QMpwM4g47c1JzBGY
Message-ID: <CAMRc=MevrFnw4BGRgwKrg+wj+saEmVmk+diGj=+sveE2P_hwYw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: samsung: bells: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024154_189604_340A5D20 
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
>  sound/soc/samsung/bells.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
> index 365b1aca4855c885e0b59a1101475d8edb86374f..b4c0857ae35134b58a125b074=
6af07a5fff040fa 100644
> --- a/sound/soc/samsung/bells.c
> +++ b/sound/soc/samsung/bells.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm5102.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


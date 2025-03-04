Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648A9C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/aaHwkC/E8uA1kqYtAAaX8nqXZT+jPYwGSFIvz+Wis=; b=x+GIXYBxBbPfnkTcrVtsnuL8K0
	hy4xc4M/G1LmSrl7umCFQO88aBrUoB1b84V2qfj6yLAlEOj+Eq8tx4XMjsyliN2P4orQeH9GZ5/H4
	YIA5+BEHs1ZKL0LMN8yc6bDOBZ6/G0CcYMvsVuGe5qCodHIpqFO9zuCKkuV2Sfx+JSW1d72W3nm8r
	HmyvvQeWvXe1vzFearABN1vKVpBSLUaHbJSafWHlDDxdQhizq/+jjcGK3furYx8u0VN+meMrCgieE
	PmJ/aKZVFs4M/harnK9LNX9+XyhduIVZn4xNsAn/jBGJNbOWP2+fxfMMcOCGA2ZS0NFANeJY0kqTO
	SyWmvcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4m-00000004Wb2-3S6Z;
	Tue, 04 Mar 2025 12:08:44 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPmP-00000004FWB-1vVg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:45:42 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bd21f887aso1771881fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741085140; x=1741689940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/aaHwkC/E8uA1kqYtAAaX8nqXZT+jPYwGSFIvz+Wis=;
        b=tTExjgMwtZ8FSUoIq18OECc5GMDAmjT718yXGSYrw2JKJ4kTO4stEL2egXC7mBODjT
         PyneEvrmWn5w3gm2ZuAR9aBpTZF5QE+zlDgZm1WglQxHpaDPAuLnOIAMx0XBBU+WK92i
         HqzhiJaBqlLDlIif7vgGTwZ1PQG5j6Nm8PzC53iG+gt1D79kayXxD6YAZMuHuI5eYI+X
         d3pyy6EZ5D9iGoAMlAyZvCVkBN1leeZUEv1tFbTtpDI3iG9GPND/auOPppzojSAu3ajU
         rfqaC06o5Qv3jTVzd69PLwSgpjDdBiWmEcmqzuPebOFeaiYGV7JRtdZNCHSciQc0gqiC
         UVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085140; x=1741689940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/aaHwkC/E8uA1kqYtAAaX8nqXZT+jPYwGSFIvz+Wis=;
        b=oPEcDRpZxEPtQjQ5G3YNZ8PuaQ9U/q1du7iKdVL0QWg89QWZwVqLii3uMow2P9+Ixt
         8xcY51RjJW9KxNjlxOX853GoUgpykepXxBh8RCsBKKFnQ2ZMd9zlfcxFRcHyEgp5f6Vs
         AjZa1te/rVuZUadRTpoDFpKkQDfVkswfIvOKDqmrTdVJmaN5bWg0snENykXQTWOHh3L5
         0jZUb/Hxg6bL1/JHlQvDo6XBpaLsK00wcecPWlMoDMCXyFJNk8Jiq4FisFGH259I4bZJ
         ebvOP5834I1CjQSyMYYRFeFX6OxE4DdBFKJcymkE12cFahH/tV6jz6SaT69notZ51kcH
         YC4A==
X-Forwarded-Encrypted: i=1; AJvYcCWkft1TUZLsslF9VdzdecfOvJY3Fk81V3mqI62jPBg4GeqgncySa3D6Y2KHrZ9h2d0Yl4dKHHR8B+gqRMJzZKOw@lists.infradead.org
X-Gm-Message-State: AOJu0YwnjrZH0I8GQhhIuQ1b2PGDYsLmDDabuDl3bLWb52P3xG3o3lRh
	dHnQFNuYRh3Gjl9uGyKL0MitRPlPIqswmtwpB9AXvGu0WH4h27Dg5txogyW6bEdcDVhNQHesZlF
	lj2GhN+yJa/isA6wU4jUhLWCtwMX9yy20i73Yuw==
X-Gm-Gg: ASbGnctqh7QJB8kzGwl8X9z897ycsEDJxDA6XtC35MJiFvpwB9/tr1AkfkK9L+EDI3y
	CCPaR/VY+LWnG33F8ZMmIfs91xB7hhkmwZjgLzVUxC9O/QG2ZxSm8FPpQUjDWWs6K/LZ88tgguQ
	+aHBA8TuFCAuWfeJrORtQM4qx/mbYzCC2tf3JgdPcYfXshsM7ELW8/EAZadw==
X-Google-Smtp-Source: AGHT+IFXXt2AqKqjjUsUgbBtUp0OHXy4RcnJzi21Vkdwe1SliF6nWQg1kfmRVJCF27CAXfJfhtKA7V7mluHj46qdMQY=
X-Received: by 2002:a2e:b896:0:b0:302:1cdd:73c6 with SMTP id
 38308e7fff4ca-30b9326af9bmr64690081fa.20.1741085139679; Tue, 04 Mar 2025
 02:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:45:28 +0100
X-Gm-Features: AQ5f1JqzX8kxY0W6rt0f6HfW2eatpxqYEnNpnql_NIg_4tkiueWX8b7wCcm5OjA
Message-ID: <CAMRc=Mfr0Bwy_OWRheY8U5c2-0nB+_JxZHLNjbHFzvCEQb3OrA@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024541_496222_64D0A351 
X-CRM114-Status: GOOD (  15.03  )
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
>  sound/soc/samsung/tm2_wm5110.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm511=
0.c
> index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45ac=
f9a28720fdde158 100644
> --- a/sound/soc/samsung/tm2_wm5110.c
> +++ b/sound/soc/samsung/tm2_wm5110.c
> @@ -6,7 +6,6 @@
>  //          Sylwester Nawrocki <s.nawrocki@samsung.com>
>
>  #include <linux/clk.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


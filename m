Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF0FCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=; b=CnOHVwsbOboJEkh4xAQQ53u2zT
	9kvmPed6oVkIwdY1s6KTTdwGI0m8gEd3mu8CEs11WIISy6vWCThYSooZzMYY3fbizm9xQerB87WW/
	waEEbzOkS7YDNS8qUHSzaZAV9WqU3mcV+YIYTG6HvJb9OkWa01YTqYoJavCgQOuarJ9sO1+s5gmZp
	oCGIWavvmg0p9aF9LqhzVOg5sgwjaJHaVsvH3vN4DBbkoGp19ozSYJYKsC50OOJJ+GWzp3i0Anmyq
	IMtPxHFcc2AmvPSWHNVQsDke9lVEKxIKTm4aFHtz1nikphvAoclRAxuk4Fz2hPpvanJfkbaMxs/qa
	StBASkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBpk-00000008PRC-0n6G;
	Fri, 24 Oct 2025 07:03:32 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBph-00000008PQa-1eqd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 07:03:30 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-592ee9a16adso2794537e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761289407; x=1761894207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=;
        b=WLkJac/I2pBsLWbjp2ofVzR0D3YgM62L+7qhk8NeeyHVmW8R7Cu6BVh9lYv9WrFNuS
         IXTuh1ep4dqQAwWfLGlHTyIPPd3Aw0KbYxi/4pq3TJG5xYKR5twKtgyHo0ePloIx7iHm
         yQgrfajbjGJujLRGCCsXFrKpeEwY4lxl/uNHh7TLZrppyXRrV73pe6JPtEw81KHDy1yP
         j1A2zw0epHfiuzG0xThBX85UbmwZNz5VEjo6X2husmLjmjwEC/TFcpcaYcxTEbY1CkIc
         FrV1kn+OnXky/0/7cdhmwMTuUn8b8x4N6b7o3+itz0IYyMbkYOI2tZ/TbrHU0hzUmtNh
         vztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761289407; x=1761894207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=;
        b=lGj7k3G/H7vx0fFId6dpOHgjzj3xpeyrnO+Si9Hh9JSHBIfG6TbtQIBtQPFYU4Guyb
         fz7EjjgHf93RfdH2xPM1GgOvNk5q71dUEiLWqh2OFtF0I524XOe4cXWMBNN8qWDu292a
         7SE908+BOjZg0lSQ/szfPI2lCXpLeUTuV16lZfc4XUx7T7s6N1X1aQI1t6NdsP+ktT3K
         AMTfmU8mokuu2ZO2uCYSyDo69Mf/wElkGv0uLll2axvh7T9TwKsgDfGntVKbUZQ16vDl
         pKOGB3iaBABpWYQrOaV/Ao12c+xgGiuAkPFTX6VItZktnJunF5pTh3eoYmSajwJiyxS7
         SvaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo7bD/mnD5XIPuIm9WlBHL4kH67IlmUou5NbZlJ3yx/qRWn95CdHh/L1rdMJ6v2PI/IEXHAFXkX9bg06D27DAF@lists.infradead.org
X-Gm-Message-State: AOJu0YxhnTjagyooe1iDoIyslbv5qQ6GvEi94i5Hk28L+ZWSh4q6hu8u
	8X3hW/0ynHgaE5MG6FYL7qoJkhInfgGwzzNhnAmKsZKinkCZTVRO6V3+aHSwY7I4Ee8EOJlGyH0
	+ewt/ROclPihraY50dHRHgvtJz6nh0daBl8v5bkckPg==
X-Gm-Gg: ASbGnctdLvl0+4i7m0KV9TnovlP/UFHhTHCfEuf5sT0Q4uhOm0VtdmxlZmt4Yd1xgmH
	epET8hTNPkq9wxBkZRG0J1Nwzw2C+SE9NRzhtec6lE0qpSjhqXW3PGhuKykkc4nMzlCx+QirzIe
	H73DFY7xNmWyQB7xRt0o2y4ZwwmvoDJyqDVtg5EtffYnkWQE+kmYYz/p1U0WiIGGZMwmK+82oST
	h7NniuHS7EXDDJ2nEdyjCiAi/XUMLfbdaJGAgS+vx3D1wB6sCUT7Z5/TBAt+JElxUFZoOn+RT+x
	tA/e5CA0TFCw+iDM7WH68KOGtQ==
X-Google-Smtp-Source: AGHT+IGot33eiQ+BcQWl6UG0zv+FNQnQnMAkHHpWuHdoQFvVpdE10kN9LM8Ma75zpPJb50O7ebN6pjI2myaknhddpuQ=
X-Received: by 2002:a05:6512:31c2:b0:591:c6c0:9afb with SMTP id
 2adb3069b0e04-591d8546211mr8882195e87.34.1761289407199; Fri, 24 Oct 2025
 00:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-4-d34aa1fbdf06@linaro.org> <aPkcpTWfTb0HOF51@smile.fi.intel.com>
In-Reply-To: <aPkcpTWfTb0HOF51@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:03:15 +0200
X-Gm-Features: AS18NWBS-Jd3edts4iMIfdLC_kiOaNMJiYsAVBHOjeSjhFk4sOt2_3x0nM3hP4c
Message-ID: <CAMRc=MduywsSKrN08_4F2xEjZrdnV--_3LZNmxwRHH=_QtceHA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_000329_569789_4537DA49 
X-CRM114-Status: GOOD (  28.45  )
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

On Wed, Oct 22, 2025 at 8:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:43PM +0200, Bartosz Golaszewski wrote:
> >
> > Add a virtual GPIO proxy driver which arbitrates access to a single
> > shared GPIO by multiple users. It works together with the core shared
> > GPIO support from GPIOLIB and functions by acquiring a reference to a
> > shared GPIO descriptor exposed by gpiolib-shared and making sure that
> > the state of the GPIO stays consistent.
> >
> > In general: if there's only one user at the moment: allow it to do
> > anything as if this was a normal GPIO (in essence: just propagate calls
> > to the underlying real hardware driver). If there are more users: don't
> > allow to change the direction set by the initial user, allow to change
> > configuration options but warn about possible conflicts and finally:
> > treat the output-high value as a reference counted, logical "GPIO
> > enabled" setting, meaning: the GPIO value is set to high when the first
> > user requests it to be high and back to low once the last user stops
> > "voting" for high.
>
> I have two Q:s about the design:
> 1) why can't the value be counted on the struct gpio_desc level?

No, I specifically tried to limit the impact on users not needing this
to a minimum.

> 2) can gpio-aggregator facilities be reused (to some extent)?

I don't see how but if you have a precise idea, let me know.

>
> ...
>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
>
> + types.h
>
> > +#include "gpiolib-shared.h"
>
> ...
>
> > +out:
> > +     if (shared_desc->highcnt)
> > +             dev_dbg(proxy->dev,
> > +                     "Voted for value '%s', effective value is 'high',=
 number of votes for 'high': %u\n",
> > +                     value ? "high" : "low", shared_desc->highcnt);
> > +     else
> > +             dev_dbg(proxy->dev, "Voted for value 'low', effective val=
ue is 'low'\n");
>
> You can unify and maybe save a few bytes here and there by doing somethin=
g like
> this:
>
>         const char *tmp; // name is a placeholder
>
>         tmp =3D str_high_low(shared_desc->highcnt);
>         dev_dbg(proxy->dev,
>                 "Voted for value '%s', effective value is '%s', number of=
 votes for '%s': %u\n",
>                 str_high_low(value), tmp, tmp, shared_desc->highcnt);
>

This doesn't make sense, we don't "vote for low". We only vote for
high. It's not: which option gets the most votes, it's: if there's at
least one vote for high, then we go high.

Bart


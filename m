Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BD7CED24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=; b=mVJCrq+D4qPGiW6cRDqbeRUbn4
	spvpZZN4hJhh+PUA1mCEOS2mD7LsHBCiCdThaWIM0R5texSz95ZDGAReNVOeaz8dH+BGIHjiKWDKf
	uzrAboHs9qdGld7ziH2WTbNJ7FTMNb1sqUflQGA3ZNatVO0jgXUntnsBN7rghsZCaGrNIipbYWsdF
	3opyOHystt/WSvIudCU3bNo3NaueA+ffTtq3dJaO8A8+2OinvlvESmiITz9Ot0V11fuuLY+69nBGT
	ka2MCMFXRxwDVbHX628P0FjkJYMS9o8PvVfy8hbptVWXaMZUV0ehjMFsLw960cVrvJUOottba6Lzd
	3fG+RuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIJ6-00000000BUF-1MA2;
	Tue, 18 Nov 2025 09:47:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIJ3-00000000BTJ-0if9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 09:47:26 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-594285c6509so5434950e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763459242; x=1764064042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=;
        b=Ftqslwj3IZcf+0UaSJ/ZEqld4zsLN3M2hEjgYU7VquhAiUIki6x/eaerhhRZBlcgq7
         Fr9duXSRyYj35FiXaJ763UQlFbKAuAT6628+GFzYe+6GCrO5uig47HuMIDMcxx7oo6h4
         eFlC156VjoIcdxj8Lwa2n+ITv7cCX4GDNWWy8EarROPvf3kt7iqYk5APpZtlAKEtPpJl
         yXB6QAT0pbdpBoaosSGAmzETBkVAelCh1uLJJHETN33s0k3qew4hho5bSGwTdjJO0IrV
         ZB+5+UBmiCGzJwx0v8NRa3jPv6Mf+WcbSBInU3J/AJKkA3c+Z3xqksUelcAwV7aeJIDl
         YcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459243; x=1764064043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=;
        b=nvcc7ziiRdNi3xAl6AUEmuChTWahT2ah2oqmou+YBUtRkGpZt0XqNGRsgeWe49FeT3
         M0uIGrCiGyCp29/lZkrl7oHv+ROAuPVEeRgcgnbo2DlI9qDAKFo0GGVPiA96IH5AV5FX
         6eh6SlT4o0g3v/UU+uQJ+TI/WqbBwAuRiHmdiqthG0BDYoC7jD7oCTrvbEsze6auozGi
         85wTf7VMkhtLIIQZ+gFsmXN50uaY2OlgkzLfOMey1DE5H6qJczdwPbxp2InZcK8I7Yi4
         8WkER4C2Lc20DVfgXcT7JkG2Vm8+R3DsZATOj3L7crzWMIv8+LViMe4ag1dWXyujXteC
         8i7A==
X-Forwarded-Encrypted: i=1; AJvYcCU8YV3JqZ7n6vkNINbbHUhOnlT14vwXa9qthAan2Oe3YdOYZrM9OzqVFZ2CHff7FN2KklF0Ffz50Dv1yxF0c4KK@lists.infradead.org
X-Gm-Message-State: AOJu0YyuACMY+BhEtnLER/Vqi+1VNL920KpITbeFHC3sb2yYaI5yoP/2
	MsCxoA0wjGLl62Y3tqO/DFEO6ifsgJCQhkMgDQp05niLomH37QBim7PCBHBVb+eWAwJeYSZVH4k
	twniBJq/ArRSYDiVHp6QIDnYo0NOzXO/+GeHoMvlXnA==
X-Gm-Gg: ASbGnct58u0tRI0xBUtvJex2eFkpoR3KAZcN8f1t2LHUrAMGP/sBeLvYTQj6+YqRhnr
	x5kHB/4oV0nkIzAGL/elpwjDEXWeK7wBc0ZHqnCK9A82TEbKi3vvNo1LG0dU+fj9wgy/GLdlyNS
	3xSgUsFLySWRNZXrKz4kJQPTMlh626VZkk3rViZHbXVrlYcCi+/JJS1HfAJvHJNP6v1QZAA2gsz
	qzxXMV6m18m9zt5vE0lAMB1og2CPVZSDIj2YA/EIhSkcG0adCT9udpEeXx9ve5qIcC9la2Lk8pV
	iR/ZKUckSl/v0mH/2fXdjbr3bwLnB9IDg/a2
X-Google-Smtp-Source: AGHT+IEKSj2qpQvKe0IfkTOGZF1jV6/WKVJLO2A/Txv4rPC3yDvwMdMydDTZhNC5mLXfB6q+qgnbPN4NmYCtJAA3Qgk=
X-Received: by 2002:a05:6512:39cd:b0:594:4b55:d2dc with SMTP id
 2adb3069b0e04-59584217be0mr5314684e87.47.1763459241858; Tue, 18 Nov 2025
 01:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org> <202511171230.F83EE85D0@keescook>
In-Reply-To: <202511171230.F83EE85D0@keescook>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 10:47:09 +0100
X-Gm-Features: AWmQ_bkhi1H3-46xEmuP3pqCgeKjE8VDjqsBb0GhCZL7ntExaLQpYRSDFU-8VEY
Message-ID: <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] string: provide strends()
To: Kees Cook <kees@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_014725_419985_B21332A7 
X-CRM114-Status: GOOD (  27.01  )
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

On Mon, Nov 17, 2025 at 9:33=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Nov 12, 2025 at 02:55:30PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---

Hi Kees!

Thanks for the review. I already queued this for v6.19, so let me
address the issues in a follow-up.

> >  include/linux/string.h   | 18 ++++++++++++++++++
> >  lib/tests/string_kunit.c | 13 +++++++++++++
> >  2 files changed, 31 insertions(+)
> >
> > diff --git a/include/linux/string.h b/include/linux/string.h
> > index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..929d05d1247c76eb9011fe3=
4250b487834b2d3c9 100644
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -562,4 +562,22 @@ static inline bool strstarts(const char *str, cons=
t char *prefix)
> >       return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> >  }
> >
> > +/**
> > + * strends - Check if a string ends with another string.
> > + * @str - NULL-terminated string to check against @suffix
> > + * @suffix - NULL-terminated string defining the suffix to look for in=
 @str
> > + *
> > + * Returns:
> > + * True if @str ends with @suffix. False in all other cases.
>
> Maybe added "empty strings never match"?
>

But they do, please see the test.

> > + */
> > +static inline bool strends(const char *str, const char *suffix)
>
> These are required to be non-NULL, so we might want to consider marking
> them as such with the "nonnull" attribute. We don't use it much in Linux
> yet, but I do see a few places.
>
> e.g.:
>
> static inline bool __attribute__((nonnull(1,2)))
> strends(const char *str, const char *suffix)
>

Ok.

> > +{
> > +     unsigned int str_len =3D strlen(str), suffix_len =3D strlen(suffi=
x);
> > +
> > +     if (str_len < suffix_len)
> > +             return false;
> > +
> > +     return !(strcmp(str + str_len - suffix_len, suffix));
> > +}
>
> We should probably add it to strlen and strcmp as well. :)
>

Sure but that's outside of the scope of this.

Bart


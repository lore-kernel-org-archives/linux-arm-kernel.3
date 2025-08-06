Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CF4C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCJFY1Ry1l45cujmFWN8iUaZroZ2v+N4zhO/u5g0qWo=; b=GfesXohIIh4a2dhGNQkButOL4a
	BLnnpBD7V9hxU4rHZeX46ClsCgi7lpXCHbCQXJebFKhhCFz8ekYdAu2p+93I5dt+VepkM9t6qxXap
	HCquyDMAwXyFC8IEWCYX+8ZRUWFA8WDSyQzrlt193JjtueVj5f1uzInMi9aPJiyn9KKhUVJx20boB
	M+Nr9czF1MEdZWnGLnncnwBa/AxpftxuS5LX8gfQQ5qqg/pwiK6snISjiWvF3xFWMdix9kHDPRmJi
	JfHumuNg7e6GjsJfeLVP+gPW0BK6SP8e+o/vkchCz2owiukRkocK8NLGOtQA5i+4N9GaHiDS0KOGm
	pa1yZBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujitc-0000000G4aX-2XeF;
	Wed, 06 Aug 2025 18:29:52 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhm2-0000000Fsuu-3LKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:18:00 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-71b6d27113fso460637b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754500677; x=1755105477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCJFY1Ry1l45cujmFWN8iUaZroZ2v+N4zhO/u5g0qWo=;
        b=StclHHCG6bO4dkz6Zikv4X1CqEea6Qe+J5oQzUtRmcnoOI8bdpUe2Bd8NXtHBXvguG
         kUXj3QvWXQDQ4oYraTeiRK3aXuqTKXa+d1Qa4fiL6H8vvqAaxIOsKCqb+mhVvvp89HcZ
         NApZQuPAmU9tBBAi3UsOePaXY2JB5eLzteaiJctGxpKUPVSWScmWx8P9NEdy36xNZFhY
         3H1AJELuAK4ujLmccr1MKvkzdZNVTNAQc/o543AmM7N7d3fZLVIjdRyIFFQMofUjbVex
         JPwTFSiIaRgADd/jPdd1AuxSfLNpCNP/o0NW1Gx7WfvGLAMHV8+g9JQGkhVCoJkjcl9s
         Rqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754500677; x=1755105477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCJFY1Ry1l45cujmFWN8iUaZroZ2v+N4zhO/u5g0qWo=;
        b=NnocL27Hwsnv+kMMoWxE7nDFEARwuUpZJ6BKVu4CeEYo2WSGWf4+PeqJ+FIZmkhB56
         O3iYRoMYa9YQpZOzguLJL8+6MMRKh6xtE2Hh9Y5yKFW1NqDEdeGxkEMK9XnbbjXINH8g
         YcDv2yyuHhx9ofi+Fcu0yhtUU8ysfTGiQpqUp24hYeimYBq2bbSFxGN9BxBa7nxlsZwc
         z7NuDT7RKDAEsXlJdOPQBVFmK++m6joyzVUZ4JjhGByzDj4DN85ZPB6UPRPM5BdT3GKb
         //vXmtEz3l8P0urENe/v13OhZSKGfFmv6nTbWsjWwS+pmjR5Q8wafzU17hHUtFBSylyB
         bP9w==
X-Forwarded-Encrypted: i=1; AJvYcCWS491tJiYqlWcCokSBKyXQpKnIX1CTaym8wogZKxbrrklzvVf9o6DZX0i+ZmHsoX36PBLJxMsCWkYsFOhKGA2n@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqja6IR2o4KSk+03u2avdX6+kwDkgz91+tAC9akKvlJSgdoFbU
	I7mnrrFn9OEECMJ8PMMYnzv7RsImQNrUvuLzHus+Uwloaaz7PPNYf6QvSWwWXQXQBTA2LnNzjSY
	qkpvcRTvy/NZB8WmqZjCIvXiqB42ICt3xfwj4PZgxQg==
X-Gm-Gg: ASbGncv7VQoQZVl9A8ljz2SoEIubxhd09nb1hYTwmRXR9m8qr2YZGXoRIJKIYcK1s3Z
	NEhmFDvvOxNnfBE3fC/Kp6nQqPcaUROFZ13uhVGBiY1Jwg99lqUXstj8DVGq0ULAPdFjKA3HKh4
	ykqc0faweBTAFMn/Vmgq+S9Nw/IyFAU10H21xZUU5pgAK4S1TWxvAO4CRPfxSTSylr0HWaV3/ub
	13IHx0YaBXBNAROoY11D2nrkaY=
X-Google-Smtp-Source: AGHT+IF/PATUAgO1kyiILLwJ2Hz+mfCVgzAsnenKM/M4eB9tFIphDugm0X2Ki4Larr5HlLbqkJkCKKOb501IL1PCi98=
X-Received: by 2002:a05:690c:f03:b0:71a:3484:abe8 with SMTP id
 00721157ae682-71bc98866fbmr51496647b3.34.1754500677372; Wed, 06 Aug 2025
 10:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1@epcas2p1.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-3-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 12:17:46 -0500
X-Gm-Features: Ac12FXyGsSXeAvPSWY26uUPOsx4RabuRz1OCuoO1ZxYtOJ0aBX2ZDz4rGIPWY70
Message-ID: <CAPLW+4=Lf5rs3p3+D17HDGYd1FHk-PDghOq4fygRzZi7VZXcHQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101758_848783_B1DF5C06 
X-CRM114-Status: GOOD (  20.10  )
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

On Wed, Aug 6, 2025 at 2:00=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.co=
m> wrote:
>
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the remaind=
er
> is discarded during the calculation process. This leads to a larger
> calculated value for max_timeout compared to the actual settable value.
> To resolve this issue, the order of calculations in the computation proce=
ss
> has been adjusted.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..0a4c0ab2a3d6 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -27,6 +27,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/math64.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -410,9 +411,13 @@ static inline unsigned long s3c2410wdt_get_freq(stru=
ct s3c2410_wdt *wdt)
>  static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wd=
t)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> +       //(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV =3D 0x8=
000

This single-line comment style (//) is usually not used in the kernel
code. Prefer multi-line comment style instead (/* */). More
importantly, this comment is not needed: using the raw 0x8000 value
below is still hard-coding it, and this comment is not the best way to
fix that. So declare either a proper constant or a define, and use it
further. I'd go with this:

    const u64 cnt_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
                        S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;

and then:

    u64 t_max =3D div64_ul(cnt_max, freq);

Sorry I didn't catch your related comment earlier in v4!

With that addressed, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +       u64 t_max =3D div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);
>
> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX=
 + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       if (t_max > UINT_MAX)
> +               t_max =3D UINT_MAX;
> +
> +       return t_max;
>  }
>
>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F5ECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 22:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6GHquVYXzgy3eg0gKU71NB7gwzG68GwWf56FpOt+cA=; b=3/6hadJW+tZouSSq0I+I2cCi2T
	bU1TMqr3BSgK4B3ZUew3ahIXnLaQhMwyVixu9YyOk5Q3K2p1XJsuo4Od2wTFjnyux4NWlxyaFRmhg
	8VNS1DlNeWIGb80dVRE9PUaGJhrB/h85BqpgaoPyhOknSyMc/4ak32nhqDLvlxreT2PWAf4Mn5qnp
	gy4XFK4SA3NOhXFUN9ZU9AEh7cLfB0/9S8o++5EM/BZekjk3+bM7Kldsie5VNCb1kOf2NvCroBJHN
	y80FUu6LD2mYLxgigRlFfMP8oRw4RGF55tX6QoaI4FEtw3Kq0tGhvGLbAoPtQKsykipMnZaOD0rIb
	xC0k1tFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8kO-00000008rwA-3U0a;
	Mon, 18 Aug 2025 22:54:36 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8K6-00000008pv8-03t8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 22:27:27 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e94e40fd4f1so361636276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 15:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755556044; x=1756160844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6GHquVYXzgy3eg0gKU71NB7gwzG68GwWf56FpOt+cA=;
        b=qSj+eUAERy5FUZRK9ryK0PrOTfIPpfTMD4bTiIX9HCheDh/QNNkC30THnyxHTMRE27
         cBOfBQe5jeESbnYx9KVdEUzdETYhVM9d3emUk4hMis6HyGr8F9CBfVxDFZu5r6C5w5k1
         yZQHqGbQeSeTNexswhgkNfYR925YgYskY13Flfcw/1SEaRbfBDVxC1GBm/J7VgTYFfhI
         92yAnh21kCtydbwKi7Spyruu3r1QzyD6lkojIWdkCegKGbEfYfqg44wZP/4d+2ZWdb/9
         rkjrw310ulGhnarWc3yKuexThUwlmG/rcadwtrSoCbiExYFAgfg6AdustW2VSCUUB60Z
         4ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755556044; x=1756160844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6GHquVYXzgy3eg0gKU71NB7gwzG68GwWf56FpOt+cA=;
        b=U/tStwAGhjpWCZG9x7NO1MOz36LT38JmKmvJxZC6eNruFFu5OKqlGAxl/f2aweUSom
         H+BYQj1Ay2rJmwdP4rLiyXuE4fa6gNYCxKO3nJ/G/YZh9f2NE5SNjKIYdk9Tv1AFuxsu
         S15TRTvGyZ4+jw1r5EcUKkFBfVTk+ltaze27X89h00TfRFw5PzGaaE9AKql+pnc2rYL0
         5/722dJzQlYzaOyuvKhG7X3IYkZ4KPDCoe4bXw9EACImM74MCJyPK8zzMQvf+u5VXWn3
         UakSBo4wzv5LNemedmFZ1s5PJFNPdep1WW5XK9e742L1Qm3+a6QJj0lavvZiqsMGAM2P
         w4eA==
X-Forwarded-Encrypted: i=1; AJvYcCWPbBzoL+0KT4Z4USIqVTHGpVVmU7ubEvfxbUTCp+hpttc8MBhy5mijYxPyqCpriRn1/40cFFe2ZD/29L4JbxJc@lists.infradead.org
X-Gm-Message-State: AOJu0YzA3NseuMpphK6JxQEUW++4GLujlf3mtEfL/nqjxj0IGgGxTm0w
	cAiZS7Un3cYRBbuHuSjAAVli+BQ1hMEN6MAbJApJy76EWm3oWqH243Lb29GvczJ8LofpmEvY0zA
	Iwx2Di44fEpO/KWTi2bCc6miWPFyxNDaHHGzx0D47HQ==
X-Gm-Gg: ASbGncsAm+lAKrJRZDj/V8+a5Tstxw7aYh7nqq2bUefly5UYGj8LDL0p+Hz38aD2Gv6
	3KPr8AUzta9dye0MlaACjuj/B/aBSwa0V2bjeHstQJ+YCcRjsvg262Ibx2sdMLb8Dp0RfGB3QMP
	jXg+zbpK9Ah9CM7xCRxWClZuHkfvkNx7YyvUeVT9r4IQ9qo+2smqHJB6GJPSLB9FYVtQFSIM6UF
	hugxw==
X-Google-Smtp-Source: AGHT+IEZsy19x5o98/r/4pLWO9YODI0vvSUQTbdAUdhq77x6WDR5zVwjMfdFgml+3tCPHJRWGhBSBH2CxRxauE2CLfo=
X-Received: by 2002:a05:6902:f84:b0:e93:3d8b:4e3f with SMTP id
 3f1490d57ef6-e94e61bd04emr669336276.13.1755556044632; Mon, 18 Aug 2025
 15:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c@epcas2p3.samsung.com>
 <20250818021826.623830-1-sw617.shin@samsung.com> <20250818021826.623830-3-sw617.shin@samsung.com>
In-Reply-To: <20250818021826.623830-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 18 Aug 2025 17:27:13 -0500
X-Gm-Features: Ac12FXxZ-jPQHli_YsB9TH41Az0ILCITH7EMyT1TjZMDBHz6hJ2bX99BQB7uVbk
Message-ID: <CAPLW+4m4S=j8Z0ue9LcxH+8HBsPKTfLuG9nV+6v4NLE=Qp+wnQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_152726_066003_7267AA99 
X-CRM114-Status: GOOD (  19.37  )
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

On Sun, Aug 17, 2025 at 9:24=E2=80=AFPM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
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
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..1e8cf0299713 100644
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
> @@ -410,9 +411,14 @@ static inline unsigned long s3c2410wdt_get_freq(stru=
ct s3c2410_wdt *wdt)
>  static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wd=
t)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> +       const u64 n_max =3D (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
> +                       S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
> +       u64 t_max =3D div64_ul(n_max, freq);
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

Thanks for working on this, Sangwook! It looks much better now.

>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>


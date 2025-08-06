Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FC3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQaJG8cyIXtb8JtDrWV4xH4gE5fz/4xlgqKKsovQNWE=; b=r4nqkzQ2AKfRPXs9yKnBtpLnjZ
	URE/GjOXPqBYuDkK4BwbtVLui9FF9Q2vWOyPEbkKUwLM5ELAR3N7FgjZNhPPved+PykLVppbnJp2o
	BSt4SRpo6f1A7PH6M/2bmw/IyG+FNXFpenYRd5qyx4GV+Yfm+3E3mlmJA2DMlg8CXyDSIqKtSsItA
	9ijxpGYbfl4cxcgS4wji76LK5f+9hZIHmwuAhtWyqq+FtXEAdnmhm/ZPMMT6AA9TOvfZb0EnHJGjR
	h35XaeZ0SOx0LVUUr+U8yea1x9Bt1dfpsnbhOTkPHtAmCGxBoeY5ineEUZH+YqXXKNR3zy9NPb138
	g/ndgAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujili-0000000G3SW-2htR;
	Wed, 06 Aug 2025 18:21:42 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiXS-0000000G1W8-3Df3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:06:59 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-71a3f7f0addso1108427b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 11:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754503618; x=1755108418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQaJG8cyIXtb8JtDrWV4xH4gE5fz/4xlgqKKsovQNWE=;
        b=P8p0RB0YOxfvv6dow3OPcmTYaOvTndKxHCK1hu960AfXYi4Rkh4SaShC5iH12KfyPB
         Dz2E9iygqy3XFjXTpkDG+Wnp8WzB0sDgvegIOENYd/hpKg0rvMoKJfcIS+GQLJXLhkCb
         i7bwQp+sOibUVFpN7Ow7dsNe4TuK+wxVQ8wuSxWAeXZmdBWsqjoLEy1OmGQ9Tx0hk2Q4
         UavOkj5W2Dt9BVOpM/RwTmaRwQNVF/4TOKA7e8jxYYRTnujbG7jecQKi6Shlt6Dhk/kR
         XY6qlIaeraTu7Ejr8aVPXjaCK87EBuCP89NradVQW1bDKdnCtfoP/e8sJaVViZo1ajTL
         acIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754503618; x=1755108418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQaJG8cyIXtb8JtDrWV4xH4gE5fz/4xlgqKKsovQNWE=;
        b=UtkR6nPooD5FNUO3zfC3hwGbWj5SCOgtmO7DzGyVN77NofumXvyeIMuaBuVVNfMPP8
         kWqjeDTza5CS/w68W0kGsKlEzbzlPlTr8akbJYyC8BI4UqfKVlPI/O0PI5r7YRyEfMW3
         ME9ujYEmErst70jDpMWRjjCGPhQHcZ7kQKnkQvBhje9VrAZ40bYaB0DgU0TFanz9XQ6G
         /CAm8fpThe9B396s2QqnXXzGBadjcYsMVAJ0QDUBjZMNQUInlh5DHJElKDgKj6nkjDcD
         t5NbQgYv2o/W45WiqX1OB2gUts71P2F9pCDGYX7l28IR6VBLf4Jl34dS2SLMtpdqHnHQ
         7kFw==
X-Forwarded-Encrypted: i=1; AJvYcCWch4vLD01xijO9gt601VAvtEWy2yiYcs/Od2uHrfuPdYQgPGBNhb3xBKH5Ubl7M1IjCBtn0yllODFIJekMjUbn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7YSHeyi9uh/d4NFUv1eL3gmOnxogf446mvItEG3pcAuUAbUWS
	YoM07LJAzAokIYycCYYbfgxIBx2STYUA+FHST1DD9kRy1Aa4Ft9o2WBR7m7HITreyfKzG7y9/pL
	NhMEDNWy2OmbmFzHlmY78nnGchwJmkSrRnQFtT9FLVA==
X-Gm-Gg: ASbGnctEsDayv93EncqXMCcJRL2G075XNuUCaGx3oDXoQgjJV2t1sWLez4XL9iSLlcE
	m3j6NzMakrgnmj+VTucIE8+6faY7/1QiZsRi43hUQ39ylh7T/1X1qjapBLJClso356bt2iVz+pW
	DukoPvJ1sqX+KgKlBjCb001xsilkz+ZPHJ/4+01SY6vgt6yPv5uWiUBYJCKhxDa5eBlX9szA2bh
	1YTfg==
X-Google-Smtp-Source: AGHT+IHawplYNXt0Xk96mNtSAEAp52yUSKjVefDzMRnwkFSkTZcoaKk+ZYugied/egHWgCi9PaKRpIxtR3J4UeIUxyo=
X-Received: by 2002:a05:690c:7202:b0:71b:69fd:2571 with SMTP id
 00721157ae682-71bdbcfb84fmr3438637b3.32.1754503617394; Wed, 06 Aug 2025
 11:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250806070030epcas2p24cc79e6dd3e505afd980fc05ee9e4f19@epcas2p2.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-4-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-4-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 13:06:46 -0500
X-Gm-Features: Ac12FXzzprozXvP76pSORFyQ-L_jvtIZlH-PiTmfaMmvcTJCzW2IyjQ268pBDg4
Message-ID: <CAPLW+4n=H3cPe=XqMfUJKqpPJdot9t0j_kBMkNY3W+x9buokTg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] watchdog: s3c2410_wdt: Increase max timeout value
 of watchdog
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110658_812189_BF583E3A 
X-CRM114-Status: GOOD (  26.46  )
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
> Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
>
> cat /sys/class/watchdog/watchdog0/max_timeout
> 3665038
>
> [    0.330082] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=3D1099=
511400000, timeout=3D3665038, freq=3D300000
> [    0.330087] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3D36=
65038, divisor=3D256, count=3D1099511400000 (fffffc87)
> [    0.330127] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
> [    0.330134] s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog: coun=
t=3D0xfffffc87, wtcon=3D0001ff39
> [    0.330319] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset =
enabled, irq disabled
>
> If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk fl=
ags,
> and it will operate with a 32-bit counter. If not, it will operate with a=
 16-bit
> counter like in the previous version.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 0a4c0ab2a3d6..673ab6768688 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,7 +34,8 @@
>  #define S3C2410_WTCNT          0x08
>  #define S3C2410_WTCLRINT       0x0c
>
> -#define S3C2410_WTCNT_MAXCNT   0xffff
> +#define S3C2410_WTCNT_MAXCNT_16        0xffff
> +#define S3C2410_WTCNT_MAXCNT_32        0xffffffff
>
>  #define S3C2410_WTCON_RSTEN            BIT(0)
>  #define S3C2410_WTCON_INTEN            BIT(2)
> @@ -124,6 +125,10 @@
>   * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting th=
e
>   * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debu=
g mode.
>   * Debug mode is determined by the DBGACK CPU signal.
> + *
> + * %QUIRK_HAS_32BIT_CNT: WTDAT and WTCNT are 32-bit registers. With thes=
e
> + * 32-bit registers, larger values will be set, which means that larger =
timeouts
> + * value can be set.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG                 BIT(0)
>  #define QUIRK_HAS_PMU_MASK_RESET               BIT(1)
> @@ -131,6 +136,7 @@
>  #define QUIRK_HAS_PMU_AUTO_DISABLE             BIT(3)
>  #define QUIRK_HAS_PMU_CNT_EN                   BIT(4)
>  #define QUIRK_HAS_DBGACK_BIT                   BIT(5)
> +#define QUIRK_HAS_32BIT_CNT                    BIT(6)
>
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -199,6 +205,7 @@ struct s3c2410_wdt {
>         struct notifier_block   freq_transition;
>         const struct s3c2410_wdt_variant *drv_data;
>         struct regmap *pmureg;
> +       u32 max_cnt;
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_s3c2410 =3D {
> @@ -412,7 +419,7 @@ static inline unsigned int s3c2410wdt_max_timeout(str=
uct s3c2410_wdt *wdt)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>         //(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV =3D 0x8=
000
> -       u64 t_max =3D div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);
> +       u64 t_max =3D div64_ul((u64)wdt->max_cnt * 0x8000, freq);
>

If you rework the hard-coded 0x8000 value w.r.t. my comments for the
previous patch, this should be changed accordingly too. So either:

    u32 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV=
;
    u64 t_max =3D div64_ul((u64)wdt->max_cnt * div_max, freq);

...or...

    u32 cnt_max =3D (u64)wdt->max_cnt * (S3C2410_WTCON_PRESCALE_MAX + 1) *
                  S3C2410_WTCON_MAXDIV;
    u64 t_max =3D div64_ul(cnt_max, freq);

Apart from that, looks good to me:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>         if (t_max > UINT_MAX)
>                 t_max =3D UINT_MAX;
> @@ -571,7 +578,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>  {
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
>         unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> -       unsigned int count;
> +       unsigned long count;
>         unsigned int divisor =3D 1;
>         unsigned long wtcon;
>
> @@ -581,7 +588,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>         freq =3D DIV_ROUND_UP(freq, 128);
>         count =3D timeout * freq;
>
> -       dev_dbg(wdt->dev, "Heartbeat: count=3D%d, timeout=3D%d, freq=3D%l=
u\n",
> +       dev_dbg(wdt->dev, "Heartbeat: count=3D%lu, timeout=3D%d, freq=3D%=
lu\n",
>                 count, timeout, freq);
>
>         /* if the count is bigger than the watchdog register,
> @@ -589,8 +596,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>            actually make this value
>         */
>
> -       if (count >=3D 0x10000) {
> -               divisor =3D DIV_ROUND_UP(count, 0xffff);
> +       if (count > wdt->max_cnt) {
> +               divisor =3D DIV_ROUND_UP(count, wdt->max_cnt);
>
>                 if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>                         dev_err(wdt->dev, "timeout %d too big\n", timeout=
);
> @@ -598,7 +605,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>                 }
>         }
>
> -       dev_dbg(wdt->dev, "Heartbeat: timeout=3D%d, divisor=3D%d, count=
=3D%d (%08x)\n",
> +       dev_dbg(wdt->dev, "Heartbeat: timeout=3D%d, divisor=3D%d, count=
=3D%lu (%08lx)\n",
>                 timeout, divisor, count, DIV_ROUND_UP(count, divisor));
>
>         count =3D DIV_ROUND_UP(count, divisor);
> @@ -806,6 +813,11 @@ static int s3c2410wdt_probe(struct platform_device *=
pdev)
>         if (IS_ERR(wdt->src_clk))
>                 return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed =
to get source clock\n");
>
> +       if (wdt->drv_data->quirks & QUIRK_HAS_32BIT_CNT)
> +               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
> +       else
> +               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_16;
> +
>         wdt->wdt_device.min_timeout =3D 1;
>         wdt->wdt_device.max_timeout =3D s3c2410wdt_max_timeout(wdt);
>
> --
> 2.25.1
>


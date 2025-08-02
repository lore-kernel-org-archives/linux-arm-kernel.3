Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F57C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpxdVaZT3ggTcwknhmogVGgx1QkratO9Z6FQeGJw1EM=; b=uB0brIO15tIi5VDn3BVs3J4trg
	3gZiYJnLrQxZMaFN1L3idjc4NLylUK4cZAecQpO0t1Z33ux/d7tDHr03YhYRRd2w9tBkhqbeIHppG
	RZFiuRZFgDvSXQmkfUAEPMbrvvcbdoKMTLsIiEH9B1elRWOJggMiGetJMLJfUBvvNtuYYNNLrJyFg
	02SW6feY8nY839qgoIvV8tJwX6H3s4aRzY8Koz4wNvXCgxM5wdES3hi+i5q4xuSc/92sjMNeFmnSU
	IDPY6zId/XtwNH4Zui0IUhC7UXhCGlp8QaIzhSYA1rDn783FIgrc1gjLNIHRHjvM1ovrHPG1FtaD4
	AjKvzPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui41x-00000007BTd-1f98;
	Sat, 02 Aug 2025 04:39:37 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui3zM-00000007BJX-1Zhk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 04:36:57 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-71840959355so29022687b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 21:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754109415; x=1754714215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpxdVaZT3ggTcwknhmogVGgx1QkratO9Z6FQeGJw1EM=;
        b=u02KeNRC93ZZLIsig4Zz1W33GfUKSAkTrBsl2p7hvmczHJPNQkMiSKgOSpcZznTuX+
         fNAOqSd5iBj3vTExxtYvcbNPpSOQHYPBs+q2ooq3oqnWmSEB9G61j6eOBlo6E/igD82R
         vWtFCeIiqXEtIfQR3hVCj37erF57jdGEq66Gdiib9GSg2gxnxSKfe40VHfgH1vga0qP2
         P4VSLfvLNRqtvlmCsav7qA2iAB2bwciJVT+hsU19vacX/2S/rvQIs4/y0TohsaPHf3F4
         bEOuJF0RNXV9l07JLY/mrIPnPTGmvcbb882uoLMJf5JLQZggrsKkCo4wGfV6k4XQrB6A
         j48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754109415; x=1754714215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpxdVaZT3ggTcwknhmogVGgx1QkratO9Z6FQeGJw1EM=;
        b=j148Gs2Nm5HmBQeEZ1bkkAgbV4V9qQ1kh2eOM5dU8p65TF7wa6uQupVr6oRgkAxjQs
         qANtaMbw5TH+GY+XGvmvZrcoHdE0Ueic2Jd/asaxkZFytwCcjQeyAvOQfuGuxVLI7D0w
         8DRBmX/hJ48yIj2zIUeRsSvvnNmABAaszLgZC+85wYiP2PGn3P30kOwQxFMkhJwbofry
         j3b16rgWcOHd6CDaGOs5CYKv4CrD9k2zQ55zDZyVIAIx9ZZcm8A7F3BCM+uo6vEJj5iE
         6FlkbwqjRLuTFI8v3gtRl8jxE+vPPfjz39ybpuGQi6Ra+x5+vXlcl4qvzeqmDAAgasLR
         vMIw==
X-Forwarded-Encrypted: i=1; AJvYcCX4A2CaL9Co+sy+AVV0aqeKSVlkTTnLfJ/Q+gUK5T9LOdDqZHLtN+ycLk/wj0f/TcyDLv4UuUf3Q7uZbjZ0O+Ry@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+vtD/y4GxN4oHkMbdJIwFaNth+aNX1X9L7dVV9JuEJuqS0InB
	VxeiGVhrofEwbHeOTgjb60gbpkuPxkcZqxohA5c9UGdcSlHzxDIjPvrAq+Ximt0ynX/kWNiF8Eq
	QwB0LPvzLdh/FX86GJ8bfGjjif7XHFG6Z6AMQT597ow==
X-Gm-Gg: ASbGncuA8XN6GTXY/2R/O/Dipgl8V1gkBjDVMib2S6obK9VD643olbKD8uB8q8euhyD
	cEilHwZ5n/X0fXKRREsx5NkjPAIIF60/miO6Kw+NNJsy750UaWwqwtLAehocQo9A/DFHea3UsF7
	/GbrA8KzwWqfR1kX5ouZmR2NuPfxNXnSzpEu73lAvXtqjlluN3IKcv260YC7cGJflMA4xI2naX1
	8HU3Q==
X-Google-Smtp-Source: AGHT+IGvyU2/m5mcNXoIxo2H4bSkhxZ4X2l1B3N+OEYonJy6sNo7cQul9ylw34vrCJlg2gEXDNbyOXxChcvqz/OtoKE=
X-Received: by 2002:a05:690c:a088:10b0:70e:404f:6714 with SMTP id
 00721157ae682-71b5a8d640fmr80202237b3.19.1754109415216; Fri, 01 Aug 2025
 21:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-4-sw617.shin@samsung.com>
In-Reply-To: <20250724080854.3866566-4-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 23:36:44 -0500
X-Gm-Features: Ac12FXypoGhwaCr-zezDkh9lDEjeLpymS8fUEtxXp0UPR8OQmiwsykO4dBxTXtU
Message-ID: <CAPLW+4mo-Fw5+KmwHdZGAM4uNpOWL6QakTgP-wMSxR=+dMGqsQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] watchdog: s3c2410_wdt: Increase max timeout value
 of watchdog
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_213656_429410_5423BF33 
X-CRM114-Status: GOOD (  30.70  )
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

On Thu, Jul 24, 2025 at 3:13=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
>
> Increase max_timeout value from 55s to 3664647s (1017h 57min 27s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
>
> cat /sys/devices/platform/10060000.watchdog_cl0/watchdog/watchdog0/max_ti=
meout
> 3664647
>
> [    0.302473] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=3D1099=
394100000, timeout=3D3664647, freq=3D300000
> [    0.302479] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3D36=
64647, divisor=3D256, count=3D1099394100000 (fff8feac)
> [    0.302510] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
> [    0.302722] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset =
enabled, irq disabled
>
> If system has 32-bit WTCNT, add QUIRK_HAS_32BIT_MAXCNT to its quirk flags=
, then
> it will operation with 32-bit counter. If not, with 16-bit counter like p=
revious.
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Not a strong point, but I'd break this patch into two:
  1. Add 32-bit counter feature (without enabling it in exynosautov920
implementation)
  2. Enable 32-bit counter feature in exynosautov920

>  drivers/watchdog/s3c2410_wdt.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 31f7e1ec779e..184b1ad46ca6 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,6 +34,7 @@
>  #define S3C2410_WTCLRINT       0x0c
>
>  #define S3C2410_WTCNT_MAXCNT   0xffff

Suggest renaming this to S3C2410_WTCNT_MAXCNT_16, to emphasize the
fact this value is for 16-bit counters. And for consistency with the
below one.

> +#define S3C2410_WTCNT_MAXCNT_32        0xffffffff
>
>  #define S3C2410_WTCON_RSTEN            BIT(0)
>  #define S3C2410_WTCON_INTEN            BIT(2)
> @@ -123,6 +124,10 @@
>   * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting th=
e
>   * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debu=
g mode.
>   * Debug mode is determined by the DBGACK CPU signal.
> + *
> + * %QUIRK_HAS_32BIT_MAXCNT: WTDAT and WTCNT are 32-bit registers. With t=
hese

Why not name it like QUIRK_HAS_32BIT_CNT or QUIRK_HAS_32BIT_COUNTER?
As I understand, the quirk means that the chip has 32-bit counter, so
MAX bit is not really needed?

> + * 32-bit registers, larger values to be set, which means that larger ti=
meouts

Spelling: "to be set" -> "will be set" (or "have to be set").

> + * value can be set.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG                 BIT(0)
>  #define QUIRK_HAS_PMU_MASK_RESET               BIT(1)
> @@ -130,6 +135,7 @@
>  #define QUIRK_HAS_PMU_AUTO_DISABLE             BIT(3)
>  #define QUIRK_HAS_PMU_CNT_EN                   BIT(4)
>  #define QUIRK_HAS_DBGACK_BIT                   BIT(5)
> +#define QUIRK_HAS_32BIT_MAXCNT                 BIT(6)
>
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -198,6 +204,7 @@ struct s3c2410_wdt {
>         struct notifier_block   freq_transition;
>         const struct s3c2410_wdt_variant *drv_data;
>         struct regmap *pmureg;
> +       unsigned int            max_cnt;

Maybe make it u32? It definitely refers to a 32-bit register value, so
will be more explicit that way. Not a strong opinion though.

>  };
>
>  static const struct s3c2410_wdt_variant drv_data_s3c2410 =3D {
> @@ -349,7 +356,7 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov920_cl0 =3D {
>         .cnt_en_bit =3D 8,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_DBGACK_BIT,
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 =3D =
{
> @@ -362,7 +369,7 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov920_cl1 =3D {
>         .cnt_en_bit =3D 8,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_DBGACK_BIT,
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,

Yeah, I think it would be easier to review and handle further if this
exynosautov920 enablement is extracted into a separate patch.

>  };
>
>  static const struct of_device_id s3c2410_wdt_match[] =3D {
> @@ -411,7 +418,7 @@ static inline unsigned int s3c2410wdt_max_timeout(str=
uct s3c2410_wdt *wdt)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>
> -       return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
> +       return wdt->max_cnt / DIV_ROUND_UP(freq,
>                 (S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
>  }
>
> @@ -566,7 +573,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>  {
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
>         unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> -       unsigned int count;
> +       unsigned long count;
>         unsigned int divisor =3D 1;
>         unsigned long wtcon;
>
> @@ -576,7 +583,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
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
> @@ -584,8 +591,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>            actually make this value
>         */
>
> -       if (count >=3D 0x10000) {
> -               divisor =3D DIV_ROUND_UP(count, 0xffff);
> +       if (count > wdt->max_cnt) {

wdt->max_cnt + 1?

> +               divisor =3D DIV_ROUND_UP(count, wdt->max_cnt);
>
>                 if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>                         dev_err(wdt->dev, "timeout %d too big\n", timeout=
);
> @@ -593,7 +600,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
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
> @@ -801,6 +808,10 @@ static int s3c2410wdt_probe(struct platform_device *=
pdev)
>         if (IS_ERR(wdt->src_clk))
>                 return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed =
to get source clock\n");
>
> +       wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT;
> +       if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))

Double braces don't seem to be needed.

> +               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
> +

Style (minor nitpick): this block can be more explicit, i.e.:

       if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
       else
               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT;

>         wdt->wdt_device.min_timeout =3D 1;
>         wdt->wdt_device.max_timeout =3D s3c2410wdt_max_timeout(wdt);
>
> --
> 2.25.1
>


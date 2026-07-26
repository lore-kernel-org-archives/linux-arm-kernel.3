Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6945C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 08:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3/Czl+COk9w01pROEOZpbCYgsdFmFL2CocMf8Tbq88=; b=QLPIFYMuM3Mr2vUL+aNEhtmAA7
	fB16Gn63GR/PmWBVFu/AJpLhqPjHBQLTMN9zlGccmKwnE2No9+T+hkUZmVeanTdcmVkt+nx7Bl0mx
	bUWK1gqs4h3NDDC3PkKOH+k2pF+F4lNM3RCfIi7gkWrdknU/xw+NFNG9Fy20lpTqk0wfbOmqkA/xH
	2PAIUNA8h32X+8/2p3fWcP/J6OAa4tTc8975jNPLk/IoEhUtYVVoLeHfgmIAut/DOOmT1qVzRyTg4
	nRvXDb4A6WZatWg2AHDYbBmqJp9AOKJ9aSjsjGOstfFSDr4DexS+01/UDT85yV1p5JW4/yEVamB7s
	6c1asGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnu1u-000000010Mb-15HI;
	Sun, 26 Jul 2026 08:16:14 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnu1s-000000010M2-02kn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 08:16:13 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6aae019c09bso1034451eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 01:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785053770; x=1785658570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3/Czl+COk9w01pROEOZpbCYgsdFmFL2CocMf8Tbq88=;
        b=Rf3C0ENOhKMyLBSm3ffZoOf2QlABJerolSlFmEtID0FgShZD7Wr/7nSkv2MOeWLUFs
         lJk/Eks8T18d7F4nzhuRkFlKCB9PyNkLX388uAEUo73rk11m3TnCv5xDfTWBO5RmRpMS
         Pu4w0U4aYyi43xQv8mGRpjB3NAbL7Bg8s3jbZYRuGhw+67Dx/B0OODv60zPxiEr9+fLu
         /Ax21Vuto6WWSOGsmI43FSr/HEpEpw+PNc2D2MVuGwS+0Ti2DMo+69A1X1l+BT3AjhvY
         gcbLZ2R9q0llcOpfHO0YQpfvWyS/sTnxI2CqWgGsPTEFzACi6CSZ7Ekm/dUYsxD5ny+7
         nyrA==
X-Forwarded-Encrypted: i=1; AHgh+RpHZtiUUkZ1H31uwInxU2y/4PPbGMxHwwM4ySInmq9GanoVv3Bt0oCADbZVUHNBQf1zuLboB7nV7Jf9mVtCA8Ti@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5u6+gc/SJLWnKyU4WzNt3BdSrblVKjR9V06hupIOvPEGAyPru
	T6HT8ZSIBQ0DQAKMLyyRxT0fJ25j0Z6mWQtAVXd1Jeg3spg2fM78l7xl9x3vfwLPFQ==
X-Gm-Gg: AR+sD12j1HDvow5Pfv4ochw7JJAskmKUJydb8EUifje7Kcv5HNHvi7OT9QhEOq9qiRP
	fI1yLNHaZnBtsaM9x6qs+88OWsyCqjQrf4XCXR0UG9ovWjz33LGIIC4sDOe/EAQLqYWRt8dnO7R
	16XgFo0+pBOAZzOlzCHmGFGR9Etqnwfy/CLJqxLT/5ewDqBFPvuhzimUp3c8slajlB3K9TD4Prx
	+AXJTs8nJgwgjkKHmTJ1TLiMF9BxnK6C0mJyCAk3pmRINvnYVVkozdEd0LM3Bo529zbaSk2umto
	8ok0CJJow+d7KbZ6V9OyavCMQ+i/YpcuLj/ZNHjHFRr5QjmfuoM7SqwMHRYt9mIo3jOT7P/y+bK
	SX3Jq5BUQh3XZGMX/BEUmt/t2THpmO4tQda1cQ0NTvVNsW8wqe7x2iU9RQv/uVNOPdBIxN70iyA
	f+Zsf8yadayaoU3TO11ygSYC1vz9P7j2NGA5zzvOCYJdnDJVXfa48DJAWvhsl1ADGFco2K6inn
X-Received: by 2002:a05:6820:4cc1:b0:6a3:e15e:f3bd with SMTP id 006d021491bc7-6aaffa23a3fmr3883340eaf.54.1785053770272;
        Sun, 26 Jul 2026 01:16:10 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf96f5dd0sm2972478eaf.13.2026.07.26.01.16.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 01:16:09 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aaff45003fso471915eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 01:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr80XkiL3kS5LbMDTAno/hqVNn9UaEfh93d1z5wpL4QH05J8l972hg9AiliW1ERWYIPd2fjvW8v9B/Vxrg//F2c@lists.infradead.org
X-Received: by 2002:a05:6820:1a07:b0:6a3:94bc:bdcf with SMTP id
 006d021491bc7-6aaffa23c8dmr3588711eaf.57.1785053768456; Sun, 26 Jul 2026
 01:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-2-fourdollars@debian.org> <al51g77Zsdr3OyBS@ashevche-desk.local>
In-Reply-To: <al51g77Zsdr3OyBS@ashevche-desk.local>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Sun, 26 Jul 2026 16:15:57 +0800
X-Gmail-Original-Message-ID: <CAAT15mNscX3-PChHGZ3iE+sHHted74Mo+dP=x_rfeAuu77w_Tw@mail.gmail.com>
X-Gm-Features: AUfX_mwSSUq4mpHdPGRdERx0wviVImIOJ13XOXAQfqWnzyGYCfq9MB5T7xI5qTE
Message-ID: <CAAT15mNscX3-PChHGZ3iE+sHHted74Mo+dP=x_rfeAuu77w_Tw@mail.gmail.com>
Subject: Re: [PATCH v16 1/7] spi: pxa2xx: introduce clock enable and disable
 helper functions
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_011612_089010_378C931D 
X-CRM114-Status: GOOD (  27.59  )
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

Hi Andy,

  Thanks for the detailed review comments.

On Tue, Jul 21, 2026 at 3:22=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 12:21:10AM +0800, Shih-Yuan Lee wrote:
> > The driver disables the clock during PM runtime suspend, PM system
> > suspend, and device unbinding (remove). It also disables the clock
> > on various error unwinding paths in pxa2xx_spi_probe().
> >
> > However, if the clock is already disabled (for example, if the device i=
s
> > already runtime-suspended during driver unbinding), calling the common
> > clock framework's clk_disable_unprepare() again leads to clock prepare/=
enable
> > count underflows, generating kernel warnings.
>
> Any real life example here?
Yes, a concrete real-world scenario occurs during sysfs driver
unbinding while the device is in PM runtime suspend:

  1. When the system is idle, PM runtime suspends the controller,
disabling the clock (clk_disable_unprepare()).
  2. If the user unbinds the driver via sysfs:
   echo 0000:00:15.4 > /sys/bus/pci/drivers/pxa2xx_spi_pci/unbind
  pxa2xx_spi_remove() is invoked.
  3. Without clk_enabled tracking, pxa2xx_spi_remove() unconditionally
calls clk_disable_unprepare() a second time on the already disabled
clock.
  4. This triggers a Common Clock Framework (CCF) underflow warning:
  WARN_ON(clk->enable_count =3D=3D 0)

A similar underflow occurs if pxa2xx_spi_probe() fails and executes
error unwinding after disabling the clock.
>
> > Introduce pxa2xx_spi_clk_enable() and pxa2xx_spi_clk_disable() helper
> > functions that track the clock enable state using a new 'clk_enabled'
> > boolean flag in struct driver_data.
> >
> > This ensures clk_disable_unprepare() is called only when the clock is
> > active, preventing clock underflows during suspend transitions and unbi=
nd.
> > It also allows the probe function to safely unwind resource allocations
> > without triggering clock underflows.
>
> ...
>
> Same issue, I have no cover letter in my mailbox. Please, slow down and c=
heck
> your email setup. Something is wrong.
Duly noted. I will check my git send-email configuration and ensure the
cover letter is properly sent as the thread root.
>
> ...
>
> > +static int pxa2xx_spi_clk_enable(struct driver_data *drv_data)
> > +{
> > +     int ret;
> > +
> > +     if (drv_data->clk_enabled)
> > +             return 0;
> > +
> > +     ret =3D clk_prepare_enable(drv_data->ssp->clk);
>
> > +     if (ret =3D=3D 0)
> > +             drv_data->clk_enabled =3D true;
> > +
> > +     return ret;
>
> Use usual pattern
>
>         if (ret)
>                 return ret;
>
>         ...
>         return 0;
>
> > +}
Will update in the next version to follow the standard guard pattern:

    static int pxa2xx_spi_clk_enable(struct driver_data *drv_data)
    {
        int ret;

        if (drv_data->clk_enabled)
            return 0;

        ret =3D clk_prepare_enable(drv_data->ssp->clk);
        if (ret)
            return ret;

        drv_data->clk_enabled =3D true;
        return 0;
    }
>
> > +static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
> > +{
> > +     if (drv_data->clk_enabled) {
>
>         if (!drv_data->clk_enabled)
>                 return;
>
> > +             clk_disable_unprepare(drv_data->ssp->clk);
> > +             drv_data->clk_enabled =3D false;
> > +     }
> > +}
Will update in the next version to use early return:

    static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
    {
        if (!drv_data->clk_enabled)
            return;

        drv_data->clk_enabled =3D false;
        clk_disable_unprepare(drv_data->ssp->clk);
    }
>
> ...
>
> > struct driver_data {
>
> >       void __iomem *lpss_base;
> >
> > +     bool clk_enabled;
>
> How is this protected against simultaneously called enable/disable on dif=
ferent
> CPUs?
pxa2xx_spi_clk_enable() and pxa2xx_spi_clk_disable() are only invoked
within serialized contexts:

  1. Driver probe() / remove() paths (serialized by bus locks).
  2. PM Runtime callbacks (serialized by dev->power.lock in PM core).
  3. System suspend / resume callbacks (serialized by PM subsystem).

They are never called concurrently from asynchronous contexts or worker thr=
eads.
>
> >       /* Optional slave FIFO ready signal */
> >       struct gpio_desc *gpiod_ready;
> >  };
>
> Whenever you add the field, check with `pahole` that the layout is optima=
l.
Thanks for pointing out pahole. Checked with pahole: bool clk_enabled;
is placed immediately after bool suspended; in struct driver_data.
Since both are 1-byte booleans, clk_enabled fits into the existing
struct padding byte, resulting in zero additional hole padding and keeping
the total struct size unchanged.

Thanks,
Shih-Yuan


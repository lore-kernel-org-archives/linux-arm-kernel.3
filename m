Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B2BC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 06:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtkW0R9L1WzRthBVOFdrAk5MXzpeymlEQ3IDXCT5EV4=; b=oS791tBkBodtfbRDuOg6x/uxrb
	jQf2YvamU1TXnPWXciVhTUSUCqeyQOzE2+egXDB2Tz0rYFRLQiaimgDMBki+PyIDEps++MVdiNNkw
	JBlohjE5aIXad099NcW+Wc7RtRws084mdnKcPGMtl42DycYHuNop6HDOjA3b6QHltvmCuYX5vmXV6
	7bwRUrMcz6PdvIrQ7jPJlsTKyjYl/4QPOXaugI1MlvZM5zcENEIhP8XQvUcvvPXDce6aO022i9apT
	CQ4dEFbJMer+MnvGDA2lUhxbT4yDA96gWUD7ve7uqxHFpO4WTJRAebwJDxmKOiGavm9RaA0sprVJK
	9NZW2K7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqQ8T-0000000FQtP-0OJm;
	Sun, 02 Aug 2026 06:57:25 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqQ8Q-0000000FQsk-0Oek
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 06:57:24 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-738cdd667ceso553991137.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 23:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785653841; cv=none;
        d=google.com; s=arc-20260327;
        b=Z8MLzVZXj6GDQAm79pwCMLDx4toNyoFk/QDJZyukRKJgxn4345qfV3wQS1hOEYEOGI
         PEJZlHnNglAqVftWwOEphoZE8eMph6MK+BEltKG6Y50cBE+PwCuyVeiJ1Wh5136TFqwf
         wVJDknyY2GKu+8jobJsfHgtfcIHoIsZuDfbB10o3J4tHfjDuVI6dyRaxZCVq3LDwaHaM
         rCkr97p+QpPYzQAouxQ3nuwO1kcJ9ek8m5LREJ/EObm+fx26Ca0fQZwIX5sOI9BmZM23
         SnGaTk9msv+T09P9ZMeovswStkW0g09qcD6QI2DzkYky8qU1vSRYKnC4GCOM9OpeRKBm
         frQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wtkW0R9L1WzRthBVOFdrAk5MXzpeymlEQ3IDXCT5EV4=;
        fh=Op46tulQknbZ/MsZh5KrmCY68tEMneH691zHwuiLCSU=;
        b=JAifO+HrEPYPH/vuYLTHp3mvQHfwl+Ph/4GoAKDE0Y8AHesPhhu9qu/6TCUkr0MJKM
         LomsFqPTlUKCe8n4kXMhAXE0mbxVtG+ZiB5Lq86lxXNndVGt4YT0cL5WGkIUxpDeQbjB
         dnyUiS0v7xTwVTOMRV3G4bOCpvRvewk8bRi7iGWPKFo2NS7dDxKg8JdWrBlZ2k3cQ8IK
         Is9N6Ce4XWtJ2OXQYs5YxoIVhq5YMuDA5lhvYFXVmMtbcN2Z/+5VH440r8En/SvO2P5D
         lsTCmRO0FtrCQxKqWMSPyCJzhiNO18KSFHcc0SYQ7omSSvFJ2y/w8F+cFnmTESFCI/4n
         CKgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785653841; x=1786258641; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wtkW0R9L1WzRthBVOFdrAk5MXzpeymlEQ3IDXCT5EV4=;
        b=YUOivBueud3d+EtIEwj83fcQvxIWJ968n4IP8qnnnSVe8CVtrpkpjmFNffb6cJf1DB
         3zjwNos5zc/7RyYRwEJMblNLr9iX/C9sjMVuu7XjCk54ylZweUR5q2DQZ9WY1LIKej7o
         bsSBOZE9bHTyF6fj6c4fjui3174UVmUbmmplJc5x5kAa0LecLFWYscEZFH25YguibWtG
         jwH1q2RDkkBtFiTa+db41dHZpkckGmZRmhW682AJo7YsDbiGNyY34OV6yi5UUQXOwY1R
         OfH8PHy+g8RlM6JL7+1JJILz+wLSd6mVBZHOC5vs4lK60hB5GfUBoOlVCE3vTxeQT2xp
         1qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785653841; x=1786258641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtkW0R9L1WzRthBVOFdrAk5MXzpeymlEQ3IDXCT5EV4=;
        b=lDOhccWOmMw9hTIYBY0MXnLvWJIJnPR+5PWB2CljhX47wpD4clUVs9yhZ/+E1iJEHw
         3OKP7+qRU3WFrf+XoLgNDbuDDr2BMBNNNrI9T71Ru4ABByGLf6e7OmgZG2u8aGrXGpyY
         qw6L2kPUYAM0Dlh9i21pZCXhkZByP60q2JAeMeDST3AxBQdSMwUpnqNx7K7nuYgNjNDp
         CbBxc9cWUcrlwqOak1F2dg7vpXD+PEw30UOnsDBG6InaPaAZPmdGL0Z10dFgwB5Faos5
         CWGUljedPudpcNYSHOxsMn5kgm1DsWD9ntXrIW51B8ZLNmdGYL8/Lxl+4HJitcxHR7IQ
         mUJA==
X-Forwarded-Encrypted: i=1; AHgh+RpOjbv1QHCN6D4fhAOJQ7tyRTOrhu6oudga7taBA0dRyIHiDlRA7FqNE8WA2o1da2B8WbC8aKZVF4Usq4XkiODG@lists.infradead.org
X-Gm-Message-State: AOJu0YxVadPUtihALmVtC/X3jTwcfDJWkMnprG8VkJG6h+qKjZ8sC0LY
	Zu0DR6j17RYL7FSLrHRb3pJEjfs1YpR+JNfv2yHsWv18qqpY5rQNljZZPZ1y9IkSCgaML6tXBSZ
	vWr4taLSoF3FP4JRuvwzLo50AVDIf0jE=
X-Gm-Gg: AR+sD12hXmc/kp81Av9GXQn3Tl/c7nz+WcfgU3bLn/GCCwftxkCg9zY9Quz9HVPE5Ch
	HT7yGAT20Lc9/cuUezTK0Sel1lG0CYRf/k/oC7jM1c5Bnc1bg8XsSwLI2horol5rYeQ0GiwmoPH
	Oc1orDlyvKFyCHCXXzpSV/W8jMRxMWwNsyqXwQBGznJ6JEF4QMYkPfluEgPq0ePwZk5Xo8lA7im
	3F+SfMDkaeJ8uSxvIgdZiurD7bp84K4FbdOBx2nlW56mhA0AV6txLX2Ss5uh1W+rKrTTe+rzYH8
	4fQ6xfJDeRi4DJMD4YvwzCi6BesEPzpFbHBm6mGV0zXjxvkFIZ5COhpzvjIie1winyklpVwaRd8
	=
X-Received: by 2002:a05:6102:3ec1:b0:740:177:f357 with SMTP id
 ada2fe7eead31-75b21b5cddamr4703145137.6.1785653840583; Sat, 01 Aug 2026
 23:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org> <20260723-exynos-dsim-fixes-v3-2-0c31ae1dbecc@disroot.org>
In-Reply-To: <20260723-exynos-dsim-fixes-v3-2-0c31ae1dbecc@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 2 Aug 2026 15:56:43 +0900
X-Gm-Features: AUfX_mw50HwgZ9Tzu4pmNQbb3I4THHxFrSfTGd-5rpmu4ySRW8DCN5G-vjpsyfk
Message-ID: <CAAQKjZMP+iQAZUGG0LtbXJWivOjVXCLB=uaqmYkenvmNK=S_vQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: samsung-dsim: use DSIM interrupt to
 wait for PLL stability
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_235722_199677_C4A298F8 
X-CRM114-Status: GOOD (  38.13  )
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

HI,

2026=EB=85=84 7=EC=9B=94 23=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 4:04, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Stabilizing PLL needs to be waited for. This is done using a loop,
> checking the PLL_STABLE bit in the status register.
>
> DSIM fires an interrupt when the PLL is stabilized. Rely on this
> functionality for stabilization wait, getting rid of the implicit loop.
>
> This has been tested on a Galaxy J6 (Exynos 7870). Unfortunately, since
> testing on all supported devices is less feasible, introduce a stop-gap
> measure where the timeout has a gracious lower bound of 100
> microseconds. This will (hopefully) prevent regressions due to timeout
> on other devices.
>
> Suggested-by: Inki Dae <inki.dae@samsung.com>
> Link: https://lore.kernel.org/r/CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9=
NFDu13VU5w@mail.gmail.com
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 41 +++++++++++++++++++++++------=
------
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index da753ff6eed4..866cff205e71 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -17,6 +17,7 @@
>  #include <linux/export.h>
>  #include <linux/irq.h>
>  #include <linux/media-bus-format.h>
> +#include <linux/minmax.h>
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> @@ -788,7 +789,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>  {
>         const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
>         unsigned long fin, fout;
> -       int timeout;
> +       unsigned int timeout;

The value assigned to `timeout` below, `reg_values[PLL_TIMER] / fin`,
is an `unsigned long`. It compiles thanks to `__careful_cmp()` in
`max()`, but the result is silently narrowed to `unsigned int`. Please
make this `unsigned long timeout` instead.

>         u8 p, s;
>         u16 m;
>         u32 reg;
> @@ -849,19 +850,26 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
>         if (dsi->swap_dn_dp_data)
>                 reg |=3D DSIM_PLL_DPDNSWAP_DAT;
>
> +       /*
> +        * The PLL_TIMER value is the product of the timeout delay and th=
e APB
> +        * bus clock rate. Calcutate the timeout delay on-the-fly here.

Typo: "Calcutate" -> "Calculate".

> +        * It is assumed that the bus clock is the first clock in the pro=
vided
> +        * bulk clock data.
> +        */
> +       timeout =3D 100;
> +       fin =3D clk_get_rate(dsi->driver_data->clk_data[0].clk) / HZ_PER_=
MHZ;

`fin` is used earlier in this function as the PLL reference clock in
Hz, and is printed by dev_dbg(). Overwriting it here with a completely
unrelated value -  the APB bus clock in MHz - is confusing when
debugging. Please use a separate variable:

unsigned long bus_clk_mhz;
...
bus_clk_mhz =3D clk_get_rate(driver_data->clk_data[0].clk) / HZ_PER_MHZ;


> +       if (fin)
> +               timeout =3D max(dsi->driver_data->reg_values[PLL_TIMER] /=
 fin,
> +                             timeout);

Also, there is already a `driver_data` local at the top of the
function which the rest of the function uses. Only the newly added
code dereferences `dsi->driver_data->` directly, which is
inconsistent.

> +
> +       reinit_completion(&dsi->pll_stabilized);
>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>
> -       timeout =3D 3000;
> -       do {
> -               if (timeout-- =3D=3D 0) {
> -                       dev_err(dsi->dev, "PLL failed to stabilize\n");
> -                       return 0;
> -               }
> -               if (driver_data->has_legacy_status_reg)
> -                       reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> -               else
> -                       reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_R=
EG);
> -       } while ((reg & BIT(driver_data->pll_stable_bit)) =3D=3D 0);
> +       if (wait_for_completion_timeout(&dsi->pll_stabilized,
> +                                       usecs_to_jiffies(timeout))) {
> +               dev_err(dsi->dev, "PLL failed to stabilize\n");
> +               return 0;
> +       }

This is the main problem: the condition is inverted.

ait_for_completion_timeout() returns 0 on timeout, and the number of
remaining jiffies (> 0) on completion. As written, this reports an
error and returns 0 exactly when the PLL *did* stabilize, and silently
succeeds when it timed out.

Since samsung_dsim_set_pll() returning 0 makes its caller
samsung_dsim_enable_clock() bail out with -EFAULT, the display would
fail to come up entirely the moment a PLL_STABLE interrupt actually
arrives.

    if (!wait_for_completion_timeout(&dsi->pll_stabilized,
                                   usecs_to_jiffies(timeout))) {

The reason this still passed testing is the second issue below: the
PLL_STABLE interrupt never fires in the first place. The two bugs are
masking each other.

One more thing - this removes the only user of
driver_data->pll_stable_bit. The field declaration in the header and
all seven driver_data initialisers are now dead. Please drop them in
the same series. (has_legacy_status_reg is still used by
samsung_dsim_init_link(), so that one should stay.)

>
>         dsi->hs_clock =3D fout;
>
> @@ -1596,8 +1604,12 @@ static irqreturn_t samsung_dsim_irq(int irq, void =
*dev_id)
>                 return IRQ_HANDLED;
>         }
>
> -       if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
> -                       DSIM_INT_PLL_STABLE)))
> +       if (status & DSIM_INT_PLL_STABLE) {
> +               complete(&dsi->pll_stabilized);
> +               return IRQ_HANDLED;
> +       }
> +
> +       if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
>                 return IRQ_HANDLED;

Two problems here.

First, DSIM_INT_PLL_STABLE is masked in INTMSK, so this interrupt can
never be delivered. The only place that writes INTMSK is the
SW_RST_RELEASE path just above:

        unsigned long mask =3D ~(DSIM_INT_RX_DONE |
                               DSIM_INT_SFR_FIFO_EMPTY |
                               DSIM_INT_SFR_HDR_FIFO_EMPTY |
                               DSIM_INT_RX_ECC_ERR |
                               DSIM_INT_SW_RST_RELEASE);
        samsung_dsim_write(dsi, DSIM_INTMSK_REG, mask);

DSIM_INT_PLL_STABLE is not in that list, so it stays masked. And
Exynos 7870 has wait_for_reset =3D 1, so samsung_dsim_init() runs:

        samsung_dsim_wait_for_reset()   <- runs this handler, programs INTM=
SK
        samsung_dsim_enable_clock()     <- calls samsung_dsim_set_pll()

meaning PLL_STABLE is guaranteed to be masked by the time set_pll()
runs. As a result this patch performs no PLL stabilization wait at
all, and instead sleeps for the full timeout on every enable. Because
of usecs_to_jiffies() resolution, 100us rounds up to at least one
jiffy - 4ms at HZ=3D250, 10ms at HZ=3D100. That is a new latency
regression compared to the old polling loop.

Please add DSIM_INT_PLL_STABLE to the INTMSK list. It would also be
safer to program INTMSK explicitly right after reset, so that SoCs
with wait_for_reset =3D 0 (which never reach this handler path) are
covered too.

Second, the early return swallows concurrent events. `status` can have
several bits set at once, and everything has already been cleared
write-1-to-clear in INTSRC above. If PLL_STABLE and SFR_FIFO_EMPTY are
raised together, the samsung_dsim_transfer_finish() handling is lost
permanently and that transfer stalls until its own timeout. The
pre-patch code handled all three bits in one condition and fell
through, so it did not have this problem.

Please make the handling non-exclusive:

        if (status & DSIM_INT_PLL_STABLE)
                complete(&dsi->pll_stabilized);

        if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
                return IRQ_HANDLED;

Thanks,
Inki Dae

>
>         if (samsung_dsim_transfer_finish(dsi))
> @@ -2148,6 +2160,7 @@ int samsung_dsim_probe(struct platform_device *pdev=
)
>                 return PTR_ERR(dsi);
>
>         init_completion(&dsi->completed);
> +       init_completion(&dsi->pll_stabilized);
>         spin_lock_init(&dsi->transfer_lock);
>         INIT_LIST_HEAD(&dsi->transfer_list);
>
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index 03005e474704..e3433da21ad0 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -123,6 +123,7 @@ struct samsung_dsim {
>         int state;
>         struct drm_property *brightness;
>         struct completion completed;
> +       struct completion pll_stabilized;
>
>         spinlock_t transfer_lock; /* protects transfer_list */
>         struct list_head transfer_list;
>
> --
> 2.54.0
>
>


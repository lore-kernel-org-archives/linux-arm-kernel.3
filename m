Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54D5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hU/Rrco2eHgoRkaqU/aKPgtdcd60SOy8SNUe3WgzR/E=; b=HwgLugb0bWfcPel7Jo5wLqkjc6
	J2M19vXot8w/op4Pn9eVFz++cknBJ5Qo1y5QYm2fMV3HCVLuiQbIpIFsSAJxz3/mEV/xt0eDIpzBY
	xhlg+GzH7jtikmR57S57IZLQMpFLZpiHCdJ3XZv7Y0zG7hbj7vrY0GoHVlyZCHKWWXd1CeIZvxtfg
	QdrJc6Ig98tDh3UhsZBfZbTgiVW+fmXcxYrzXVVdxCwfMESKKy3OroNfRUQ4aF6fGK76UuDqvEPAQ
	dzyAlriD7YyHLKmezpTgRPi1w8XHua7SpoYNlNqPbqImZMbp5CwPylqNOXyMmjmnH953BjWgH3je5
	CuZ5pm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgd6-00000009tfF-1zwS;
	Wed, 19 Aug 2026 13:46:56 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgd3-00000009teq-2Yg5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 13:46:55 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-92e6391b114so90579385a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 06:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787147212; cv=none;
        d=google.com; s=arc-20260327;
        b=gD32nN3ntEoLxoXykQ2hvh+byX9q+OrEmkANWsvlwGlKzoSL1Ls0qPcFOxB2z9m66D
         tIxgtXQDOwXQK9QISKQhXqSzMMuGVrbxWkfEQFiAYyNDbNN+ZYWkDfAhNgBHYX6VxWor
         OKMJ7kQmD/0ZeSr6NRnDcAsdUnaZdavHgFwLnwyHLgxrJhDODIPr8/0Em9uS1iM8BkLg
         tPJ6Pme5xEVIITalVH3D6A3nyhzzwn1GH1blqzfA3ICdWa7DPySrzyXFCDja6RYzhTqQ
         Rckp3AAUnabWQeBdks29hkaRdaq7A98tO8T+L7iUYOfT2j65QLo+m/FudLndScZq5Yqg
         hc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hU/Rrco2eHgoRkaqU/aKPgtdcd60SOy8SNUe3WgzR/E=;
        fh=ZQHXl5elWhCXZVNgVybPttv9ksr1eHvBXrr0541GNpw=;
        b=DnjtXDck2d7qqPXZBJJ+KNDAd++7MHUE67c4Ujo2D+res3TF1E3PcqK/OLzy3cRZ+x
         q2MQFiq3Zb/rAQczBZFxmUgTYIkifD+XUWVPO2+V6OeV4MgAJJJX16ZfI0c3tPnfms1B
         iHRB0+ZTsrXVcbqAuIMEUITpeZXtnmcyH0xX7A1EIT6xgwpxnVnOIU2PWgrMpHTTjv1L
         kbrh2ScxavUHPMkJcIlNI6cEB4lE2rqh46HrV5OBP2JDCNrzg8jTZBDee7RbwqueEkN9
         Hf8Qv2hPFj+j7W/ppEbnS/fn0J1tjIrpjj0BARaqq6T+kd8Ye638FJXYqNv6DhA4n8L5
         6bew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787147212; x=1787752012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hU/Rrco2eHgoRkaqU/aKPgtdcd60SOy8SNUe3WgzR/E=;
        b=YhMjyVptD870thbtY1Bl1lo6wCdgUtkoz3YJW/A9Z1ieNDV2ZKKbWDGtU0BC3Zq0ee
         iuQxdwfTPBp3+8vLsL9j30dy6oTTbWGVxOkfJQG25iarf7cej0iD7TLCXtoAqEeN+O9D
         3n7LwTptFEf29ORSsnmOLKhZWheIH35+vlkGLfRsA/mI9zwl8YiTjj8Ci5mi9bxsLcHq
         nsWLJJfV+pp29fqyFiX00h5fEH4cOgf6/flvtWqxl4CWLcfbaqp4Wb9RaoBLNgADakBa
         IIQEG101qlWrP6R1Jkcx3hgZdGW5k7mdbeiGuiLZ2l+BRLBf+Y09s8AOL1BG2GMg2y7P
         vsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147212; x=1787752012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hU/Rrco2eHgoRkaqU/aKPgtdcd60SOy8SNUe3WgzR/E=;
        b=kwMNNtskRLV7NBUYi7ydC7TH4ElJ/UtacUEKfBYMl8VNUD6j2n+TErBqZ9EId/+D8n
         HgZTmW+9qfqQCbNW4U8TTwrBJl47k9sIClUykSCgv2YRxI/st16FY76iD3Gbdd0IbFe6
         HoL4SRuCqPlI6vB49PfE1U5uujAQf4MA40z9VVaMaKi3sSrrsuuuPzYUJxC0QIQ+oCyB
         KO7jbIMymZ0mAR26cmXw0rjdJZ95RHuTyhvBJIO2bCe1s76WtrDHCLQPl6Bedyfn5BIe
         XHXhR7psjufmZflneABosaiT7YNU0PQqCFxv5XtxLPol6+RpbP3MnmQXbjiB67oKN/fZ
         owPw==
X-Forwarded-Encrypted: i=1; AHgh+RoGgFxg/pn5R4Gnb65AJY7IWaWFeIPXQpHvQI4z48IYDpDJhR83JApz28IGNfOgXDa4emoWvZxnTSMPzxVjs3Cw@lists.infradead.org
X-Gm-Message-State: AOJu0YxQaw7o5ie40UpdKcJO8bl9QHaLvc2w3IWMQpALz+joCYzh3o3+
	+OpaWWtIg5X954DyhqgzUGaf7H+HGW4gYor3pYzKnvuqUQsae24Zbb5916Xx62bSgiTpxZPw2Jr
	+aAwAAQe0mkPpmzp9iSys+k0tYnDQBUQ=
X-Gm-Gg: AR+sD13MLOXgr7xRLIpItCETqpe80VyX1/KxR5gzH64UpvL21hqr3E+5i5QO1u88QaU
	+96fOtENBynaR5h7E1QbiB5K6MQGILyOwixz0CHNOahdD9xGmihwZB0f+t6x1ZSv6xelylbenDJ
	VNsip11TKrCqbTV6YxA+KMUdDTdn5GNDUKrniC1GYwJO1sRchzFbqu64pZy2+jz7c081AsL7/m4
	D+tj2yXZ6zwyYvejf504nPShgbdwc9Goq6eDh4iRJozmKciWLD7a0dsp3naMnFBInhemxK9Jwe3
	MSlWYvKh9UAoKHnKInQpYzON+RmY+Lp+GHe8pZfADavVw/9rd3h/5vdcBLM78dR1rNRhMoqhzak
	=
X-Received: by 2002:a05:620a:6087:b0:92e:7ef3:213f with SMTP id
 af79cd13be357-9371e6f639amr422130785a.23.1787147211854; Wed, 19 Aug 2026
 06:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org> <20260809-exynos-dsim-fixes-v5-2-6e63dc6c238f@disroot.org>
In-Reply-To: <20260809-exynos-dsim-fixes-v5-2-6e63dc6c238f@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 19 Aug 2026 22:46:14 +0900
X-Gm-Features: AcwNN1V9uq5rpfpNmzqQRI66nhVgUZiP-vg3h3coBunhivKyzh_w9urOtKY6OKo
Message-ID: <CAAQKjZO1_FORfo5zx_Ywy=pX6qpbS0f9z1PboX4DbtHeFS1+MQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/bridge: samsung-dsim: use DSIM interrupt to
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
X-CRM114-CacheID: sfid-20260819_064653_685222_04970A86 
X-CRM114-Status: GOOD (  43.48  )
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

Thanks for update,

2026=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 5:59, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Stabilizing PLL needs to be waited for. This is done using a loop,
> checking the PLL_STABLE bit in the status register.
>
> DSIM fires an interrupt when the PLL is stabilized. Rely on this
> functionality for stabilization wait, getting rid of the implicit loop.

I like the direction - replacing the busy loop with the interrupt the
hardware already provides is clearly the right thing to do. Below are
my comments.

>
> To utilize this, explicitly unmask PLL_STABLE and SW_RST_RELEASE right
> after reset, and wait for reset before setting up clock.
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
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 49 +++++++++++++++++++++++++----=
------
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index fc42acc6b9ef..9f58c7b1be53 100644
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
> @@ -722,9 +723,14 @@ static void samsung_dsim_wait_for_reset(struct samsu=
ng_dsim *dsi)
>  static void samsung_dsim_reset(struct samsung_dsim *dsi)
>  {
>         u32 reset_val =3D dsi->driver_data->reg_values[RESET_TYPE];
> +       u32 status;
>
>         reinit_completion(&dsi->completed);
>         samsung_dsim_write(dsi, DSIM_SWRST_REG, reset_val);
> +
> +       status =3D samsung_dsim_read(dsi, DSIM_INTMSK_REG);
> +       status &=3D ~(DSIM_INT_PLL_STABLE | DSIM_INT_SW_RST_RELEASE);
> +       samsung_dsim_write(dsi, DSIM_INTMSK_REG, status);

What does this hunk actually buy us? Two concerns:

First, it is racy. You trigger the software reset and then immediately
read-modify-write DSIM_INTMSK. If the reset is still in flight, the
hardware may restore the register defaults and drop this write.

Second, it looks like a no-op. The fact that SW_RST_RELEASE is
delivered today - without any driver code unmasking it - implies that
DSIM_INTMSK reads back as all-unmasked after reset. If that is true,
clearing those two bits changes nothing.

The change that actually matters is adding DSIM_INT_PLL_STABLE to the
mask written from the SW_RST_RELEASE handler, which you do further
down. Unless there is a case I am missing, please drop this hunk. If
it is needed, please add a comment explaining why.

>  }
>
>  static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
> @@ -787,8 +793,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>                                           unsigned long freq)
>  {
>         const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
> -       unsigned long fin, fout;
> -       int timeout;
> +       unsigned long fin, fout, timeout_us, bus_clk_mhz;
>         u8 p, s;
>         u16 m;
>         u32 reg;
> @@ -849,19 +854,33 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
>         if (dsi->swap_dn_dp_data)
>                 reg |=3D DSIM_PLL_DPDNSWAP_DAT;
>
> +       /*
> +        * The PLL_TIMER value is the product of the timeout delay and th=
e APB
> +        * bus clock rate. Calculate the timeout delay on-the-fly here.
> +        * It is assumed that the bus clock is the first clock in the pro=
vided
> +        * bulk clock data.
> +        */
> +       timeout_us =3D 100;
> +       bus_clk_mhz =3D clk_get_rate(dsi->driver_data->clk_data[0].clk) /=
 HZ_PER_MHZ;
> +       if (bus_clk_mhz)
> +               timeout_us =3D max(driver_data->reg_values[PLL_TIMER] / b=
us_clk_mhz,
> +                                timeout_us);

PLL_TIMER is a hardware PLL lock timer. Deriving a *software* timeout
from it is a heuristic with no documentation behind it, and the values
we carry vary wildly (500, 22200, 80000).
Since the completion wakes us up as soon as the PLL is stable, a
generous fixed timeout costs nothing on working hardware and is much
easier to reason about. Please just use a fixed value in the
millisecond range.

That also removes the need for the linux/minmax.h include and, more
importantly, for reaching into clk_data[] by index.

On that last point: clk_data points at a static array
(exynos3_clk_bulk_data[] and friends) shared by every instance using
the same driver_data. Indexing it with a hardcoded 0 and documenting
the "first clock is the bus clock" assumption only in a comment is
fragile.
If you do need the bus clock rate, please add an explicit index or
pointer to struct samsung_dsim_driver_data rather than relying on
array ordering.

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
> +       if (!wait_for_completion_timeout(&dsi->pll_stabilized,
> +                                        usecs_to_jiffies(timeout_us))) {
>                 if (driver_data->has_legacy_status_reg)
>                         reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
>                 else
>                         reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_R=
EG);
> -       } while ((reg & BIT(driver_data->pll_stable_bit)) =3D=3D 0);
> +
> +               if (!(reg & BIT(driver_data->pll_stable_bit))) {
> +                       dev_err(dsi->dev, "PLL failed to stabilize\n");
> +                       return 0;
> +               }
> +       }

usecs_to_jiffies(100) rounds up to a single jiffy on any HZ we
support, and wait_for_completion_timeout() arms a timer that expires
on the next tick boundary. The actual wait can therefore be
arbitrarily close to zero. The "gracious lower bound of 100
microseconds" from the changelog simply does not exist in practice.

Combined with the fallback being a *single* register read, this is a
regression waiting to happen: on any platform where PLL_STABLE is not
delivered - and per my note above, that is every platform except your
Exynos7870 as far as we know - we go from 3000 polls (milliseconds) to
one read taken possibly microseconds after the PLL was programmed.

Please raise the lower bound to something meaningful, e.g. 20 ms.

>
>         dsi->hs_clock =3D fout;
>
> @@ -1586,7 +1605,8 @@ static irqreturn_t samsung_dsim_irq(int irq, void *=
dev_id)
>         samsung_dsim_write(dsi, DSIM_INTSRC_REG, status);
>
>         if (status & DSIM_INT_SW_RST_RELEASE) {
> -               unsigned long mask =3D ~(DSIM_INT_RX_DONE |
> +               unsigned long mask =3D ~(DSIM_INT_PLL_STABLE |
> +                                      DSIM_INT_RX_DONE |
>                                        DSIM_INT_SFR_FIFO_EMPTY |
>                                        DSIM_INT_SFR_HDR_FIFO_EMPTY |
>                                        DSIM_INT_RX_ECC_ERR |
> @@ -1596,8 +1616,10 @@ static irqreturn_t samsung_dsim_irq(int irq, void =
*dev_id)
>                 return IRQ_HANDLED;
>         }
>
> -       if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
> -                       DSIM_INT_PLL_STABLE)))
> +       if (status & DSIM_INT_PLL_STABLE)
> +               complete(&dsi->pll_stabilized);
> +
> +       if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
>                 return IRQ_HANDLED;

The unmask change is correct, but the placement of the complete() call
is not. The SW_RST_RELEASE branch returns before we ever look at
DSIM_INT_PLL_STABLE, and DSIM_INTSRC has already been write-cleared
for the full status word at the top of the handler.

So if both bits are set in a single read, the PLL_STABLE source is
acknowledged in hardware but complete() is never called, and the event
is lost for good. set_pll() then always hits the timeout and falls
back to the single read discussed above.

This is not theoretical for the wait_for_reset =3D=3D 0
platforms(exynos5433, imx8mm, imx8mp): there we proceed to set_pll()
without waiting for the reset to complete, so the two events can
genuinely overlap.

Please move the PLL_STABLE handling above the SW_RST_RELEASE block.

Thanks,
Inki Dae

>
>         if (samsung_dsim_transfer_finish(dsi))
> @@ -1635,9 +1657,9 @@ static int samsung_dsim_init(struct samsung_dsim *d=
si)
>         if (driver_data->reg_values[RESET_TYPE] =3D=3D DSIM_FUNCRST)
>                 samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>
> -       samsung_dsim_enable_clock(dsi);
>         if (driver_data->wait_for_reset)
>                 samsung_dsim_wait_for_reset(dsi);
> +       samsung_dsim_enable_clock(dsi);
>         samsung_dsim_set_phy_ctrl(dsi);
>         samsung_dsim_init_link(dsi);
>
> @@ -2148,6 +2170,7 @@ int samsung_dsim_probe(struct platform_device *pdev=
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


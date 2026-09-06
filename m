Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A3BC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 04:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qO/4F3aY8sQXF7GCHIu1ZeTQ6+uDdCNC0Hk2Fkyw5BQ=; b=I0sJ0/QqnRn8IsM40ppWG0sGZL
	g1Z3j0V9+ARM+8uUzCsrRPvUIwnx+k1uF9kdndFUmA+7NBQ50y1+C4P0fUvz+0w49lNvYx2ky3wbY
	VrTQ7ARiMRRc0q3bJsfQQ4OPyw34EeuzOzLDUe8LXJaXwRkWgUCryVqzGc7r/HVa+mXgsJsBhT5EK
	RArJq4qCYjho4zZXdjqr8Uw3O108fpevUnN3Sxffo16VEsyuniuT+ePkx7HcxDCxURt9xumVNw5aG
	tmEt9paRkT5nPeyXDibN5LI3KuGLQKtpb4vSxkG5WC/+K7UdOfDXmNofJBL5/aFiO00j40cd8AalK
	pqNCfJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x34xb-00000004hJg-3qwS;
	Sun, 06 Sep 2026 04:58:31 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x34xZ-00000004hIt-3FO4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 04:58:31 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-39b52169dacso313780a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 21:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788670708; cv=none;
        d=google.com; s=arc-20260327;
        b=iLLYeWiYBc2TZ/ltn99c2tLQkMDwdjQukZrJXjhSD4Vu63pxOFxjBzFsReYL+0d44N
         Yjk6rHjEyX7Vn+NEy3kCtoAOKdBrV/TWpMArIbmegKl+wBdPzKa0Td/w8AM4KY/s9wnQ
         ewXzPPNGeApb8wfYphuC1NcxihpNGk916I2fihS6Rrz4saP/ZbQN2mqsl2WuyZqSh9H2
         BvI6bo2tzvaKg+gWpb36pN3zxsNFXfFFyhw3l8pprVA0powXcGDQztrTb0huW5rY4sPq
         QtgGD0iMkMFBl8h4i4SKZRGpqY/vXhgSfjyIq5EaDS0nAyA70giYD1vF2dLUYy/vNMn0
         XY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qO/4F3aY8sQXF7GCHIu1ZeTQ6+uDdCNC0Hk2Fkyw5BQ=;
        fh=DnujZ0I/8hwWia72shY9THy9Q3uv8bjUeri6tX+1c6w=;
        b=WZPW2WpocRIfb6Ks4sJTndQgeQHkkVUo2oTcN8ofarTUwKmNO4aGhU1rECix49xVY8
         DwNtb0bNSvnSgu9qJEipbvSTa+lclNKI2FuI5yXjB5S09enz7ik7++dJhNUNezZlGydq
         rCamzG0l8Ydto32GDv2j5kYvK7x2+K2q7ID8jWnPjy9PKjcgnyg33WVlhMkxcb8TY6Sg
         9iWPWHl4d5F+l5c8VDIChTgqxkkJZMDuk4wT8nn1oVw6HOu08R7svGrvAHXlI/6Y/Jze
         bntSaWohbS+bxdYSB9Wx0PCVDSnee86jxuV0FKhwwpLdMAVRG8PHUg0q8TXKAahOoLCh
         PIJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788670708; x=1789275508; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qO/4F3aY8sQXF7GCHIu1ZeTQ6+uDdCNC0Hk2Fkyw5BQ=;
        b=Bo+mj6S3lhoFaY+u9lNVDo5hI6pvlYo58w3YLpVbTWKV7yo0q+FCjfLk+jrN6X2x3I
         oo3ILZv9ssEpSWPvzi/adHsTLVx7bbVD97h3Bw4/zFVMULBnVj+dziJxm/Um18ODDiEO
         pB715a/XSfbrqQabyst6XnPPAU+ekE5SPTnThLoe5RjvGajz1QuZ1vtKoXiLQwW5P3e/
         10gt7Mc4N7Uv7dbLrpr2zuGaES7NAJkNlwDSw42FejFsRjm9jCst9D7ar7L3ai1CW7BU
         dqK6a+YjYQ50OejDsMpe4eB2m8hhvWeO+SpzWkAwrKCaaQT1NJ3YAo09N7zF1DZGuULB
         QOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788670708; x=1789275508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qO/4F3aY8sQXF7GCHIu1ZeTQ6+uDdCNC0Hk2Fkyw5BQ=;
        b=oMv/hswdCuUhtR0Jbnc+Gh9TQStaziMYEypX9V1F76cYpIZEB+1HtwOHizCklvkQn9
         STdCYStVxYvCazVCI9ZFPIgMhq8fPMXXfhKAftRwpSw/iF5t5EZ6hLsM4znZjRDEmn96
         cjkkwoOP7rynR6YdibVvd26A+VDbQAhrRmj614jUo/A4LBagWqfOz+ijWOI1KMyMNULS
         z8LU8tU+BFBpLi1CdaoIF+jlmuQRvgwRWrGpcV3r+D4zrS/+fq9zCKZJH5IkWt6ZU/LQ
         SZjNM/4PTx7qLFZKlxlBJNsrV2HW1PQwabYr9xWLIuqr727CBwXXZ+QuaVAyg6G4+AHL
         zaJw==
X-Forwarded-Encrypted: i=1; AKwUvBwFIcU6qPWZzJYGHhEd9+AI1FJ4qDDSk98Et9TQlZ2f4cRTKjAHcFfVU8bwgznaLvWdTtGVVQtE8NX41vxz0lGm@lists.infradead.org
X-Gm-Message-State: AFuF++noEIjYnQYpUajvutwgTsC1Wg+XPHPmMxDDdvBrUvar2tRpkAK5
	r28dvBvb1Lmk1pcbQUI+M32aGD/wXT4RT+cK0VCJOrgZPsk4QzV7ThDUDPqGh7An+8Wem7H5y9R
	/a5oBzrW24TYvHgk6Aqdp2cvBIfF0Pks=
X-Gm-Gg: AYBFou3K8IUr2N2DNm7CQc7MGld/Ik6lRuxM9P71AraSaEGyyt5AXjXYNGhRtdALUqU
	cd6Ec6tQeHPuSvagLDbV0Ad47V0oOgz1Hxj1B4Hj/Zz5ZvvQaBy/lUegmaOHjbHAnvZXnrwlIwQ
	1TqPfEOenNtOplMNWy1W08rVswy9z0lz0VtglPuEPJtY0sLgHG1L74Z0ogQdprkEoL02Wv4OFHH
	GmeWc+DUaWMOgTU1oU20f9v36jkH1Hp78zhBCDF28SEOMTqWkSZe5QTsKjBkHocWz4KMSpfBk1K
	1xtSDroUzzaU27MLdpcOgo43PhrwVqPDhZqmynnfq7QqFq0OQu2kEbSHm0OUY/tGESYNZvP8FOA
	=
X-Received: by 2002:a17:90a:d2c6:b0:395:4de4:92c7 with SMTP id
 98e67ed59e1d1-39b260d2f07mr24804839a91.3.1788670708273; Sat, 05 Sep 2026
 21:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
 <20260830160025.211384-3-mitltlatltl@gmail.com> <apfrV9FZ1UN8RW55@kekkonen.localdomain>
In-Reply-To: <apfrV9FZ1UN8RW55@kekkonen.localdomain>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 6 Sep 2026 12:56:27 +0800
X-Gm-Features: AcwNN1XiwG70aVRUQ85nsQ2Ue4F2YGZrf2eiK1bvTSLC4rcqTPaE6uX8PepJ7jM
Message-ID: <CAH2e8h6eYmych9ESURozoNmn5Xg9SWcUUCo681NBz0FY9LB92w@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] media: hi846: Fix link frequency handling
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Martin Kepplinger-Novakovic <martink@posteo.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_215829_867584_66AC7C58 
X-CRM114-Status: GOOD (  40.44  )
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

On Wed, Sep 2, 2026 at 5:24=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Pengyu,
>
> Thanks for the update.
>

I am glad to see your review too!

> On Mon, Aug 31, 2026 at 12:00:22AM +0800, Pengyu Luo wrote:
> > Link frequency is tied to PLL configuration, lane count, and external
> > and configurable clock, so use runtime here instead of hardcoding for
> > specific configuration. To implement this, we do
> >
> > 1. Drop fixed link freqs, we calculate the driver supported values and
> > use v4l2_link_freq_to_bitmap() to get the intersection with the DT
> > supported values.
> >
> > 2. Attach mipi_clk_div_{2,4}lane to current mode, and use the div with
> > mclk clock, lane count to calculate link frequency.
> >
> > 3. Drop mclk clock rate check.
> >
> > Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M=
 pixel camera")
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> > v6:
> > - Add link freq ctrl back (Sakari)
> > - Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
> > - Move clk_get() before than hi846_parse_dt(), since we use clock in hi=
846_parse_dt()
> > v5:
> > - Use separated fields instead of raw register values for PLL cfg (Saka=
ri)
> > - Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (=
Sakari)
> > - Drop line break (Sakari)
> > ---
> >  drivers/media/i2c/hi846.c | 151 ++++++++++++++++++++++++--------------
> >  1 file changed, 94 insertions(+), 57 deletions(-)
> >
> > diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> > index 7f069aca0fce..2f8624f9bdf3 100644
> > --- a/drivers/media/i2c/hi846.c
> > +++ b/drivers/media/i2c/hi846.c
> > @@ -1,7 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  // Copyright (c) 2021 Purism SPC
> >
> > -#include <linux/unaligned.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/gpio/consumer.h>
> > @@ -11,6 +11,7 @@
> >  #include <linux/pm.h>
> >  #include <linux/property.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/unaligned.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -219,8 +220,8 @@ struct hi846_mode {
> >       /* Horizontal timing size */
> >       u32 llp;
> >
> > -     /* Link frequency needed for this resolution */
> > -     u8 link_freq_index;
> > +     u8 mipi_clk_div_2lane;
> > +     u8 mipi_clk_div_4lane;
> >
> >       u16 fps;
> >
> > @@ -1040,13 +1041,6 @@ static const char * const hi846_test_pattern_men=
u[] =3D {
> >       "Resolution Pattern",
> >  };
> >
> > -#define FREQ_INDEX_640       0
> > -#define FREQ_INDEX_1280      1
> > -static const s64 hi846_link_freqs[] =3D {
> > -     [FREQ_INDEX_640] =3D 80000000,
> > -     [FREQ_INDEX_1280] =3D 200000000,
> > -};
> > -
> >  static const struct hi846_reg_list hi846_init_regs_list_2lane =3D {
> >       .num_of_regs =3D ARRAY_SIZE(hi846_init_2lane),
> >       .regs =3D hi846_init_2lane,
> > @@ -1061,7 +1055,13 @@ static const struct hi846_mode supported_modes[]=
 =3D {
> >       {
> >               .width =3D 640,
> >               .height =3D 480,
> > -             .link_freq_index =3D FREQ_INDEX_640,
> > +             .mipi_clk_div_2lane =3D 4,
> > +             /*
> > +              * Dummy but necessary if we set this mode default, other=
wise
> > +              * hi846_calc_pixel_rate() will be broken in
> > +              * hi846_init_controls()
> > +              */
> > +             .mipi_clk_div_4lane =3D 8,
>
> The divider of the 4-lane case appears to be always two times that of the
> 2-lane case. Could you calculate the value instead?
>

Ack

> I think it'd be better to keep the link frequencies and modes at separate
> indices; this is the way it used to be, too.
>

You mean add an array for the divider ratios then use the indices in
modes like before?

> >               .fps =3D 120,
> >               .frame_len =3D 631,
> >               .llp =3D HI846_LINE_LENGTH,
> > @@ -1086,7 +1086,8 @@ static const struct hi846_mode supported_modes[] =
=3D {
> >       {
> >               .width =3D 1280,
> >               .height =3D 720,
> > -             .link_freq_index =3D FREQ_INDEX_1280,
> > +             .mipi_clk_div_2lane =3D 2,
> > +             .mipi_clk_div_4lane =3D 4,
> >               .fps =3D 90,
> >               .frame_len =3D 842,
> >               .llp =3D HI846_LINE_LENGTH,
> > @@ -1112,7 +1113,8 @@ static const struct hi846_mode supported_modes[] =
=3D {
> >       {
> >               .width =3D 1632,
> >               .height =3D 1224,
> > -             .link_freq_index =3D FREQ_INDEX_1280,
> > +             .mipi_clk_div_2lane =3D 2,
> > +             .mipi_clk_div_4lane =3D 4,
> >               .fps =3D 30,
> >               .frame_len =3D 2526,
> >               .llp =3D HI846_LINE_LENGTH,
> > @@ -1167,6 +1169,9 @@ struct hi846 {
> >       struct v4l2_ctrl *hblank;
> >       struct v4l2_ctrl *exposure;
> >
> > +     s64 link_freqs[ARRAY_SIZE(supported_modes)];
> > +     int num_link_freqs;
> > +
> >       struct mutex mutex; /* protect cur_mode, streaming and chip acces=
s */
> >       const struct hi846_mode *cur_mode;
> >       bool streaming;
> > @@ -1192,21 +1197,41 @@ static const struct hi846_datafmt *hi846_find_d=
atafmt(u32 code)
> >       return NULL;
> >  }
> >
> > -static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
> > +static u64
> > +hi846_get_link_freq(const struct hi846 *hi846, const struct hi846_mode=
 *mode)
> >  {
> > -     return hi846->cur_mode->link_freq_index;
> > +     u64 mclk =3D clk_get_rate(hi846->clock);
> > +     u8 mipi_clk_div;
> > +
> > +     if (hi846->nr_lanes =3D=3D 2)
> > +             mipi_clk_div =3D mode->mipi_clk_div_2lane;
> > +     else
> > +             mipi_clk_div =3D mode->mipi_clk_div_4lane;
> > +
> > +     /*
> > +      * HI846_REG_PLL_CFG_MIPI1_H =3D 0x025a, it is fixed in listed mo=
des
> > +      * [11:8]: 0x02 =3D> pre_div =3D 3
> > +      * [7:0]: 0x5a =3D> multiplier =3D 90
> > +      */
> > +     return mul_u64_u32_div(mclk, 90, 3 * mipi_clk_div);
> >  }
> >
> > -static u64 hi846_get_link_freq(struct hi846 *hi846)
> > +static int hi846_get_link_freq_index(const struct hi846 *hi846,
> > +                                  const struct hi846_mode *mode)
> >  {
> > -     u8 index =3D hi846_get_link_freq_index(hi846);
> > +     u64 link_freq =3D hi846_get_link_freq(hi846, mode);
> > +     int i;
> > +
> > +     for (i =3D 0; i < hi846->num_link_freqs; i++)
> > +             if (hi846->link_freqs[i] =3D=3D link_freq)
> > +                     return i;
> >
> > -     return hi846_link_freqs[index];
> > +     return -EINVAL;
> >  }
> >
> >  static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
> >  {
> > -     u64 link_freq =3D hi846_get_link_freq(hi846);
> > +     u64 link_freq =3D hi846_get_link_freq(hi846, hi846->cur_mode);
> >       u64 pixel_rate =3D link_freq * 2 * hi846->nr_lanes;
> >
> >       do_div(pixel_rate, HI846_RGB_DEPTH);
> > @@ -1429,8 +1454,8 @@ static int hi846_init_controls(struct hi846 *hi84=
6)
> >       hi846->link_freq =3D
> >               v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
> >                                      V4L2_CID_LINK_FREQ,
> > -                                    ARRAY_SIZE(hi846_link_freqs) - 1,
> > -                                    0, hi846_link_freqs);
> > +                                    hi846->num_link_freqs - 1,
> > +                                    0, hi846->link_freqs);
> >       if (hi846->link_freq)
> >               hi846->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> >
> > @@ -1503,10 +1528,9 @@ static int hi846_set_video_mode(struct hi846 *hi=
846, int fps)
> >       u64 frame_length;
> >       int ret =3D 0;
> >       int dummy_lines;
> > -     u64 link_freq =3D hi846_get_link_freq(hi846);
> > +     u64 link_freq =3D hi846_get_link_freq(hi846, hi846->cur_mode);
> >
> > -     dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
> > -             hi846_get_link_freq(hi846));
> > +     dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__, link_fre=
q);
> >
> >       do_div(link_freq, fps);
> >       frame_length =3D link_freq;
> > @@ -1699,6 +1723,7 @@ static int hi846_set_format(struct v4l2_subdev *s=
d,
> >       const struct hi846_datafmt *fmt =3D hi846_find_datafmt(mf->code);
> >       u32 tgt_fps;
> >       s32 vblank_def, h_blank;
> > +     int idx;
> >
> >       if (!fmt) {
> >               mf->code =3D hi846_colour_fmts[0].code;
> > @@ -1749,7 +1774,14 @@ static int hi846_set_format(struct v4l2_subdev *=
sd,
> >       mf->code =3D HI846_MEDIA_BUS_FORMAT;
> >       mf->field =3D V4L2_FIELD_NONE;
> >
> > -     __v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi=
846));
> > +     idx =3D hi846_get_link_freq_index(hi846, hi846->cur_mode);
> > +     if (idx < 0) {
> > +             dev_err(&client->dev,
> > +                     "failed to get link freq index: %d\n", idx);
> > +             return -EINVAL;
> > +     }
> > +
> > +     __v4l2_ctrl_s_ctrl(hi846->link_freq, idx);
> >       __v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
> >                                hi846_calc_pixel_rate(hi846));
> >
> > @@ -1947,20 +1979,33 @@ static int hi846_identify_module(struct hi846 *=
hi846)
> >       return 0;
> >  }
> >
> > -static s64 hi846_check_link_freqs(struct hi846 *hi846,
> > -                               struct v4l2_fwnode_endpoint *ep)
> > +static int hi846_add_link_freqs(struct hi846 *hi846, struct device *de=
v,
> > +                             struct v4l2_fwnode_endpoint *ep)
> >  {
> > -     const s64 *freqs =3D hi846_link_freqs;
> > -     int freqs_count =3D ARRAY_SIZE(hi846_link_freqs);
> > -     int i, j;
> > -
> > -     for (i =3D 0; i < freqs_count; i++) {
> > -             for (j =3D 0; j < ep->nr_of_link_frequencies; j++)
> > -                     if (freqs[i] =3D=3D ep->link_frequencies[j])
> > -                             break;
> > -             if (j =3D=3D ep->nr_of_link_frequencies)
> > -                     return freqs[i];
> > -     }
> > +     s64 hi846_link_freqs[ARRAY_SIZE(supported_modes)];
> > +     unsigned long freq_bitmap;
> > +     int ret, i;
> > +
> > +     /*
> > +      * Since the MCLK freq varies between platforms, calculating driv=
er
> > +      * supported link freqs here.
> > +      */
> > +     for (i =3D 0; i < ARRAY_SIZE(supported_modes); i++)
> > +             hi846_link_freqs[i] =3D hi846_get_link_freq(hi846, &suppo=
rted_modes[i]);
> > +
> > +     ret =3D v4l2_link_freq_to_bitmap(dev, ep->link_frequencies,
> > +                                    ep->nr_of_link_frequencies,
> > +                                    hi846_link_freqs,
> > +                                    ARRAY_SIZE(hi846_link_freqs),
> > +                                    &freq_bitmap);
> > +     if (ret || !freq_bitmap)
> > +             return ret;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(hi846_link_freqs); i++)
>
> Could you use the hi846_link_freqs array as-is for the control?
>

Could you please tell me if an array with repeat numbers is acceptable
for v4l2_ctrl_new_int_menu(), if so, keep it as-is is more convenient
later.

> The selectable modes are expected to depend on the chose link frequency,
> which is not affected by setting the format, for instance. I wonder if it=
'd
> be useful to squash the next patch into this one.
>

Yes, it seems so, we need to get the index of link freq to set
control, so we can filter the mode by the index, and this lets us drop
previous checks.

Best wishes,
Pengyu


> > +             if (BIT(i) & freq_bitmap) {
> > +                     hi846->link_freqs[hi846->num_link_freqs++] =3D hi=
846_link_freqs[i];
> > +                     dev_dbg(dev, "Add supported link frequency %lld\n=
", hi846_link_freqs[i]);
> > +             }
> >
> >       return 0;
> >  }
> > @@ -1973,7 +2018,6 @@ static int hi846_parse_dt(struct hi846 *hi846, st=
ruct device *dev)
> >               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> >       };
> >       int ret;
> > -     s64 fq;
> >
> >       ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> >       if (!ep) {
> > @@ -2004,11 +2048,10 @@ static int hi846_parse_dt(struct hi846 *hi846, =
struct device *dev)
> >               goto check_hwcfg_error;
> >       }
> >
> > -     /* Check that link frequences for all the modes are in device tre=
e */
> > -     fq =3D hi846_check_link_freqs(hi846, &bus_cfg);
> > -     if (fq) {
> > -             dev_err(dev, "Link frequency of %lld is not supported\n",=
 fq);
> > -             ret =3D -EINVAL;
> > +     /* Add link frequencies which are supported by both DT and the dr=
iver */
> > +     ret =3D hi846_add_link_freqs(hi846, dev, &bus_cfg);
> > +     if (ret) {
> > +             dev_err(dev, "failed to add link frequency %d\n", ret);
> >               goto check_hwcfg_error;
> >       }
> >
> > @@ -2041,30 +2084,24 @@ static int hi846_probe(struct i2c_client *clien=
t)
> >       struct hi846 *hi846;
> >       int ret;
> >       int i;
> > -     u32 mclk_freq;
> >
> >       hi846 =3D devm_kzalloc(&client->dev, sizeof(*hi846), GFP_KERNEL);
> >       if (!hi846)
> >               return -ENOMEM;
> >
> > -     ret =3D hi846_parse_dt(hi846, &client->dev);
> > -     if (ret) {
> > -             dev_err(&client->dev, "failed to check HW configuration: =
%d",
> > -                     ret);
> > -             return ret;
> > -     }
> > -
> > +     /* Get the MCLK first, since we need it to calculate link freqs *=
/
> >       hi846->clock =3D devm_v4l2_sensor_clk_get(&client->dev, NULL);
> >       if (IS_ERR(hi846->clock))
> >               return dev_err_probe(&client->dev, PTR_ERR(hi846->clock),
> >                                    "failed to get clock: %pe\n",
> >                                    hi846->clock);
> >
> > -     mclk_freq =3D clk_get_rate(hi846->clock);
> > -     if (mclk_freq !=3D 25000000)
> > -             dev_warn(&client->dev,
> > -                      "External clock freq should be 25000000, not %u.=
\n",
> > -                      mclk_freq);
> > +     ret =3D hi846_parse_dt(hi846, &client->dev);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to check HW configuration: =
%d",
> > +                     ret);
> > +             return ret;
> > +     }
> >
> >       for (i =3D 0; i < HI846_NUM_SUPPLIES; i++)
> >               hi846->supplies[i].supply =3D hi846_supply_names[i];
>
> --
> Regards,
>
> Sakari Ailus


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D03DCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5vYyHrmF/bUEegllwDeFAZ8/aIhsfymLG3ivU9KTho=; b=f+tUXKUVNblIdcXpq831laogIu
	uJ4TfCovVTCbItW/IjOo9yV3dEnuxJZRs+R0/Vdbp8otwNThdXBIn2nhH6AI5vCdkEjKLsJJh66fi
	QctYJz/tfqknflEzw3VOCfEEfjRamaQk7UWq/lQ14kWsQY8ij2l8RKUotL54rEUongExQ/VQvdkhn
	Enq+/BDdZeq/3CfnZwgpHGNX7AOGka/s6DccK0gid8q95bq0/2X+EdEL8gRTkp/OnA06KX8NW+O0O
	NAu2fnuLyv06bpDlmJP0/NIPeF8svbTmUXmmKdOJU1AgNiOV2FbKD3p9YukvesyyhUaupqOVb0/kW
	pnnVNfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqz-00000002IJe-24V7;
	Fri, 22 Aug 2025 11:22:41 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIBU-00000001LvC-0F3A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:11:21 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-71fb85c4b59so28257647b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755832279; x=1756437079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5vYyHrmF/bUEegllwDeFAZ8/aIhsfymLG3ivU9KTho=;
        b=NnxEllodi0R/SG/JLePj+8Z/hhHQITf01K9cev5bF+cXjdl7yIv1HoIP4Qks/KCW+3
         YqY2E0SNOU+5IvNSqsR3BW79+s++fcjAcNbjo0YKnjLYJDcxoLu8T2odPNxGCNsE5Axz
         RwwfEsaXJHzg8QKlrOCmozP2WBkesWaJ2GiKO1ySxVhdIbqVvLKjqizrAAygxe5Qv+49
         r6Ry8KB6vDlQQdxu1r6JyXgC6LEvoTsyDU0gOC6/kR+IsRl1hRCNVuDAL+jCtD1msq64
         dw2Nv9ofHPfPq82ktoLvgH4OAl6TIVQzB8JNqKOxBQc/AKgO1S+zcK3BdiGjxVqY0quY
         vxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832279; x=1756437079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5vYyHrmF/bUEegllwDeFAZ8/aIhsfymLG3ivU9KTho=;
        b=VgLk50afAKkO7eZJwaKuqSEJ2EuFJhc/QMUwJPxDiaXp7z4RSAfdEnYUFLykAYLf7c
         /2jZNYUWvu98ozEi8PhSPmgE9EW4tRHRLCiUPMzlXT9AxF1mJli6TypwCoPFDYlwKW1+
         MSD1RwYeS6ir3Mj+vYVqtzkCvG8DSym5sxsW4okOJRdzMUlTRZUItCvfXsXo8Ko2YjDj
         pCNuSYHMvd8LhPP/bz+Ek3M6vzhFizw+YVuYT4C5MvXbqwh56SAM24H1XJzgb/9xjXd3
         i2F1iKaVyTdsnGi07UHlR9cEHGYhKuQcY57lzjiEzhw8aJ4lBc9IubwoPFGvYSM6J579
         kHtA==
X-Forwarded-Encrypted: i=1; AJvYcCVJm3ko84YwZUCEAkc2+I223mU+wFyP3mcp3DYO+LocGS0Efx/8jRRWJKZhJ14BdVMm8w5fHJf9SRaWgItopeqe@lists.infradead.org
X-Gm-Message-State: AOJu0YyMtEGH0cWv07PJomKiHXJu3/9EuDIXkPY0fiBRBp9kE6MzGrGm
	tJb7zt0ZD7HRdpP0BzBN5K5yxDoq4VyYrgVU7Q3YmxYLs7UZ72RAufw448z8jnZJgSEo1dJwCHc
	ejK2bFqVw/LmVVQFoxgm/7FYUy1cknr4=
X-Gm-Gg: ASbGncvk/FkoHB3Rxmc/2ju93pmvUfc+b/k1UmtShfteo0fWq90wQT1D7ZIrpziM3Aw
	ysatVp5WE93kV2Wcze0WujXwV+A0LzSmnvsyjQPn4M8kb7RYE9ACAzAfp57SNTRInRU4dUmKU7a
	E8LRrrw3aC0ZOYXUlysQ4lbMUYVWTXbii2UYoQeHm5SI5+uu/8gzA99HLR+IxNu+lO2O7xMajGp
	zKbqRG7r0gaU9EtQNCh+CxNz/Q4K0jHW+M/l7I=
X-Google-Smtp-Source: AGHT+IEt8PH9/sXqPDbYtckv5kTTfLPn5oKJHWIGi/sdlPO8MD6VYwtNnxskjLMg1Cft09p+xydf65liGokfDREYBRE=
X-Received: by 2002:a05:690c:8e07:b0:71e:57bd:f2a with SMTP id
 00721157ae682-71fc9f6b0f7mr44681547b3.21.1755832278410; Thu, 21 Aug 2025
 20:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250818093159.612208-1-chandramohan.explore@gmail.com> <aKdWnKdSDs2j73F-@valkosipuli.retiisi.eu>
In-Reply-To: <aKdWnKdSDs2j73F-@valkosipuli.retiisi.eu>
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Date: Fri, 22 Aug 2025 08:41:07 +0530
X-Gm-Features: Ac12FXyI8CJxEnrdzUP15elpoDm4F6JwNduF5hnyReTTklvEz5zEGZlo0cj4N6o
Message-ID: <CADBJw5bgK9Hcs3SwB0fU0yjiAqD1OZvc5RQT+yVHRAX7EjCG=g@mail.gmail.com>
Subject: Re: [PATCH] media: v4l: Fix dereference before NULL check
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: alain.volmat@foss.st.com, mchehab@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, shuah@kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_201120_094691_79ACFC55 
X-CRM114-Status: GOOD (  25.07  )
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

Hi Sakari Ailus,

Thanks a lot for your review and suggestions. Sure, I will choose an
appropriate subject.

Thanks,
Chandra Mohan Sundar

On Thu, Aug 21, 2025 at 10:57=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi>=
 wrote:
>
> Hi Chandra,
>
> Please choose an appropriate subject on the next time, this is missing wh=
at
> the patch is for -- see git log if in doubt.
>
> On Mon, Aug 18, 2025 at 03:01:57PM +0530, Chandra Mohan Sundar wrote:
> > In 'stm32_csi_start', 'csidev->s_subdev' is dereferenced directly while
> > assigning a value to the 'src_pad'. However the same value is being
> > checked against NULL at a later point of time indicating that there
> > are chances that the value can be NULL.
> >
> > Move the dereference after the NULL check.
> >
> > Fixes: e7bad98c205d1 ("media: v4l: Convert the users of v4l2_get_link_f=
req to call it on a pad")
>
> Fixes: requires Cc: stable. I've fixed these this time. See
> Documentation/process/submitting-patches.rst .
>
> > Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
> > ---
> >  drivers/media/platform/st/stm32/stm32-csi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/medi=
a/platform/st/stm32/stm32-csi.c
> > index b69048144cc1..fd2b6dfbd44c 100644
> > --- a/drivers/media/platform/st/stm32/stm32-csi.c
> > +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> > @@ -443,8 +443,7 @@ static void stm32_csi_phy_reg_write(struct stm32_cs=
i_dev *csidev,
> >  static int stm32_csi_start(struct stm32_csi_dev *csidev,
> >                          struct v4l2_subdev_state *state)
> >  {
> > -     struct media_pad *src_pad =3D
> > -             &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
> > +     struct media_pad *src_pad;
> >       const struct stm32_csi_mbps_phy_reg *phy_regs =3D NULL;
> >       struct v4l2_mbus_framefmt *sink_fmt;
> >       const struct stm32_csi_fmts *fmt;
> > @@ -466,6 +465,7 @@ static int stm32_csi_start(struct stm32_csi_dev *cs=
idev,
> >       if (!csidev->s_subdev)
> >               return -EIO;
> >
> > +     src_pad =3D &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_n=
b];
> >       link_freq =3D v4l2_get_link_freq(src_pad,
> >                                      fmt->bpp, 2 * csidev->num_lanes);
> >       if (link_freq < 0)
>
> --
> Regards,
>
> Sakari Ailus


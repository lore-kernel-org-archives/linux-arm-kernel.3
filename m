Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58614C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flhXc27wZ7lq+96q79C1lo9pyNK1W5OvD7SOTlgsYQY=; b=gGME5Gf5gxvd71lvPqmfNeVG33
	OblLCIo03f/tu6kha0Coa5VaHujgUu/9lSTQVtqbS5PbNgG8km04xDkLOcWi5EKILSush1YMGOMje
	30xHGN+PtAhXxEELwMUN7SasQUXj6k/F04PQu3ylSjSorZt70IUK+KmAWoDd5huJhPEmkVqmS/EGR
	9Bd5oAZ3ErAEG+E/xLVOponiEOq0yD8h2+k31GaETHOWsCCEyFrnr971rp2vpydN2wyoOrsk+pA/P
	/3jXjLvBA9V/udK4K6Sozy8hDZSXSDpo4jrzTLuGN5iJ1p8zv0xj3WnCLzvfSk1oqcy9tIZxwpI12
	/x6uwMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eFX-0000000ALYb-3y4i;
	Thu, 24 Sep 2026 07:52:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eFW-0000000ALY8-2HOt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:52:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D38A43229
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77C41F0089D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236329;
	bh=flhXc27wZ7lq+96q79C1lo9pyNK1W5OvD7SOTlgsYQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ptqlc8kxRS/O4MemHmjZ01Ds3sA61fs3CTI+JusAagmLQsN1Akqn2+RqNvZW8Uu1B
	 fkVtGl19o2GvoAfTGg+wN4khUgWOJ9FZX6ktZ8KPNQnifbt782gXCEup9k83OVKU2t
	 EPotrLbjrIE8X+v32os82VcQO6ZZF9OCqIB3J9O376A1cE7zOP/KVOHPHmH04n7+6z
	 tdkyUv/Up2f/Iz9O8fAfZSk8Nri0naYfsAwGJoOlvBHaXT1tsMl7JNC0kw9wS2Iska
	 V2pq+RIOw9lvDpy2GpXUcGS99+p1HdKg7KmPutL/KHb/YUGMP+2Bo5mPAMtHNBa5Oe
	 8VnDmcBpmgBvw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so1511563e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 00:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgjHAFkgfU6OgUqh71FYQeGBcZFNJBMd0Q/ThUHuMArYSVaoRr3VaPVfJRycRF3BQFwNi5iRpI77GmxRJ7senA@lists.infradead.org
X-Gm-Message-State: AFuF++m3xOMiOg8Nmw4HofWFNz+DpEavwd+qdWoBBLSA4og7ztRb4ThS
	tdT5V/P8kt2izAGygry29KEjQuu2ci53TXdRYJy3SoROQudoBy1sSexEJvgXJRz+772CsVJOsqY
	9H4oZgI81D9F/8LIUXZG4yVNffyup6n8=
X-Received: by 2002:a05:6512:6c8:b0:5b8:b419:b7b with SMTP id
 2adb3069b0e04-5b8e0a18d1cmr355916e87.49.1790236328001; Thu, 24 Sep 2026
 00:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
 <arInho2bsfJiCgjV@houat> <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
In-Reply-To: <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 09:51:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com>
X-Gm-Features: AclHuK8rPixm6Txa-uGEDmLc8FjUZWkrHeBO_IgguNN-8bSfUZSDFWgY_JslL90
Message-ID: <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Luca,

sorry for my slowness!

On Thu, Sep 24, 2026 at 9:01=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
> On Tue Sep 22, 2026 at 9:09 AM CEST, Maxime Ripard wrote:

> >> -    } else if (bridge) {
> >> +    if (!bridge) {
> >> +            dev_err(dev, "no bridge\n");
> >> +            return -ENODEV;
> >> +    } else if (!drm_bridge_is_panel(bridge)) {
> >>              /* TODO: AV8100 HDMI encoder goes here for example */
> >>              dev_info(dev, "connected to non-panel bridge (unsupported=
)\n");
> >>              return -ENODEV;
> >
> > I wonder if we still need that branch. Every panel is a bridge now, and
> > it looks like we don't have any specific panel handling in this driver,
> > so I guess it supports bridges already?
> >
> > Linus, do you know why this condition was here in the first place?
>
> I had the same thought while writing the patch, but I chose to be
> conservative.
>
> Linus, unless you have more info I'm going to apply the patch as
> is. Removing this special case would be welcome as a later patch.

I'd say go ahead as-is.

I do have the idea to code up and submit the AV8100 encoder
and I have the hardware to test it, but every other user should
be using panels directly, and I would be the only non-panel
user so I can deal with it when it comes up.

Yours,
Linus Walleij


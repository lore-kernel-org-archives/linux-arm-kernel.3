Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FD3C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fYDLPuw7TdEq9beCl8lZHCEAKip/STw7RgtlWkrkg8=; b=39LHwqAzmL3B3q7WnKeW/k2r+U
	zj/xjHDnqyFDo6X0yuZSx482+FSt8ZB4uHqXnIp36K3/CPvsgVsCwMRNrRVrdNaY6iIoxkgOR90e/
	wSs2xH2CP3+wJ1f8WbH8PX5NCrV51oUnGjlMaZDp/J6PIv77wQ9y+CY8MUlvHnihyXO729bJnfOZq
	tXWmcdV8qts5mdF+RToY7kU5aMTDLL4ZP8K/bI7ouPmJGry6SknUZSyD9RKen+xmm2S0Ei9Wppwif
	3r46ZRcys2FdFrsl5Ir5Uti3M39dLy87Nmz2jluefunrWFK/sesHWwdLYFIpdoX4H4h44prx5l67K
	yB8SsAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8kE-0000000DvXl-32ca;
	Fri, 25 Sep 2026 16:25:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8kD-0000000DvXN-0Yi0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:25:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CFEC4435C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 16:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758D01F00899
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353552;
	bh=6fYDLPuw7TdEq9beCl8lZHCEAKip/STw7RgtlWkrkg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SkZTyo4xxfFfIHkKIcVzKt/r6NVyGCRHYPlxBuj/CfdOc5/UiPnHhsNeysafJ83uT
	 PrsApt20TbtzJyRpj/ArQV+ysPRtw70TjqJbVdGUsvZcqDtlWD9Kq6uCr9e2hR5TcQ
	 WqHkFq31PmtukKbdE6y/W8GS9/XSR4o73yuajz9jGmCx6GdhINz2kzewMKYZle40Rz
	 Jc4eglh/tm38aa+rDhaE+rYk23PpYcf8o3TBVaTamJ/idDzDGvcrFiD2suq/GxYFWK
	 zgFkLbpLOozrM5LhUI306UQ1mmZ30ZjqiBsz8Sk4d6Pq2YHLUgL3h7x5LiWU8/PFE8
	 PJ7V94nNq5nFA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eb39a8edso580403e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 09:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBC6YRUyoDxpzbvarFZKFxM1nlyKOUtHeaJ7yjm5fohLPtYiGXdIGKek+8gk6WRsSUCEK0vUZz0Phyao7bIJBk@lists.infradead.org
X-Gm-Message-State: AFuF++mDVdJ6Qu2BHKavz30dpgoq8NIVmig1pGYCDE/qBi/o3uFU+t4V
	+AL0Gj4h3yg4kICD/0hd69rs5i9Idk0NJJmeX9vbZKwKasiAL7KSJqudFnpavSe6h0FVOpZgpIE
	mLeMD1LEwdaV5umS7A7t+T/g2aRbKT5I=
X-Received: by 2002:a05:6512:1344:b0:5b6:1a7c:59db with SMTP id
 2adb3069b0e04-5b8df0d22f7mr2083445e87.53.1790353550897; Fri, 25 Sep 2026
 09:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
 <arInho2bsfJiCgjV@houat> <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
 <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com> <arTlpd-KAsVpj3UH@houat>
In-Reply-To: <arTlpd-KAsVpj3UH@houat>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 18:25:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLmktDoqn2EbXsNnyGRudo-q2NCxUf+9ZjeU+WrY4CBMWw@mail.gmail.com>
X-Gm-Features: AclHuK_fq2ZWJ1A-qMmc6hpV7kHeTfdnkXq9HUzMYWRHIkAmDRIf8rPpfyjUW1o
Message-ID: <CAD++jLmktDoqn2EbXsNnyGRudo-q2NCxUf+9ZjeU+WrY4CBMWw@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
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

On Thu, Sep 24, 2026 at 10:57=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Thu, Sep 24, 2026 at 09:51:53AM +0200, Linus Walleij wrote:

> > > Linus, unless you have more info I'm going to apply the patch as
> > > is. Removing this special case would be welcome as a later patch.
> >
> > I'd say go ahead as-is.
>
> I'm fine with that, but I really want this removed at some point.

If Luca wanna fix this up (drop this path) that's fine by me,
else send a patch immediately after this is applied and I'll
ACK it.

> > I do have the idea to code up and submit the AV8100 encoder
> > and I have the hardware to test it, but every other user should
> > be using panels directly, and I would be the only non-panel
> > user so I can deal with it when it comes up.
>
> It won't change a thing. All existing "panel" users will be bridge users
> after this patch is merged. So whether you want to enable a bridge or
> not shouldn't matter, the only thing that does is whether the existing
> users would still work.

I know, all it does is create a snag that I would run into myself.

But it's not gonna be a problem for anyone else, that's all I meant.

Yours,
Linus Walleij


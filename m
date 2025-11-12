Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A75CD13DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WbN4gVhAi7/dFnfMQk33X/cl2uTLZHAs/UmGdVEISc=; b=yoEgR36YOdYqWGh51aRxHuV6fS
	YLnryiogC18Zhxv6Nr8WnliUgEiQLAcV5xJR1L/o7+yxUtVLK927qNmiBf4sPMbqQXXXRKZ63wKjq
	kWNJGGSt09yZn/Os8moC7jQ1umnEqswFPo6dmPH+aeBch19QDWgcNHR1rIZgZQ6tKbTIEkjln+/r0
	idSX4DHB/wWXo6jS9zPZOhf5c9l/dUSZD9Z1i/INHiIdQRTkbe4u6MpgGmvN/7UAv2T56HqQkqUtO
	uIE7EvqADBPHpo/Sv5+0lBZXIu06BYTiWoyN1LXwSibgH1GvPfxv2bKPX+wxQH4GjRC4fVx35+t0Z
	FrR6Wciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJECM-00000009DOz-3J0j;
	Wed, 12 Nov 2025 16:59:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJECK-00000009DOA-0Yy2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 16:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 654B944682
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 16:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F55C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762966795;
	bh=RVOBomhYRdwmTIvo3d1upFxr9xv6m2ioRcySu2Zct+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XxxxjSUNde86wmg/dcnOrvIfN2jepikxpY7GV4lYOLhagr1EawmOpBYrVV2HAdtyO
	 3TUYFKqPEPkY1rdnnXhBeoPa2xNa0hRO7yO1zs7ZhIVNnGwrszehllb7MZvKJSI+AF
	 uMKxv9JnbGqVlPiq5Py5LSOsJpDK+jw9LCdAbRWbGK5UddHigpNjs2JQWovpDwxDMr
	 SC6Bd8xvqKR5FbdKSYdtaX5S0iq5ObFngQn+ArfsBJw4HLkKHHe438BTi8m43lqaQJ
	 W4DENohKvqRFDeQMktCHwYehTOpkJbeMA8rq58HHHrJFxIJsWMjthzdqM4TcXtCWYA
	 ODaKBn0IoFE+Q==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso1683257a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 08:59:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9G1lCOywgWSXPGAhyuBWX4Xp1pilAkwztuELJFoiOA080IJKopL6eUjjcOcdp3f2ChVUSSEDUNU+RD3nwggNO@lists.infradead.org
X-Gm-Message-State: AOJu0YwyPEl009gpDvpB0jby6RTm5rH5SQBxP9Ug2Sg0ZglPnD7WFJgq
	h7Q/aDacQBUmaNpolWKKEU57f4lViENMogLREpIHRqjJGmkTPT2SdO1J1WI8nCKbAbBXgiw/KLl
	QWci/JB6ADX2QyHaPpnWvLg80KGAQBA==
X-Google-Smtp-Source: AGHT+IEOqt/wJY8Cvt+ACAz7CBaI8+ZUOPnH6TL37Ek0ZSDGOQg0lL8OZ1nhy6LAM/AdjuxvzXmeIb2YLoCTlRThoLE=
X-Received: by 2002:a17:907:3fa8:b0:b70:b077:b957 with SMTP id
 a640c23a62f3a-b733198f04fmr406767266b.15.1762966793516; Wed, 12 Nov 2025
 08:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20251031175926.1465360-1-robh@kernel.org> <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org> <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
In-Reply-To: <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Nov 2025 10:59:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
X-Gm-Features: AWmQ_bmxZCkzBm3PwPqC-n2_BEF69Zs3agW7isLAr86xc9rjwe66yE2yHIz-vl4
Message-ID: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
Subject: Re: [PATCH v6] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_085956_238700_22FB6CA6 
X-CRM114-Status: GOOD (  30.52  )
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

On Wed, Nov 12, 2025 at 9:43=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, 11 Nov 2025 at 12:59, Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Nov 11, 2025 at 10:38:05AM -0700, Mathieu Poirier wrote:
> > > Hi Rob,
> > >
> > > Please see may comment for st_remoteproc.c
> > >
> > > On Fri, Oct 31, 2025 at 12:59:22PM -0500, Rob Herring (Arm) wrote:
> > > > Use the newly added of_reserved_mem_region_to_resource() and
> > > > of_reserved_mem_region_count() functions to handle "memory-region"
> > > > properties.

[...]

> > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remotepro=
c/st_remoteproc.c
> > > > index e6566a9839dc..043348366926 100644
> > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > @@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc *rp=
roc, const struct firmware *fw)
> > > >     struct device *dev =3D rproc->dev.parent;
> > > >     struct device_node *np =3D dev->of_node;
> > > >     struct rproc_mem_entry *mem;
> > > > -   struct reserved_mem *rmem;
> > > > -   struct of_phandle_iterator it;
> > > > -   int index =3D 0;
> > > > -
> > > > -   of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > > > -   while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > > > -           rmem =3D of_reserved_mem_lookup(it.node);
> > > > -           if (!rmem) {
> > > > -                   of_node_put(it.node);
> > > > -                   dev_err(dev, "unable to acquire memory-region\n=
");
> > > > -                   return -EINVAL;
> > > > -           }
> > > > +   int index =3D 0, mr =3D 0;
> > > > +
> > > > +   while (1) {
> > > > +           struct resource res;
> > > > +           int ret;
> > > > +
> > > > +           ret =3D of_reserved_mem_region_to_resource(np, mr++, &r=
es);
> > > > +           if (ret)
> > > > +                   return 0;
> > >
> > > The original code calls rproc_elf_load_rsc_table() [1] after iteratin=
g through
> > > the memory region, something that won't happen with the above.
> >
> > Indeed. it needs the following incremental change. It is slightly
> > different in that rproc_elf_load_rsc_table() is not called if
> > 'memory-region' is missing, but the binding says that's required.
> >
> > 8<--------------------------------------------------
> >
> > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st=
_remoteproc.c
> > index 043348366926..cb09c244fdb5 100644
> > --- a/drivers/remoteproc/st_remoteproc.c
> > +++ b/drivers/remoteproc/st_remoteproc.c
> > @@ -120,15 +120,19 @@ static int st_rproc_parse_fw(struct rproc *rproc,=
 const struct firmware *fw)
> >         struct device *dev =3D rproc->dev.parent;
> >         struct device_node *np =3D dev->of_node;
> >         struct rproc_mem_entry *mem;
> > -       int index =3D 0, mr =3D 0;
> > +       int index =3D 0;
> >
> >         while (1) {
> >                 struct resource res;
> >                 int ret;
> >
> > -               ret =3D of_reserved_mem_region_to_resource(np, mr++, &r=
es);
> > -               if (ret)
> > -                       return 0;
> > +               ret =3D of_reserved_mem_region_to_resource(np, index, &=
res);
> > +               if (ret) {
> > +                       if (index)
> > +                               break;
> > +                       else
> > +                               return ret;
> > +               }
>
> This looks brittle and I'm not sure it would work.
>
> Going back to the original implementation, the only time we want to
> "break" is when @index is equal to the amount of memory regions _and_
> ret is -EINVAL.  Any other condition should return.

@index equal to number of entries returns -ENODEV, so that condition
is impossible. We can simply it to this:

if (ret =3D=3D -ENODEV && index)
    break;
else
    return ret;

If you want to keep the prior behavior when 'memory-region' is
missing, then '&& index' can be removed, but I think that was wrong
behavior.

Rob


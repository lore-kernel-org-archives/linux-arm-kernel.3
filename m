Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C09C36002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 04:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YNq+8wh69g7XR7Gyfb7FRWotpm5rpCwtlLupRMF0+0=; b=jHR/xKdw9Nv+S1
	UCTh0JZRzuHU87yPVWKCTCkx0kSVdoSXsrgZLFnu7svR3MimRMf92O7QHJeNxMz4h4TyxZ7jkCvHU
	zHFjWdJb//yRz6wSrfmvfsC2kezsweQGuq7EUmW0u09j+hhbfDTGM39jnrML7f3N36dKgislcQqd5
	qWEQdxKvsK+10y73CEwyB1pRBnNu3F+2FeBRluzlEdtocVlTv8YxId7MNeIE34cYM3KCoczyc1il/
	IHM5Ke4CfG75DVhBNbsPkc1sXG9thziaLRJz+2DpqwomTjf6vNxyQL2TCNtqu6RHI5gSbyne8wBR+
	O4j9bIV9f6rmGzRe0sNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txewq-0000000A9i6-21uJ;
	Thu, 27 Mar 2025 04:34:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txev2-0000000A9Xa-1beU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 04:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BF345C5CB7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 04:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB650C4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 04:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743049958;
	bh=vkEar+Bp4mb9U1ErBYXk0ufSXnmYuVhKsrxGSFbrQIw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=RjNLK19Ua83WOdqGeiIkiXP+kkZ6tB9H3gdBqX+f434sWgg8md3d4JywjLxUNK+S/
	 YNzS+8eiLPRabeg5zQLw1mKp2jm9t2r4A+4zrn2vrweZtSVuIU8MlforeKvegAfg0J
	 MSixpKgXXITUUiiXkMSeNmKKUNZsjW8e2k6aFadcwj7t2Yq2pCqXI6cSzzeIWxBXoc
	 /mUgYaPW2dbLJySsKGmTszOYvNNJvcUElMVKdwXyXEtpMG+DlCPbIhK4t1XSgDSH0j
	 zP0CVsusc1EtWTkUyN67HZlKQx5o5e7steT7i9jDQVISB/tQaWrQEQpUkbsAaHc3KB
	 QGWSTihjCYYvg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c0517142bso6240731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 21:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9gkcbNEYueCCuN89fer8xqrsXtpIMHPo5f4Y1fFuuy2crcJ1EBXi85yLfVQUIk3r7ceUReYAaCkccBxOj5lRf@lists.infradead.org
X-Gm-Message-State: AOJu0YyDgbV7awXer10tefRUlhKVZbSRcg4Wmmb6wjN3S0AWBUTTWAdS
	8zN9feZOO7L0LOVATwut4DrB48YlU/n/Ltv5WISiCsYKIPMhES+k0IVjoHcN+pfl9P9sYDwXDEl
	bhgQxEnO5jWNmMYFnT/qKAOPlXQs=
X-Google-Smtp-Source: AGHT+IF6fAB138KxHWy/pT7d/+7sa0DqbsRN8WZ3PB5VKFSTgeIGYi9SJIdz25/4ZRPKiUb58v/Gi3ZiI0Z3sR4FiZc=
X-Received: by 2002:a05:651c:1a0b:b0:30b:b7c3:ea71 with SMTP id
 38308e7fff4ca-30dc5e31b95mr9042391fa.15.1743049957271; Wed, 26 Mar 2025
 21:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-3-robh@kernel.org>
 <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com> <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 27 Mar 2025 12:32:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v65nG82vDvTHMW0GQFHed5L4pQFMDggtTpuLqfm=woKm=w@mail.gmail.com>
X-Gm-Features: AQ5f1JqdFE0VpmnOb9GgVtgJfb7ntGDb2tyu8gNbju_XzgxeziYqnhZQK0zKPKw
Message-ID: <CAGb2v65nG82vDvTHMW0GQFHed5L4pQFMDggtTpuLqfm=woKm=w@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_213240_508293_B5C55CD6 
X-CRM114-Status: GOOD (  32.25  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 27, 2025 at 2:53=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Mar 26, 2025 at 1:44=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > Hi,
> >
> > On Tue, Mar 18, 2025 at 7:29=E2=80=AFAM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> > >
> > > Simplify of_dma_set_restricted_buffer() by using of_property_present(=
)
> > > and of_for_each_phandle() iterator.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  drivers/of/device.c | 34 +++++++++++++---------------------
> > >  1 file changed, 13 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > > index edf3be197265..bb4a47d58249 100644
> > > --- a/drivers/of/device.c
> > > +++ b/drivers/of/device.c
> > > @@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
> > >  static void
> > >  of_dma_set_restricted_buffer(struct device *dev, struct device_node =
*np)
> > >  {
> > > -       struct device_node *node, *of_node =3D dev->of_node;
> > > -       int count, i;
> > > +       struct device_node *of_node =3D dev->of_node;
> > > +       struct of_phandle_iterator it;
> > > +       int rc, i =3D 0;
> > >
> > >         if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> > >                 return;
> > >
> > > -       count =3D of_property_count_elems_of_size(of_node, "memory-re=
gion",
> > > -                                               sizeof(u32));
> > >         /*
> > >          * If dev->of_node doesn't exist or doesn't contain memory-re=
gion, try
> > >          * the OF node having DMA configuration.
> > >          */
> > > -       if (count <=3D 0) {
> > > +       if (!of_property_present(of_node, "memory-region"))
> > >                 of_node =3D np;
> > > -               count =3D of_property_count_elems_of_size(
> > > -                       of_node, "memory-region", sizeof(u32));
> > > -       }
> > >
> > > -       for (i =3D 0; i < count; i++) {
> > > -               node =3D of_parse_phandle(of_node, "memory-region", i=
);
> > > +       of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, =
0) {
> > >                 /*
> > >                  * There might be multiple memory regions, but only o=
ne
> > >                  * restricted-dma-pool region is allowed.
> > >                  */
> > > -               if (of_device_is_compatible(node, "restricted-dma-poo=
l") &&
> > > -                   of_device_is_available(node)) {
> > > -                       of_node_put(node);
> > > -                       break;
> > > +               if (of_device_is_compatible(it.node, "restricted-dma-=
pool") &&
> > > +                   of_device_is_available(it.node)) {
> > > +                       if (!of_reserved_mem_device_init_by_idx(dev, =
of_node, i)) {
> > > +                               of_node_put(it.node);
> > > +                               return;
> > > +                       }
> > >                 }
> > > -               of_node_put(node);
> > > +               i++;
> > >         }
> > >
> > > -       /*
> > > -        * Attempt to initialize a restricted-dma-pool region if one =
was found.
> > > -        * Note that count can hold a negative error code.
> > > -        */
> > > -       if (i < count && of_reserved_mem_device_init_by_idx(dev, of_n=
ode, i))
> > > -               dev_warn(dev, "failed to initialise \"restricted-dma-=
pool\" memory node\n");
> > > +       dev_warn(dev, "failed to initialise \"restricted-dma-pool\" m=
emory node\n");
> >
> > This changes the behavior. Before this patch, it was:
> >
> >     if a restricted dma pool was found, but initializing it failed, pri=
nt
> >     a warning.
> >
> > Whereas now it has become:
> >
> >      print a warning unless a restricted dma pool was found and success=
fully
> >      initialized.
> >
> > This change causes the kernel to print out the warning for devices that
> > don't even do DMA:
>
> Thanks. I fixed it up to only warn if i is non-zero.

Not sure if that matches the old behavior though? A node could have
memory-regions for shared dma pools but not restricted dma pools,
and i would be non-zero.

IMO the warning should be in the "else" branch of

    if (!of_reserved_mem_device_init_by_idx(dev, of_node, i))


ChenYu


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457BFC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stLi4B0foR2R4NWXfqcRwLYW1EjF27oEExF/ULLTyLc=; b=bV9+FfIk3frakNyBTNks9hb9PU
	ka0gjhFfZjolvSvPKBT5KZe0J9N/GZ1pHHeej99V7WMHhMIYl0tHesOO9nmQZGjV8RKsUEGcpc2RW
	xAHxs+9IjxqjLV5I21OFOeagcK61BJrREp1VZNSE0fCWgJ+1exmOiJ8JSIY2NMYp0q/OcfvGqMEEv
	ADXJTopdJGD17EH+f7uK5633pD3CILZxTURZnR9aZQpo4VW+3pZTYhFbPmalBt6TBniVuSghaO48z
	3rfWFdDjQn2cl8k18hSx7gGqSBRr+fohJk8qahwbT/oQ8Sn87Zx+UldVBdD07a9nHjlT06d42QA0j
	lEksrS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2UY-0000000AMuB-3dUB;
	Wed, 19 Mar 2025 23:06:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2Sq-0000000AMe5-0gHe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 23:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D4EEA48B1C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 22:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDB9C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742425482;
	bh=wh2+nbO+uhOl81kfYkAvk91jGgv0SNefhWvjy1MiI9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uuGe+aOwcgf7kb6tS+eJjVfXHyx1rbvLoZ2NOaP02SzxNs47NRpR2LVVwhgwHQXBH
	 NltceS4U3rtwfOvmEq6YnwNECmBc2oMMbb9lU/j4Uom1lYzKvdw4wm1Yy6nW930eJu
	 Qj9XsiBQDeLSstZ6bM2e8hq8mcmFfI/UZ91g+PDxaY6TrX2C3SXVc/S9g9siUzR7Xm
	 hpdQQZo/klOGL1YJZWIiEqKqUyJrEUGeSc8uY7viKfW1a/4xC4CXnFy1b01yO2/l88
	 BlSp4hn6bDt5R1zh7kce8Os/lelWqy7DrU4HRFeFfXCx+Wxz9JKCbO/8BHToR3LrOm
	 gULLlNMRPLUag==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so282299a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 16:04:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKcYBU+f+FMpROiRAhg/E6iKR/kVlX8e94PnDZj3O6GAStMb9rIwplRmjNpWi69Cr7J+DwPCGgd3qQt62sINWG@lists.infradead.org
X-Gm-Message-State: AOJu0YzVgRvPI8mIk+H8XQTWmO+yb4uYrZL6DYvlUIaf/B93zs9FXu34
	vzR9lVHnbAEC+axcPZUEtn4jqZjo1vwyMZeETuizdMfIS1UUXvkKTzwWBCM9kUf34DDJWVg0Ca6
	0vO2x1WtTvCaAVsAZYcYwTPMHlQ==
X-Google-Smtp-Source: AGHT+IH1Yrc3Y5KhcKuIDvTrQ1KQbSSjJSIP+aKUctEQfy6L4vvWLzhbwAuvXFhDZUh0Wqy+O4jXTvspjUWR7fVZh34=
X-Received: by 2002:a05:6402:d0d:b0:5dc:7643:4f3d with SMTP id
 4fb4d7f45d1cf-5eb9eee0416mr908900a12.1.1742425481081; Wed, 19 Mar 2025
 16:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
In-Reply-To: <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Mar 2025 18:04:30 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
X-Gm-Features: AQ5f1JqOv9zU_NIrquP_FiizlsCH0dJCdTrTRAoIvYNPwVPq8s6b1gdkB9PCxY8
Message-ID: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_160444_347483_451F925D 
X-CRM114-Status: GOOD (  25.95  )
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

On Wed, Mar 19, 2025 at 10:26=E2=80=AFAM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Rob,
>
> On 3/18/25 00:24, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() and
> > of_reserved_mem_region_count() functions to handle "memory-region"
> > properties.
> >
> > The error handling is a bit different in some cases. Often
> > "memory-region" is optional, so failed lookup is not an error. But then
> > an error in of_reserved_mem_lookup() is treated as an error. However,
> > that distinction is not really important. Either the region is availabl=
e
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > For v6.16
> >

[...]

> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm3=
2_rproc.c
> > index b02b36a3f515..9d2bd8904c49 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *rpro=
c)
> >  {
> >       struct device *dev =3D rproc->dev.parent;
> >       struct device_node *np =3D dev->of_node;
> > -     struct of_phandle_iterator it;
> >       struct rproc_mem_entry *mem;
> > -     struct reserved_mem *rmem;
> >       u64 da;
> > -     int index =3D 0;
> > +     int index =3D 0, mr =3D 0;
> >
> >       /* Register associated reserved memory regions */
> > -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > -     while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > -             rmem =3D of_reserved_mem_lookup(it.node);
> > -             if (!rmem) {
> > -                     of_node_put(it.node);
> > -                     dev_err(dev, "unable to acquire memory-region\n")=
;
> > -                     return -EINVAL;
> > -             }
> > +     while (1) {
> > +             struct resource res;
> > +             int ret;
> > +
> > +             ret =3D of_reserved_mem_region_to_resource(np, mr++, &res=
);
> > +             if (ret)
> > +                     return 0;
> >
> > -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
> > -                     of_node_put(it.node);
> > -                     dev_err(dev, "memory region not valid %pa\n",
> > -                             &rmem->base);
> > +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
> > +                     dev_err(dev, "memory region not valid %pR\n", &re=
s);
> >                       return -EINVAL;
> >               }
> >
> >               /*  No need to map vdev buffer */
> > -             if (strcmp(it.node->name, "vdev0buffer")) {
> > +             if (strcmp(res.name, "vdev0buffer")) {
>
> I tested your patches

Thank you.

> The update introduces a regression here. The strcmp function never return=
s 0.
> Indeed, it.node->name stores the memory region label "vdev0buffer," while
> res.name stores the memory region name "vdev0buffer@10042000."
>
> Several remoteproc drivers may face the same issue as they embed similar =
code.

Indeed. I confused myself because node 'name' is without the
unit-address, but this is using the full name. I've replaced the
strcmp's with strstarts() to address this. I've updated my branch with
the changes.

Rob


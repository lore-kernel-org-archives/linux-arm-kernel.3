Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37196C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 18:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltIzvHSyMn+yXF6CvBuG7zxq8JNQIhr9+oOqa5LLrpc=; b=iI0T19xf5O/AsF/+x9emXddmw3
	iHj9RIgpm7iJ39bJATips/Evxz0N0TtgsbL9SEGj5jHs6SIV3y/ynGaKZ5xOMyypz25gTFoD6jKVd
	Iw3azEYExWq5aZ0QI7qyjGHIGwGzG9kaYsFMd+LEj+L1SCQwSfI6vYJLWtgUNQY/m93IiAli0HOfu
	VJCJDfnvQrOUZCNPuUpdVyNgKlUMZaEaFWX66B3BQP2653g77ClZ14jowVEMb+IXVcP86Maqw4//c
	XE/3vBSf+8nAIgu9LGs0Qma9IRd1qeqcX6pIUh9cLnNvE9+GUtLXxFbjX8x1dvBhnmoQj7q+Inffr
	OYvyvnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVwC-00000009Of7-1Vaz;
	Wed, 26 Mar 2025 18:57:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVs7-00000009OML-1sZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 18:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62387A40EF6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 18:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF4AC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743015182;
	bh=7tnbCUTKMpPo8aoqQiYW410Hhe5LPNkwVR28/52KUGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=snLlwT1ByOOZ8VDdLTGeiVAiEWrHtg3EvWVkctlzQIGFZzDT7XBzN2DIIFpHVRuA4
	 QWSXjBNoMYxPNGrYI7EhmcSj0AeKKRNkXc7ncCYbP0fslp4P4+jMIkZIAktw92xzl9
	 f/6pVTEXC4NSXGu4xof5rtvBej+C0GDqtW1wkGhV6Wi2YRwu2jpb0Lyghf8UlzytoG
	 WwQ6DMNodUQHQk2VpoXa2/y89pLaPCLpwF+ISbR4hp6cRaabZWfTVWMtcr/ZSfSmh8
	 jwKqvjyFp2FKpKOIs73vDRG4Rw8NplM2rXgHf/zkk7H07J9bPh8EYwSA5OcJVoLYAh
	 Co5wZxznPQ7aQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso32945066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 11:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5nM7AzXK5h3akOu5Aq+kYyww+hAPbJidu+n522Zh95McHAZ5rrk30syV4Gq4iPDYsL7CxWQP86ZlWMrKJplIJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxueJyumpfJqkzDWo7IdshGfuyAf6tz1c9hiGNC4hXDucYzAphs
	VV5lJMEOixqYNIFC66HcfG0DHyjbpLgeppdnIxJrzQsTXmhSef5O4BtyLnliZsOInWuByBd0M9o
	L5BkA5h/HYqoo82O8K7h2QtbkNA==
X-Google-Smtp-Source: AGHT+IEi/FLkb6+pDXS2OgDct0wDDLVjgAusO19cQUp3SH7xeV/KwpO2rct7/toV7PxXM7MD6oHfl5OWID6sUvuLyTI=
X-Received: by 2002:a17:907:7295:b0:ac2:26a6:febf with SMTP id
 a640c23a62f3a-ac6e0d3384emr557164766b.20.1743015180452; Wed, 26 Mar 2025
 11:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-3-robh@kernel.org>
 <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
In-Reply-To: <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Mar 2025 13:52:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jqmc05lmNw-rFmLFhT71JwYvVm4xio8OJGuHie4RorDqomqBJbJolJsSNo
Message-ID: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
To: wens@kernel.org
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
X-CRM114-CacheID: sfid-20250326_115303_610019_F10B5007 
X-CRM114-Status: GOOD (  28.65  )
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

On Wed, Mar 26, 2025 at 1:44=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> Hi,
>
> On Tue, Mar 18, 2025 at 7:29=E2=80=AFAM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
> >
> > Simplify of_dma_set_restricted_buffer() by using of_property_present()
> > and of_for_each_phandle() iterator.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  drivers/of/device.c | 34 +++++++++++++---------------------
> >  1 file changed, 13 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index edf3be197265..bb4a47d58249 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
> >  static void
> >  of_dma_set_restricted_buffer(struct device *dev, struct device_node *n=
p)
> >  {
> > -       struct device_node *node, *of_node =3D dev->of_node;
> > -       int count, i;
> > +       struct device_node *of_node =3D dev->of_node;
> > +       struct of_phandle_iterator it;
> > +       int rc, i =3D 0;
> >
> >         if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> >                 return;
> >
> > -       count =3D of_property_count_elems_of_size(of_node, "memory-regi=
on",
> > -                                               sizeof(u32));
> >         /*
> >          * If dev->of_node doesn't exist or doesn't contain memory-regi=
on, try
> >          * the OF node having DMA configuration.
> >          */
> > -       if (count <=3D 0) {
> > +       if (!of_property_present(of_node, "memory-region"))
> >                 of_node =3D np;
> > -               count =3D of_property_count_elems_of_size(
> > -                       of_node, "memory-region", sizeof(u32));
> > -       }
> >
> > -       for (i =3D 0; i < count; i++) {
> > -               node =3D of_parse_phandle(of_node, "memory-region", i);
> > +       of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0)=
 {
> >                 /*
> >                  * There might be multiple memory regions, but only one
> >                  * restricted-dma-pool region is allowed.
> >                  */
> > -               if (of_device_is_compatible(node, "restricted-dma-pool"=
) &&
> > -                   of_device_is_available(node)) {
> > -                       of_node_put(node);
> > -                       break;
> > +               if (of_device_is_compatible(it.node, "restricted-dma-po=
ol") &&
> > +                   of_device_is_available(it.node)) {
> > +                       if (!of_reserved_mem_device_init_by_idx(dev, of=
_node, i)) {
> > +                               of_node_put(it.node);
> > +                               return;
> > +                       }
> >                 }
> > -               of_node_put(node);
> > +               i++;
> >         }
> >
> > -       /*
> > -        * Attempt to initialize a restricted-dma-pool region if one wa=
s found.
> > -        * Note that count can hold a negative error code.
> > -        */
> > -       if (i < count && of_reserved_mem_device_init_by_idx(dev, of_nod=
e, i))
> > -               dev_warn(dev, "failed to initialise \"restricted-dma-po=
ol\" memory node\n");
> > +       dev_warn(dev, "failed to initialise \"restricted-dma-pool\" mem=
ory node\n");
>
> This changes the behavior. Before this patch, it was:
>
>     if a restricted dma pool was found, but initializing it failed, print
>     a warning.
>
> Whereas now it has become:
>
>      print a warning unless a restricted dma pool was found and successfu=
lly
>      initialized.
>
> This change causes the kernel to print out the warning for devices that
> don't even do DMA:

Thanks. I fixed it up to only warn if i is non-zero.

Rob


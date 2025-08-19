Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82414CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyHm4m6UTAkFu7p3pI+i84kDraM0Nwn1xleBTlSvbt0=; b=Q2RGJn5XsiJPvyxd+PpenFYzdx
	fZmNw5uCPJ+l5AZ1NpaiUVVUflgQSd4U4FIcQDZAPm6r+ehLqzUzth5jYOLEuFhuXjF8vT9vCOaL/
	XdnSNwz8BJbhTKwOSh0H9hrAHmm03A6zgBV0fue2zdQ188G8HPPVHDibAbSWf1jwt0JE8wnn+PG+/
	mmYdN08zEXZp0/5znQggxbjL4F55Fllye7+W+yitI5p/F/37AqWJAURrmYsaOAhmpoQGnAwCVhsIz
	KeIAR/ApVJitF6iYaUpo++uV8BXy/9ZESnFbxJqDrjL8IoJbJrzCYsaJshqLnQ6Pdh84CQyp9hA/l
	WvIwZnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSS0-0000000BTvr-0TfV;
	Tue, 19 Aug 2025 19:56:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQCT-0000000B720-0gfK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 17:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C3CC5C6488
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 17:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4B4C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755624763;
	bh=J6y6LuaznEwKZBwFRPm+m4Y8k2u/faVNHPijZP4is6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dR8zlb3+YOIv0cuHGrDos071e5AJODOoPAJy/l7ZeqlUfVScMSh9LjxoYtVoAuDD0
	 xBY2B1XXEdDyDa2AuQcHb6aqVPIoI5+YA+qqtl1L1nuwVko4zyDBhhUr6uYe3+XKQz
	 KyLh0Dgo5bun2jnTfu2qwS6buxPNHounZ3WoPE6U6jET4rNaLZd5qKOIyKOTWxWL8K
	 HGzcNzPbYOiTYXfyLQDngFLQn4yvzxj1q3ZD7l1gozmu3XJ8ZutFm6GWNW9rbX1Xaa
	 t2ttS9bUXjnzFDU8VJS+6X4mwWFD+O8l8o8Dp+idkWxgqe6HPxFM0ORj/rSoRXy3jA
	 z7vVVpXEQY4Kw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb78d5e74so952727766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJNAOiCh0CEgzDrAgsLYEl+35VEUbXR6b4S+SzyLLngv/esP3X92gIxoji+T/BCPspAc3cr/S3RIu0VbXE1Tns@lists.infradead.org
X-Gm-Message-State: AOJu0YzmR2diIuxwaWxZHRSdkKhZMqLW6Xf7mDK/Sz6iXADxD9HLDk6z
	KTcqJLusgKweyd70hGvgNr+5hEV3efNuQeKTjOpYyegXCnitGDe9SDzqGjLF4RQrDSyMayDEA9+
	ZbppOQoJE96FzR70f8Myfi5mTZiwXJw==
X-Google-Smtp-Source: AGHT+IEUi1cNispFJzaTig/zRP3yzP5O0TnRE9XfPCw/ckDcq03Jy+Mgc0TSd/4yPwlKVH5V12ZUjepBe+4MMFOi9Zs=
X-Received: by 2002:a17:907:7f0d:b0:afd:d993:9f2b with SMTP id
 a640c23a62f3a-afddd2351camr276179566b.65.1755624762291; Tue, 19 Aug 2025
 10:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250813214808.895654-1-robh@kernel.org> <te2o47dxihjsckaigfdhbrbyqxaeqmchmtx5xbx5y2smu6yaja@t7uccvfsxmay>
In-Reply-To: <te2o47dxihjsckaigfdhbrbyqxaeqmchmtx5xbx5y2smu6yaja@t7uccvfsxmay>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Aug 2025 12:32:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL41LWqXgwLg_wyjk_1m6PdYFp0n6kv_Grk5659F-va-g@mail.gmail.com>
X-Gm-Features: Ac12FXxo6YLchimNgboodm-rodCkxohoNe_mlbRUV7_mnTRcH8K4JAg2Z9LphQQ
Message-ID: <CAL_JsqL41LWqXgwLg_wyjk_1m6PdYFp0n6kv_Grk5659F-va-g@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_103245_301121_2C6F5EAC 
X-CRM114-Status: GOOD (  33.95  )
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

On Thu, Aug 14, 2025 at 1:52=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Aug 13, 2025 at 04:48:03PM -0500, Rob Herring (Arm) wrote:
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
> > Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc=
.c
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v4:
> >  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> >
> > v3:
> >  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
> >  - Fix double increment of "i" in xlnx_r5
> >
> > v2:
> >  - Use strstarts instead of strcmp for resource names as they include
> >    the unit-address.
> >  - Drop the unit-address from resource name for imx and st drivers
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++--------
> >  drivers/remoteproc/imx_rproc.c            | 68 ++++++++------------
> >  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
> >  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++------------
> >  drivers/remoteproc/qcom_q6v5_pas.c        | 75 +++++++++--------------
> >  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++-----
> >  drivers/remoteproc/qcom_wcnss.c           | 23 +++----
> >  drivers/remoteproc/rcar_rproc.c           | 36 +++++------
> >  drivers/remoteproc/st_remoteproc.c        | 41 ++++++-------
> >  drivers/remoteproc/stm32_rproc.c          | 44 ++++++-------
> >  drivers/remoteproc/ti_k3_common.c         | 28 ++++-----
> >  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +-
> >  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 +-
> >  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++---------
> >  14 files changed, 204 insertions(+), 320 deletions(-)
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/q=
com_q6v5_adsp.c
> > index 94af77baa7a1..a5b7cbb8fe07 100644
> > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > @@ -625,26 +625,20 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
> >
> >  static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
> >  {
> > -     struct reserved_mem *rmem =3D NULL;
> > -     struct device_node *node;
> > -
> > -     node =3D of_parse_phandle(adsp->dev->of_node, "memory-region", 0)=
;
> > -     if (node)
> > -             rmem =3D of_reserved_mem_lookup(node);
> > -     of_node_put(node);
> > +     int ret;
> > +     struct resource res;
> >
> > -     if (!rmem) {
> > +     ret =3D of_reserved_mem_region_to_resource(adsp->dev->of_node, 0,=
 &res);
> > +     if (!ret) {
> >               dev_err(adsp->dev, "unable to resolve memory-region\n");
> > -             return -EINVAL;
> > +             return ret;
>
> This looks strange. Shouldn't it be `if (ret) {` ?

Indeed. I checked other spots for the same mistake and this is the only one=
.

>
> >       }
> >
> > -     adsp->mem_phys =3D adsp->mem_reloc =3D rmem->base;
> > -     adsp->mem_size =3D rmem->size;
> > -     adsp->mem_region =3D devm_ioremap_wc(adsp->dev,
> > -                             adsp->mem_phys, adsp->mem_size);
> > +     adsp->mem_phys =3D adsp->mem_reloc =3D res.start;
> > +     adsp->mem_size =3D resource_size(&res);
> > +     adsp->mem_region =3D devm_ioremap_resource_wc(adsp->dev, &res);
> >       if (!adsp->mem_region) {
> > -             dev_err(adsp->dev, "unable to map memory region: %pa+%zx\=
n",
> > -                     &rmem->base, adsp->mem_size);
> > +             dev_err(adsp->dev, "unable to map memory region: %pR\n", =
&res);
> >               return -EBUSY;
> >       }
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qc=
om_q6v5_mss.c
> > index 0c0199fb0e68..0fea5f91dd1c 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -1961,8 +1961,8 @@ static int q6v5_init_reset(struct q6v5 *qproc)
> >  static int q6v5_alloc_memory_region(struct q6v5 *qproc)
> >  {
> >       struct device_node *child;
> > -     struct reserved_mem *rmem;
> > -     struct device_node *node;
> > +     struct resource res;
> > +     int ret;
> >
> >       /*
> >        * In the absence of mba/mpss sub-child, extract the mba and mpss
> > @@ -1970,71 +1970,49 @@ static int q6v5_alloc_memory_region(struct q6v5=
 *qproc)
> >        */
> >       child =3D of_get_child_by_name(qproc->dev->of_node, "mba");
> >       if (!child) {
> > -             node =3D of_parse_phandle(qproc->dev->of_node,
> > -                                     "memory-region", 0);
> > +             ret =3D of_reserved_mem_region_to_resource(qproc->dev->of=
_node, 0, &res);
> >       } else {
> > -             node =3D of_parse_phandle(child, "memory-region", 0);
> > +             ret =3D of_reserved_mem_region_to_resource(child, 0, &res=
);
> >               of_node_put(child);
> >       }
> >
> > -     if (!node) {
> > -             dev_err(qproc->dev, "no mba memory-region specified\n");
> > -             return -EINVAL;
> > -     }
> > -
> > -     rmem =3D of_reserved_mem_lookup(node);
> > -     of_node_put(node);
> > -     if (!rmem) {
> > +     if (ret) {
> >               dev_err(qproc->dev, "unable to resolve mba region\n");
> > -             return -EINVAL;
> > +             return ret;
> >       }
> >
> > -     qproc->mba_phys =3D rmem->base;
> > -     qproc->mba_size =3D rmem->size;
> > +     qproc->mba_phys =3D res.start;
> > +     qproc->mba_size =3D resource_size(&res);
> >
> >       if (!child) {
> > -             node =3D of_parse_phandle(qproc->dev->of_node,
> > -                                     "memory-region", 1);
> > +             ret =3D of_reserved_mem_region_to_resource(qproc->dev->of=
_node, 1, &res);
> >       } else {
> >               child =3D of_get_child_by_name(qproc->dev->of_node, "mpss=
");
> > -             node =3D of_parse_phandle(child, "memory-region", 0);
> > +             ret =3D of_reserved_mem_region_to_resource(child, 0, &res=
);
> >               of_node_put(child);
> >       }
> >
> > -     if (!node) {
> > -             dev_err(qproc->dev, "no mpss memory-region specified\n");
> > -             return -EINVAL;
> > -     }
> > -
> > -     rmem =3D of_reserved_mem_lookup(node);
> > -     of_node_put(node);
> > -     if (!rmem) {
> > +     if (ret) {
> >               dev_err(qproc->dev, "unable to resolve mpss region\n");
> > -             return -EINVAL;
> > +             return ret;
> >       }
> >
> > -     qproc->mpss_phys =3D qproc->mpss_reloc =3D rmem->base;
> > -     qproc->mpss_size =3D rmem->size;
> > +     qproc->mpss_phys =3D qproc->mpss_reloc =3D res.start;
> > +     qproc->mpss_size =3D resource_size(&res);
> >
> >       if (!child) {
> > -             node =3D of_parse_phandle(qproc->dev->of_node, "memory-re=
gion", 2);
> > +             ret =3D of_reserved_mem_region_to_resource(qproc->dev->of=
_node, 2, &res);
> >       } else {
> >               child =3D of_get_child_by_name(qproc->dev->of_node, "meta=
data");
> > -             node =3D of_parse_phandle(child, "memory-region", 0);
> > +             ret =3D of_reserved_mem_region_to_resource(child, 0, &res=
);
> >               of_node_put(child);
> >       }
> >
> > -     if (!node)
> > +     if (ret)
> >               return 0;
>
> Shouldn't we differentiate between an absent region (OK) and an error
> during parse.

IMO, no. The resource is either available to Linux or it isn't. The
driver can decide whether it can continue out without or not. Anything
more is just validation of the DT which the kernel does a terribly
inconsistent job of and we have better tools for.

> > -     rmem =3D of_reserved_mem_lookup(node);
> > -     if (!rmem) {
> > -             dev_err(qproc->dev, "unable to resolve metadata region\n"=
);
> > -             return -EINVAL;
> > -     }
> > -
> > -     qproc->mdata_phys =3D rmem->base;
> > -     qproc->mdata_size =3D rmem->size;
> > +     qproc->mdata_phys =3D res.start;
> > +     qproc->mdata_size =3D resource_size(&res);
> >
> >       return 0;
> >  }
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qc=
om_q6v5_pas.c
> > index 02e29171cbbe..b3f7209289a6 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -121,7 +121,7 @@ struct qcom_pas {
> >
> >  static void qcom_pas_segment_dump(struct rproc *rproc,
> >                                 struct rproc_dump_segment *segment,
> > -                               void *dest, size_t offset, size_t size)
> > +                    void *dest, size_t offset, size_t size)
>
> Irrelevant? (and two next chunks)

Yes, not sure how those snuck in there.

Rob


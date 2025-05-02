Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BA7C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 20:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SwuKC6oTKanCvddYiXNYrIgzOUTcV//ECy2/MBEgrk=; b=pcVTMlRtvtwO7NCDjvYSaSTamh
	FfMgWqXQvdtTK51fu0B18q8x1dJlQynp7vGE8GNnt/8n/r60PwEQUC2cpn0R7kPmqPQ6Qw2RjcnBr
	1fGZC3LoWj/FHJ93YMEtIzFo+zvI2eML71hNhr0q4ww9LuF+jQONPj23OpyGrlmdNwz1sbIYDqSh/
	MJ7oFYOLNuhgw5K6keDkbBXb0JHPFi7HQMlP6nF616NLb9nzjT/ugEdzWKOpcFb+LB3RITVpA9/1n
	n08UqW8+Sd1Gh5V53Bq+TTkyXhFMg7qJw9t05agj6dBTNMYCGfqWEAzYKkPMFoz0MHtqiJmor857G
	EOjUdr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAx6U-00000002yrk-02av;
	Fri, 02 May 2025 20:35:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAx4Y-00000002yeC-0oHT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 20:33:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8910768451
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 May 2025 20:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06453C4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 May 2025 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746218005;
	bh=8cRp8SM0LX/HE5Z3KnJSbT0t2IN1vaMmNamccM78RCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VmZ+vHtBaP8SSohqqvMbuo/9dCNweJUIT1eTA8IbZzfbagwotj1lRz3ma4h4LYlc/
	 q5Z65x7TjCE5xFP00y4yDAEFn2clHK+U7B0mCpeXgauBWtaKsZNh54N3Muk290/ffY
	 q8LRgtoYCCBdXhGPcTQ4ewx8tCECuchfEETsDJoDqWM4Nk9xIYBAlp1D5IwxtP9tdL
	 9YxCmJhxfm2gQ5ASaCUihgOry/tQI4win9t5vyfsK5WqpPzw2Cl8i/qZq1IiUmdCBv
	 DWFp6bFBEYsM1EESOO41nOBOwlYINsr9OWIfH4theOH2OXkX41RMIR0l9ecPM/feGB
	 dy0cyd6c9JMQg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso3911640a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 13:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj8MOBLeLMh/icIGnt4Ahba1CzIHwbZlFKrMoD9gJJNKPzBLDUGVorF5uDEssCRIKioNTXXzjWTTEn8pjmHVi6@lists.infradead.org
X-Gm-Message-State: AOJu0YwJDNH32C/5WpNcJIPCxKALenyemdOEpz+oYHv9f50XB8OsY4mo
	zhGAXE/zpsomV9Gis+P0KK5th1Dt8N9S+aSw5BOIXsm/DF+yP6SSm3MbPD4rOpxe9O39YM+iNDX
	LCeZ3+h+Y8Bp/61Bg2HIqIiBLNQ==
X-Google-Smtp-Source: AGHT+IFJAjhO8qP9BM2k4YXGFjxF2DDTVd060jMohyR4Ip3XSKyXWvnjjpfR8v4ueb8Q+ILn2MtJ1K5BoJWlIuzn/k0=
X-Received: by 2002:a05:6402:354a:b0:5e5:ba77:6f42 with SMTP id
 4fb4d7f45d1cf-5f919836e4cmr7202023a12.4.1746218003663; Fri, 02 May 2025
 13:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <20250423-dt-memory-region-v2-v2-4-2fbd6ebd3c88@kernel.org> <938c4876-d284-4f11-a4ac-9f3831d3c14d@amd.com>
In-Reply-To: <938c4876-d284-4f11-a4ac-9f3831d3c14d@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 May 2025 15:33:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKhjE-67k2jN3x5qjRYbT4100fDCfkpt7TjESgOi_f8sA@mail.gmail.com>
X-Gm-Features: ATxdqUGr4Vb6qq9G8I43FJO0ja1hmdvZAb79PHSBzn0-jffEIRPNg2KLlUCVYFA
Message-ID: <CAL_JsqKhjE-67k2jN3x5qjRYbT4100fDCfkpt7TjESgOi_f8sA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: tanmay.shah@amd.com
Cc: Saravana Kannan <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
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

On Fri, May 2, 2025 at 10:40=E2=80=AFAM Tanmay Shah <tanmay.shah@amd.com> w=
rote:
>
>
> Hello Rob,
>
> Thanks for the patch. Please find my comments below.
>
>
> On 4/23/25 2:42 PM, Rob Herring (Arm) wrote:
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
> > v2:
> >   - Use strstarts instead of strcmp for resource names as they include
> >     the unit-address.
> >   - Drop the unit-address from resource name for imx and st drivers
> > ---
> >   drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++++------------
> >   drivers/remoteproc/imx_rproc.c            | 68 ++++++++++++----------=
--------
> >   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++-------
> >   drivers/remoteproc/qcom_q6v5_mss.c        | 60 +++++++++-------------=
-----
> >   drivers/remoteproc/qcom_q6v5_pas.c        | 69 +++++++++++-----------=
---------
> >   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++++------
> >   drivers/remoteproc/qcom_wcnss.c           | 23 ++++-------
> >   drivers/remoteproc/rcar_rproc.c           | 36 +++++++---------
> >   drivers/remoteproc/st_remoteproc.c        | 41 +++++++++---------
> >   drivers/remoteproc/stm32_rproc.c          | 44 +++++++++-----------
> >   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++--------
> >   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++--------
> >   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++--------
> >   drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 +++++++++-------------=
-
> >   14 files changed, 221 insertions(+), 349 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 90cb1fc13e71..fffae6ff4a5c 100644
>
> [ ... ]
>
> > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remotepr=
oc/xlnx_r5_remoteproc.c
> > index 5aeedeaf3c41..b73e97074c01 100644
> > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > @@ -460,49 +460,44 @@ static int add_mem_regions_carveout(struct rproc =
*rproc)
> >   {
> >       struct rproc_mem_entry *rproc_mem;
> >       struct zynqmp_r5_core *r5_core;
> > -     struct of_phandle_iterator it;
> > -     struct reserved_mem *rmem;
> >       int i =3D 0;
> >
> >       r5_core =3D rproc->priv;
> >
> >       /* Register associated reserved memory regions */
> > -     of_phandle_iterator_init(&it, r5_core->np, "memory-region", NULL,=
 0);
> > +     while (1) {
> > +             int err;
> > +             struct resource res;
> >
> > -     while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > -             rmem =3D of_reserved_mem_lookup(it.node);
> > -             if (!rmem) {
> > -                     of_node_put(it.node);
> > -                     dev_err(&rproc->dev, "unable to acquire memory-re=
gion\n");
> > -                     return -EINVAL;
> > -             }
> > +             err =3D of_reserved_mem_region_to_resource(r5_core->np, i=
++, &res);
>
> Here i++ is not needed as it's done at the end of the loop.
> This bug breaks RPMsg communication on zynqmp platform.

Thanks for debugging it. I'll fix that up.

Rob


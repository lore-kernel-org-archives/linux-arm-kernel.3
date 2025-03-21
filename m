Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E16DC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJDlraEhE9xzAygoQPYKvQcTnqS2Oc/oKlPKag9ajQQ=; b=PRyK2DU9MjtWbfEaIZE3bLdQWq
	jbQYR2fhVoWQv5V5ilvfFNf5yNRWUwHIj2qNmOCh3qQzvC9K8PJOcxIUwFJwmFYxHBTbLUmScU5Zd
	+mXzz4R0i4LJkR1BbZg7jK4UikNDUN+amtW9++OJBnZBO1uAFz3S/X+7npQIQ7UAmOb7xgoj+kSiF
	rrXLo0dbU90vLoxtN73Eyinauk44ApGTXmNIDccc5hBxfkwcMjyb/LAv3GS+tOsS2+Q8UBw/0kBiT
	3gnatTms4Jw/pZ+XQsLv0C+qZ0CQYoyu6I05u3uEhLPc3zCiwfWHhk4mUjXWb1Bd+1n5crWeZjQii
	efdYaosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcKc-0000000Eulc-0gS1;
	Fri, 21 Mar 2025 13:22:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcDD-0000000Et9O-2LlB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 954BAA4425A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 13:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6121DC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742562898;
	bh=yQTzME/6PP1TPK2T8WEG3txl4TCZUlsCKhod5W9SwfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F/KAHkSyYmfJOv/5FAv2z07LjM0mutjOxjLltd0/jQVYeEVaqUdPAPfK78OKA4Ymr
	 pLf6gi5C5bxtakc6rutk2Od5FrqPTJEH2Ptbrbcc/qlzcBLHmESzUohhrNhe3RY6a2
	 xLWK7adhpoEBLDSYMgFqdNPYgWaItn+OMTmFginUrrKOs5KFMaUpEF2El4ciFx+gsH
	 W6CXmYmNIQVZR3dpJx+5GmlFmpm5GruBqwCBFhhfn5R7A+amiVHIwcDhNHffwZqxmf
	 mnt67zM9LvEXc/PaTQTiHe3DXmMaMULycJPjbviQlLhRgu832JVpqWpyys8cpNviTM
	 dUalSjf/sSkxQ==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so3188169a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZ3qZQO8bZl7O9t6M1s9UhcoDlUqYlrwrbDEDR772qYt5xlpYw6BTlrCVKchJjpxG8OgPl0/ItrFfIX4IPqFem@lists.infradead.org
X-Gm-Message-State: AOJu0YwbEx9OMHL40KUqs/x4iBb5iKgcpJZxb82aFcgYpOx3XHF5swV8
	PzLN2VmZIEQyESXrDdKZedOw3T01Z3h0Q2/uD82Q2oapgN0wADDsOF2sCkUG8qU2W3GV6NitjQA
	22+3cctZ9PAFnNZ/P4gPIk80P9A==
X-Google-Smtp-Source: AGHT+IFKb3vaGpKb9OXSdeAes78/CEmG5k6oY1UfVro8GO1khGigitTlcZdAN7kLobo/GTF9XcNCydapHxU16QMQNfg=
X-Received: by 2002:a05:6402:440a:b0:5e5:437c:1daf with SMTP id
 4fb4d7f45d1cf-5ebcd468e6fmr2817130a12.16.1742562896829; Fri, 21 Mar 2025
 06:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com> <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
 <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com> <CAL_JsqJZkEpx26=ro_y8hHA2x1Zm6z_SFOQHjQ-WzUa-gy+s0w@mail.gmail.com>
 <4eddc37b-5164-453a-9b7f-c4331a7d6243@foss.st.com>
In-Reply-To: <4eddc37b-5164-453a-9b7f-c4331a7d6243@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 21 Mar 2025 08:14:44 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pNGObRJs9tFgHQbC8kCVm=myt+syQSLJVaO8D2GWHCQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoxWG99z-onx2wJCY2-zhJYXWv3cM0qorkPtzMXdYEUScnMR6DharJJMwg
Message-ID: <CAL_Jsq+pNGObRJs9tFgHQbC8kCVm=myt+syQSLJVaO8D2GWHCQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250321_061459_728240_92861573 
X-CRM114-Status: GOOD (  43.18  )
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

On Fri, Mar 21, 2025 at 3:25=E2=80=AFAM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 3/20/25 19:02, Rob Herring wrote:
> > On Thu, Mar 20, 2025 at 4:23=E2=80=AFAM Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com> wrote:
> >>
> >>
> >>
> >> On 3/20/25 00:04, Rob Herring wrote:
> >>> On Wed, Mar 19, 2025 at 10:26=E2=80=AFAM Arnaud POULIQUEN
> >>> <arnaud.pouliquen@foss.st.com> wrote:
> >>>>
> >>>> Hello Rob,
> >>>>
> >>>> On 3/18/25 00:24, Rob Herring (Arm) wrote:
> >>>>> Use the newly added of_reserved_mem_region_to_resource() and
> >>>>> of_reserved_mem_region_count() functions to handle "memory-region"
> >>>>> properties.
> >>>>>
> >>>>> The error handling is a bit different in some cases. Often
> >>>>> "memory-region" is optional, so failed lookup is not an error. But =
then
> >>>>> an error in of_reserved_mem_lookup() is treated as an error. Howeve=
r,
> >>>>> that distinction is not really important. Either the region is avai=
lable
> >>>>> and usable or it is not. So now, it is just
> >>>>> of_reserved_mem_region_to_resource() which is checked for an error.
> >>>>>
> >>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >>>>> ---
> >>>>> For v6.16
> >>>>>
> >>>
> >>> [...]
> >>>
> >>>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/=
stm32_rproc.c
> >>>>> index b02b36a3f515..9d2bd8904c49 100644
> >>>>> --- a/drivers/remoteproc/stm32_rproc.c
> >>>>> +++ b/drivers/remoteproc/stm32_rproc.c
> >>>>> @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *=
rproc)
> >>>>>  {
> >>>>>       struct device *dev =3D rproc->dev.parent;
> >>>>>       struct device_node *np =3D dev->of_node;
> >>>>> -     struct of_phandle_iterator it;
> >>>>>       struct rproc_mem_entry *mem;
> >>>>> -     struct reserved_mem *rmem;
> >>>>>       u64 da;
> >>>>> -     int index =3D 0;
> >>>>> +     int index =3D 0, mr =3D 0;
> >>>>>
> >>>>>       /* Register associated reserved memory regions */
> >>>>> -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> >>>>> -     while (of_phandle_iterator_next(&it) =3D=3D 0) {
> >>>>> -             rmem =3D of_reserved_mem_lookup(it.node);
> >>>>> -             if (!rmem) {
> >>>>> -                     of_node_put(it.node);
> >>>>> -                     dev_err(dev, "unable to acquire memory-region=
\n");
> >>>>> -                     return -EINVAL;
> >>>>> -             }
> >>>>> +     while (1) {
> >>>>> +             struct resource res;
> >>>>> +             int ret;
> >>>>> +
> >>>>> +             ret =3D of_reserved_mem_region_to_resource(np, mr++, =
&res);
> >>>>> +             if (ret)
> >>>>> +                     return 0;
> >>>>>
> >>>>> -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0)=
 {
> >>>>> -                     of_node_put(it.node);
> >>>>> -                     dev_err(dev, "memory region not valid %pa\n",
> >>>>> -                             &rmem->base);
> >>>>> +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) =
{
> >>>>> +                     dev_err(dev, "memory region not valid %pR\n",=
 &res);
> >>>>>                       return -EINVAL;
> >>>>>               }
> >>>>>
> >>>>>               /*  No need to map vdev buffer */
> >>>>> -             if (strcmp(it.node->name, "vdev0buffer")) {
> >>>>> +             if (strcmp(res.name, "vdev0buffer")) {
> >>>>
> >>>> I tested your patches
> >>>
> >>> Thank you.
> >>>
> >>>> The update introduces a regression here. The strcmp function never r=
eturns 0.
> >>>> Indeed, it.node->name stores the memory region label "vdev0buffer," =
while
> >>>> res.name stores the memory region name "vdev0buffer@10042000."
> >>>>
> >>>> Several remoteproc drivers may face the same issue as they embed sim=
ilar code.
> >>>
> >>> Indeed. I confused myself because node 'name' is without the
> >>> unit-address, but this is using the full name. I've replaced the
> >>> strcmp's with strstarts() to address this. I've updated my branch wit=
h
> >>> the changes.
> >>
> >> This is not enough as the remoteproc core function rproc_find_carveout=
_by_name()
> >> also compares the memory names. With the following additional fix, it =
is working
> >> on my STM32MP15-DK board.
> >>
> >> @@ -309,11 +309,11 @@ rproc_find_carveout_by_name(struct rproc *rproc,=
 const
> >> char *name, ...)
> >>         vsnprintf(_name, sizeof(_name), name, args);
> >>         va_end(args);
> >>
> >>         list_for_each_entry(carveout, &rproc->carveouts, node) {
> >>                 /* Compare carveout and requested names */
> >> -               if (!strcmp(carveout->name, _name)) {
> >> +               if (strstarts(carveout->name, _name)) {
> >>                         mem =3D carveout;
> >>                         break;
> >>                 }
> >>         }
> >>
> >> I just wonder if would not be more suitable to address this using the
> >> "memory-region-names" field.
> >
> > That would be better as you shouldn't really care what a provider node
> > name is where-as "memory-region-names" is meaningful to the driver.
> >
> >>
> >> The drawback is that we would break compatibility with legacy boards..=
.
> >
> > So not an option.
>
> >
> > I think I'll have to fix this within the reserved mem code storing the
> > name or do something like the diff below. I'd like to avoid the
> > former. Using the original device_node.name is also problematic
> > because I want to get rid of it. We redundantly store the node name
> > with and without the unit-address. There's a lot of places like this
> > one where we hand out the pointer with no lifetime.
> >
> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm3=
2_rproc.c
> > index 1e949694d365..cdee87c6ffe0 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -239,7 +239,7 @@ static int stm32_rproc_prepare(struct rproc *rproc)
> >                                                    resource_size(&res),=
 da,
> >                                                    stm32_rproc_mem_allo=
c,
> >                                                    stm32_rproc_mem_rele=
ase,
> > -                                                  res.name);
> > +                                                  "%.*s",
> > strchrnul(res.name, '@') - res.name, res.name);
> >
> >                         if (mem)
> >                                 rproc_coredump_add_segment(rproc, da,
> > @@ -249,7 +249,7 @@ static int stm32_rproc_prepare(struct rproc *rproc)
> >                         mem =3D rproc_of_resm_mem_entry_init(dev, index=
,
> >                                                            resource_siz=
e(&res),
> >                                                            res.start,
> > -                                                          res.name);
> > +                                                          "vdev0buffer=
");
> >                 }
> >
> >                 if (!mem) {
>
>
> That's work on my side.
> Could we have an OF helper to retrieve the name from the full name?

That would be: sprintf(buf, "%pOFn", node);

The problem here is we don't have the device_node pointer. The only
way I see to make the above prettier is perhaps a define.

Rob


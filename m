Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5713AD3F09A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=; b=wiCETUz1PPXMM5nx944+ZYWPDx
	hzfhXLHp/blRdq2ilcAnEtCsO4gzDd9rkitpi9rxjqiBJe+3K+xNfc3RRzEoDlczXpdQeIqqY10Zw
	EW2bXPeWzC99pRI7msSoRHDRja2SMDRzFfvvfAp5M2oYodaS6S2rGApWnowy11khpzwZTplnI8j0b
	lj1VrfJeBlJk7UKd9rBFvgwzKunzRxswadTRccgT9EgbjhaHYkPwu4P5TNjgPfXA9sSIYDUG0+BJa
	SemIsUnUEPp7fCHOiyigmkgzyl6zaECGUoa8sU38mhpxSssSfuS6IwUxmnLBACUk94E7y07UpAffc
	ddHxImvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9CF-0000000GSVW-1XDk;
	Wed, 28 Jan 2026 17:19:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9CC-0000000GSU5-3o8A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:19:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so146143a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 09:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769620750; cv=none;
        d=google.com; s=arc-20240605;
        b=Wz5wmdCDmFFleVv3x6O1gTuduhcZYjakClEp479u//ShHIgxob0xmEb7Z3eJ7mfz43
         aMYMqetg3swIs74m8BUyw2/e4NlWfcrspWp0mEK86MUMkrZqKYhXM4LOPHv6mkjy/LRB
         LgAC2DGD2U/+RE+oVPVINrHrbJHXRaQ5kR+00qThzUYMOyp/LZ1iU77YjtGJfBwpHTCC
         cGZ1Cj4k7/sqK8DJ5CGDyeEABrwNiNk5swxXvMTbKLfnC2guy4+4ShuHK1WC0u1q9jKg
         PZMR6n4m/5diwDkpSRms5cUDwK5gZKXgCoetBCM1z9yRiLLXiUFM2TA2YzQe5rycKcAg
         T98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        fh=oKD6xhk+tkorJpRQlypCFyQ7wT6qwUNRULdOvRk1e5g=;
        b=k+u4FsCt0oPtGoiLWJ5Wy+n3gs+lqzA6vMZTnqmNs7N4i0UZldVlraEe3LkltuwO+H
         RvaCZU3UgLHtVeKpKPon/Y8IzBl6N7BbUMXzv32/AZV0uc4Tg3pK+fKgaaiTMLJEuVju
         +vVuNWlCgTou9iGZZMq8mRpeuHGp+kmzT3eBN/emmODDkQ+kI+nnYMwfkTiLEMtKpV3Q
         J1TEHa0RuNc4b273zirCwmDGac2iSXtC/5dyC0CXYQ7teCnWycZaGzSqVz7n9QeIJUyG
         bEnNZq+0Vuc6MLQDzYeVjOEKoiRoE8EjnKKWIFbaU56YTQIeIxzLnYainuU25YgnW/8r
         UNEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769620750; x=1770225550; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        b=scEWGcdWTE8BvHtRQD7kfjovfUEVO5YyCtHIN/L26C5G/+CZ3HwA0CG0Y8WcmHvEF3
         pOjlffhAWHZrxsqSiZVwtc4RoqjQOY1PDpkATV/EL1OGWvklwNBUswaWpcQkFOWwMW2h
         xW3es6+VmwXAKa3NGdUlGK6rJ2JWRzQoMLdZ5jodIH1g+QtVkaUQWXRF3J92AUmIOoGf
         nnDcpvePptJF3V2wttdrudAL3CTg1Qiyl9H8mUvY5Hx98eaks/ALdBB9SqfeApOnZSJx
         BUMw68wDLfQDvxteNV+VB4V7upuBQDK1FWrgPVwR7KDLw00bgWsyyhIFQjFasaYNSgQP
         clRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620750; x=1770225550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        b=Si/2AhXTvAX4RXWAcWBMW5AEG6Wh2D15jT6rnJ6sWt1sfX9SyruWlIHnWqxTjWNI1C
         jXGlLbvyqL3zNydGqnwsXEQ2Z05kv8Y1XQ0d3ysdyS8/3mI0TZqdyup6tMpztUwcIIoe
         5RMHLIDTo3ExF+sG8Mvlx9UcEbgmFuemEafvYV4dVmcHngZdog54MH+r3SidK+p0r0/U
         ATjV5dRRIl5Dg4qizOerjVm1U/DTdzsRJDX0z50XuvQhu/26cIuYvA3NPI1tP3E4OJIA
         /HTGW1qmPux/tDrjGXmofPQkuBMGs4uunEosLjtszbVlPWVHxjMiUC69tf+dVKNmesRB
         Es8g==
X-Forwarded-Encrypted: i=1; AJvYcCXTj14sjlfYnQGsNS6FKN5o9SmB+JfElNjTEMCzb7lDZplRJCvVdZiIst7M/OPzfXMiBlKcNm56o5zUMGkWcFQL@lists.infradead.org
X-Gm-Message-State: AOJu0YyKhiXa5hVkVhC0dLOMx3dkCmoomYHhYoj6JUdsOVlEFh5CuSJx
	3Bmn1xqJWRcyAniUiWjZMdmy7t354dOWKO/bCzWX6pjPxQ+UVuS30S2KkFttVEHgcU3/2sLJ7b0
	P2GJSP1wEUz6bPy8YbCxJLvjoP1EY3+rBgY3PPgcUaQ==
X-Gm-Gg: AZuq6aKd8bIi7vgbYG5dPrB9LaqSqy8mknAIiqlc0pAMvc6SEQ/nEzE+4v7AL6LuYxT
	SCQSFPRoghvATgNdaWtogjd0YY+VeotIlo5pTIvh1htnCYyrX7ogHS+li1e1qgxrKH68mcd+JZN
	4/lB5zzPnSedcROfmo/nFE0hu1MWNnlJYzJPvpdo7IAmjQ2uYQUkrLhxqcJ7dsIfkMb3lzaGWBu
	mzrdFLAdHhlJQUtSesk1fTncdiBhIOSg9vQ5+7y1rSM3yFIHhr8ndipvGfZV0t+KFq9qjVSBcrq
	ycdGpIl+PhbkZHKI+6SZihgQ4nJ1QA==
X-Received: by 2002:a17:907:9620:b0:b6d:73f8:3168 with SMTP id
 a640c23a62f3a-b8dab15be8bmr411653466b.3.1769620750053; Wed, 28 Jan 2026
 09:19:10 -0800 (PST)
MIME-Version: 1.0
References: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
 <CANLsYkznMVh240wMUZGayJHRzsUV-NNTiU+ezpLt3rjcwSn5Wg@mail.gmail.com> <PAXPR04MB845923F8485ABF7DAEA390CB8891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845923F8485ABF7DAEA390CB8891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 28 Jan 2026 10:18:58 -0700
X-Gm-Features: AZwV_Qi18JCueG1u3J70NR_1Vvtj-phyG744RAEAtU4_AnPA_NPI-ZDjNCfkuhc
Message-ID: <CANLsYkyrz+A1iEabGZ6rFybFo4=mM+TPVDRSckFB2YUS_7aKow@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded resource
 table when none
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_091912_997777_88BD6B35 
X-CRM114-Status: GOOD (  41.55  )
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

On Tue, 27 Jan 2026 at 20:22, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded
> > resource table when none
> >
> > On Mon, 26 Jan 2026 at 23:51, Peng Fan (OSS)
> > <peng.fan@oss.nxp.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > priv->rsc_table is not NULL if the DT has a "rsc-table" entry,
> > > priv->indicating
> > > that _if_ there is a resource table in memory, that's where it should
> > be.
> > > Function imx_rproc_elf_find_loaded_rsc_table() is buggy so the
> > > narrative about a previously running FW with a valid resource table
> > can be dropped.
> > >
> >
> > (sigh)
> >
> > You apparently did not understand my last comment.
>
> Sorry about this. Does this looks good?
>
> Daniel, Iuliana, would you please help review?
>
> remoteproc: imx: Fix invalid loaded resource table detection
>
> imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> resource table even when the current firmware does not provide one.
>
> When the device tree contains a "rsc-table" entry, priv->rsc_table is
> non-NULL and denotes where a resource table would be located if one is
> present in memory. However, when the current firmware has no resource table,
> rproc->table_ptr is NULL. The function still returns priv->rsc_table, and the
> remoteproc core interprets this as a valid loaded resource table.
> .
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no resource table for the current firmware (i.e. when
> rproc->table_ptr is NULL). This aligns the function's semantics with the
> remoteproc core: a loaded resource table is only reported when a valid
> table_ptr exists.
>
> With this change, starting firmware without a resource table no longer
> triggers a crash.
>

Yes, this will be fine.

> Thanks,
> Peng.
>
> >
> > > In this case rproc->table_ptr is NULL because the current firmware
> > > does not contain a resource table, but the remoteproc core still
> > > interprets the non-NULL return value as a loaded resource table and
> > > attempts to memcpy() from rproc->cached_table, leading to a NULL
> > > pointer dereference and kernel panic.
> > >
> > > Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table()
> > > when there is no cached resource table for the current firmware. This
> > > ensures that a loaded resource table is only reported when a valid
> > > table_ptr exists, which matches the remoteproc core expectations.
> > >
> > > This issue can be reproduced by:
> > >   1) start a firmware with a resource table
> > >   2) stop the remote processor
> > >   3) start a firmware without a resource table
> > >
> >
> > Another sign you did not understand my last comment.
> >
> > I had hopes of merging this patch but the changelog is too garbled to
> > be salvageable.  I suggest you ask Daniel or Iuliana for help.
> >
> > > With this change, starting a firmware without a resource table no
> > > longer causes kernel dump.
> > >
> > > Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook
> > for
> > > find_loaded_rsc_table")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Per Mathieu, Check rproc->table_ptr, update commit log
> > > - Include R-b from Frank
> > > - Link to v1:
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > lore
> > > .kernel.org%2Fr%2F20260122-imx-rproc-fix-v1-1-
> > 36cc64369a40%40nxp.com&d
> > >
> > ata=05%7C02%7Cpeng.fan%40nxp.com%7C781fb4227e024211e71c08
> > de5dbb609e%7C
> > >
> > 686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639051256532
> > 530786%7CUnknow
> > >
> > n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> > MCIsIlAiOiJXaW
> > >
> > 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=0
> > 3sG8la72ysD
> > > ivP9SMmA9Ry2YaiMvCjsHWAWaGFOVQw%3D&reserved=0
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index
> > >
> > 375de79168a1c8d11b87ac1bd63774a3feac106d..f5f916d679051936
> > 0f446f063e09
> > > d018c5654953 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct
> > rproc
> > > *rproc, const struct firmware *  {
> > >         struct imx_rproc *priv = rproc->priv;
> > >
> > > +       /* No resource table in the firmware */
> > > +       if (!rproc->table_ptr)
> > > +               return NULL;
> > > +
> > >         if (priv->rsc_table)
> > >                 return (struct resource_table *)priv->rsc_table;
> > >
> > >
> > > ---
> > > base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> > > change-id: 20260122-imx-rproc-fix-e206f8e6e477
> > >
> > > Best regards,
> > > --
> > > Peng Fan <peng.fan@nxp.com>
> > >


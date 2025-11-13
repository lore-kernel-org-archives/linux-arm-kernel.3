Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8ADCD8C94
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=; b=N/zvRyj7rrnCGYbOZsHP1IImCR
	VzUrMcULgOsvvybi+NPlEC/cuoxBFUSnUHEWpmoVEmCmKwCUcCnnfOni107u+l+x4wJwYerMcX6cw
	iSPd575awgx4exN1Nd09imL4wMWIcgLx3wBWwk2L0ZEyamV09WUX9dJiYuh/6eWbCan513VY4qHrC
	ALJmcbQVLcDOMjf+dSv94hjuRhqjknyCmIh/8XObFqsuJO/RfRpHXdwHlC1ZetbCdp2zjKvkyqHgj
	XEElpO4hfkigeHz3bSeaX+l7g7PZ6F+wX9nxHvoXooblFEn2fxDGO0Zm29jwwZFMHAHQx1iAtBwn8
	eZixH1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZJM-0000000AjBn-04UG;
	Thu, 13 Nov 2025 15:32:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZJJ-0000000AjBN-0uQN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 15:32:34 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-298145fe27eso10676225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 07:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763047952; x=1763652752; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
        b=KMM1P7KP3NiWr5Y6cDKcVou+u+cQ5o9QxS4AatlHBRXuBFmtIQcTL2VhIxtFMpPIdT
         MWfPafbLR3wSZFIdwO3ZzxrmmT5sqaeTAd3OHfRKbVzNMWBjj4Lt/x5FyvSMG65gpkiM
         xps99LyWK1riaFp9pf9AHQ2wOyqCp59i3Uw3XiVAZtlFIO+jck40oQbKTsSAZKtsVua5
         cg7yOX0flelouNdd855ptvGNnOo0cT/eo8kWPFoxdSNIEjCwj4TJxGJO/LrayuOyiVvI
         18ovy10ucMFT2ODm+O3xcmzM3JtTvOG4BBYX8xn/qPZkn5ViD5ZFyTScbURZJ5OD7dhj
         PmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763047952; x=1763652752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
        b=mv45TmDKmf53e/sU3z8R5KP9uA2N7iaUv09dH3VssSto2ZVptZ2NQ8sOENEaYsA0UY
         iDlrtaD9g3g00MTE0vB3E+9iw/tzQiucvvLw/uEXmGURrJzcqaIFn2ByUeZ3dO5rX77o
         Vg+1k4AfhmLc+pAFMZIY9ZGGCnxe6QfmrzrtHUODI50AN+V9vdeNZUlx3BshgYUlbMCC
         tEPxZA5Q+hAQpTKzMhqO96U24QORV7tf/l8FVxoLbiRUPnuN+V3Vyo9JcP72SeaXXrov
         Eu1pKM1vM2zQ1PKAqGja0Uix9iqA7jxsXbgrgafTr6TaitYqYqUVctZHkEhCHziUU5dQ
         j4ug==
X-Forwarded-Encrypted: i=1; AJvYcCWj+rOra+NqbJv2cnBXIuMsvOrFyEKmwFv3Enxc73k3YPyvBLX0orXsd/PHv9nl9Ihasy0Elj0iyLCkTNQPElOi@lists.infradead.org
X-Gm-Message-State: AOJu0YwBKVqFJkVP3pBeIcuWP/+mEGgTM71k5jjrIv8EvfR2IHppO1ex
	a3+JhOeFCZoitnayYZkBCq8B03CZg8ftKj6aA0+hfvUsZRlmWFuyCVMIS+P5bpMHFPw=
X-Gm-Gg: ASbGncudAiouvbxYq2ubO8IS2Q6l4Ay22AWrNHPR02yh3oOANg/OPt6l62Nx4zL+7iF
	M76hY2+ezGe+SRgQ6S3IqDct16GHJHc2T03+zAFVhmVDa2SE1d6v2Wq2SK+lS1YlLeWk+4Z+25/
	b9R/1f8M83iXv+xjYTKR0/rGcLUJfhhX+dwZ7J5PB3IQKJ/hCBHYEDqQkYjP4B6eOL9xxhpp9nc
	usOxqaElH6jN9cqVAYDSGlMSTxhLmjZ51D0o1znVVJ6AUwv1yuWxPRe08+TUy9x6vNXHlsmCBfi
	o2OZ+bKPP3q+CIrrH64ZPHJALIivbsyGpH+lds0hH6oRqVURkat3ouQZTJrdbzoRfkLkKDepf8y
	u/BmnhjF215bUU7238WH9eb5BqkMwIgBli0Yem4hxSs/kOw0jXfqpFaAJ9vPPv1txMUSGBAVvhy
	PpblEiLjYr8+bt5OJFsdVdB2I=
X-Google-Smtp-Source: AGHT+IExGtwG81uwzj9JgnEK26nwTkuowQ0TGIoI/B/ng4jHpuOWuk3RVAjeNdIAjjrFddHoISsZ3w==
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id d9443c01a7336-2984eddf6a5mr85532495ad.43.1763047952195;
        Thu, 13 Nov 2025 07:32:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aee4:3fd6:a52:8e9a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed4fsm29590765ad.75.2025.11.13.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 07:32:31 -0800 (PST)
Date: Thu, 13 Nov 2025 08:32:28 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <aRX6DJoaP4MXG3fN@p14s>
References: <20251031175926.1465360-1-robh@kernel.org>
 <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org>
 <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
 <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_073233_278666_5A849A9C 
X-CRM114-Status: GOOD (  35.37  )
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

On Wed, Nov 12, 2025 at 10:59:42AM -0600, Rob Herring wrote:
> On Wed, Nov 12, 2025 at 9:43 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, 11 Nov 2025 at 12:59, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Nov 11, 2025 at 10:38:05AM -0700, Mathieu Poirier wrote:
> > > > Hi Rob,
> > > >
> > > > Please see may comment for st_remoteproc.c
> > > >
> > > > On Fri, Oct 31, 2025 at 12:59:22PM -0500, Rob Herring (Arm) wrote:
> > > > > Use the newly added of_reserved_mem_region_to_resource() and
> > > > > of_reserved_mem_region_count() functions to handle "memory-region"
> > > > > properties.
> 
> [...]
> 
> > > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > > > > index e6566a9839dc..043348366926 100644
> > > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > > @@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > > > >     struct device *dev = rproc->dev.parent;
> > > > >     struct device_node *np = dev->of_node;
> > > > >     struct rproc_mem_entry *mem;
> > > > > -   struct reserved_mem *rmem;
> > > > > -   struct of_phandle_iterator it;
> > > > > -   int index = 0;
> > > > > -
> > > > > -   of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > > > > -   while (of_phandle_iterator_next(&it) == 0) {
> > > > > -           rmem = of_reserved_mem_lookup(it.node);
> > > > > -           if (!rmem) {
> > > > > -                   of_node_put(it.node);
> > > > > -                   dev_err(dev, "unable to acquire memory-region\n");
> > > > > -                   return -EINVAL;
> > > > > -           }
> > > > > +   int index = 0, mr = 0;
> > > > > +
> > > > > +   while (1) {
> > > > > +           struct resource res;
> > > > > +           int ret;
> > > > > +
> > > > > +           ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> > > > > +           if (ret)
> > > > > +                   return 0;
> > > >
> > > > The original code calls rproc_elf_load_rsc_table() [1] after iterating through
> > > > the memory region, something that won't happen with the above.
> > >
> > > Indeed. it needs the following incremental change. It is slightly
> > > different in that rproc_elf_load_rsc_table() is not called if
> > > 'memory-region' is missing, but the binding says that's required.
> > >
> > > 8<--------------------------------------------------
> > >
> > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > > index 043348366926..cb09c244fdb5 100644
> > > --- a/drivers/remoteproc/st_remoteproc.c
> > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > @@ -120,15 +120,19 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > >         struct device *dev = rproc->dev.parent;
> > >         struct device_node *np = dev->of_node;
> > >         struct rproc_mem_entry *mem;
> > > -       int index = 0, mr = 0;
> > > +       int index = 0;
> > >
> > >         while (1) {
> > >                 struct resource res;
> > >                 int ret;
> > >
> > > -               ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> > > -               if (ret)
> > > -                       return 0;
> > > +               ret = of_reserved_mem_region_to_resource(np, index, &res);
> > > +               if (ret) {
> > > +                       if (index)
> > > +                               break;
> > > +                       else
> > > +                               return ret;
> > > +               }
> >
> > This looks brittle and I'm not sure it would work.
> >
> > Going back to the original implementation, the only time we want to
> > "break" is when @index is equal to the amount of memory regions _and_
> > ret is -EINVAL.  Any other condition should return.
> 
> @index equal to number of entries returns -ENODEV, so that condition
> is impossible. We can simply it to this:
> 
> if (ret == -ENODEV && index)
>     break;
> else
>     return ret;

To me this needs to be:

entries = of_reserved_mem_region_count(np); 

...
...

if (ret == -ENODEV && index == entries)
        break;
else
        return ret;

But taking a step back, it might even be easier to go from a while() to a for(),
the same way you did in imx_rproc_addr_init().

> 
> If you want to keep the prior behavior when 'memory-region' is
> missing, then '&& index' can be removed, but I think that was wrong
> behavior.
> 
> Rob


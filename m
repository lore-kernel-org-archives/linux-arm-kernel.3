Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B64C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53fsJdkIfxgZlnOW/zvzbnoGCJx/tK46AeJD3nm9ZF0=; b=eB9YwQHWukPElf36xseR7kJW65
	yWOYv4rag4Ny2WHdUFv0ROcZS9SubQOyvuj0og/e/c8D0Yclyo0+zBjzY0iP/rA/waCF6CAFCsJ+Q
	mUnzv9TRmczPTGH0zF/pGSAMOt8lf9iuojVAfElD/DF0XmkiNM40TWOYkZ7bb9jKlOQnT4DxCu8Qb
	rJJobOCIgs9VHx9Sibm7gUCZJ6em+R1i0N31ERyCke9MWTBvAKpDORHytm3SPtbCB9p94rJK/RcEA
	kzXsJz3DiMbv0VTP8+AbrN7K1/BsuK7LFbdRWpFnks15bvv1fHz1E9qaDsqAK2hrjgqb6NO4KAt+n
	WieBwHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9253-00000005mo5-1oRW;
	Tue, 22 Sep 2026 15:06:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9251-00000005mnr-3GPp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:06:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D789860052;
	Tue, 22 Sep 2026 15:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7999B1F000FF;
	Tue, 22 Sep 2026 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089606;
	bh=53fsJdkIfxgZlnOW/zvzbnoGCJx/tK46AeJD3nm9ZF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iOeOu3ITvHkaxWjsXya2tWPh/n7hEpsoWRHiZZGTNy+y0Z79VEqZLsDaHPcumOKPs
	 9dL721/bgFKtkqi98YaTLPEDK0qYAHf9pnKGesbOftSBpxLu6L9OwYZFhwqHMie/5c
	 sR3qmUaOkHKciHz9pLZCrI1CXLDp4H1DbjE1Zw/AWXFRcM8md8pQp8CQfttYxIxBCM
	 Tk9i7JNdcX4j90QJpMu0f8UxWWQhhgpcbcaPL9cKg0SKobmaigXu65Kg9W5gpUKkcR
	 dEWUUFkIsfzPvOWSxrdDsLc67K0n4xPpUTXp6H2aQe3TQmiJvZal+7UFwUMnjeaNm9
	 ilmlk+Y84eP/Q==
Date: Tue, 22 Sep 2026 16:06:42 +0100
From: Lee Jones <lee@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Ludovic Barre <ludovic.barre@stericsson.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Julien Delacou <julien.delacou@stericsson.com>,
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mfd: ab8500: fix child device leaks on probe failure
Message-ID: <20260922150642.GH3277918@google.com>
References: <20260921110909.370945-1-lgs201920130244@gmail.com>
 <20260922074137.GG2348773@google.com>
 <CANUHTR9B84LoCjOtS5N5qGO0KXSXUbZkrKZ3_GFTwXmVoPQ0SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANUHTR9B84LoCjOtS5N5qGO0KXSXUbZkrKZ3_GFTwXmVoPQ0SA@mail.gmail.com>
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

On Tue, 22 Sep 2026, Guangshuo Li wrote:

> Hi Lee,
> 
> Thanks.
> 
> On Tue, 22 Sept 2026 at 15:41, Lee Jones <lee@kernel.org> wrote:
> >
> > On Mon, 21 Sep 2026, Guangshuo Li wrote:
> >
> > > ab8500_probe() registers MFD child devices before completing the
> > > remaining device initialization.
> > >
> > > On AB8540, the main MFD device batch may be registered successfully
> > > before registration of the cut-specific batch fails. In that case,
> > > the probe returns without removing the child devices registered by
> > > the earlier mfd_add_devices() call.
> > >
> > > The same issue occurs when sysfs group creation fails after the MFD
> > > children have been registered. Since the probe returns an error, there
> > > is no later teardown path to unregister those devices.
> > >
> > > Call mfd_remove_devices() on these error paths so that MFD child
> > > devices successfully registered earlier in the probe are properly
> > > unregistered and released.
> > >
> > > The issue was identified by a static analysis tool I developed and
> > > confirmed by manual review.
> > >
> > > Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
> > > Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > ---
> > >  drivers/mfd/ab8500-core.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> > > index f0bc0b5a6f4a..e675223b6023 100644
> > > --- a/drivers/mfd/ab8500-core.c
> > > +++ b/drivers/mfd/ab8500-core.c
> > > @@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
> > >               ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
> > >                               ARRAY_SIZE(ab8500_devs), NULL,
> > >                               0, ab8500->domain);
> > > -     if (ret)
> > > +     if (ret) {
> > > +             mfd_remove_devices(ab8500->dev);
> >
> > What about switching to devm_*() a.k.a. managed resources?
> >
> > >               return ret;
> > > +     }
> > >
> > >       /* Add battery management devices */
> > >       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > > @@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
> > >               ret = sysfs_create_group(&ab8500->dev->kobj,
> > >                                        &ab8505_attr_group);
> > >
> > > -     if (ret)
> > > +     if (ret) {
> > >               dev_err(ab8500->dev, "error creating sysfs entries\n");
> > > +             mfd_remove_devices(ab8500->dev);
> > > +     }
> > >
> > >       return ret;
> > >  }
> > > --
> > > 2.43.0
> > >
> >
> > --
> > Lee Jones
> 
> Do you mean converting the MFD registrations in ab8500_probe() to
> devm_mfd_add_devices(), so the children are cleaned up automatically on
> probe failure, e.g.:
> 
> -       ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
> +       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
>                               ARRAY_SIZE(ab8540_devs), NULL,
>                               0, ab8500->domain);
> 
>         ...
> 
> -       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> +       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
>                               ARRAY_SIZE(ab8500_bm_devs), NULL,
>                               0, ab8500->domain);
> 
> and likewise for the other MFD batches?
> 
> If so, I'll rework the patch that way for v2.

Yes.

-- 
Lee Jones


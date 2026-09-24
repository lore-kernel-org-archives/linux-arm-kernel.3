Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC02EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=; b=jrr1n7BVTrIfxPQWznzXo7p83U
	wWRDptV9IBsG8iUfGExwkmSdA7L0r61Rm1NyUCpIQEir4akd9NDBpgexOl4EIrVFkEb0vp9+FnoMr
	s3rRBisHuwk/AtxqZSq4GJV6GFelCmfNhWFs49UTJTg+QHc2MTlveOvwa8YDjIyt76Ug9JBPJquo1
	dS6foVbefEb868WQXH+/qrLKgsagNn4/TWR+p+TseNralesUfk7sP2QcncxfZp6sEQQMF6jDNCF9e
	S3TE3t1bBulF7CowkBHKwJ7hpVEO6RYyhbMDv2MMCVPbc+BGjviCIap1tCYstpvhG9/3haO9Sk/x5
	fVilisIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kSm-0000000BGfH-3yeT;
	Thu, 24 Sep 2026 14:30:16 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kSk-0000000BGes-1XIT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:30:15 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 956f58d0204a3-672ce86b21aso2502551d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790260213; cv=none;
        d=google.com; s=arc-20260327;
        b=Yo7NDM8ogkjfnIFAvl7WZG0ZiTQf+WoPDw2nJGsR70jG5P+7eB9Cm5SGriuiUbSd5J
         xf2X2UFajN1FcbVRgu0Lz7MD/ISd6E9kvulpynmJCgUs3p4fcUjHj+AH6vu3WJqxRgoy
         ls8NZ0gsS8IuV+VrnLCuFLg+qA3bpXg9Xr+Noloe+vB01VFocOMJ3weGvMqIkVWo7pys
         TTBm7FAWUxu/1vLko0EvdAkjQC5sWM8fVPnubc/qMsgE4kFBKGjcr1RNYpCQqhKlVXpZ
         bM8FwiGJglC3TV+UXmfCwKq90XTAkrgVSzs4mzVLYcQdM5+PC+XVCl1HfYb3kYKIQb8B
         rEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        fh=BAa4kfGVgv5ochuFAxrazxgyboMmR+hwILsG58RiXdQ=;
        b=IItwYLMA7UYoXDrOSWhx0dpXEIriL9HFV6cMARa6TzlgGgM8JHtXIe054RkHPGqUoS
         mUtIqg9EuQ/4lJOdX+m3IcK6mflG83eD7/uk3R1PnqeMEWCeSLyqKrUEpN/VaNIVxufE
         UiHKaOKb70ebN8p1IkZEMaF5c7TSwFijR5uKlXSlvqgj8H7aWHhBJ25phY2D8qufBfxc
         O0RXrePQNq7B0ayN3yfx/ulXvteNVUgTOfGJmPruMJ3SwHgNDQ5+1NBv1c1d7HXgy2eR
         0w0N+g2OaOB2O9DNVQWPo0ZifxAozsYDPef7NjozVwkAH65SZDgm36ncrbPlygGHLd7O
         iVkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790260213; x=1790865013; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        b=AldVjXbT7LZAL2NRmWDv57uFCQ81TjZh4Cig9VTx6LP3hZQysR1DFmARzSaiBx7dzd
         wy/Dcps5GDV+OjBrPt4VKUCLeKEuueqPOizpojLRNSc/a7egbCvDS7cvaghnDx4IMTAS
         fZIuHhw4W2Pi+SuU5L6OHGtOs0c4JdXacyxGv9UB5P/Iq+Ayk5v30oJ/jMnozRK3L+g2
         5ZQRMFxD6qfmWsvbi/wanyaHgr+HZOWCmpBoqerAFsJwdgmOikk+Uho4QmmQ9feuCMyt
         eSPqGX4Vq+QJVvOJEGiuuRRLskoK1VVLEZ/n/CLjbo6wv/ukIFY3seMgBFF7Z56NqK5n
         DkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260213; x=1790865013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ReSij4eDlvfzvHmFOZbgb/VaJC2TPYANknXs7Tc10Y=;
        b=w94d7BxugViqfkNbbI/q+8XwSW4YaqBc/X4cjhdX+EalYzWTRrdutQnDWEudt2t0La
         KFdYj91r0NANDz9EIZWzI+c6h2p+dqPFjFlxuAgCMkSv7q/pf9ZGlQ5FZ37a2nP6O8q6
         uNDzW0f2Yv+GcmnmHcW8fksmFYkcSa1GKP/89ur5EFjOClZE7HG58uvoJQ6VCVmxzNlo
         JDevIlKW+TtiR8lAspWwJ31I+4Tba8hijCf81SbzBNgUxu59rJqudSxfKR+gYKxxce6Q
         HswouwbJeJQKjGkBQPcVtohcjSRkBfwv+HJZZ6EVFhrex6IEftozLl7CDzeytYJGNy78
         9Xbw==
X-Forwarded-Encrypted: i=1; AKwUvBxPXN6RuK398urqcuVpkAlZ2DSFBd2u1w9cnannGzY6wZZakfDmFH5j4p6BTYPEVsXjol4vR/Q5xGpdd0Vw4GUO@lists.infradead.org
X-Gm-Message-State: AFuF++n9PlV5qE8I567PepGESY0YKdLrFLVTaEF3SyCldaOQmCDFlSrg
	NLka2kT0+sJtQjZf6u4DYywLQDwnAMzf4Yrt2gdjWLGwY6eos+e2LCWLucGHeyJwT+En2ppBpQG
	V4cfHqtRFarzl+qM7GWd7Gk3vJOiUyyA=
X-Gm-Gg: AYBFou0LdpEbBo6dF0TRhUSVklymm5BVxEEsN0HZZSM5FUg95wf3kV36cq9+3qB2L1E
	RaDYk41cEgIHua5/0fnrQDC0INIZ7teaW37iGEaTf2rXOvL91Cpu+BQuk31WHmo418NT6OllxXQ
	kdqTwN6jrm40q3leSKln8BG4BnNaRBNyyQX1r3XBUK9NJhsQP37wMESOfIAN8zpZJEPobE7+zvB
	qL8NygoZiQMsjd5CF5HyXILJC8u7QN4QkVuY9nf9irGy73v3ZEq6RyeA2BNdkUyhHhwNWZtKH/L
	g14lG1Ur5Bnw2TZeWMNPR/dv8I51jkLTubHX5LmZ9KzYabA9q2T8aeOnOQuJcXpBRssC9g==
X-Received: by 2002:a05:690e:c45:b0:66f:d093:c206 with SMTP id
 956f58d0204a3-672ed204704mr1327519d50.17.1790260212896; Thu, 24 Sep 2026
 07:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260921110909.370945-1-lgs201920130244@gmail.com>
 <20260922074137.GG2348773@google.com> <CANUHTR9B84LoCjOtS5N5qGO0KXSXUbZkrKZ3_GFTwXmVoPQ0SA@mail.gmail.com>
 <20260922150642.GH3277918@google.com>
In-Reply-To: <20260922150642.GH3277918@google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 22:30:02 +0800
X-Gm-Features: AclHuK860EhogXR6CM7Mg1y8PIyfTwBtwpDGRzp_GvIpNMBtaMogNwOv8vHFZoQ
Message-ID: <CANUHTR-iuuGMTWT4_C5TMjtTBE4sYAWcD_N8Jwf8WnJs84b43g@mail.gmail.com>
Subject: Re: [PATCH] mfd: ab8500: fix child device leaks on probe failure
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, 
	Ludovic Barre <ludovic.barre@stericsson.com>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Julien Delacou <julien.delacou@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_073014_447186_2EE83CFD 
X-CRM114-Status: GOOD (  33.30  )
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

Thanks, Lee.

On Tue, 22 Sept 2026 at 23:06, Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 22 Sep 2026, Guangshuo Li wrote:
>
> > Hi Lee,
> >
> > Thanks.
> >
> > On Tue, 22 Sept 2026 at 15:41, Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Mon, 21 Sep 2026, Guangshuo Li wrote:
> > >
> > > > ab8500_probe() registers MFD child devices before completing the
> > > > remaining device initialization.
> > > >
> > > > On AB8540, the main MFD device batch may be registered successfully
> > > > before registration of the cut-specific batch fails. In that case,
> > > > the probe returns without removing the child devices registered by
> > > > the earlier mfd_add_devices() call.
> > > >
> > > > The same issue occurs when sysfs group creation fails after the MFD
> > > > children have been registered. Since the probe returns an error, there
> > > > is no later teardown path to unregister those devices.
> > > >
> > > > Call mfd_remove_devices() on these error paths so that MFD child
> > > > devices successfully registered earlier in the probe are properly
> > > > unregistered and released.
> > > >
> > > > The issue was identified by a static analysis tool I developed and
> > > > confirmed by manual review.
> > > >
> > > > Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
> > > > Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > > ---
> > > >  drivers/mfd/ab8500-core.c | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> > > > index f0bc0b5a6f4a..e675223b6023 100644
> > > > --- a/drivers/mfd/ab8500-core.c
> > > > +++ b/drivers/mfd/ab8500-core.c
> > > > @@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
> > > >               ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
> > > >                               ARRAY_SIZE(ab8500_devs), NULL,
> > > >                               0, ab8500->domain);
> > > > -     if (ret)
> > > > +     if (ret) {
> > > > +             mfd_remove_devices(ab8500->dev);
> > >
> > > What about switching to devm_*() a.k.a. managed resources?
> > >
> > > >               return ret;
> > > > +     }
> > > >
> > > >       /* Add battery management devices */
> > > >       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > > > @@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
> > > >               ret = sysfs_create_group(&ab8500->dev->kobj,
> > > >                                        &ab8505_attr_group);
> > > >
> > > > -     if (ret)
> > > > +     if (ret) {
> > > >               dev_err(ab8500->dev, "error creating sysfs entries\n");
> > > > +             mfd_remove_devices(ab8500->dev);
> > > > +     }
> > > >
> > > >       return ret;
> > > >  }
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > --
> > > Lee Jones
> >
> > Do you mean converting the MFD registrations in ab8500_probe() to
> > devm_mfd_add_devices(), so the children are cleaned up automatically on
> > probe failure, e.g.:
> >
> > -       ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
> > +       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
> >                               ARRAY_SIZE(ab8540_devs), NULL,
> >                               0, ab8500->domain);
> >
> >         ...
> >
> > -       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > +       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> >                               ARRAY_SIZE(ab8500_bm_devs), NULL,
> >                               0, ab8500->domain);
> >
> > and likewise for the other MFD batches?
> >
> > If so, I'll rework the patch that way for v2.
>
> Yes.
>
> --
> Lee Jones

I'll convert all the MFD registrations to devm_mfd_add_devices() and
send a v2.

Thanks,
Guangshuo


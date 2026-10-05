Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57370CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxQo0TrlOMq0lWMXbruwrg0I1eTUMnNipPm9JCY8MIk=; b=NI9dEIQ2Gx3ttnaKBuQAmpWVoU
	nKriWdSNopXTyVjg/zIy0lVRSB3OdDLgbdtBaKdcTaPkhU5Tr1oCTeQA/Xm12/QHgfCo11MG9PCWJ
	8UIn0wb2Lt6M83OvhLFISLYdQKm8jL1UIPFYaUnZDrpO8i4lQnENUfRg6y2YXO39hfZRBsm1kpdcJ
	IdWyI3N7t3BgmmG8Mwy5/toUv9fcO0RelxSUEbFMBsPDB/m2x8gpY8oRt5NBtIF1aDfG3itclnH8R
	HR4RdxqXN2jGXjkspLDPrKCHwR9CD4ViMgqp/Jv9o4gaNWDYyYcGkbc3WDdysmNAopbH7XGUKGliC
	Uyw8SNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdel-0000000FpNY-2Ih5;
	Mon, 05 Oct 2026 08:02:43 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdej-0000000FpN7-2Ba0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:02:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3a7bf792424so751100a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 01:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791187360; cv=none;
        d=google.com; s=arc-20260327;
        b=SzdUvrD0PgTotiY7ldE8NKEIlVylIW/SONxzmFv5AbWhQIIuDREPKBZ+IiOXcHbStb
         w/yBOwX2lcBiWr8/4V4ImFEtEmtVz7GVGldZzlq8i1DjyjPSZsuo9oFgZubLuKZb2NfR
         Gv7duZ1WmiIa25HnXvwgYMS0FYEHpHU0AIzTp2TPKmUW6sy+4cTsrND2DG3jL3l3V/kx
         AU9KIIj9Fe/ru07qLB9mcJRuZ/TOd8bnNjcrUdyMbEXUgst/qnYUAhWjAunfJqvMyvop
         fXTp/1xSg5ZfFxL/AFRlSc4NY6WJgfakITmrU1PYFqGsh1NMY3DSZgB7pOl12phzj8+d
         mdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sxQo0TrlOMq0lWMXbruwrg0I1eTUMnNipPm9JCY8MIk=;
        fh=OxgXBku9JsKXIfGUxrubhqBUYGAyvoX5S9NJM9Ks3K0=;
        b=a5NY74uUgNbtFmGyj8yoAWt39rKaPYE9V0A+/fJkdwXLHbHZgPiCSn3MOWRg8rmUUR
         Yrw+ijFyBkOWpiW7rALSbrI0jYUjNFuDOSj7fxM10BxaUquwQRTK3cwG7VtDHY5Zj9BL
         kvKGZz44WfxH0dE9ExuEI7Tq2K1n121xRt5TCEPJBjsaAPl8/2xXu1FzZ4l/hBMpxiU4
         YK6eHlMSbV2Y+oSwnBeKwuAkH2fFxDf0hZUO5J5RHJLwB+E5QnEwDOC7/hBVzenL/Msx
         Y7gIk1DrYdzlc0mi7kaMO+Z4IARusyoYG+WRxQi+K6V02jT5gR7WHiaJIL6u3SqXau6j
         eNxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791187360; x=1791792160; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxQo0TrlOMq0lWMXbruwrg0I1eTUMnNipPm9JCY8MIk=;
        b=qGzaH6sInjSMa0aTE698GypfveLEKgrpIhUwJ1Oxh+UAv+wOaG3YTCIWDNhbJOLUQ+
         aBLC3JqsvuqGGRwVQd19pyZ03vEwJBJAgFO7/OImVaXuP/mk7hKuIiCY8a1ebvuQn0dq
         GKcnZr+i/UfNuPj8Pq8ryUo7Wb10PMY8MTtARb3EpmbEncFkeZ+oFUctkf1H0ICfycBt
         ufuYwnH0fbfCgGwO5fz5Ai5q7faGaWCfdDBMncR/Emf1vPnoLwYwmhyrlKRg8ydUkLdB
         2XKBu2lpCH44+sNQDLVdZY2h4IIW91QfnUxMzdA5UuwV8Q9zFizphnued/52zFMU4GtI
         BE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187360; x=1791792160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sxQo0TrlOMq0lWMXbruwrg0I1eTUMnNipPm9JCY8MIk=;
        b=PssMEXKnSVFUh/qdNysTi8BSsX3ro/QFD8ZMIwSkVbezxYMkRyt5yGdNw8PLnqS1gc
         pytfWSzGXwEngDry/iBdQbN9Z9ZJOofsMPKhvPoP5AOhbcwHkRQivG6naLmCIDcwzEEt
         9USyMmhWOVo2d0P4AcdyEAwojWomv6LSDnPNlSSRADS/DgHuKRIJ33SF4DXgiD0hPGNj
         yFOYvYC09/desO9UZir59kcuG/CRiiIlXM2q3Nz9y7uoXWEnMVO9QVt4C9hFRXlSOaQn
         y0PPJFazDxlIfL+BMAn/xfCmIqjU36PJrLDbvnsO8CBLoGmI1+MJUyRzLa8utdSEDf5h
         obRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNegTVhyh+jqZoU3O3thGjs+ulLqWvDdvKMBJPGX5WpTwMiOTqlg/Ol5BEQcCpfuFHHhdZulveHEPBdyLxMcjU@lists.infradead.org
X-Gm-Message-State: AFq9FYIIRo+azyJNBSWCmPXamyuImcqROledtl+bYZCmi9wC8xB4mAkm
	cK0A8fy9bs5cNflK04bt5iNNVbw5tuUhJsOQJHxu29G8X2nUEcLBTtsIR6ffA3HITDzaEd5CdMj
	sg6xGOx36W2JxLal3htfnibJijyyHPk4SlKyT
X-Gm-Gg: AYBFou1JCO96a1trninmHMb60ytCM2XJhc0G+HhtAJD2O2Orm+yY4qx5QHuGvzARazt
	bUZwSePill2KVoYBUvaezgEI4/ylGHl57VAJ4eXg5V3BC2fk9K/skqYbna75kTy7mJZ+iZCbJws
	FPSZCODmLI7IMkDbb86vSLleYiqsGR3JXTj3fVc0+hwdhY613c0VtzN8+wJQ4Z8OwQbE+CgCi6b
	sjuDsViSVR4yZRAnaVGN5g17JqoYkgfSj/aXK7RBDY+58xNcMgDXJeBWe/Jnlh4VbjFNgcuYnFc
	p7/HrAPr5+/f/Mwl4m1dUJHqkr2Je9KuJSw/48jiMk4GWNtepLiyGE/NbuDz3nHcmlibSazPla7
	Uj3bSGk1UuIppkmGnzWTV80UgJ+Xt2t6qm2DGOdgydGRwnX36awiSidEm+qbdeImJaEE=
X-Received: by 2002:a17:90b:4d82:b0:3a7:f5a0:caec with SMTP id
 98e67ed59e1d1-3a7f5a0d163mr2413572a91.60.1791187360538; Mon, 05 Oct 2026
 01:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260811041934.7609-1-phucduc.bui@gmail.com> <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
 <asCyI2_CNSoDJy1w@willie-the-truck> <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
 <asISGdljsG86gUwb@willie-the-truck> <CAABR9nFMR+D0j5kYR+HwLBOHG4WF7PUDrqjE4Bt0-VTUacxmBg@mail.gmail.com>
 <asJlxV06xzDIgqW4@willie-the-truck>
In-Reply-To: <asJlxV06xzDIgqW4@willie-the-truck>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 15:02:29 +0700
X-Gm-Features: AclHuK_-IzVQxn_9iJFhUH3HgnqyIHn7q3tI6SFZm8WjyMttspFJ0qnFCtIhvys
Message-ID: <CAABR9nFz65Yt-SeHAx-Gxe18c4i3Sb3b_H-zsr7d+wwK5gB=CQ@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_010241_567013_6C7E34A2 
X-CRM114-Status: GOOD (  19.09  )
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

Hi Will,

> > > Sorry, but how is failing the probe possibly better than continuing without
> > > the optional interrupt? Add a diagnostic if you like, but aborting the probe
> > > feels completely unnecessary to me.
> > >
> >
> > My understanding is that the driver is designed to be generic and
> > support various hardware configurations, some with this resource (IRQ,
> > GPIO, clock, ...) and some without.
> >
> > If a configuration describes the resource, it means the board is
> > designed to use it. For that hardware the "optional" nature of the
> > driver no longer applies, so if we fail to get the resource the error
> > should be returned.
> >
> > A log alone is easy to miss, and the root cause still has to be found
> > and fixed later anyway. Failing the probe makes the problem visible
> > right away, when the board is being brought up.
>
> If you're doing bring-up, you should probably pay attention to the logs.

OK. Then we should probably write it as:
-------------------------------------------------------------------------
irq = platform_get_irq_optional(pdev, 0);
if (irq < 0 && irq != -ENXIO)
        return dev_err_probe(pdev, irq, "failed to get irq\n");
-------------------------------------------------------------------------

> If you're trying to use the device, you probably don't care about the
> interrupt.

If we're worried about returning an error here because it might cause
the device probe to fail, then shouldn't we hide errors from all
the other functions in probe() as well? :-)

Best regards,
Phuc


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5EB108B8E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3gudBldHiO9irSnVwm2j95EhgFlXZixCDHw3KgOJUQ=; b=UkrMLiNjeBAmOQl6EHJrNNRTAP
	BB190agJ/24Byt7ik4Gf66vUU2Iw5JuXguNUlqg4PRiRMub3JClU20yHMpi0EcPVAA5QZD1n+sFOH
	FR2LsNNGf7yO8dohvtYhcZM/uxKztTJXBaSutjK/pSHe1C8nMsz3ETIxGVWqjV0K/uqqS2CF8YuMd
	pbVnNR32emnisIA+2anWxQI+uGnKIz1E5rHpq6iiJ8IiB2qTcNfPags/V4kfq9zo/uOYLvJB1DB5t
	Wa4eKzxckFz+a5ie5dhzk+D+ir1qN00B+H7goupMR3G8uYYPT2F1M4sjRrBsB2VGrpGsUpnRNzdTt
	4xHcT52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wpw-0000000CYZl-1i7P;
	Fri, 20 Mar 2026 10:12:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wpu-0000000CYZd-2yh5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p3gudBldHiO9irSnVwm2j95EhgFlXZixCDHw3KgOJUQ=; b=L6RaCxQhIg6Syao9rri7O66MEP
	IH7T/u5/Q/1vnv8Alu6Xa/RAmlarGJTpUhcVQpOXo+4YTSt8fvDQGVT0ZLHCdWhEItbQfzhCTqkLC
	V5dK19uSypQPd0Y6+XhqWrrJ/pjsasKd4xv70Ge5a3fL+xAfOfOEpccPy8DEpFhu/d+xBIXBTjJeD
	RwUIyisQsuobZfuBgIPD0LCqQl2mk9OutThr+bmIca1qjRkJ2ts0j2K9urOhKihpSPsV1ge8UDY5a
	Ei1ybmTCYyQgNgNQygpd85o1Pn4FFxLF8r2ze6wBLBJ7Y8clSHSGfIg0FMO8h0DqLc0LzmYTvOJH5
	b3PyKOcQ==;
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wpr-0000000FIcr-2JkZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:12:09 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso2560375d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 03:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774001525; cv=none;
        d=google.com; s=arc-20240605;
        b=POqlUMk+75oGMjx8yfF46yVPlFenX/qVroFjYsY748ITVdEJ3YbXscgTMzO/j1QwRm
         scDkGSK1DlCqNC8QF4Le7WESCSzxIgLDdOciaiumUCqcNjnjNIDx1JFKS3QmrJA3Qcl3
         jmHT7YN9jTTqmtGY/4baYYAjVgi0qk59ka3hMlmcQsjvYVDWgMFHzgMEHLSvXw0HEanF
         K85rNnAERgCx2ZkKQrMhJilqvoifcf9kOviXv9m4gQ/F4GaaWwuYDhswkXWQzlDlzFg8
         BqdX1KHwEhBLGpfWKRuZ58+hol/waGsQfH4bsf+K5W7aZGfO/TFvAcKyziO6qWR0u+xO
         myZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p3gudBldHiO9irSnVwm2j95EhgFlXZixCDHw3KgOJUQ=;
        fh=5cg11eqc2d06diYLk/XqZzToo383QmsMIwrNJwN6lvQ=;
        b=eh7WWLH1dKXnKOMm3w+iT1ajP13sz5cqzmPk72kcmcvJII9FgkGXlhM10Mx5j80hmy
         YOqtMCQBNS+W7uD98+CuCTvBNjAXaFu88RVobX+DrX1oarMxfmi8yDCGwyUfjXLSdTsg
         in2sPAQOArBNo5u8l2wfoRROdgxOAEpHwBZz+XK9YjZKNM0K4lLsiwB0rZJrrymRbXZF
         QjdDXw2fSu03ot1uBESTXudIYAyGfgv22QT3BIQgHU7XN4ATvljb5vs+KTJI3TyJSXv8
         H50PT3wyqxo+zJ8oV/hj3VRMz1CjRshR5MCW1nFs+IKksXETXHjTfHc6EzF99qTthYz8
         xIwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774001525; x=1774606325; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p3gudBldHiO9irSnVwm2j95EhgFlXZixCDHw3KgOJUQ=;
        b=VaEoaIa9uIn9WAm6zNTd0YmTmwTB89T52j5HUCSbA1hXk5/2IgZHAZ+MwjO6piMcog
         FKYXv1LrSOw+B0PJkjVBSZSGZ65BvlxX9sAzBgOtNILkOXUyyJ/xqlPunniPU+Uy2bnA
         dqUL7mNTt6xhsh/OGAG5BxzKoTcKgUPljcxrFbILUM0CQEs/DAD/2qhQfG+s0hzAD3aC
         8ossOsyco60ZLfahd2A4gYprWapH45mOeOGqt32uWKQ0H0Su9ITfWGci5soUicEjAXvQ
         FtKE30PxIu/HXGZptd6PSPCom4POkZYGpkoKqedzlY3HXeqQ2yC6kAfVg88u8jD+YLB0
         uKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774001525; x=1774606325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3gudBldHiO9irSnVwm2j95EhgFlXZixCDHw3KgOJUQ=;
        b=cOgWBCp1Y+cHBcaYCwz1YdlHVI3yH5HF0Jv06N0SBhzsMIYYsTXaQMLqTsVZEaYiEu
         TrR4yrOB+omCA2JVaHzSOrH/c38+il+FgKHxrcnIu8RPmH+aAXAPvhVC10Q3ZDNAzWW6
         ycjZrLqbYvtq9hr3oRo4xwUi2FDfWDYNGmcHB9bCqNKNjy0D1UpiML0ZyDqK8zVGtPN2
         FHSm8UsyV/n2cHJ8G+XOoU7189jqO838GazdHwSimqn2eCzff5+cNf04sUe+SIeQxpjZ
         UECoPXeeRclGVw0Lz8J/lpjwKlpWSNqKWDAlNLsnu+0XOLAYiW/E/RodRSVRa/TULqf8
         WMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZvdKXxfKnChNWuMSOeE4Y8s/UFG9FCCLXZEDXUzcK7wmvDcPctVyh3oflNVxBmA6lWh3kDaXY/Awr5uhFqSzC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8lve7YoiM6G6wg6tghBEvwpCPVnPQUeqVd4MtFag9h8zCLrkp
	ndLbCk0hINTGFQKfzEEVZf9c6WBWQI7lkP0kzvvDWcUqYqJWxnzKoyVaS7obwguPgku+A9rSoRC
	tj6IHQlr+HGYZkT/JoCn7kuPBAi8G6kEbcxbtzR6dsQ==
X-Gm-Gg: ATEYQzwdaTkUyLs9yB9i3F6ogRVHbjW4AL1ZqXTTT4P3O3EPYHSTlkcjjQTQbP1TeYT
	RoDbdGOzrueEzDShPovsf/klZjqWOEKTOliK1nq7H8uTiyxxz/E5cNHeixu9nmnBX1Rcn53efdh
	cBptw6molg6NoMK1hQFZWvtkgd4D2W/R8D2ZLUkDzu0XvzT8wpSPUhsQ5uNjE7NAPVZ/sCCEzP3
	azapygfkM8GXlGFqoIc0WVn6wS5lprurfvQOtwx7mHQ7yAP/83uxGRCuADZITnMteZGb4CkUz0E
	DHp7OnvH0TAMiSa2Mo0=
X-Received: by 2002:a05:690e:144d:b0:64c:b242:496c with SMTP id
 956f58d0204a3-64eaa6988f1mr2475533d50.13.1774001524902; Fri, 20 Mar 2026
 03:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
 <20260303132305.438657-5-ulf.hansson@linaro.org> <CAMuHMdVZknduohmhed4dFBtXuSEowmfCJ=C8HeuCGXsCsvFyWQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVZknduohmhed4dFBtXuSEowmfCJ=C8HeuCGXsCsvFyWQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Mar 2026 11:11:27 +0100
X-Gm-Features: AaiRm52guPM-55vQzjTo7JwQb-uKMa_ExbmU7uDj3JnKhw50rAvhtqkz3duhqS4
Message-ID: <CAPDyKFqBj9qm3Q1zGAgCZhs8m_FG-rXrgO8tQPcSJ8jmaxnHKw@mail.gmail.com>
Subject: Re: [PATCH 4/9] pmdomain: core: Add initial fine grained sync_state support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_101207_730801_7DBEC890 
X-CRM114-Status: GOOD (  27.03  )
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

On Fri, 20 Mar 2026 at 10:29, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> Thanks for your patch!
>
> On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > A onecell (#power-domain-cells = <1 or 2>; in DT) power domain provider
> > typically provides multiple independent power domains, each with their own
> > corresponding consumers. In these cases we have to wait for all consumers
> > for all the provided power domains before the ->sync_state() callback gets
> > called for the supplier.
> >
> > In a first step to improve this, let's implement support for fine grained
> > sync_state support a per genpd basis by using the ->queue_sync_state()
>
> ... support on a ...
>
> > callback. To take step by step, let's initially limit the improvement to
> > the internal genpd provider driver and to its corresponding genpd devices
> > for onecell providers.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
>
> > +static void genpd_queue_sync_state(struct device *dev)
> > +{
> > +       struct device_node *np = dev->of_node;
> > +       struct device_link *link;
> > +
> > +       if (!genpd_should_wait_for_consumer(np))
> > +               return;
> > +
> > +       list_for_each_entry(link, &dev->links.consumers, s_node) {
> > +               struct device *consumer = link->consumer;
> > +
> > +               pr_info("%s:%s con=%s\n", __func__, dev_name(dev),
> > +                       dev_name(consumer));
>
> pr_debug? Or better, dev_dbg(), so you don't have to add dev_name(dev)
> explicitly.
>
> However, the printed provider name is again the name of the first
> domain.  This is incorrect for all but the first domain of a onecell
> genpd provider, and thus confusing.

I agree, I think we should drop the print. In fact, this is a
left-over from my debugging, I didn't intend for it to be part of the
submission.

Although, perhaps there is a need for pr_debug/dev_dbg somewhere, but
I think we can better add those in separate patches on top instead.

>
> > +
> > +               if (!device_link_test(link, DL_FLAG_MANAGED))
> > +                       continue;
> > +
> > +               if (link->status == DL_STATE_ACTIVE)
> > +                       continue;
> > +
> > +               if (!consumer->of_node)
> > +                       continue;
> > +
> > +               /*
> > +                * A consumer device has not been probed yet. Let's parse its
> > +                * device node for the power-domains property, to find out the
> > +                * genpds it may belong to and then prevent sync state for them.
> > +                */
> > +               genpd_parse_for_consumer(np, consumer->of_node);
> > +       }
> > +
> > +       _genpd_queue_sync_state(np);
> > +}
> > +
> >  static void genpd_sync_state(struct device *dev)
> >  {
> >         return of_genpd_sync_state(dev->of_node);
>

Thanks for reviewing!

Kind regards
Uffe


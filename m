Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F754C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwAlC5wT0bTBCsRyRSkhWOBavzqOW8OG3UQalrflpXA=; b=pUcpbZGicbknf828VaoPzDnAh6
	u+CaRZxYjoNv5FUgi8KLiQyu8cNzqFZQ3fNPmicREhOzsSOa7S9WlZU60chnqlB2aiYOJ2h0ipYNq
	amclu8nbNGqyIbBNh9FFgUoaI4xns8mBmK++jqLdgRvwleexaEL30TV6l0Yo28a/hDgy0ZkX3VlJ8
	VbnSUh8bI3vECZiwJX628pkAJAr2CrZ0vjVdPgMBTaePh2/ULWBLwpLsggjs/qP5zmj3+4Dj+zFqn
	dPV6lBrfquaU2rCBvV5pYyWI5UY4RdoL0fgv3CWJENFtIDFs4PXGi3KfV7j1I1JD98/QERTVoKU/u
	fsKXqTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyrG-00000006MdL-2dIv;
	Wed, 02 Apr 2025 14:14:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzypV-00000006MO6-2yIG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 14:12:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DC3F1007;
	Wed,  2 Apr 2025 07:12:36 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C61B23F63F;
	Wed,  2 Apr 2025 07:12:32 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:12:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yabin Cui <yabinc@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
Message-ID: <20250402141228.GL115840@e132581.arm.com>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
 <20250402133232.GJ115840@e132581.arm.com>
 <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_071233_815754_A1A28E3C 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Apr 02, 2025 at 02:50:22PM +0100, Mike Leach wrote:

[...]

> > > > @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> > > >                 /* Enable all helpers adjacent to the path first */
> > > >                 ret = coresight_enable_helpers(csdev, mode, path);
> > > >                 if (ret)
> > > > -                       goto err;
> > > > +                       goto err_helper;
> > > >                 /*
> > > >                  * ETF devices are tricky... They can be a link or a sink,
> > > >                  * depending on how they are configured.  If an ETF has been
> > > > @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> > > >                 switch (type) {
> > > >                 case CORESIGHT_DEV_TYPE_SINK:
> > > >                         ret = coresight_enable_sink(csdev, mode, sink_data);
> > > > -                       /*
> > > > -                        * Sink is the first component turned on. If we
> > > > -                        * failed to enable the sink, there are no components
> > > > -                        * that need disabling. Disabling the path here
> > > > -                        * would mean we could disrupt an existing session.
> > > > -                        */
> > > >                         if (ret)
> > > > -                               goto out;
> > > > +                               goto err;
> 
> Going to err here is wrong. The comment above specifically states that
> we do _not_ want to disable the path, yet the new code flow disables
> helpers.

Okay, now I understand here avoids to disable source and links for a
sink error.

> then falls through to coresight_disable_path_from() - which
> the original code avoided and which also disables helpers a second
> time.

Seems to me, the conclusion for "disables helpers a second time" is
incorrect.

I checked the coresight_disable_path_from() function, when the current
'nd' is passed to it, it will iterate from the _next_ node after 'nd'.

   /* Here 'nd' will be skipped and start from the next node */
   list_for_each_entry_continue(nd, &path->path_list, link) {
       ...

       coresight_disable_helpers(csdev, path);
   }

This means the _current_ coresight device (here is sink device) will
not disable its helpers.  Could you confirm for this?

Thanks,
Leo


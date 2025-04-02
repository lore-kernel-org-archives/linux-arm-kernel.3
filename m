Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163E7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laW6ODgLJCYrVjmYytHLwvjov94PnBnlPxBt9FJfrVM=; b=DsbSHi+SXjJi3XZ084IhY81YWl
	J9zsbhAvFLE5Mt0prjRvDHCyTm2IYvVL8xibjvZqCxqkeXBxJXdYhEsVszR51G2UZ7d0DnozcMMjs
	sGjZjk4XriHUhLLbDIA1uI/c2uNm3VyLj6Y5NbA/yj/zlMOGz/qywsGE5okDQhgxjdEV5VPsGprr2
	2KmBiD6gDqNodVFoMTla8N5DujJA+a4OYJtTTpzAhpsB3mgZjI0K0zEH/MLfW6qumLolK3W9AUFsi
	Muavw4aSl5ERfQ8YDLB3/vekGnVGgPBRvVmL/Bp2z4WLnHhn6zyNJuHSVkl7QmuXnf3Dm1onlECiv
	EgM4GKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00W6-00000006a0T-2U8G;
	Wed, 02 Apr 2025 16:00:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00UK-00000006Zow-0qGM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:58:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBB4E106F;
	Wed,  2 Apr 2025 08:58:49 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8759D3F63F;
	Wed,  2 Apr 2025 08:58:46 -0700 (PDT)
Date: Wed, 2 Apr 2025 16:58:41 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] coresight: tmc: Re-enable sink after buffer update
Message-ID: <20250402155841.GO115840@e132581.arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
 <20250401180708.385396-6-leo.yan@arm.com>
 <CAJ9a7VgTyKfebbYhEG5cGH4HyzU+4FavDXsAxGncXLsDtHSUHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgTyKfebbYhEG5cGH4HyzU+4FavDXsAxGncXLsDtHSUHA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_085848_281057_528135B6 
X-CRM114-Status: GOOD (  20.13  )
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

Hi Mike,

On Wed, Apr 02, 2025 at 04:05:10PM +0100, Mike Leach wrote:

[...]

> > @@ -482,6 +482,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> >         unsigned long offset, to_read = 0, flags;
> >         struct cs_buffers *buf = sink_config;
> >         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > +       struct perf_event *event = handle->event;
> >
> >         if (!buf)
> >                 return 0;
> > @@ -586,6 +587,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> >          * is expected by the perf ring buffer.
> >          */
> >         CS_LOCK(drvdata->base);
> > +
> > +       /*
> > +        * If the event is active, it is triggered during an AUX pause.
> > +        * Re-enable the sink so that it is ready when AUX resume is invoked.
> > +        */
> > +       if (!event->hw.state)
> > +               __tmc_etb_enable_hw(drvdata);
> > +
> 
> Think that the  refcnt should be checked here too.

No, ETF driver uses spinlock to guard the entire region for checking
refcnt and updating buffer, here it is still in the same critical
region.  This is why the checking refcnt is not needed.

> Does the  ETB case need to be handled? - somewhat confusingly the
> coresight-tmc-etf.c file handles both ETF and ETB.

ETF is for the link mode, and ETB is for sink.  Updating buffer is only
for sink mode, this is why here I use __tmc_etb_enable_hw().  Does it
make sense?

I also have a question for the paired operations (this is applied for
both ETF and ETR drivers).

Now the flow is:

  tmc_update_etf_buffer()  {

    tmc_flush_and_stop();

    update buffer;

    __tmc_etb_enable_hw();
  }

The operations are not paired between tmc_flush_and_stop() and
__tmc_etb_enable_hw().

The tmc_flush_and_stop() function only controls the TMC_FFCR register.
I'm not sure whether I need to extract the TMC_FFCR operations from
__tmc_etb_enable_hw() to use them for recovery in the update buffer.
Or do you think re-enabling the hardware in this patch is the safer
approach?

Thanks,
Leo


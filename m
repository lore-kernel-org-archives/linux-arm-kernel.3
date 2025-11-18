Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FAECED24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m7uhfNQELQI3K/llupPvt/jSbTV7qI7cE58XdEsmJI=; b=DrpB6wkDU72NgB2RkWm68fhnc3
	iQ1O5IOF2BTBXJJsCLdesKPL4da2F052fz6xtFazPxTP6pScU9DyWcApHx3pMhpTsBE0qr5sYs1ZE
	/Iq1Y6H7kO6cxjjsmr2x05cv135KlgrWE+K3ynRampiQhhWZ1QkaCTd5ns/K984gCAfcyn68sJ+qZ
	mviKttMnCSZdCvbnvxuIboVu9ve5rdgV67z9RboALHtxmnOZYIqbRAq1HixOkmYaNCjJYMd6tnJpi
	AoJ2q+wCpcn6ZTEIHUQx1j6WdFAD1NtVi3YC9Sk7LoqSbYiUxDfJnw3HZW12xV/p8B6N+XY7E3pe3
	vaI0PEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHxX-000000009hK-2a87;
	Tue, 18 Nov 2025 09:25:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHxU-000000009gG-2e2T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 09:25:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A31AFEC;
	Tue, 18 Nov 2025 01:24:58 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A396B3F66E;
	Tue, 18 Nov 2025 01:25:05 -0800 (PST)
Date: Tue, 18 Nov 2025 09:25:03 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: Re: [PATCH v4 10/15] coresight: Add 'in_idle' argument to
 enable/disable path functions
Message-ID: <20251118092503.GA8204@e132581.arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-10-3d4bba674709@arm.com>
 <2ed517c5-b434-4a51-9843-dd7ab6229bec@linaro.org>
 <1599cba5-aa4a-4991-8865-258830ef248f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1599cba5-aa4a-4991-8865-258830ef248f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_012508_790797_8D8C2E40 
X-CRM114-Status: GOOD (  22.65  )
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

On Mon, Nov 10, 2025 at 11:48:45AM +0000, James Clark wrote:

[...]

> > >   static void coresight_disable_path_from(struct coresight_path *path,
> > > -                    struct coresight_node *nd)
> > > +                    struct coresight_node *nd,
> > > +                    bool in_idle)
> > >   {
> > >       u32 type;
> > >       struct coresight_device *csdev, *parent, *child;
> > > @@ -498,6 +499,10 @@ static void coresight_disable_path_from(struct
> > > coresight_path *path,
> > >                           CORESIGHT_DEV_TYPE_SINK :
> > >                           CORESIGHT_DEV_TYPE_LINK;
> > > +        /* To reduce latency, CPU idle does not touch the sink */
> > > +        if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> > > +            continue;
> > > +
> > >           switch (type) {
> > >           case CORESIGHT_DEV_TYPE_SINK:
> > >               coresight_disable_sink(csdev);
> > > @@ -527,7 +532,7 @@ static void coresight_disable_path_from(struct
> > > coresight_path *path,
> > >   void coresight_disable_path(struct coresight_path *path)
> > >   {
> > > -    coresight_disable_path_from(path, NULL);
> > > +    coresight_disable_path_from(path, NULL, false);
> > 
> > Something like a 'reason' enum would be more readable than a boolean. We
> > might have more than two options in the future anyway.

I will add a "path->in_idle" flag instead.

> > >   }
> > >   EXPORT_SYMBOL_GPL(coresight_disable_path);
> > > @@ -550,8 +555,9 @@ static int coresight_enable_helpers(struct
> > > coresight_device *csdev,
> > >       return 0;
> > >   }
> > > -int coresight_enable_path(struct coresight_path *path, enum cs_mode
> > > mode,
> > > -              void *sink_data)
> > > +static int coresight_enable_path_internal(struct coresight_path *path,
> > > +                      enum cs_mode mode, void *sink_data,
> > > +                      bool in_idle)
> > >   {
> > >       int ret = 0;
> > >       u32 type;
> > > @@ -564,10 +570,6 @@ int coresight_enable_path(struct coresight_path
> > > *path, enum cs_mode mode,
> > >           csdev = nd->csdev;
> > >           type = csdev->type;
> > > -        /* Enable all helpers adjacent to the path first */
> > > -        ret = coresight_enable_helpers(csdev, mode, path);
> > > -        if (ret)
> > > -            goto err_disable_path;
> > >           /*
> > >            * ETF devices are tricky... They can be a link or a sink,
> > >            * depending on how they are configured.  If an ETF has been
> > > @@ -579,6 +581,15 @@ int coresight_enable_path(struct coresight_path
> > > *path, enum cs_mode mode,
> > >                           CORESIGHT_DEV_TYPE_SINK :
> > >                           CORESIGHT_DEV_TYPE_LINK;
> > > +        /* To reduce latency, CPU idle does not touch the sink */
> > > +        if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> > > +            continue;
> > 
> > I can imagine that not being wanted for all sink types in the future, so
> > we could let the sink decide this. But it's probably fine to leave in
> > the core for now and it would be easy to change later.
> 
> I got to patch 12 and it adds a special condition in the core to do
> something different for TRBE. We already have pm_is_needed() so shouldn't
> the sinks be deciding this for themselves?

pm_is_needed() is related to pm_save_disable()/pm_restore_enable()
pairs. OTOH, coresight_enable_path() invokes enable()/disable()
callbacks.  I don't want to mix up two different things.

But I will check if can use pm_is_needed() for sink device in
cpu_pm_save()/cpu_pm_restore().

Thanks,
Leo


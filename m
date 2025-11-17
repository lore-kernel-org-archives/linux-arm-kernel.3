Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01058CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmdl4wmJd9qJx7w17teTl7lqh93uQB4rRKCniECnn5w=; b=PmATGJq+LlpfgbnV/f5HQOSPzR
	NKUuFxTBI31WHrhn6QDqvUhVmOAOPKwEdK5BqdAZvt/DFD9PxWzX1749UcyuJ6t4oYT9bp5LfCCJN
	hf8VvJZsahCeZR1U72Pwfz+Eaa0AxHjldvlPTqjSVtddw+TdWarrMlzVNSu9NtSRvxk+PlJhRY+Ke
	i0xS7l4iqmI40VhjB0LApQIdAM/Y7XJE3oF40G2PFF08rJPJHLKqPlgHcZk1152v6/9UNg4pDt95E
	S2f/XBJQoWl8hUcaRC/TgUbz6kTuBMoz2Jg2OA7BePOOhGaP8Eg/S1qZ3rj1CASZqM6XtHt7ADsF3
	E/fGd1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL04y-0000000GFNy-36Bb;
	Mon, 17 Nov 2025 14:19:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL04w-0000000GFNY-0HYS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:19:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC6E8FEC;
	Mon, 17 Nov 2025 06:19:27 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E85CA3F740;
	Mon, 17 Nov 2025 06:19:34 -0800 (PST)
Date: Mon, 17 Nov 2025 14:19:32 +0000
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
Subject: Re: [PATCH v4 09/15] coresight: Save activated path into source
 device
Message-ID: <20251117141932.GO3568724@e132581.arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-9-3d4bba674709@arm.com>
 <7bc3f703-aeca-4e51-a171-c8870f1a14dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bc3f703-aeca-4e51-a171-c8870f1a14dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_061938_148576_C00B9DB0 
X-CRM114-Status: GOOD (  20.93  )
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

On Mon, Nov 10, 2025 at 11:18:02AM +0000, James Clark wrote:

[...]

> > @@ -399,13 +399,50 @@ int coresight_enable_source(struct coresight_device *csdev,
> >   			    struct perf_event *event, enum cs_mode mode,
> >   			    struct coresight_path *path)
> >   {
> > -	return source_ops(csdev)->enable(csdev, event, mode, path);
> > +	int ret;
> > +
> > +	/*
> > +	 * Record the path in the source device. The path pointer is first
> > +	 * assigned, followed by transitioning from DISABLED mode to an enabled
> > +	 * state on the target CPU. Conversely, during the disable flow, the
> > +	 * device mode is set to DISABLED before the path pointer is cleared.
> > +	 *
> > +	 * This ordering ensures the path pointer to be safely access under the
> > +	 * following race condition:
> > +	 *
> > +	 *  CPU(a)                          CPU(b)
> > +	 *
> > +	 *  coresight_enable_source()
> > +	 *    STORE source->path;
> > +	 *    smp_mb();
> > +	 *    source_ops(csdev)->enable();
> > +	 *                              `-> etm4_enable_sysfs_smp_call()
> > +	 *                                    STORE source->mode;
> > +	 *
> > +	 * This sequence ensures that accessing the path pointer is safe when
> > +	 * the device is in enabled mode.
> 
> Doesn't that only work if you meticulously use READ_ONCE() for accessing
> path on the read side? Which doesn't look like it has been done.

As Suzuki suggested, I will move the path setting onto the target CPU
(along with the mode setting).  Since the coresight mode functions
already have applied memory barriers, we might can ensure the data
sequence between mode and path if all run on the target CPU, no need to
introduce new barriers.

> I'm not sure why path is special though, there are plenty of variables in
> csdev that are accessed while the device is active. Shouldn't path be
> covered by the existing locks in the same way? It would be much safer and
> easier to understand if it was.

Unlike other fields in csdev, path can be retrieved on SMP cores, and
we don't want to introduce race condition between low level's CPU idle
and high level's sysfs knobs, we don't use spinlock to protect it.

We relies on state machine (device's mode) for safely access the path
pointer.

Thanks,
Leo


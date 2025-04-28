Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F86CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPpSb+6YUD4YNib7RjiFU5exZbPpx0220t3iaceSAck=; b=jW5GkqJfpD0vjqoBGeBJagBZ09
	ljeAcFzuMqTUld/0I2nbcv5CPgcqtSiST7ZV7H0p6jldEYe0/fhLpGMKUknnGm3A+RfDGBOirmHeC
	+JphwqmEeyacC9aO0673xiZBuMAY/Y/3fv9jepOmqf3W9LkXuF/i+xhZjsUlME6glM5j2iR6aublE
	OeClI6QXDyKa//AG0PuV5L4DjnD6MJWEON7ZoegrJOXqT8EbLzRyXOuG1gr8pQH2Yl+Sk0bl3/L06
	vJ1tyQFiCGY6QrVfCFtL7lTekK05w4oeXM4pP0l4rA4PlAWdcDMI3yWrQqA+5LuqeqapUFCt1a68X
	3Vp33Z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OhN-00000006Vrm-35L3;
	Mon, 28 Apr 2025 13:39:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NWv-00000006Ady-3BIN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:24:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 769EC1516;
	Mon, 28 Apr 2025 05:24:06 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85DFA3F66E;
	Mon, 28 Apr 2025 05:24:12 -0700 (PDT)
Date: Mon, 28 Apr 2025 13:24:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yabin Cui <yabinc@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power
 state
Message-ID: <20250428122408.GD551819@e132581.arm.com>
References: <20250423230046.1134389-1-yabinc@google.com>
 <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
 <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_052413_890957_F77B135F 
X-CRM114-Status: GOOD (  27.34  )
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

Hi all,

On Mon, Apr 28, 2025 at 11:53:26AM +0100, Mike Leach wrote:

[...]

> > > > @@ -362,6 +362,10 @@ enum cs_mode {
> > > >   * @alloc_buffer:    initialises perf's ring buffer for trace collection.
> > > >   * @free_buffer:     release memory allocated in @get_config.
> > > >   * @update_buffer:   update buffer pointers after a trace session.
> > > > + * @percpu_save:     saves state when CPU enters idle state.
> > > > + *                   Only set for percpu sink.
> > > > + * @percpu_restore:  restores state when CPU exits idle state.
> > > > + *                   only set for percpu sink.
> > > >   */
> > > >  struct coresight_ops_sink {
> > > >       int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> > > > @@ -374,6 +378,8 @@ struct coresight_ops_sink {
> > > >       unsigned long (*update_buffer)(struct coresight_device *csdev,
> > > >                             struct perf_output_handle *handle,
> > > >                             void *sink_config);
> > > > +     void (*percpu_save)(struct coresight_device *csdev);
> > > > +     void (*percpu_restore)(struct coresight_device *csdev);
> > >
> > > Again - why this percpu_* prefix ?
> > >
> > > >  };
> > > >
> > > >  /**
> 
> I do not think this is the best approach.
> 
> The TRBE driver has its own power management registration functions,
> so is it not possible for the save and restore should be handled
> there, through a PM notifier, just as the ETM/ETE is?
> 
> Drop the unnecessary DT entry - TRBE is a per cpu architectural device
> - if a TRBE is present, we know it will power down with the PE.
> 
> The CoreSight architecture permits an ETE to drive trace to an
> external sink - so the TRBE might be present but unused, therefore
> hooking into a source driver that may not be driving trace into the
> device does not seem wise..

Sorry I jumped in a bit late (I saw the patch at last week and it is
on my review list).

I would suggest to hold on for this patch.  I am refactoring CPU PM and
hotplug in CoreSight based on the CoreSight path.

The idea is when we do CPU power management for CoreSight devices, we
cannot simply control individual devices.  Alternatively, we need to
control logics based on the linkages on CoreSight path as it can reflect
dependencies crossing the components.  For example, for a CoreSight
path, when running into CPU low power state, we need firstly disable
tracer, then links, and at the end sinks.  When CPU resumes back, we
need to use the reversed ordering for turning on devices.

As a result, except the tracers (ETM / ETE) should be saved and
restored contexts during CPU power states, other components on the
path will be controlled by traversing CoreSight paths.  The benefit is
if a component (e.g., a link or a sink module) is shared by multiple
CoreSight paths, then the component can be disabled or enabled based on
reference counter.

I know I am a bit lagged - as I also need to support the locking on
CoreSight paths.  Please expect in next 1~2 weeks I will send out
patches for public review.

> The TRBE PM can follow the model of the ETE / ETMv4 and save and
> restore if currently in use.

If TRBE PM is registered as a seperate PM notifier, a prominent issue is
it cannot promise the depedency between ETE and TRBE when execute CPU
power management.  E.g., when entering CPU idle states, ETE should be
disabled prior to switch off TRBE, otherwise, it might cause lockup
issue in hardware.  If ETE and TRBE register PM notifier separately,
we cannot ensure the sequence between ETE and TRBE, this is why we need
to do the operations based on CoreSight paths.

Thanks,
Leo


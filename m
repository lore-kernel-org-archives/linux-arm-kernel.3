Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45CCC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbA3fqdyYqx3+BHxrbfsEgpUodXHYmdKvkFVVVRQdTE=; b=EIEv7v/k2vZMrb9MJiOjFOZTQR
	z6BHY9dkqyMUj3Am9oSkEgSwkXGH4boleDqYg6fw+R6X9V8umX4KV/8XtoIxnLTPC3dm8N80/ZmTn
	mD+ptpSA+lfIz+wRd+cM3G+J7mcWU+UgYYVdLOWjBkzn+V76swIQnBKFjiUkB1rkFnvjUgWyni2sC
	ehArysFMGWppmQBm4zgfaChJv4SnT5pJW5LY6HF8NKYuC5ze1Ioryrqpxoz2RTOphYyusfUqTyGqt
	YmiO1V8tLToLtFDXhn+HKwu1iyOOd2wBcoGvcesXPhCsWQYeyHA9w47+t0LKXuiJjth5VaTvLkhJW
	0DOXgEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklAa-00000002i8F-1YcV;
	Fri, 17 Jul 2026 16:12:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklAW-00000002i7U-3brO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 16:12:10 +0000
Date: Fri, 17 Jul 2026 18:12:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784304723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MbA3fqdyYqx3+BHxrbfsEgpUodXHYmdKvkFVVVRQdTE=;
	b=3BGz0ObvZjFzKUZN9C/usZLCuvM7dtgyVvLpUB/4ej2WT/Zeork/TQ/Z8K8hrvEiH88APQ
	+FOUcRwAkn9mvCaxF+MkRoUrmLoGyVGbKby4W1bLDnrnxaKxzRM++sJiVLSaRnU8phg5uR
	Pt6fvPksHmc6VT+A3vwlv0mgoabF+0Oxygp9Jx0QdyEF8704HtePC3L+DogE1V9zYX1T80
	zg2TXLYS+Mf4iJVXDG7XKFYsPsdDw2GNwS+whDVEA+csj7EtJlMalVZdZ9udcH7Ss/JUuX
	/6jjeZ6dVI3mSTYj+EHl3pSD/gPe/X2QMlz4iCSU7GZA2bUv+sfAH5ylUau/Mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784304723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MbA3fqdyYqx3+BHxrbfsEgpUodXHYmdKvkFVVVRQdTE=;
	b=ilOmU0raIeFSzZbr2NrW1NCOoFJ5OkWZpATf10Tuj9Gpj2HtcIM52SKITn1C8X3E4SrHJh
	BaEox2Rr7sEMy3Dw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Leo Yan <leo.yan@arm.com>
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <coresight@lists.linaro.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v3] coresight: Fix scheduling while atomic in
 coresight_cpu_pm_notify()
Message-ID: <20260717161201.3jkO5o71@linutronix.de>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
 <20260717155848.GB3998092@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717155848.GB3998092@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091209_071250_F126A113 
X-CRM114-Status: GOOD (  24.93  )
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

On 2026-07-17 16:58:48 [+0100], Leo Yan wrote:
> >  static struct coresight_path *coresight_cpu_get_active_path(enum cs_mode mode)
> >  {
> >  	struct coresight_device *source;
> > -	bool is_active = false;
> > +	struct coresight_path *path = NULL;
> >  
> > -	source = coresight_get_percpu_source_ref(smp_processor_id());
> > -	if (!source)
> > -		return NULL;
> > -
> > -	if (coresight_get_mode(source) & mode)
> > -		is_active = true;
> > +	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
> >  
> > -	coresight_put_percpu_source_ref(source);
> > +	source = per_cpu(csdev_source, smp_processor_id());
> > +	if (source && (coresight_get_mode(source) & mode))
> > +		path = source->path;
> 
> I agree the get_device()/put_device() pair in
> coresight_cpu_get_active_path() is not a good fit for CPU PM notifier,
> because the put_device() can become the final put while IRQ is disabled.
> 
> However, my understanding is this patch might cause UAF issue that the
> existing code is intended to prevent.
> 
> The raw spinlock (coresight_dev_lock) serializes access to the per-CPU
> csdev_source pointer. It does not guarantee the lifetime of the source
> or its _parent_ device. coresight_unregister() is not only reached from
> module unload; it can also be called when a driver is unbind, for
> example DT overlay removal or device hotplug/unplug.

But doesn't coresight_unregister() block on the coresight_dev_lock here?

> This is why the UAF issue Sashiko mentioned in patch 03 of [1]. A built
> CoreSight path currently grabs references for the path components, which
> keeps module alive, but that is not the same as preventing the parent
> device/driver from being unbound and tearing down CoreSight device data
> while an active session still has raw pointers.
> 
> There are also similar race window before the path is built: for
> example etm_setup_aux() has to look up source/sink state before
> coresight_build_path() establishes the path, so it might access
> released source/sink data if device is unbound.
> 
> I think a proper fix needs a clearer lifetime model for an active
> session. E.g., we could consider to call device_link_add() to prevent
> device unbind / unregister, and unlink device when the session is
> finished. Once that is in place, the CPU PM notifier can safely use the
> active path without get_device()/put_device() pair anymore.

Right. I am also not sure about lifetime of coresight_device::path.

> Hope this is clear and makes sense.
> 
> Thanks,
> Leo

Sebastian


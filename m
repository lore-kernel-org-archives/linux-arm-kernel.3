Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B80CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncNFWZy16vF6PkI14pbBDWz3t4RCWDQeWsdH+IjOgpc=; b=vdGUhKbBsvycJPY/wRjsqHujcR
	RHbwtf4jr4renwidlYKQpgP1Aw9iNICnYiWzQa6KigYSKqmr9eMfB4kypGJkW5ZtsuA0xe0NhewB1
	OzKlfwJ2phEdgfpyj+El33M9F4E/f0m6Oemjw92mkBh3pR+rlUEZmNbkGXLcxCpLWIw1M0V9sus5U
	7WSyhvVs8yvWlyyYogvqOUjppbK/LdgBa5OMeXJsHjJ5nh4SB0t6QDP4XICCYln8bh6wlqQmVoPJp
	XqnQUGSqG5CeifXMivUOKHoqR7Pm1iAWUgA73CAqYg5ELvFFIZ7+QXbq3SWJPJI7HSwy2YwPQKPzu
	3GJPerhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKx2f-0000000FwOW-0OH6;
	Mon, 17 Nov 2025 11:05:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKx2c-0000000FwNF-3WRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:05:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 891A6FEC;
	Mon, 17 Nov 2025 03:04:52 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF7CE3F66E;
	Mon, 17 Nov 2025 03:04:59 -0800 (PST)
Date: Mon, 17 Nov 2025 11:04:57 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	james.clark@linaro.org
Subject: Re: [PATCH v2 1/1] coresight: fix issue where coresight component
 has no claimtags
Message-ID: <20251117110457.GN3568724@e132581.arm.com>
References: <20251027223545.2801-1-mike.leach@linaro.org>
 <20251027223545.2801-2-mike.leach@linaro.org>
 <20251113173617.GA3568724@e132581.arm.com>
 <CAJ9a7VhVb6a=Q_oZ=0FcrY-EKDNtZPjHbJ=rqaUQ0cardqrSdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhVb6a=Q_oZ=0FcrY-EKDNtZPjHbJ=rqaUQ0cardqrSdg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_030502_959964_7CC5582B 
X-CRM114-Status: GOOD (  41.42  )
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

On Fri, Nov 14, 2025 at 06:03:25PM +0000, Mike Leach wrote:

[...]

> > > +static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
> > > +{
> > > +     u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
> > > +                      csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
> > > +     return ((claim_bits_impl & CORESIGHT_CLAIM_BIT_PROTOCOL_HI) != 0);
> >
> > How about a simple one?
> >
> >         return !!FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
> >                            csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
> 
> Cannot use this as it is valid, if unlikely, to have 1 claim bit which
> would give a false positive as we need 2 bits for the existing
> protocol.

Understand now.  As the protocol works with multiple bits, I would
check CLAIM_MASK instead:

    u32 claim_bits = FIELD_GET(CORESIGHT_CLAIM_MASK,
                        csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
    return claim_bits == CORESIGHT_CLAIM_MASK;

[...]

> > >  void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
> > >  {
> > > +     if (!coresight_claim_tags_implemented_unlocked(csa))
> > > +             return;
> >
> > Here it does not call coresight_check_use_claim_tag_unlocked(), which
> > means the cached flag is not used. I think we should be consistent
> > across all claim tag functions.
> 
> the relevant csdev may not yet exist, and is only used once in init -
> see below for further explanation
> 
> >
> > This is why I suggested to put the flag into csdev_access rather than
> > in csdev. Seems to me, it is nature to use csdev_access to store this
> > flag, as it presents a attribute for register access (we can consider
> > csdev presents a device on bus).
> 
> Not used here as these claim tag functions are not consistent
> themselves - some use a csdev, some use a csa.

Yes.  I have noticed that the clear claim functions use "csa" as its
parameter when I reviewed the change.  This is not bad for me, we
might consolidate all claim function for using "csa" parameter.

> The ones that use csa are exclusively used in clearing down a stale
> claim tag during initialization of a device in a probe function or sub
> function and called only once per device - sometimes  before a csdev
> is in existence. This is safe in cases where claim tags do not exist
> or are not operating correctly as writes will be ignored. This
> therefore only represents a single write per device, and not something
> that occurs multiple times and might benefit from caching the claim
> tag usage status.

When the probe() in CoreSight drivers uses a temporary "csa" to clear
claim tags, in the end, the temporary "csa" will be assigned to
csdev->access when invoke coresight_register().  So it is not true for
"use csa in a probe does not benefit from caching the claim tag usage
status".

A corner case is coresight-etm3x-core.c, the "drvdata->csa" is used
to clear claim tag but not synced to csdev.  We can use a separate patch
to fix it.

> All other uses of claim tags in the drivers use the claim/disclaim
> functions using the csdev as a parameter, after probing and when the
> claim infrastructure is being used.

This is not a barrier.  We can easily dereference the flag via csdev:

    if (csdev->access.claim_tag_impl)
         ...

> Having the claimtag information in the csdev is natural as this has
> all the other general cs information - such as cs type, subtype etc -
> describing the coresight features of the hardware.

> The csa is a structure describing only how the registers are accessed.
> with no register or device specifics. This should remain device/
> register agnostic and avoid coupling in device/register specific
> parameters.

csdev presents a device on CoreSight bus, so it makes sense to store
device type and sub type.  It is not necessary to store every hardware
specific info into it.  More imporatnt, a well organized structure can
avoid complexity in flows.

If store flag in csdev, you will face dilemma when exploring a neat
flow.  For instance, during ETMv4's per CPU init, the csdev is not ready
because it has not registered on the bus yet.  If using csdev to store
the cached flag, we will run into a chicken-and-egg problem, on the
other hand, it would be much easier if we store the flag in "csa", as
"csa" is prepared much earlier.

> An additional use of the flag for claimtag usage state (beyond the
> slight gain in avoiding a read per call to the claim tag API), is to
> allows customers whose claim tags are non-operative, or as in an
> actual case - also give a false positive of
> operationally sufficient claim tags - to set the test to "no claim
> tags" during the probe sequence, so as to ensure the test is skipped
> and claim tags are never attempted to be used during enable / disable
> device
> 
> The clearing down of the self claim tag on probe is to remove stale
> self claim tags when a kernel is restarted without disclaiming
> hardware (e.g. debugging/crash etc) and without repowering the device.
> From a kernel perspective, this does not have to happen until the
> first claim attempt is made for the device. Given that on the first
> claim call we now do a one time check, this one time clearing of
> lingering claim tags could be done here, and remove the clear tag apis
> completely simplifying the code  - though this would leave the devices
> apparently claimed until that first use.

Now we already have callsites in device probes for clear claims, seems
to me, we can simply reuse these callsites for claim tag init.  (Just
rename to new functions, coresight_claim_tag_init{_unlocked}()).

I am fine with using the deferring method if the logic is simple
enough.  However, I don't like the idea of separating the claim tag
clearing and the initialization flag - why not maintain the init code
in single place?

Thanks,
Leo


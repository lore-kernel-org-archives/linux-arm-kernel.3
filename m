Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10173606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQBqXlUW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGSLhNHq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ljoz0IZXV/fb7lLK+CyHT4EslT/P2ixwKVNk6JMrWWk=; b=nQBqXlUWZDfGBz
	IzaHkmO04G4aMv6m9ALID1S3RZxhAVyOzNhfKVsH1twbN8oxGILnPiGaeU51u+DN3hKQOZbD9Zux5
	rzjmRC0UTInSE3H9KKkFjn7wu1pphwA9dn7nP7/gPxtguIgbDkgTTEajTD6v9ZCEDT9mIKw3UMAs0
	GfYgJwQH14xAc0x6VfZWSo6a0xzKYIregVlcYIzqEAde9QFwIHiHhrIhAhaUoenzjFspvQ82aizsK
	5oyw96WvTss7wztakp2Sq7c7tNBhYJXPH08s9FYobofE4CmZQqHx9QRqJOAjR9hNmBt6OGRAQZ5Yk
	UEKVQ0B867HTuzqXKSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPzZ-000000045O8-3P83;
	Wed, 04 Nov 2026 01:40:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPzW-000000045Nd-1Cdc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 01:40:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FEFA60AAB;
	Wed,  4 Nov 2026 01:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECA01F000C1;
	Wed,  4 Nov 2026 01:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793756440;
	bh=ljoz0IZXV/fb7lLK+CyHT4EslT/P2ixwKVNk6JMrWWk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gGSLhNHqVBzKwaf4HJL7lM2pZ/TPYOlAh7Y0eZkKQohx/dWkAsljuX3akBhY1jFQC
	 Wl4hIyU2ToFGupDpg0XySxy+sBlNlAL3Tr8+ZVuB74X5TL6tjDp/Cm4dIQ/Fql4xmQ
	 /lM9+uO5u7/yxYyX2FHMmL+XAS3FkCpkbsyA3rgHHHEzUP8LM+FzwQw03pjrgUlPnH
	 zu2fjoRQtyPknxQY9pGdoj97RIayJkWeM04RRlBDpGFwzoo1cYTbcTMXfsc6V+F75D
	 0n/rnU4p66QSXtFzR5RWxndilVNyB81DVIWabd8ohgl0/hr8qxj4Eq2lnDsl0ZvcMx
	 cqwT/MJ2c7F+g==
Date: Wed, 4 Nov 2026 01:40:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Fabrice Gasnier
 <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Andy Shevchenko
 <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent
 to dependency
Message-ID: <20261104014031.2aed1419@jic23-hlaptop>
In-Reply-To: <aup9LKewaLr2B5cR@google.com>
References: <20261103221717.3840215-1-briannorris@chromium.org>
	<20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
	<20261103231719.486a18de@jic23-hlaptop>
	<aup9LKewaLr2B5cR@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 16:32:44 -0800
Brian Norris <briannorris@chromium.org> wrote:

> Hi Jonathan,
> 
> On Tue, Nov 03, 2026 at 11:17:19PM +0000, Jonathan Cameron wrote:
> > On Tue,  3 Nov 2026 14:14:41 -0800
> > Brian Norris <briannorris@chromium.org> wrote:
> >   
> > > When a child device suspends, it does not update the last_busy timestamp
> > > for its parent. If that parent configured autosuspend and didn't
> > > otherwise maintain its last_busy timestamp, it may now be immediately
> > > eligible to suspend. This is probably not expected -- the parent should
> > > wait for its autosuspend delay before suspending.  
> > 
> > So reading this again - I wonder if this text is describing the
> > expected behaviour.  
> 
> Agreed, this might give the wrong impression, depending on the
> assumptions the reader makes about autosuspend delay. (I think I had a
> particular problem scenario in mind, but didn't translate that properly
> here.)
> 
> > If the child is also using autosupend then, in extreme case, that time
> > might be longer than the autosuspend time of the parent.
> > If so it seems odd the parent still waits.  
> 
> Right, that seems wrong, and indeed that's not what this patch does.
> 
> > So most expected to me
> > would be if the parent were to suspend it's autosuspend time after
> > the parent or child was last used for something that indicate a
> > desire not to suspend (that shouldn't include actions the child
> > did whilst suspending).  
> 
> (Not sure I'm parsing this sentence quite right, but...)
> 
> The point is that last_busy should propagate (rather than, say, the
> expiration time). So each device still gets its own-delay-based
> autosuspend timer expiration. That may mean the parent waits longer than
> the child, but it may not, if the child's delay was longer than the
> parent's.
> 
> > Maybe there isn't a sensible way to deal with this and what you have here
> > is the best we can do.  Note that this is just commenting on this
> > statement in the commit description.  From what follows I think
> > this is just a commit description thing rather than functional.  
> 
> If I'm understanding what you're saying correctly: maybe it would be an
> improvement here to say:
> 
>   If that parent configured an autosuspend delay longer than its child's
>   and didn't otherwise maintain its last_busy timestamp, it may now be
>   immediately eligible to suspend.
> 
> I think that would more accurately describe the target problem, even if
> it doesn't cover all cases (such as when the parent delay is shorter).

Agreed. That covers the main case nicely.

> 
> > > The effect of this behavior is that a parent device may suspend sooner
> > > than its autosuspend delay, simply because its usage was accounted by
> > > its children, and not by direct references to the parent device.  
> > 
> > Sooner is indeed bad.
> >   
> > > 
> > > This was noticed in several cases, and some have implemented
> > > workarounds, such as in commit c537d3457542 ("iio: adc: stm32-adc: fix
> > > runtime autosuspend delay when slow polling"). At the same time, Ulf
> > > suggested these problems "should be solved in the runtime PM core" [1].
> > > 
> > > Instead of working around the problem in drivers, we propagate last_busy
> > > timestamps from a dependent device to its dependencies any time it may
> > > allow a dependency to suspend -- i.e., when releasing a refcount for its
> > > parent or suppliers. We take care to only propagate the timestamp if it
> > > is larger than the existing busy timestamp.  
> > 
> > So this sounds fine but I don't think aligns with that first paragraph.
> >   
> > > 
> > > Note that this works best if the dependent device is using autosuspend
> > > (and therefore updates its last_busy timestamps appropriately), but even
> > > for a non-autosuspend child, this is still somewhat useful --
> > > non-autosuspend devices still automatically update their last_busy every
> > > time they resume.  
> > 
> > Can we set the last busy on the suspend of child devices that aren't
> > suspending as a result of autosuspend timeout but for other reasons?
> > (may be some fiddly corners!)  
> 
> Do you have concrete use cases in mind, or do you bring this up simply
> because of my note?

Just your note ;)
> 
> For one, I feel like for devices with power.use_autosuspend==true, it's
> reasonable to expect drivers to use the appropriate helpers to update
> last_busy at the appropriate times, and so any "corner cases" are from
> misuse.
> 
> But if you mean non-use_autosuspend devices: I suppose it'd be possible
> but I haven't reasoned through the implementation very far yet. It
> almost seems like we'd need to plumb pm_runtime_mark_last_busy() into
> *all* the put() helpers, including the non-autosuspend ones
> (pm_runtime_put(), pm_runtime_put_sync()). I'm not quite sure if that's
> desirable. But I could try to look a bit more, if you think there are
> important use cases that would need this.
If it is hard not a problem to leave it as is and call out the limitation
as you have done.  Someone who needs it can figure it out!


Jonathan

> 
> Brian
> 
> > > Link: https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/ [1]
> > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > ---
> > > Cc: Ulf Hansson <ulfh@kernel.org>
> > > 
> > > Changes in v2:
> > >  * Update comments to explain when/why rpm_propagate_last_busy()
> > >    performs the update
> > > 
> > >  drivers/base/power/runtime.c | 23 ++++++++++++++++++++++-
> > >  1 file changed, 22 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > > index 2a117d6a776f..dd306cbabcd3 100644
> > > --- a/drivers/base/power/runtime.c
> > > +++ b/drivers/base/power/runtime.c
> > > @@ -318,6 +318,22 @@ static int rpm_get_suppliers(struct device *dev)
> > >  	return 0;
> > >  }
> > >  
> > > +/*
> > > + * Propagate last_busy timestamp from one device to another, typically when a
> > > + * device (@dev) releases a reference count on a dependency (@target) and might
> > > + * allow it to (auto)suspend. This can, for example, prevent overactive suspend
> > > + * when a dependency's usage is primarily driven by one of its dependents.
> > > + */
> > > +static void rpm_propagate_last_busy(struct device *dev, struct device *target)
> > > +{
> > > +	s64 busy = atomic64_read(&dev->power.last_busy);
> > > +	s64 target_busy = atomic64_read(&target->power.last_busy);
> > > +
> > > +	while (target_busy < busy)
> > > +		if (atomic64_try_cmpxchg(&target->power.last_busy, &target_busy, busy))
> > > +			return;
> > > +}
> > > +
> > >  /**
> > >   * pm_runtime_release_supplier - Drop references to device link's supplier.
> > >   * @link: Target device link.
> > > @@ -348,6 +364,7 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
> > >  		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
> > >  			continue;
> > >  
> > > +		rpm_propagate_last_busy(dev, link->supplier);
> > >  		pm_runtime_release_supplier(link);
> > >  		if (try_to_suspend)
> > >  			pm_request_idle(link->supplier);
> > > @@ -710,6 +727,8 @@ static int rpm_suspend(struct device *dev, int rpmflags)
> > >  
> > >  	if (dev->parent) {
> > >  		parent = dev->parent;
> > > +		if (!parent->power.ignore_children)
> > > +			rpm_propagate_last_busy(dev, parent);
> > >  		atomic_add_unless(&parent->power.child_count, -1, 0);
> > >  	}
> > >  	wake_up_all(&dev->power.wait_queue);
> > > @@ -1368,8 +1387,10 @@ int __pm_runtime_set_status(struct device *dev, unsigned int status)
> > >  		goto out_set;
> > >  
> > >  	if (status == RPM_SUSPENDED) {
> > > -		atomic_add_unless(&parent->power.child_count, -1, 0);
> > >  		notify_parent = !parent->power.ignore_children;
> > > +		if (notify_parent)
> > > +			rpm_propagate_last_busy(dev, parent);
> > > +		atomic_add_unless(&parent->power.child_count, -1, 0);
> > >  	} else {
> > >  		spin_lock_nested(&parent->power.lock, SINGLE_DEPTH_NESTING);
> > >    
> >   
> 



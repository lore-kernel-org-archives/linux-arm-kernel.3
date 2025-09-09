Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0176CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfLyDy8XclrI3nV7reM3niQ+nkRyFYEEkkYpMMdzY/8=; b=gZ3kt1/9DivKREvFaawBqH5Sy7
	pA6dj5FdNpg/OIRp/kmKck178j+bDtAx3sF7vgGf73sV3Px6xOmcP41WdsXFMdgZlXSMOUd7P6dVn
	WcbXSOyXV0mvZx2bY5OsK65iIfHgxfI+cVIlgkD0I2EomzvfldMMa2uBCkC8iDIohjYmNsniw6OPo
	qiNySC4Y5YHadqP0O1a/2Y8Hp9DC7ifqnfAjC5U2e7DtzL0okaSfzlWYvOkUWQJu0GjL9e2PF0dYD
	T7Z0J4xO+w9Kp+DEIDgCwRF3nRPg6acrzPu/eQKJzzZNdMRKkqRBL1l6Eu7+rZbHAUGFA0DEILojL
	W+vO7+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wR-00000008oXp-2zih;
	Tue, 09 Sep 2025 17:15:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWS-00000006jdK-16Z8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tfLyDy8XclrI3nV7reM3niQ+nkRyFYEEkkYpMMdzY/8=; b=b78kDKNP/jHDJc38S+kz8Iqg+s
	bI7uCZk04CPmRjY7OgnHx1LGJfqEJEEuHLMcv/XWiSwaOc91YWDWa21OXNaADoELoMUWmj16Vx/Ys
	tiLgW5690PERNIAy+JT9rHDh4inak5yGjOizNQGalxOU6s02VbvK9gFVMgp06R5ODs4Mu3Cm+CbtQ
	/yUbnap/4Sc5RojX6B/QKUns2h+TNgbTV4x+cKnD7y35Dco28eeR9J9DBsj7+3ilhhxt0hCPar2c/
	V7LT1P61rdaKlzplU6dzbFa6xIqruTBXkVzJBb2OMJRCEOO0gxJmUIrfZbvmco1HcUFh8MfT9FpTO
	oUnQD91g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWO-00000005JXR-3FAl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:28:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19BAC1424;
	Tue,  9 Sep 2025 04:28:14 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF5683F694;
	Tue,  9 Sep 2025 04:28:16 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:28:13 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 12/33] arm_mpam: Add the class and component structures
 for ris firmware described
Message-ID: <aMAPTVqb7fLfFH6R@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-13-james.morse@arm.com>
 <aLV++1PELhKBeKR7@e133380.arm.com>
 <ff73df9c-8e77-471d-b0fb-205701b4d6d3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff73df9c-8e77-471d-b0fb-205701b4d6d3@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_122825_186641_16240049 
X-CRM114-Status: GOOD (  81.36  )
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

Hi,

On Mon, Sep 08, 2025 at 06:57:41PM +0100, James Morse wrote:
> Hi Dave,
> 
> On 01/09/2025 12:09, Dave Martin wrote:
> >> Subject: arm_mpam: Add the class and component structures for ris firmware described
> > 
> > Mangled subject line?
> 
> order words hard is.
> 
> 
> > There is a fair intersection between the commit message and what the
> > patch does, but they don't quite seem to match up.
> > 
> > Some key issues like locking / object lifecycle management
> > and DT parsing (a bit of which, it appears, lives here too) are not
> > mentioned at all.
> 
> I don't think everything needs mentioning - you have the diff for that.This should capture
> the motivation, what you have and what you need to find, the grouping etc.
> 
> 
> > In lieu of a complete rewrite, it might be best to discard the
> > explanation of the various object types.  The comment in the code
> > speaks for itself, and looks clearer.
> 
> Fair enough,

OK

[...]

> >> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> >> index 71a1fb1a9c75..5baf2a8786fb 100644
> >> --- a/drivers/resctrl/mpam_devices.c
> >> +++ b/drivers/resctrl/mpam_devices.c
> >> @@ -20,7 +20,6 @@
> > 
> > [...]
> > 
> >> @@ -35,11 +34,483 @@
> >>  static DEFINE_MUTEX(mpam_list_lock);
> >>  static LIST_HEAD(mpam_all_msc);
> >>  
> >> -static struct srcu_struct mpam_srcu;
> >> +struct srcu_struct mpam_srcu;
> 
> > Why expose this here?  This patch makes no use of the exposed symbol.
> 
> The mpam_resctrl code needs to take it when it walks these lists. I don't want to change
> it then because its just additional churn.

I guess this is harmless, but it's no help to the kernel, or to
reviewers...

[...]

> >> +/*
> >> + * An MSC is a physical container for controls and monitors, each identified by

[...]

> >> + * The same MSC may exist under different class->component->vmsc paths, but the
> >> + * RIS index will be unique.
> >> + */
> > 
> > This description of the structures and how they relate to each other
> > seems OK (bearing in mind that I am already familiar with this stuff --
> > I can't speak for other people).
> 
> Great!

OK

[...]

> >> +static void mpam_ris_destroy(struct mpam_msc_ris *ris)
> >> +{
> >> +	struct mpam_vmsc *vmsc = ris->vmsc;
> >> +	struct mpam_msc *msc = vmsc->msc;
> >> +	struct platform_device *pdev = msc->pdev;
> >> +	struct mpam_component *comp = vmsc->comp;
> >> +	struct mpam_class *class = comp->class;
> >> +
> >> +	lockdep_assert_held(&mpam_list_lock);
> >> +
> >> +	cpumask_andnot(&comp->affinity, &comp->affinity, &ris->affinity);
> >> +	cpumask_andnot(&class->affinity, &class->affinity, &ris->affinity);
> > 
> > This is not the inverse of the cpumask_or()s in mpam_ris_create_locked(),
> > unless the the ris associated with each class and each component have
> > strictly disjoint affinity masks.  Is that checked anywhere, or should
> > it be impossible by construction?
> 
> They should be disjoint. These bitmaps are built from firmware description of the cache
> hierarchy. I don't think its possible to describe a situation where there are overlaps.
> 
> You can build a nonsense cache hierarchy, e.g. where CPU-0's L3 is CPU-6's L2, but if you
> do the scheduler is going to complain when it tries to chose the scheduler domains. I
> think this should be filed under "you've got bigger problems".  There is a check that
> catches this in mpam_resctrl_pick_caches(), to see that all the CPUs are accounted for,
> which is to avoid tasks that get lucky with task-placement managing to escape their
> resource limit.

I guess that makes sense.

If the firmware description is formally a tree structure then it should
be impossible to end up with overlapping affinity masks.

Since this doesn't bite us until teardown-time in any case, I think
this probably doesn't need to be checked explicitly, unless we observe
actual problems.

A comment documenting this assumption may be worth having.


> > But, thinking about it:
> > 
> > I wonder why we ever really need to do the teardown.  If we get an
> > error interrupt then we can just go into a sulk, spam dmesg a bit, put
> > the hardware into the most vanilla state that we can, and refuse to
> > manipulate it further.  But this only happens in the case of a software
> > or hardware *bug* (or, in a future world where we might implement
> > virtualisation, an uncontainable MPAM error triggered by a guest -- for
> > which tearing down the host MPAM would be an overreaction).
> 
> The good news is guests can't escape the PARTID virtualisation that the CPU does, so any
> mess a guest manages to make is confined to that guest's PARTID range.
> 
> 
> > Trying to cleanly tear the MPAM driver down after such an error seems a
> > bit futile.
> > 
> > The MPAM resctrl glue could eventually be made into a module (though
> > not needed from day 1) -- which would allow for unloading resctrlfs if
> > that is eventually module-ised.  I think this wouldn't require the MPAM
> > devices backend to be torn down at any point, though (?)
> 
> It would certainly be optional. kernfs->resctrl->mpam is the reason all this has to be
> built-in. If that changes I'd aim for this to be a module.
> 
> All this free()ing was added so that the driver doesn't end up sitting on memory when it
> isn't providing any usable feature. I have seen a platform where the error interrupt goes

I guess that's reasonable, but this is only applies to hardware that
has MPAM but where it is either broken, or where it is unsuitable for
running Linux but Linux has been deployed on it anyway while still
leaving the ACPI tables intact.  This does not violate any
specification, but it seems of marginal benefit to introduce a load of
complexity just to safe a few K in this situation.  (Or do we get stuck,
unable to free the config and mbwu_state arrays?  Those don't count as
large on a server-class system, but they are about the "a few K"
magnitude.)

(Not that I'm not saying that teardown is something we shouldn't do --
rather, my point is: do we really need to do it now if it is subtle and
complex to make it work, or can this be a later addition?)

> off during boot, (I suspect firmware configures an out-of-range PARTID). On such a
> platform any memory that isn't free()d is a waste.
> 
> But I agree its a small amount of memory.
> 
> 
> > If we can simplify or eliminate the teardown, does it simplify the
> > locking at all?  The garbage collection logic can also be dispensed
> > with if there is never any garbage.
> 
> It wouldn't simplify the locking, only remove that deferred free()ing which is needed
> because of SRCU.

My point was that there is no need to defend against concurrent removal
if list entries if list entries are never removed.

> > Since MSCs etc. never disappear from the hardware, it feels like it
> > ought not to be necessary ever to remove items from any of these lists
> > except when trying to do a teardown (?)
> 
> Unbinding the driver from an MSC is another case where this may be triggered via
> mpam_msc_drv_remove(). If you look at the whole thing, mpam_ris_destroy() pokes
> mpam_resctrl_teardown_class() to see if resctrl needs to be torn down.
> 
> I don't anticipate folk actually needing to do that. One Reasons is for VFIO - but this
> kind of stuff has a performance impact on the hypervisor, so its unlikely to ever allow a
> guest direct access to this kind of thing. Another reason is to load a more specific
> driver, which sounds unlikely.
> 
> 
> Ultimately this memory free-ing code is here because its the right thing to do.
> I'd prefer to keep it as making this a loadable module would mean we have to do this.

I don't disagree with that: it is messy to retrofit teardown if it was
never considered in the initial design.

I guess that this all comes from my uncertainty about the object
lifecycles and locking behaviour.

I would still prefer to see this documented.  If the the documentation
would be too unwieldy or infrasible to write, this would suggest that
the code would benefit from simplification...


For the probe phase, or for teardown, I'm really not sure why it would
break anything to have a single Big MPAM Lock (however inelegant).

For the run phase (when resctrl and other clients of the driver are
able to use the driver), the discovered system properties and the
mappings onto resctrl resources are all static, and we don't seem to
need all this RCU stuff.

> > (Putting the hardware into a quiecent state is not the same thing as
> > tearing down the data structures -- we do want to quiesce MPAM when
> > shutting down the kernel, as least for the kexec scenario.)
> 
> > [...]
> > 
> >> +static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
> >> +				  enum mpam_class_types type, u8 class_id,
> >> +				  int component_id, gfp_t gfp)
> >> +{
> >> +	int err;
> >> +	struct mpam_vmsc *vmsc;
> >> +	struct mpam_msc_ris *ris;
> >> +	struct mpam_class *class;
> >> +	struct mpam_component *comp;
> >> +.
> >> +	lockdep_assert_held(&mpam_list_lock);
> >> +
> >> +	if (test_and_set_bit(ris_idx, msc->ris_idxs))
> >> +		return -EBUSY;
> > 
> > Is it impossible by construction to get in here with an out-of-range
> > ris_idx?
> > 
> > To avoid the callers (i.e., ACPI) needing to understand the internal
> > limitations of this code, maybe it is worth having a check here (even
> > if technically redundant).
> 
> It's possible - but only if you mess up the firmware tables.
> I'll add a check for this as its easy enough.

OK, suits me.

Cheers
---Dave


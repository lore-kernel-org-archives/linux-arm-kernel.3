Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E36ECD992
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXMwG6BGnk12d8Zak18LbzOy5UoGxhY+Vill2gcYoVg=; b=0WXH4AUyaZ3sqcti0rdFUI4rRH
	b2KTbATdk/lPm6pjsiEkJwJnoRsfwyeoPL3FNT87oM6RqATV+J4GytERhp3+Ak/Strf66QafbBX9u
	k4gx7ANjMg/tY1cyhlreC5qf6J7XW+WtP0XFshqxYaGCZIsF9e4ElKPs2LRngSP7BrSoTh43seXDT
	HGFNtAy0XZOLEXiCTocPmcSX5rX/nA02LDa/s3x8JsG+spYMZEQMZ0Lj9iyDs9ex/zDglEDAMtWSr
	W8tKC7JJH8TgFquJvyckXaxT0bPwtRwxbOuFlBKttWWELT33NKlN48RNR4Uprb9Iej+FcMoAkbK4e
	cCXTi0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo495-0000000AN1Y-0ykg;
	Thu, 05 Feb 2026 18:32:03 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo490-0000000AN0l-2xN9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 18:31:59 +0000
Received: from skinsburskii.localdomain (unknown [52.148.138.235])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8470B20B7169;
	Thu,  5 Feb 2026 10:31:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8470B20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770316317;
	bh=KXMwG6BGnk12d8Zak18LbzOy5UoGxhY+Vill2gcYoVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haHqLw8eQdW/e0hQhTM7GUUYD4UFFfmsptLs2aj+o9czuyMPa2Hye3N5zWxc5/Jmo
	 CveCbGUldDoRIW2W6rZOT6a2axryt/n2mHxDIVcRSzaKcebDW30mvqB9wOSqXjOjPQ
	 TnqHkIyI2/rgvUlCuyMo9mYsHDJKSgJWtJw2FEMQ=
Date: Thu, 5 Feb 2026 10:31:54 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com
Subject: Re: [PATCH v0 15/15] mshv: Populate mmio mappings for PCI passthru
Message-ID: <aYTiGhDwJqoyWqRT@skinsburskii.localdomain>
References: <aXAxmYm4zbOzGztz@skinsburskii.localdomain>
 <45e7a4c0-f1d8-b8b4-8c03-56d06845323b@linux.microsoft.com>
 <aXevWXolgNrrLltF@skinsburskii.localdomain>
 <f39a501e-478f-66ff-26c8-229ca3991f4f@linux.microsoft.com>
 <aXkKhGvpaHUGclI-@skinsburskii.localdomain>
 <8d798da6-1720-ceea-f1b0-62ca675085c8@linux.microsoft.com>
 <aYDROXpR5kvlylGG@skinsburskii.localdomain>
 <596c9549-9edc-91f3-7473-e206ddc68e76@linux.microsoft.com>
 <aYTFJB4UcRkL2NwG@skinsburskii.localdomain>
 <4a7c63fc-b96a-9841-7745-adbc41190c36@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a7c63fc-b96a-9841-7745-adbc41190c36@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_103158_800103_00E127B0 
X-CRM114-Status: GOOD (  58.73  )
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

On Thu, Feb 05, 2026 at 09:57:20AM -0800, Mukesh R wrote:
> On 2/5/26 08:28, Stanislav Kinsburskii wrote:
> > On Wed, Feb 04, 2026 at 02:52:54PM -0800, Mukesh R wrote:
> > > On 2/2/26 08:30, Stanislav Kinsburskii wrote:
> > > > On Fri, Jan 30, 2026 at 02:17:24PM -0800, Mukesh R wrote:
> > > > > On 1/27/26 10:57, Stanislav Kinsburskii wrote:
> > > > > > On Mon, Jan 26, 2026 at 07:07:22PM -0800, Mukesh R wrote:
> > > > > > > On 1/26/26 10:15, Stanislav Kinsburskii wrote:
> > > > > > > > On Fri, Jan 23, 2026 at 06:19:15PM -0800, Mukesh R wrote:
> > > > > > > > > On 1/20/26 17:53, Stanislav Kinsburskii wrote:
> > > > > > > > > > On Mon, Jan 19, 2026 at 10:42:30PM -0800, Mukesh R wrote:
> > > > > > > > > > > From: Mukesh Rathor <mrathor@linux.microsoft.com>
> > > > > > > > > > > 
> > > > > > > > > > > Upon guest access, in case of missing mmio mapping, the hypervisor
> > > > > > > > > > > generates an unmapped gpa intercept. In this path, lookup the PCI
> > > > > > > > > > > resource pfn for the guest gpa, and ask the hypervisor to map it
> > > > > > > > > > > via hypercall. The PCI resource pfn is maintained by the VFIO driver,
> > > > > > > > > > > and obtained via fixup_user_fault call (similar to KVM).
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> > > > > > > > > > > ---
> > > > > > > > > > >       drivers/hv/mshv_root_main.c | 115 ++++++++++++++++++++++++++++++++++++
> > > > > > > > > > >       1 file changed, 115 insertions(+)
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
> > > > > > > > > > > index 03f3aa9f5541..4c8bc7cd0888 100644
> > > > > > > > > > > --- a/drivers/hv/mshv_root_main.c
> > > > > > > > > > > +++ b/drivers/hv/mshv_root_main.c
> > > > > > > > > > > @@ -56,6 +56,14 @@ struct hv_stats_page {
> > > > > > > > > > >       	};
> > > > > > > > > > >       } __packed;
> > > > > > > > > > > +bool hv_nofull_mmio;   /* don't map entire mmio region upon fault */
> > > > > > > > > > > +static int __init setup_hv_full_mmio(char *str)
> > > > > > > > > > > +{
> > > > > > > > > > > +	hv_nofull_mmio = true;
> > > > > > > > > > > +	return 0;
> > > > > > > > > > > +}
> > > > > > > > > > > +__setup("hv_nofull_mmio", setup_hv_full_mmio);
> > > > > > > > > > > +
> > > > > > > > > > >       struct mshv_root mshv_root;
> > > > > > > > > > >       enum hv_scheduler_type hv_scheduler_type;
> > > > > > > > > > > @@ -612,6 +620,109 @@ mshv_partition_region_by_gfn(struct mshv_partition *partition, u64 gfn)
> > > > > > > > > > >       }
> > > > > > > > > > >       #ifdef CONFIG_X86_64
> > > > > > > > > > > +
> > > > > > > > > > > +/*
> > > > > > > > > > > + * Check if uaddr is for mmio range. If yes, return 0 with mmio_pfn filled in
> > > > > > > > > > > + * else just return -errno.
> > > > > > > > > > > + */
> > > > > > > > > > > +static int mshv_chk_get_mmio_start_pfn(struct mshv_partition *pt, u64 gfn,
> > > > > > > > > > > +				       u64 *mmio_pfnp)
> > > > > > > > > > > +{
> > > > > > > > > > > +	struct vm_area_struct *vma;
> > > > > > > > > > > +	bool is_mmio;
> > > > > > > > > > > +	u64 uaddr;
> > > > > > > > > > > +	struct mshv_mem_region *mreg;
> > > > > > > > > > > +	struct follow_pfnmap_args pfnmap_args;
> > > > > > > > > > > +	int rc = -EINVAL;
> > > > > > > > > > > +
> > > > > > > > > > > +	/*
> > > > > > > > > > > +	 * Do not allow mem region to be deleted beneath us. VFIO uses
> > > > > > > > > > > +	 * useraddr vma to lookup pci bar pfn.
> > > > > > > > > > > +	 */
> > > > > > > > > > > +	spin_lock(&pt->pt_mem_regions_lock);
> > > > > > > > > > > +
> > > > > > > > > > > +	/* Get the region again under the lock */
> > > > > > > > > > > +	mreg = mshv_partition_region_by_gfn(pt, gfn);
> > > > > > > > > > > +	if (mreg == NULL || mreg->type != MSHV_REGION_TYPE_MMIO)
> > > > > > > > > > > +		goto unlock_pt_out;
> > > > > > > > > > > +
> > > > > > > > > > > +	uaddr = mreg->start_uaddr +
> > > > > > > > > > > +		((gfn - mreg->start_gfn) << HV_HYP_PAGE_SHIFT);
> > > > > > > > > > > +
> > > > > > > > > > > +	mmap_read_lock(current->mm);
> > > > > > > > > > 
> > > > > > > > > > Semaphore can't be taken under spinlock.
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Yeah, something didn't feel right here and I meant to recheck, now regret
> > > > > > > > > rushing to submit the patch.
> > > > > > > > > 
> > > > > > > > > Rethinking, I think the pt_mem_regions_lock is not needed to protect
> > > > > > > > > the uaddr because unmap will properly serialize via the mm lock.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > > +	vma = vma_lookup(current->mm, uaddr);
> > > > > > > > > > > +	is_mmio = vma ? !!(vma->vm_flags & (VM_IO | VM_PFNMAP)) : 0;
> > > > > > > > > > 
> > > > > > > > > > Why this check is needed again?
> > > > > > > > > 
> > > > > > > > > To make sure region did not change. This check is under lock.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > How can this happen? One can't change VMA type without unmapping it
> > > > > > > > first. And unmapping it leads to a kernel MMIO region state dangling
> > > > > > > > around without corresponding user space mapping.
> > > > > > > 
> > > > > > > Right, and vm_flags would not be mmio expected then.
> > > > > > > 
> > > > > > > > This is similar to dangling pinned regions and should likely be
> > > > > > > > addressed the same way by utilizing MMU notifiers to destpoy memoty
> > > > > > > > regions is VMA is detached.
> > > > > > > 
> > > > > > > I don't think we need that. Either it succeeds if the region did not
> > > > > > > change at all, or just fails.
> > > > > > > 
> > > > > > 
> > > > > > I'm afraid we do, as if the driver mapped a page with the previous
> > > > > > memory region, and then the region is unmapped, the page will stay
> > > > > > mapped in the hypervisor, but will be considered free by kernel, which
> > > > > > in turn will lead to GPF upn next allocation.
> > > > > 
> > > > > There are no ram pages for mmio regions. Also, we don't do much with
> > > > > mmio regions other than tell the hyp about it.
> > > > > 
> > > > 
> > > > So, are you saying that the hypervisor does not use these pages and only
> > > > tracks them? That would make things easier.
> > > > However, if we later try to map a GPA that is already mapped, will the
> > > > hypervisor return an error?
> > > 
> > > Hypervisor does not return an error.
> > > 
> > 
> > So, what happenes if we map a GPA that is already mapped? Does it just
> > remap it to the new PFN?
> 
> yes, otherwise it would return error, right?
> 

I see.
Please summarize and document this behaviour in the commit message.

Thanks,
Stanislav

> > Thanks,
> > Stanislav
> > 
> > > 
> > > 
> > > > Thanks,
> > > > Stanislav
> > > > 
> > > > > Thanks,
> > > > > -Mukesh
> > > > > 
> > > > > 
> > > > > > With pinned regions we issue is similar but less impacting: pages can't
> > > > > > be released by user space unmapping and thus will be simply leaked, but
> > > > > > the system stays intact.
> > > > > > 
> > > > > > MMIO regions are simila to movable region in this regard: they don't
> > > > > > reference the user pages, and thus this guest region replaement is a
> > > > > > stright wat to kernel panic.
> > > > > > 
> > > > > > > 
> > > > > > > > > > The region type is stored on the region itself.
> > > > > > > > > > And the type is checked on the caller side.
> > > > > > > > > > 
> > > > > > > > > > > +	if (!is_mmio)
> > > > > > > > > > > +		goto unlock_mmap_out;
> > > > > > > > > > > +
> > > > > > > > > > > +	pfnmap_args.vma = vma;
> > > > > > > > > > > +	pfnmap_args.address = uaddr;
> > > > > > > > > > > +
> > > > > > > > > > > +	rc = follow_pfnmap_start(&pfnmap_args);
> > > > > > > > > > > +	if (rc) {
> > > > > > > > > > > +		rc = fixup_user_fault(current->mm, uaddr, FAULT_FLAG_WRITE,
> > > > > > > > > > > +				      NULL);
> > > > > > > > > > > +		if (rc)
> > > > > > > > > > > +			goto unlock_mmap_out;
> > > > > > > > > > > +
> > > > > > > > > > > +		rc = follow_pfnmap_start(&pfnmap_args);
> > > > > > > > > > > +		if (rc)
> > > > > > > > > > > +			goto unlock_mmap_out;
> > > > > > > > > > > +	}
> > > > > > > > > > > +
> > > > > > > > > > > +	*mmio_pfnp = pfnmap_args.pfn;
> > > > > > > > > > > +	follow_pfnmap_end(&pfnmap_args);
> > > > > > > > > > > +d
> > > > > > > > > > > +unlock_mmap_out:
> > > > > > > > > > > +	mmap_read_unlock(current->mm);
> > > > > > > > > > > +unlock_pt_out:
> > > > > > > > > > > +	spin_unlock(&pt->pt_mem_regions_lock);
> > > > > > > > > > > +	return rc;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +/*
> > > > > > > > > > > + * At present, the only unmapped gpa is mmio space. Verify if it's mmio
> > > > > > > > > > > + * and resolve if possible.
> > > > > > > > > > > + * Returns: True if valid mmio intercept and it was handled, else false
> > > > > > > > > > > + */
> > > > > > > > > > > +static bool mshv_handle_unmapped_gpa(struct mshv_vp *vp)
> > > > > > > > > > > +{
> > > > > > > > > > > +	struct hv_message *hvmsg = vp->vp_intercept_msg_page;
> > > > > > > > > > > +	struct hv_x64_memory_intercept_message *msg;
> > > > > > > > > > > +	union hv_x64_memory_access_info accinfo;
> > > > > > > > > > > +	u64 gfn, mmio_spa, numpgs;
> > > > > > > > > > > +	struct mshv_mem_region *mreg;
> > > > > > > > > > > +	int rc;
> > > > > > > > > > > +	struct mshv_partition *pt = vp->vp_partition;
> > > > > > > > > > > +
> > > > > > > > > > > +	msg = (struct hv_x64_memory_intercept_message *)hvmsg->u.payload;
> > > > > > > > > > > +	accinfo = msg->memory_access_info;
> > > > > > > > > > > +
> > > > > > > > > > > +	if (!accinfo.gva_gpa_valid)
> > > > > > > > > > > +		return false;
> > > > > > > > > > > +
> > > > > > > > > > > +	/* Do a fast check and bail if non mmio intercept */
> > > > > > > > > > > +	gfn = msg->guest_physical_address >> HV_HYP_PAGE_SHIFT;
> > > > > > > > > > > +	mreg = mshv_partition_region_by_gfn(pt, gfn);
> > > > > > > > > > 
> > > > > > > > > > This call needs to be protected by the spinlock.
> > > > > > > > > 
> > > > > > > > > This is sorta fast path to bail. We recheck under partition lock above.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Accessing the list of regions without lock is unsafe.
> > > > > > > 
> > > > > > > I am not sure why? This check is done by a vcpu thread, so regions
> > > > > > > will not have just gone away.
> > > > > > > 
> > > > > > 
> > > > > > This is shared resources. Multiple VP thread get into this function
> > > > > > simultaneously, so there is a race already. But this one we can live
> > > > > > with without locking as they don't mutate the list of the regions.
> > > > > > 
> > > > > > The issue happens when VMM adds or removed another region as it mutates
> > > > > > the list and races with VP threads doing this lookup.
> > > > > > 
> > > > > > Thanks,
> > > > > > Stanislav
> > > > > > 
> > > > > > 
> > > > > > > Thanks,
> > > > > > > -Mukesh
> > > > > > > 
> > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > Stanislav
> > > > > > > > 
> > > > > > > > > Thanks,
> > > > > > > > > -Mukesh
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > Thanks,
> > > > > > > > > > Stanislav
> > > > > > > > > > 
> > > > > > > > > > > +	if (mreg == NULL || mreg->type != MSHV_REGION_TYPE_MMIO)
> > > > > > > > > > > +		return false;
> > > > > > > > > > > +
> > > > > > > > > > > +	rc = mshv_chk_get_mmio_start_pfn(pt, gfn, &mmio_spa);
> > > > > > > > > > > +	if (rc)
> > > > > > > > > > > +		return false;
> > > > > > > > > > > +
> > > > > > > > > > > +	if (!hv_nofull_mmio) {		/* default case */
> > > > > > > > > > > +		gfn = mreg->start_gfn;
> > > > > > > > > > > +		mmio_spa = mmio_spa - (gfn - mreg->start_gfn);
> > > > > > > > > > > +		numpgs = mreg->nr_pages;
> > > > > > > > > > > +	} else
> > > > > > > > > > > +		numpgs = 1;
> > > > > > > > > > > +
> > > > > > > > > > > +	rc = hv_call_map_mmio_pages(pt->pt_id, gfn, mmio_spa, numpgs);
> > > > > > > > > > > +
> > > > > > > > > > > +	return rc == 0;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > >       static struct mshv_mem_region *
> > > > > > > > > > >       mshv_partition_region_by_gfn_get(struct mshv_partition *p, u64 gfn)
> > > > > > > > > > >       {
> > > > > > > > > > > @@ -666,13 +777,17 @@ static bool mshv_handle_gpa_intercept(struct mshv_vp *vp)
> > > > > > > > > > >       	return ret;
> > > > > > > > > > >       }
> > > > > > > > > > > +
> > > > > > > > > > >       #else  /* CONFIG_X86_64 */
> > > > > > > > > > > +static bool mshv_handle_unmapped_gpa(struct mshv_vp *vp) { return false; }
> > > > > > > > > > >       static bool mshv_handle_gpa_intercept(struct mshv_vp *vp) { return false; }
> > > > > > > > > > >       #endif /* CONFIG_X86_64 */
> > > > > > > > > > >       static bool mshv_vp_handle_intercept(struct mshv_vp *vp)
> > > > > > > > > > >       {
> > > > > > > > > > >       	switch (vp->vp_intercept_msg_page->header.message_type) {
> > > > > > > > > > > +	case HVMSG_UNMAPPED_GPA:
> > > > > > > > > > > +		return mshv_handle_unmapped_gpa(vp);
> > > > > > > > > > >       	case HVMSG_GPA_INTERCEPT:
> > > > > > > > > > >       		return mshv_handle_gpa_intercept(vp);
> > > > > > > > > > >       	}
> > > > > > > > > > > -- 
> > > > > > > > > > > 2.51.2.vfs.0.1
> > > > > > > > > > > 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA3ECD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4fIVdPCzP6UmKqFELGnatwYqCNocE/DOSWTE+QKxm8=; b=WrBHPiqfRS9OabSOAII+UY2BSa
	QYg9gqL4nC8mYFfw0fnZfOw+PP/nQfD/YFDbqyRTxnD3TtDQN/jdYZPLO3UVZbbv0726da7UQInyZ
	hhQEm0JBd40IbRHHoZvSqOBMdPX0LW1joGjfZlphmU4oFCH6lElgPCcvZasfe6bAv+ZiU5xiBzYGb
	AxZGQLValUMMtEHKsVMFX4gtn+6pE+VhOC6+wElgWURjOPHO2oRg6Bt7bpSAesa6RXzdURKKY7hvl
	0sUFesVApvv/ue604eMwLJt6uBqR2S95jEyzQmazwSDwjHYto6DkmYVecT8RpLMBLrxUiMbJuNxtB
	1EZbmSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyiV-000000077wz-3NkB;
	Thu, 21 May 2026 08:25:19 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyiS-000000077vE-0Ven
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:25:17 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso65944825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779351914; x=1779956714; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p4fIVdPCzP6UmKqFELGnatwYqCNocE/DOSWTE+QKxm8=;
        b=opEGQOSviPYOHhGUtKR7jujG0WUrGY85FfDoEa4CPcZwijK0mVF4fH7mw8JVcTzF3v
         Go0Rqpd4YV9z2zXeRax58FSUgF94S3nWAX+KY9XLP+SmKI2T6H6d5zONgBDEiOVNxAKh
         /NVv9BKvaUAvlW1ConQ6R8CZ34wJXpVmNjxBBvyBmzIzERHxo+o56z8eLx0zzY97qfX5
         DoOa6qlgcW2N+z3av/EJzT+kRzLff3VL/BsywUS+FehQ9v6tVOpqAGKaFMHQSIg3I3zk
         /IlRsjdW/T2Eo0heDErPsq9oVOBzk9a9bFuea5hsC/W1DTwwlFzzRdxsoupacwB0jvNi
         QU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351914; x=1779956714;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4fIVdPCzP6UmKqFELGnatwYqCNocE/DOSWTE+QKxm8=;
        b=OqkcCBPVRYWvV4Zmdmlv09Ehzkk4dl2DKDIq4ucRYjSdIe+04wej3aq7a4MYGpArtS
         YckGrlEKI0pvTTcnLAT+ziSXJpmZgCFZmaHS/e57ZuSkxNyX/5GQIfiokwp9rcWf4DHM
         eLJk8ivewDldo/sC7shCFgc1puz1hu9X+fPG3UWZE1lv7RT4oz02J/D/tvuqwEe8gDFV
         /zR7fgiHFSJfDdniwNnVajE1Ib2i/1peM6jOdqSpKh7/XpvGA+Cf39P+qEwHCjXtJi29
         Bc2Ngln3yL8gfcgPiD4Zvmx3mTrBVniyYzTiczmbFwxytRcfiElnylfE2tcTGYjVnpaM
         NB9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9IxxHbWkdUPgeK6gMVEU2n8WDg3GXwEXXPPAFL9EATRV43AsqxgnEExm1Lu2GXTeWqGhNZEKO+zH+W0qq3YhYb@lists.infradead.org
X-Gm-Message-State: AOJu0YywYHoBjxRpvGqODMDF4VuCc8f203Wxc9PIjmtmRXw4AWgISGau
	UycyRXGpc/pNFknnakliLEQLYFghoY5glbb80NdKxtZlEFzORbXRkAbJ3iTnyoGKVwjSpIoSHCE
	z1mRSxOfD0IKDZ2M/pKIR1P7/sg==
X-Received: from plcm20.prod.google.com ([2002:a17:902:f214:b0:2bd:99a8:49c9])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32c4:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bea3082845mr19952145ad.10.1779351914185;
 Thu, 21 May 2026 01:25:14 -0700 (PDT)
Date: Thu, 21 May 2026 08:25:12 +0000
In-Reply-To: <fc024071-2f82-412e-aea2-459d171b89f9@linux.intel.com>
Mime-Version: 1.0
References: <fc024071-2f82-412e-aea2-459d171b89f9@linux.intel.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521082512.1156320-1-joonwonkang@google.com>
Subject: Re: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: baolu.lu@linux.intel.com
Cc: Alexander.Grest@microsoft.com, alexander.shishkin@linux.intel.com, 
	amhetre@nvidia.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	easwar.hariharan@linux.microsoft.com, hpa@zytor.com, iommu@lists.linux.dev, 
	jacob.jun.pan@linux.intel.com, jgg@ziepe.ca, joonwonkang@google.com, 
	joro@8bytes.org, jpb@kernel.org, kas@kernel.org, kees@kernel.org, 
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nicolinc@nvidia.com, 
	peterz@infradead.org, praan@google.com, robin.murphy@arm.com, 
	ryasuoka@redhat.com, smostafa@google.com, sohil.mehta@intel.com, 
	tglx@kernel.org, will@kernel.org, x86@kernel.org, xin@zytor.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012516_172112_205F52AF 
X-CRM114-Status: GOOD (  55.68  )
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

Hi Baolu, thanks for your review.

> On 5/20/26 23:07, Joonwon Kang wrote:
> > For SVA, the IOMMU core always allocates PASID from the global PASID
> > space. The use of this global PASID space comes from the limitation of
> > the ENQCMD instruction in Intel CPUs that it fetches its PASID operand
> > from IA32_PASID, which is per-process; when a process wants to
> > communicate with multiple devices with the ENQCMD instruction, it cannot
> > change its PASID for each device without the kernel's intervention. Also
> > note that ARM introduced a similar instruction, which is ST64BV0.
> > 
> > Due to this nature, SVA with ARM SMMU v3 has been found not working in
> > our environment when other modules/devices compete for PASID. The
> > environment looks as follows:
> > 
> > - The device is not a PCIe device.
> > - The device is to use SVA.
> > - The supported SSID/PASID space is very small for the device; only 1 to
> >    3 SSIDs are supported.
> > 
> > With this setup, when other modules have allocated all the PASIDs that
> > our device is expected to use from the global PASID space via APIs like
> > iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
> > our device fails due to the lack of available PASIDs.
> > 
> > This commit resolves the issue by allowing device driver to maintain its
> > own PASID space and assign a PASID from that for the process-device bond
> > via a new API called `iommu_sva_bind_device_pasid(dev, mm, pasid)`. Doing
> > that, however, will disallow the process to execute the ENQCMD-like
> > instructions at EL0. It is because the process cannot change its PASID in
> > IA32_PASID(or ACCDATA_EL1 on ARM) for each device without the kernel's
> > intervention. For this reason, calling `iommu_sva_bind_device()` and then
> > `iommu_sva_bind_device_pasid()` for the same process will not be allowed
> > and vice versa.
> > 
> > Currently, there is a limitation that a process simultaneously doing SVA
> > with multiple devices with different PASIDs is not supported. So, calling
> > `iommu_sva_bind_device_pasid()` multiple times for the same process with
> > different devices will not be allowed for now while that for
> > `iommu_sva_bind_device()` will be.
> > 
> > Another limitation is that a process cannot do `iommu_sva_bind_device()`
> > if it has ever done `iommu_sva_bind_device_pasid()` even though it has
> > been unbound after use.
> > 
> > Suggested-by: Jason Gunthorpe<jgg@ziepe.ca>
> > Suggested-by: Kevin Tian<kevin.tian@intel.com>
> > Signed-off-by: Joonwon Kang<joonwonkang@google.com>
> > ---
> > v2: Reuse iommu_mm->pasid after SVA bound by iommu_sva_bind_device_pasid()
> >      is unbound.
> > v1: Initial version.
> > 
> >   arch/x86/kernel/traps.c   |   9 +--
> >   drivers/iommu/iommu-sva.c | 151 +++++++++++++++++++++++++++++---------
> >   include/linux/iommu.h     |  14 +++-
> >   3 files changed, 134 insertions(+), 40 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> > index 0ca3912ecb7f..0131c8e5fb10 100644
> > --- a/arch/x86/kernel/traps.c
> > +++ b/arch/x86/kernel/traps.c
> > @@ -857,13 +857,12 @@ static bool try_fixup_enqcmd_gp(void)
> >   		return false;
> >   
> >   	/*
> > -	 * If the mm has not been allocated a
> > -	 * PASID, the #GP can not be fixed up.
> > +	 * If the mm has not been allocated a PASID or ENQCMD has been
> > +	 * disallowed, the #GP can not be fixed up.
> >   	 */
> > -	if (!mm_valid_pasid(current->mm))
> > -		return false;
> > -
> >   	pasid = mm_get_enqcmd_pasid(current->mm);
> > +	if (pasid == IOMMU_PASID_INVALID)
> > +		return false;
> >   
> >   	/*
> >   	 * Did this thread already have its PASID activated?
> > diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
> > index bc7c7232a43e..a83333651ad0 100644
> > --- a/drivers/iommu/iommu-sva.c
> > +++ b/drivers/iommu/iommu-sva.c
> > @@ -10,6 +10,9 @@
> >   
> >   #include "iommu-priv.h"
> >   
> > +/* Whether pasid is to be allocated from the global PASID space */
> > +#define IOMMU_PASID_GLOBAL_ANY IOMMU_NO_PASID
> > +
> >   static DEFINE_MUTEX(iommu_sva_lock);
> >   static bool iommu_sva_present;
> >   static LIST_HEAD(iommu_sva_mms);
> > @@ -17,10 +20,11 @@ static struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
> >   						   struct mm_struct *mm);
> >   
> >   /* Allocate a PASID for the mm within range (inclusive) */
> > -static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct device *dev)
> > +static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm,
> > +						 struct device *dev,
> > +						 ioasid_t pasid)
> >   {
> >   	struct iommu_mm_data *iommu_mm;
> > -	ioasid_t pasid;
> >   
> >   	lockdep_assert_held(&iommu_sva_lock);
> >   
> > @@ -30,8 +34,27 @@ static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct de
> >   	iommu_mm = mm->iommu_mm;
> >   	/* Is a PASID already associated with this mm? */
> >   	if (iommu_mm) {
> > +		if ((pasid == IOMMU_PASID_GLOBAL_ANY && !iommu_mm->pasid_global) ||
> > +		    (pasid != IOMMU_PASID_GLOBAL_ANY && iommu_mm->pasid_global))
> > +			return ERR_PTR(-EBUSY);
> > +
> > +		if (!iommu_mm->pasid_global) {
> > +			if (list_empty(&iommu_mm->sva_domains))
> > +				iommu_mm->pasid = pasid;
> > +
> > +			if (pasid != iommu_mm->pasid) {
> > +				/*
> > +				 * Currently, a process simultaneously doing
> > +				 * SVA with multiple devices with different
> > +				 * PASIDs is not supported.
> > +				 */
> 
> I am a bit confused by the change in this helper and the comments above.
> 
> Currently, when an mm is bound to a device, it uses a PASID allocated
> from the global pool. That implies that all devices access the
> application's address space with the same PASID. Now we want to extend
> this by allowing the device driver to manage the PASID for SVA, which
> should mean different devices might use different PASIDs to access the
> application's address space. But this does not seem to match the logic
> in this helper.
> 
> Perhaps I overlooked something?
> 

I think your understanding is correct. In the long run, the limitations in the
comment and also in the commit message should be removed. I left the work to a
later patch as I am focusing on removing the main blocker first, which is that
a process is blocked by another irrelevant process for doing SVA as described
in the commit message. Currently, SVA for a process with different PASIDs will
only be allowed one after another, not simultaneously, and the current users of
`iommu_sva_bind_device()` should not be affected by this patch.

So, this patch should be enough to fix our current main problem. Can we leave
it to a later patch? or do you think we should remove the limitations now
although there is no requirement yet?

Thanks,
Joonwon Kang

> > +				return ERR_PTR(-ENOSPC);
> > +			}
> > +		}
> > +
> >   		if (iommu_mm->pasid >= dev->iommu->max_pasids)
> >   			return ERR_PTR(-EOVERFLOW);
> > +
> >   		return iommu_mm;
> >   	}


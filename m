Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF19CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsJh+30wUNz1D+fUDdheYM5UvG1VXpuDPgtHFK4OsTg=; b=1TBOYugN9JK80di/TPsIju1WzM
	RSYEeM/EhSwDI44qO0LPp/dGaBSYIwtzXcllEul1QDlqa54VQ0Gx3i0IWhe9OvVtZptQoMknSE2+1
	cCn4yoDwaf+XoDYTu3wxaCuV03WBxKiHAordyI5oHqMLXWEvaviPQLijHoU0rtz/rP2TUzhCYid5d
	mmHjfzb+lIwX1rbTQ3FfRKGYHnt3ICPRHq9izz/Dtws4sF8D1Zw+HQczkG7xBnQqxOrV2Ykf3+PAO
	W8ufvQkTzTrqkV7sWgO5ldYiwXDtDrwwFxWM4mUH5chjX1WvAjRxICdT0/O5Ak1wsHY17nMsVToiU
	QMLV718Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPy18-00000006zS6-3Ecr;
	Thu, 21 May 2026 07:40:30 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPy16-00000006zRM-0Jka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349228; x=1810885228;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=inkx5plslo1VkeJcR7I8W3FkaflTa1Qxq2EwUSuHYCs=;
  b=aY285CNHFBDgOqDZHszTu6LrwfNiC6DuhSx4ogBjg/4P4sV4TQ6Ob6Ke
   jnH2NzqsY4pw3/MjEk3LqbWYKeqP3+eihmFwnD6u3+tgBriIGhfPtzZ8r
   UaS2lwWOcRy3kwLLC13AGJHHAqpKU9RPYkZ7MRxiTLxzWKOUN/0Wp6t08
   HPlNVXnyTrElPKkbV05mqmTlOcu3q5J6MUiB6+xBDB0vYha2PhN21pq/n
   3EzdFLNk6DaPYPtorN5DEMoMxeQUfQylv/iFBOdMfMIXTwXN3MTtbvxXm
   MaqSM/CI1cJMLFeHNcc3n/EyH3VY0X4m1Kp/+mDIV5be43CX+rFQsP3IC
   A==;
X-CSE-ConnectionGUID: FkMFBzS4RbKs7KcK7TcsAA==
X-CSE-MsgGUID: Ka664NqDSZWVmVetKmJqUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80295365"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80295365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:40:27 -0700
X-CSE-ConnectionGUID: KIg2jF8CRiK7vZs2R0R8yg==
X-CSE-MsgGUID: xsjCKj53T/mUubd+K7iU1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="239447015"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:40:21 -0700
Message-ID: <fc024071-2f82-412e-aea2-459d171b89f9@linux.intel.com>
Date: Thu, 21 May 2026 15:39:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
To: Joonwon Kang <joonwonkang@google.com>, jgg@ziepe.ca, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com,
 easwar.hariharan@linux.microsoft.com, jacob.jun.pan@linux.intel.com,
 kees@kernel.org, kevin.tian@intel.com, nicolinc@nvidia.com,
 praan@google.com, smostafa@google.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 peterz@infradead.org, sohil.mehta@intel.com, kas@kernel.org,
 alexander.shishkin@linux.intel.com, ryasuoka@redhat.com, xin@zytor.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260520150743.727106-1-joonwonkang@google.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260520150743.727106-1-joonwonkang@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_004028_137950_9BBBD36E 
X-CRM114-Status: GOOD (  41.38  )
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

On 5/20/26 23:07, Joonwon Kang wrote:
> For SVA, the IOMMU core always allocates PASID from the global PASID
> space. The use of this global PASID space comes from the limitation of
> the ENQCMD instruction in Intel CPUs that it fetches its PASID operand
> from IA32_PASID, which is per-process; when a process wants to
> communicate with multiple devices with the ENQCMD instruction, it cannot
> change its PASID for each device without the kernel's intervention. Also
> note that ARM introduced a similar instruction, which is ST64BV0.
> 
> Due to this nature, SVA with ARM SMMU v3 has been found not working in
> our environment when other modules/devices compete for PASID. The
> environment looks as follows:
> 
> - The device is not a PCIe device.
> - The device is to use SVA.
> - The supported SSID/PASID space is very small for the device; only 1 to
>    3 SSIDs are supported.
> 
> With this setup, when other modules have allocated all the PASIDs that
> our device is expected to use from the global PASID space via APIs like
> iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
> our device fails due to the lack of available PASIDs.
> 
> This commit resolves the issue by allowing device driver to maintain its
> own PASID space and assign a PASID from that for the process-device bond
> via a new API called `iommu_sva_bind_device_pasid(dev, mm, pasid)`. Doing
> that, however, will disallow the process to execute the ENQCMD-like
> instructions at EL0. It is because the process cannot change its PASID in
> IA32_PASID(or ACCDATA_EL1 on ARM) for each device without the kernel's
> intervention. For this reason, calling `iommu_sva_bind_device()` and then
> `iommu_sva_bind_device_pasid()` for the same process will not be allowed
> and vice versa.
> 
> Currently, there is a limitation that a process simultaneously doing SVA
> with multiple devices with different PASIDs is not supported. So, calling
> `iommu_sva_bind_device_pasid()` multiple times for the same process with
> different devices will not be allowed for now while that for
> `iommu_sva_bind_device()` will be.
> 
> Another limitation is that a process cannot do `iommu_sva_bind_device()`
> if it has ever done `iommu_sva_bind_device_pasid()` even though it has
> been unbound after use.
> 
> Suggested-by: Jason Gunthorpe<jgg@ziepe.ca>
> Suggested-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Joonwon Kang<joonwonkang@google.com>
> ---
> v2: Reuse iommu_mm->pasid after SVA bound by iommu_sva_bind_device_pasid()
>      is unbound.
> v1: Initial version.
> 
>   arch/x86/kernel/traps.c   |   9 +--
>   drivers/iommu/iommu-sva.c | 151 +++++++++++++++++++++++++++++---------
>   include/linux/iommu.h     |  14 +++-
>   3 files changed, 134 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 0ca3912ecb7f..0131c8e5fb10 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -857,13 +857,12 @@ static bool try_fixup_enqcmd_gp(void)
>   		return false;
>   
>   	/*
> -	 * If the mm has not been allocated a
> -	 * PASID, the #GP can not be fixed up.
> +	 * If the mm has not been allocated a PASID or ENQCMD has been
> +	 * disallowed, the #GP can not be fixed up.
>   	 */
> -	if (!mm_valid_pasid(current->mm))
> -		return false;
> -
>   	pasid = mm_get_enqcmd_pasid(current->mm);
> +	if (pasid == IOMMU_PASID_INVALID)
> +		return false;
>   
>   	/*
>   	 * Did this thread already have its PASID activated?
> diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
> index bc7c7232a43e..a83333651ad0 100644
> --- a/drivers/iommu/iommu-sva.c
> +++ b/drivers/iommu/iommu-sva.c
> @@ -10,6 +10,9 @@
>   
>   #include "iommu-priv.h"
>   
> +/* Whether pasid is to be allocated from the global PASID space */
> +#define IOMMU_PASID_GLOBAL_ANY IOMMU_NO_PASID
> +
>   static DEFINE_MUTEX(iommu_sva_lock);
>   static bool iommu_sva_present;
>   static LIST_HEAD(iommu_sva_mms);
> @@ -17,10 +20,11 @@ static struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
>   						   struct mm_struct *mm);
>   
>   /* Allocate a PASID for the mm within range (inclusive) */
> -static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct device *dev)
> +static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm,
> +						 struct device *dev,
> +						 ioasid_t pasid)
>   {
>   	struct iommu_mm_data *iommu_mm;
> -	ioasid_t pasid;
>   
>   	lockdep_assert_held(&iommu_sva_lock);
>   
> @@ -30,8 +34,27 @@ static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct de
>   	iommu_mm = mm->iommu_mm;
>   	/* Is a PASID already associated with this mm? */
>   	if (iommu_mm) {
> +		if ((pasid == IOMMU_PASID_GLOBAL_ANY && !iommu_mm->pasid_global) ||
> +		    (pasid != IOMMU_PASID_GLOBAL_ANY && iommu_mm->pasid_global))
> +			return ERR_PTR(-EBUSY);
> +
> +		if (!iommu_mm->pasid_global) {
> +			if (list_empty(&iommu_mm->sva_domains))
> +				iommu_mm->pasid = pasid;
> +
> +			if (pasid != iommu_mm->pasid) {
> +				/*
> +				 * Currently, a process simultaneously doing
> +				 * SVA with multiple devices with different
> +				 * PASIDs is not supported.
> +				 */

I am a bit confused by the change in this helper and the comments above.

Currently, when an mm is bound to a device, it uses a PASID allocated
from the global pool. That implies that all devices access the
application's address space with the same PASID. Now we want to extend
this by allowing the device driver to manage the PASID for SVA, which
should mean different devices might use different PASIDs to access the
application's address space. But this does not seem to match the logic
in this helper.

Perhaps I overlooked something?

> +				return ERR_PTR(-ENOSPC);
> +			}
> +		}
> +
>   		if (iommu_mm->pasid >= dev->iommu->max_pasids)
>   			return ERR_PTR(-EOVERFLOW);
> +
>   		return iommu_mm;
>   	}

Thanks,
baolu


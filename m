Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39949CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wvoYQmIdUkENi8n8sM/WDU3TZEp6FkxGt0PIyexwls=; b=MCUEBJhkZh/tdI3EPcg+okQnim
	lnbMyN8PSL1DdYX+b7F+50DYj5tuEMj2Ru7umuIAPi4FKaEJSRVZddxxwIj4SBskNZHFcJeTfRW+2
	buDtEiv8R60/dFF4lkiO3sfMvbL8NTmDl9D4E3GxE5021JbZQ2xLp4/T1NyBAjXXB/hwIIp1W/Qya
	Wul5gc3Wj1rJKlfIUh+LNEeMtKqizdW42lYuezp2e1GEZMIxbQpLXK7jKSorItJsJHDrGgqKpiA2P
	hSkB3uXVmylAjzEjcWep1qSVEBnnbn6M9iqhyjsCeqo8r22t3drgwHX4MJSHXAkHwlz/ra5LBNlqf
	IZdqzQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZWI-000000069XR-0j8z;
	Thu, 14 May 2026 17:06:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZWG-000000069WX-0GPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:06:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92AEA3543;
	Thu, 14 May 2026 10:06:37 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94F663F836;
	Thu, 14 May 2026 10:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778778402; bh=2ENq1GD4vt/ecUQRvi+8jS49ktV38O470jc4FagE5wk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L5YKRAoc8rNeFT48V6Pyt9Mdwj0A1t4X445/mNAD7MDnBuiIgTaGuJ/Zi7+Z4J9bw
	 pWrDeEv99Sz+cpqufVBAvcsq4zaY59z/F9sr8WAuv31yAKbnsO0aQ3N7cQVuyeCJS3
	 iJFgmLHikOhMxiaceTyvlt9NHY4m9jSUL2AzGTrM=
Message-ID: <763d19a5-9b1a-4243-a7d7-9484c42c32c7@arm.com>
Date: Thu, 14 May 2026 18:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 next 02/10] arm_mpam: Add intPARTID and reqPARTID
 support for Narrow-PARTID feature
To: Zeng Heng <zengheng4@huawei.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com
References: <20260413085405.1166412-1-zengheng4@huawei.com>
 <20260413085405.1166412-3-zengheng4@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260413085405.1166412-3-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_100644_185486_2AD436DF 
X-CRM114-Status: GOOD (  32.83  )
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

Hi Zeng,

On 13/04/2026 09:53, Zeng Heng wrote:
> Introduce Narrow-PARTID (partid_nrw) feature support, which enables
> many-to-one mapping of request PARTIDs (reqPARTID) to internal PARTIDs
> (intPARTID). This expands monitoring capability by allowing a single
> control group to track more task types through multiple reqPARTIDs
> per intPARTID, bypassing the PMG limit in some extent.
> 
> intPARTID: Internal PARTID used for control group configuration.
> Configurations are synchronized to all reqPARTIDs mapped to the same
> intPARTID. Count is indicated by MPAMF_PARTID_NRW_IDR.INTPARTID_MAX, or
> defaults to PARTID count if Narrow-PARTID is unsupported.
> 
> reqPARTID: Request PARTID used to expand monitoring groups. Enables
> a single control group to monitor more task types by multiple reqPARTIDs
> within one intPARTID, overcoming the PMG count limitation.
> 
> For systems with homogeneous MSCs (all supporting Narrow-PARTID), the
> driver exposes the full reqPARTID range directly. For heterogeneous
> systems where some MSCs lack Narrow-PARTID support, the driver utilizes
> PARTIDs beyond the intPARTID range as reqPARTIDs to expand monitoring
> capacity.
> 
> So, the numbers of control group and monitoring group are calculated as:
> 
>   n = min(intPARTID, PARTID)  /* the number of control groups */
>   l = min(reqPARTID, PARTID)  /* the number of monitoring groups */
>   m = l // n                  /* monitoring groups per control group */
> 
> Where:
> 
>   intPARTID: intPARTIDs on Narrow-PARTID-capable MSCs
>   reqPARTID: reqPARTIDs on Narrow-PARTID-capable MSCs
>   PARTID:    PARTIDs on non-Narrow-PARTID-capable MSCs
> 
> Example: L3 cache (256 PARTIDs, without Narrow-PARTID feature) +
>          MATA (32 intPARTIDs, 256 reqPARTIDs):
> 
>   n = min( 32, 256) =  32 intPARTIDs
>   l = min(256, 256) = 256 reqPARTIDs
>   m = 256 / 32 = 8 reqPARTIDs per intPARTID
> 
> Implementation notes:
>   * Handle mixed MSC systems (some support Narrow-PARTID, some don't) by
>     taking minimum number of intPARTIDs across all MSCs.
>   * resctrl_arch_get_num_closid() now returns the number of intPARTIDs
>     (was PARTID).

What you're doing here is making intPARTID the fundamental unit in MPAM. I
don't think we should do this as its not true in the architecture: narrowing
is a single, optional feature. We have platforms that don't support narrowing
at all - so having to think in terms of "what is the intPARTID limit on this
platform that doesn't have the feature" is confusing.
Narrowing doesn't affect the monitoring, so you can't just string-replace the
driver.

The resctrl glue code is going to have to know about narrowing as it must
either duplicate the control values for aliasing PARTID, or remap them using
narrowing.

I'd prefer it if the mpam_devices code exposed an API to make use of narrowing
that makes sense given the MPAM architecture. (e.g. narrowing is optional!)
Whetever resctrl needs should then be built on top of that.


Currently the MAX PARTID/PMG are dealt with separately as we need a global value
at the end. It was done separately as it could be a patch on its own, to try and
keep each patch reviewable.
But it should probably have been dealt with the same way we deal with all MSC
features - stash them in struct mpam_msc_ris at hw_probe time, and combine them
up to the class level handling different values with __props_mismatch().
The global state that includes the requestors can be created after that point.

I think we should do this now to add intpartid_max to struct mpam_props so that the
resctrl glue code can find the intpartid_max per class. I don't think it makes sense as
a global property. (we should move partid_max and pmg_max at the same time)

... I think moving partid_max would just be cleanup. The resctrl glue code needs to
know the maximum PARTID for monitoring, but I think this would always be the global
PARTID max value.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 41b14344b16f..cf067bf5092e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -63,6 +63,7 @@ static DEFINE_MUTEX(mpam_cpuhp_state_lock);
>   * Generating traffic outside this range will result in screaming interrupts.
>   */
>  u16 mpam_partid_max;
> +u16 mpam_intpartid_max;
>  u8 mpam_pmg_max;
>  static bool partid_max_init, partid_max_published;
>  static DEFINE_SPINLOCK(partid_max_lock);

The global properties are supposed to mean "if you generate any traffic outside
this range, you'll get an out of range error causing mpam_disable()".

This doesn't hold for intPARTID.

In my hypothetical system from the cover letter: {
  64 PARTID at the L3
  64 PARTID and narrowing to 16 at the SLC
  64 PARTID and narrowing to 32 at the memory-controller

  The resctrl glue code could ignore the SLC if it wanted to use 32 PARTID, and just
  duplicate the aliasing controls at L3. (and remove the non-aliasing controls)
}


> @@ -2743,9 +2749,13 @@ static void mpam_enable_once(void)
>  	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline,
>  				      "mpam:online");
>  
> -	/* Use printk() to avoid the pr_fmt adding the function name. */
> -	printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
> -	       mpam_partid_max + 1, mpam_pmg_max + 1);
> +	if (mpam_partid_max == mpam_intpartid_max)
> +		/* Use printk() to avoid the pr_fmt adding the function name. */
> +		printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
> +		       mpam_partid_max + 1, mpam_pmg_max + 1);
> +	else
> +		printk(KERN_INFO "MPAM enabled with %u reqPARTIDs, %u intPARTIDs and %u PMGs\n",
> +		       mpam_partid_max + 1, mpam_intpartid_max + 1, mpam_pmg_max + 1);

intPARTID is not a global property. It's also an optional feature, so its problematic
to print this on platforms that don't have the feature.


>  }
>  
>  static void mpam_reset_component_locked(struct mpam_component *comp)
>  
>  u32 resctrl_arch_system_num_rmid_idx(void)


Thanks,

James


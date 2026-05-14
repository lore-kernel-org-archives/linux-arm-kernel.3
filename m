Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72373CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwBD1HJ+teWJgzKmrNBFAt/ijhxbSWF5AWnQlflFmMs=; b=QQrcbMcZ7BB9EP8mcuM9ejruQg
	ZeBGDp4Lh6uIaSBm0Ciaonn+tK3/gbm/VrE86Ir/FaRH9ftnby1H4zV6b5jWhz/aRSiHawEe4DoiX
	cw0k0oVsx0DObuLRBmV2nPHwuF+ng/9QJ0CSKew2L9NRq4QT2QMNaH+aB8eTR/mhAXNsxMjRtmdjn
	/1KgFAxY0TtffmNphhXuBaKaZ5jwTjyn2T2ju7Qlf74TM/yp84cvmZ8yp8c05Oz7uTAvE93s2F6I7
	wj76CI0zaZSLM5oiBcLcatCxxM5rNr3GgsL6zkIOk1fa3dQzdGgHGQm3e/5ub/9QdHQIq/93faWED
	BU10fHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZWm-000000069iC-1g0h;
	Thu, 14 May 2026 17:07:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZWj-000000069h7-1Nx4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:07:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 617943546;
	Thu, 14 May 2026 10:07:06 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E88A03F836;
	Thu, 14 May 2026 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778778431; bh=VRAj//Lzn8IAHFc26zLrUCEE66whJFskf7iFkEQZOH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IDcMpYnWVYROpxdlxX9xlueAZ085LcRtfWgtjYJ1AF0qK/Nij3kfGqScltgoKRGU4
	 NgB1SCG49lbX44zlkOAfTSBQyrpB/72RFtYNgtX9IlF2cbzfe5VUDZzUsPmjf1TSS7
	 I6Vbb1fQC5P5kFE7Rd2o9XU7PlDxslGdQHO1aKvg=
Message-ID: <2944b506-a462-42f8-95cf-404241fb27f0@arm.com>
Date: Thu, 14 May 2026 18:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 next 04/10] arm_mpam: Refactor rmid to reqPARTID/PMG
 mapping
To: Zeng Heng <zengheng4@huawei.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com
References: <20260413085405.1166412-1-zengheng4@huawei.com>
 <20260413085405.1166412-5-zengheng4@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260413085405.1166412-5-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_100714_126562_72DE2929 
X-CRM114-Status: GOOD (  47.47  )
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
> The Narrow-PARTID feature allows the MPAM driver to statically or
> dynamically allocate request PARTIDs (reqPARTIDs) to internal

(I think we should leave anything dynamic here for the further future,
 lets get static partitioning working first)


> PARTIDs (intPARTIDs). This enables expanding the number of monitoring
> groups beyond the hardware PMG limit.

> For systems with mixed MSCs (Memory System Components), MSCs that do
> not support Narrow-PARTID use PARTIDs exceeding the minimum number of
> intPARTIDs as reqPARTIDs to expand monitoring groups.
> 
> Expand RMID to include reqPARTID information:
> 
>   RMID = reqPARTID * NUM_PMG + PMG
> 
> To maintain compatibility with the existing resctrl layer, reqPARTIDs
> are allocated statically with a linear mapping to intPARTIDs via
> req2intpartid().
> 
> Mapping relationships (n = intPARTID count, m = reqPARTIDs per intPARTID):
> 
> P - Partition group
> M - Monitoring group
> 
> Group  closid rmid.reqPARTID  MSCs w/ Narrow-PARTID  MSCs w/o Narrow-PARTID
> P1     0                      intPARTID_1            PARTID_1
> M1_1   0      0               ├── reqPARTID_1_1      ├── PARTID_1
> M1_2   0      0+n             ├── reqPARTID_1_2      ├── PARTID_1_2
> M1_3   0      0+n*2           ├── reqPARTID_1_3      ├── PARTID_1_3
> ...                           ├── ...                ├── ...
> M1_m   0      0+n*(m-1)       └── reqPARTID_1_m      └── PARTID_1_m
> 
> P2     1                      intPARTID_2            PARTID_2
> M2_1   1      1               ├── reqPARTID_2_1      ├── PARTID_2
> M2_2   1      1+n             ├── reqPARTID_2_2      ├── PARTID_2_2
> M2_3   1      1+n*2           ├── reqPARTID_2_3      ├── PARTID_2_3
> ...                           ├── ...                ├── ...
> M2_m   1      1+n*(m-1)       └── reqPARTID_2_m      └── PARTID_2_m
> 
> Pn     n-1                    intPARTID_n            PARTID_n
> Mn_1   n-1    n-1             ├── reqPARTID_n_1      ├── PARTID_n
> Mn_2   n-1    n-1+n           ├── reqPARTID_n_2      ├── PARTID_n_2
> Mn_3   n-1    n-1+n*2         ├── reqPARTID_n_3      ├── PARTID_n_3
> ...                           ├── ...                ├── ...
> Mn_m   n-1    n*m-1           └── reqPARTID_n_m      └── PARTID_n_m

This table doesn't appear to say anything - you've got 'req' in the column
with narrowing .. that's about it.

Having an example is good, but I think it needs actual example values.
e.g.

my_control_group has CLOSID 0x8 using RMID 0.
It has two monitor groups with RMID 1 and 2.

mpam_partid_closid_shift is set to 1.

my_control_group uses two PARTID 0x10 and 0x11, both with PMG 0.
One monitor group uses PARTID 0x10 and PMG 1, the other uses PARTID 0x11
and PMG 1.


> Refactor the glue layer between resctrl abstractions (rmid) and MPAM
> hardware registers (reqPARTID/PMG) to support Narrow-PARTID. The resctrl
> layer uses rmid2reqpartid() and rmid2pmg() to extract components from
> rmid. The closid-to-intPARTID translation remains unchanged via
> resctrl_get_config_index().
> 
> Since Narrow-PARTID is a monitoring enhancement,

Please don't imply this is what the narrowing feature is for! We're abusing it.
The evidence its abuse is this breaks all the non-aliasing controls, meaning we
have to get rid of them.


> reqPARTID is only
> used in monitoring paths while configuration paths maintain the original
> semantics of closid.

I can't work out what this means. 'reqPARTID' is a term the architecture only uses
in the context of narrowing, which doesn't apply to monitors. Controls need to either
use the intPARTID or the set of PARTID. Monitors always need to use the set of PARTID.

I don't think we should use the terms intPARTID or reqPARTID everywhere - the spec
doesn't, and this thing is an optional feature.


> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> index 70d396e7b6da..40d60b0ab0fd 100644
> --- a/arch/arm64/include/asm/mpam.h
> +++ b/arch/arm64/include/asm/mpam.h

It shouldn't be necesary to touch the arch code's header file!


> @@ -63,6 +63,15 @@ static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
>  	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
>  }
>  
> +u16 req2intpartid(u16 reqpartid);

Please don't add a dependency on something in a driver in the context-switch path.
This stuff needs to be standalone.


> +static inline u16 mpam_get_regval_partid(u64 regval)
> +{
> +	u16 reqpartid = (regval & MPAMSM_EL1_PARTID_D_MASK) >> MPAMSM_EL1_PARTID_D_SHIFT;
> +
> +	return req2intpartid(reqpartid);
> +}
> +
>  static inline void mpam_thread_switch(struct task_struct *tsk)
>  {
>  	u64 oldregval;
> @@ -72,7 +81,8 @@ static inline void mpam_thread_switch(struct task_struct *tsk)
>  	if (!static_branch_likely(&mpam_enabled))
>  		return;
>  
> -	if (regval == READ_ONCE(arm64_mpam_global_default))
> +	if (regval == READ_ONCE(arm64_mpam_global_default) ||
> +	   !mpam_get_regval_partid(regval))
>  		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
>  
>  	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));

Why can't the resctrl glue code mess with the PARTID value for task using the existing
arch<->MPAM API? resctrl_arch_set_closid_rmid() already provides arbitrary values.
Please fix them up before they get stuffed in struct thread_info.


> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 56859f354efa..9d0a7a4dffd1 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -303,15 +303,60 @@ u32 resctrl_arch_system_num_rmid_idx(void)
>  	return (mpam_pmg_max + 1) * get_num_reqpartid();
>  }
>  
> +static u16 rmid2reqpartid(u32 rmid)

Surely you need the CLOSID as well to generate something you are going to use as a PARTID.
How can this work if you have multiple control groups?


> +{
> +	rmid /= (mpam_pmg_max + 1);
> +
> +	if (cdp_enabled)
> +		return resctrl_get_config_index(rmid, CDP_DATA);
> +
> +	return resctrl_get_config_index(rmid, CDP_NONE);
> +}
> +
> +static u8 rmid2pmg(u32 rmid)
> +{
> +	return rmid % (mpam_pmg_max + 1);
> +}
> +
> +u16 req2intpartid(u16 reqpartid)
> +{
> +	return reqpartid % (mpam_intpartid_max + 1);
> +}

As before, I'd prefer we don't call everything intPARTID or reqPARTID - not every
platform has narrowing. This makes it harder to think about the simpler platforms.

'mpam_intpartid_max' shouldn't exist as a global property from the mpam_devices
code - but it should be a mask chosen by the resctrl glue code at setup time.

Something like this psuedocode:
--------%<--------
u64 mpam_partid_closid_shift;

static partid_set_idx_t convert_closid_any_rmid_cdp_safe(struct mpam_resctrl_res *res,
							 enum resctrl_conf_type cdp_type,
							 u32 closid)
{
	int i;
	u16 partid_base;
	partid_set_idx_t partid_set = { 0 };
	u16 num_groups = 1 << mpam_partid_closid_shift;

	if (mpam_resctrl_hide_cdp(r->rid))
		cdp_type = CDP_CODE;

	partid_base = resctrl_get_config_index(closid, cdp_type);
	partid_base <<= mpam_partid_closid_shift;

	if (res->using_narrowing) {
		u16 intpartid = closid;
		__set_bit(intpartid, partid_set);
		return partid_set;
	}

	for (i = 0; i < num_groups; i++)
		__set_bit(partid_base + i, partid_set);

	return partid_set;
}


static partid_set_idx_t mpam_resctrl_convert_closid_any_rmid(struct mpam_resctrl_res *res,
							 enum resctrl_conf_type cdp_type,
							 u32 closid)
{
	int i;
	u16 partid_base;
	partid_set_idx_t partid_set = { 0 };
	u16 num_groups = 1 << mpam_partid_closid_shift;

	if (mpam_resctrl_hide_cdp(r->rid))
		cdp_type = CDP_CODE;
	partid_set = mpam_resctrl_convert_closid_any_rmid_cdp_safe(res, cdp_type, closid);

	if (mpam_resctrl_hide_cdp(r->rid)) {
		cdp_type = CDP_DATA;
		partid_set |= mpam_resctrl_convert_closid_any_rmid_cdp_safe(res, cdp_type, closid);
	}

	return partid_set;
}
--------%<--------

This is pretending we can deal with a set of PARTID as a bitmap - which might not work
well if we have to allocate memory all over the place. The table description I put in the
cover-letter is an alternative - pointing at a pre-computed set: but that probably won't
work well for CDP. A hybrid of the two might be the something to try.

The reason I prefer this is CDP and narrowing become a subset of the same problem: dealing
with a set of PARTID. This function ends up complicated, but its callers all use it in the
same way - and can ignore CDP and the narrowing support is simple. e.g:

--------%<--------
	if (res->using_narrowing) {
		mpam_set_feature(mpam_feat_narrowing, &cfg);
--------%<--------


> +/*
> + * To avoid the reuse of rmid across multiple control groups, check
> + * the incoming closid to prevent rmid from being reallocated by
> + * resctrl_find_free_rmid().
> + *
> + * If the closid and rmid do not match upon inspection, immediately
> + * returns an invalid rmid. A valid rmid must not exceed 24 bits.
> + */

This will cause an out of range set_bit() in add_rmid_to_limbo().
This function must accept the CLOSID/RMID range it advertised to resctrl.

Can you expand on the problem here?


I suspect its because in systems doing this you've accidentally decoupled the
RMID from CLOSID, meaning CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID should be false.

We might want to do this decoupling as part of making this something that resctrl
can trigger dynamically. (e.g. rescrl_arch_grow_closid() that allocates another PARTID
behind the scenes). But this would need resctrl changes - at least to make the above
KConfig something that can be changed at runtime.

I'd prefer we get the static grouping working first, before we work out what needs
changing in resctrl to do it dynamically.


>  u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
>  {
> -	return closid * (mpam_pmg_max + 1) + rmid;
> +	u32 reqpartid = rmid2reqpartid(rmid);
> +	u32 intpartid = req2intpartid(reqpartid);
> +
> +	if (cdp_enabled)
> +		intpartid >>= 1;
> +
> +	if (closid != intpartid)
> +		return U32_MAX;

This will cause out of range accesses. This function must accept the full range
of CLOSID/RMID that were advertised to resctrl. It can't return an error.


> +	return rmid;
>  }
>  
>  void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
>  {
> -	*closid = idx / (mpam_pmg_max + 1);
> -	*rmid = idx % (mpam_pmg_max + 1);
> +	u32 reqpartid = rmid2reqpartid(idx);
> +	u32 intpartid = req2intpartid(reqpartid);
> +
> +	if (rmid)
> +		*rmid = idx;
> +	if (closid) {
> +		if (cdp_enabled)
> +			intpartid >>= 1;
> +		*closid = intpartid;
> +	}
>  }

These idx encode/decode would remain simple if they worked on a mask/shift
that was calculated at setup time. Currently that is all hidden behind
your helpers.

We shouldn't have to deal with CDP in here because the 'idx' is for resctrl's
monitoring code - which can't monitor the two halfs of CDP separately. That's an mpam-ism.


>  void resctrl_arch_sched_in(struct task_struct *tsk)
> @@ -323,21 +368,17 @@ void resctrl_arch_sched_in(struct task_struct *tsk)
>  
>  void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
>  {
> -	WARN_ON_ONCE(closid > U16_MAX);
> -	WARN_ON_ONCE(rmid > U8_MAX);
> +	u32 reqpartid = rmid2reqpartid(rmid);
> +	u8 pmg = rmid2pmg(rmid);
>  
> -	if (!cdp_enabled) {
> -		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
> -	} else {
> +	if (!cdp_enabled)
> +		mpam_set_cpu_defaults(cpu, reqpartid, reqpartid, pmg, pmg);
> +	else
>  		/*
>  		 * When CDP is enabled, resctrl halves the closid range and we
>  		 * use odd/even partid for one closid.
>  		 */
> -		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
> -		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
> -
> -		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
> -	}
> +		mpam_set_cpu_defaults(cpu, reqpartid, reqpartid + 1, pmg, pmg);
>  }

Please don't '+1' the parameters like this. How do we know these are the right way
round? What if resctrl_get_config_index() chagnes which way round they are?

We should try and make the code easy to review and maintain.
Optimising things like this is for the compiler.


I'd like it to be clear from this function that one of the set of PARTID is being
picked. I think this falls out of the (hidden) shifting here, but its not at all
obivious.

You completely discard the PARTID here. I don't think that works if you have multiple
control groups.

[snip]

> @@ -478,6 +518,7 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
>  		      enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
>  {
>  	struct mon_cfg cfg;
> +	u32 reqpartid = rmid2reqpartid(rmid);
>  
>  	if (!mpam_is_enabled())
>  		return -EINVAL;
> @@ -493,8 +534,8 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
>  	cfg = (struct mon_cfg) {
>  		.mon = mon_idx,
>  		.match_pmg = true,
> -		.partid = closid,
> -		.pmg = rmid,
> +		.partid = (cdp_type == CDP_CODE) ? reqpartid + 1 : reqpartid,
> +		.pmg = rmid2pmg(rmid),

Not using the CLOSID here breaks multiple control groups.

>  	};
>  
>  	return mpam_msmon_read(mon_comp, &cfg, mon_type, val);


James


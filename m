Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A03FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZbj1RVHsTRrdxUlANpHJiOGpKQkoUkxJDy+9hMxheI=; b=oVsf8IfBlOK+LYrUH1MScdPl7v
	PIgHgMAgzoULY8IVgVwVmGwyhmAaGhIhJGZgQi0UWNfdTHkmhq76vCiWniaH8RG/lR6+2LbnODF5o
	TUcmyqDtasnry00tKycL8qsYmadEzh9CphpUl8cjSbBjE3LooQZeTBayiiRg1d6o6cn3okJR2lbnM
	GlYPBxoPKyeo+OLGEnGlfzyVzYc+q8xcX5Lk/XC3GXbnF+2LrL4GSNaHWK3Gf1xBH6UaykGoZJDSh
	V+kxmDKy0f1To6QbpR2D9rdyqLgqCqtC4o8sZALC7ipgVV6LNlf7eJYCWSzCFzaTU61zB9QnwxNjH
	qtPbdg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZWT-000000069bh-1AdG;
	Thu, 14 May 2026 17:06:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZWQ-000000069aH-2rpK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:06:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4E933544;
	Thu, 14 May 2026 10:06:47 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E4D23F836;
	Thu, 14 May 2026 10:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778778413; bh=96W3qnxStGY+SaGABufKN0Q7dcunMPRX3gZeJLKjSro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qk0T+mjrq7g7tiXwenYqR1tnu6+zSav2TXCRRDCQFp2ijNNbL5T0B2MAhb8+Gq30P
	 iCEtM7HjGdURZ8QXf7ZXbckB3Ft/HWUblG3LDnoZmFfzZ+hXcV4YEpw0kpcOQpqgF5
	 7HhNDKoMFBCibwzkWW76ksek3z5anZwU6brjQhT8=
Message-ID: <9efc30be-689b-4f42-bef0-d7d62b4392fa@arm.com>
Date: Thu, 14 May 2026 18:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 next 03/10] arm_mpam: Disable reqPARTID expansion when
 Narrow-PARTID is unavailable
To: Zeng Heng <zengheng4@huawei.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com
References: <20260413085405.1166412-1-zengheng4@huawei.com>
 <20260413085405.1166412-4-zengheng4@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260413085405.1166412-4-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_100654_963010_D9788054 
X-CRM114-Status: GOOD (  27.17  )
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
> MPAM supports heterogeneous systems where some type of MSCs may implement
> Narrow-PARTID while others do not. However, when an MSC uses
> percentage-based throttling (non-bitmap partition control) and lacks
> Narrow-PARTID support, resctrl cannot correctly apply control group
> configurations across multiple PARTIDs.
> 
> To enable free assignment of multiple reqPARTIDs to resource control
> groups, all MSCs used by resctrl must either: Implement Narrow-PARTID,
> allowing explicit PARTID remapping, or only have stateless resource
> controls (non-percentage-based), such that splitting a control group
> across multiple PARTIDs does not affect behavior.

I prefer Dave's terminology for this: aliasing and non-aliasing. It implies
there are two controls, which stateless does not.


> The detection occurs at initialization time on the first call to
> get_num_reqpartid() from update_rmid_limits(). This call is guaranteed
> to occur after mpam_resctrl_pick_{mba,caches}() have set up the
> resource classes, ensuring the necessary properties are available
> for the Narrow-PARTID capability check.
> 
> When an MSC with percentage-based control lacks Narrow-PARTID support,
> get_num_reqpartid() falls back to returning the number of intPARTIDs,
> effectively disabling the reqPARTID expansion for monitoring groups.

No MSC has percentage based controls - that's an x86ism. The MSCs have
fixed point fractions, bitmaps or a cost/weight.


I think you're thinking about this the wrong way up - we should only enable
this on a small number of platforms that don't have any controls we'd have to discard.
(hopefully yours is such a platform!)

I don't think this should be added to resctrl_arch_system_num_rmid_idx(). Please make
this decision for resctrl at mpam_resctrl_setup() time.


> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5f4364c8101a..56859f354efa 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -257,9 +257,50 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
>  	return mpam_intpartid_max + 1;
>  }
>  
> +/*
> + * Determine the effective number of PARTIDs available for resctrl.
> + *
> + * This function performs a one-time check to determine if Narrow-PARTID
> + * can be used. It must be called after mpam_resctrl_pick_{mba,caches}()
> + * have initialized the resource classes, as class properties are used
> + * to detect Narrow-PARTID support.

> + * The first call occurs in update_rmid_limits(), ensuring the
> + * prerequisite initialization is complete.

This is fragile to changes in the order resctrl makes these calls. We need these
properties to be fixed before we call resctrl_init().

(yes - I think CDP is fragile too!)


> + */
> +static u32 get_num_reqpartid(void)
> +{
> +	struct mpam_resctrl_res *res;
> +	struct mpam_props *cprops;
> +	static bool first = true;
> +	int rid;
> +
> +	if (first) {
> +		for_each_mpam_resctrl_control(res, rid) {
> +			if (!res->class)
> +				continue;
> +
> +			cprops = &res->class->props;
> +			if (mpam_has_feature(mpam_feat_partid_nrw, cprops))
> +				continue;


> +			if (mpam_has_feature(mpam_feat_mbw_max, cprops) ||
> +			    mpam_has_feature(mpam_feat_mbw_min, cprops) ||
> +			    mpam_has_feature(mpam_feat_cmax_cmax, cprops) ||
> +			    mpam_has_feature(mpam_feat_cmax_cmin, cprops)) {

Please make this a helper in mpam_internal.h with 'controls' and 'aliasing' in its name.
(maybe has_aliasing_controls()).

What about the priority for PRI and the proportional-stride?

I don't think proportional-stride aliases properly: if I have groups with stride 1 and 2,
I can't add a second '2' without decreasing the first groups stride from 1/3 to 1/5. If I
halve the second groups, they each get half the bandwidth instead of sharing it.

Can you check whether the priority for PRI aliases?


> +				mpam_partid_max = mpam_intpartid_max;
> +				break;
> +			}
> +		}
> +	}
> +
> +	first = false;
> +	return mpam_partid_max + 1;
> +}
> +
>  u32 resctrl_arch_system_num_rmid_idx(void)
>  {
> -	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
> +	return (mpam_pmg_max + 1) * get_num_reqpartid();
>  }


Thanks,

James


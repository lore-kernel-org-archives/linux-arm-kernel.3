Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA93E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFJm1Ubswmjr+LtNyOndYpbZ8o1/mQs5jUOiE4XIwOk=; b=kSfGd4ePs3yEIL/K6U2vCXcC8u
	PyauuS7k8Gro3ysqa9WmqYbGWvxDQc2pr4Pu3ywbM8t5oQKOSLlCuTZ27OtTpQGevaZ+JJSUURl1p
	gEqL6IQf6j3txV2Q79z2z7Pn4vBNTWWcbhVjPX0dHuTWgMfWWLXMth8rsGhZcQ0bK2SD1PaC6A5WH
	fsy2TODf6wIsbjQYUAWWwuNlX6zeoGIcyUl+b2ex8TKhojFlxhOEWayTAeEyeZUz3rcS15eCN3+W1
	1EPkwzBk+cvw9Un+vUDl8kgK6pfVwuc2gnfv6J1XH7vJA9/s/XBD+p/3G0Qgz0FYarlU01vhlqVf2
	aKLmZCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmmx-000000018o9-3LA3;
	Thu, 12 Dec 2024 17:15:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlty-00000000wNx-1lOH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F3F01762;
	Thu, 12 Dec 2024 08:19:25 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3235F3F720;
	Thu, 12 Dec 2024 08:18:56 -0800 (PST)
Date: Thu, 12 Dec 2024 16:18:53 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	xiexiuqi@huawei.com
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 4/5] arm_mpam:
 Automatically synchronize the configuration of all sub-monitoring groups
Message-ID: <Z1sM7TMK+BHQEwgI@e133380.arm.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-5-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207092136.2488426-5-zengheng4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081858_550659_65F448E0 
X-CRM114-Status: GOOD (  23.28  )
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

On Sat, Dec 07, 2024 at 05:21:35PM +0800, Zeng Heng wrote:
> After the system expands the narrow-partid feature and statically assigns
> all (req)PARTIDs to each control group, the following scenarios require
> configuration synchronization operations:
> 
>   1. MSCs that support narrow-partid need to establish a mapping between
>      reqPARTID and intPARTID after creating a new monitoring group.
>   2. MSCs that do not support narrow-partid need to synchronize the
>      configuration of sub-monitoring groups after users update the control
>      group configuration.
> 
> In __write_config(), we synchronize a control group's configuration to each
> sub-monitoring group.
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  drivers/platform/arm64/mpam/mpam_devices.c  | 25 ++++++++++++++++++---
>  drivers/platform/arm64/mpam/mpam_internal.h |  3 +++
>  drivers/platform/arm64/mpam/mpam_resctrl.c  | 10 ++++++++-
>  3 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
> index 781c9146718d..91c5849f76e3 100644
> --- a/drivers/platform/arm64/mpam/mpam_devices.c
> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
> @@ -1544,6 +1544,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  	u32 pri_val = 0;
>  	u16 cmax = MPAMCFG_CMAX_CMAX;
>  	u16 bwa_fract = MPAMCFG_MBW_MAX_MAX;
> +	u16 intpartid = req2intpartid(partid);
>  	struct mpam_msc *msc = ris->vmsc->msc;
>  	struct mpam_props *rprops = &ris->props;
>  	u16 dspri = GENMASK(rprops->dspri_wd, 0);
> @@ -1554,8 +1555,14 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  
>  	if (mpam_has_feature(mpam_feat_partid_nrw, rprops)) {
>  		mpam_write_partsel_reg(msc, INTPARTID,
> -				       MPAMCFG_INTPARTID_INTERNAL | partid);
> -		__mpam_intpart_sel(ris->ris_idx, partid, msc);
> +				       MPAMCFG_INTPARTID_INTERNAL |
> +				       intpartid);
> +
> +		/* Already finish mapping reqPARTID to intPARTID */
> +		if (partid != intpartid)
> +			goto out;
> +
> +		__mpam_intpart_sel(ris->ris_idx, intpartid, msc);
>  	}
>  
>  	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {

[...]

> @@ -3072,9 +3080,20 @@ struct mpam_write_config_arg {
>  
>  static int __write_config(void *arg)
>  {
> +	int closid_num = resctrl_arch_get_num_closid(NULL);
>  	struct mpam_write_config_arg *c = arg;
> +	u32 reqpartid, req_idx;
> +
> +	WARN_ON(c->partid >= closid_num);
>  
> -	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
> +	/* Synchronize the configuration to each sub-monitoring group. */
> +	for (req_idx = 0; req_idx < get_num_reqpartid_per_closid();
> +	     req_idx++) {
> +		reqpartid = req_idx * closid_num + c->partid;
> +
> +		mpam_reprogram_ris_partid(c->ris, reqpartid,
> +					 &c->comp->cfg[c->partid]);
> +	}
>  
>  	return 0;
>  }

I haven't decided whether this iteration belongs here or in
mpam_resctrl.c.

Your approach looks like it should work; I do it in
resctrl_arch_update_one() instead [1], but I think the approaches are
pretty much equivalent -- but let me know if you have any thoughts on
it.

[...]

Cheers
---Dave


[1] [RFC PATCH 4/6] arm_mpam: Introduce flexible CLOSID/RMID translation
https://lore.kernel.org/lkml/20241212154000.330467-5-Dave.Martin@arm.com/


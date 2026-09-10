Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A39C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDPzwY2NdLzoJImbXz0vGW7B4amstayS32YAA47E5/Q=; b=J49mr3PsLh+IBl/+dpECEnzfWG
	lW+l4Qh8EDwza7VbL7PERTX5gDtnjcvg/Gyp3QkLpdTtAVRS25TutNyFEz4Ipjih4f3RvGN8zDv8J
	flJopOgy/4nJS7qbnvKimOxoUfYNfivrLgv8Eo1qn3onWkTuyYkRhSqadG9e4/dWO9QLJXL0b0PwI
	4cXR4V7j5J/n467Z8D+yLFTtGnc+kb3MbPy4B2izttf7KOygz4Slx2NZ7f8WC1AtXqFuj4/MtIHvt
	eki/q05E+2koNRs1jfIB8/4RNTZ1oBtv/0iOdhHJ5oOxFwvDxmB0AD9zEbb+dZ9bqkZHhJxd1uH1x
	aPM/5fXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e25-0000000EM1y-2AOu;
	Thu, 10 Sep 2026 12:37:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e21-0000000EM0g-3Una
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:37:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4596F153B;
	Thu, 10 Sep 2026 05:37:28 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 034B03F7B4;
	Thu, 10 Sep 2026 05:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789043851; bh=AZwDqHdBjqPCn/h9+VhDsgEtjNFCuMURPnIg3aiP66c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=glwg5KbI4A+6EtBbJdGrMmvmGDTyxTKM5xkPl2GjCRh4g6oOCojo0tG6Nvp/BsP5W
	 ppBt0z61poix3LIUOZVeyM697EZsNnDjwOJ4hujDmg4WZboVhhieMDl1ggKOj7h5At
	 vee/0D7kRuE8CZtW0DhOab3JKWwY/k4PBXOl3d3o=
Message-ID: <fca383e2-56bf-4c93-bd07-bc54a79235a3@arm.com>
Date: Thu, 10 Sep 2026 13:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM
 configurations
To: Shouping Wang <allen.wang@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <2fb3bda7-cd64-4dc0-99f8-c0fda8d42cf9@arm.com>
 <20260910114601.165237-1-allen.wang@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260910114601.165237-1-allen.wang@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_053733_958120_EAE0724D 
X-CRM114-Status: GOOD (  19.48  )
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

On 10/09/2026 12:46 pm, Shouping Wang wrote:
> When MXP_MULTIPLE_DTM_EN is TRUE, each DTM will monitor at most
> two device ports. In this case, {wp_dev_sel2, wp_dev_sel} will
> only use values 2'b00 and 2'b01 per DTM.

Poor documentation strikes again!

> Previously the setting allowed values beyond the supported range
> per DTM, which could cause each DTM to select invalid ports when
> MXP_MULTIPLE_DTM_EN is TRUE.
> 
> Fix this by only setting CMN_DTM_WPn_CONFIG_WP_DEV_SEL2 when
> !multi_dtm.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks for the fix!
Robin.

> Fixes: 60d1504070c2 ("perf/arm-cmn: Support new IP features")
> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
> ---
> 
> Changes in v2:
> - Made the setting of CMN_DTM_WPn_CONFIG_WP_DEV_SEL2 conditional on
>    !multi_dtm, instead of clamping with dev %= 2.
> - Refactored is_cmn600 to use cmn->part directly.
> - Updated the commit message.
> 
> Link to v1: https://lore.kernel.org/lkml/20260819105443.668784-1-allen.wang@hj-micro.com/
> 
>   drivers/perf/arm-cmn.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 6e5cc4086a9e..7e7590381171 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -1393,13 +1393,14 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
>   
>   static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>   {
> +	struct arm_cmn *cmn = to_cmn(event->pmu);
>   	u32 config;
>   	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
>   	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
>   	u32 grp = CMN_EVENT_WP_GRP(event);
>   	u32 exc = CMN_EVENT_WP_EXCLUSIVE(event);
>   	u32 combine = CMN_EVENT_WP_COMBINE(event);
> -	bool is_cmn600 = to_cmn(event->pmu)->part == PART_CMN600;
> +	bool is_cmn600 = cmn->part == PART_CMN600;
>   
>   	/* CMN-600 supports only primary and secondary matching groups */
>   	if (is_cmn600)
> @@ -1407,8 +1408,11 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>   
>   	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
> -		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |
> -		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL2, dev >> 1);
> +		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp);
> +
> +	if (!cmn->multi_dtm)
> +		config |= FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL2, dev >> 1);
> +
>   	if (exc)
>   		config |= is_cmn600 ? CMN600_WPn_CONFIG_WP_EXCLUSIVE :
>   				      CMN_DTM_WPn_CONFIG_WP_EXCLUSIVE;



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD59C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGmK77S4D/IfuRIxQKbfyFsjI/UkBaPPtw6Up8lYV2A=; b=XFpOyJ5+tBz9sAXYHsP+aFC6Df
	RHoqJSDrMbNXRgqcxEkSjOuCfhTvmKr02HWvKxEXNXUngkb6CjilsuiHijzIkBooE0Qvkcm8Bv52q
	NT3gGL+XwSDBZ7rSgIMLlcU7Ce3hKeWJtDKoR7SjSLQ81Gl2zIwCRNonomPbTn+U4+Xcec0jNLSYv
	ZBgvgyi9cC/zyaDnAyJp3cvZZvimSQ9YCuDyFpZLXZ8WNf+FNr8sMDodi+i9Axbbv12BD+wu9u3pY
	xp09a3YQM0y+GsvM/N7d6UbvZQPmVm1tofVsHRgWgtOwWnhua90exLTqpZ12tFiOOkM0BE+SZPr7I
	lIBalK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4L0z-0000000CHyJ-33X2;
	Wed, 09 Sep 2026 16:19:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4L0t-0000000CHxA-3QZv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:19:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAB2D1570;
	Wed,  9 Sep 2026 09:19:00 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 704AD3F7B4;
	Wed,  9 Sep 2026 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788970744; bh=sNl01wYfVmtWRGiTAfaWvA0bgs2vxHpkcP2rJB+nGPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nKVXyx90ODUZ0WIJfhwgNyVL6A/WyzuXJXV+JFGdEEu7jWfbfBQg0XSKTzdofE5w/
	 MnrJypXMSSS4iCWhf98F9Dk4drRXNiMg15RPj72U8kcVnlV/8IYGzcC5VNas02aFCK
	 i4wxJOrZEeK1Fja4zWiTwRiqbI1uFZG+/8HWojR8=
Message-ID: <2fb3bda7-cd64-4dc0-99f8-c0fda8d42cf9@arm.com>
Date: Wed, 9 Sep 2026 17:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to
 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
To: Shouping Wang <allen.wang@hj-micro.com>, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <20260819105443.668784-1-allen.wang@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260819105443.668784-1-allen.wang@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_091907_904794_5F080066 
X-CRM114-Status: GOOD (  18.01  )
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

On 19/08/2026 11:54 am, Shouping Wang wrote:
> When MXP_MULTIPLE_DTM_EN is TRUE, each DTM will monitor at most
> two device ports. In this case, {wp_dev_sel2, wp_dev_sel} will
> only use values 2'b00 and 2'b01 per DTM.
> 
> Previously the setting allowed values beyond the supported range
> per DTM, which could cause each DTM to select invalid ports when
> MXP_MULTIPLE_DTM_EN is TRUE.
> 
> Fix this by applying `dev %= 2` to clamp the selection value to
> the valid range when MXP_MULTIPLE_DTM_EN is TRUE.
> 
> Fixes: 60d1504070c2 ("perf/arm-cmn: Support new IP features")
> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
> ---
>   drivers/perf/arm-cmn.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 40c05c519a1d..13ccbf2a7345 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -1392,6 +1392,7 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
>   
>   static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>   {
> +	struct arm_cmn *cmn = to_cmn(event->pmu);

Nit: may as well refactor the is_cmn600 condition to reference cmn->part 
directly too.

>   	u32 config;
>   	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
>   	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
> @@ -1404,6 +1405,9 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>   	if (is_cmn600)
>   		grp &= 1;
>   
> +	if (cmn->multi_dtm)
> +		dev %=  2;
> +

Let's just make the whole setting of CMN_DTM_WPn_CONFIG_WP_DEV_SEL2 
conditional on !multi_dtm, like for exclusive and combine further down 
(note that the CMN-600 "grp &= 1" is different, since that's more about 
sanitising invalid input values rather than the register encoding itself.)

Thanks,
Robin.

>   	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |



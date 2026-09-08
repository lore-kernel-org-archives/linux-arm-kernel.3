Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44940C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HodnylibrZqGPAki3DhMLi+kPd5I6p19FhJfJww+nnc=; b=oNW/T0Q7tAzlOV1cYK7w++1tA6
	jeYfaKe2SOLm1OhxjrIBNxNprn8STJIT50SRqazjUTgSOYFgoJXIjGSSjH2zlUsDSizhCSaYH88Db
	Cehs8y7yQMMZXiJbkLMRHC1G+citar9mbNMfkfljZ/W5rRllTgwRNcwXjbY6UoxTMpFzvotuudNe4
	0X1VuxGOyiolUSYwfJtMebKA50t0Ea8KkMuSiz51k+AbK9sIGMZxNGEfklQha1JtBppqF48e9SKLO
	UKq+dNzRSMmo0BrId90EDYuPMYcNtwNbvHoQdct2ZnbvydRwAYMzwh1+uQohHOCk67GOHz8svwTR4
	unEmuOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3r4L-00000008NS4-0Pn8;
	Tue, 08 Sep 2026 08:20:41 +0000
Received: from mail-m19731115.qiye.163.com ([220.197.31.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3r4E-00000008NQT-14zO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:20:37 +0000
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cf30c434;
	Tue, 8 Sep 2026 16:15:15 +0800 (GMT+08:00)
Message-ID: <f97fa5ae-3535-4e1a-a164-77138a93cc89@hj-micro.com>
Date: Tue, 8 Sep 2026 16:15:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to
 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
To: will@kernel.org, robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peter.du@hj-micro.com, andy.xu@hj-micro.com,
 allen.wang@hj-micro.com
References: <20260819105443.668784-1-allen.wang@hj-micro.com>
Content-Language: en-US
From: "allen.wang" <allen.wang@hj-micro.com>
In-Reply-To: <20260819105443.668784-1-allen.wang@hj-micro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa08015ea9009d8kunmfb7445f2344b93
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUIYVk9MGUIaSx5PHR0ZGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=AkdnegVYqDHiMZ5MObs6s/Wj5cJxR1D0LLQy0bRB+QuK+ZNrzqXA15I66PsSqwv9guPEaB1m+7qRXfqp4k5atrNe6OIxn1S8n+VlnV4R8bwSmG1i8vdzh8383Qr8KHu6CWcoMfHNIE8NrqG+UGlJzwC9h/c8IqCb1aYfmWzofUI=; c=relaxed/relaxed; s=default; d=hj-micro.com; v=1;
	bh=HodnylibrZqGPAki3DhMLi+kPd5I6p19FhJfJww+nnc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_012034_937159_DAC341D2 
X-CRM114-Status: GOOD (  15.73  )
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

Gentle ping on this patch.

Could someone please review it when time permits?

Thanks!
Allen

On 8/19/2026 6:54 PM, Shouping Wang wrote:
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
>  drivers/perf/arm-cmn.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 40c05c519a1d..13ccbf2a7345 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -1392,6 +1392,7 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
>  
>  static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>  {
> +	struct arm_cmn *cmn = to_cmn(event->pmu);
>  	u32 config;
>  	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
>  	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
> @@ -1404,6 +1405,9 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>  	if (is_cmn600)
>  		grp &= 1;
>  
> +	if (cmn->multi_dtm)
> +		dev %=  2;
> +
>  	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
>  		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
>  		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |



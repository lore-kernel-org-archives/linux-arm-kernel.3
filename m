Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4A0C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxaBfVHLUNoTQb8d3rwW2/o4bzgIrj9z/c5dVsMLQ/A=; b=wR7piAVMIZgSUmTbqcOeAPpj2G
	q3SHCwb0aTR0/pDtI778n6YGJ9YmJ/VM/gcTxARa/8g7oSlr3bexczjoWHtViNQtoziWnIoGWb0Ep
	2lN2ve0Eed/3sc4pEP14MPPt6bCHo0FsdC8ErtxG/XatbugoR8Mn48pK5DEX786ubKu8oEm5pbS/l
	iPD7sMgG3TAu/8xXNBo72Kav2ajWTlKx9p2lae/6u3gleUnp+jxlRpyQGY36YQIQZCbtE1SurhRC+
	spaxWn9lAoCMgQfE8aWVklxVSq/ZOqBAziQqAEqSIXAgCnA4xdfb2mYWYYMhNRhyLRN5HbocGSHkK
	y7+L1jOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xNm-00000009P4n-2XkR;
	Tue, 08 Sep 2026 15:05:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xNg-00000009P4G-2Xp6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:05:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 209781476;
	Tue,  8 Sep 2026 08:04:57 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB0A93F7B4;
	Tue,  8 Sep 2026 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788879900; bh=gqKpoVXrQFH4KOv6IUgmKs/r5/Mr4uEZZHx6oJP+fo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OwuSUGgkh1ci2w4cPfRT3NKJhl8/g9f/5KML0M7eNCBh0F4jRsx9TkSWXINpLU49p
	 UdvnH1j0XeF5BbaZ9+vK16Q+RGmqEA1tikEW7Z/aWLqd4j1WJ2x2XbgIF5Ru2hfqKj
	 l+C9VT2oxCrxtO2JUnmThizWFfgvgAlBBnpdldgs=
Message-ID: <58adffd2-6ef4-4a4c-ba3a-3f510522d928@arm.com>
Date: Tue, 8 Sep 2026 16:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to
 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
To: "allen.wang" <allen.wang@hj-micro.com>, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <20260819105443.668784-1-allen.wang@hj-micro.com>
 <f97fa5ae-3535-4e1a-a164-77138a93cc89@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <f97fa5ae-3535-4e1a-a164-77138a93cc89@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_080504_694085_BE745307 
X-CRM114-Status: GOOD (  17.78  )
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

On 08/09/2026 9:15 am, allen.wang wrote:
> Hi,
> 
> Gentle ping on this patch.
> 
> Could someone please review it when time permits?
> 
> Thanks!
> Allen
> 
> On 8/19/2026 6:54 PM, Shouping Wang wrote:
>> When MXP_MULTIPLE_DTM_EN is TRUE, each DTM will monitor at most
>> two device ports. In this case, {wp_dev_sel2, wp_dev_sel} will
>> only use values 2'b00 and 2'b01 per DTM.

Hmm, I read the "each DTM will only use..." wording[1] as implying that 
the hardware itself would ignore wp_dev_sel2 (especially since that 
would seem to be the obvious thing to do) - are you saying that that 
isn't the case? (I've never had access to any actual multi-DTM hardware...)

Thanks,
Robin.

[1] 
https://support.arm.com/documentation/102308/0307/Debug-trace-and-PMU/Debug-Trace-system-overview/DTM-watchpoint?lang=en

>> Previously the setting allowed values beyond the supported range
>> per DTM, which could cause each DTM to select invalid ports when
>> MXP_MULTIPLE_DTM_EN is TRUE.
>>
>> Fix this by applying `dev %= 2` to clamp the selection value to
>> the valid range when MXP_MULTIPLE_DTM_EN is TRUE.
>>
>> Fixes: 60d1504070c2 ("perf/arm-cmn: Support new IP features")
>> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
>> ---
>>   drivers/perf/arm-cmn.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
>> index 40c05c519a1d..13ccbf2a7345 100644
>> --- a/drivers/perf/arm-cmn.c
>> +++ b/drivers/perf/arm-cmn.c
>> @@ -1392,6 +1392,7 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
>>   
>>   static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>>   {
>> +	struct arm_cmn *cmn = to_cmn(event->pmu);
>>   	u32 config;
>>   	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
>>   	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
>> @@ -1404,6 +1405,9 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>>   	if (is_cmn600)
>>   		grp &= 1;
>>   
>> +	if (cmn->multi_dtm)
>> +		dev %=  2;
>> +
>>   	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
>>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
>>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |
> 



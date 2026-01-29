Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF02D6101A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXNz48ErS4VkHSIsHgHCczlXRgDQbWuwWUUMeOs+Q0E=; b=wDT+JOpPVo6wvQHZn8U2Uhw8tf
	JYY1H2FHK6zxwYL6jySATMQsGBzkugyezQPkUxwbC3mWxZzUW1Et4mU6JRyZDExopJMd/o5zkSRRj
	9SdpVUhiVge9QVcdFgJpOZXtCtaNpRIb+hLLXZidbFjeohfLB/T+vgDEvbvxVqSbHU7eBjq2jPkFX
	8y3S4e1dysysnFpL5wPq0nZ3W5dOFpF/snne7pyuA+eTwbCUUK1hfQfrt0a74cukOeIu23iUIj3/Y
	flY1dkaEAdM5/RYIF5afZVevP/wpaUzhnWQ67b3s0I6mg6Zt+zcWTIBuqnyOnNdiYsB14TT4xjeq3
	R1ChcwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTma-00000000GVo-0PXZ;
	Thu, 29 Jan 2026 15:18:08 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTmX-00000000GVO-3ee9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:18:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EXNz48ErS4VkHSIsHgHCczlXRgDQbWuwWUUMeOs+Q0E=;
	b=5/8OjsDa/M2L06sMM0NM/ms1B4k90W2Y8xdF/yWwV8jMdl9NQew+aL9eGNxedEDJJ75mwTcvs
	Vz2Yh+T4i3z1G2X3Ne7qZyWepVKG8mkWrRWNT/3Au9x4WmOjiXCJMBEsn9AmEz/DJLCuPddtytE
	dXfGyGAUHPkVeqOMpEt1i3w=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f22jT3Kp0znTVy;
	Thu, 29 Jan 2026 23:14:05 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id A25F240539;
	Thu, 29 Jan 2026 23:17:58 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Jan 2026 23:17:58 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 29 Jan 2026 23:17:47 +0800
Message-ID: <734d6c88-1065-473a-80bb-31b0a2defd7f@huawei.com>
Date: Thu, 29 Jan 2026 23:17:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 2/7] perf stat: Save unnecessary print_metric() call
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <peterz@infradead.org>,
	<john.g.garry@oracle.com>, <shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
 <20260126123514.3238425-3-wangyushan12@huawei.com>
 <20260127160118.00001692@huawei.com>
Content-Language: en-US
From: wangyushan <wangyushan12@huawei.com>
In-Reply-To: <20260127160118.00001692@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_071806_236631_AB5C599F 
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



On 1/28/2026 12:01 AM, Jonathan Cameron wrote:
> On Mon, 26 Jan 2026 20:35:09 +0800
> Yushan Wang <wangyushan12@huawei.com> wrote:
>
>> Patch [1] removed the second branch of iostat_run, and changed num to 0
>> since it is the default behavior. But during iostat_run, default value 1
>> of num is required to avoid print_metric() call later.
>>
>> Set num as 1 to avoid redundant print_metric() call that causes
>> unaligned blank printed.
>>
>> Fixes: b71f46a6a708 ("perf stat: Remove hard coded shadow metrics")
>>
>> [1]: https://lore.kernel.org/all/20251111212206.631711-8-irogers@google.com/
> Use a Link tag for links, but don't add them when they just point to the patch
> you already have as a fixes tag.  Just refer to it as "The patch listed under
> Fixes".

Yes, I will fix that in the next version, thanks for pointing out.

Yushan

>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>> ---
>>  tools/perf/util/stat-shadow.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
>> index 9c83f7d96caa..9439baf8002f 100644
>> --- a/tools/perf/util/stat-shadow.c
>> +++ b/tools/perf/util/stat-shadow.c
>> @@ -319,8 +319,10 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
>>  	void *ctxp = out->ctx;
>>  	int num = 0;
>>  
>> -	if (config->iostat_run)
>> +	if (config->iostat_run) {
>>  		iostat_print_metric(config, evsel, out);
>> +		num = 1;
>> +	}
>>  
>>  	perf_stat__print_shadow_stats_metricgroup(config, evsel, aggr_idx,
>>  						  &num, NULL, out);



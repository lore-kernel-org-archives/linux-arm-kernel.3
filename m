Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECEAC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjEaQPolBs9hP9oTl8saVrilietuPbZ4nXibpbsmGtc=; b=ZmAoH4Sfppi+HtAQ8pDTLCw23F
	Zz4Mgmn9c2ipxiezSo069A5wEhw007r6YKlK13/JTokJUgFvuLqyWDcpmIru+RAsJZ+VledxBog7/
	ccptc30rhCqR/CXWdh+wYxFmb3w6vtBf3jz/IGhuaGen1v2gdFL7Fk9zl2LxPExNx4ga1WqVXKBZw
	UMahbezo72CyTmYun/6LSTY13H1ViKuB8HRKGOsI35z6oXJZcOG9IGvZeSBjZTSM9KS62pC7jaAJQ
	slZc4Q/pmo/6MJotAq1TpWDrjmt54tgacxohvCMojz4NmbtOgTQbmj+mPPt0uI2BQysedChwNoavA
	Dw78bKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNge-00000005wqD-3j9a;
	Mon, 13 Jan 2025 16:53:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNcj-00000005w8c-0CcB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 16:49:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56F0A12FC;
	Mon, 13 Jan 2025 08:49:34 -0800 (PST)
Received: from [10.57.35.117] (unknown [10.57.35.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DDE4B3F673;
	Mon, 13 Jan 2025 08:49:04 -0800 (PST)
Message-ID: <b5ee243c-5122-4476-8978-0454b54283d8@arm.com>
Date: Mon, 13 Jan 2025 16:49:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: catu: Fix number of pages while using 64k
 pages
Content-Language: en-GB
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250109215348.5483-1-ilkka@os.amperecomputing.com>
 <7fa2c7c2-0bbf-4d45-bc90-71c4a4a82c0c@arm.com>
 <6d6128d4-778f-fc9c-651b-53de199d023@os.amperecomputing.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <6d6128d4-778f-fc9c-651b-53de199d023@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_084909_128013_B1C9FAE9 
X-CRM114-Status: GOOD (  15.19  )
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

On 10/01/2025 21:32, Ilkka Koskinen wrote:
> 
> Hi Suzuko,
> 
> On Fri, 10 Jan 2025, Suzuki K Poulose wrote:
>> On 09/01/2025 21:53, Ilkka Koskinen wrote:
>>> Trying to record a trace on kernel with 64k pages resulted in -ENOMEM.
>>> This happens due to a bug in calculating the number of table pages, 
>>> which
>>> returns zero. Fix the issue by rounding up.
>>>
>>> $ perf record --kcore -e cs_etm/@tmc_etr55,cycacc,branch_broadcast/k 
>>> --per-thread taskset --cpu-list 1 dd if=/dev/zero of=/dev/null
>>> failed to mmap with 12 (Cannot allocate memory)
>>>
>>
>> Needs a Fixes tag.
>>
>> Fixes : 8ed536b1e283 ("coresight: catu: Add support for scatter gather 
>> tables")
> 
> That's a good point
> 
>>
>>> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-catu.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/ 
>>> hwtracing/coresight/coresight-catu.c
>>> index 275cc0d9f505..3378bb77e6b4 100644
>>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>>> @@ -269,7 +269,7 @@ catu_init_sg_table(struct device *catu_dev, int 
>>> node,
>>>        * Each table can address upto 1MB and we can have
>>>        * CATU_PAGES_PER_SYSPAGE tables in a system page.
>>>        */
>>> -    nr_tpages = DIV_ROUND_UP(size, SZ_1M) / CATU_PAGES_PER_SYSPAGE;
>>> +    nr_tpages = DIV_ROUND_UP(size, CATU_PAGES_PER_SYSPAGE * SZ_1M);
>>>       catu_table = tmc_alloc_sg_table(catu_dev, node, nr_tpages,
>>>                       size >> PAGE_SHIFT, pages);
>>>       if (IS_ERR(catu_table))
>>
>> Looks good to me, I will queue this later for v6.15.
>>
>> Suzuki
> 
> Sounds great. Just to confirm, are you ok to add the fixes line or would 
> you prefer me to submit v2 with it?

No, not required. I have picked this up for v6.15, and will push it out
once v6.14-rc is out.

Suzuki


> 
> Cheers, Ilkka



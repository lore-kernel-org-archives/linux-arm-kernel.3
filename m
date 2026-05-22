Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACFACD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAny/y1leqixPqizZ1o88Ew80MmzS/C4htDKPxrZPY8=; b=ZV2sd5QffWTmfCkjKzOzIx2goe
	7BP1ZF7VcGUSrZXhaj3w3CmOHC4e8ICbixc5BaWQ6mht5KMOp8uhq3zJ29mq/Fh0qLeQ8cvO8kfvk
	EDhcLWWHKnM/AjbR5I+1491pFp4Qoc48msgcYtDX6VSNC6ENOCvy6yec26bXbTaR0LX2klBMk/JqW
	famFqwAZpYkiGrIxaKbKmRcjHO0QPYjni6EnjZOumSaJwHtBRbyTTly02iZShp/04Q+KI0SUruJyv
	lAi1sZwGB7dRmSCYSDPYRuGWz4alDgucQhdc2toAJXfreCq6Ce55ldNAH4QQ988uxIDy4KzRe0w8A
	jg2Rgjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMnO-0000000ARVZ-3m4G;
	Fri, 22 May 2026 10:07:58 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMnL-0000000ARUL-0CQy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:07:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gMLY12fcdzYQvFq
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 18:07:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 002924056F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 18:07:48 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP4 (Coremail) with SMTP id gCh0CgC3f1vyKhBqWzbfDA--.57367S3;
	Fri, 22 May 2026 18:07:48 +0800 (CST)
Message-ID: <23e39288-bbb7-d0d7-92b1-30c98c4f98ad@huaweicloud.com>
Date: Fri, 22 May 2026 18:07:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 next 02/10] arm_mpam: Add intPARTID and reqPARTID
 support for Narrow-PARTID feature
Content-Language: en-US
To: James Morse <james.morse@arm.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
 zengheng4@huawei.com
References: <20260413085405.1166412-1-zengheng4@huawei.com>
 <20260413085405.1166412-3-zengheng4@huawei.com>
 <763d19a5-9b1a-4243-a7d7-9484c42c32c7@arm.com>
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <763d19a5-9b1a-4243-a7d7-9484c42c32c7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgC3f1vyKhBqWzbfDA--.57367S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XF1kKr1ruF1UAFWkKFy3urg_yoW7WF1DpF
	WUK3WUKF4kJF4j9as7K3W0qF1S934fJas8Gwn5Jr97Cwn8ZasagFyxtayFqFs5Gr47XF1Y
	qr4jq3W5CFWjvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1F6r1fM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUxo7KDUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030755_464295_7FE821CF 
X-CRM114-Status: GOOD (  37.71  )
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

Hi James,


On 2026/5/15 1:06, James Morse wrote:
> Hi Zeng,
> 
> On 13/04/2026 09:53, Zeng Heng wrote:
>> Introduce Narrow-PARTID (partid_nrw) feature support, which enables
>> many-to-one mapping of request PARTIDs (reqPARTID) to internal PARTIDs
>> (intPARTID). This expands monitoring capability by allowing a single
>> control group to track more task types through multiple reqPARTIDs
>> per intPARTID, bypassing the PMG limit in some extent.
>>
>> intPARTID: Internal PARTID used for control group configuration.
>> Configurations are synchronized to all reqPARTIDs mapped to the same
>> intPARTID. Count is indicated by MPAMF_PARTID_NRW_IDR.INTPARTID_MAX, or
>> defaults to PARTID count if Narrow-PARTID is unsupported.
>>
>> reqPARTID: Request PARTID used to expand monitoring groups. Enables
>> a single control group to monitor more task types by multiple reqPARTIDs
>> within one intPARTID, overcoming the PMG count limitation.
>>
>> For systems with homogeneous MSCs (all supporting Narrow-PARTID), the
>> driver exposes the full reqPARTID range directly. For heterogeneous
>> systems where some MSCs lack Narrow-PARTID support, the driver utilizes
>> PARTIDs beyond the intPARTID range as reqPARTIDs to expand monitoring
>> capacity.
>>
>> So, the numbers of control group and monitoring group are calculated as:
>>
>>    n = min(intPARTID, PARTID)  /* the number of control groups */
>>    l = min(reqPARTID, PARTID)  /* the number of monitoring groups */
>>    m = l // n                  /* monitoring groups per control group */
>>
>> Where:
>>
>>    intPARTID: intPARTIDs on Narrow-PARTID-capable MSCs
>>    reqPARTID: reqPARTIDs on Narrow-PARTID-capable MSCs
>>    PARTID:    PARTIDs on non-Narrow-PARTID-capable MSCs
>>
>> Example: L3 cache (256 PARTIDs, without Narrow-PARTID feature) +
>>           MATA (32 intPARTIDs, 256 reqPARTIDs):
>>
>>    n = min( 32, 256) =  32 intPARTIDs
>>    l = min(256, 256) = 256 reqPARTIDs
>>    m = 256 / 32 = 8 reqPARTIDs per intPARTID
>>
>> Implementation notes:
>>    * Handle mixed MSC systems (some support Narrow-PARTID, some don't) by
>>      taking minimum number of intPARTIDs across all MSCs.
>>    * resctrl_arch_get_num_closid() now returns the number of intPARTIDs
>>      (was PARTID).
> 
> What you're doing here is making intPARTID the fundamental unit in MPAM. I
> don't think we should do this as its not true in the architecture: narrowing
> is a single, optional feature. We have platforms that don't support narrowing
> at all - so having to think in terms of "what is the intPARTID limit on this
> platform that doesn't have the feature" is confusing.
> Narrowing doesn't affect the monitoring, so you can't just string-replace the
> driver.
> 
> The resctrl glue code is going to have to know about narrowing as it must
> either duplicate the control values for aliasing PARTID, or remap them using
> narrowing.
> 
> I'd prefer it if the mpam_devices code exposed an API to make use of narrowing
> that makes sense given the MPAM architecture. (e.g. narrowing is optional!)
> Whetever resctrl needs should then be built on top of that.
> 
> 
> Currently the MAX PARTID/PMG are dealt with separately as we need a global value
> at the end. It was done separately as it could be a patch on its own, to try and
> keep each patch reviewable.
> But it should probably have been dealt with the same way we deal with all MSC
> features - stash them in struct mpam_msc_ris at hw_probe time, and combine them
> up to the class level handling different values with __props_mismatch().
> The global state that includes the requestors can be created after that point.
> 
> I think we should do this now to add intpartid_max to struct mpam_props so that the
> resctrl glue code can find the intpartid_max per class. I don't think it makes sense as
> a global property. (we should move partid_max and pmg_max at the same time)
> 
> ... I think moving partid_max would just be cleanup. The resctrl glue code needs to
> know the maximum PARTID for monitoring, but I think this would always be the global
> PARTID max value.
> 

I'll have a try to look into refactoring the existing code along the
lines you've suggested.


> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 41b14344b16f..cf067bf5092e 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -63,6 +63,7 @@ static DEFINE_MUTEX(mpam_cpuhp_state_lock);
>>    * Generating traffic outside this range will result in screaming interrupts.
>>    */
>>   u16 mpam_partid_max;
>> +u16 mpam_intpartid_max;
>>   u8 mpam_pmg_max;
>>   static bool partid_max_init, partid_max_published;
>>   static DEFINE_SPINLOCK(partid_max_lock);
> 
> The global properties are supposed to mean "if you generate any traffic outside
> this range, you'll get an out of range error causing mpam_disable()".
> 
> This doesn't hold for intPARTID.
> 
> In my hypothetical system from the cover letter: {
>    64 PARTID at the L3
>    64 PARTID and narrowing to 16 at the SLC
>    64 PARTID and narrowing to 32 at the memory-controller
> 
>    The resctrl glue code could ignore the SLC if it wanted to use 32 PARTID, and just
>    duplicate the aliasing controls at L3. (and remove the non-aliasing controls)
> }
> 
> 

Thanks for the example.


Best regards,
Zeng Heng



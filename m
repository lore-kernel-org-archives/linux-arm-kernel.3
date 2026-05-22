Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50C2CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtxA9IJejbNsHuET5Zkbrc9yaYZITM02uIsEzopqyb4=; b=KccDthY3bnWX7hzNEeR+p3x0Kd
	+LKrfnhdwPnpVbsfw3av5x/2uI0WtVxKvcyIQ/L/JCsT3cGBPvgv4iLfcGW+VBfYW6dTFnhs99WFx
	P1kkUps1ay0zTSGJqM7isN+yFhknJ1iRRA+k5Xv4FjYJItQoirdyv26MsGkWXFCKH/k8h6D7UIgpl
	GhhtZ1/PeI46ZEr5Asnxqs/jkOfU72OZe5gMdIq5AlmjcwC0miCiRqEpOuZhfiSC8ozOSvbAyizAd
	Pq9QbhmvNPA6tEWMVJTYZ3eo+YQPM3OfhNRhIr/xzd7LIsFCafb59tehzP8ronaev+Ep1fDxkCK6B
	zoBCS0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMda-0000000AOSY-165I;
	Fri, 22 May 2026 09:57:50 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMdX-0000000AOQu-2gHx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:57:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gMLL52xZSzKHMsL
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 17:57:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D9A8140562
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 17:57:39 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP4 (Coremail) with SMTP id gCh0CgCnb1uRKBBqw1feDA--.55895S3;
	Fri, 22 May 2026 17:57:39 +0800 (CST)
Message-ID: <a1c31539-3ec8-132a-f1d4-51784900e46f@huaweicloud.com>
Date: Fri, 22 May 2026 17:57:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 next 03/10] arm_mpam: Disable reqPARTID expansion when
 Narrow-PARTID is unavailable
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
 <20260413085405.1166412-4-zengheng4@huawei.com>
 <9efc30be-689b-4f42-bef0-d7d62b4392fa@arm.com>
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <9efc30be-689b-4f42-bef0-d7d62b4392fa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgCnb1uRKBBqw1feDA--.55895S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw48tFWkAry8Wr1xZryxZrb_yoWrKryDpr
	WxKay7GF48XF1Fga1kt3WUZF1furs7Jas8Gws5tw1fCa9xA34xZrWxKF95tFn5ur4rZ34Y
	vryjqa45Crs8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1F6r1fM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
	07AlzVAYIcxG8wCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x07jIksgUUUUU=
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_025748_037028_7AC3642C 
X-CRM114-Status: GOOD (  31.19  )
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
>> MPAM supports heterogeneous systems where some type of MSCs may implement
>> Narrow-PARTID while others do not. However, when an MSC uses
>> percentage-based throttling (non-bitmap partition control) and lacks
>> Narrow-PARTID support, resctrl cannot correctly apply control group
>> configurations across multiple PARTIDs.
>>
>> To enable free assignment of multiple reqPARTIDs to resource control
>> groups, all MSCs used by resctrl must either: Implement Narrow-PARTID,
>> allowing explicit PARTID remapping, or only have stateless resource
>> controls (non-percentage-based), such that splitting a control group
>> across multiple PARTIDs does not affect behavior.
> 
> I prefer Dave's terminology for this: aliasing and non-aliasing. It implies
> there are two controls, which stateless does not.
> 

OK, count me as a fan of the terminology too.

> 
>> The detection occurs at initialization time on the first call to
>> get_num_reqpartid() from update_rmid_limits(). This call is guaranteed
>> to occur after mpam_resctrl_pick_{mba,caches}() have set up the
>> resource classes, ensuring the necessary properties are available
>> for the Narrow-PARTID capability check.
>>
>> When an MSC with percentage-based control lacks Narrow-PARTID support,
>> get_num_reqpartid() falls back to returning the number of intPARTIDs,
>> effectively disabling the reqPARTID expansion for monitoring groups.
> 
> No MSC has percentage based controls - that's an x86ism. The MSCs have
> fixed point fractions, bitmaps or a cost/weight.
> 

Yes, thanks for head-up: it's x86ism.

> 
> I think you're thinking about this the wrong way up - we should only enable
> this on a small number of platforms that don't have any controls we'd have to discard.
> (hopefully yours is such a platform!)
> 
> I don't think this should be added to resctrl_arch_system_num_rmid_idx(). Please make
> this decision for resctrl at mpam_resctrl_setup() time.
> 
> 
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5f4364c8101a..56859f354efa 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -257,9 +257,50 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
>>   	return mpam_intpartid_max + 1;
>>   }
>>   
>> +/*
>> + * Determine the effective number of PARTIDs available for resctrl.
>> + *
>> + * This function performs a one-time check to determine if Narrow-PARTID
>> + * can be used. It must be called after mpam_resctrl_pick_{mba,caches}()
>> + * have initialized the resource classes, as class properties are used
>> + * to detect Narrow-PARTID support.
> 
>> + * The first call occurs in update_rmid_limits(), ensuring the
>> + * prerequisite initialization is complete.
> 
> This is fragile to changes in the order resctrl makes these calls. We need these
> properties to be fixed before we call resctrl_init().
> 
> (yes - I think CDP is fragile too!)

It makes sense to me.

> 
> 
>> + */
>> +static u32 get_num_reqpartid(void)
>> +{
>> +	struct mpam_resctrl_res *res;
>> +	struct mpam_props *cprops;
>> +	static bool first = true;
>> +	int rid;
>> +
>> +	if (first) {
>> +		for_each_mpam_resctrl_control(res, rid) {
>> +			if (!res->class)
>> +				continue;
>> +
>> +			cprops = &res->class->props;
>> +			if (mpam_has_feature(mpam_feat_partid_nrw, cprops))
>> +				continue;
> 
> 
>> +			if (mpam_has_feature(mpam_feat_mbw_max, cprops) ||
>> +			    mpam_has_feature(mpam_feat_mbw_min, cprops) ||
>> +			    mpam_has_feature(mpam_feat_cmax_cmax, cprops) ||
>> +			    mpam_has_feature(mpam_feat_cmax_cmin, cprops)) {
> 
> Please make this a helper in mpam_internal.h with 'controls' and 'aliasing' in its name.
> (maybe has_aliasing_controls()).
> 
> What about the priority for PRI and the proportional-stride?
> 
> I don't think proportional-stride aliases properly: if I have groups with stride 1 and 2,
> I can't add a second '2' without decreasing the first groups stride from 1/3 to 1/5. If I
> halve the second groups, they each get half the bandwidth instead of sharing it.
> 
> Can you check whether the priority for PRI aliases?
> 

Proportional-stride is indeed a non-aliasing control, and this was an
oversight on my part (I haven't actually encountered this control option
before).

I'd argue that PRI is an aliasing control: the priority value defines a
scheduling class or identity. When multiple PARTIDs share the same
priority, it's akin to multiple users holding the same VIP tier. They
compete for resources within that same category, rather than each
receiving an independent, additive allocation.


Best regards,
Zeng Heng



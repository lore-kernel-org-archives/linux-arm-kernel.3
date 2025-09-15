Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6477FCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iBayou+9UXHYeNLTRsmJP2lgRLbL0nlwLZYLArXhzA=; b=QLIiIu/YB4ZrBonmyyp32Nu7zi
	DicIx9oYUhQux7hnvYSEpQk1OJG10pgBzKCKhqJQxAkqoCcIo3mxeOhZl6v8strXQZQPPcS+PdjJt
	DNU+G+IzfZrCPj79qcVYsYj0Qfr6qEVwYIlnu0ye7vvuCRP2m02WdMsv0bW0vZRtAoBZNuxR3ddZe
	VrXxYxVGvcZJaEZ6kRIXrSa2qCSVwNZK8aBH8gUih4m4IObqVqJEWIY9L5YYPlCrmznPKBtY08b4X
	bOtQ9jmHckY5yQanBWefQWo/caEFpEL1MkkRDGoxKtW2uc68LnbZoQdgBo/JlYD7/HDXVPoSG3HXP
	TjnTtJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9qv-00000004aWv-2V8m;
	Mon, 15 Sep 2025 14:06:45 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9qt-00000004aTv-00mE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:06:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cQRY36hbNzQlZ1;
	Mon, 15 Sep 2025 22:01:59 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 4CB34180B62;
	Mon, 15 Sep 2025 22:06:37 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Sep 2025 22:06:37 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Sep 2025 22:06:36 +0800
Message-ID: <5a42235e-f0d9-bbae-7742-d25025878820@hisilicon.com>
Date: Mon, 15 Sep 2025 22:06:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] irqchip/gicv3-its: Add workaround for HIP09/HIP10/HIP10C
 erratum 162100803/162200807/162400807
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangwudi@hisilicon.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>, <yuzenghui@huawei.com>,
	Nianyao Tang <tangnianyao@huawei.com>, Kunkun Jiang <jiangkunkun@huawei.com>
References: <20250909110615.129179-1-wangzhou1@hisilicon.com>
 <86h5xbd8zp.wl-maz@kernel.org>
 <f102058c-809d-e96e-9d96-1c1e14b36517@hisilicon.com>
 <86wm5zc3af.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <86wm5zc3af.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_070643_361245_9D34F5CB 
X-CRM114-Status: GOOD (  23.36  )
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

On 2025/9/15 20:23, Marc Zyngier wrote:
> On Wed, 10 Sep 2025 04:27:15 +0100,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>

[...]

>>>
>>> You are telling the ITS that it is allowed to go and access
>>> unspecified data (16 bit worth of translations). That's not
>>> acceptable. If you *have* to do that, then override the size in the
>>> driver code to actually allocate the corresponding memory.
>>
>> Then we have to override the ITT memory to 2 ^ 16 * 8 for one device
>> :(
> 
> But what's the alternative? Letting the ITS speculate in random
> memory, possibly under the control of userspace or a guest? I don't
> think that's acceptable.

Seems that only a bad device who could send an interrupt which is not be
declared may bring a problem here.

Not sure how dose userspace or a guest make a problem here?

> 
> [...]
> 
>>>> +	/*
>>>> +	 * Cache invalidate by a private register GITS_FUNC_EN, whose offset
>>>> +	 * is 0x20080 of ITS base address. GICv4.1 already maps sgir_base
>>>> +	 * (offset is 0x20000), so address of GITS_FUNC_EN can be got by
>>>> +	 * sgir_base + 0x80. Bit 16 is used to clear DT cache, the flip of
>>>> +	 * bit 19 indicates that DT cache has been cleared.
>>>> +	 */
>>>> +	while (--i) {
>>>> +		tmp = readl_relaxed(its_func_en) & mask;
>>>> +		writel_relaxed(tmp | (1 << 16), its_func_en);
>>>> +		tmp1 = readl_relaxed(its_func_en) & mask;
>>>> +		if (tmp != tmp1)
>>>> +			break;
>>>> +	}
>>>
>>> Please define these bits so that they have names instead of using raw
>>> values. Why do you need to write bit 16 every time? Surely once you
>>> have written it *once*, the HW remember what it has been told to do?
>>
>> HW will not remember it, so we have to write bit 16 every time.
>>
>>>
>>> And frankly, using readl_relaxed_poll_timeout_atomic should be the
>>> right thing to do.
>>
>> The HW logic is that write bit 16 will trigger DT cache clear in one HW cycle
>> or not. NOT that waiting bit 19 to flip.
> 
> Huh. This sounds crazy... Please document this.

OK.

> 
> [...]
> 
>>>> +#ifdef CONFIG_HISILICON_ERRATUM_162100803
>>>> +	{
>>>> +		.desc = "ITS: Hip09 erratum 162100803",
>>>> +		.iidr = 0x00051736,
>>>> +		.mask = 0xffffffff,
>>>> +		.init = its_enable_quirk_162100803,
>>>> +	},
>>>> +	{
>>>> +		.desc = "ITS: Hip10 erratum 162200807",
>>>> +		.iidr = 0x01051736,
>>>> +		.mask = 0xffffffff,
>>>> +		.init = its_enable_quirk_162100803,
>>>> +	},
>>>> +	{
>>>> +		.desc = "ITS: Hip10c erratum 162400807",
>>>> +		.iidr = 0x00061736,
>>>> +		.mask = 0xffffffff,
>>>> +		.init = its_enable_quirk_162100803,
>>>
>>> Can you try to merge these three entries and adjust the mask
>>> accordingly? mask=0xeffcffff should do the trick, assuming that you
>>> don't have any other hardware overlapping this.
>>
>> The iidrs are different, how to merge these entries?
> 
> By using the mask:
> 
> 	{
> 		.desc = "ITS: Hip10 erratum, will eat your vSGIs",
> 		.iidr = 0x01051736,
> 		.mask = 0xeffcffff,
> 		.init = its_enable_quirk_162100803,
> 	},
> 
> will match all three platforms, assuming I got the mask correctly.

iidrs are differet, so one iidr can not match all. e.g.
for iidr = 0x00061736, mask with 0xeffcffff will be 0x00041736, which
will not be 0x01051736.

>  
>>
>>>
>>>> +	},
>>>> +#endif
>>>>  #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
>>>>  	{
>>>>  		.desc   = "ITS: Rockchip erratum RK3588001",
>>>
>>> If the HW is this bad, and that this only affects virtual interrupts,
>>> why don't you simply disable GICv4 support? Messing with the internals
>>> of the ITS tables feels like a pretty bad idea. Or as I suggested
>>> above, get the firmware to ignore RAS events from the ITS.
>>
>> The hack is ugly, but we want to try to save vSGI direct
>> injection...
> 
> Well, if you think this is worth it...
> 
> 	M.
> 


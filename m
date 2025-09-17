Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31388CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 03:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkHZCC4kVHfvVxnXDwYpLuf+kjs3/sbJhrf4Ar8FC1A=; b=ucMCgSljI0HUiLu5L4IFumtNRz
	dlHL4h6QsRVLhdVkhro/Z8dlaSrBaudUZbNjg+6qTTP1Cs9T9BbUnjV6LeNLzor+5lco2wOaxsFzL
	Rk2bEFc6E82VENfIiG2W18CGNwpxevHK0OZ3bPhQxVO/rVEcY71sB59ZndH2piSqjq3iQDRplqjRJ
	rdM3Bg0oL5LuhUY541Xjvw5m3LyVKBisvhIIe3zF24CUCgorYSNnXvOEl0FTPddrh1Hzsn8gqjHxX
	/40luSPkGY2bSqjV2cEApesyFuPHQumOoR17RuKSsr+fQh9ZvWe6U5RuypT4xQNlVIjpqkxRBQlJe
	r01P9TYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjD4-0000000A6mk-1w1w;
	Wed, 17 Sep 2025 03:51:58 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjCy-0000000A6hM-1kE1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 03:51:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cRPqw6FCQz24j6S;
	Wed, 17 Sep 2025 11:48:12 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 032081401F4;
	Wed, 17 Sep 2025 11:51:37 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 17 Sep 2025 11:51:22 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 17 Sep 2025 11:51:21 +0800
CC: <yangyicong@hisilicon.com>, Will Deacon <will@kernel.org>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<tangchengchang@huawei.com>, <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v4 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20250715081356.12442-1-yangyicong@huawei.com>
 <20250715081356.12442-6-yangyicong@huawei.com>
 <aL7Fgx__LeLfbDyU@willie-the-truck>
 <5d2ba565-715b-9b17-951b-f805dde5988b@huawei.com>
 <aMLvtpaCgRqPAU2Z@willie-the-truck> <20250912144736.00007673@huawei.com>
 <666e3588-2e42-2275-f9ec-94ba0954bdc6@huawei.com> <aMl6u7xTDLhrZmqK@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <0dfe5781-7ca7-7d9f-b099-b20da5e10a1b@huawei.com>
Date: Wed, 17 Sep 2025 11:51:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aMl6u7xTDLhrZmqK@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_205152_826147_BB61966B 
X-CRM114-Status: GOOD (  49.70  )
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

On 2025/9/16 22:56, Catalin Marinas wrote:
> On Mon, Sep 15, 2025 at 04:29:25PM +0800, Yicong Yang wrote:
>> On 2025/9/12 21:47, Jonathan Cameron wrote:
>>> On Thu, 11 Sep 2025 16:50:14 +0100
>>> Will Deacon <will@kernel.org> wrote:
>>>> On Tue, Sep 09, 2025 at 09:48:04AM +0800, Yicong Yang wrote:
>>>>> per ARM DDI0487 L.b section C3.2.6,
>>>>>
>>>>>   When the instructions access a memory type that is not one of the following,
>>>>>   a data abort for unsupported Exclusive or atomic access is generated...  
>>>>
>>>> That's about the memory _type_. I'm talking about a supported memory type
>>>> (e.g. writeback cacheable) but when the physical location doesn't support
>>>> the instruction. That's captured a little later in the same section:
>>>>
>>>>   | If the target memory location does not support the LD64B or ST64B
>>>>   | instructions, then one of the following behaviors occurs:
>>>>   |  * A stage 1 Data Abort, reported using the DFSC code of 0b110101,
>>>>   |    is generated.
>>>>   |  * The instruction performs the memory accesses, but the accesses
>>>>   |    are not single-copy atomic above the byte level
> 
> Is this a new addition to the L.b release of the ARM ARM? Maybe it was
> there before in some other form (or a different place). At least it
> doesn't say "unpredictable".
> 

i think it's new in L.b. didn't find this is mentioned in K.a either.

>>>> and I think that's a bad interface to expose blindly to userspace solely
>>>> as a boolean hwcap.
>>>
>>> Nasty, so now I'm curious. Any thoughts on how to expose what regions it is appropriate
>>> for?  I can think of various heavy weight options but wondering if there is a simple
>>> solution.
>>
>> in my understanding the hwcap only describes the capabilities of the CPU but not
>> the whole system. the users should make sure the function works as expected if the
>> CPU supports it and they're going to use it. specifically the LS64 is intended for
>> device memory only, so the user should take responsibility of using it on supported
>> memory.
> 
> We have other cases like MTE where we avoid exposing the HWCAP to user
> if we know the memory system does not support MTE, though we intercepted
> this early and asked the (micro)architects to tie the CPU ID field to
> what the system supports.
> 

but we lack the same identification mechanism as CPU for the memory system, so it's just a
restriction for the hardware vendor that if certain feature is not supported for the whole
system (SoC) then do not advertise it in the CPU's ID field. otherwise i think we're currently
doing in the manner that if capability mismatch or cannot work as expected together then a
errata/workaround is used to disable the feature or add some workaround on this certain
platform.

this is also the case for LS64 but a bit more complex, since it involves the completer outside
the SoC (the device) and could be a hotplug one (PCIe). from the SoC part we can restrict to
advertise the feature only if it's fully supported (what we've already done on our hardware).

>> may raise the similar question if use other atomic instructions (e.g. LSE) on the
>> memory does not support atomicity. find this restriction in ARM DDI0487 L.b section B2.2.6
>>
>>   Some system implementations might not support atomic instructions for all regions of the
>>   memory
> 
> With exclusives or atomics, we require that the general purpose (system)
> RAM supports the feature, otherwise Linux won't work properly (I don't
> think we specifically documented this but it would be fairly obvious
> when the kernel doesn't boot or user-space randomly crashes).
> 

yes the spec requires general purpose memory to support atomicity.

  The architecture only requires that Conventional memory that is mapped in this way supports
  this functionality

otherwise users should have knowledge whether the target memory agent support atomicity.

>> and if perform atomic instruction on unsupported memory it's allowed to implement as
>>
>>   * The instruction generates a synchronous External abort.
>>   * The instruction generates a System Error interrupt.
>>   * The instruction generates an IMPLEMENTATION DEFINED MMU fault reported using the Data
>>     Abort Fault status code of ESR_ELx.DFSC = 110101.
>>   * The instruction is treated as a NOP.
>>   * The instructions are performed, but there is no guarantee that the memory accesses were
>>     performed atomically in regard to other agents that access memory. In this case, the
>>     instruction might also generate a System Error interrupt.
>>
>> if instruction performed without generate a SEI in the last implementation, it's quite similar
>> to the condition of LS64.
> 
> The difference is that we don't support Linux on such systems.
> 
> Arguably, the use of LD/ST64B* is fairly specialised and won't be used
> on the general purpose RAM and by random applications. It needs a device
> driver to create the NC/Device mapping and specific programs/libraries
> to access it. I'm not sure the LS64 properties are guaranteed by the
> device alone or the device together with the interconnect. I suspect the
> latter and neither the kernel driver nor user space can tell. In the
> best case, you get a fault and realise the system doesn't work as
> expected. Worse is the non-atomicity with potentially silent corruption.
> 

will be the latter one, both interconnect and the target device need to
support it. but I think the driver developer (kernel driver or userspace
driver) must have knowledge about the support status, otherwise they
should not use it.

for general purpose ram currently we have fault mechenism to avoid ld/st64b
usage (there's maybe an exception if FEAT_LS64WB is supported, which is
introduced in the latest feature list but no spec describe it and allows
perform ld/st64b on memory with write-back attribute. but currently I have
no details about this feature from any public documents)

> So, to Will's point, the HWCAP is not sufficient for user space to make
> an informed decision on whether it can safely use the LS64 instructions.
> Can a (generic) device driver tell or do we need additional information
> in firmware tables to advertise the correct behaviour?
> 

my thoughts is that the driver developer should have known whether their
device support it or not if going to use this. the information in the
firmware table should be fine for platform devices, but cannot describe
information for hotpluggable ones like PCIe endpoint devices which may
not be listed in a firmware table.

thanks.



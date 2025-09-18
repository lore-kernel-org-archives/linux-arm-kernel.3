Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55C2CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ItRvaBRl4/8Sie2uIrT1Z/oP/Xy+M8UksEIvmBsPw8=; b=jnU2ZrbT0u8fSGhto3L/KBd7Sa
	yqNPfRKs7pyLtwfT7iQ0PxayejLZDfvW51GC9bJKgLuJReNfX8iQA+tACjiKVJIvpLpiVT1ys9fMC
	1/f2ogkWkjLZNMBmOnzzzqW9ycDhwu83GPZoEEUbfdzYr+VsyAV8ZONG5fuqO/S8iR+udG4P3dWS+
	EVjFPlaC6MgkALHRtHedODu9P3Fgqg9fzIxr0WDCtztQF95K8QXvm+QmeAf7CkcdGsutDQRw00o+e
	JsVNt1aeY9sxR1r0GYqtk790vvEZNWg9z0zVx4PrJ2ZprZPg6HZaY21nJmbRa7VDAQFBlZyEHsXrS
	oPtbMNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAdt-0000000GolY-41d2;
	Thu, 18 Sep 2025 09:09:29 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAdq-0000000Gokh-2CzO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:09:28 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cS8ph3Gdwz2Cf3x;
	Thu, 18 Sep 2025 17:04:44 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 467F91400CB;
	Thu, 18 Sep 2025 17:09:20 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 17:09:20 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 17:09:19 +0800
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
 <0dfe5781-7ca7-7d9f-b099-b20da5e10a1b@huawei.com> <aMrDuieMX9WL4jkB@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <f6a0a078-fec6-d29c-1144-103eddf1462a@huawei.com>
Date: Thu, 18 Sep 2025 17:09:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aMrDuieMX9WL4jkB@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_020926_873776_D663AD1A 
X-CRM114-Status: GOOD (  39.28  )
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

On 2025/9/17 22:20, Catalin Marinas wrote:
> On Wed, Sep 17, 2025 at 11:51:20AM +0800, Yicong Yang wrote:
>> On 2025/9/16 22:56, Catalin Marinas wrote:
>>> On Mon, Sep 15, 2025 at 04:29:25PM +0800, Yicong Yang wrote:
>>>> in my understanding the hwcap only describes the capabilities of the CPU but not
>>>> the whole system. the users should make sure the function works as expected if the
>>>> CPU supports it and they're going to use it. specifically the LS64 is intended for
>>>> device memory only, so the user should take responsibility of using it on supported
>>>> memory.
>>>
>>> We have other cases like MTE where we avoid exposing the HWCAP to user
>>> if we know the memory system does not support MTE, though we intercepted
>>> this early and asked the (micro)architects to tie the CPU ID field to
>>> what the system supports.
>>
>> but we lack the same identification mechanism as CPU for the memory system, so it's just a
>> restriction for the hardware vendor that if certain feature is not supported for the whole
>> system (SoC) then do not advertise it in the CPU's ID field. otherwise i think we're currently
>> doing in the manner that if capability mismatch or cannot work as expected together then a
>> errata/workaround is used to disable the feature or add some workaround on this certain
>> platform.
>>
>> this is also the case for LS64 but a bit more complex, since it involves the completer outside
>> the SoC (the device) and could be a hotplug one (PCIe). from the SoC part we can restrict to
>> advertise the feature only if it's fully supported (what we've already done on our hardware).
> 
> That's good to know. Hopefully other vendors do the same.
> 
> I think the ARM ARM would benefit from a note here that the system
> designers should not advertise this if the interconnect does not support
> it. I can raise this internally.
> 

one complementation, only ld64b/st64b (FEAT_LS64) need this concerns. otherwise
for st64bv/st64bv0 that support return a status, user can check the status result:

  If the target memory location does not support the ST64BV or ST64BV0 instructions,
  then the register specified by <Xs> is set to 0xFFFFFFFF_FFFFFFFF.

>>> Arguably, the use of LD/ST64B* is fairly specialised and won't be used
>>> on the general purpose RAM and by random applications. It needs a device
>>> driver to create the NC/Device mapping and specific programs/libraries
>>> to access it. I'm not sure the LS64 properties are guaranteed by the
>>> device alone or the device together with the interconnect. I suspect the
>>> latter and neither the kernel driver nor user space can tell. In the
>>> best case, you get a fault and realise the system doesn't work as
>>> expected. Worse is the non-atomicity with potentially silent corruption.
>>
>> will be the latter one, both interconnect and the target device need to
>> support it. but I think the driver developer (kernel driver or userspace
>> driver) must have knowledge about the support status, otherwise they
>> should not use it.
> [...]
>> my thoughts is that the driver developer should have known whether their
>> device support it or not if going to use this. the information in the
>> firmware table should be fine for platform devices, but cannot describe
>> information for hotpluggable ones like PCIe endpoint devices which may
>> not be listed in a firmware table.
> 
> There's a risk of such instructions ending up in more generic
> copy_to/from_io implementations but it's not much we can do other than
> not enabling the feature at all.
> 
> So, I think a HWCAP bit is useful but we need (a) clarification that the
> CPUID field won't be set if the system doesn't support it and (b)
> document the Linux bit that it's a per-device capability even if the
> CPU/system supports it (the HWCAP is only a prerequisite to be able to
> use the instructions; the driver can fall back to non-atomic ops, maybe
> with a DGH if it helps performance).
> 

sure. will mention this in Documentation/arch/arm64/elf_hwcaps.rst for HWCAP3_LS64
as well as the commit message.

thanks.


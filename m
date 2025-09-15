Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE09CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFSAIi/dtr4iuCKU0EIzf/ko8Mz2mAndxs8Ogn/B99w=; b=sggZE44T5j/c/HZmZyCuWIcCZy
	WyA8pI7nXAotYAcB/pnJMJrAu3venZWpVjqK8MMUrJiiopZW57aRFKsGvOYYFT269zY+WbnsM1O1t
	bWrYh8zyoGLBap39O/AlU+UxYDJQ+xbFYJjrK6ItcEJmrePY8jIrgmJT1OiTOU+OMzMFix0IGcow1
	AWNh24KjzaINic/89pydM3kREneIOXiMS+4FnYJQhDUsStX9nKAnsjjiSlezl1KwQ/KCnOhEs9EON
	/vHFsXpPWY0m75iQN4tkNN4/Sz0Js19q/Ps9YGyMTfeB+1T8ftZgLUSHM9UjjTfxnjdgdeOTfMxpp
	fEWNF/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4aj-00000003Cc1-2sMc;
	Mon, 15 Sep 2025 08:29:41 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4ah-00000003CaB-0Ukt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:29:40 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cQJ5S3xCKz2VRmg;
	Mon, 15 Sep 2025 16:26:04 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id CA5B81402A5;
	Mon, 15 Sep 2025 16:29:26 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Sep 2025 16:29:26 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Sep 2025 16:29:25 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<tangchengchang@huawei.com>, <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v4 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
To: Will Deacon <will@kernel.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>
References: <20250715081356.12442-1-yangyicong@huawei.com>
 <20250715081356.12442-6-yangyicong@huawei.com>
 <aL7Fgx__LeLfbDyU@willie-the-truck>
 <5d2ba565-715b-9b17-951b-f805dde5988b@huawei.com>
 <aMLvtpaCgRqPAU2Z@willie-the-truck> <20250912144736.00007673@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <666e3588-2e42-2275-f9ec-94ba0954bdc6@huawei.com>
Date: Mon, 15 Sep 2025 16:29:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250912144736.00007673@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_012939_475546_EA80883C 
X-CRM114-Status: GOOD (  24.85  )
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

On 2025/9/12 21:47, Jonathan Cameron wrote:
> On Thu, 11 Sep 2025 16:50:14 +0100
> Will Deacon <will@kernel.org> wrote:
> 
>> On Tue, Sep 09, 2025 at 09:48:04AM +0800, Yicong Yang wrote:
>>> On 2025/9/8 20:01, Will Deacon wrote:  
>>>> On Tue, Jul 15, 2025 at 04:13:54PM +0800, Yicong Yang wrote:  
>>>>> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
>>>>> index 69d7afe56853..9e6db258ff48 100644
>>>>> --- a/Documentation/arch/arm64/elf_hwcaps.rst
>>>>> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
>>>>> @@ -435,6 +435,12 @@ HWCAP2_SME_SF8DP4
>>>>>  HWCAP2_POE
>>>>>      Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
>>>>>  
>>>>> +HWCAP3_LS64
>>>>> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0001.
>>>>> +
>>>>> +HWCAP3_LS64_V
>>>>> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0010.  
>>>>
>>>> Given that these instructions only work on IMPLEMENTATION DEFINED memory
>>>> locations and aren't guaranteed to generate an abort if used elsewhere,
>>>> how is userspace supposed to know what to do with them?
>>>>   
>>>
>>> per ARM DDI0487 L.b section C3.2.6,
>>>
>>>   When the instructions access a memory type that is not one of the following,
>>>   a data abort for unsupported Exclusive or atomic access is generated...  
>>
>> That's about the memory _type_. I'm talking about a supported memory type
>> (e.g. writeback cacheable) but when the physical location doesn't support
>> the instruction. That's captured a little later in the same section:
>>
>>   | If the target memory location does not support the LD64B or ST64B
>>   | instructions, then one of the following behaviors occurs:
>>   |  * A stage 1 Data Abort, reported using the DFSC code of 0b110101,
>>   |    is generated.
>>   |  * The instruction performs the memory accesses, but the accesses
>>   |    are not single-copy atomic above the byte level
>>
>> and I think that's a bad interface to expose blindly to userspace solely
>> as a boolean hwcap.
> Hi Will,
> 
> Nasty, so now I'm curious. Any thoughts on how to expose what regions it is appropriate
> for?  I can think of various heavy weight options but wondering if there is a simple
> solution.
> 

in my understanding the hwcap only describes the capabilities of the CPU but not
the whole system. the users should make sure the function works as expected if the
CPU supports it and they're going to use it. specifically the LS64 is intended for
device memory only, so the user should take responsibility of using it on supported
memory.

may raise the similar question if use other atomic instructions (e.g. LSE) on the
memory does not support atomicity. find this restriction in ARM DDI0487 L.b section B2.2.6

  Some system implementations might not support atomic instructions for all regions of the
  memory

and if perform atomic instruction on unsupported memory it's allowed to implement as

  * The instruction generates a synchronous External abort.
  * The instruction generates a System Error interrupt.
  * The instruction generates an IMPLEMENTATION DEFINED MMU fault reported using the Data
    Abort Fault status code of ESR_ELx.DFSC = 110101.
  * The instruction is treated as a NOP.
  * The instructions are performed, but there is no guarantee that the memory accesses were
    performed atomically in regard to other agents that access memory. In this case, the
    instruction might also generate a System Error interrupt.

if instruction performed without generate a SEI in the last implementation, it's quite similar
to the condition of LS64.

thanks.


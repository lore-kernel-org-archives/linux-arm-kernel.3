Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC5BCA101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCm4CPgUQ2/eBX4S70x/16SGPfY+4q4m0DDNY5SUz7c=; b=VYd5NI/kulY5DL/jB12424OcfV
	tO1VDNhHG2LvIzcCMbHj2PapSA3eh07MJxml36ohw/v2lVYPU0KEb2QlasHo1xX1VVIm7OoZrYPwC
	iK72oyrbleGpy/572YgqoSJdOLH6Rm3K07wg/F+lRAif+IfOlcAsg9LnJ4v2C010M4Twf+3SL8CgH
	xDZbfLJgrgbAvDK2+54ecVXepCAaUu3XZ3rwnJ9LBrBB4XpAsB7G8sNAoOy8j9bPKl0O/sltcl6c5
	ESBs+azRP53vTpBs3ZWG3FRJ1UrUnmxTZGlVinTntmZzTa6F/FQrZhUQML82gYY7kD+V7aw8Eqkvy
	ih5mQ3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCne-0000000Cu8v-3YhK;
	Thu, 04 Sep 2025 16:27:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9p7-0000000Bozn-3sn0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:16:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1D9F1756;
	Thu,  4 Sep 2025 06:16:12 -0700 (PDT)
Received: from [10.1.37.179] (XHFQ2J9959.cambridge.arm.com [10.1.37.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EC433F6A8;
	Thu,  4 Sep 2025 06:16:19 -0700 (PDT)
Message-ID: <f8cf1823-1ee9-4935-9293-86f58a9e2224@arm.com>
Date: Thu, 4 Sep 2025 14:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>, Dev Jain <dev.jain@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Ard Biesheuvel <ardb@kernel.org>, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <e722e49a-d982-4b58-98f7-6fef3d0a4468@arm.com>
 <dd242f5b-8bbe-48e8-8d5f-be6a835a8841@arm.com>
 <aeb76956-f980-417f-b4e7-fe0503bb5a2b@os.amperecomputing.com>
 <612940d2-4c8e-459c-8d7d-4ccec08fce0a@os.amperecomputing.com>
 <1471ea27-386d-4950-8eaa-8af7acf3c34a@arm.com>
In-Reply-To: <1471ea27-386d-4950-8eaa-8af7acf3c34a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_061622_008171_0CA9070A 
X-CRM114-Status: GOOD (  18.72  )
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

On 04/09/2025 14:14, Ryan Roberts wrote:
> On 03/09/2025 01:50, Yang Shi wrote:
>>>>>
>>>>>
>>>>> I am wondering whether we can just have a warn_on_once or something for the
>>>>> case
>>>>> when we fail to allocate a pagetable page. Or, Ryan had
>>>>> suggested in an off-the-list conversation that we can maintain a cache of PTE
>>>>> tables for every PMD block mapping, which will give us
>>>>> the same memory consumption as we do today, but not sure if this is worth it.
>>>>> x86 can already handle splitting but due to the callchains
>>>>> I have described above, it has the same problem, and the code has been working
>>>>> for years :)
>>>> I think it's preferable to avoid having to keep a cache of pgtable memory if we
>>>> can...
>>>
>>> Yes, I agree. We simply don't know how many pages we need to cache, and it
>>> still can't guarantee 100% allocation success.
>>
>> This is wrong... We can know how many pages will be needed for splitting linear
>> mapping to PTEs for the worst case once linear mapping is finalized. But it may
>> require a few hundred megabytes memory to guarantee allocation success. I don't
>> think it is worth for such rare corner case.
> 
> Indeed, we know exactly how much memory we need for pgtables to map the linear
> map by pte - that's exactly what we are doing today. So we _could_ keep a cache.
> We would still get the benefit of improved performance but we would lose the
> benefit of reduced memory.
> 
> I think we need to solve the vm_reset_perms() problem somehow, before we can
> enable this.

Sorry I realise this was not very clear... I am saying I think we need to fix it
somehow. A cache would likely work. But I'd prefer to avoid it if we can find a
better solution.


> 
> Thanks,
> Ryan
> 
>>
>> Thanks,
>> Yang
>>
>>>
>>> Thanks,
>>> Yang
>>>
>>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>
>>>
>>
> 



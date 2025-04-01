Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6799CC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wec4tCQ44KaSY8VQ7H23Ovk9DlmsTaEZ3hfuyszafBg=; b=ceMGz3SKoWjX/Jy7PBKbyMkj0i
	SIuMNaEvJKc/NHbOgqhQtmKDRSG0eY2gF30XGa8IylLQqFh8UOECXS2qPykiyxTigT3kfi+yxx+bG
	X4SNsJw4JXM28VaBIb/MKHA//jx+aD+Ec7r7JhRbhf+E5HYhQyg+nu7eBn3NJJBjGPWV65LXVEPDa
	oSJpmhOjiQ1APpR6khzzoRlcWml7dIiW6zda4VgBwSdYRN414oW+d2AHiGumnu+C2gebD5fbqS6MO
	0ukMBPDYU803uLUyBkGPZ1K+Mg+1nBpcWrymmnS0MIfV4+ihHc2fSEc+cLentITP22+TjuvPJmp92
	NE/eNuag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZHK-00000002gp3-3dvn;
	Tue, 01 Apr 2025 10:55:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYzj-00000002eJ5-0jrg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:37:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 254E814BF;
	Tue,  1 Apr 2025 03:37:26 -0700 (PDT)
Received: from [10.1.28.189] (XHFQ2J9959.cambridge.arm.com [10.1.28.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7FF83F63F;
	Tue,  1 Apr 2025 03:37:20 -0700 (PDT)
Message-ID: <49f33b4e-ff2e-4d7c-827d-9395145ce0cf@arm.com>
Date: Tue, 1 Apr 2025 11:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org,
 gshan@redhat.com, steven.price@arm.com, suzuki.poulose@arm.com,
 tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org> <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
 <Z-jzouwNZwk8Ft-j@kernel.org> <0aac96b5-b3ac-47ee-97af-7ca5d927bdd0@arm.com>
 <Z-u8Cc7i_l0xM5TT@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z-u8Cc7i_l0xM5TT@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_033723_264299_F5D9C002 
X-CRM114-Status: GOOD (  21.64  )
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

On 01/04/2025 06:12, Mike Rapoport wrote:
> Hi Ryan,
> 
> On Tue, Apr 01, 2025 at 10:43:01AM +0100, Ryan Roberts wrote:
>> On 30/03/2025 03:32, Mike Rapoport wrote:
>>> On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
>>>> On 28/03/2025 18:50, Mike Rapoport wrote:
>>>>> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>>>>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>>>>>
>>>>>                                                      for vmalloc mappings ^
>>>>>
>>>>> arm64 does not allow changing permissions to any VA address right now.
>>>>>
>>>>>> which does not support changing permissions for leaf mappings. This function
>>>>>> will change permissions until it encounters a leaf mapping, and will bail
>>>>>> out. To avoid this partial change, explicitly disallow changing permissions
>>>>>> for VM_ALLOW_HUGE_VMAP mappings.
>>>>>>
>>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>
>>>> I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.
>>>
>>> We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
>>> if there was a code that plays permission games on these allocations, x86
>>> set_memory would blow up immediately, so I don't think Fixes: is needed
>>> here.
>>
>> Hi Mike,
>>
>> I think I may have misunderstood your comments when we spoke at LSF/MM the other
>> day, as this statement seems to contradict. I thought you said that on x86 BPF
>> allocates memory using vmalloc_huge()/VM_ALLOW_HUGE_VMAP and then it's
>> sub-allocator will set_memory_*() on a sub-region of that allocation? (And we
>> then agreed that it would be good for arm64 to eventually support this with BBML2).
> 
> I misremembered :)
> They do allocate several PMD_SIZE chunks at once, but they don't use
> vmalloc_huge(), so everything there is mapped with base pages.
> 
> And now they are using execmem rather than vmalloc directly, and execmem
> doesn't use VM_ALLOW_HUGE_VMAP anywhere except modules on x86.

Ahh OK! Like I said, I don't think it reduces the value of this patch though.

>  
>> Anyway, regardless, I think this change is useful first step to improving
>> vmalloc as it makes us more defensive against any future attempt to change
>> permissions on a huge allocation. In the long term I'd like to get to the point
>> where arm64 (with BBML2) can map with VM_ALLOW_HUGE_VMAP by default.
>>
>> Thanks,
>> Ryan
> 



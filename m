Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1377FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chjH6PAnr7p+DZMPHLtIyVggq/S3XE3ABXSawW/YmSw=; b=EyjBDogThI2aLQtS96vT4OSm+H
	dEDOfDbr6Fl5Dd4kf6/T9hzy7Me1iQygUTCbkhI1UHk2Q6ZTq/X+EUItrDWU29yr0u38nYTDoE9yM
	Rp+aimW6dmDl9xsSuw3CvMs0EOLMevHl6pbnV4dSRXOvWLhvt+1E7IyWzoVycFNytHUSa62iDUDcF
	hT1MqRgP1eWEgK3YY38X1abjeroMBC4ZQ5HGpMZvI9YNuaE95tLfydN0/DL3bY3E2VFkcb7/70Ehr
	yC/NTtM7GQg5hNBUj0z7OfZmfvb0Mz2QXrxs+GOIfh63u/cNBjGY/WMAWaStlFbNGwN3OfpnDGjNi
	mce5dchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVHr-00000003IiB-3o6B;
	Tue, 29 Sep 2026 10:42:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVHp-00000003Ih2-0A1m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:42:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BA63497;
	Tue, 29 Sep 2026 03:42:07 -0700 (PDT)
Received: from [10.57.12.116] (unknown [10.57.12.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A904A3F86F;
	Tue, 29 Sep 2026 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790678530; bh=7/qDNxbBp1ADohJnweYVMAso5g2WF/JpQG/PO2h7y30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PC0ik/ydlxF//U+lOzOT0FQMQrw91+SgzqjHx8bSSGqPb2dUxJ8O169VPU4eiTqnA
	 fm3nTXkhVLT4Z/MtxA698ns0dQ477LlEA5AfOd7bC58zuZOSRkbEXUw6qxg/8JlVG1
	 CQlrL5P0hFD8zGPUViyWR8naA+LE5p96UT9StgiU=
Message-ID: <eacadf9d-439d-48c4-a874-49df7e403f86@arm.com>
Date: Tue, 29 Sep 2026 11:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, maz@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <arK3tsTV6EDhI-nt@willie-the-truck> <arOyp8WUrYBAjrGH@arm.com>
 <arP0IF0MjFUv36AP@willie-the-truck>
 <49dcab27-1d03-4df2-b7cb-4df4eda6d909@arm.com> <araqPCdcSnqZqPWz@arm.com>
 <3934b4c9-6b1f-44fa-847e-4fb1e67a58e7@arm.com> <aruTTJiIheHigPSJ@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aruTTJiIheHigPSJ@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_034213_175758_7B75FB12 
X-CRM114-Status: GOOD (  34.04  )
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

On 29/09/2026 11:30, Catalin Marinas wrote:
> On Mon, Sep 28, 2026 at 11:38:01AM +0100, Suzuki K Poulose wrote:
>> On 25/09/2026 18:07, Catalin Marinas wrote:
>>> On Wed, Sep 23, 2026 at 05:04:06PM +0100, Suzuki K Poulose wrote:
>>>> On 23/09/2026 16:45, Will Deacon wrote:
>>>>> On Wed, Sep 23, 2026 at 12:06:15PM +0100, Catalin Marinas wrote:
>>>>>> On Tue, Sep 22, 2026 at 06:15:34PM +0100, Will Deacon wrote:
>>>>>>> On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
>>>>>>>> From: Steven Price <steven.price@arm.com>
>>>>>>>>
>>>>>>>> If the host attempts to access granules that have been delegated for use
>>>>>>>> in a realm these accesses will be caught and will trigger a Granule
>>>>>>>> Protection Fault (GPF).
>>>>>>>>
>>>>>>>> A fault during a page walk signals a bug in the kernel and is handled by
>>>>>>>> oopsing the kernel. A non-page walk fault could be caused by user space
>>>>>>>> having access to a page which has been delegated to the kernel and will
>>>>>>>> trigger a SIGBUS to allow debugging why user space is trying to access a
>>>>>>>> delegated page.
>>>>>>>>
>>>>>>>> There is work in progress to unmap the guest_memfd backed private pages from the
>>>>>>>> linear map. Until we get that support, we could get spurious GPFs from within
>>>>>>>> the kernel, e.g., load_unaligned_zeropad(). So, try to fix them up for now.
>>>>>>>>
>>>>>>>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>>>>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>>>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>>>>> ---
>>>>>>>> Changes since v17:
>>>>>>>>     * Pass untagged address to die_kernel_fault() - Sashiko
>>>>>>>>     * Explicitly check !user_mode() for fixups - Catalin
>>>>>>>>     * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
>>>>>>>>     * Clarify the commit description about the upcoming work on
>>>>>>>>       unmapping guest_memfd backed pages from linear map
>>>>>>>> Changes since v16:
>>>>>>>>     * Update the commit description to indicate why we try to fixup GPFs
>>>>>>>> Changes since v10:
>>>>>>>>     * Don't call arm64_notify_die() in do_gpf() but simply return 1.
>>>>>>>> Changes since v2:
>>>>>>>>     * Include missing "Granule Protection Fault at level -1"
>>>>>>>> ---
>>>>>>>>     arch/arm64/mm/fault.c | 30 ++++++++++++++++++++++++------
>>>>>>>>     1 file changed, 24 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> I still don't think we should do this, given that the plan is to unmap
>>>>>>> the memory from the linear map. If this thing fires, it's a kernel bug
>>>>>>> and it should be fatal.
>>>>>>
>>>>>> If the linear unmapping gets merged first, I agree, no need to handle
>>>>>> these faults. I haven't followed that series, so no idea where it is at.
>>>>
>>>> There doesn't seem to be much progress on that series. Brendan
>>>> volunteered to resurrect the series, taking over from Nikita [0].
>>>> But looks like Brendan is not working on this anymore. Will see
>>>> if someone is really planning to look at it.
>>>>
>>>> [0] https://lore.kernel.org/all/DJJ35VLH2PE5.DFD8OYXEOH97@linux.dev
>>>
>>> I just realised that this only solves part of the problem. Normal kernel
>>> allocations are delegated RMM metadata and they'll also trigger GPF
>>
>> Other than Kdump, kernel shouldn't try to touch these metadata pages
>> unless there is a kernel bug ?
> 
> Hibernate but we need to reject this as well since there's no way you
> can save and restore the realm memory.

Ack. I have disabled both kexec (including kdump for now, more on that
below) and hibernate when RMM is active.

> 
>> And the userspace wouldn't have a mapping for them anyways ?
> 
> That's the aim but proposed KVM/CCA support still allows non-gmem slots
> to end up delegated (I haven't checked the latest if addressed).

This has been addressed in v20 integration branch here :

https://git.gitlab.arm.com/linux-arm/linux-cca/-/commit/0e697f0f3b2c11855192ae6e80d6036e9374ccef?file_path=arch%2Farm64%2Fkvm%2Fmmu.c#line_b12897615_A2307

> 
>>> https://lore.kernel.org/all/a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com/
>>>
>>> I think rmi_delegate_range() covers the non-kdump cases, both for
>>> metadata and realm memory, we could unmap the linear map there (map it
>>> back in rmi_undelegate_range()).
>>
>> We could explore that option for the kernel allocations too.
> 
> I do wonder what we gain from unmapping. If architecturally we get a
> synchronous fault when accessing delegated pages, it's only marginally
> more code to do_gpf() (and we might need this function anyway for
> kdump) and we avoid linear map fragmentation. So, I think we just need
> to agree what's fatal and what can safely recover. We do need Alper's
> patch for kdump, otherwise we can't fix it up in do_gpf().

Ack. We could add that in later series. For now we block all kexecs.

Cheers
Suzuki


> 



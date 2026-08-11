Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0CDC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JVW3EsuV8dU5u9/oPjPVRw3upf2bxWj5IVfPROlNCE=; b=fbi5VoThyK+xZc6eQdOPvPbfP7
	xAUZBsObW/ZU6HUbQVXcZ6e5Xlun1VBk+s5zmrPhBnnM/Aex0yyCHXc6vy5yQRgu6oJ8q3lVaLX3D
	3bcWDOkfxEzNUvjQbrZnGTYDHxrqn1Rq+98SR8afcAZOG4jGGqnEzSD33xMnuFv6NbMRacLPrcJxW
	8VjRapobdoPJpF9M/5iIgE/v5132tOZxX/gS8SvdJV2W/aBbZcEC93EUWeV33MpCCcdFIjJEmrRgI
	I1cOCyG4nkyPcdz5YhMvfOsnqYHq1WqlpGrE26NOWpONBlCm7hYr+nQWMJzhNGhzejj/3GxMsVhYf
	6drQs3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto8P-0000000EHyz-25EM;
	Tue, 11 Aug 2026 15:11:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto8N-0000000EHyQ-3SzN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:11:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 372F61516;
	Tue, 11 Aug 2026 08:11:14 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A72B3F632;
	Tue, 11 Aug 2026 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786461078; bh=kDDYlXulaDY8kALDeWuyOverwrCQSxMzEot+EHWqycI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CFq+KJEjHh7zmyzu6EkHr4X1WVBBCk5sU1Bf9jSrz2nyrnMMUG+vk7SzCy6qApv6c
	 8uDjXsSiAeZoIVOgqvUsimXRBvOPNkgmgrpqiQrP7zrmIx0rxrNTfXNRA0gquSHLIA
	 rm648u3B5jtW0/FwZgKH/BZHCnj6Uu4027eNq6kg=
Message-ID: <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
Date: Tue, 11 Aug 2026 16:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 07/45] arm64: mm: Handle Granule Protection Faults
 (GPFs)
To: Catalin Marinas <catalin.marinas@arm.com>,
 Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, Marc Zyngier
 <maz@kernel.org>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com> <ans1ZSwMEKeT9Gfz@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ans1ZSwMEKeT9Gfz@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_081119_946955_F0D1BA24 
X-CRM114-Status: GOOD (  22.21  )
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

On 11/08/2026 15:44, Catalin Marinas wrote:
> On Mon, Aug 03, 2026 at 02:43:23PM +0100, Steven Price wrote:
>> If the host attempts to access granules that have been delegated for use
>> in a realm these accesses will be caught and will trigger a Granule
>> Protection Fault (GPF).
>>
>> A fault during a page walk signals a bug in the kernel and is handled by
>> oopsing the kernel. A non-page walk fault could be caused by user space
>> having access to a page which has been delegated to the kernel and will
>> trigger a SIGBUS to allow debugging why user space is trying to access a
>> delegated page.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v10:
>>   * Don't call arm64_notify_die() in do_gpf() but simply return 1.
>> Changes since v2:
>>   * Include missing "Granule Protection Fault at level -1"
>> ---
>>   arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
>>   1 file changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index 85e23388f9bb..ea3ae0ca7dba 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -909,6 +909,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>>   	return 0;
>>   }
>>   
>> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	const struct fault_info *inf = esr_to_fault_info(esr);
>> +
>> +	die_kernel_fault(inf->name, far, esr, regs);
>> +	return 0;
>> +}
>> +
>> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
>> +		return 0;
>> +
>> +	return 1;
>> +}
> 
> Is there a valid case for fixup_exception() here? IOW, do we ever have a
> valid user mapping of the pages delegated to a guest? If the above is
> considered a kernel bug, I'd not silently ignore this (like return less
> bytes copied or -EFAULT to user) but rather warn, potentially
> rate-limited.

Good question. This shouldn't be a valid case. We expect the VMM to use
guest_memfd and that should prevent any mmaps and thus fixups shouldn't
be required. That said, this series doesn't enforce that the VMM uses
GMEM backed memslots for Guest RAM. We should probably do that while
mapping things in.

With that, we could drop that fixup and scream a bit.

Cheers
Suzuki

> 
> If there is a real use-case for this, what's preventing GUP + memcpy()
> from triggering a similar fault with no fixup available?
> 



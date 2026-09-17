Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE13C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKri3L78C9WUGE/oZ+xY2BtOYPJ9RfIjm7j/38q/7io=; b=dWGY9awm4/L4QsDHTikkkQQEDX
	M+ewS71qAStyWVWFU1RzLI/bgzSAlqu6jcRIQMemUY8Z2AE2Aa/CxojDEsG8W4fOjL1ELX7swmwi1
	vtlRnUzgzJtf+FjibYKupESSFGDgP4p3rcIF+biBgyojb3Em5GoOlUwrZsYyc5ljO8MOOeOi6X9tb
	cyqyO7KPJHUAjmJMQMgIxPzOsJssZJxEKdkS1ssS0aRkmsoeVCEO6sZaOnblIMmTTd+VGg3xsDqIx
	iP/Z5Ve8PMXlU1mZj4s3lkFo3GjMpuHR82otAyeHhmMuWq/vPuJJhJzaA7ssa1gsEkmxR9erGz+RH
	v1SV2v6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x781d-0000000AwqI-0toc;
	Thu, 17 Sep 2026 09:03:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x781a-0000000AwpG-2GZz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:03:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B80E81476;
	Thu, 17 Sep 2026 02:03:16 -0700 (PDT)
Received: from [10.0.128.139] (unknown [10.0.128.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C9BE3FAA1;
	Thu, 17 Sep 2026 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789635800; bh=H7DYV+GTC/oHo8YbGXHgYOr8KdParA1BZBiqphABHmU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dkj0kbfuI7IiL7YpSyZcZi7LZlvJ0O/YQmyiiNMdPRMKFCWI6B508cxJQglO1aVel
	 kKb5m0Voqhe1auzEBi4BCZzLSTlHuEXNxHm7678XJVsvUPYou8SnT1shjudXR0xIGX
	 Vj4vKBm+vvGH1MBwES6/fam0h85SJsUTzuxUPgNc=
Message-ID: <985520fa-99b0-4620-bfee-8e6321b36104@arm.com>
Date: Thu, 17 Sep 2026 10:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <aqrGPK0lFBFXL2qY@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aqrGPK0lFBFXL2qY@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_020322_676943_3764408E 
X-CRM114-Status: GOOD (  31.20  )
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

Hi Catalin

On 16/09/2026 17:39, Catalin Marinas wrote:
> On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
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
>> There is work in progress to unmap the guest_memfd backed private pages from the
>> linear map. Until we get that support, we could get spurious GPFs from within
>> the kernel, e.g., load_unaligned_zeropad(). So, try to fix them up for now.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v17:
>>   * Pass untagged address to die_kernel_fault() - Sashiko
>>   * Explicitly check !user_mode() for fixups - Catalin
>>   * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
>>   * Clarify the commit description about the upcoming work on
>>     unmapping guest_memfd backed pages from linear map
>> Changes since v16:
>>   * Update the commit description to indicate why we try to fixup GPFs
>> Changes since v10:
>>   * Don't call arm64_notify_die() in do_gpf() but simply return 1.
>> Changes since v2:
>>   * Include missing "Granule Protection Fault at level -1"
>> ---
>>   arch/arm64/mm/fault.c | 30 ++++++++++++++++++++++++------
>>   1 file changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index 75c3e463df2ef..dc3a87902a60c 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -914,6 +914,24 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>>   	return 0;
>>   }
>>   
>> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	const struct fault_info *inf = esr_to_fault_info(esr);
>> +	unsigned long addr = untagged_addr(far);
>> +
>> +	die_kernel_fault(inf->name, addr, esr, regs);
>> +	return 0;
>> +}
>> +
>> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	if (!user_mode(regs) && !is_el1_instruction_abort(esr) &&
>> +	    fixup_exception(regs, esr))
>> +		return 0;
>> +
>> +	return 1;
>> +}
> 
> We discussed briefly offline. With the latest patches around, would we
> ever end up with private memory mapped in the VMM and hence the GPF? If
> not, I would still keep this handling but add a
> WARN_ON_ONCE(user_mode(regs)).
> 
> However, can we end up delegating a non-guest_memfd memslot page as
> protected?
> 
> I played a bit with codex and it reckons it's possible if a guest_memfd
> memslot is deleted after its IPA range has been initialised with
> RIPAS=RAM. Removing the memslot unmaps and undelegates any data pages
> but leaves the RMM state as RAM. The VMM can then install an ordinary
> memslot over the same GPA range.

This should be prevented by the following predicates:

1) Realms only support guest_memfd backed memslots for mappable memory.
2) Memslots cannot be created after the Realm is created, as is with the
protected VMs. (This check seems to have been lost over the iterations,
  but should be reinstated).

> 
> A subsequent private-IPA S2 fault sees the non-guest_memfd slot, takes
> user_mem_abort(), GUPs the user page and passes it to
> realm_map_protected(). The userspace mapping remains present, so a later
> EL0 access can generate a GPF.

The Realm mem abort code should prevent this by ensuring that the
memslot is backed by gmem for private_faults. With the mandate of
in-place conversion, even the shared pages must come from the
gmem backed memslots.

> 
> What's worse, I think it can even trick the kernel into doing a memcpy()
> access (via GUP). Hmm, does such ordinary slot page even remain pinned?
> There are other kernel parts that could access it.
> 
> I don't think it changes this patch but if the above is possible, we
> should definitely get it tightened on the other series (and here we can
> add the warning).

Agreed. I will address these concerns in the kvm part2 of the CCA changes.

Cheers
Suzuki


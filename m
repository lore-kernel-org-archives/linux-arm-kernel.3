Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B3D29C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbhAghH7Nv31WRfjU7jMLge79vKVdc/UbBx9QS042Vg=; b=OJPpH4DBxYFfVvU3n6eVOAA4KQ
	vohSglLqhyQE6LOr7gmRbK6/UqAmVfBSEMi8/1P7vo0AJFt/QEkikWgp2tf8oGnFcaRIu8/nTYHke
	kOde6WstSnyTkM6UH2AYuo0KjU/FzD8giUbWx02eKMpaDITgTfsO0hXmCk/culGNcTCoR4BqHtSfE
	B92dL5N1nsK6srE80xVuvY1FgvtPCO8KKXq+D4kEpmRo5zTGPuEa66N0kCsJUBW3nZQkSNtBxwr0v
	8J8o8VQ82H/73o+hQKT1AqqyBMDAEfQMNYjY7Vd4U1Eg8jdAl5lGH9QX7rXLxob2S7jid8Q20d/dm
	r/KUJmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq9D-00000002EzD-04pc;
	Mon, 19 Jan 2026 14:22:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq98-00000002ExU-2EtJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 751DD497;
	Mon, 19 Jan 2026 06:22:13 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44B383F632;
	Mon, 19 Jan 2026 06:22:15 -0800 (PST)
Message-ID: <4a5c4d68-989c-4657-9cdb-f48a7ff11655@arm.com>
Date: Mon, 19 Jan 2026 14:22:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/47] arm64: mpam: Re-initialise MPAM regs when CPU
 comes online
From: Ben Horgan <ben.horgan@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, will@kernel.org,
 corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-8-ben.horgan@arm.com> <aWkucXgE6g2lwvkj@arm.com>
 <d603ad9c-18a0-40fe-9d0b-2ff31eaf8f30@arm.com>
Content-Language: en-US
In-Reply-To: <d603ad9c-18a0-40fe-9d0b-2ff31eaf8f30@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_062224_634895_A8B2A791 
X-CRM114-Status: GOOD (  33.56  )
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

Hi Catalin,

On 1/19/26 13:38, Ben Horgan wrote:
> Hi Catalin,
> 
> On 1/15/26 18:14, Catalin Marinas wrote:
>> On Mon, Jan 12, 2026 at 04:58:34PM +0000, Ben Horgan wrote:
>>> From: James Morse <james.morse@arm.com>
>>>
>>> Now that the MPAM system registers are expected to have values that change,
>>> reprogram them based on the previous value when a CPU is brought online.
>>>
>>> Previously MPAM's 'default PARTID' of 0 was always used for MPAM in
>>> kernel-space as this is the PARTID that hardware guarantees to
>>> reset. Because there are a limited number of PARTID, this value is exposed
>>> to user-space, meaning resctrl changes to the resctrl default group would
>>> also affect kernel threads.  Instead, use the task's PARTID value for
>>> kernel work on behalf of user-space too. The default of 0 is kept for both
>>> user-space and kernel-space when MPAM is not enabled.
>>>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> ---
>>> Changes since rfc:
>>> CONFIG_MPAM -> CONFIG_ARM64_MPAM
>>> Check mpam_enabled
>>> Comment about relying on ERET for synchronisation
>>> Update commit message
>>> ---
>>>  arch/arm64/kernel/cpufeature.c | 19 ++++++++++++-------
>>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index c840a93b9ef9..0cdfb3728f43 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -86,6 +86,7 @@
>>>  #include <asm/kvm_host.h>
>>>  #include <asm/mmu.h>
>>>  #include <asm/mmu_context.h>
>>> +#include <asm/mpam.h>
>>>  #include <asm/mte.h>
>>>  #include <asm/hypervisor.h>
>>>  #include <asm/processor.h>
>>> @@ -2483,13 +2484,17 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
>>>  static void
>>>  cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
>>>  {
>>> -	/*
>>> -	 * Access by the kernel (at EL1) should use the reserved PARTID
>>> -	 * which is configured unrestricted. This avoids priority-inversion
>>> -	 * where latency sensitive tasks have to wait for a task that has
>>> -	 * been throttled to release the lock.
>>> -	 */
>>> -	write_sysreg_s(0, SYS_MPAM1_EL1);
>>
>> Is this comment about priority inversion no longer valid?
> 
> Yes, will drop it.

Ah, that's done in the patch already. Also, we can't treat 0 as special
without taking it away from userspace and then we're down a partid and
there might be that many.

> 
>  I see thread
>> switching sets the same value for both MPAM0 and MPAM1 registers but I
>> couldn't find an explanation why this is now better when it wasn't
>> before.
> 
> I touch on it in the cover letter. It is the way it is done for x86 and
> so sensible to make it the default. All partids are usable from
> user-space and user-space can't bypass MPAM controls by doing the work
> in the kernel.
> 
> There is a proposal from Babu at AMD, PLZA, which he presented at LPC
> which would give a new interface to  have different configuration,
> closid, for userspace and kernel space. We should be able to use this
> with MPAM too.
> 
>>
>> MPAM1 will also be inherited by IRQ handlers AFAICT.
> 
> Yes, this is a disadvantage of having MPAM1 and MPAM0 change together.
> 
>>
>>> +	int cpu = smp_processor_id();
>>> +	u64 regval = 0;
>>> +
>>> +	if (IS_ENABLED(CONFIG_ARM64_MPAM) && static_branch_likely(&mpam_enabled))
>>> +		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>>> +
>>> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
>>> +	isb();
>>> +
>>> +	/* Synchronising the EL0 write is left until the ERET to EL0 */
>>> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
>>
>> I mentioned before, is it worth waiting until ERET?
> 
> Just for documentation. I can change it if you prefer.
> 
>>
>> Related to this, do LDTR/STTR use MPAM0 or MPAM1? I couldn't figure out
>> from the Arm ARM. If they use MPAM0, then we need the ISB early for the
>> uaccess routines, at least in the thread switching path (an earlier
>> patch).
>>
> 
> They use LDTR/STTR. MPAM doesn't care about which instruction is running.
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben



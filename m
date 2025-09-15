Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D90DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsP3R+ZF+hVxcjwFpE6KpFg8cf57PFLMvrQv+1vYFKY=; b=XfaMyiHydRFcVMLLGjf2qibljL
	SrTRKRlorN9N0WH6LG71+qnBgO+AQ1lDG1fcUj8uOPKPH1IQ72qgbvPSYqz5WRuj674CkJAH2qkBp
	jbSWjIheh8yGdIIdI+pirtogoBgfqHmHT67TBwCx0O7hFUifcYpgJOjgJgdD8hrmHvYVnMBLBJ1et
	O3ajLWEFDnCvBLUb6CbJr7N+Vr3eEITSHGOOIE9X5OJF1csRD4Zsf5CWm12x4UUQu7qxBJjkv5gFr
	2eBdjpHorkAERQ4/1rQjPbA/gDRdKGxohwydRtqwYDL5be+M88FcHdCLU684E6LPxnhCzPMzf3YNA
	zWPv5dJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6rw-00000003nnv-0wu7;
	Mon, 15 Sep 2025 10:55:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6rt-00000003nms-1flB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:55:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 020F21BF7;
	Mon, 15 Sep 2025 03:55:22 -0700 (PDT)
Received: from [10.57.5.5] (unknown [10.57.5.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6C5D3F694;
	Mon, 15 Sep 2025 03:55:24 -0700 (PDT)
Message-ID: <bc17ddc9-ed9d-4d51-93f4-784a73036e7c@arm.com>
Date: Mon, 15 Sep 2025 11:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/43] arm64: RME: Handle Granule Protection Faults
 (GPFs)
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, Marc Zyngier
 <maz@kernel.org>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-3-steven.price@arm.com> <aLGRNc5u1EPlCpyb@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <aLGRNc5u1EPlCpyb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_035533_557581_AF074E6E 
X-CRM114-Status: GOOD (  20.34  )
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

On 29/08/2025 12:38, Catalin Marinas wrote:
> On Wed, Aug 20, 2025 at 03:55:22PM +0100, Steven Price wrote:
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
>> Changes since v2:
>>  * Include missing "Granule Protection Fault at level -1"
>> ---
>>  arch/arm64/mm/fault.c | 31 +++++++++++++++++++++++++------
>>  1 file changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index d816ff44faff..e4237637cd8f 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -854,6 +854,25 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>>  	return 0;
>>  }
>>  
>> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	const struct fault_info *inf = esr_to_fault_info(esr);
>> +
>> +	die_kernel_fault(inf->name, far, esr, regs);
>> +	return 0;
>> +}
> 
> This is fine, it's irrelevant whether the fault happened at EL0 or EL1.
> 
>> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	const struct fault_info *inf = esr_to_fault_info(esr);
>> +
>> +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
>> +		return 0;
>> +
>> +	arm64_notify_die(inf->name, regs, inf->sig, inf->code, far, esr);
>> +	return 0;
>> +}
> 
> The end result is somewhat similar but why not just return 1 and avoid
> the arm64_notify_die() call? Let do_mem_abort() handle the oops vs user
> signal. With die_kernel_fault() we print the "Unable to handle
> kernel..." message and some more information.
> 

Yes, that makes sense - something has gone very wrong if the kernel hits
a GPF but that's no reason not to output a (more) useful message.

Thanks,
Steve


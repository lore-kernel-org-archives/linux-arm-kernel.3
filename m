Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F433C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH71BOlg1Swm0tShW7up4NjgzkdLEtf1EYs8D6p+43A=; b=sCPujxhJxbkQe8aYZgx8bnTUnp
	LMkkD8VEtH69gDxh+6OS8QJt49VnuTv5CnhKbNSASPVXYnWdeolMkIScxs5LRJsH9aWe6aIm6JIeV
	lMfHj1p582IoLrqtn+YMW2H8qX7e/jb0q/3atosID+puZhPG/lLOP/WNZ/GP2b9UJtOCPV8StAJrl
	XmK19mc49sxhZqdH5KX/7kjOyuD+7gDlZ3nNHlXtqmQdlARzgajFkCxplDhntUfIDZt7/S2osaQDU
	5Ckb7tZ6TiHGm+RpwInxhOdEyDOW0at+c/jPRWvph3w2499aYG42uPDVP/t4+DsRKlMg3wPgiOqjL
	OwThQF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sa3-0000000CN0u-1M7m;
	Thu, 24 Sep 2026 23:10:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sa0-0000000CN0Z-1NAF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:10:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35D731E5E;
	Thu, 24 Sep 2026 16:10:11 -0700 (PDT)
Received: from [10.57.10.88] (unknown [10.57.10.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4E2F3F632;
	Thu, 24 Sep 2026 16:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790291414; bh=MAsw4rMdyYBh2hoAHkbiHo4qsLNPNTY9Yrm9SkveIo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fgbfYMYVN+EzRtWlTRoyJsjOW3S1ltkysTXgJlmHnrPtzXUd95RZvly4/GiCRXQPh
	 uZGhWVspu3R2o5Y9gXjO97PXv4/HL2C9nPGX86r8gAk2fH7krIEgXsKATqnHIbdd+N
	 YmxN6b+8BtC9/6uSAZnTVtDzdl7Dxgekziwm3BZ8=
Message-ID: <78236751-8614-470f-9af5-78f160c5e486@arm.com>
Date: Fri, 25 Sep 2026 00:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 4/7] firmware: arm_rmm: Add support for SRO
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-5-suzuki.poulose@arm.com>
 <20260924121356.00000d4d@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260924121356.00000d4d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_161016_733217_AE4BE85B 
X-CRM114-Status: GOOD (  40.72  )
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

On 24/09/2026 20:13, Jonathan Cameron wrote:
> On Thu, 24 Sep 2026 14:51:58 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
>> From: Steven Price <steven.price@arm.com>
>>
>> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
>> means that an SMC can return with an operation still in progress. The
>> host is expected to continue the operation until it reaches a conclusion
>> (either success or failure). During this process the RMM can request
>> additional memory ('donate') or hand memory back to the host
>> ('reclaim'). The host can request an in progress operation is cancelled,
>> but still continue the operation until it has completed (otherwise the
>> incomplete operation may cause future RMM operations to fail).
>>
>> The SRO is tracked using a struct rmi_sro_state object which keeps track
>> of any memory which has been allocated but not yet consumed by the RMM
>> or reclaimed from the RMM. This allows the memory to be reused in a
>> future request within the same operation. It will also permit an
>> operation to be done in a context where memory allocation may be
>> difficult (e.g. atomic context) with the option to abort the operation
>> and retry the memory allocation outside of the atomic context. The
>> memory stored in the struct rmi_sro_state object can then be reused on
>> the subsequent attempt.
>>
>> Wrappers for SRO RMI commands are also provided here because they depend
>> on the rmi_sro_execute() implementation added by this patch.
>> Delegate/undelegate handles are also added here because they now use the
>> SRO/stateful command infrastructure and are also used for the memory
>> DONATE/RECLAIM flows.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Nice.  Everything I spotted this time around is pretty trivial.
> So assuming you'll clean up and bits that make sense to you for v20
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 

Thanks, respones inline.

...


>> +
>> +int rmi_undelegate_range(phys_addr_t phys,
>> +			 unsigned long size)
>> +{
>> +	long ret = 0;
>> +	unsigned long top = phys + size;
>> +	unsigned long out_top;
>> +
>> +	while (phys < top) {
>> +		ret = rmi_granule_range_undelegate(phys, top, &out_top);
>> +
>> +		if (ret == RMI_SUCCESS) {
>> +			/* Buggy RMM ? Let the caller leak the pages */
>> +			if (WARN_ON(out_top <= phys))
>> +				return -ENXIO;
>> +			phys = out_top;
>> +		} else {
> 
> Similar to below, why not deal with error case first and reduce indent of
> the good path.
> 

...

>> + */
>> +int rmi_delegate_range(phys_addr_t phys,
>> +		       unsigned long size,
>> +		       phys_addr_t *out_phys)
>> +{
>> +	long ret = 0;
>> +	unsigned long top = phys + size;
>> +	unsigned long out_top;
>> +
>> +	while (phys < top) {
>> +		ret = rmi_granule_range_delegate(phys, top, &out_top);
>> +
>> +		if (ret == RMI_SUCCESS) {
> 
> My instinct here would be to flip this and have the error out of line given
> it breaks anyway and that gives you smaller indent for that ocmment block.
> 
> 		if (ret != RMI_SUCCESS)
> 			break;
> 
> 		/*
> 		 * Buggy RMM ? Let the caller handle the failure. We can't know
> 		 * how far the RMM delegated in this iteration, so we return
>   		 * the best known good limit. RMM can deal with granules
> 		 * already in "undelegated" in a given range. So, it is fine
> 		 * for the caller to try the range we return.
> 		 */
> 		if (WARN_ON...
> 

Agree, it looks much cleaner. I have done that.
>> +
>> +static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
>> +				    unsigned long sro_handle,
>> +				    unsigned long donatereq,
>> +				    struct arm_smccc_1_2_regs *out_regs,
>> +				    gfp_t gfp)

...

>> +
>> +	/* Gather the suitable entries to the end of the list */
>> +	i = 0;
>> +	while (i <  addr_list_start && found < count) {
>> +		unsigned long entry = sro->addr_list[i];
>> +
>> +		if (RMI_ADDR_RANGE_BLOCK_SIZE(entry) == block_size_fld &&
>> +		    RMI_ADDR_RANGE_COUNT(entry) == 1 &&
>> +		    RMI_ADDR_RANGE_STATE(entry) == state) {
>> +			addr_list_start--;
>> +			swap(sro->addr_list[addr_list_start],
>> +			     sro->addr_list[i]);
>> +			found++;
>> +			/* Continue from the swapped in entry */
>> +			continue;
>> +		}
>> +		/* skip past the entry */
> 
> Bit random on comment capitalization.  Have a quick final look through.
> For instance I think this one is Skip to match Continue above.
> 

Ack

>> +		i++;
>> +	}
> 
> ...
> 
> 
>> +
>> +static int rmi_sro_reclaim(struct rmi_sro_state *sro,
>> +			   unsigned long sro_handle,
>> +			   struct arm_smccc_1_2_regs *out_regs)
>> +{
>> +	unsigned long capacity;
>> +
>> +	/*
>> +	 * We don't do a partial free of the entries. So for
>> +	 * now free the entire address list as we prepare
>> +	 * to reclaim more from the RMM.
> 
> Rewrap to use all that nice space up to 80 chars!  I guess a refactoring
> side effect.
> 

Ack

>> +}
> 
>> +
>> +long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp)
>> +{
>> +	struct arm_smccc_1_2_regs *regs = &sro->regs;
>> +	bool cancelled = false;
>> +	unsigned long sro_handle;
>> +
>> +	rmi_smccc_invoke(regs);
>> +
>> +	sro_handle = regs->a1;
>> +	while (RMI_RESULT_STATUS(regs->a0) == RMI_INCOMPLETE) {
>> +		bool can_cancel = RMI_RESULT_CAN_CANCEL(regs->a0) == RMI_OP_CAN_CANCEL;
> 
> For a flag that is "can" or "cannot", do we need the RMI_OP_CAN_CANCEL (1) / RMI_OP_CANNOT_CANCEL (0)
> defines?  Doesn't feel like we'll ever get RMI_OP_UNKNOWN_IF_IT_CAN_CANCEL and I can't think
> of any other more reasonable options that would justify needing the explicit field value
> match.
> 
> To me
> 
> 		bool can_cancel = RMI_RESULT_CAN_CANCEL(regs->a0);
> 
> is obvious enough.  I don't care that much though so up to you.
> 

Yep, this was the original form and I changed it based on Gavin's
feedback. I would leave it as it is, to avoid another churn.



>> +	if (cancelled)
>> +		return -ECANCELED;
>> +
>> +	return regs->a0;
>> +}
>> +EXPORT_SYMBOL_GPL(rmi_sro_memxfer_execute);
>> +
>> +/*
>> + * rmi_sro_execute: Execute an RMI command that is Stateful but not memory
>> + * tranfserring. Takes regs, filled with the FIDs and the arguments in place.
> 
> Spell check. Transferring.  Also why does Stateful get a capital letter and
> Memory Transferring does not.  They seem to both be properties of the comman
> so I'd expect some consistency.

Ack

Thank you for the review !

Suzuki


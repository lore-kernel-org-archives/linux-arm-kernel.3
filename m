Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE5BC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGBJe87/zbj8xDhB6GNjb/Bx/0zj90UGss5bHoTzyXU=; b=xEqTbQehiujJLX9Ei+UarOlFAx
	VeGQWXBc5pL1YaX9c/+smSYzkcGDnRfxf5PeyOnNDN84hdediTJum0XUGCAcqaKQ1DKv5/Qfw/Uop
	bTtMCQI5XKI8WgGfIPq8NJjRv3za0bIq2d9ggnIlWcbG6BDArog/LXASAeuxMv6xtHFquaU3aYwaI
	opFk4Xlgjzr5kDLH97rrW3BWdh3Z86fcSUSopNog72q9YT1he/bNYcWUl9e1//ng6/vKn5HmESeo9
	f06y4DVaSqYMpoRG2RSUu31vMjKA41HD+f+58jJP8Wspp+m06cXqP1EDFOUYSDwXgxQnpBR1xPUbb
	2wIgjPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x605q-00000002Qdh-1Leo;
	Mon, 14 Sep 2026 06:23:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x605m-00000002Qd7-3QSs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:23:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF8FD1570;
	Sun, 13 Sep 2026 23:22:56 -0700 (PDT)
Received: from [10.57.10.40] (unknown [10.57.10.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF083F7B4;
	Sun, 13 Sep 2026 23:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789366980; bh=A33RJV2D0AN0N24mCbcvU4G5DcOAvXGh3mPfTyTsEU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=op48qBzZwgyfzF0VPAvSFLZzpF+trv27JNawXFVF37FvxQcTi/T7McDrcQdOOdqnR
	 82revSNtVjf5WuXwOqH8296xhdLN6t0a4jwy5DE4u9ztN6VUJH0fqQjATMhu26amVa
	 gYrvzph+gXtKvfYuEiUsh3aj1Dh1G/kspPvLWsWY=
Message-ID: <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
Date: Mon, 14 Sep 2026 07:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/7] firmware: arm_rmm: Add support for SRO
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-5-suzuki.poulose@arm.com>
 <f00d01d1-8df0-4865-8e52-c85171cf4ca5@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <f00d01d1-8df0-4865-8e52-c85171cf4ca5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_232303_865613_3F5E2FD2 
X-CRM114-Status: GOOD (  37.31  )
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

Hi Gavin

Thank you for the review, I will address most of them. Responses inline.

On 14/09/2026 06:04, Gavin Shan wrote:
> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
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
>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>



>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 586 +++++++++++++++++++++++++++++++++
>>   include/linux/arm-rmi-cmds.h   |  41 +++
>>   2 files changed, 627 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ 
>> arm_rmm/rmi.c
>> index 5b0e342ce3d58..4f9898ece7547 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c

> 
> I would drop rmi_granule_range_{delegate, undelegate}() by combining 
> their logics to
> their only callers rmi_{delegate, undelegate}_range(). More details are 
> provided for
> rmi_{delegate, undelegate}_range() in the below.

Ack


> 
>> +int rmi_delegate_range(phys_addr_t phys,
>> +               unsigned long size,
>> +               phys_addr_t *out_phys)
>> +{
>> +    long ret = 0;
>> +    unsigned long top = phys + size;
>> +    unsigned long out_top;
>> +
>> +    while (phys < top) {
>> +        ret = rmi_granule_range_delegate(phys, top, &out_top);
>> +
>> +        if (ret == RMI_SUCCESS) {
>> +            /* Buggy RMM ? */
>> +            if (WARN_ON(out_top <= phys)) {
>> +                rmi_undelegate_range(top - size, size);
> 
> [top - size, size] is incorrect because we may be delegating a sub-range 
> of the
> range of granules. It's actually the caller's responsibility to 
> undelegate the
> graunles that have been delegated.
> 
>              if (WARN_ON(out_top <= phys)) {
>                  ret = -ENXIO;
>                  break;
>              }

Agree, I have done this already based on Sashiko review, and added a 
comment too.



> 
>> +/*
>> + * Convert the RmiAddrBlockSize to actual size. This is used in 
>> RmiDonateReq
>> + * and RmiAddrRangeDesc*.
>> + */
>> +static unsigned long rmi_addr_block_size_to_bytes(unsigned long 
>> block_size_fld)
>> +{
>> +    return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(3 - block_size_fld));
>> +}
>> +
>> +/*
>> + * free_addr_range: Free memory described by the address range entry, 
>> which may
>> + *            be partially consumed by RMM.
>> + *
>> + * @entry: RMI_ADDR_RANGE descriptor
>> + * @consumed_size: Page aligned size consumed by the RMM from the 
>> address range.
>> + *
>> + * If the state of the address is DELEGATED, undelegate it back, 
>> before freeing.
>> + * Leaks the memory if we cannot undelegate the range.
>> + */
>> +static void free_addr_range(unsigned long entry, unsigned long 
>> consumed_size)
>> +{
>> +    unsigned long phys = RMI_ADDR_RANGE_ADDR(entry);
>> +    unsigned long block_size_fld = RMI_ADDR_RANGE_BLOCK_SIZE(entry);
>> +    unsigned long count = RMI_ADDR_RANGE_COUNT(entry);
>> +    unsigned long state = RMI_ADDR_RANGE_STATE(entry);
>> +    unsigned long size = rmi_addr_block_size_to_bytes(block_size_fld) 
>> * count;
>> +
>> +    WARN_ON(!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(consumed_size));
>> +
>> +    /* Adjust the address and size for partially consumed entry */
>> +    phys += consumed_size;
>> +    size -= consumed_size;
>> +    /*
>> +     * Undelegate the pages back if required. If we can't
>> +     * change them back, leak the pages.
>> +     */
>> +    if (state == RMI_OP_MEM_DELEGATED &&
>> +        WARN_ON(rmi_undelegate_range(phys, size)))
>> +        return;
>> +    free_pages_exact(phys_to_virt(phys), size);
>> +}
>> +
>> +static void rmi_op_continue(unsigned long sro_handle, unsigned long 
>> flags,
>> +                struct arm_smccc_1_2_regs *out_regs)
>> +{
>> +    *out_regs = (struct arm_smccc_1_2_regs) {
>> +        SMC_RMI_OP_CONTINUE, sro_handle, flags
>> +    };
>> +
>> +    rmi_smccc_invoke(out_regs);
>> +}
>> +
> 
> The pattern 'regs' is used in some of the 'struct arm_smccc_1_2_regs' 
> arguments
> or variables in this series, which is incosistent to the existing 
> patterns which
> is either 'args' or 'res' by searching the source files using 'git grep 
> arm_smccc_1_2_regs'.
> So I would suggest we have the fixed the pattern 'args' :-)


I would prefer to keep it "regs" as, unlike the smccc_1_1 calls, we
pass "arm_smccc_1_2_regs" for both arguments and results. In this case
we are using a single structure, so, to avoid the confusion, I
intentionally used regs

> 

>> +
>> +int rmi_free_delegated_page(phys_addr_t phys)
>> +{
>> +    if (WARN_ON_ONCE(rmi_undelegate_page(phys))) {
>> +        /* Undelegate failed: leak the page */
>> +        return -EBUSY;
>> +    }
>> +
>> +    free_page((unsigned long)phys_to_virt(phys));
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(rmi_free_delegated_page);
>> +
> 
> I would move rmi_free_delegated_page() right after rmi_undelegate_range().

Ack


>> +
>> +static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
>> +                    unsigned long sro_handle,
>> +                    unsigned long donatereq,
>> +                    struct arm_smccc_1_2_regs *out_regs,
>> +                    gfp_t gfp)
>> +{
>> +    unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
>> +    unsigned long block_size = 
>> rmi_addr_block_size_to_bytes(block_size_fld);
>> +    unsigned long count = RMI_DONATE_COUNT(donatereq);
>> +    unsigned long state = RMI_DONATE_STATE(donatereq);
>> +    unsigned long found = 0;
>> +    unsigned long donated_granules;
>> +    unsigned long granules_per_block = block_size >> PAGE_SHIFT;
>> +    unsigned long consumed_blocks;
>> +    int addr_list_start = sro->addr_count;
>> +
>          ^^^^^^
> 
> Unecessary blank line.

Removed

...

>> +
>> +void rmi_sro_free(struct rmi_sro_state *sro)
>> +{
>> +    /* Handle the worse */
>> +    if (WARN_ON(sro->addr_count < 0))
>> +        return;
>> +
>> +    if (WARN_ON(sro->addr_count > RMI_MAX_ADDR_LIST))
>> +        sro->addr_count = RMI_MAX_ADDR_LIST;
>> +
>> +    for (int i = 0; i < sro->addr_count; i++)
>> +        free_addr_range(sro->addr_list[i], 0);
>> +
>> +    sro->addr_count = 0;
>> +}
>> +EXPORT_SYMBOL_GPL(rmi_sro_free);
>> +
>> +long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp)
>> +{
>> +    struct arm_smccc_1_2_regs *regs = &sro->regs;
>> +    bool cancelled = false;
>> +    unsigned long sro_handle;
>> +
>> +    rmi_smccc_invoke(regs);
>> +
>> +    sro_handle = regs->a1;
>> +    while (RMI_RETURN_STATUS(regs->a0) == RMI_INCOMPLETE) {
>> +        bool can_cancel = RMI_RETURN_CAN_CANCEL(regs->a0) == 
>> RMI_OP_CAN_CANCEL;
>> +        int ret = 0;
>> +
>> +        switch (RMI_RETURN_MEMREQ(regs->a0)) {
>> +        case RMI_OP_MEM_REQ_NONE:
>> +            rmi_op_continue(sro_handle, RMI_CONTINUE_KEEP_GOING,
>> +                    regs);
>> +            break;
>> +        case RMI_OP_MEM_REQ_DONATE:
>> +            ret = rmi_sro_donate(sro, sro_handle, regs->a2, regs,
>> +                         gfp);
>> +            break;
>> +        case RMI_OP_MEM_REQ_RECLAIM:
>> +            ret = rmi_sro_reclaim(sro, sro_handle, regs);
>> +            break;
>> +        default:
>> +            ret = WARN_ON_ONCE(1);
>> +            break;
> 
> "ret = WARN_ON_ONCE(1)" is same to "ret = true". I guess we would return
> -EINVAL here.
> 
>              WARN_ON_ONCE(1);
>              ret = -EINVAL;
>              break;

Ack, this should be -ENXIO

Cheers



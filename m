Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF072C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37LwD6uHtA7VCnOHwOtekbl7cwuVLehUVkaQX9JicKo=; b=3zV145W7rQ2ZxjLzye5XCp9zlR
	nglXh0O3qw28PZmheT2HUJHe2xDRWT1LyWupX5ZmatfVfWbnROdrZ/8PH7YSyQvkchRLZetExNi/n
	bV1x6G4ReSQFQSxrVoOcOTFQ20YB7b8jym/MHllBw/GANz6Ev9ES6xWI1fc1y7utABZL6+96unhs1
	E6rrGXSullBn0XBztE8auGIYjodD0OWm4f/+akVcJKFjvKdQevhx+FZiyGrqy7ssG9y4syn77FtDq
	MPDWdi2XrlbnlJ96TJw1Y7Fww61aj3Z0UZAmkj3rsZ5MnZwY3Ger3MchYfbxovU4cahRVSK8e2enc
	9XQcGSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7aY-0000000DitF-06ex;
	Fri, 25 Sep 2026 15:11:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7aL-0000000DipF-0sMq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:11:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 108581688;
	Fri, 25 Sep 2026 08:11:31 -0700 (PDT)
Received: from [10.57.10.17] (unknown [10.57.10.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DAFF3F86F;
	Fri, 25 Sep 2026 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790349094; bh=wPC5lNilhf3g0ykmlhDe9z3lcOVejBMEEngMil4nDQo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jQXFy/Z+hOKQzu4smPueogxcbPLKqe0jGtvG3FjpRmixbGar4J4NYMXhPcPqog6MN
	 HqUWHnxdA4c+Za2T8HTRoyf8J3kkA2wTdECa34oWJL1t6xpZsznO0zJkB+9tFCcylg
	 YDluTrvH3SJmD+BpUvnInL/ivQfaLlpO2Q65Iqtg=
Message-ID: <0c959443-6d4f-4dba-957c-420cb128b7cc@arm.com>
Date: Fri, 25 Sep 2026 16:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 4/7] firmware: arm_rmm: Add support for SRO
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-5-suzuki.poulose@arm.com> <arZgDmHV8uK1kv8R@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <arZgDmHV8uK1kv8R@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081138_132908_F6323D5F 
X-CRM114-Status: GOOD (  22.82  )
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

On 25/09/2026 12:50, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 02:51:58PM +0100, Suzuki K Poulose wrote:
>> +static int rmi_sro_donate_contig(struct rmi_sro_state *sro,
>> +				 unsigned long sro_handle,
>> +				 unsigned long donatereq,
>> +				 struct arm_smccc_1_2_regs *out_regs,
>> +				 gfp_t gfp)
>> +{
>> +	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
>> +	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
>> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
>> +	unsigned long state = RMI_DONATE_STATE(donatereq);
>> +	unsigned long size = block_size * count;
>> +	unsigned long addr_range;
>> +	unsigned long donated_granules;
>> +	unsigned long donated_size;
>> +	int ret;
>> +	void *virt;
>> +	phys_addr_t phys;
>> +
>> +	/*
>> +	 * The RMM specification requires contiguous allocations are always a
>> +	 * power of 2
>> +	 */
>> +	if (WARN_ON_ONCE(!is_power_of_2(size)))
>> +		return -EINVAL;
>> +
>> +	/* Reuse the cached address range if we have one */
>> +	for (int i = 0; i < sro->addr_count; i++) {
>> +		unsigned long entry = sro->addr_list[i];
>> +
>> +		if (RMI_ADDR_RANGE_BLOCK_SIZE(entry) == block_size_fld &&
>> +		    RMI_ADDR_RANGE_COUNT(entry) == count &&
>> +		    RMI_ADDR_RANGE_STATE(entry) == state &&
>> +		    IS_ALIGNED(RMI_ADDR_RANGE_ADDR(entry), size)) {
>> +			sro->addr_count--;
>> +			swap(sro->addr_list[sro->addr_count],
>> +			     sro->addr_list[i]);
>> +
>> +			goto mem_donate;
>> +		}
>> +	}
>> +
>> +	ret = rmi_sro_ensure_capacity(sro, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	virt = alloc_pages_exact(size, gfp);
>> +	if (!virt)
>> +		return -ENOMEM;
>> +	phys = virt_to_phys(virt);
>> +
>> +	if (state == RMI_OP_MEM_DELEGATED) {
>> +		phys_addr_t delegated_phys;
>> +
>> +		if (rmi_delegate_range(phys, size, &delegated_phys)) {
>> +			if (!rmi_undelegate_range(phys, delegated_phys - phys))
>> +				free_pages_exact(virt, size);
>> +			return -ENXIO;
>> +		}
>> +	}
>> +
>> +	addr_range = phys & RMI_ADDR_RANGE_ADDR_MASK;
>> +	FIELD_MODIFY(RMI_ADDR_RANGE_BLOCK_SIZE_MASK, &addr_range, block_size_fld);
>> +	FIELD_MODIFY(RMI_ADDR_RANGE_COUNT_MASK, &addr_range, count);
> 
> Courtesy of an LLM - if we get a contiguous/4K pages request for 4MB
> (1024 pages), the above 10-bit field becomes 0. Should we reject the
> request or the updated spec will guarantee this won't happen?

The spec is being updated to clamp the "maximum" count to match the
granule size. (Also called out in the Cover letter as "Known Issues")
This will be available with beta4 version of the spec.

> 
> Somewhat related, with RMI_BLOCK_L2 or higher and appropriate count we
> can easily go over the MAX_PAGE_ORDER allocation and fail alloc_pages()
> (the contig case). IIUC, the kernel can reject the donation but current
> TF-RMM does not report RMI_OP_CAN_CANCEL (R_SZVNK says it can be
> cancelled). It gets complicated if we want to support large contiguous

Ack, I will get this fixed in the TF-RMM.

> allocations here (e.g. alloc_contig_pages() can sleep). I'd rather just
> cancel the request, not support such large sizes.
> 
> [...]
> 
>> +static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
>> +				    unsigned long sro_handle,
>> +				    unsigned long donatereq,
>> +				    struct arm_smccc_1_2_regs *out_regs,
>> +				    gfp_t gfp)
>> +{
>> +	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
>> +	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
>> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
>> +	unsigned long state = RMI_DONATE_STATE(donatereq);
>> +	unsigned long found = 0;
>> +	unsigned long donated_granules;
>> +	unsigned long granules_per_block = block_size >> PAGE_SHIFT;
>> +	unsigned long consumed_blocks;
>> +	int addr_list_start = sro->addr_count;
>> +	int ret, i;
> 
> [...]
> 
>> +	for (int i = 0, src = addr_list_start + consumed_blocks;
> 
> Nit: we have 'int ret, i' earlier already, so you can drop the 'int'
> here.
> 
> [...]
> 
>> +/*
>> + * rmi_sro_execute: Execute an RMI command that is Stateful but not memory
>> + * tranfserring. Takes regs, filled with the FIDs and the arguments in place.
>> + *
>> + * Returns :
>> + *  -ECANCELLED - If the operation had to be aborted and SRO was cancellable.
> 
> Nit: -ECANCELED.
> 

Ack

>> + *  Otherwise, returns the result of the RMI command.
>> + */
>> +long rmi_sro_execute(struct arm_smccc_1_2_regs *regs)
>> +{
>> +	bool cancelled = false;
>> +	unsigned long sro_handle = regs->a1;
>> +
>> +	rmi_smccc_invoke(regs);
>> +
>> +	sro_handle = regs->a1;
> 
> Nit: drop the first initialisation maybe?

Of course, I will do that. Thanks for spotting.

Suzuki

> 



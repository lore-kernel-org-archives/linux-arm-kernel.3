Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A3AC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0S3li9Bqt2bmvWzA3H4R51AJ0liwA7cd4Jrmw8r290=; b=WocQGqCBDZegtSTnLen8BTM0Uv
	bpZLajxnGA8AL7nkaZpXjzYbM1jE8DyFMnJqoRsxMHtX3Q0ftTbUaNoGMjiIcLRzXDIcQuIe+jzva
	wpoiuH/Ns8DF4qyAELKzYX+LTm3qMY9tMykYnVC/mf4U9kBB4hPzPjyJceSHBu+T4SA76Rr4g7V4Q
	qN3LfnWFEdoO35HxmbjNV6VcgezQUILzjkL/1IO3MW7Z+w5YjW+lycJmaJdOrq+m8PC5BhSWwIriN
	J4yKou28wGL38nJaJ9QjRl2SIVQzXPIHUtFBk/4nT16aETNCKJTY9bs86lujl+DK43xKjYShmiFTz
	8icKfm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Mm-00000000K2g-2GSN;
	Mon, 28 Sep 2026 10:13:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Mj-00000000K28-2LVD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 10:13:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83A0D1595;
	Mon, 28 Sep 2026 03:13:40 -0700 (PDT)
Received: from [10.57.12.79] (unknown [10.57.12.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F3253F86F;
	Mon, 28 Sep 2026 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790590424; bh=L4rj5sebU0MgVvbIqYSRSR7LTOTUxoD15WXyP2ljPok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FtXcuGe5Bf9/0/FkzKwLKEy+JoJg8ovzaYSX2D2/AliXaV5Mu/9pP37XIhE5v6fV3
	 zwG/SPm1X9FHl8h9u4+rG242LQ2Y7sNXNJEj09s0mPMYE1rl1NvyZRqzOeDT+hBKCE
	 BAvBPp1hyT7DyFZ0607j5nyKtRA6XXRnoD1oNYF4=
Message-ID: <4fabad44-280f-40e6-95bb-49011cd2f185@arm.com>
Date: Mon, 28 Sep 2026 11:13:39 +0100
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
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Gareth Stockwell <Gareth.Stockwell@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-5-suzuki.poulose@arm.com> <arozNIQ-fQ0XQViI@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <arozNIQ-fQ0XQViI@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_031345_807317_7898A01D 
X-CRM114-Status: GOOD (  22.80  )
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

On 28/09/2026 10:28, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 02:51:58PM +0100, Suzuki K Poulose wrote:
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
>> +		int ret = 0;
>> +
>> +		switch (RMI_RESULT_MEMREQ(regs->a0)) {
>> +		case RMI_OP_MEM_REQ_NONE:
>> +			rmi_op_continue(sro_handle, RMI_CONTINUE_KEEP_GOING,
>> +					regs);
>> +			break;
>> +		case RMI_OP_MEM_REQ_DONATE:
>> +			ret = rmi_sro_donate(sro, sro_handle, regs->a2, regs,
>> +					     gfp);
>> +			break;
>> +		case RMI_OP_MEM_REQ_RECLAIM:
>> +			ret = rmi_sro_reclaim(sro, sro_handle, regs);
>> +			break;
>> +		default:
>> +			WARN_ON_ONCE(1);
>> +			ret = -ENXIO;
>> +			break;
>> +		}
> 
> Another thing I came across while looking whether we can defer the
> activation. It seems that the spec (I_JVYCH) lists some SROs as
> PE-bound. Nothing here or in rmi_sro_execute() disables migration and
> the memory allocation paths can even sleep with GFP_KERNEL.

No, this is not required. I agree this is confusing. I will get it
clarified.

So, there are two different sources for the SRO contexts. One is a 
global pool and the other an Object.

e.g., For an RMI operation on an Object, SRO context can be the object
itself (e.g., REC_CREATE, REALM_ACTIVATE etc.)

However, when there is no reliable object for the command (e.g., 
RMI_GRANULE_RANGE_DELEGATE), the RMM must allocate a context from
the global pool. Now, the "PE" in there comes from a recommendation
to the RMM implementations, that the global pool size must depend on
the number of PEs on the system. This doesn't mean that the SRO
handles are only bound to those PEs. I will get this clarified
in the RMM spec.

Cheers
Suzuki



> 
> Do we need to disable preemption (only for rmi_sro_execute()) or at
> least migration (the memxfer path)? We did something similar for the RSI
> attestation token loop, commit 24f55f511b9e ("virt: arm-cca-guest: use
> migrate_disable() for attestation token requests").
> 
> With only migration disabled, another thread on the same CPU
> issuing a PE-bound SRO would get RMI_BLOCKED (R_NDXSG). In theory, we
> can get a priority inversion case (maybe this doesn't happen with the
> current implementation, just looking at the API design). The RMI_BLOCKED
> fix not to loop forever probably saves us but the caller would have to
> actively sleep or give up before retrying (i.e. don't move the busy loop
> higher app the call stack).
> 
> Another option is to have a per-CPU mutex here and serialise the SROs
> which are PE-bound (there are some precedents for per-CPU mutexes in the
> kernel).
> 



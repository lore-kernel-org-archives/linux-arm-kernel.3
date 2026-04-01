Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8CD10F9318
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 03:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IF8Z9mFAtPj7euiyVmjamYae6SQyfwASeIY7+t/3bD8=; b=WEHrEISYJvkuOKusQGGeA+XmWN
	r2gOO53+gSHF78HciqGOpd/K/NGVfz2RMCURObK3zSrhHjG/KLoIEQvTx4B4PCWsbLfaMb4HceYdN
	H0CknLhC6IcHHZMBwcJ3LUb1Qv2BkbRzM6YFVW4n47wxF/vuke//DJIFo44iccQZpxpAcDtfFEMU1
	Jj6yP7ZwUaKqDn9f3IKQV3OS86pF9F/7MAV3Qdim578h50IQH3AMFhAWHnBLImnmhgiRyIhCX7fdB
	fS1btd8rjlOi2QZd8FfmDWhSpaFs7H4QnBBMBgH3SU1E/BOxg1WsrLOWD68sjBfZO2s2Ac/sXq8m1
	RfRni7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mJH-0000000DuD5-0tQd;
	Wed, 01 Apr 2026 03:32:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mJD-0000000DuCk-3TZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 03:32:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D31C1684;
	Tue, 31 Mar 2026 20:31:52 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6308A3F915;
	Tue, 31 Mar 2026 20:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775014318; bh=WQ+KEm8xFn0t5qjWAUO9gaCRDBLI+lp9cJIfjjEBDJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=svdhk/IhVgvaxgaP8TO6CNNKVFPJ4rwyLQE7T2h9CiBJ3hger1O2E/RBv827KXxvk
	 48ForGE6V8veBwOgGAHE0ddP99IOU94w8PAcc/2yeKnwIMWTXYgu+fFDyWzBPPFuzg
	 2VIzPTKq1a0IEoPpuW9v7l4k4npGrAYBe1aA1wlE=
Message-ID: <845aa4cd-b7a9-4509-bc25-803dfb57031e@arm.com>
Date: Wed, 1 Apr 2026 09:01:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/30] KVM: arm64: Kill write_fault from kvm_s2_fault
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-20-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-20-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_203200_025499_D5744B86 
X-CRM114-Status: GOOD (  17.35  )
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

On 27/03/26 5:06 PM, Marc Zyngier wrote:
> We already have kvm_is_write_fault() as a predicate indicating
> a S2 fault on a write, and we're better off just using that instead
> of duplicating the state.
> 
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/arm64/kvm/mmu.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 981c04a74ab7a..7dab0c3faa5bf 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1711,7 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>  }
>  
>  struct kvm_s2_fault {
> -	bool write_fault;
>  	bool exec_fault;
>  	bool writable;
>  	bool topup_memcache;
> @@ -1799,7 +1798,7 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>  		return ret;
>  
>  	fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, fault),
> -				       fault->write_fault ? FOLL_WRITE : 0,
> +				       kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
>  				       &fault->writable, &fault->page);
>  	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
>  		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> @@ -1850,7 +1849,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>  			 */
>  			fault->s2_force_noncacheable = true;
>  		}
> -	} else if (fault->logging_active && !fault->write_fault) {
> +	} else if (fault->logging_active && !kvm_is_write_fault(s2fd->vcpu)) {
>  		/*
>  		 * Only actually map the page as writable if this was a write
>  		 * fault.
> @@ -1980,21 +1979,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>  	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> -	bool write_fault = kvm_is_write_fault(s2fd->vcpu);
>  	bool logging_active = memslot_is_logging(s2fd->memslot);
>  	struct kvm_s2_fault fault = {
>  		.logging_active = logging_active,
>  		.force_pte = logging_active,
>  		.prot = KVM_PGTABLE_PROT_R,
> -		.write_fault = write_fault,
>  		.exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
> -		.topup_memcache = !perm_fault || (logging_active && write_fault),
> +		.topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
>  	};
>  	void *memcache;
>  	int ret;
>  
> -	VM_WARN_ON_ONCE(fault.write_fault && fault.exec_fault);
> -
>  	/*
>  	 * Permission faults just need to update the existing leaf entry,
>  	 * and so normally don't require allocations from the memcache. The



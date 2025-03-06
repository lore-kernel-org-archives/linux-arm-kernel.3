Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D0DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ibqm7bi3avKEbtVGx8UQKMDen39BBhEaChe5vShcZGg=; b=0GLXxUUljTny73kbAsEGsgT0La
	RCsPnQ2XFoQ6xRcVCsq3Djmv6D1Sbu1SShkfdptvx9t6g2IfVZzgl9kB/fa5NHVTKFAcxbO0BoPbd
	vupj1Ul+umtk4x6ui9xeYeYLXHgGZ8+YqZH7TeMDaS3gwbv0wHxkFlL2YiR61HWOIwVmFupl5tkIW
	QNa9Iqw7Q4qPhae9k69+F1eNRyTRqlJ3o+jErW+ecMB8E1+AHI/hRbqOK7MhiLYSxg4srPFIt/Hgz
	Cw8n1UZ/p8Y1QhpawlU0/CQSO0ojMXHt0Vh6bvG1Lxq0Yd0bxBt/klubQFUPiQC1B0Et8fiOw4au5
	nTI93EIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEP5-0000000BZYS-3Qa8;
	Thu, 06 Mar 2025 16:48:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD9C-0000000BJxo-0dnq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:28:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32121007;
	Thu,  6 Mar 2025 07:28:41 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE6543F66E;
	Thu,  6 Mar 2025 07:28:27 -0800 (PST)
Message-ID: <03dc25a3-c8a6-443b-ade7-2d3f69f2d0f4@arm.com>
Date: Thu, 6 Mar 2025 15:28:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: mm: Handle PAN faults on uaccess CPY*
 instructions
To: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tong Tiangen <tongtiangen@huawei.com>,
 James Morse <james.morse@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
 <20250228170006.390100-3-kristina.martsenko@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250228170006.390100-3-kristina.martsenko@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_072830_487137_707B25E1 
X-CRM114-Status: GOOD (  19.40  )
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

On 28/02/2025 5:00 pm, Kristina Martšenko wrote:
> A subsequent patch will use CPY* instructions to copy between user and
> kernel memory. Add handling for PAN faults caused by an intended kernel
> memory access erroneously accessing user memory, in order to make it
> easier to debug kernel bugs and to keep the same behavior as with
> regular loads/stores.

I'd be tempted to fold the search_exception_tables() call into 
insn_may_access_user() itself, but either way,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
> ---
>   arch/arm64/include/asm/extable.h |  3 +++
>   arch/arm64/mm/extable.c          | 11 +++++++++++
>   arch/arm64/mm/fault.c            |  4 +++-
>   3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/extable.h b/arch/arm64/include/asm/extable.h
> index 5892b8977710..0a8cb2015c97 100644
> --- a/arch/arm64/include/asm/extable.h
> +++ b/arch/arm64/include/asm/extable.h
> @@ -33,6 +33,9 @@ do {							\
>   	(b)->data = (tmp).data;				\
>   } while (0)
>   
> +bool extable_insn_may_access_user(const struct exception_table_entry *ex,
> +				  unsigned long esr);
> +
>   #ifdef CONFIG_BPF_JIT
>   bool ex_handler_bpf(const struct exception_table_entry *ex,
>   		    struct pt_regs *regs);
> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index afb5241e4d91..f137596dda88 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -20,6 +20,17 @@ static bool cpy_faulted_on_uaccess(const struct exception_table_entry *ex,
>   	return uaccess_is_write == fault_on_write;
>   }
>   
> +bool extable_insn_may_access_user(const struct exception_table_entry *ex,
> +				  unsigned long esr)
> +{
> +	switch (ex->type) {
> +	case EX_TYPE_UACCESS_CPY:
> +		return cpy_faulted_on_uaccess(ex, esr);
> +	default:
> +		return true;
> +	}
> +}
> +
>   static inline unsigned long
>   get_ex_fixup(const struct exception_table_entry *ex)
>   {
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index da4854fc6150..c2f14f9c2d92 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -553,6 +553,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>   	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
>   	unsigned long addr = untagged_addr(far);
>   	struct vm_area_struct *vma;
> +	const struct exception_table_entry *ex;
>   	int si_code;
>   	int pkey = -1;
>   
> @@ -606,7 +607,8 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>   			die_kernel_fault("execution of user memory",
>   					 addr, esr, regs);
>   
> -		if (!search_exception_tables(regs->pc))
> +		ex = search_exception_tables(regs->pc);
> +		if (!ex || !extable_insn_may_access_user(ex, esr))
>   			die_kernel_fault("access to user memory outside uaccess routines",
>   					 addr, esr, regs);
>   	}


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CA3CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 04:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyBVnzJ/lG8b38dGULVNwNLa2Fqny7nMbD4nf0nkuPA=; b=m23aUcLZB8zJ9LXy4nYxKS+Rgf
	BxrEeaANxn3Po1WszT13yoaFOemmQYVAgmDovSdabLuLQZG84eRf1Fh0vS58EWhNRbPmeX6l3p1Qj
	lfKJleZG0LFpWGi7whvTI72Nm/xuTEorneIHcWTD3aI1JFaLWBVNO73KjJX1SvMhxoxmCxe+XP6H1
	CvWYby/gnFWgp8pNZeOZDFCZf1wHur1tweTvx/DxiOhHXA7epvH0X08ATwcnXNokHJ3gLyFc2D0C2
	uyO1IDaDxbIYLK8MAvtp5tqcgXQfDg7uCD9BGJ3k75UXPwhjCEI6hRsw/NkLk1T5j5TALFjaMWfh5
	bqa94TAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ARc-0000000CDE7-2jTE;
	Mon, 13 Oct 2025 04:46:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ARZ-0000000CDDK-2AtQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 04:45:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDA6D113E;
	Sun, 12 Oct 2025 21:45:45 -0700 (PDT)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29DFA3F6A8;
	Sun, 12 Oct 2025 21:45:50 -0700 (PDT)
Message-ID: <535066e3-bd75-49df-b043-e5b0a74dc68d@arm.com>
Date: Mon, 13 Oct 2025 10:15:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch/arm64/mm/fault: Implement exceptions tracepoints
To: Balbir Singh <balbirs@nvidia.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20251013035532.1793181-1-balbirs@nvidia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251013035532.1793181-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_214557_606286_45984E95 
X-CRM114-Status: GOOD (  18.16  )
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

On 13/10/25 9:25 AM, Balbir Singh wrote:
> x86 and riscv provide trace points for page-faults (user and kernel
> tracepoints). Some scripts [1],[2] rely on these trace points. The
> tracepoint is useful for tracking faults and their reasons.

Agreed.
> 
> Adding the tracepoints is simple and straight-forward. For arm64
> use esr as error code and untagged memory address as addr.

Providing the entire esr register value makes sense.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> 
> [1] https://www.brendangregg.com/FlameGraphs/memoryflamegraphs.html
> [2] https://taras.glek.net/posts/ebpf-mmap-page-fault-tracing/
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
> 
> Tested at my end with a kernel-compile and running a user space
> program to check that the trace points are indeed reported.
> 
>  arch/arm64/mm/fault.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index d816ff44faff..9d7b86e92434 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -44,6 +44,9 @@
>  #include <asm/tlbflush.h>
>  #include <asm/traps.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/exceptions.h>
> +
>  struct fault_info {
>  	int	(*fn)(unsigned long far, unsigned long esr,
>  		      struct pt_regs *regs);
> @@ -572,8 +575,12 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	if (faulthandler_disabled() || !mm)
>  		goto no_context;
>  
> -	if (user_mode(regs))
> +	if (user_mode(regs)) {
>  		mm_flags |= FAULT_FLAG_USER;
> +		trace_page_fault_user(addr, regs, esr);
> +	} else {
> +		trace_page_fault_kernel(addr, regs, esr);
> +	}
>  
>  	/*
>  	 * vm_flags tells us what bits we must have in vma->vm_flags

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>


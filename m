Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E04CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbiVRSvkGknwyw6fR5JdZ2lDta2KdReoGzJ3YYcrmM0=; b=UOZSR8wM47j6dTQzzIbzSdAnw9
	9JI8GDtMYIHQcd1YDV13M/b6anTX/QavB2TVAiEjewjikaw19h9eiG2+sGoGb/bONpZci64guEm52
	LNGDSDA5yrXah52jYaDpj5Px9ZdOSUKLqNxScoz+ybLOXKPXb14AQbQRnMMgSmOIQnJJdjPTcFTYB
	fXxygYjlSeFVYHFFxUWe+3u45AQqJbmx3y9ej6MGOR8xcaJziqypBYVRx4tkElBRmmf0W+KCl6WTq
	Nwm+C1yh0o4IqOd/r1bNFYwxPTEev4s40KHmYVcCfRj+qc7ftyYY+x79Q1M/yyIQBRKFh/NCHvr+9
	kmMaLplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyKL-0000000APnM-2SOd;
	Mon, 03 Nov 2025 17:26:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyKJ-0000000APmz-1UaL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:26:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BBF31D14;
	Mon,  3 Nov 2025 09:26:33 -0800 (PST)
Received: from arm.com (unknown [10.1.25.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C253F66E;
	Mon,  3 Nov 2025 09:26:40 -0800 (PST)
Date: Mon, 3 Nov 2025 17:26:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] arch/arm64/mm/fault: Implement exceptions tracepoints
Message-ID: <aQjlzbkdzzYL2xJR@arm.com>
References: <20251013035532.1793181-1-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013035532.1793181-1-balbirs@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_092643_441088_8A69C65F 
X-CRM114-Status: GOOD (  20.28  )
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

On Mon, Oct 13, 2025 at 02:55:32PM +1100, Balbir Singh wrote:
> x86 and riscv provide trace points for page-faults (user and kernel
> tracepoints). Some scripts [1],[2] rely on these trace points. The
> tracepoint is useful for tracking faults and their reasons.
> 
> Adding the tracepoints is simple and straight-forward. For arm64
> use esr as error code and untagged memory address as addr.
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

This has come up before and rejected:

https://lore.kernel.org/all/aG0aIKzxApp9j7X0@willie-the-truck/

-- 
Catalin


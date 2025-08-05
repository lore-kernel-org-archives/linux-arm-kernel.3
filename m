Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895C2C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLdltYilCIPTF+OlZ8u3zCHVmch27GjRVMSSdtJQZvE=; b=kL+9edwBfJn9gt
	wWvGspmjaZgBghc985ew+4Czdz6XlzPVtopT+7FRuGMCV5r7DWQT4ORXbnqVAItftGlAk4+D3GyfH
	YkdLr5p6wKvWF1LuS1Xq7MEZd1tnN79+Ddl3/bB4qJBAsNWYolyK5lGiCsqLjYJWqcGpwHxUschjC
	Q4TBMx1Lwccv6NTJZalYjLF4whp6ckSwAsblXmB4Eh7R0MWyXt63cH3Riy9xVwp6cMNu0iClChyXF
	CXtqvpUEZqsC4YVLGAn+/YaIL+NRb3iGX4odsjKYJHStrGrxKC3krzZbx8uysWqnBahvAXU8UX5ub
	+6vCeWQa7jiKhC3/NYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKDL-0000000DEen-3IXz;
	Tue, 05 Aug 2025 16:08:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJF2-0000000D6AY-4Am3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:06:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42E052BC2;
	Tue,  5 Aug 2025 08:06:08 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 226143F673;
	Tue,  5 Aug 2025 08:06:11 -0700 (PDT)
Message-ID: <df50cc99-027e-4182-ba4c-9837b354a062@arm.com>
Date: Tue, 5 Aug 2025 16:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 2/7] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-3-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080617_117554_6B482663 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The generic entry code uses irqentry_state_t to track lockdep and RCU
> state across exception entry and return. For historical reasons, arm64
> embeds similar fields within its pt_regs structure.
>
> In preparation for moving arm64 over to the generic entry code, pull
> these fields out of arm64's pt_regs, and use a separate structure,
> matching the style of the generic entry code.
>
> No functional changes.
As far as I understand and checked, we used the two fields
in an exclusive fashion, so there is indeed no functional change.
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> [...]
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 8e798f46ad28..97e0741abde1 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> [...]
> @@ -475,73 +497,81 @@ UNHANDLED(el1t, 64, error)
>   static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>   {
>   	unsigned long far = read_sysreg(far_el1);
> +	arm64_irqentry_state_t state;
>   
> -	enter_from_kernel_mode(regs);
> +	state = enter_from_kernel_mode(regs);
Nit: There is some inconsistencies with some functions splitting state's 
definition
and declaration (like el1_abort here), while some others do it on the 
same line
(el1_undef() below for example).
In some cases it is welcome as the entry function is called after some 
other work,
but here for example it doesn't seem to be beneficial ?
>   	local_daif_inherit(regs);
>   	do_mem_abort(far, esr, regs);
>   	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>   }
>   
>   static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>   {
>   	unsigned long far = read_sysreg(far_el1);
> +	arm64_irqentry_state_t state;
>   
> -	enter_from_kernel_mode(regs);
> +	state = enter_from_kernel_mode(regs);
>   	local_daif_inherit(regs);
>   	do_sp_pc_abort(far, esr, regs);
>   	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>   }
>   
>   static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
>   {
> -	enter_from_kernel_mode(regs);
> +	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>   	local_daif_inherit(regs);
>   	do_el1_undef(regs, esr);
>   	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>   }
>
> [...]
Other than the small nit:
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>



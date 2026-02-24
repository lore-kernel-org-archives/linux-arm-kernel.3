Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F62FF4BB83
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 20:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBNbqhCyx0DJMWjTy8MtEivhPQa5vAQ2GJ9/M7TWB7Y=; b=Ak3Ee36OH60/wgXwExZyfQrnJ4
	sCLQiCP3Y6ECCmgw77I8hCLukg9yVdua3LiNmUDuV3BF1CpCQAHt40nqXzvNfHCJcrIjNQOPjABGj
	EN151fpWGkqg2ghInaX+0ehCBytRPr5Nyhhi+5VvdO9cyLEj2GRjULjpLrE4T7ZHr15JF99QYmgrA
	dQ/OXcBGNUov3ILFaFJS7CmwJsGhdn9ybBTwAuKhm7tWJo2s/hnUlmUsTcrMyxoBLMvSGPtlKOlFp
	n5dAIHY8js4wpH/u3ar4memJFHjbqhoSR8fPKPLDf1lseKJ8IAeXp5kCQY6qnRTEvSShzFZay8O41
	XpnQtv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuyhL-00000002jXM-1vIB;
	Tue, 24 Feb 2026 20:07:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuyhJ-00000002jX0-0ZOC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 20:07:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3315497;
	Tue, 24 Feb 2026 12:07:48 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2966C3F59E;
	Tue, 24 Feb 2026 12:07:54 -0800 (PST)
Date: Tue, 24 Feb 2026 20:07:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nirmoy Das <nirmoyd@nvidia.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: signal: preserve si_addr for addresses in the
 VA hole
Message-ID: <aZ4FF6ZdLEhvfkGp@arm.com>
References: <20260224135503.3329100-1-nirmoyd@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224135503.3329100-1-nirmoyd@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_120757_219969_AE55576E 
X-CRM114-Status: GOOD (  23.44  )
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

On Tue, Feb 24, 2026 at 05:55:03AM -0800, Nirmoy Das wrote:
> When userspace accesses an address in the "hole" between user and kernel
> virtual address space, the kernel delivers SIGSEGV with si_addr set to
> the faulting address. However, untagged_addr() uses sign_extend64() to
> canonicalize the address which corrupts hole addresses making debugging
> difficult as userspace cannot see the actual faulting value.
> 
> Fix this by only stripping the TBI top-byte for addresses that fall
> within the valid user range (below TASK_SIZE) after masking. For hole
> addresses, preserve the full original address including any tag bits.

From an architecture perspective, TTBRx selection is done based on bit
55. If TBI is enabled for one of the TTBRx ranges, bits 63:56 of the
address are ignored for the translation. Since TBI is always on for the
user, it makes sense to always ignore these bits. You just need to be
aware that the byte is sign-extended from bit 55.

How does it help with debugging if you know the top byte since it's
ignored by the hardware anyway.

> diff --git a/arch/arm64/include/asm/signal.h b/arch/arm64/include/asm/signal.h
> index ef449f5f4ba8..ca7ff6e5cd2f 100644
> --- a/arch/arm64/include/asm/signal.h
> +++ b/arch/arm64/include/asm/signal.h
> @@ -3,6 +3,7 @@
>  #define __ARM64_ASM_SIGNAL_H
>  
>  #include <asm/memory.h>
> +#include <asm/processor.h>
>  #include <uapi/asm/signal.h>
>  #include <uapi/asm/siginfo.h>
>  
> @@ -10,6 +11,8 @@ static inline void __user *arch_untagged_si_addr(void __user *addr,
>  						 unsigned long sig,
>  						 unsigned long si_code)
>  {
> +	unsigned long masked;
> +
>  	/*
>  	 * For historical reasons, all bits of the fault address are exposed as
>  	 * address bits for watchpoint exceptions. New architectures should
> @@ -18,7 +21,16 @@ static inline void __user *arch_untagged_si_addr(void __user *addr,
>  	if (sig == SIGTRAP && si_code == TRAP_BRKPT)
>  		return addr;
>  
> -	return untagged_addr(addr);
> +	/*
> +	 * Strip tag bits only for valid user addresses. For addresses
> +	 * in the VA hole, preserve the original value so userspace can
> +	 * see the actual faulting address for debugging.
> +	 */
> +	masked = (unsigned long)addr & ((1UL << 56) - 1);
> +	if (masked >= TASK_SIZE)
> +		return addr;

This doesn't make much sense architecturally. In the worst case, I'd
keep the top byte only if bit 55 is set (not in relation to TASK_SIZE).
But even in this case, I don't see what problem it solves. That top bit
doesn't give you any useful information and, with MTE on, TBI1 is also
on.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD76C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2VxA/JO68hATpMzf+XfT0p6E+eXoLJmCSt+8yON4/E=; b=TyzIjVDTEZmlDxo4vFQK69w6p4
	NQStfcoRwNU+wce6oT+NbewqV/ZUFMSyxX26sDsyJu+F51E2UsyUIJ/NOHKRfoNVno0ihXe8gI4vw
	l9+6q5mDYKhpyPEn4yMNRJQqQnuT6HLCJ1mSXMDFy/MLrYFacIxrjqHdvO8BL2wW3bg7QxEFuh+k1
	YuULa943pjt6mwj9WPZ6oikVqPFTae87zKurNmUEg/U6aaoyX4hv2jXFHiISOlhgxOLWnKDeEHBNp
	Y0JYM8UIN/n5AINa3+ac6H5kSD8XmbEUbTeKdIEjLgi8DDXDwAlrUlH7y80Lfs+Yju8yKQwIYccro
	XTcCoizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlC4F-00000002Zeu-26A3;
	Thu, 20 Feb 2025 19:18:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlC1d-00000002Z31-0HEG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 19:15:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C13D106F;
	Thu, 20 Feb 2025 11:16:13 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 953063F59E;
	Thu, 20 Feb 2025 11:15:54 -0800 (PST)
Message-ID: <6728bf8a-00f0-4f53-9955-c47f65cd126b@arm.com>
Date: Thu, 20 Feb 2025 19:15:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: lib: Use MOPS for usercopy routines
To: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tong Tiangen <tongtiangen@huawei.com>,
 James Morse <james.morse@arm.com>
References: <20250218171430.28227-1-kristina.martsenko@arm.com>
 <20250218171430.28227-4-kristina.martsenko@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250218171430.28227-4-kristina.martsenko@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_111557_200381_1D43BE9A 
X-CRM114-Status: GOOD (  27.09  )
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

On 18/02/2025 5:14 pm, Kristina Martšenko wrote:
> Similarly to what was done with the memcpy() routines, make
> copy_to_user(), copy_from_user() and clear_user() also use the Armv8.8
> FEAT_MOPS instructions.
> 
> Both MOPS implementation options (A and B) are supported, including
> asymmetric systems. The exception fixup code fixes up the registers
> according to the option used.
> 
> In case of a fault the routines return precisely how much was not copied
> (as required by the comment in include/linux/uaccess.h), as unprivileged
> versions of CPY/SET are guaranteed not to have written past the
> addresses reported in the GPRs.
> 
> The MOPS instructions could possibly be inlined into callers (and
> patched to branch to the generic implementation if not detected;
> similarly to what x86 does), but as a first step this patch just uses
> them in the out-of-line routines.
> 
> Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
> ---
>   arch/arm64/include/asm/asm-uaccess.h |  4 ++++
>   arch/arm64/lib/clear_user.S          | 25 +++++++++++++++++++++----
>   arch/arm64/lib/copy_from_user.S      | 10 ++++++++++
>   arch/arm64/lib/copy_template.S       | 10 ++++++++++
>   arch/arm64/lib/copy_to_user.S        | 10 ++++++++++
>   5 files changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
> index 5b6efe8abeeb..9148f5a31968 100644
> --- a/arch/arm64/include/asm/asm-uaccess.h
> +++ b/arch/arm64/include/asm/asm-uaccess.h
> @@ -61,6 +61,10 @@ alternative_else_nop_endif
>   9999:	x;					\
>   	_asm_extable_uaccess	9999b, l
>   
> +#define USER_CPY(l, uaccess_is_write, x...)	\
> +9999:	x;					\
> +	_asm_extable_uaccess_cpy 9999b, l, uaccess_is_write
> +
>   /*
>    * Generate the assembly for LDTR/STTR with exception table entries.
>    * This is complicated as there is no post-increment or pair versions of the
> diff --git a/arch/arm64/lib/clear_user.S b/arch/arm64/lib/clear_user.S
> index a5a5f5b97b17..de9a303b6ad0 100644
> --- a/arch/arm64/lib/clear_user.S
> +++ b/arch/arm64/lib/clear_user.S
> @@ -17,14 +17,27 @@
>    * Alignment fixed up by hardware.
>    */
>   
> -	.p2align 4
> -	// Alignment is for the loop, but since the prologue (including BTI)
> -	// is also 16 bytes we can keep any padding outside the function
>   SYM_FUNC_START(__arch_clear_user)
>   	add	x2, x0, x1

This subtlety...

> +
> +#ifdef CONFIG_AS_HAS_MOPS
> +	.arch_extension mops
> +alternative_if_not ARM64_HAS_MOPS
> +	b	.Lno_mops
> +alternative_else_nop_endif
> +
> +USER(9f, setpt	[x0]!, x1!, xzr)
> +USER(6f, setmt	[x0]!, x1!, xzr)
> +USER(6f, setet	[x0]!, x1!, xzr)
> +	mov	x0, #0
> +	ret
> +.Lno_mops:
> +#endif
> +
>   	subs	x1, x1, #8
>   	b.mi	2f
> -1:
> +
> +1:	.p2align 4
>   USER(9f, sttr	xzr, [x0])
>   	add	x0, x0, #8
>   	subs	x1, x1, #8
> @@ -47,6 +60,10 @@ USER(7f, sttrb	wzr, [x2, #-1])
>   	ret
>   
>   	// Exception fixups
> +6:	b.cs	9f
> +	// Registers are in Option A format
> +	add	x0, x0, x1
> +	b	9f

...and then all this, is a bit hard to follow IMO. I'd be inclined to 
just have dedicated "mov x0, x1; ret" and "cneg x0, x1, cc; ret" fixups 
for the prologue and other ops, rather than entangle them with the 
non-MOPS flow at all. (Plus then the prologue fixup could arguably be 
the normal exit path as well...)

>   7:	sub	x0, x2, #5	// Adjust for faulting on the final byte...
>   8:	add	x0, x0, #4	// ...or the second word of the 4-7 byte case
>   9:	sub	x0, x2, x0
> diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
> index 34e317907524..400057d607ec 100644
> --- a/arch/arm64/lib/copy_from_user.S
> +++ b/arch/arm64/lib/copy_from_user.S
> @@ -52,6 +52,13 @@
>   	stp \reg1, \reg2, [\ptr], \val
>   	.endm
>   
> +	.macro cpy1 dst, src, count
> +	.arch_extension mops
> +	USER_CPY(9997f, 0, cpyfprt [\dst]!, [\src]!, \count!)
> +	USER_CPY(9996f, 0, cpyfmrt [\dst]!, [\src]!, \count!)
> +	USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
> +	.endm
> +
>   end	.req	x5
>   srcin	.req	x15
>   SYM_FUNC_START(__arch_copy_from_user)
> @@ -62,6 +69,9 @@ SYM_FUNC_START(__arch_copy_from_user)
>   	ret
>   
>   	// Exception fixups
> +9996:	b.cs	9997f
> +	// Registers are in Option A format
> +	add	dst, dst, count

However for copies it's somewhat justified since, IIUC, MOPS aren't 
guaranteed to make progress if we're starting on the last byte of a page 
and the next page is unmapped, and thus we may still have a "try harder" 
requirement similar to the previous alignment fault case, is that right?

Thanks,
Robin.

>   9997:	cmp	dst, dstin
>   	b.ne	9998f
>   	// Before being absolutely sure we couldn't copy anything, try harder
> diff --git a/arch/arm64/lib/copy_template.S b/arch/arm64/lib/copy_template.S
> index 488df234c49a..7f2f5a0e2fb9 100644
> --- a/arch/arm64/lib/copy_template.S
> +++ b/arch/arm64/lib/copy_template.S
> @@ -40,6 +40,16 @@ D_l	.req	x13
>   D_h	.req	x14
>   
>   	mov	dst, dstin
> +
> +#ifdef CONFIG_AS_HAS_MOPS
> +alternative_if_not ARM64_HAS_MOPS
> +	b	.Lno_mops
> +alternative_else_nop_endif
> +	cpy1	dst, src, count
> +	b	.Lexitfunc
> +.Lno_mops:
> +#endif
> +
>   	cmp	count, #16
>   	/*When memory length is less than 16, the accessed are not aligned.*/
>   	b.lo	.Ltiny15
> diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
> index 802231772608..819f2e3fc7a9 100644
> --- a/arch/arm64/lib/copy_to_user.S
> +++ b/arch/arm64/lib/copy_to_user.S
> @@ -51,6 +51,13 @@
>   	user_stp 9997f, \reg1, \reg2, \ptr, \val
>   	.endm
>   
> +	.macro cpy1 dst, src, count
> +	.arch_extension mops
> +	USER_CPY(9997f, 1, cpyfpwt [\dst]!, [\src]!, \count!)
> +	USER_CPY(9996f, 1, cpyfmwt [\dst]!, [\src]!, \count!)
> +	USER_CPY(9996f, 1, cpyfewt [\dst]!, [\src]!, \count!)
> +	.endm
> +
>   end	.req	x5
>   srcin	.req	x15
>   SYM_FUNC_START(__arch_copy_to_user)
> @@ -61,6 +68,9 @@ SYM_FUNC_START(__arch_copy_to_user)
>   	ret
>   
>   	// Exception fixups
> +9996:	b.cs	9997f
> +	// Registers are in Option A format
> +	add	dst, dst, count
>   9997:	cmp	dst, dstin
>   	b.ne	9998f
>   	// Before being absolutely sure we couldn't copy anything, try harder


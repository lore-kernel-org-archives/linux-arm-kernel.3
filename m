Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFD1C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+m7iXhIvbL6NvxwaQ5jFPlWoCarF/fT+9eU9v3tAto=; b=L1Ns4OjJHlXE6ul4SXfN8A9D57
	I8Oxj9nXqBVuCHrG6bgeItaKChm0oxakQB4wX0l5cfUHs/aeYgGFxyAZBoZxlDJYe/RorI/r0M376
	lubtFFwa6qF+SAkXfSeq90rsdMmadJfbM1xOa8cNOmqiC4bCT1O6fQmdjtE/SigHrvOo7H8ZZYUGi
	7rvoZIdnSneFTvzBSqLOIz9Vvu37Z+Ju4x+9PNv9d3jCpPc20PDdV0piBpwbX8MlfRjMXUZesfLoJ
	rnIkhETZk3uKPdup07bcDUDH+3LGaBKNUiRP80vOjRyYIo8vJ0X1Dt36YwGz1C39BfQamWK9+0Bw3
	YyfLbKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFO7-00000002w8l-0ea3;
	Tue, 22 Jul 2025 15:58:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEPt-00000002n1z-3gu6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:56:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3425A152B;
	Tue, 22 Jul 2025 07:56:21 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B543F3F6A8;
	Tue, 22 Jul 2025 07:56:25 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:56:20 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Weikang Guo <guoweikang.kernel@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Ensure phys_to_ttbr on pgdir for
 idmap_cpu_replace_ttbr1
Message-ID: <aH-mlN88NrTzahfM@J2N7QTR9R3>
References: <20250722082117.1777570-1-guoweikang.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722082117.1777570-1-guoweikang.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_075629_994764_A122F1BF 
X-CRM114-Status: GOOD (  27.90  )
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

On Tue, Jul 22, 2025 at 04:21:13PM +0800, Weikang Guo wrote:
> Commit 5ffdfaedfa0a ("arm64: mm: Support Common Not Private translations")
> changed the contract of idmap_cpu_replace_ttbr1, requiring that the TTBR
> argument passed in should already be processed by phys_to_ttbr (i.e., in
> TTBR format, not just a raw physical address).
> 
> However, the current map_kernel implementation does not always convert the
> pgdir/ttbr argument via phys_to_ttbr before calling
> idmap_cpu_replace_ttbr1. This can lead to issues on systems with
> CONFIG_ARM64_PA_BITS_52 enabled, as the TTBR would not be properly folded
> per the ARMv8.2+ requirements.

For the cases below I don't believe that this is actually a problem.
Since commit:

  453dfcee70c5c344 ("arm64: booting: Require placement within 48-bit addressable memory")

... we require that the kernel Image (including any trailing unallocated
bytes accounted for in image_size) are below the 48-bit address limit,
and so there should be no difference between the PA and TTBR format.

We could probably test and enforce that in the early boot code somehow,
if we're not doing that already.

If we were going to change things to avoid accidents in future, I think
it would be better to enforce this with the type system. e.g. we could
have a ttbr_val type that's distinct from phys_addr_t. Even then, for
the idmap code I think it's better to avoid the phys_to_ttbr() dance,
since that has runtime patching.

Mark.

> 
> Signed-off-by: Weikang Guo <guoweikang.kernel@gmail.com>
> 
> ---
> Note: I do not currently have access to ARM64 hardware or an emulation
> environment that supports 52-bit physical address (PA52). I would
> greatly appreciate if anyone with such a platform could help test
> this patch. Thank you!
> ---
>  arch/arm64/kernel/pi/map_kernel.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
> index 0f4bd7771859..05a04eb91e81 100644
> --- a/arch/arm64/kernel/pi/map_kernel.c
> +++ b/arch/arm64/kernel/pi/map_kernel.c
> @@ -18,7 +18,7 @@
>  
>  extern const u8 __eh_frame_start[], __eh_frame_end[];
>  
> -extern void idmap_cpu_replace_ttbr1(void *pgdir);
> +extern void idmap_cpu_replace_ttbr1(phys_addr_t);
>  
>  static void __init map_segment(pgd_t *pg_dir, u64 *pgd, u64 va_offset,
>  			       void *start, void *end, pgprot_t prot,
> @@ -90,7 +90,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_offset, int root_level)
>  		    true, root_level);
>  	dsb(ishst);
>  
> -	idmap_cpu_replace_ttbr1(init_pg_dir);
> +	idmap_cpu_replace_ttbr1(phys_to_ttbr((u64)init_pg_dir));
>  
>  	if (twopass) {
>  		if (IS_ENABLED(CONFIG_RELOCATABLE))
> @@ -129,7 +129,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_offset, int root_level)
>  	/* Copy the root page table to its final location */
>  	memcpy((void *)swapper_pg_dir + va_offset, init_pg_dir, PAGE_SIZE);
>  	dsb(ishst);
> -	idmap_cpu_replace_ttbr1(swapper_pg_dir);
> +	idmap_cpu_replace_ttbr1(phys_to_ttbr((u64)swapper_pg_dir));
>  }
>  
>  static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
> -- 
> 2.25.1
> 
> 


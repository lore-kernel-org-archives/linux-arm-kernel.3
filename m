Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCB7D2B925
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWBOU50NMVClOofrTjnG0sXctFUv89sR6AoIkhZtdhs=; b=u3paCrWmnISYg0lF0d1ElqC2cN
	Bbzh4Jsoy7OK9tZ1JuP4CXLLX8/K3MtjxH+4dBE+KySz8VJnv6m7KDKWBa6ej+R8VZYtSLS+i3sDX
	5jNEDDBD2ENgcE/H9EGGRYo11pAAoP6uIZT9kV7M5YwyeQwT2pUfvWrl6/8EDvZARbvlunGE878yQ
	X7SmnfV2002JBlP3iLRNq8eDTJr6A349x9h6EQWDN2kubrc/c0XeQUdUwA20jaf572ohNgdmY9NAN
	mnPyEh0/VXCeAAlIlMZGUrLeAEHBL93INMMbtyXI7RUn467BNzkPF/rNJfzP4U2zgmSMrrYPWh1J+
	ndfyb9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jwp-0000000HApt-3HQR;
	Tue, 05 Nov 2024 13:50:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JuW-0000000HAbe-0Y9o;
	Tue, 05 Nov 2024 13:48:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39DD160003;
	Tue,  5 Nov 2024 13:47:51 +0000 (UTC)
Message-ID: <717b3757-4f6f-49f3-9da1-82faaff57485@ghiti.fr>
Date: Tue, 5 Nov 2024 14:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] riscv: Do not rely on KASAN to define the memory
 layout
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
 Evgenii Stepanov <eugenis@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-7-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241022015913.3524425-7-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_054756_462942_13744BD5 
X-CRM114-Status: GOOD (  20.86  )
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

On 22/10/2024 03:57, Samuel Holland wrote:
> Commit 66673099f734 ("riscv: mm: Pre-allocate vmemmap/direct map/kasan
> PGD entries") used the start of the KASAN shadow memory region to
> represent the end of the linear map, since the two memory regions were
> immediately adjacent. This is no longer the case for Sv39; commit
> 5c8405d763dc ("riscv: Extend sv39 linear mapping max size to 128G")
> introduced a 4 GiB hole between the regions. Introducing KASAN_SW_TAGS
> will cut the size of the shadow memory region in half, creating an even
> larger hole.
>
> Avoid wasting PGD entries on this hole by using the size of the linear
> map (KERN_VIRT_SIZE) to compute PAGE_END.
>
> Since KASAN_SHADOW_START/KASAN_SHADOW_END are used inside an IS_ENABLED
> block, it's not possible to completely hide the constants when KASAN is
> disabled, so provide dummy definitions for that case.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> (no changes since v1)
>
>   arch/riscv/include/asm/kasan.h | 11 +++++++++--
>   arch/riscv/mm/init.c           |  2 +-
>   2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> index e6a0071bdb56..a4e92ce9fa31 100644
> --- a/arch/riscv/include/asm/kasan.h
> +++ b/arch/riscv/include/asm/kasan.h
> @@ -6,6 +6,8 @@
>   
>   #ifndef __ASSEMBLY__
>   
> +#ifdef CONFIG_KASAN
> +
>   /*
>    * The following comment was copied from arm64:
>    * KASAN_SHADOW_START: beginning of the kernel virtual addresses.
> @@ -33,13 +35,18 @@
>   #define KASAN_SHADOW_START	((KASAN_SHADOW_END - KASAN_SHADOW_SIZE) & PGDIR_MASK)
>   #define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
>   
> -#ifdef CONFIG_KASAN
>   #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>   
>   void kasan_init(void);
>   asmlinkage void kasan_early_init(void);
>   void kasan_swapper_init(void);
>   
> -#endif
> +#else /* CONFIG_KASAN */
> +
> +#define KASAN_SHADOW_START	MODULES_LOWEST_VADDR
> +#define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
> +
> +#endif /* CONFIG_KASAN */
> +
>   #endif
>   #endif /* __ASM_KASAN_H */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0e8c20adcd98..1f9bb95c2169 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1494,7 +1494,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
>   	panic("Failed to pre-allocate %s pages for %s area\n", lvl, area);
>   }
>   
> -#define PAGE_END KASAN_SHADOW_START
> +#define PAGE_END (PAGE_OFFSET + KERN_VIRT_SIZE)
>   
>   void __init pgtable_cache_init(void)
>   {


Looks good and cleaner, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



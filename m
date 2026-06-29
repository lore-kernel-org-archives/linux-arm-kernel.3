Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AFCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bv2MNymaPWPHJTDdOg64m63/msqBwPUlFib40uHg9iI=; b=qCxW+h2VWxiMvKCRGhHyR52+61
	lZ19MV9W3BmW3352qrU3Gk+Oe83J9k8eOKL7Jdf78qN2oYP9r9uYK0A3TiITdc/NvojK8NMaQQhBU
	IJvDlh4fmFPb0Q0fGsW1bzepOEeuTm7qdKZ1HlkEar9Rg/7qpMRvWsZG3yxNEKFZwucJ9+Q73xYEb
	opC0XcmzwS+OA2oTTSxiNjPRBxraLoqQJobF1SgU1bHhqpUU/8wfi+OBMI7r66hDZWLEu7Hlii2eR
	4zy4lBYuFKpsHR8bQUMGcZFJAGCZPxZ3EJlyHqVSmwCXr+kPonGbWqyhZ3Sfr7d7+cX8PEtI2zhh6
	10Vi3gbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Xk-0000000EN4T-3IZW;
	Mon, 29 Jun 2026 10:48:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Xj-0000000EN3y-0ARz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:48:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DC46176C;
	Mon, 29 Jun 2026 03:48:41 -0700 (PDT)
Received: from [10.1.36.193] (e121487-lin.cambridge.arm.com [10.1.36.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC8243F836;
	Mon, 29 Jun 2026 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782730125; bh=HyjFYxbAqFE497eLVxXFT95li2NffwINS9WOP9Nk9NU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NYbdVGAflN1iz+6isb+2ix0etO1gfPGgn2t+Gy6GsbFSqiYbcWp1RgRs6+2cRMYdy
	 jcf6JhT8aQsybQdchLAuD6LErxTtolTB9n1aPQXnFNlL0v5Vhqj4u98+3fIru2Gtxp
	 6CZWCTXP+lUvlLkbs12dOJF6mHTE1YIeG8kobicM=
Message-ID: <97b62a6f-a514-46bb-9ee8-81f563220f6a@arm.com>
Date: Mon, 29 Jun 2026 11:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: io: apply the device store-release
 workaround once per block write
To: Shanker Donthineni <sdonthineni@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <20260625182425.3194066-3-sdonthineni@nvidia.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260625182425.3194066-3-sdonthineni@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_034847_159750_E2169828 
X-CRM114-Status: GOOD (  30.16  )
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

Hi,

On 6/25/26 19:24, Shanker Donthineni wrote:
> The generic memset_io()/memcpy_toio() are built on __raw_write*(), so on
> parts with the NVIDIA Olympus device store/load ordering erratum the
> ARM64_WORKAROUND_DEVICE_STORE_RELEASE workaround promotes every store in
> the block to a store-release. Each stlr* carries a barrier cost, so block
> MMIO becomes O(n) store-releases, making a block copy many times slower
> than a single ordered burst and growing with the transfer size.
> 
> Provide arm64 memset_io()/memcpy_toio() that emit plain str* in the loop
> and order the whole block against subsequent loads with a single
> trailing dmb osh on affected CPUs (a no-op elsewhere, preserving the
> relaxed contract of these helpers). This keeps block MMIO writes at
> one-barrier cost rather than scaling with the transfer size.
> 
> Performance (NVIDIA Olympus, write-combining MMIO to a device BAR, single
> PE pinned; per-call cost in ns; consecutive writes ping-pong between two
> buffers so repeated stores are not coalesced; iowrite64/iowrite32 =
> __iowrite{64,32}_copy()):
> 
> Table 1 - arm64 memset_io/memcpy_toio (this patch)
> +-------+-----------+-----------+-----------+-------------+
> |  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
> +-------+-----------+-----------+-----------+-------------+
> |    8B |  231.6 ns |  231.6 ns |  232.4 ns |  232.4 ns   |
> |   16B |  231.7 ns |  231.9 ns |  232.7 ns |  232.6 ns   |
> |   32B |  231.9 ns |  232.7 ns |  232.9 ns |  232.9 ns   |
> |   64B |  232.7 ns |  235.0 ns |  233.7 ns |  233.6 ns   |
> |  128B |  233.6 ns |  235.8 ns |  234.4 ns |  234.3 ns   |
> |  256B |  237.7 ns |  276.8 ns |  264.0 ns |  276.7 ns   |
> |  512B |  237.7 ns |  277.1 ns |  238.1 ns |  277.6 ns   |
> |   1KB |  253.7 ns |  279.3 ns |  276.1 ns |  294.1 ns   |
> |   2KB |  295.0 ns |  318.7 ns |  288.5 ns |  308.3 ns   |
> |   4KB |  365.9 ns |  381.4 ns |  365.7 ns |  381.3 ns   |
> +-------+-----------+-----------+-----------+-------------+
> all four helpers end with a single trailing barrier (dmb osh).
> 
> Table 2 - generic per-store memset_io/memcpy_toio
> +-------+-----------+-----------+-------------+--------------+
> |  size | iowrite64 | iowrite32 |   memset_io |  memcpy_toio |
> +-------+-----------+-----------+-------------+--------------+
> |    8B |  231.6 ns |  231.6 ns |    229.0 ns |    229.0 ns  |
> |   16B |  231.7 ns |  231.9 ns |    458.4 ns |    458.5 ns  |
> |   32B |  231.9 ns |  232.7 ns |    917.4 ns |    917.5 ns  |
> |   64B |  232.7 ns |  234.8 ns |   1835.4 ns |   1835.5 ns  |
> |  128B |  233.6 ns |  235.8 ns |   3670.9 ns |   3670.8 ns  |
> |  256B |  237.7 ns |  276.7 ns |   7341.6 ns |   7341.6 ns  |
> |  512B |  237.7 ns |  279.4 ns |  14001.4 ns |  14001.3 ns  |
> |   1KB |  253.7 ns |  279.1 ns |  28631.5 ns |  28631.8 ns  |
> |   2KB |  279.4 ns |  317.9 ns |  57276.3 ns |  57275.2 ns  |
> |   4KB |  365.7 ns |  381.5 ns | 114564.4 ns | 114563.6 ns  |
> +-------+-----------+-----------+-------------+--------------+
> the generic memset_io()/memcpy_toio() build on __raw_write*(), which the
> workaround promotes to store-release, so every store is individually
> ordered - hence O(n) in the store count.
> 
> The arm64 versions stay flat at one-barrier cost while the generic
> per-store writers collapse to O(n): at 4KB ~314x slower (~115 us vs
> ~366 ns).
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> ---
>  arch/arm64/include/asm/io.h |  5 +++
>  arch/arm64/kernel/io.c      | 82 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 69e0fa004d31..649503f347bc 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -266,6 +266,11 @@ __iowrite64_copy(void __iomem *to, const void *from, size_t count)
>  }
>  #define __iowrite64_copy __iowrite64_copy
>  
> +void memset_io(volatile void __iomem *dst, int c, size_t count);
> +#define memset_io memset_io
> +void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count);
> +#define memcpy_toio memcpy_toio
> +
>  /*
>   * I/O memory mapping functions.
>   */
> diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
> index fe86ada23c7d..b5fd9ee6d9eb 100644
> --- a/arch/arm64/kernel/io.c
> +++ b/arch/arm64/kernel/io.c
> @@ -5,9 +5,91 @@
>   * Copyright (C) 2012 ARM Ltd.
>   */
>  
> +#include <linux/align.h>
>  #include <linux/export.h>
>  #include <linux/types.h>
>  #include <linux/io.h>
> +#include <linux/unaligned.h>
> +
> +#include <asm/alternative.h>
> +
> +/*
> + * ARM64_WORKAROUND_DEVICE_STORE_RELEASE promotes every raw MMIO store
> + * (__raw_write*()) to a store-release on affected CPUs. The generic
> + * memset_io()/memcpy_toio() are built on those helpers, so the workaround would
> + * emit one store-release per element and turn a block write into O(n) ordered
> + * stores - far more costly than the single barrier a block actually needs.
> + *
> + * Provide arm64 versions that emit plain STR in the loop and order the whole
> + * block against subsequent loads with one trailing DMB OSH, patched in only on
> + * affected CPUs (a no-op elsewhere, so the relaxed contract of these helpers is
> + * preserved).
> + *
> + * This capability is currently enabled only for the NVIDIA Olympus device
> + * store/load ordering erratum, where a Device-nGnR* load may be observed before
> + * an older, non-overlapping Device-nGnR* store to the same peripheral.
> + */
> +static __always_inline void iomem_block_store_barrier(void)
> +{
> +	asm volatile(ALTERNATIVE("nop", "dmb osh",
> +				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
> +		     : : : "memory");
> +}
> +
> +void memset_io(volatile void __iomem *dst, int c, size_t count)
> +{
> +	u64 qc = (u8)c;
> +
> +	qc *= ~0ULL / 0xff;
> +
> +	while (count && !IS_ALIGNED((__force unsigned long)dst, sizeof(u64))) {
> +		asm volatile("strb %w0, [%1]" : : "rZ"((u8)c), "r"(dst) : "memory");
> +		dst++;
> +		count--;
> +	}
> +	while (count >= sizeof(u64)) {
> +		asm volatile("str %x0, [%1]" : : "rZ"(qc), "r"(dst) : "memory");
> +		dst += sizeof(u64);
> +		count -= sizeof(u64);
> +	}
> +	while (count) {
> +		asm volatile("strb %w0, [%1]" : : "rZ"((u8)c), "r"(dst) : "memory");
> +		dst++;
> +		count--;
> +	}
> +
> +	iomem_block_store_barrier();
> +}
> +EXPORT_SYMBOL(memset_io);
> +
> +void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count)
> +{
> +	while (count && !IS_ALIGNED((__force unsigned long)dst, sizeof(u64))) {
> +		asm volatile("strb %w0, [%1]"
> +			     : : "rZ"(*(const u8 *)src), "r"(dst) : "memory");
> +		src++;
> +		dst++;
> +		count--;
> +	}
> +	while (count >= sizeof(u64)) {
> +		asm volatile("str %x0, [%1]"
> +			     : : "rZ"(get_unaligned((const u64 *)src)), "r"(dst)

Why do we need get_unaligned() here? I understand this came from
the generic implementation, where it needs to handle architectures
that do not support unaligned accesses. But IIUC this is not an
issue for arm64, and there was no special handling in memcpy_toio()
before 0110feaaf6d0 ("arm64: Use new fallback IO memcpy/memset").
Am I missing something?

> +			     : "memory");
> +		src += sizeof(u64);
> +		dst += sizeof(u64);
> +		count -= sizeof(u64);
> +	}
> +	while (count) {
> +		asm volatile("strb %w0, [%1]"
> +			     : : "rZ"(*(const u8 *)src), "r"(dst) : "memory");
> +		src++;
> +		dst++;
> +		count--;
> +	}
> +
> +	iomem_block_store_barrier();

It is perhaps a matter of taste, but having the inline assembly
here (and in memset_io()) might make the code clearer. To a
casual reader, it would be obvious that the barrier is not
guaranteed and is only applicable to ARM64_WORKAROUND_DEVICE_STORE_RELEASE,
without having to jump back and forth through the code.

Obliviously maintainers might have different preference ;) 

Cheers
Vladimir

> +}
> +EXPORT_SYMBOL(memcpy_toio);
>  
>  /*
>   * This generates a memcpy that works on a from/to address which is aligned to
> -- 2.54.0.windows.1
> 



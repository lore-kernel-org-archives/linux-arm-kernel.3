Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C025FD2B92D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrdb5XyLg7NsqMJ99KX/uWDwOQC+nCMkJMaoujk6gls=; b=uheHoZBg4cESwLh3ZCRaqmBta9
	Ov43ETbSPlsEN59VRnE9qiqMBBEZqG8W2WCgYNCE2UKKoUSAznf0oWyc79EShS0a0jETsrM0Tuq/s
	ywY7TbeOU42p1AU3FOZm7gUpabtX6R5wSnnARWZlvgLLPwomNpuj0kgqHfLtlIX3SMf1JQLjc1+4+
	gBjyG/TzCKlc5+jObWs2ofJ3Jb9UZ55otNBVrLm4mWJkf3QxdlAHZR4NG8mJvpvlTMNnkB1WCHmHS
	enmAnA5v69iD/wgCqvSTGJgGf81ZpGlGFBmaTfJd7gkUCPZ4m8RsD9HNiF/V84FWfZ5iLpD6Jp+ue
	G/9S+UfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K4d-0000000HBsN-36DE;
	Tue, 05 Nov 2024 13:58:23 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K1T-0000000HBRS-1Bkt;
	Tue, 05 Nov 2024 13:55:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFB34E0003;
	Tue,  5 Nov 2024 13:55:01 +0000 (UTC)
Message-ID: <e8cf563f-d840-4e33-9ca0-2fa734c9f6c2@ghiti.fr>
Date: Tue, 5 Nov 2024 14:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] riscv: Align the sv39 linear map to 16 GiB
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
 <20241022015913.3524425-8-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241022015913.3524425-8-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_055507_666074_6988077B 
X-CRM114-Status: GOOD (  15.71  )
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
> The KASAN implementation on RISC-V requires the shadow memory for the
> vmemmap and linear map regions to be aligned to a PMD boundary (1 GiB).


PUD boundary


> For KASAN_GENERIC (KASAN_SHADOW_SCALE_SHIFT == 3), this enforces 8 GiB
> alignment for the memory regions themselves. KASAN_SW_TAGS uses 16-byte
> granules (KASAN_SHADOW_SCALE_SHIFT == 4), so now the memory regions must
> be aligned to a 16 GiB boundary.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> (no changes since v1)
>
>   Documentation/arch/riscv/vm-layout.rst | 10 +++++-----
>   arch/riscv/include/asm/page.h          |  2 +-
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
> index eabec99b5852..c0778c421b34 100644
> --- a/Documentation/arch/riscv/vm-layout.rst
> +++ b/Documentation/arch/riscv/vm-layout.rst
> @@ -47,11 +47,11 @@ RISC-V Linux Kernel SV39
>                                                                 | Kernel-space virtual memory, shared between all processes:
>     ____________________________________________________________|___________________________________________________________
>                       |            |                  |         |
> -   ffffffc4fea00000 | -236    GB | ffffffc4feffffff |    6 MB | fixmap
> -   ffffffc4ff000000 | -236    GB | ffffffc4ffffffff |   16 MB | PCI io
> -   ffffffc500000000 | -236    GB | ffffffc5ffffffff |    4 GB | vmemmap
> -   ffffffc600000000 | -232    GB | ffffffd5ffffffff |   64 GB | vmalloc/ioremap space
> -   ffffffd600000000 | -168    GB | fffffff5ffffffff |  128 GB | direct mapping of all physical memory
> +   ffffffc2fea00000 | -244    GB | ffffffc2feffffff |    6 MB | fixmap
> +   ffffffc2ff000000 | -244    GB | ffffffc2ffffffff |   16 MB | PCI io
> +   ffffffc300000000 | -244    GB | ffffffc3ffffffff |    4 GB | vmemmap
> +   ffffffc400000000 | -240    GB | ffffffd3ffffffff |   64 GB | vmalloc/ioremap space
> +   ffffffd400000000 | -176    GB | fffffff3ffffffff |  128 GB | direct mapping of all physical memory
>                       |            |                  |         |
>      fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
>     __________________|____________|__________________|_________|____________________________________________________________
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 32d308a3355f..6e2f79cf77c5 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -37,7 +37,7 @@
>    * define the PAGE_OFFSET value for SV48 and SV39.
>    */
>   #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
> -#define PAGE_OFFSET_L3		_AC(0xffffffd600000000, UL)
> +#define PAGE_OFFSET_L3		_AC(0xffffffd400000000, UL)
>   #else
>   #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
>   #endif /* CONFIG_64BIT */


Other than the nit above (that I think should be fixed though), you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



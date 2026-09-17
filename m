Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE311C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIr22LU1BYbVNjY9Dz7AcISZr0rlTdwozp3Q/IVZlMY=; b=2ig/VXNFSjcCViMw1z9S7FJlbn
	MGonAgtphUQnOJE/4z9TT1pqUuEZzhN8vBljtM8SApel/G6D+sg3EAkxRAHbiXeiXh/r44CJw/2tL
	oXdSV8qGD9HfYsRKVIxc+lKqqFhIl8alGTiREMcvnheu0qdHECU9o019CbyCPmuIQIPhoX4JR38J3
	47/hplJ8MNpA52eBeijd9+kTJSBjN6abhDnUj/d4ZlnK4h+RUl8txsps7F/DTkjNQFYfaZXHEkc/7
	hRKeT0wucG83CyMrtVegMvgAt+u/KizTqv/vY41QH76omIPrMeUbmbRAsCVXQtkbqEQmNTBVmSJPa
	+wUVVhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GaD-0000000CBMT-18YU;
	Thu, 17 Sep 2026 18:11:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GaA-0000000CBL5-3OHs;
	Thu, 17 Sep 2026 18:11:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D27B1476;
	Thu, 17 Sep 2026 11:11:32 -0700 (PDT)
Received: from [10.57.7.135] (unknown [10.57.7.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07D443F86F;
	Thu, 17 Sep 2026 11:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789668695; bh=TMD2k65kuIFXRf0q/E0tlyDyciozaJKv/LfOROsWlhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oz67M4YS9vKX95bPOvJjG/6IahhL31r2yGk7O81dt+sjjN414ZuuZ1xCMa2au/gHH
	 rXUcqtwGrQvFQ85FYRDPTsgIv5sPS9YSZzFPZz/TWW1k7YQuQdJ0UPTrn4SrhDiV3s
	 CGukra9E2ILOT0R0PDF2smG+O2IyEGDjkvUSbT20=
Message-ID: <d299f7c5-6c71-499a-b8cd-aa69c4c81dd1@arm.com>
Date: Thu, 17 Sep 2026 20:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] set_memory: add number of pages parameter to
 set_direct_map APIs
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
 <20260903-execmem-set-vm-perms-v0-2-v3-1-949b64a9f755@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-1-949b64a9f755@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_111138_930599_A917B954 
X-CRM114-Status: GOOD (  17.47  )
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

On 03/09/2026 11:28, Mike Rapoport (Microsoft) wrote:
> When set_direct_map APIs were introduced by the commit d253ca0c3865
> ("x86/mm/cpa: Add set_direct_map_*() functions") the single page
> parameter made sense because the initial callers (vmalloc and
> hibernation) had sets of unsorted struct pages that required changes of
> their mappings in the direct map.
>
> Since there is an increasing demand for direct map manipulation and it
> is also desirable to be able to update larger physically contiguous
> mappings, for example an entire large folio, extend set_direct_map APIs
> to receive number of pages parameter.
>
> As there is still only a handful of callers, change the existing
> functions directly and update all the call sites rather than adding
> wrappers for single page case.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/arm64/include/asm/set_memory.h     | 4 ++--
>  arch/arm64/mm/pageattr.c                | 8 ++++----
>  arch/loongarch/include/asm/set_memory.h | 4 ++--
>  arch/loongarch/mm/pageattr.c            | 8 ++++----
>  arch/riscv/include/asm/set_memory.h     | 4 ++--
>  arch/riscv/mm/pageattr.c                | 8 ++++----
>  arch/s390/include/asm/set_memory.h      | 4 ++--
>  arch/s390/mm/pageattr.c                 | 8 ++++----
>  arch/x86/include/asm/set_memory.h       | 4 ++--
>  arch/x86/mm/pat/set_memory.c            | 8 ++++----
>  include/linux/set_memory.h              | 6 ++++--
>  kernel/power/snapshot.c                 | 4 ++--
>  mm/secretmem.c                          | 6 +++---
>  mm/vmalloc.c                            | 5 +++--
>  14 files changed, 42 insertions(+), 39 deletions(-)
>
> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
> index 90f61b17275e1..b07fd4e026eac 100644
> --- a/arch/arm64/include/asm/set_memory.h
> +++ b/arch/arm64/include/asm/set_memory.h
> @@ -11,8 +11,8 @@ bool can_set_direct_map(void);
>  
>  int set_memory_valid(unsigned long addr, int numpages, int enable);
>  
> -int set_direct_map_invalid_noflush(struct page *page);
> -int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
> +int set_direct_map_default_noflush(struct page *page, unsigned int numpages);

I don't have a strong opinion on whether to call the argument nr or
numpages, but we might as well be consistent across archs :)

Aside from that:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>


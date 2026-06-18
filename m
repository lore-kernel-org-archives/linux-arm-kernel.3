Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE90CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twN8ACZ9Aa/wKni6yp7we6+vMuHS1QTrgX8POUv0AIQ=; b=vnSWhU+c5jg0QmavWbiM9GYd5G
	Adu/lx2SyhzZnakMD4Bib4k5ztGKahNEA2hY1Hv0g812jC3RZ0Hve4Inw3fHZuX4r7Tj6Dy/GGSQQ
	LSQd76xjUtw8MZAe4YXKM5MFdmYMJ3euJ0fvv2zyWyVHF/2uRKflfEsbyoH8/62PT3MMBi5RFfrbf
	gUjkKDkyRX5Qui+m11yQSE6EF/K39o0rAKSXkDgpDgmiTTF9ztRFjagj+nrq9h8dhVVfFtki3myX/
	Rd8rCfxOF881jidwwLWtDiFb9hobwGvLSYjM35SRTO/O0ujte1e1jXvHeY//pjyNkQZfJv5BRRAWu
	9nr80iMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEJE-00000001T2E-3qLr;
	Thu, 18 Jun 2026 15:05:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEJC-00000001T1q-3XrY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:05:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A90CB2BF2;
	Thu, 18 Jun 2026 08:05:28 -0700 (PDT)
Received: from [10.1.25.219] (XHFQ2J9959-3.cambridge.arm.com [10.1.25.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFE293F62B;
	Thu, 18 Jun 2026 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781795133; bh=zSiCWB4wVmuwYgvliAtv1Bxz/LsfufvrGhKFPRWgIkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W/898hXfxrGKOb0NnixwXdgQOv9P/CxQKTFjW3YCgEetxpYkeY1TFUYkdSTjAWq0u
	 qVVsA4mSccbwF41YvGrgM31uJD11z1aWRp7UwLyTIQeqNTAkUnuVcGZY1fX/JuhTBc
	 647RbOuA5w6kTr7rdg0h1CSQLGlfBTrmof3aS4hQ=
Message-ID: <402e247d-1eb9-4842-ba9a-712a3bb9b438@arm.com>
Date: Thu, 18 Jun 2026 16:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
Content-Language: en-GB
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260611130144.1385343-4-abarnas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_080535_013001_C66F6550 
X-CRM114-Status: GOOD (  21.65  )
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

On 11/06/2026 14:01, Adrian Barnaś wrote:
> Strip the read-only attribute from the selected memory range when
> restoring the linear map after an execmem cache clean.
> 
> An execmem cache clean is performed when a cache block becomes empty
> after unloading a module. When making the memory valid again, the linear
> memory alias must also have its read-only attribute cleared.
> 
> Without this change, the linear memory alias remains read-only even
> after the execmem cache block itself is freed, which prevents subsequent
> allocations from writing to that memory.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/arm64/mm/pageattr.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 88720bbba892..eaefdf90b0d5 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -239,6 +239,13 @@ int set_memory_x(unsigned long addr, int numpages)
>  					__pgprot(PTE_PXN));
>  }
>  
> +static int set_memory_default(unsigned long addr, int numpages)
> +{
> +	return __change_memory_common(addr, PAGE_SIZE * numpages,
> +				      __pgprot(PTE_VALID),
> +				      __pgprot(PTE_RDONLY));

This is not sufficient to convert an invalid entry to valid. As well as setting
the PTE_VALID bit, you would also need to clear the PTE_PRESENT_INVALID and set
PTE_MAYBE_NG.

e.g:

int set_memory_valid(unsigned long addr, int numpages, int enable)
{
	if (enable)
		return __change_memory_common(addr, PAGE_SIZE * numpages,
					__pgprot(PTE_PRESENT_VALID_KERNEL),
					__pgprot(PTE_PRESENT_INVALID));


> +}
> +
>  int set_memory_valid(unsigned long addr, int numpages, int enable)
>  {
>  	if (enable)
> @@ -362,7 +369,15 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>  	if (!can_set_direct_map())
>  		return 0;
>  
> -	return set_memory_valid(addr, nr, valid);
> +	/*
> +	 * Execmem cache uses this function to reset permissions on linear mapping
> +	 * when freeing unused cache block. On x86 it makes memory RW which is
> +	 * desirable. On ARM64 set_memory_valid() just change valid bit which
> +	 * leave direct mapping read-only so use set_memory_default instead.
> +	 */
> +
> +	return valid ? set_memory_default(addr, nr) :
> +		       set_memory_valid(addr, nr, false);

Surely execmem should just be using set_direct_map_default_noflush() if that's
the behaviour it wants?

I think that the current implementation of set_direct_map_default_noflush()
doesn't undo the effects of set_memory_nx() / set_memory_x(). That might be
worth checking?

Thanks,
Ryan


>  }
>  
>  #ifdef CONFIG_DEBUG_PAGEALLOC



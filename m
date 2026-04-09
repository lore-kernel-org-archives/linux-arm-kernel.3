Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6288EA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKbbmyqZBb2ONhPH0mEal/h1YOamyKv8xnC8Egv2A8A=; b=FEIbDE//1evqs4MsJouhUf7SY7
	ggXXZUksidKMOy4zCPQxFB5ycwXUdEX+56k6YprunTY1tYMNeu7cgt0jXALYRd2JmuOxSAyoSfwjX
	qnz22Y8zYbCZypuN/Lxs5yMmO+dg9+X3NYechwNyd0nAQSgFunOVTJB+yVX8mdLzUxCE/qT80Sz+5
	IGiNofbx9SB6p12hhl2D/axjyjqSx9CfiobQm35yR6SSgQYvZs8+DLDjC9U1oac9BWuQbsWWNDDxV
	Viq/HzYwTOLfpjSMRUIVPZyk7UUs9JvOpEzZRdhSC60XS+7a8xWvvgiX3tzEciEjEvi6PoOpbC+Xt
	hmqHm+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApso-0000000AcVw-37Ql;
	Thu, 09 Apr 2026 13:57:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApsd-0000000AcQB-3qu8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DE6843476;
	Thu,  9 Apr 2026 13:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858D1C4CEF7;
	Thu,  9 Apr 2026 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775743023;
	bh=+5VF1bU5O4YaukBBoNZRgYlZNxt7RuMICFd2JAjyq0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bf1z9sTOt8gmU/n7Bub9dMmuoAJ8oJeBxOdNBm2FJw6ARj1AUH3reJ/HZOlvqyHA9
	 LnJXPkt8qzU/qF+p8laBPKYt9D+CV9pYQrv7Zv8vkkERkmND1NnyA2r6XYM0JOZkF6
	 qcO2IwgdoGDBeJlnxhhMARxyPlTxyoWRGcUG0/rQYOLUDyoC5i2LGXbKgY5QyYnJ2K
	 41rero6M+XpxB9C7IlacEC9K8iSsbF7qj+NT6NVVj6walVhZnU9oLTdkKHS33Bui8I
	 2gT2sEVkujayx0J9sbyA1FtEf60D0165/0xqCzEyEakkLnNB0RFn2pLWr0aAIhH58o
	 /MXs8F/fFZ1dg==
Date: Thu, 9 Apr 2026 14:56:53 +0100
From: Will Deacon <will@kernel.org>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <adewJetUv6wMiz9o@willie-the-truck>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_065712_010764_2F6A67CF 
X-CRM114-Status: GOOD (  29.02  )
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

On Thu, Apr 09, 2026 at 03:54:45PM +0300, Brian Ruley wrote:
> Fixes cache desync, which can cause undefined instruction,
> translation and permission faults under heavy memory use.
> 
> This is an old bug introduced in commit 1971188aa196 ("ARM: 7985/1: mm:
> implement pte_accessible for faulting mappings"), which included a check
> for the young bit of a PTE. The underlying assumption was that old pages
> are not cached, therefore, `__sync_icache_dcache' could be skipped
> entirely.
> 
> However, under extreme memory pressure, page migrations happen
> frequently and the assumption of uncached "old" pages does not hold.
> Especially for systems that do not have swap, the migrated pages are
> unequivocally marked old. This presents a problem, as it is possible
> for the original page to be immediately mapped to another VA that
> happens to share the same cache index in VIPT I-cache (we found this
> bug on Cortex-A9). Without cache invalidation, the CPU will see the
> old mapping whose physical page can now be used for a different
> purpose, as illustrated below:
> 
>                 Core                      Physical Memory
>   +-------------------------------+     +------------------+
>   | TLB                           |     |                  |
>   |  VA_A 0xb6e6f -> pfn_q        |     | pfn_q: code      |
>   +-------------------------------+     +------------------+
>   | I-cache                       |
>   |  set[VA_A bits] | tag=pfn_q   |
>   +-------------------------------+
> 
> migrate (kcompactd):
>   1. copy pfn_q --> pfn_r
>   2. free pfn_q
>   3. pte: VA_a -> pfn_r
>   4. pte_mkold(pte) --> !young
>   5. ICIALLUIS skipped (because !young)
> 
> pfn_src reused (OOM pressure):
>   pte: VA_B -> pfn_q (different code)
> 
> bug:
>                 Core                      Physical Memory
>   +-------------------------------+     +------------------+
>   | TLB (empty)                   |     | pfn_r: old code  |
>   +-------------------------------+     | pfn_q: new code  |
>   | I-cache                       |     +------------------+
>   |  set[VA_A bits] | tag=pfn_q   |<--- wrong instructions
>   +-------------------------------+

(nit: Do you have pfn_r and pfn_q mixed up in the "Physical Memory" box?)

> This was verified on ba16-based board (i.MX6Quad/Dual, Cortex-A9) by
> instrumenting the migration code to track recently migrated pages in a
> ring buffer and then dumping them in the undefined instruction fault
> handler. The bug can be triggered with `stress-ng':
> 
>   stress-ng --vm 4 --vm-bytes 2G --vm-method zero-one --verify
> 
> Note that the system we tested on has only 2G of memory, so the test
> triggered the OOM-killer in our case.
> 
> Fixes: 1971188aa196 ("ARM: 7985/1: mm: implement pte_accessible for faulting mappings")
> Signed-off-by: Brian Ruley <brian.ruley@gehealthcare.com>
> ---
>  arch/arm/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> index 6fa9acd6a7f5..e3a5b4a9a65f 100644
> --- a/arch/arm/include/asm/pgtable.h
> +++ b/arch/arm/include/asm/pgtable.h
> @@ -185,7 +185,7 @@ static inline pte_t *pmd_page_vaddr(pmd_t pmd)
>  #define pte_exec(pte)		(pte_isclear((pte), L_PTE_XN))
>  
>  #define pte_valid_user(pte)	\
> -	(pte_valid(pte) && pte_isset((pte), L_PTE_USER) && pte_young(pte))
> +	(pte_valid(pte) && pte_isset((pte), L_PTE_USER))

This patch is from twelve years ago, so please forgive me for having
forgotten all of the details. However, my recollection is that when using
the classic/!lpae format (as you will be on Cortex-A9), page aging is
implemented by using invalid (translation faulting) ptes for 'old'
mappings.

So in the case you describe, we may well elide the I-cache maintenance,
but won't we also put down an invalid pte? If we later take a fault
on that, we should then perform the cache maintenance when installing
the young entry (via ptep_set_access_flags()). The more interesting part
is probably when the mapping for 'VA_B' is installed to map 'pfn_q' but,
again, I would've expected the cache maintenance to happen just prior to
installing the valid (young) mapping.

Please can you help me to understand the problem better?

Will


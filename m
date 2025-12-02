Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAA8CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 05:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrK+wMnVK5P5qucWSjcyyUEDnxwMcENlpJzk4sPkR90=; b=RgrsD7w6KKNByHq+MrdR9MbEXB
	amb6VLG/4eY3wFPphs4R1LZhOz07+G8gol1j6hETQzzwsZsC6uZzZEOeg9D4XyCQJTZIMeSJYEHdw
	4sHffVJLsP1X6ODEihSpWde/we+ijg8w0RgjLLRjepFylrbJM32NdjzAQu6vJ62xpbL46SIW4pJNx
	gRAZs3FElIdltctpK+bXFIF2sA7dL4x1dVd1GjmaPj/Hvno5HwvDNFn5d3/RNvGqIg1pcoEc85hlK
	z3ivrQVh8HJ9nzWezh7o0ia+mpApn4yth0z5Z2JsX7G+c+XLrlF5RHG5w5jlyFm+UnhE3+qM1y8Un
	bQiQgJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJ9f-00000004qvH-35bt;
	Tue, 02 Dec 2025 05:42:27 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJ9c-00000004quq-37m1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 05:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764654142; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=LrK+wMnVK5P5qucWSjcyyUEDnxwMcENlpJzk4sPkR90=;
	b=Bxd65ck0Rj8hX9eBubfZyCZx1rFlamNzZBZ9vJK3fKT5vXPNqPmocrTTf8QRIwqzXWvkdu3oQICEKCe3A/5yhSDmKMBKjaCih7CPKBuOGByZ+8h9JkxN22hs3EeLmhIVTfL0osd80AJzHB+Lj6b7zPR019i9WIoR5ecXMeE5VFM=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wtv977t_1764654138 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Dec 2025 13:42:18 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Cc: <catalin.marinas@arm.com>,  <will@kernel.org>,  <ardb@kernel.org>,
  <anshuman.khandual@arm.com>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [v2 PATCH] arm64: mm: Fix kexec failure after
 pte_mkwrite_novma() change
In-Reply-To: <20251202022707.2720933-1-jianpeng.chang.cn@windriver.com>
	(Jianpeng Chang's message of "Tue, 2 Dec 2025 10:27:07 +0800")
References: <20251202022707.2720933-1-jianpeng.chang.cn@windriver.com>
Date: Tue, 02 Dec 2025 13:42:17 +0800
Message-ID: <87qztdh22u.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_214224_927832_8F32D48E 
X-CRM114-Status: GOOD (  24.01  )
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

Jianpeng Chang <jianpeng.chang.cn@windriver.com> writes:

> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
> when the page is already dirty (PTE_DIRTY is set). While this optimization
> prevents unnecessary dirty page marking in normal memory management paths,
> it breaks kexec on some platforms like NXP LS1043.
>
> The issue occurs in the kexec code path:
> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>    writable copy of the linear mapping
> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>    are writable for the new kernel image copying
> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
> 4. When kexec tries to copy the new kernel image through the linear
>    mapping, it fails on read-only pages, causing the system to hang
>    after "Bye!"
>
> The same issue affects hibernation which uses the same trans_pgd code path.
>
> Fix this by explicitly clearing PTE_RDONLY in _copy_pte() for both
> kexec and hibernation, ensuring all pages in the temporary mapping are
> writable regardless of their dirty state. This preserves the original
> commit's optimization for normal memory management while fixing the
> kexec/hibernation regression.
>
> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>

LGTM, Thanks!  Feel free to add my

Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

in the future versions.

> ---
> v2:
>   - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
>   - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
> v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/
>
>  arch/arm64/mm/trans_pgd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index 18543b603c77..08f5ee6643e1 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 * Resume will overwrite areas that may be marked
>  		 * read only (code, rodata). Clear the RDONLY bit from
>  		 * the temporary mappings we use during restore.
> +		 *
> +		 * For kexec/hibernation, we need writable access to all
> +		 * pages in the linear mapping to copy the new kernel image.
> +		 * Mark pages dirty first to ensure pte_mkwrite_novma()
> +		 * clears PTE_RDONLY.
>  		 */
> -		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
> +		__set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
>  	} else if (!pte_none(pte)) {
>  		/*
>  		 * debug_pagealloc will removed the PTE_VALID bit if
> @@ -57,7 +62,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 */
>  		BUG_ON(!pfn_valid(pte_pfn(pte)));
>  
> -		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
> +		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
>  	}
>  }

---
Best Regards,
Huang, Ying


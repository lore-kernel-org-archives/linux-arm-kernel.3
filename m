Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0550ECFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnMExoxTnMaCJz7/CnGcGQbAG/H1JHbfw3uQYHzjP7o=; b=TBugmwTErBm/hnon+Xn0WU7QaU
	SJgocHr/7jO6YKqEHYCi6UVbKgVaxMt4QrHUN9tYJgC6lGLWitMAQSDZdzbfkvX7Akc7CbPeivKiN
	/GXzilSW0HEnhPw9SkjuC58pL5P2HItmcrx0qrRdYyTBLVuEeO+1tHxZNDQ+m6swqXh/JyQcEdkMI
	c6vS1Q90X/xU757Zrt6Kz8tWTuaJElWZN4Z/Gx2S0S7hLmwNhSKAIXxA02JRrJQ4fa/KWlnii37Tt
	zvdDttd6hfjyBRTKf6SUwZ7/lcxW4vkTefgpbqllrhhZp270iKdDXgEb12ncu+qqAoPV3GyHqdvZv
	B+MAgoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOuqI-00000000EQs-0GI2;
	Fri, 28 Nov 2025 09:32:42 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOuqE-00000000EQD-0hl1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 09:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764322352; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=TnMExoxTnMaCJz7/CnGcGQbAG/H1JHbfw3uQYHzjP7o=;
	b=sLG10+NMscQ0YDGn/3GPIEtTcTD0+39jcItK/+nADsNhK/AKctQrCfWTZtsUF9w10Q797qmTqdlnxVkMEPBCMFUHMDo+b6k3NrHpKZ3g1Sw7KK9gwsLXR3Nx+S4nhb17oS7QGLMLB6q7YdGGmoE6LVEQv4MSmVSo1WMihz4nzHw=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WtbWYUJ_1764322337 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Nov 2025 17:32:29 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Cc: <catalin.marinas@arm.com>,  <will@kernel.org>,  <ardb@kernel.org>,
  <anshuman.khandual@arm.com>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
In-Reply-To: <20251127034350.3600454-1-jianpeng.chang.cn@windriver.com>
	(Jianpeng Chang's message of "Thu, 27 Nov 2025 11:43:50 +0800")
References: <20251127034350.3600454-1-jianpeng.chang.cn@windriver.com>
Date: Fri, 28 Nov 2025 17:32:17 +0800
Message-ID: <87qztiec4e.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_013238_887014_959201DC 
X-CRM114-Status: GOOD (  23.84  )
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

Hi, Jianpeng,

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

IMHO, this isn't the right "Fixes" tag.  The original _copy_pte() code
should be the fixing target.

> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
> ---
>  arch/arm64/mm/trans_pgd.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index 18543b603c77..ad4e5e4fcc91 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 * Resume will overwrite areas that may be marked
>  		 * read only (code, rodata). Clear the RDONLY bit from
>  		 * the temporary mappings we use during restore.
> +		 *
> +		 * For kexec/hibernation, we need writable access regardless
> +		 * of the page's dirty state, so force clear PTE_RDONLY.
>  		 */
> -		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
> +		pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
> +		__set_pte(dst_ptep, pte);

Why not

        __set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte));

?

>  	} else if (!pte_none(pte)) {
>  		/*
>  		 * debug_pagealloc will removed the PTE_VALID bit if
> @@ -57,7 +62,10 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 */
>  		BUG_ON(!pfn_valid(pte_pfn(pte)));
>  
> -		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
> +		pte = pte_mkvalid(pte);
> +		pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
> +		__set_pte(dst_ptep, pte);
>  	}
>  }

---
Best Regards,
Huang, Ying


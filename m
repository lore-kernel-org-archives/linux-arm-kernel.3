Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79F5C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 16:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B47q7VuSwb+/KbgR7SpRudbZnMLCz0OlCGXA+NFqc04=; b=d75MAAEdUXJuJmNzQhrPyZx+oN
	iOPQ86fsteSfPYO1AAoe6M02fYpBvjfD0xPwBLZSKnP9a5z74eCbVMrsoFiNYe/01L9oma2PsffBZ
	OS3djnAIrjyfUW6alKgo9zrKatwXVQUhIsrDsxov1BTl6FSu1FDtqJtgQvgdDssNvFyebjLWfc9Iw
	t0Gj2YtBHB9itzDQ8g7n33Ui+ZqtFGxNym8dU+wu81mbVetfs60udLvAEY9RIqjawhlZ999TpC9Ck
	Rsyqe5VOjhwKnaKiRQeAmoleJxeOditEa0TBL9pekN112q9iTixQCI+vo+HagWchbdGwp1DwQB4Nj
	+SuLZYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4MeI-00000002nPP-01K0;
	Mon, 14 Apr 2025 16:27:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4McQ-00000002nEU-0cGI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 16:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FE925C4795;
	Mon, 14 Apr 2025 16:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2FEC4CEE2;
	Mon, 14 Apr 2025 16:25:05 +0000 (UTC)
Date: Mon, 14 Apr 2025 17:25:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/11] arm64/mm: Refactor __set_ptes() and
 __ptep_get_and_clear()
Message-ID: <Z_023iswKD9NO3uH@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-5-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-5-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_092510_242929_E5A964AE 
X-CRM114-Status: GOOD (  12.50  )
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

On Tue, Mar 04, 2025 at 03:04:34PM +0000, Ryan Roberts wrote:
> +static inline void set_ptes_anysz(struct mm_struct *mm, pte_t *ptep, pte_t pte,
> +				  unsigned int nr, unsigned long pgsize)
>  {
> -	__sync_cache_and_tags(pte, nr);
> -	__check_safe_pte_update(mm, ptep, pte);
> -	__set_pte(ptep, pte);
> +	unsigned long stride = pgsize >> PAGE_SHIFT;
> +
> +	switch (pgsize) {
> +	case PAGE_SIZE:
> +		page_table_check_ptes_set(mm, ptep, pte, nr);
> +		break;
> +	case PMD_SIZE:
> +		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
> +		break;
> +	case PUD_SIZE:
> +		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
> +		break;
> +	default:
> +		VM_WARN_ON(1);
> +	}
> +
> +	__sync_cache_and_tags(pte, nr * stride);
> +
> +	for (;;) {
> +		__check_safe_pte_update(mm, ptep, pte);
> +		__set_pte(ptep, pte);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		pte = pte_advance_pfn(pte, stride);
> +	}
>  }

I thought I replied to this one but somehow failed to send. The only
comment I have is that I'd add a double underscore in front of the anysz
functions to imply it's a private API. Otherwise it looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


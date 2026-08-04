Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC6FC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BnYhgvMr/FHPkS0bNJFQoIeIyjuwgqHxPYj6YvNKVc=; b=gKsViEkrbGT2QsrEu0Sjq6PSt1
	mSUwcc2dQpMgqsASWkgE8HKspP9YVCjGY+mJqqIYrHbpYKJtHVOV7PkfkJ8gdpvihKQbLPMCrfGnO
	M8VJLY8u/juZj/BF0hA4xyYhc4SsFp2rQ7n79siYWNncn3X7pVEuJZrFhS0h0PnWrvouzxPqXxzE+
	U1ju3GrEjsyDReYjhgkZqXJWRH1Eis+D4iAxjXTb70DsfwlRO7dnnmf8lHMGMX9z+RNayLDlvWH5M
	ndQAsgZqwrrPkbieGKOz2vJAMdsMQkkymEKFyo6UyxgDXh4yL1M4ALbi3Y8E6btbcq5zkunvN18N5
	fangHOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD7i-00000001epf-3vlG;
	Tue, 04 Aug 2026 11:15:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD7h-00000001epN-2XoE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:15:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 116CE60A73;
	Tue,  4 Aug 2026 11:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046C71F000E9;
	Tue,  4 Aug 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785842152;
	bh=1BnYhgvMr/FHPkS0bNJFQoIeIyjuwgqHxPYj6YvNKVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DCdqhtW0GuGx813a1jz15OF/gAOcKlGQQMgstOkscJnbZ80cNSpXodL8obchTcvvY
	 KQN/nV7kGqJm+LgZAMxiWln9TvZ9vdXnXKBNn04G5L50+Jtsera2TdakLrWXQPjpRJ
	 x8VVNbIUYTfqBCCHJia88Qyqm/NaABhvVg7mu4+1dGtQVeVDCeexi1Iy6rImYBMNfi
	 yuvK2QUypp85rdG0Cu3jYFHIqsB3PJSA8ZplOmQs5oOP8mjC8gas04Nptnlq3h+Y8s
	 Y9VUnlv4cYWu2FTlz34/ZW1CV/hhjFHJB7a6P2rmFU++gl2FT7ktYhKgMqjMNRVXzR
	 yYKcYv6kfq3MQ==
Date: Tue, 4 Aug 2026 12:15:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] mm: constify generic pte_get*()
Message-ID: <anHJtpEpXWITllqk@lucifer>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-6-pfalcato@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803164400.531199-6-pfalcato@suse.de>
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

On Mon, Aug 03, 2026 at 05:43:59PM +0100, Pedro Falcato wrote:
> None of the helpers need write access to the PTE. Constifying the param
> allows for const typesafety.

constity?

>
> Signed-off-by: Pedro Falcato <pfalcato@suse.de>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/pgtable.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8c093c119e5a..dc418553e57a 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -490,7 +490,7 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
>  #endif
>
>  #ifndef ptep_get
> -static inline pte_t ptep_get(pte_t *ptep)
> +static inline pte_t ptep_get(const pte_t *ptep)
>  {
>  	return READ_ONCE(*ptep);
>  }
> @@ -739,7 +739,7 @@ static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
>   * present bit set *unless* it is 'l'. Because get_user_pages_fast() only
>   * operates on present ptes we're safe.
>   */
> -static inline pte_t ptep_get_lockless(pte_t *ptep)
> +static inline pte_t ptep_get_lockless(const pte_t *ptep)
>  {
>  	pte_t pte;
>
> @@ -777,7 +777,7 @@ static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
>   * We require that the PTE can be read atomically.
>   */
>  #ifndef ptep_get_lockless
> -static inline pte_t ptep_get_lockless(pte_t *ptep)
> +static inline pte_t ptep_get_lockless(const pte_t *ptep)
>  {
>  	return ptep_get(ptep);
>  }
> --
> 2.55.0
>

--
Cheers, Lorenzo


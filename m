Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B907DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPlMqpw1IDLRtYVeniRNxYTVPDHrNiexqffQCORp34g=; b=ky0xXWRhuEPPqnhpqNiK6ImGf8
	OBnrPKwlaOE24F25hoKWgH+IpEcydtwltFF9NlWQjf7Vagc2Wv1+yFC157neFBjlKpBn9JupD9Iyj
	TJcafXkvUblDTqUu2tux3UdfPxoQ/do4fO0UHo17tn8IISNe2h4a4UW4d8vXNIzMmT0H6HfFfCeR7
	bDTpyAhGhdfkbq2mRg8IzJgDVEZenHwdW7f6ZKv9skKqiNzzz928AD5avxpp4c+pFFntUhimk+aPV
	ihIUBOAVppe6ukYMbg661HSEWYq5+bt0ubabqSYWhnPsUmqB+R5LzDgj52oyeYR6LQtWoKagbjDgT
	U5i17VdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD3V-00000001eCw-0TH0;
	Tue, 04 Aug 2026 11:11:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD3T-00000001eCL-0CgG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:11:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1586060A71;
	Tue,  4 Aug 2026 11:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189511F00A3D;
	Tue,  4 Aug 2026 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785841889;
	bh=lPlMqpw1IDLRtYVeniRNxYTVPDHrNiexqffQCORp34g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nR2VBNRV0pk1/OgzMczs6p6psKwdhUOyZldMBZXdygQAo/uvz9Wm+fZryWyxvHs1N
	 tugMO3FuAf8iTrlmndYjOm/Bb/N2rPZdKEmFl846PR+iMA0btzcbh2c3EJcd8mHuuN
	 fdGFsBi04TbQFLPu9RVEjd22d+D6Cay6M2i7vOJMy6U9VB1zlCfalZJjnNA8BRXlsZ
	 cbAldKjKURmWlZZvTpkRiXIqqL4UOmUjNeH/t+yvRz0qMxgWP69xU+r6rms3nYh3Ei
	 EHdYt4bqTsBxaFdvBxzCK1DLNkVJdNj41y96psFb8DllhxnbvJ6lbCR59BEPua/jAx
	 QNUZ57jLN53YQ==
Date: Tue, 4 Aug 2026 12:11:08 +0100
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
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v2 2/6] parisc: Drop own implementations for ptep_get()
 and ptep_test_and_clear_young()
Message-ID: <anHHyiHqYf3yLf2K@lucifer>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-3-pfalcato@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803164400.531199-3-pfalcato@suse.de>
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

On Mon, Aug 03, 2026 at 05:43:56PM +0100, Pedro Falcato wrote:
> From: Helge Deller <deller@gmx.de>
>
> Switch to the generic implementations, which are identical.

You sure do like succinct commit messages :)

Maybe worth saying by dropping the __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG and
ptep_get defines you get the generic versions from include/pgtable.h which are
functionally identical.

(Being pedantic, they're not quite strictly identical as the
ptep_test_and_clear_young() generic function does some weird unnecessary
indirection with a local variable and the single {} is dropped etc.)

>
> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Suggested-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Pedro Falcato <pfalcato@suse.de>

Nits above notwithstanding, LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/parisc/include/asm/pgtable.h | 20 --------------------
>  1 file changed, 20 deletions(-)
>
> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
> index 467b8547ac8b..d92dee9fef3f 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -432,25 +432,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  	return pte;
>  }
>
> -static inline pte_t ptep_get(pte_t *ptep)
> -{
> -	return READ_ONCE(*ptep);
> -}
> -#define ptep_get ptep_get
> -
> -static inline bool ptep_test_and_clear_young(struct vm_area_struct *vma,
> -		unsigned long addr, pte_t *ptep)
> -{
> -	pte_t pte;
> -
> -	pte = ptep_get(ptep);
> -	if (!pte_young(pte)) {
> -		return false;
> -	}
> -	set_pte_at(vma->vm_mm, addr, ptep, pte_mkold(pte));
> -	return true;
> -}
> -
>  bool ptep_clear_flush_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep);
>  pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep);
>
> @@ -491,7 +472,6 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
>  #define HAVE_ARCH_UNMAPPED_AREA
>  #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
>
> -#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
>  #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
>  #define __HAVE_ARCH_PTEP_CLEAR_FLUSH
>  #define __HAVE_ARCH_PTEP_SET_WRPROTECT
> --
> 2.55.0
>

--
Cheers, Lorenzo


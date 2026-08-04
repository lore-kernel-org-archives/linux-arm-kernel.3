Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7627DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfx/JXhnkvzzI2BW5XElJmPYBoq4OvslsVX7Sylc9YM=; b=wE7hmCTSHgFHWYNNqZiO2gsp0C
	VzP45l0NoJg+gA7jKu9gDoZKEmc0p3dGJb2SsVBm67HrPypdCrAJuAX2kQOZYadW6O8kCu0bxnDC2
	rGPCxBgUpPVSCx8XUotBKtu5SxrQCJf5GvJy0IfsUTzC/c3eYkOeInnIh7zmx9frhssBkgy9cvRWx
	2vYqjDmX82IMr6j4dLOnOd35398rKu41rCeua+/LXj0KK+JvgphKAAjkn+AF3drkRgZkNphGMTr8D
	hHctw024xLwfRO+B0YkYmiKcBm230v6giz4cFhDiWWn2wzXIB2KOGpnWTXTF2Z4yGKWG0oGpBVf0S
	E+ieGOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCo1-00000001bUQ-12bx;
	Tue, 04 Aug 2026 10:55:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCnz-00000001bUC-2VmZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 10:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC88860A73;
	Tue,  4 Aug 2026 10:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC461F000E9;
	Tue,  4 Aug 2026 10:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785840930;
	bh=qfx/JXhnkvzzI2BW5XElJmPYBoq4OvslsVX7Sylc9YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JINp8CLcKyGxFVg0zs6zGF0WxOazH9C1viX2Av5FCxJcGkdot23Bx+NtDyXE2TQp4
	 Qi3bmokWHojVYhyMZBuqMwJRF4w1phDddQxizqP8c0Jxpp6ogEj3K6ZJIiJHoq3Iqg
	 8WTMfs25k/XwDxxK2l5Tz1ZseFoNgQkMCEqyDcVsy1CrnowkyETwrRYt/1UDrQTR7E
	 aMP8LAnwxDw8gEAOC+4rF+1auX4ZxRMi38y3pI5mu9flrrzWnmndtcNJtMDWDY+qUD
	 YT9R+5C948AydcYSJCE1zNoM7+FRoJlwlThzAqipqnTV1Mo7tWIozL8clLVYHK8VUU
	 8VuMRm0UMorNg==
Date: Tue, 4 Aug 2026 11:55:09 +0100
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
Subject: Re: [PATCH v2 1/6] mm/arm64: constify pte_get*() and contpte get
 logic
Message-ID: <anG2V7KpvIHjNyVq@lucifer>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-2-pfalcato@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803164400.531199-2-pfalcato@suse.de>
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

On Mon, Aug 03, 2026 at 05:43:55PM +0100, Pedro Falcato wrote:
> None of the contpte code needs write access to the PTEs.

This seems like a very broad statement? Is that actually true? I see a bunch of
ptep's that aren't const-ified, so you should explain why those couldn't be
converted.

Also you add a new contpte_align_down() macro, you should mention that it the
commit message, explain why it was needed.

In general more needed here :) it'd be ok if it was a truly trivial change that
was all obvious but you're changing some pte_t *'s and not others so it's
clearly not.

>
> Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> ---
>  arch/arm64/include/asm/pgtable.h | 10 +++++-----
>  arch/arm64/mm/contpte.c          | 11 ++++++++---
>  2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index a2681d755358..043bc0649cee 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -378,7 +378,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>  	__set_pte_complete(pte);
>  }
>
> -static inline pte_t __ptep_get(pte_t *ptep)
> +static inline pte_t __ptep_get(const pte_t *ptep)
>  {
>  	return READ_ONCE(*ptep);
>  }
> @@ -1652,8 +1652,8 @@ extern void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, pte_t pte);
>  extern void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, pte_t pte);
> -extern pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
> -extern pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
> +extern pte_t contpte_ptep_get(const pte_t *ptep, pte_t orig_pte);
> +extern pte_t contpte_ptep_get_lockless(const pte_t *orig_ptep);

This is (very) nitty but - not sure on the policy on extern's (Will/Catalin?) -
but in mm we drop them when we touch the code since you don't need them these
days :)

>  extern void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, pte_t pte, unsigned int nr);
>  extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
> @@ -1732,7 +1732,7 @@ static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
>   */
>
>  #define ptep_get ptep_get
> -static inline pte_t ptep_get(pte_t *ptep)
> +static inline pte_t ptep_get(const pte_t *ptep)
>  {
>  	pte_t pte = __ptep_get(ptep);
>
> @@ -1743,7 +1743,7 @@ static inline pte_t ptep_get(pte_t *ptep)
>  }
>
>  #define ptep_get_lockless ptep_get_lockless
> -static inline pte_t ptep_get_lockless(pte_t *ptep)
> +static inline pte_t ptep_get_lockless(const pte_t *ptep)
>  {
>  	pte_t pte = __ptep_get(ptep);
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 2de12656b4d8..3a5d6937fb51 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -26,6 +26,11 @@ static inline pte_t *contpte_align_down(pte_t *ptep)
>  	return PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>  }
>
> +#define contpte_align_down(ptep)                                                       \
> +	_Generic((ptep),                                                               \
> +		 const pte_t *: (const pte_t *) contpte_align_down((pte_t *) (ptep)),  \
> +		 pte_t *: contpte_align_down((pte_t *) ptep))

I really hate these _Generic() helper things. So ugly. And it's a pretty horrid
cast now :(

Was it not possible to const-ify further to just be able to constify
contpte_align_down itself?

It also seems to contradict the claim that contpte doesn't need write-access to
pte's since you're going to lengths to allow non-const pte_t * here.

You should cover off why this was necessary in the commit message as above.

Anyway PTR_ALIGN_DOWN() is already const-safe so couldn't you anyway just
collapse this to:

#define contpte_align_down(ptep) \
	PTR_ALIGN_DOWN(ptep, sizeof(*(ptep)) * CONT_PTES)

Then describe in the commit message why you need to handle both cases?

> +
>  static inline pte_t *contpte_align_addr_ptep(unsigned long *start,
>  					     unsigned long *end, pte_t *ptep,
>  					     unsigned int nr)
> @@ -310,7 +315,7 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>  }
>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>
> -pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> +pte_t contpte_ptep_get(const pte_t *ptep, pte_t orig_pte)
>  {
>  	/*
>  	 * Gather access/dirty bits, which may be populated in any of the ptes
> @@ -367,7 +372,7 @@ static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
>  			pgprot_val(prot) == pgprot_val(orig_prot);
>  }
>
> -pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> +pte_t contpte_ptep_get_lockless(const pte_t *orig_ptep)
>  {
>  	/*
>  	 * The ptep_get_lockless() API requires us to read and return *orig_ptep
> @@ -386,10 +391,10 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>  	 * because it is not part of a contpte range.
>  	 */
>
> +	const pte_t *ptep;

Nit but this is breaking the reverse xmas tree isn't it?

>  	pgprot_t orig_prot;
>  	unsigned long pfn;
>  	pte_t orig_pte;
> -	pte_t *ptep;
>  	pte_t pte;
>  	int i;
>
> --
> 2.55.0
>

--
Cheers, Lorenzo


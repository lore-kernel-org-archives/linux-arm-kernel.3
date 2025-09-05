Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A52ACA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/wt05ObpdxwaNVDkgazUTN9jzFwrbxwSbbI3oRgsSg=; b=Y6tJXjWxHTgBw2OpCg6DtmQYzI
	82bHc6rActvCM4an4ylXv8FiyGrUGnPgq99T8AVdixjJFSfvQ9gHAi9ig2MBd+k/z3q5XEsjFqHg6
	xiykLIMFKv581TTToKZ+Ss4F4RBbJ8xT1Q67v83j39sHS5XhrC72BRi5spgbNgAeC3cg3HChSJc3n
	71ExlPtyj56P3GjRheRGCVhsMhftHMoscMlIOnyfCiPQpIuUcurBfenhD7Ajv6nRd+Ygk2k8p+XdH
	rLlDsm7HYmvA87DeDKU0QwEmwtIwKnfynzA8ZyD67/EGLetYWcA7svKEW05pqUi//R/Dzo/G9o7MB
	YanksuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXZR-00000002PfC-44Lt;
	Fri, 05 Sep 2025 14:37:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUOL-00000001J9p-2Ao6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 11:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8DF860280;
	Fri,  5 Sep 2025 11:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F34C4CEF1;
	Fri,  5 Sep 2025 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757070844;
	bh=kDpzhB/6Cz5cknkR7vg25nX23vQb619EzR6gJMWg0zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihMD5UipqP42+z3YN+MrXn99n6Ycd3YsueOx6CaMNo+hdxO5RgsqI0SQxPdExPL3V
	 BxsONFBqcXHbav7x1SkdqIDD48PmtLWsgPm58G0QlMiay/oaIVskT0KF8NuPaK9VFd
	 /7wzkSZr/Kf5WRucMN8/UCNMZojnjOtaAmAF95Bjf8RmpqIT1ej5HygOv9JaajJW8G
	 3sqfezMFb01ibM/+0hkAjFN8sRUuYHQxj5dBVnj+if/YJu29wWq859HwQBz6EYrcmA
	 3EU4AmTwTsfLSifdqQkLCIzFzeBG/3X8Ze/ePLiEQWW6Tfu9V10hDtY4xQjiB241cI
	 b5217/1pBB0Eg==
Date: Fri, 5 Sep 2025 14:13:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 7/7] mm: update lazy_mmu documentation
Message-ID: <aLrF7qi85tmHfWRf@kernel.org>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-8-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904125736.3918646-8-kevin.brodsky@arm.com>
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

On Thu, Sep 04, 2025 at 01:57:36PM +0100, Kevin Brodsky wrote:
> We now support nested lazy_mmu sections on all architectures
> implementing the API. Update the API comment accordingly.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/pgtable.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 6932c8e344ab..be0f059beb4d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -228,8 +228,18 @@ static inline int pmd_dirty(pmd_t pmd)
>   * of the lazy mode. So the implementation must assume preemption may be enabled
>   * and cpu migration is possible; it must take steps to be robust against this.
>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
> - * and the mode cannot be used in interrupt context.
> + * held, but for kernel PTE updates, no lock is held). The mode cannot be used
> + * in interrupt context.
> + *
> + * Calls may be nested: an arch_{enter,leave}_lazy_mmu_mode() pair may be called
> + * while the lazy MMU mode has already been enabled. An implementation should
> + * handle this using the state returned by enter() and taken by the matching
> + * leave() call; the LAZY_MMU_{DEFAULT,NESTED} flags can be used to indicate
> + * whether this enter/leave pair is nested inside another or not. (It is up to
> + * the implementation to track whether the lazy MMU mode is enabled at any point
> + * in time.) The expectation is that leave() will flush any batched state
> + * unconditionally, but only leave the lazy MMU mode if the passed state is not
> + * LAZY_MMU_NESTED.
>   */
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  typedef int lazy_mmu_state_t;
> -- 
> 2.47.0
> 

-- 
Sincerely yours,
Mike.


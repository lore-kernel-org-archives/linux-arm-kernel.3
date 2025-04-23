Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD46EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep37Lk8cbj1uZK5RIghJDl9JD8qjOsYP9VkjRsT48SQ=; b=4948DhNl8RIOK7mDDkSwqWZGg1
	GchuDFlzfnwXQCcYbKkqNdtmMazdWH918Us/sfBDW+fxsiSIdaAFSY59LDx7MBRRNhg1NbWURwNcK
	m5Ws93j6hY8agcqM8HUWHkithRo7elQnAKaGcBCK8yQw4V0Hha/bp7f6458qe7uV11SygRgEXwu2J
	+8JGZqN6f70KrlD6yZ2qS6ujxiPT/ZXmMMMuzJESEszuA6v3YvLvgMYXou7mQy4cMcCZyA8OmNcW3
	pR9q38sFXoodT3+85iqqCSb/t0bplngExgQYJRNTj9I/d1VoEgqkohAfWdcZGER83ElqEL6bXNfbC
	/ncpBpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn9-0000000AXAo-35uR;
	Wed, 23 Apr 2025 13:05:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y1E-0000000AGuC-2bS7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F0325C564D;
	Wed, 23 Apr 2025 11:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACEFC4CEE2;
	Wed, 23 Apr 2025 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406715;
	bh=7JF7P2qS4SB6DrZAGOl+9+UQooOUX8XT2naGwe0eouI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxTlcq561futisD+LRi+fsEdtwocQ4KhTRWJWnnBSsh1LHwiTKkmT3KBKo0AX09ia
	 ooXxJil4w12RGrbJQr4/jfwpAKi48wbPhs8inj8Yzz1YD5/nABsoBSYEMA/Mn6dvrM
	 DDmfDfo7m9thdECwKNCorxyHVLI8s4/n+N3Sf7a37r28ebV3BE9wS7+Zdkfr/VObnN
	 qC82fIHCKgQcSXM2oIx/odVp3YUVVQW2gr/WYiQint/oU1+NB7wHVw/6EJukdw1tFl
	 DeUnWLbqHPsJyzeuR/tR5wnTVeQ9b2lwVEfcb69av6nmM+8/Q7k8CLQyV0W+0N7F/H
	 MgjHDQMOMOsOg==
Date: Wed, 23 Apr 2025 14:11:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v3 3/7] mm: Implement for_each_valid_pfn() for
 CONFIG_SPARSEMEM
Message-ID: <aAjK8Yq3OJH5hP12@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-4-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-4-dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_041156_759061_A6A86051 
X-CRM114-Status: GOOD (  25.63  )
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

On Wed, Apr 23, 2025 at 08:52:45AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Implement for_each_valid_pfn() based on two helper functions.
> 
> The first_valid_pfn() function largely mirrors pfn_valid(), calling into
> a pfn_section_first_valid() helper which is trivial for the !VMEMMAP case,
> and in the VMEMMAP case will skip to the next subsection as needed.
> 
> Since next_valid_pfn() knows that its argument *is* a valid PFN, it
> doesn't need to do any checking at all while iterating over the low bits
> within a (sub)section mask; the whole (sub)section is either present or
> not.
> 
> Note that the VMEMMAP version of pfn_section_first_valid() may return a
> value *higher* than end_pfn when skipping to the next subsection, and
> first_valid_pfn() happily returns that higher value. This is fine.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Previous-revision-reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/asm-generic/memory_model.h | 26 ++++++++--
>  include/linux/mmzone.h             | 78 ++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 5 deletions(-)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index 74d0077cc5fa..044536da3390 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -31,12 +31,28 @@ static inline int pfn_valid(unsigned long pfn)
>  }
>  #define pfn_valid pfn_valid
>  
> +static inline bool first_valid_pfn(unsigned long *pfn)
> +{
> +	/* avoid <linux/mm.h> include hell */
> +	extern unsigned long max_mapnr;
> +	unsigned long pfn_offset = ARCH_PFN_OFFSET;
> +
> +	if (*pfn < pfn_offset) {
> +		*pfn = pfn_offset;
> +		return true;
> +	}
> +
> +	if ((*pfn - pfn_offset) < max_mapnr)
> +		return true;
> +
> +	return false;
> +}
> +

Looks like it's a leftover from one of the previous versions.

>  #ifndef for_each_valid_pfn
> -#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			 \
> -	for ((pfn) = max_t(unsigned long, (start_pfn), ARCH_PFN_OFFSET); \
> -	     (pfn) < min_t(unsigned long, (end_pfn),			 \
> -			   ARCH_PFN_OFFSET + max_mapnr);		 \
> -	     (pfn)++)
> +#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			       \
> +	for (pfn = max_t(unsigned long, start_pfn, ARCH_PFN_OFFSET);	\
> +	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
> +			 pfn++)

And this one is probably a rebase artifact? 

With FLATMEM changes dropped
This-revision-also-reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  #endif /* for_each_valid_pfn */
>  #endif /* valid_pfn */
>  

-- 
Sincerely yours,
Mike.


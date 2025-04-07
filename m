Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/I513d+MFkQFDWshUjg+9PMMs2+x6RZMvhWnl3IRE4=; b=03tIIIjWZlJZd9bTmLEUZoEhpg
	4dk9QNJCnoUfwaqfqkdqStWoKG8pML7VY69mY+rw44frt4C8ZtxSJOickPi5kt0hM5XXCYu9bT96Q
	Shp3r40lnIOmAYg2BEqYSkDTf6GlytYWzUkCBq876gc0FiCRseNBLqfLscZAO+fwAECueVGxik50f
	WybRjB+8EqXA/zwsnQgGFLfe6AEZgOtGaPC6lhDJKvi5BA9OXwFPapx+oagEyxFqb/XStwN4Jml3p
	9FtQ5JUrhkAnKh8oDxpn+qKJMmPobd9JHaholLJHYBcBACI0tVwxYOM73vfOFxO4K14uTFJStomt+
	D1/n2/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gbc-0000000GgNp-1ajL;
	Mon, 07 Apr 2025 07:09:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gZs-0000000Gg8A-1XKw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45B556112C;
	Mon,  7 Apr 2025 07:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87205C4CEE8;
	Mon,  7 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744009647;
	bh=OPZXRFuI5uzN707xyLASfygRwfYY/xEScjSG9fL5FtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sINAG7xnyWMM7KuoQ3b66O3ahLdy8/9el1HbYr4a5KONOaRk5uQjGx4iYl7iqcnIl
	 EvR0aSRCLFHERW58gWf9zHJ4y9AmBeP9nJB4HSfyNDf5CizVPXwzjHsEsPFExHjLNU
	 e8kmf0lev3gZZKxwwAkQHSwpg08dJ6xTEoJfsf8vmb7Dcbr+2UxC5/98fHkoZwkMFi
	 6IWYN5aMDWP5N8ahxQZIDmqIRMyaD+FR0ImPUcdZOwdL/ANkaUGMTO3U54UxyiM3ds
	 2nCsZ1MUyum7qQlhZZqofdvHdB6are4QOqsqob5VKyMnKT7xJE9jIjvbEOtjiLtyu3
	 U8kk4w50Q1yoQ==
Date: Mon, 7 Apr 2025 10:07:18 +0300
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
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/7] mm: Optimise SPARSEMEM implementation of
 for_each_valid_pfn()
Message-ID: <Z_N5ps86xJmewe_P@kernel.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
 <20250404155959.3442111-4-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404155959.3442111-4-dwmw2@infradead.org>
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

On Fri, Apr 04, 2025 at 04:59:56PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There's no point in checking the section and subsection bitmap for *every*
> PFN in the same section; they're either all valid or they aren't.

Don't you want to merge this with the previous commit?
 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  include/linux/mmzone.h | 39 +++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 67cdf675a4b9..0da1b0ba5d9f 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -2154,21 +2154,20 @@ static inline int pfn_valid(unsigned long pfn)
>  	return ret;
>  }
>  
> -static inline bool first_valid_pfn(unsigned long *p_pfn)
> +/* Returns -1 (an invalid PFN) if no valid PFN remaining */
> +static inline unsigned long first_valid_pfn(unsigned long pfn, unsigned long end_pfn)
>  {
> -	unsigned long pfn = *p_pfn;
>  	unsigned long nr = pfn_to_section_nr(pfn);
>  
>  	rcu_read_lock_sched();
>  
> -	while (nr <= __highest_present_section_nr) {
> +	while (nr <= __highest_present_section_nr && pfn < end_pfn) {
>  		struct mem_section *ms = __pfn_to_section(pfn);
>  
>  		if (valid_section(ms) &&
>  		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
> -			*p_pfn = pfn;
>  			rcu_read_unlock_sched();
> -			return true;
> +			return pfn;
>  		}
>  
>  		/* Nothing left in this section? Skip to next section */
> @@ -2177,14 +2176,34 @@ static inline bool first_valid_pfn(unsigned long *p_pfn)
>  	}
>  
>  	rcu_read_unlock_sched();
> +	return (unsigned long)-1;
> +}
>  
> -	return false;
> +static inline unsigned long next_valid_pfn(unsigned long pfn, unsigned long end_pfn)
> +{
> +	pfn++;
> +
> +	if (pfn >= end_pfn)
> +		return (unsigned long)-1;
> +
> +	/*
> +	 * Either every PFN within the section (or subsection for VMEMMAP) is
> +	 * valid, or none of them are. So there's no point repeating the check
> +	 * for every PFN; only call first_valid_pfn() the first time, and when
> +	 * crossing a (sub)section boundary (i.e. !(pfn & ~PFN_VALID_MASK)).
> +	 */
> +	if (pfn & (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
> +		   PAGE_SUBSECTION_MASK : PAGE_SECTION_MASK))
> +		return pfn;
> +
> +	return first_valid_pfn(pfn, end_pfn);
>  }
>  
> -#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)	       \
> -	for ((_pfn) = (_start_pfn);			       \
> -	     first_valid_pfn(&(_pfn)) && (_pfn) < (_end_pfn);  \
> -	     (_pfn)++)
> +
> +#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)			\
> +	for ((_pfn) = first_valid_pfn((_start_pfn), (_end_pfn));	\
> +	     (_pfn) != (unsigned long)-1;				\
> +	     (_pfn) = next_valid_pfn((_pfn), (_end_pfn)))
>  
>  #endif
>  
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.


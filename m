Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5EEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uSIUrZVQrRmBreH7PPKu1LakavrQPpklGMNFMabHmw=; b=Xqw0qHSdNxFLEd9R94CVjZmPZ+
	ZNI9QzrI36xnUVYuujXAd64u46usqXPwVKDAdboPgoSPc4TfFMTJqJ80uOla6Ylilf1RgXr1vbIYt
	Kh3OBk+ui+cEQWyLjZllIcSDaIDOxAxQz6jmGLwuaPtRtaLMFaP+vv/Vi6sL4aJ57wltPCI7ylV0X
	xLaQYXdTrMq3ZRnbJECDUTbNKt8rIs/Hm94qFxTtikr8xYzl/XoWYEM+r6UkUKchBErAmDQhRZE9D
	0+/j7PHOJHVu6yhjY/6UaRkyTecRbFa/uQfqulIG7jRXv6pFjOyZi6hEkGsLqgEQ0ygCKbI+9bUBr
	5x7E/REg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gP8-0000000Ge3q-1EPC;
	Mon, 07 Apr 2025 06:56:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gNM-0000000Gde7-2DA1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 06:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87DAE45176;
	Mon,  7 Apr 2025 06:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309CFC4CEDD;
	Mon,  7 Apr 2025 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744008872;
	bh=LS5VAFFXIJwM/MSSY+05QkBo1gZOgTa9umjd9LQcztk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xv+M4Mat5kHI/qdqSL1tzNzCIwVTRpJIvLTTz4+vqLSkmxjAYPJTnHqeeemP5FFEO
	 /dZE3YfGdn97xTFXNNgBFNxwviUiSYPYZnlvaEQmGGH7DlrA5GdDfwKyftkELYmjFK
	 RdqQl+fSbVkSlMb7CV/ZNZc8md4SZy7xEV7O5ncMWpfVIwUJPNZy1ybNdEDUWB0yyn
	 tz3/y8runsfEn4FmEgStx5g1Gt+Gl66+pxmnMx/Y1+bsx7VFAoeB+F57ypOQN8jlKq
	 D0KOIRo/zaQSAebLkPOEX1gShEGyMIoaPDF61zp9GF4QIvBzvuKboPdpSFoQK+S+w8
	 bnG2TkLxajhrw==
Date: Mon, 7 Apr 2025 09:54:23 +0300
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
Subject: Re: [RFC PATCH v2 2/7] mm: Implement for_each_valid_pfn() for
 CONFIG_FLATMEM
Message-ID: <Z_N2nyKYBOf2PoBz@kernel.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
 <20250404155959.3442111-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404155959.3442111-2-dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_235432_583620_2AF355A9 
X-CRM114-Status: GOOD (  24.35  )
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

On Fri, Apr 04, 2025 at 04:59:54PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In the FLATMEM case, the default pfn_valid() just checks that the PFN is
> within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).
> 
> The for_each_valid_pfn() function can therefore be a simple for() loop
> using those as min/max respectively.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/asm-generic/memory_model.h | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index a3b5029aebbd..044536da3390 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -30,7 +30,31 @@ static inline int pfn_valid(unsigned long pfn)
>  	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
>  }
>  #define pfn_valid pfn_valid
> -#endif
> +
> +static inline bool first_valid_pfn(unsigned long *pfn)

This is now different from SPARSEMEM version. Do we need it at all?

> +{
> +	/* avoid <linux/mm.h> include hell */
>
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
> +#ifndef for_each_valid_pfn
> +#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			       \
> +	for (pfn = max_t(unsigned long, start_pfn, ARCH_PFN_OFFSET);	\
> +	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
> +			 pfn++)
> +#endif /* for_each_valid_pfn */
> +#endif /* valid_pfn */
>  
>  #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
>  
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.


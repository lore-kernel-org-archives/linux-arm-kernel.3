Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5BDC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOevX9dVP8B9x142UUWyFx0mzsmVnRTWNRfDMowzrP0=; b=2nl3wNPIv9fWp9oU5oPONzetXt
	4okt3zAFT6BFD4u0F2t5jVn7hvWT7eX3D5BLPawyxjXUgxslL7rpA4HMwqksCaTQduQGaDJAsHCCF
	W5xCub1Mwz+2qytve0LOIrkHqtKcNkoyjY/XcF7nSRUbBFP42M6xPl5CM9YB30FuVYBFCY+Ded4O9
	hLIgTbYj+VYCyy+M5xI+Tm+PIocrRohgOcQ2JRN/hPhqrmuevc9LfPv3h0CS3qln92uN7ckIas3Dx
	f7r5hZ4mWv2egRBA+e03bMgTKt6r10kd9q7kO7iXrUD2Djb303b/wz8IKoTL8+rtkvovLOJnBHhX3
	ak3akutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Dz2-00000007ubg-0DXk;
	Thu, 03 Apr 2025 06:23:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Dvc-00000007uA7-2fxt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3F2EA462BA;
	Thu,  3 Apr 2025 06:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9218C4CEE3;
	Thu,  3 Apr 2025 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743661191;
	bh=IVd8UGsu5sV0jxUV5ZTr4vtRlKqOWafEpnx5MIWbO3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KekjkokwWTfjRow/NzSJ1BwYsusDXfqJsoeMmHiG480Y8LjGYy2xbtX61/d+jYFo0
	 ya8vgFt32OgC+FwXz9kFye9oILceBeNwoQiIH9SOoCg4yPYbatDWUx6LFTZMhESzQs
	 ZHBz3gh2NEK4nQtkmNnkc7F0kWbEitreUEVRM4N7L9ymOjafn5ulUJapDMUA+8D+Hx
	 tVXkc+RI5kyYKqnaNMJaJuGymZdNG3IvvFSodU7r8gaFI2pzZMlRUA5rgwcRAlxcE0
	 rc2OyW+HMEHtqx3e2bl7ZRB7uAly4C1XcI76oeqveJO3pTpwR1SHWqxMOcGpMNeTuZ
	 OwZvspfkAEtZg==
Date: Thu, 3 Apr 2025 09:19:43 +0300
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
Subject: Re: [RFC PATCH 2/3] mm: Implement for_each_valid_pfn() for
 CONFIG_FLATMEM
Message-ID: <Z-4of2VHLpZ4Uj4q@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402201841.3245371-2-dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_231952_739730_165A64E6 
X-CRM114-Status: GOOD (  23.02  )
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

On Wed, Apr 02, 2025 at 09:18:40PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In the FLATMEM case, the default pfn_valid() just checks that the PFN is
> within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).
> 
> The for_each_valid_pfn() function can therefore be a simple for() loop
> using those as min/max respectively.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/asm-generic/memory_model.h | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index a3b5029aebbd..4fe7dd3bc09c 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -30,7 +30,31 @@ static inline int pfn_valid(unsigned long pfn)
>  	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
>  }
>  #define pfn_valid pfn_valid
> -#endif
> +
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
> +#ifndef for_each_valid_pfn
> +#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			       \
> +	for (pfn = max_t(unsigned long  start_pfn, ARCH_PFN_OFFSET);	       \
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


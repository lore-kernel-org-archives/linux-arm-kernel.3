Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8B0CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KsNES3quG6UyKXy/WSJmh5Tfdqu82vp795Q4GewzKg=; b=Y6IgaA6igUuxyoXSSv7VUOAMUc
	LGh4rigkR60hQNVukxCELH6DBJrOfRcAHS1TeSFE7OLTsaXw7M5DacirgkIOzuC6zVRZFcZqDsTQn
	YdIZ4pPG9fuG76QufPUgFwr2g81Gj65OwtFdymeE/JV7D6mYGqFqqdZs6cqqqVF6XbX24qINqcXaq
	Pt9t1cXwvPzJqBOG3XQsdd3ttu4Z3rqRproHOtmcXhT/O7J7n0EeQtKuboB6iAKFkOkPAZn6qjStY
	ppe5p9K1Et3jsWh3irXAieQuwL5La5fOL3fW89eN+Cq/i30wGt5d46qUW/MrwglQ+fPofzWqsPt01
	5VbAc03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3rJ-0000000GRRw-0EXT;
	Thu, 04 Jun 2026 08:55:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3rI-0000000GRRa-0gJq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:55:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01B9B601DD;
	Thu,  4 Jun 2026 08:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159E31F00893;
	Thu,  4 Jun 2026 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780563322;
	bh=5KsNES3quG6UyKXy/WSJmh5Tfdqu82vp795Q4GewzKg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=aPN94Myhtu9FE7edJToCisv6hjR9UpZEQ4OZFASRPQntvLR4IuZbZYE62R3GHgNNp
	 WBGJg3LT4wVHbyCDW2WIPWyee1y328MS/2elNJqA/7w3Ewcb+ZHapwHyJFslHja/lO
	 hhliXBqG2iUC2tGCpLA2WT1Aka/BfyKUrTryM2Vpznrv2HO3lvWsBP71mMARHI16iA
	 vG247/vz1mAZSGRJfWcaBUHW/40VUQkcVs69dCfoe8x4SjAtcT9meswFw3sDdmWGOR
	 DaGlwaPpsOOn/U1gWMzbqMEaOK11/23xjG7OW8cxN1E68CBZOgk+wtyFUy5mYM1+wW
	 tdWiBrC1+ZzQw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
	rppt@kernel.org, maz@kernel.org,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 1/3] arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
In-Reply-To: <20260603110522.3331819-2-smostafa@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-2-smostafa@google.com>
Date: Thu, 04 Jun 2026 14:25:16 +0530
Message-ID: <yq5a4ijisn0r.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Mostafa Saleh <smostafa@google.com> writes:

> At the moment, arch_mm_preinit() checks if the system has limited
> addressing or is running under CCA to enable SWIOTLB, only after to
> be forced to true anyway if it was false due to
> CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC being unconditionally true for
> arm64.
>
> Simplify this logic, by making it clear that SWIOTLB is always used
> but its size depends on the address layout of the system.
>

Reviewed-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/mm/init.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 97987f850a33..fcc9c05a8fe6 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -336,25 +336,22 @@ void __init arch_setup_zero_pages(void)
>  void __init arch_mm_preinit(void)
>  {
>  	unsigned int flags = SWIOTLB_VERBOSE;
> -	bool swiotlb = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
> +	bool limited_addressing = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
>  
>  	if (is_realm_world()) {
> -		swiotlb = true;
>  		flags |= SWIOTLB_FORCE;
> -	}
> -
> -	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
> +	} else if (!limited_addressing) {
>  		/*
>  		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
>  		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
>  		 */
>  		unsigned long size =
>  			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> +
>  		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
> -		swiotlb = true;
>  	}
>  
> -	swiotlb_init(swiotlb, flags);
> +	swiotlb_init(true, flags);
>  
>  	/*
>  	 * Check boundaries twice: Some fundamental inconsistencies can be
> -- 
> 2.54.0.1032.g2f8565e1d1-goog


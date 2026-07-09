Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEC3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZVe6otb3QQFEcQn2qk27wQbZsgcsUGTrPl64ZnFclY=; b=3EnOI0VseUttox4peiWMYIMcAs
	IotPoNJEhoaJsDs0JE9Aek44RXdqHs5l9tG4ywVG3J60LhGzXtAf+KPK8tLz2/R1aSApXhbILS6DM
	qJVBY+rj4tyAK4DAVUHHhCsiN+MT3Mip0jcWdpmnkliW0Acf0AKpsKkRH45WvazbY1rGHxnuTfVvY
	treUuP8kqvTmLu1NLdGxa4eyD98IbnRYOILeAJ6KRAtXBmEEKBgJti5y8FTrV5HOYReK4NLCx5rYs
	M/LKiLgXgHTRE/D/l3GbiWciLsuCXA91z/oTnAhTAfp0S9SaN8mKCCKBB1GgfKTvJYyP8jXbLfZbY
	NlsMRtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkk6-00000001iVh-3a1r;
	Thu, 09 Jul 2026 09:08:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkk3-00000001iV4-2r3P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:08:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B6253569;
	Thu,  9 Jul 2026 02:08:18 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 873013F66F;
	Thu,  9 Jul 2026 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783588102; bh=d5BvzN3MfufyvQVrVAt/h8a8nHtc61wj1/+yZBdDRrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSlK0AowdDo+6xAFhpXJK7l0Vv+3NGFmBgg8pxsKDst4190Fxt1eIe1SIJK+xORgq
	 LY/ghwUgINI1+y2TN75ycigsQOzr6y+yxSyaag1CAM9Ci3eVFes9Z1/Y1/c3URt+ZA
	 Tlj8vHkQ4NP/rVfmLXjtM4g6prlftGxiawNzjnsI=
Date: Thu, 9 Jul 2026 10:08:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, will@kernel.org, rppt@kernel.org,
	maz@kernel.org, aneesh.kumar@kernel.org
Subject: Re: [PATCH 1/3] arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
Message-ID: <ak9lA6dUnBYzwMlI@arm.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603110522.3331819-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_020823_756845_80667684 
X-CRM114-Status: GOOD (  21.35  )
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

On Wed, Jun 03, 2026 at 11:05:20AM +0000, Mostafa Saleh wrote:
> At the moment, arch_mm_preinit() checks if the system has limited
> addressing or is running under CCA to enable SWIOTLB, only after to
> be forced to true anyway if it was false due to
> CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC being unconditionally true for
> arm64.
> 
> Simplify this logic, by making it clear that SWIOTLB is always used
> but its size depends on the address layout of the system.
> 
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

I'm fine with implementing Mike's comment on doing the check inline.

I recall some people still comment out the dma kmalloc bounce option:

https://github.com/raspberrypi/linux/commit/a07564753639fe5ffb3f59d7364f14e6e68e3e9e

(there was no way I could convince them it's worse memory wastage
without the option)

So happy to make it slightly harder for them ;).

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


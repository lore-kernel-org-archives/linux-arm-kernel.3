Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BC1CF58FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 21:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynUSnAVmTQwBRBHFcgRBbfXRkmZBUB5kf7km9NYEdrE=; b=NjWReoTpe/BbWSvPPe6pU6/jj4
	AgfPyNt7B/PIJxSeZGdYmf3JC4it1PzK9GlFEUCKru8O6HqJlLWbjTCCy6xmQOXU7fXj3GIPiVn87
	fUNmpx+AAL7Q51jI08+PihkvKlA82uLq+GTy5G175BidcRjEp5Sy3mNFaBQR5uKSdv/4qhZVZJXI0
	46vOfKIXA8D4WlalLORtKhJDUIwMBx8ZG96qOPI/ZLiPZu8b04svsTLAiOnwDlawjGYUZSphe1AsS
	ePKgCEbfSKoqn8KqC5ycId67EA2pSj9tS2Z0sqL1/ZqnmIMITIn2YzcS6qaxTRrcnreYlnV2aBYrm
	LkfI1ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpdB-00000005k9Z-3WCW;
	Wed, 19 Nov 2025 21:22:25 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpd8-00000005k9G-1A0z;
	Wed, 19 Nov 2025 21:22:22 +0000
Message-ID: <352f4c67-2e6f-48f3-b967-30245721de7c@infradead.org>
Date: Wed, 19 Nov 2025 13:22:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64, lib: make ARM64 select
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
To: Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20251119-zippy-distinct-1e2a7da7b69b@spud>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251119-zippy-distinct-1e2a7da7b69b@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/19/25 11:08 AM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Randy pointed out that the newly added GENERIC_CPU_CACHE_MAINTENANCE
> was unusual, in that it selected an ARCH_HAS_... option, unlikely
> anything else in lib/Kconfig. Switch things around, so that arm64
> selects ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION and then
> GENERIC_CPU_CACHE_MAINENANCE will in turn be automatically enabled.
> 
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Catalin, you voiced a take on this already apparently that lead to the
> current implementation so I'd like an ack from you or Will here.
> My comment on the original thread, in response to Randy saying it was
> backwards, that accompanied the diff was:
>  Maybe it is backwards, but I feel like this way is more logical. ARM64
>  has memregion invalidation only because this generic approach is
>  enabled, so the arch selects what it needs to get the support.
>  Alternatively, something like (diff was here) implies (to me at least)
>  that arm64 has memregion invalidation as an architectural feature and
>  that the GENERIC_CPU_CACHE_MAINTENANCE option is a just common
>  cross-arch code, like generic entry etc, rather than being the option
>  gating the drivers that provide the feature in the first place.
> Ultimately, the .config produced is the same either way, just depends on
> what impression you want to give in the arch Kconfig, which might not
> really be a big deal, just semantics. Either way, I'd like an ack :)
> 
> Cheers,
> Conor.
> 
> CC: Catalin Marinas <catalin.marinas@arm.com>
> CC: Will Deacon <will@kernel.org>
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-kernel@vger.kernel.org

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/arm64/Kconfig | 2 +-
>  lib/Kconfig        | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 5f7f63d24931..75b2507f7eb2 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -21,6 +21,7 @@ config ARM64
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_CACHE_LINE_SIZE
>  	select ARCH_HAS_CC_PLATFORM
> +	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>  	select ARCH_HAS_CURRENT_STACK_POINTER
>  	select ARCH_HAS_DEBUG_VIRTUAL
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
> @@ -146,7 +147,6 @@ config ARM64
>  	select GENERIC_ARCH_TOPOLOGY
>  	select GENERIC_CLOCKEVENTS_BROADCAST
>  	select GENERIC_CPU_AUTOPROBE
> -	select GENERIC_CPU_CACHE_MAINTENANCE
>  	select GENERIC_CPU_DEVICES
>  	select GENERIC_CPU_VULNERABILITIES
>  	select GENERIC_EARLY_IOREMAP
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 09aec4a1e13f..ac223e627bc5 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -544,8 +544,9 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>  	bool
>  
>  config GENERIC_CPU_CACHE_MAINTENANCE
> -	bool
> -	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> +	def_bool y
> +	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> +	depends on ARM64
>  
>  config ARCH_HAS_MEMREMAP_COMPAT_ALIGN
>  	bool

-- 
~Randy


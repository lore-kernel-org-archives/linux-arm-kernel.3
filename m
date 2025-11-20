Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19338CF8549
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27haGZmj4M51i9M5QwPgx8UBPjbjfNy0Bw4NYKjZWCI=; b=uazR9yoPOfDbwJjAw/Xnl6Ypor
	z17+YApzjDYbYL6P5HG2t/GErjtUtvioLd3a9dhg4u8HD38Y3KdEYWA8Hwjok/qa78hpcCXXJuqrq
	MEnz5bnOmzdOroB0eY1hKC3NhQ8iGUC2b/ZXyE6B+4phIhbW1Cn+7H+91ZAMSZjIb6uRUzarZmGDy
	W7dkYU/IuuTqTPQHIBk9Xx57sDmoT5Xm7sv/mvK90FDPPfHS4n3akuizkyHdxwpCcCRpd5TZW8KYL
	j+O5YyPepqmaiyNnDSQ62M2pzEsbJzMWl9Km9i2ZdWQdKsl2YtY5jhJdi4EkiFuVCYLkokLDxhEvg
	TVPUJsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Uh-000000079j9-2lCk;
	Thu, 20 Nov 2025 17:30:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Ue-000000079ii-2xcq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:30:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98A9F339;
	Thu, 20 Nov 2025 09:30:42 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8A1F3F66E;
	Thu, 20 Nov 2025 09:30:48 -0800 (PST)
Date: Thu, 20 Nov 2025 17:30:46 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64, lib: make ARM64 select
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
Message-ID: <aR9QRuUigBsxxelm@arm.com>
References: <20251119-zippy-distinct-1e2a7da7b69b@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-zippy-distinct-1e2a7da7b69b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_093052_864104_5C5E90C9 
X-CRM114-Status: GOOD (  25.30  )
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

On Wed, Nov 19, 2025 at 07:08:27PM +0000, Conor Dooley wrote:
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

I really don't remember what I said before ;). As you describe above,
there are two somewhat complementary options -
ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION where an arch port can provide
this API and GENERIC_CPU_CACHE_MAINTENANCE as a generic way of providing
the same API. arm64 does the latter.

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

That's what we do if GENERIC_CPU_CACHE_MAINTENANCE depends on some arch
code but that's not the case here. GENERIC_CPU_CACHE_MAINTENANCE is an
alternative implementation that an arch can select if it does not
provide its own. I find the current code without the above patch better.

Maybe what gets confusing here is that the core code uses
ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION directly. A more involved fix
would be something like:

config CPU_CACHE_INVALIDATE_MEMREGION
	def_bool y
	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION ||
		GENERIC_CPU_CACHE_MAINTENANCE

and then go and change all the uses of
ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION.

Up to you, the current code also works for me.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBB1CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFtKTdCOnjQ0A3NhArKmDUYdjNzEkViYnCuIHXxkhxA=; b=Xg9ToEMregf8rKfmwVtMW1FacJ
	XrxDpHgmyYugcy6fXrXCbncnS/qiiMWNRcu/wrSortrHz9d3JTd7fb0iM5lSlI1lYed58h+98leLP
	PKVYTGkjb2s8cWr4U89/PzIKKB7c+GewPE8qgN0YffFjJnIW2Ou842rrEV987TaicjaXgO2q4NIr9
	FnWoQ3oCU1OI9hcViQ32KOlxNVsYyoEypSp0786S0AwIPN8/O12VmH2wKhaOoIGb6I1P4i81otT4D
	a5nLSUPWQksVQQqfxMrXhTrcB0mtKj6K/ASstJ+GZgmQSaP6sZQ9fn1hcxmRz0LS3hsjsjyCc6G8Y
	830/AF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLZi-00000000GSj-0zzD;
	Thu, 15 Oct 2026 13:32:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLZd-00000000GRz-13GJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:32:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5DC314BF;
	Thu, 15 Oct 2026 06:32:39 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 662AC3F673;
	Thu, 15 Oct 2026 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792071163; bh=dNFE+0UDneyWKTtD7qawy+9dH5R8+C4LBXacelJmlhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nemcdfNgayRdTS7dR6UHOCG6RHTna9KQ09c/ba9/UpVtCNPlJphTfBHxFzjRAMwy9
	 IeU+DhZBB2R0ziP+dGNvqL0TeNJTXEjortCfszilYnJWLdndRZ5858afl2F4n98XnO
	 ytj1ASrI0QH2FXiA5240qgBrZ+MzJ8vjaeZz6OOk=
Date: Thu, 15 Oct 2026 19:02:39 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Iurii Trukhin <yuri@trukhin.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit
 and 52-bit VA
Message-ID: <mcnimghb5b3h2h73c3uhrlmnc5azi3quzuq5owtsfw5zo7iw7t@t6j5xbd6zss5>
References: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_063245_385205_EEE9A8BF 
X-CRM114-Status: GOOD (  17.03  )
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

On Wed, Oct 14, 2026 at 10:23:35PM -0700, Iurii Trukhin wrote:
> Since commit f101c5644771 ("arm64: Support ARM64_VA_BITS=52 when
> setting ARCH_MMAP_RND_BITS_MAX"), arm64 supports up to 33, 31, and 29
> bits of mmap ASLR entropy on 48-bit and 52-bit virtual address spaces
> for 4K, 16K, and 64K pages respectively. However, ARCH_MMAP_RND_BITS
> still defaults to ARCH_MMAP_RND_BITS_MIN (18, 16, and 14 bits), which
> was set in commit 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS")
> when 39-bit VA was the 4K default.
> 
> Set the default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA to 28 (4K
> pages), 26 (16K pages), and 24 (64K pages), matching x86_64's 1 TiB
> randomization range (5 bits below ARCH_MMAP_RND_BITS_MAX) while keeping
> ARCH_MMAP_RND_BITS_MIN unchanged for smaller VA configurations.
> 
> Closes: https://github.com/KSPP/linux/issues/371
> Reviewed-by: Kees Cook <kees@kernel.org>
> Signed-off-by: Iurii Trukhin <yuri@trukhin.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> Changes in v2:
> - Add a comment above ARCH_MMAP_RND_BITS explaining the 1 TiB default
>   for 48/52-bit VA and the fallback to ARCH_MMAP_RND_BITS_MIN in
>   arch/Kconfig for smaller VA sizes (Anshuman Khandual).
> - Collect Reviewed-by from Kees Cook.
> - Link to v1: https://lore.kernel.org/r/CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com
>  arch/arm64/Kconfig | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index cab741a695f5..7bca47269dd5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -313,6 +313,14 @@ config ARCH_MMAP_RND_BITS_MAX
>  	default 16 if ARM64_16K_PAGES
>  	default 18
> 
> +# default to 1 TiB (5 bits below ARCH_MMAP_RND_BITS_MAX) on 48-bit and
> +# 52-bit VA; smaller VA sizes fall back to ARCH_MMAP_RND_BITS_MIN in
> +# arch/Kconfig
> +config ARCH_MMAP_RND_BITS
> +	default 24 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
> +	default 26 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
> +	default 28 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
> +
>  config ARCH_MMAP_RND_COMPAT_BITS_MIN
>  	default 7 if ARM64_64K_PAGES
>  	default 9 if ARM64_16K_PAGES
> -- 
> 2.56.0


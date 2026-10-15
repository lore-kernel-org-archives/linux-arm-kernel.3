Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF894CC6B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 04:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+jfCAPL434xcgnvX7nRAqhlGjDAZsb5VkATAEbZbjM=; b=1e3oEhs6gqPE/3JdwQspwsqLua
	6mpY5GD+F9Nea1f6VX3XFtxHYJWaZ8BnoMTUfzQxFSMcQGUCDaLVRxgOQRQmbZaCeQgZm8QeNB5A1
	/+lisF0VL/UQX3maz4l1dKjsk299HZUCCudQO5enD7VoT6L+TZdgpl274uN4rtJdfwy/QJ+GtmA7z
	gie67/h/Hui9qMlW+cNFzJAbLd8sbs3cpP9fTdnsYt9yykjcP6ebb40GC4+f7XnqaA4IYD7E6Wl1o
	o24WARSs6lTFaWeyOHzN89PmXE348bB22VlBzAt6R0BoBqkinypKR0KNvgehPJJ5EZLZyH2UfZ0HL
	sy0efMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDVe-0000000GpcO-1Gft;
	Thu, 15 Oct 2026 04:56:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDVT-0000000GpbS-3mjg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 04:55:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 679981516;
	Wed, 14 Oct 2026 21:55:49 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED25A3F871;
	Wed, 14 Oct 2026 21:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792040152; bh=DYm+etoHR3zNYbhtHG1R4AN3vVGImJ6ZW5Qomh/pmDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7HAF7FYATg4eCjmDj57DAFLfy1kQnGIC3BWZg/3co7F6JU2g8y8pjOMgelGFqZlE
	 LBGHqxwBERJhTrUahiwBtYFiRjEfGLd5NVrb0JSkWybp537bI3UXql1Br2Xc3srC7u
	 iz22Ot6G3DXMOnu23/ii8tkQIKAI6LSf/K2nw03E=
Date: Thu, 15 Oct 2026 10:25:49 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Iurii Trukhin <yuri@trukhin.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and
 52-bit VA
Message-ID: <x4iu6sii7fsxksdfur3wcpu4kb63eubsp5d6pzklxuhta7xtj7@rskyoy7ajncj>
References: <CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_215556_330103_3B32D0EE 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, Oct 14, 2026 at 07:26:48PM -0500, Iurii Trukhin wrote:
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
> Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
> ---
>  arch/arm64/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index cab741a695f5..59a53d7a75c5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -313,6 +313,11 @@ config ARCH_MMAP_RND_BITS_MAX
>  	default 16 if ARM64_16K_PAGES
>  	default 18
> 
> +config ARCH_MMAP_RND_BITS
> +	default 24 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
> +	default 26 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
> +	default 28 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
> +

Overriding ARCH_MMAP_RND_BITS inside the platform effectively makes this config
look something like the following on arm64.

config ARCH_MMAP_RND_BITS
	int "Number of bits to use for ASLR of mmap base address" if EXPERT
	range ARCH_MMAP_RND_BITS_MIN ARCH_MMAP_RND_BITS_MAX
	-------------
	default 24 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
	default 26 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
	default 28 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
	-------------
	default ARCH_MMAP_RND_BITS_MIN
	depends on HAVE_ARCH_MMAP_RND_BITS
	help
	  This value can be used to select the number of bits to use to
	  determine the random offset to the base address of vma regions
	  resulting from mmap allocations. This value will be bounded
	  by the architecture's minimum and maximum supported values.

	  This value can be changed after boot using the
	  /proc/sys/vm/mmap_rnd_bits tunable

ARCH_MMAP_RND_BITS_MIN still gets used when VA_BITS != 48 or 52. But this seems
like a subtle detail. Just wondering - should a comment explaining this default
random bits fallback sequence be added here as well ?

>  config ARCH_MMAP_RND_COMPAT_BITS_MIN
>  	default 7 if ARM64_64K_PAGES
>  	default 9 if ARM64_16K_PAGES
> -- 
> 2.56.0


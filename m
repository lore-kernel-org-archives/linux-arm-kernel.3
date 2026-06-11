Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B915CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6689/69B9guEnN6lKaNQc6LOcGsLEeqwwQs2y9xMkRY=; b=kNYeGEHgteJTrLJydZJy19SzrO
	etIHS+J+d9AOM7Wn78FlhKxqm09g04xS+owN995981kHrrpwWU5Z/YJh0deAqL9Vp+UDv1kIESWpA
	4XqCtpMEqR7MXiI1dPyrRPdSqxu0eXgKBH+Z9IpESX4T5nYtz+pzTeL0fp6Eu/uJZgPvw3GCuQxW9
	tJ/NH3tV0TWdkEz+vNCIHMlw9Hyfns3tw0KQvagHxdJ8Rpbtq0EiDHQ3NvB+bxINJfXSqsFuFBcRt
	A6H6mF4T3Fap00Qhtsqne0maDxDxvdNTR36sJ49jqfVU5CRrcGx2NuhTA5aHSyojfGKhwQMyOstXp
	cN4mylMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfY5-00000009Wcw-2l3o;
	Thu, 11 Jun 2026 13:34:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfY4-00000009Wco-1U3k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:34:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B41D74033E;
	Thu, 11 Jun 2026 13:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941681F00893;
	Thu, 11 Jun 2026 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781184859;
	bh=6689/69B9guEnN6lKaNQc6LOcGsLEeqwwQs2y9xMkRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FH9zIwOlM3rulsEmtitgCVGpcJMCizKjJMC8SfwlTrf9z109JdVTcfGIx2pf5Uh5C
	 V75kWs4R9bwupjCBZtEWpjb7DUEtA0+feRGxWz5Oj+J657z2AqOjkMuGPitIwTYkoy
	 TgZItWRyW7UEHuitnoJTox+H8+jakS8lC8XZk2iAYI2KC5qGSq62ZQF6wKoNFSaLU7
	 d4SvkM4QL4oT9kJikdpnxXUbkmi0+H9bMKZY2BNI95X0ty957Cg6y2TDqOrdR9lUoP
	 /5SetZc4L3B1qaX5Y5xd7X6M+bS4ejZmH7kXgb+5A0S1xdjJIIELGq9nEMOpR8o5SU
	 yUUd9RqabIwJQ==
Date: Thu, 11 Jun 2026 14:34:14 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <aiq5VigmtZq9GlAm@willie-the-truck>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610164822.4157248-1-sdonthineni@nvidia.com>
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

On Wed, Jun 10, 2026 at 11:48:22AM -0500, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state, as a load is observed before an
> earlier store takes effect.
> 
> The erratum can occur only when all of the following apply:
> 
>   - A PE executes a Device-nGnR* store followed by a younger
>     Device-nGnR* load.
>   - The store is not a store-release.
>   - The accesses target the same peripheral and do not overlap in bytes.
>   - There is at most one intervening Device-nGnR* store in program
>     order, and there are no intervening Device-nGnR* loads.
>   - There is no DSB, and no DMB that orders loads, between the store and
>     the load.
>   - Specific micro-architectural and timing conditions occur.
> 
> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
> to stlr* (Store-Release), which removes the "store is not a
> store-release" condition for every device write the kernel issues.
> Because writel() and writel_relaxed() are both built on __raw_writel()
> in asm-generic/io.h, patching the raw variants covers both the
> non-relaxed and relaxed APIs without touching the higher layers. Note
> that writel()'s own barrier sits before the store, so it does not order
> the store against a subsequent readl(); the store-release promotion is
> what provides that ordering.
> 
> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
> the plain str* sequence.
> 
> Note: stlr* only supports base-register addressing, so affected CPUs use
> a base-register stlr* path. Unaffected CPUs keep the original
> offset-addressed str* sequence introduced by commit d044d6ba6f02
> ("arm64: io: permit offset addressing").
> 
> The __const_memcpy_toio_aligned32() and __const_memcpy_toio_aligned64()
> helpers are left unchanged. These helpers are intended for
> write-combining mappings, which are Normal-NC on arm64. Replacing their
> contiguous str* groups would defeat the write-combining behavior used to
> improve store performance.
> 
> Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
> Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
> Changes since v2:
>   - Reworked the raw MMIO write helpers so unaffected CPUs keep the
>     existing offset-addressed STR sequence, while affected CPUs use the
>     base-register STLR path.
>   - Updated the commit message to match the code changes.
>   - Rebased on top of the arm64 for-next/errata branch:
>     https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/errata
> 
> Changes since v1:
>   - Updated the commit message based on feedback from Vladimir Murzin.
> 
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 23 ++++++++++++++++
>  arch/arm64/include/asm/io.h                 | 30 +++++++++++++++++++++
>  arch/arm64/kernel/cpu_errata.c              |  8 ++++++
>  arch/arm64/tools/cpucaps                    |  1 +
>  5 files changed, 64 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index ad09bbb10da80..fc45125dc2f80 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -298,6 +298,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c65cef81be86a..d633eb70de1ac 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
>  
>  	  If unsure, say Y.
>  
> +config NVIDIA_OLYMPUS_1027_ERRATUM
> +	bool "NVIDIA Olympus: device store/load ordering erratum"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around an
> +	  NVIDIA Olympus core erratum where a Device-nGnR* store can be
> +	  observed by a peripheral after a younger Device-nGnR* load to the
> +	  same peripheral. This breaks the program order that drivers rely
> +	  on for MMIO and can leave a device in an incorrect state.
> +
> +	  The workaround promotes the raw MMIO store helpers
> +	  (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
> +	  required ordering. Because writel() and writel_relaxed() are built
> +	  on __raw_writel(), both are covered without changes to the higher
> +	  layers.
> +
> +	  The fix is applied through the alternatives framework, so enabling
> +	  this option does not by itself activate the workaround: it is
> +	  patched in only when an affected CPU is detected, and is a no-op on
> +	  unaffected CPUs.
> +
> +	  If unsure, say Y.
> +
>  config ARM64_ERRATUM_834220
>  	bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
>  	depends on KVM
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 8cbd1e96fd50b..801223e754c90 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -22,10 +22,22 @@
>  /*
>   * Generic IO read/write.  These perform native-endian accesses.
>   */
> +static __always_inline bool arm64_needs_device_store_release(void)
> +{
> +	return alternative_has_cap_unlikely(
> +				ARM64_WORKAROUND_DEVICE_STORE_RELEASE);
> +}
> +
>  #define __raw_writeb __raw_writeb
>  static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>  {
>  	volatile u8 __iomem *ptr = addr;
> +
> +	if (arm64_needs_device_store_release()) {
> +		asm volatile("stlrb %w0, [%1]" : : "rZ" (val), "r" (addr));
> +		return;
> +	}
> +
>  	asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
>  }

Use an 'else' clause instead of the early return? (similarly for the other
changes).

I still reckon you should do something with the memcpy-to-io routines.
A simple option could be to make dgh() a dmb on parts with the erratum?
That at least moves the barrier out of the loop.

Will


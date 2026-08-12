Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D94C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYPwjDiA3bK/c7SyYMxuJGZm3FmtOLaYbnDMIYbMtws=; b=Acx/5T+8r8PsvK7Y3REA0n4/0J
	Na6janTT9OrVUc6eyg9KdhATVj3Mz4ONykuqN6QEpRUSP6m3b045a6Xr4CGOx2hCIb9Uu0qUVW/kl
	QAkku/PAVTZ6yqtHmgZSfne6lq74je7Qzfu2/G3jxEB2LITbvUOhCGTGnFhtnNCJK4BY9sMqcscLi
	ltv8/g/9XL2JEgqKNPGOpMctdEDIzis9myVgw+jFZ+UjidO/xDyPXbg2gYoxu+umxZH/cIG2qkm+Y
	M0Msre/09LvCChO010LyYCaDTFMl5fXJhEmw4jh1lKqHvoxTfvsgECv9153rbtvxv1QHtOgCfknRj
	WB9ZDyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuGrn-0000000H4Fi-2uHt;
	Wed, 12 Aug 2026 21:52:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuGrm-0000000H4Fc-12dq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 21:52:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B454600AD;
	Wed, 12 Aug 2026 21:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EA71F000E9;
	Wed, 12 Aug 2026 21:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571524;
	bh=CYPwjDiA3bK/c7SyYMxuJGZm3FmtOLaYbnDMIYbMtws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KNwY8jZ4Q7lMe7IO3qZCIoKNXlD+kuH03v8c/xRnJ4C6f5hwm8iYwPCyrpN/A2YKp
	 cSOf8K7qRltTCxDTpeGbu3lBRCRSPWhi9gQYuQnmoO/BRTgjwMXs8lfxFyzEPlYUme
	 Hpvs2eI4RM94NlsyLX9HJQOngAe/hLdYpEBGSxhAD7+T8FygHjZiaDorwkz7i9K+bX
	 XEEWP/3sklQGgk4MLoYozFFOvIRsYsUCCnoPBs0iUUG6B/A5HG3v3zXUOciNkNo3eh
	 Ft7A/se0FFYfSAFmU1XtUFITJCGnfz49JidwfkicQ31wlu0BZS7rM6R+7XQPKipnWw
	 vKvGKqlDk0WqA==
Date: Wed, 12 Aug 2026 14:52:01 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <anzo2Q-TxbB0PUhi@jpoimboe>
References: <20260812162058.612202-4-ardb@kernel.org>
 <20260812162058.612202-5-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812162058.612202-5-ardb@kernel.org>
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

On Wed, Aug 12, 2026 at 06:21:00PM +0200, Ard Biesheuvel wrote:
> The compiler is permitted to omit BTI landing pads from static functions
> that never have their address taken, but are only called directly, even
> if those calls originate from other code sections.
> 
> This means that calls into a module's .text section from .init.text,
> which may need to be routed via a PLT if .text is out of direct
> branching range, may result in BTI exceptions due to the indirect calls
> performed by the PLT veneers. (Note that calls to .init.text from .text
> are not allowed.)
> 
> The 'solution' is to emit yet another veneer - this is what the ELF
> psABI for AArch64 mandates in this case.
> 
> So derive an upper bound for the number of veneers that may be needed in
> the core module region to ensure that any call from init code that ends
> up needing a PLT can be directed at a veneer with a BTI landing pad, and
> allocate the additional space.
> 
> Then, emit these veneers as needed, i.e., only when emitting a PLT entry
> for a call from an init code section to a normal code section in the
> same module. In practice, this only occurs when a module's .init.text
> happens to be allocated far away from its .text section, which might
> happen when the initial 128M 'near' module region runs out of space
> between allocating the core module and allocating its init region.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/Kconfig                  |   2 -
>  arch/arm64/include/asm/module.h     |  12 ++
>  arch/arm64/include/asm/module.lds.h |   3 +
>  arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
>  4 files changed, 138 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..25fa80b5591d 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2114,8 +2114,6 @@ config ARM64_BTI_KERNEL
>  	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
>  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
> -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
> -	depends on !CC_IS_GCC

This doesn't work for livepatch though, and removing the "depends on
!CC_IS_GCC" is a livepatch regression as it broadly increases the
likelihood of ARM64_BTI_KERNEL (default y) getting enabled.

So "livepatch broken on arm64 clang 21+" now becomes "livepatch broken on arm64".

So either ARM64_BTI_KERNEL needs to depend on !LIVEPATCH (which will
keep BTI disabled for most distros), or we need a different approach
which uses __vmalloc_node_range() to allocate a veneer within 128MB of
the target.  I can try to write that up.

-- 
Josh


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6B710D14A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeWvAOEKtoIS1b4qbrlhtz4nIts4sedCy7HapR7HWzA=; b=kNikbW26LGeXVTN1fpc74qHLY2
	D5UxzIUa07uc6ksupswwT495CgjdNfPk6w8h5Qt7NlT4SjjvwUyDQvGISXs53e4DdEmk1RnXjbfed
	hduMxaaOX2mtaIjTLi/Re2G9DxqfxBV9W+EcCxztUaicLVJtQjK3t8IL76UCGLeRTZc6GVmde9zfU
	6dVi2ArD0jLkZvVDh/utrlPGvq0jOqYIToRnb3EUEB28Qx1bvkSWqb9OPGY/Y+Nr5pzoBK+/Ti8fn
	1cMAyZh40a3vAqc1/PRTYdT7E8MWzUTNTUCLvsd+k9js4+p00kKUOlNWV/mBpVtMAZX1XcxX5DczL
	FfqIzj9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Asl-0000000BAad-28vG;
	Mon, 30 Mar 2026 11:34:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Asj-0000000BAaK-296A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 11:34:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC2DF600AE;
	Mon, 30 Mar 2026 11:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F13BC2BCB1;
	Mon, 30 Mar 2026 11:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774870448;
	bh=m+8ovpGCN52xV7rm4mRJHVBz4R/XenTFs+rR+XmL00o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCjzBdom9MM9fRYVKgPUpggHDgj8y8IeCTMytL/EAiP+2jRMH7PWwzSMVJaA6RmrB
	 6+wyIILtF6t6OveLbllkRaazu1KXEOIoPK7Hs2bG6p8D/u52l7m6gHXhYkqWc1WaAp
	 qQRk9JaSAjhz/LulyymVliwaBRmpaExSkyi1bLf75bs0N9RgFpY2Sw58RI7QT0saz1
	 i7WFIJxFsX4dkaFtdlr5ahU/6tRg2wlge2/bbkwnEXg69t1VQy+bOWDcu4CY1mewgn
	 pBqoDrLXHHu7pR1ya7/MMtmUsh+fdz5aPOF8RtJucjRvPHCpSZF/I1S/FOf3gHc+aO
	 WQP0u5HwMIwqA==
Date: Mon, 30 Mar 2026 12:34:02 +0100
From: Will Deacon <will@kernel.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will McVicker <willmcvicker@google.com>,
	Sean Christopherson <seanjc@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] arm64: implement support for static call trampolines
Message-ID: <acpfqtTKdZzTjANY@willie-the-truck>
References: <20260313061852.4025964-1-cmllamas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313061852.4025964-1-cmllamas@google.com>
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

Hi Carlos,

On Fri, Mar 13, 2026 at 06:18:52AM +0000, Carlos Llamas wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Implement arm64 support for the 'unoptimized' static call variety, which
> routes all calls through a single trampoline that is patched to perform a
> tail call to the selected function.
> 
> Since static call targets may be located in modules loaded out of direct
> branching range, we need to use a ADRP/ADD pair to load the branch target
> into R16 and use a branch-to-register (BR) instruction to perform an
> indirect call. Unlike on x86, there is no pressing need on arm64 to avoid
> indirect calls at all cost, but hiding it from the compiler as is done
> here does have some benefits:
> - the literal is located in .rodata, which gives us the same robustness
>   advantage that code patching does;
> - no performance hit on CFI enabled Clang builds that decorate compiler
>   emitted indirect calls with branch target validity checks.
> 
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> ---
> v7:
>   - Took Ard's v3 patch (as it leaves the code patching logic out) and
>     rebased it on top  of mainline 7.0-rc3.
>   - Dropped the changes to arch/arm64/lib/insn.c and instead switched to
>     the (now) existing aarch64_insn_write_literal_u64().
>   - Added the RET0 trampoline define which points to the generic stub
>     __static_call_return0.
>   - Made the HAVE_STATIC_CALL conditional on CFI as suggested by Ard.
>   - Added .type and .size sections to the trampoline definition to
>     support ABI tools.

Are you planning to respin this based on Ard's comments?

Cheers,

Will


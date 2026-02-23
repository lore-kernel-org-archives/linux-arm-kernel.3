Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B50AEEC2A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 22:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crCBTx8/dsPEK+OSvhTeFIW5TxLjcQhWKTP9ngyNGlU=; b=3apH36/4eZefkWAJ5lL1MqYI7x
	wrvyIftRc8b1QQzaQTaLUI8lR6CKCmSssKKD/6nxoY1Gc0rEe3tKyUWNHfLmzQxcuro7OskBTq9Sz
	OZ7YEac8JSQF8JcvFq14K4uTHOFqMBLIqHm46lydf/IliI9qXhQZiUqpx239ho/+pWubLDEFfrDRc
	SpiJ8NNQZSfwSVF+f3L8syx23M0p3pe7jmjL7gQvRiMlSFpdZ+Cc8v86nY6bI3oo5pmr1ksGSjVIf
	taHXehcO+fZm/d1p2FutBj3kG5qtFJ9eQHgRqFMc/W4s1RfnOXZHie0ERiwQ7NpH0iepM2hOG06wH
	2r0+zTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vueUl-000000017S8-3nFn;
	Mon, 23 Feb 2026 22:33:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vueUi-000000017Rl-4C1R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 22:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1441643280;
	Mon, 23 Feb 2026 22:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEB5C116C6;
	Mon, 23 Feb 2026 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771886015;
	bh=6luMqdKSuq9XRD6Jc4ImEhLDZ+nlkl7La9U57PIctFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J983x/DUXe3wWA3l+3Y64rA0CyNpkzQkwiWNeGpfi4mVEVqwUoxLSa6SgDkizaiuU
	 kyf+CQXTpoeB+BorC0kiHBzbL7iajtQVbKZostEWGW0GTy+zMQ2EO0UAxWNsXvZSC3
	 pYwsPqARByxjspf6jCgBrNJRjb+aVsM3582OK2Z86dHZ4/AT3JjWfCQ7qzfd8TdDO3
	 HYeH2KFUSJokM4IASGtQF+43uR5nJAj3Me2nQddduKJWxtNjoQfmxUNtzNPpVAXvwE
	 LXapQT/2pi7TKjubvmD9ZBhqaEtpqEdZ/k1WaiC8FlfJvMknXYqOOUyAsPpsR2WUfK
	 Z3GgEPZNO4NJQ==
Date: Mon, 23 Feb 2026 14:33:35 -0800
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] kbuild: Use '-fms-anonymous-structs' if it is
 available
Message-ID: <202602231432.20F3F0CF@keescook>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_143337_125565_8851E14D 
X-CRM114-Status: GOOD (  22.35  )
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

On Mon, Feb 23, 2026 at 12:10:29PM -0700, Nathan Chancellor wrote:
> Clang recently added '-fms-anonymous-structs' [1] to specifically enable
> the Microsoft tagged anonymous structure / union extension, for which
> the kernel added '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
> enable -fms-extensions"). Switch to this more narrow option if it is
> available, which would have helped avoid the issue addressed by
> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
> '-fms-extensions'"). GCC has talked about adding a similar flag [2] as
> well but potentially naming it differently.
> 
> Move the selection of the flag to Kconfig to make it easier to use
> cc-option (as CC_FLAGS_DIALECT may be used in arch Makefiles, which may
> be too early for cc-option in Kbuild) and customize based on compiler
> flag names.
> 
> Link: https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692cc6b0ea902956 [1]
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=123623 [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Makefile     | 2 +-
>  init/Kconfig | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 06ff3032a6bc..1d5c0ab9ed5c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -791,7 +791,7 @@ endif
>  
>  CC_FLAGS_DIALECT := -std=gnu11
>  # Allow including a tagged struct or union anonymously in another struct/union.
> -CC_FLAGS_DIALECT += -fms-extensions
> +CC_FLAGS_DIALECT += $(CONFIG_CC_MS_EXTENSIONS)
>  # Clang enables warnings about GNU and Microsoft extensions by default, disable
>  # them because this is expected with the above options.
>  ifdef CONFIG_CC_IS_CLANG
> diff --git a/init/Kconfig b/init/Kconfig
> index c25869cf59c1..c4282d049463 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -960,6 +960,11 @@ config CC_IMPLICIT_FALLTHROUGH
>  	default "-Wimplicit-fallthrough=5" if CC_IS_GCC && $(cc-option,-Wimplicit-fallthrough=5)
>  	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
>  
> +config CC_MS_EXTENSIONS
> +	string
> +	default "-fms-anonymous-structs" if $(cc-option,-fms-anonymous-structs)
> +	default "-fms-extensions"
> +
>  # Currently, disable gcc-10+ array-bounds globally.
>  # It's still broken in gcc-13, so no upper bound yet.
>  config GCC10_NO_ARRAY_BOUNDS

Series looks good to me. One style question, why go the round-trip with
Kconfig instead of doing it all with a fallback in the Makefile:

CC_FLAGS_DIALECT += $(call cc-option,-fms-anonymous-structs,-fms-extensions)


-- 
Kees Cook


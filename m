Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFAEFEFB6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RMJ9vglHRabpfidLDVP2vBp9Odg4KBJTy36nr1qkQY=; b=UW6Nvw6WqcR5Y1qV46CeSyZXPY
	NK83QFvwKDGa1s22sorFqql8pvhDuX6SgLp+e+dmrnf3u9upYsXwM2rNRznJorBuv79CJ8fWeL29C
	xAxsFD7fs6BHEfhxlJ9xwuYsMz89p9HLv1Wu8y+pyxYVpwqH2SkrfWj5FiEOFLYNNK1v+0CYoy1Pz
	+AwT1lsI368erbgvW/BVCrJIM0w/aacxurtwVexbvEXPLWW48YpEB/1ToYePeEU7IqDrosmSLLJIZ
	mw9MfD0KSSvkuBmp3glUlkUXlZFI2HIJIoY4OQYU0cjcg5RLd1f29Xwy+mv+gd/PgC6NUUpLTu6p7
	UqIYL2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0pi-00000008k1E-0BzM;
	Fri, 27 Feb 2026 16:36:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0pg-00000008k16-0MGe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 16:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E197160008;
	Fri, 27 Feb 2026 16:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1501EC116C6;
	Fri, 27 Feb 2026 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772210210;
	bh=Z3uhduLHgelJSPSi026On/FywI8UKkvvjlJZUY1E4uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MB9xUxSAbn+Di/nKHpsy4Owu9dULnOKmLKkKAH28ikPcwz8E+RbfqqGz2GrfUKoS2
	 rvjh4SLv6O9JiT+L+6SpQ0H/DrDTd5iZ4+QO2UVbr+MNaN2vtvrRDHMh8InzWzLS16
	 cncFCKpao/cWYr+w7ULn5xRgtHEAxOxUtF8TV9x/Gfm0Xhf56APc04TeRI/vI1HLWn
	 rCK2y6qdS+KgajafeMKD0K51X5N68v1p6QI6T4oKzSBTbcUtFAPrySuzhetHWqfeao
	 I9O/HuD47cl1xQtwtjRali7R0u0JCyq+rfuleR6cQliX8wPX4/lv7UgeBNEjV4a1Vi
	 RyCLvFYLUeHLQ==
Date: Fri, 27 Feb 2026 17:36:33 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] kbuild: Consolidate C dialect options
Message-ID: <aaHIEQPiAbd7DGlW@derry.ads.avm.de>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-1-8ee406d3c36c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-fms-anonymous-structs-v1-1-8ee406d3c36c@kernel.org>
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

On Mon, Feb 23, 2026 at 12:10:28PM -0700, Nathan Chancellor wrote:
> Introduce CC_FLAGS_DIALECT to make it easier to update the various
> places in the tree that rely on the GNU C standard and Microsoft
> extensions flags atomically. All remaining uses of '-std=gnu11' and
> '-fms-extensions' are in the tools directory (which has its own build
> system) and other standalone Makefiles. This will allow the kernel to
> use a narrower option to enable the Microsoft anonymous tagged structure
> extension in a simpler manner. Place the CC_FLAGS_DIALECT block after
> the configuration include (so that a future change can move the
> selection of the flag to Kconfig) but before the
> arch/$(SRCARCH)/Makefile include (so that CC_FLAGS_DIALECT is available
> for use in those Makefiles).
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Makefile                              | 16 ++++++++++++----
>  arch/arm64/kernel/vdso32/Makefile     |  3 +--
>  arch/loongarch/vdso/Makefile          |  2 +-
>  arch/parisc/boot/compressed/Makefile  |  2 +-
>  arch/powerpc/boot/Makefile            |  3 +--
>  arch/s390/Makefile                    |  3 +--
>  arch/s390/purgatory/Makefile          |  3 +--
>  arch/x86/Makefile                     |  6 +-----
>  arch/x86/boot/compressed/Makefile     |  6 +-----
>  drivers/firmware/efi/libstub/Makefile |  3 +--
>  scripts/Makefile.warn                 |  5 -----
>  11 files changed, 21 insertions(+), 31 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>


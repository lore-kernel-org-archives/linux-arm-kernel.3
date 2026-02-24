Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E37F4BB8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD4+lp1M+KECx0QLG8Rln8fzr8sfcII1yyyhBAQzizQ=; b=A2WYAO+s+JLVYjVF0IknDPrU5J
	ebf7rc+BGWFQCptS6PG9F8jNSNL39V/I2UBJcwlkQb8rYRCrwZkHy9epcfhAmhgmK/tN0BIimq7yE
	23x6XjhHhXbk7WhBXP9Ut/csbF/FAnP4lTEoaKj05yaNxC9E2YJU4qKpypa/bcZVZfv9JCkv7P4kr
	amU1u9bGfEg3GInqL7T5PATOhpOr/cB6Xi7zaPaUC3oWYKrM+O/Yxuss3f7ZqOzLugB5E6uwVYFT6
	vuv7iJevb++Tg+AJ1za0zm1S52ooHBOT2GHQ3y5xDEZRlxq9afUZV8vmySJVfBp6s7D2Es0uc+wBG
	GUAc6tHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzRV-00000002mTQ-3SIg;
	Tue, 24 Feb 2026 20:55:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzRT-00000002mT1-2rtU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 20:55:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E3F942BB8;
	Tue, 24 Feb 2026 20:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21D3C116D0;
	Tue, 24 Feb 2026 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771966538;
	bh=SQcVebSSVbAr9KoKj2KkC4SNEiz7WbMDmKWz7KrYMDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5QdJEhDu3F3RiE7rGx/Dj0PuDa8L2iA78NrEvl5azZwBu4Ri8KTCOsR7pMfcmtU3
	 je0zFaQMDs14Xk47ydamr6d7K/C2mLgReCJU0eQ5t1msb9+Cr7JogPuBHz98HpmyQ7
	 FL/1gMMXhg+L00T+Kh2KO3QlEyL82mSedV36eljnS06LPHa0h3WmsQVmUdeXN3DiC9
	 cEZqkUgOnFmktJdADtpZXWkrLh5++ZoIg7vfN/CCzxHt5NfLUeQ6OdSa50D7n4i6eP
	 XnEv8Hyqpy7KHExKA4q8UQSULNu6IIGyin0jFfMRoKZyLBFOB48silsMM4b6g71d0s
	 /Yrc0O/Gx/2jA==
Date: Tue, 24 Feb 2026 13:55:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
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
Message-ID: <20260224205529.GB3510750@ax162>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
 <202602231432.20F3F0CF@keescook>
 <20260223225311.GA2462602@ax162>
 <202602231459.2A1DD53E0@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602231459.2A1DD53E0@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_125539_760833_E8B78F83 
X-CRM114-Status: GOOD (  19.14  )
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

On Mon, Feb 23, 2026 at 03:02:32PM -0800, Kees Cook wrote:
> On Mon, Feb 23, 2026 at 03:53:11PM -0700, Nathan Chancellor wrote:
> > On Mon, Feb 23, 2026 at 02:33:35PM -0800, Kees Cook wrote:
> > > Series looks good to me. One style question, why go the round-trip with
> > > Kconfig instead of doing it all with a fallback in the Makefile:
> > > 
> > > CC_FLAGS_DIALECT += $(call cc-option,-fms-anonymous-structs,-fms-extensions)
> > 
> > I might be misunderstanding how Kbuild works but
> > arch/$(SRCARCH)/Makefile may have logic for selecting CROSS_COMPILE,
> > which can impact the selection of $(CC), so I cannot use cc-option prior
> > to its inclusion but I need CC_FLAGS_DIALECT to be included before
> > arch/$(SRCARCH)/Makefile in the main build so that they can be used
> > within it, which is only possible after Kconfig has run. This is
> > probably worth more flushing out in the code or a comment since it is
> > subtle.
> 
> Will Kconfig see a different CC than Makefile? Regardless, I trust your

It shouldn't, as arch/$(SRCARCH)/Makefile is included before invoking
Kconfig; if the compiler changes, Kconfig will run again before
building.

> judgement here! I actually rather prefer having it exposed via Kconfig.
> :)
> 
> Reviewed-by: Kees Cook <kees@kernel.org>

Thanks!
Nathan


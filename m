Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB703EEC2AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 23:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHE2PwVSNmtaNO8BGfW3K8dGHZFbvaGXss3snToR86E=; b=AXcCdWN6R6Q2mGXqKVzUmU7tNG
	MrFDv+j6Alp0fCNXEX0TbJqAEIRrVeNQxfW97l5626hFcabefLeLpZxNJ3oex4yyPhYE6bsV+YouA
	L5D3Miwp0lg7S3LGZ6vnLfBeI7fhzyLe7K+x36BGNBBlVU/5nEwAIkazBjYrIqnsM0U2xi2jYmC1Y
	lTivCmwYebWFTiVBsyqEQh6Tk5PnWsTUSeYqML/MxePVNJtObMUxME4EGzvFhcpVxem0p/gz+sZXP
	e1AWPoD7lhWNqnZ6pF/055qRQCKD3ZsD1P2vaq7ugBxpUtgcSVRVtkibaC7W0xS7OjVo8f89Fp+Qm
	DMTgh3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuewm-000000019CA-1Gwj;
	Mon, 23 Feb 2026 23:02:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuewk-000000019C4-2U0v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 23:02:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C73060137;
	Mon, 23 Feb 2026 23:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48409C116C6;
	Mon, 23 Feb 2026 23:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771887753;
	bh=nT0awucs3thOhxybhtypZ+eYhg7lv1UzxhZoWxrV7JE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+fu9p4BCluguUa+f3d7BCn1pI2i9AqAEMBzkLqH4bddGKT5WSOohV6ymAwB0/TBL
	 lXNzrl+hmSZblzdOixCvwDFcjW9iJo5ImvPlqCzkT22dc1XMIZWAMVzlyyqxTDXaZ5
	 4A5XwGEGtPXUctEhtggMXSRCQOq7U1cR9rpjbXPVnxUBOrPDtTlXe7A3JD/7+OhTOF
	 pTf4SXBjLVNbVuMyClIxv9c3QaOT9qAcBGv/vWbbNANtpasn+pQ210tXeKbMh0saY3
	 VU3OBF9raOPDCjnuuQKM50HH+X66NKDZ7QZi6Z7SFHAdAZXCsNZW64QbGHR00fFjZH
	 58/1MtBytYDmg==
Date: Mon, 23 Feb 2026 15:02:32 -0800
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
Message-ID: <202602231459.2A1DD53E0@keescook>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
 <202602231432.20F3F0CF@keescook>
 <20260223225311.GA2462602@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223225311.GA2462602@ax162>
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

On Mon, Feb 23, 2026 at 03:53:11PM -0700, Nathan Chancellor wrote:
> On Mon, Feb 23, 2026 at 02:33:35PM -0800, Kees Cook wrote:
> > Series looks good to me. One style question, why go the round-trip with
> > Kconfig instead of doing it all with a fallback in the Makefile:
> > 
> > CC_FLAGS_DIALECT += $(call cc-option,-fms-anonymous-structs,-fms-extensions)
> 
> I might be misunderstanding how Kbuild works but
> arch/$(SRCARCH)/Makefile may have logic for selecting CROSS_COMPILE,
> which can impact the selection of $(CC), so I cannot use cc-option prior
> to its inclusion but I need CC_FLAGS_DIALECT to be included before
> arch/$(SRCARCH)/Makefile in the main build so that they can be used
> within it, which is only possible after Kconfig has run. This is
> probably worth more flushing out in the code or a comment since it is
> subtle.

Will Kconfig see a different CC than Makefile? Regardless, I trust your
judgement here! I actually rather prefer having it exposed via Kconfig.
:)

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

-- 
Kees Cook


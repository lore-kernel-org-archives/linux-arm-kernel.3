Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF94CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZBy6mGm/GWgsSmHcenYbJqYC61GyZljRKOGMCQEJWk=; b=oaVm/voifyDxGyywbVIUkFeU/E
	Un7UmeUhVNIwPLuYq34peHHkEUHgVZEbl53I3FxRqkEMbFbfF9Fl6/KJ4S70a7/CfYXC9/6jlJ0ra
	nYLcClcVq+9zT++ISwEARsEaFygleXnNTzWZZv8AgI2IQb1oJ8phfmqxgWHOto+NbPEBUb/P6h8Ww
	Fa0e75pR5L7MydbaddVXiMDmR8KJG0TS1WPF1D/tq4H6/dbtqs82K6vTjFIvRoh2xcEbdvx2h8HgP
	SRuN5GI2+hmTw3Qaui/EVPrskdjrNv0L4kxKPttwi2KYJGtUjtjXmJQBDyvgBsErcr0v2VWT9qj2X
	TKxcnT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9pJ-00000007DWD-0N92;
	Sat, 30 Aug 2025 00:52:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us7fM-00000006x8o-2sCm;
	Fri, 29 Aug 2025 22:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B33664534D;
	Fri, 29 Aug 2025 22:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5459DC4CEF0;
	Fri, 29 Aug 2025 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756506831;
	bh=gW3UREhITNbhZNhXVhy/1JzS54isi8alO3SClI/0N4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CeI1UyywLphq6rbxihW3K12s6RgLJ57FMTz4eKtrVBaIOZQlRF5Mw5MGN9VZqsyUF
	 ws1VVPK2A9Aphpeu08IZ+PBsvH/hZxYQZ/E8LlLJ2UoQZh6ZiWU7Ee+Bxfnwgu4wDN
	 qm+ussMtaWLdi83SF8aT0+Btb7yjNB9Ygip41cIO0PmgxXzADx6IHAKLQjnLPLfqj2
	 5eqSmq9NNuwF0+wjF3Nc60azb8fAUFVptz94yF9f9Xn6OeJKPvhEVPRSVPcQIiH9ig
	 389Jr83bSdXVSFqVbGJ4RM5keAw6x2twpNgOifIA2xME7cb4HiY+r6PWu/R5+ICtHu
	 LsNzjw1Q4Twaw==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Marco Elver <elver@google.com>, 
 "Peter Zijlstra (Intel)" <peterz@infraded.org>, kasan-dev@googlegroups.com
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
Subject: Re: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Message-Id: <175650682606.3003527.17329504429724755241.b4-ty@kernel.org>
Date: Fri, 29 Aug 2025 15:33:46 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_153352_768489_34069DFD 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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


On Thu, 21 Aug 2025 14:15:37 -0700, Nathan Chancellor wrote:
> s390 and x86 have required LLVM 15 since
> 
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
> 
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.
> 
> [...]

Applied, thanks!

[01/12] kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
        https://git.kernel.org/kbuild/c/20c0989283564
[02/12] arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
        https://git.kernel.org/kbuild/c/65aebf6f5880e
[03/12] ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
        https://git.kernel.org/kbuild/c/02aba266e391f
[04/12] arm64: Remove tautological LLVM Kconfig conditions
        https://git.kernel.org/kbuild/c/23cb0514208da
[05/12] mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
        https://git.kernel.org/kbuild/c/e633c2e78fd1c
[06/12] powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
        https://git.kernel.org/kbuild/c/488954ca195d0
[07/12] riscv: Remove version check for LTO_CLANG selects
        https://git.kernel.org/kbuild/c/6578a1ff6aa49
[08/12] riscv: Unconditionally use linker relaxation
        https://git.kernel.org/kbuild/c/7ccbe91796d7b
[09/12] riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
        https://git.kernel.org/kbuild/c/87b28d71396bf
[10/12] lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
        https://git.kernel.org/kbuild/c/a817de20091c3
[11/12] objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
        https://git.kernel.org/kbuild/c/573ad421cc551
[12/12] KMSAN: Remove tautological checks
        https://git.kernel.org/kbuild/c/5ff8c11775c74

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB70DC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WjLM+bqBQnxWBLyFD+G6Wb/9zI+E+wNq4T1i/w+3/XI=; b=pdo02f5F6tgevC5cFEO0Qnb+Ro
	+0lYumRPNxVq1Ipaf4ZwyEgEdxbNpfphw4FfkH6/RWsY0jZjr9XtnVkUBadlmeeUd48f+forlbrCp
	BDpZGEAKE0gCKJU8Poyui6v4JfcBgj6JceMgCnpuokS34VfFR9dt14ceg+EU4dcnYFPCOWkM7EmyG
	+8w3F8jUxxMZlIkpBc+jXW65sNoMDksAUPKCA/sCzAyGOF7Iy4dFLEBwwmM240qQDlBEIeiboX85w
	h38/b1XEyQS9h8L/U0KVILK5bG+kEH8h+xf3XT40cSyIEb/gxbo94WTYNmblkK51KpHniU5XA212U
	2JypjTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HC-00000003UyP-1Ia7;
	Sat, 15 Aug 2026 04:45:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HA-00000003Uxo-1tKd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0200B60A7E;
	Sat, 15 Aug 2026 04:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2785B1F000E9;
	Sat, 15 Aug 2026 04:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769142;
	bh=WjLM+bqBQnxWBLyFD+G6Wb/9zI+E+wNq4T1i/w+3/XI=;
	h=From:To:Cc:Subject:Date;
	b=gwo5uajh9Ku11rgr69W3oWzKqADkXpQw2vTRX6xQ2NxPdST2vVgf9rpAf858Lycbt
	 8zb3t0GfJ6gam9vEy07gold0MjaH5LxGuIubCtzN9ZqYYAE+g4kcD5Wcom8irly069
	 zkbrSnWo02ssjwp3Phn9EjWat+A/R0yCk1EjQUiPMgKUYGlPzXKy/UlLisHM2Ra1Os
	 KxK2ClTVM0n6qxqVyALVKW4uUZhnMS8nXuOe9JdEdMWVny9Lerq98mmk1FnEGK54Yy
	 cmchz3cbDQFmw1FwOoRep3M1UBZXALAL8vQGRDohsmnKbvSTVRmkgbyPenCLBmZwRx
	 pRZ1DjU4ytbeA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-toolchains@vger.kernel.org
Subject: [PATCH 00/12] arm64/bti: Fix kernel BTI issues with livepatch, large kernels, toolchains
Date: Fri, 14 Aug 2026 21:45:17 -0700
Message-ID: <cover.1786768375.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

These patches are a continuation of the following discussions about some
bugs related to kernel BTI:

  https://lore.kernel.org/ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org
  https://lore.kernel.org/20260812162058.612202-4-ardb@kernel.org

This started as a livepatch crash investigation but quickly ballooned
into a rabbit hole of latent bugs and toolchain quirks/crashes.

The most notable patch is probably the last one, which enables BTI on GCC.

I also hit a SIGSEGV in the GNU linker, for which this series has a
workaround.  The binutils bug is here:

  https://sourceware.org/bugzilla/show_bug.cgi?id=34525

Several of these patches probably wouldn't be needed if we had a flag
like -fno-omit-bti-pads or so for both compilers, but that currently
doesn't exist, and this at least fixes things for the existing
toolchains out there.

There is some toolchain discussion about that here:

 https://github.com/llvm/llvm-project/issues/215547

Josh Poimboeuf (12):
  arm64/bti: Add BTI landing pad to __sdei_asm_handler()
  arm64/module: Fix BTI exceptions caused by omitted landing pads in
    Clang 21
  arm64/bti: Fix BTI linker failures with long branches into .idmap.text
  arm64/bti: Work around ld crash caused by linker script aliases
  arm64/bti: Add link error for large kernels with BTI and unsupported
    toolchains
  arm64/bti: Add link error for large kernels with BTI and livepatch
  arm64/bti: Advertise BTI in assembly objects
  arm64/bti: Enable BTI in the pi/ startup code
  efi/libstub: Preserve the GNU property note
  efi/libstub: Remove obsolete .note.gnu.property workaround
  arm64/bti: Force-enable BTI linker veneers
  arm64/bti: Enable kernel BTI for GCC

 arch/arm64/Kconfig                    |   9 +-
 arch/arm64/Makefile                   |   5 +
 arch/arm64/include/asm/bti-note.h     |  32 +++++
 arch/arm64/include/asm/module.h       |   5 +
 arch/arm64/kernel/cpu-reset.S         |   2 +-
 arch/arm64/kernel/entry.S             |   1 +
 arch/arm64/kernel/head.S              |   8 +-
 arch/arm64/kernel/hyp-stub.S          |   1 +
 arch/arm64/kernel/image-vars.h        |  13 +-
 arch/arm64/kernel/module-plts.c       | 186 ++++++++++++++++++++++++++
 arch/arm64/kernel/pi/Makefile         |  11 +-
 arch/arm64/kernel/sleep.S             |   2 +-
 arch/arm64/kernel/vmlinux.lds.S       |  12 ++
 arch/arm64/lib/memcpy.S               |   3 +
 arch/arm64/lib/memset.S               |   2 +
 arch/arm64/mm/cache.S                 |   1 +
 arch/arm64/mm/proc.S                  |   8 +-
 drivers/firmware/efi/libstub/Makefile |  15 ++-
 18 files changed, 282 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm64/include/asm/bti-note.h

-- 
2.55.0



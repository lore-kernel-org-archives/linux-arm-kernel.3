Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C6DCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9AFaKTNpzu3Wl7g0cbSUK5dGjCeHRl49IBORR+ozh/Y=; b=jbG4D2RjytMjLR
	yF5QcCB/vwshVF2cvwoMA+vU70z/EZ9gwUQqu0DedrCPknFgPmcXGpWS8b8ZjtrSrQnJJzjxwTKyz
	i4nWx9U7nHK7xtJcbIrP8dVnZ2+RIEdKBqLZmakvWGMIWKwkJFRbaeI/MTs9U4kVJAqRbEYM8NT0v
	qLTC5Cnh5/v9TV4U2XQ0QNm5LPw23342Kfx2dSTwZzE1qeCniCgO6fh1Ztk2OjVZ3+ycV6x4tmEAn
	pkwdNCinxI4vSBFcKSAqHXjZ5YcF86YQGSvX53rnBW0eVjzqwZKLSvv5xE0cq5FINzvY3p7wlgCmM
	qutK6PHNXWHGGaKncC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIG1-00000001MHU-2bhq;
	Fri, 22 Aug 2025 03:16:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCdX-00000000dqm-3EUE;
	Thu, 21 Aug 2025 21:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7E18601F8;
	Thu, 21 Aug 2025 21:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9A8C4CEEB;
	Thu, 21 Aug 2025 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810954;
	bh=pOQAZPk+siIZkKBpkkHyydqf+iJWdipFSBVhf2HWXnk=;
	h=From:Subject:Date:To:Cc:From;
	b=uQZ01Sr4y5UBxZbhDZfvUDEeNvw7RqMPpecFt11yc7bsaW5ovYL0XUfzrWWsiNXzZ
	 c8++tipPQjqwKYp0k0gDhrvljaAd7re4WVkFUF5WrFBqQqEIN8iR74Vee7BNt/CA+g
	 /tG0RI1G9MmS/0WG3vAsp0ldl5sjGRh0EGxzNxVH1Tm0PYZoCyCQqG00dIozdKH/oE
	 pE+AKTCsKwpp5uIo1NEGnmB8ycta84iEl1LU6UXiRm6kopTiphBIqE2wbsbInRJaJl
	 x/kzDSN/k618a3jDJ0BA65cb43YnV0uqrkYoP768loOw8+WrPigrhNPUtuX3uXdZuq
	 W/LW5Ik2tcyqg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Date: Thu, 21 Aug 2025 14:15:37 -0700
Message-Id: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqMp2gC/22NQQ6CMBBFr0Jm7ZhOzSi48h6GhcAAE6GQVhsN4
 e5W3Lp8L/nvLxDEqwQ4Zwt4iRp0cgnsLoO6v7lOUJvEYI1lcyKD1XOccVSHwxBHjOKRGAu2B2p
 JqiMzpOnspdXXlr2WiXsNj8m/t5dIX/sL5pT/D0ZCg3VeUWPaglnM5S7eybCffAfluq4fb81km
 bkAAAA=
X-Change-ID: 20250710-bump-min-llvm-ver-15-95231f1eb655
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Marco Elver <elver@google.com>, 
 "Peter Zijlstra (Intel)" <peterz@infraded.org>, kasan-dev@googlegroups.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3775; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pOQAZPk+siIZkKBpkkHyydqf+iJWdipFSBVhf2HWXnk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLexp5jt71uLBmLnPYsZJXWxZZ/jvpEC46Jadf9c7Uw
 ETlF/9MO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEbpkw/I9487fgnDGfn0/r
 3M6FSqzXJdY9UrRtFZK/fJjFtn+JsiAjw7+LX1KSfVQYtyp9370iKU3tw4SvX9nUW67uL1go/I+
 LnxkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

s390 and x86 have required LLVM 15 since

  30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
  7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")

respectively. This series bumps the rest of the kernel to 15.0.0 to
match, which allows for a decent number of clean ups.

On the distros front, we will only leave behind Debian Bookworm and
Ubuntu Jammy. In both of those cases, builders / developers can either
use the kernel.org toolchains or https://apt.llvm.org to get newer
versions that will run on those distributions, if they cannot upgrade.

  archlinux:latest              clang version 20.1.8
  debian:oldoldstable-slim      Debian clang version 11.0.1-2
  debian:oldstable-slim         Debian clang version 14.0.6
  debian:stable-slim            Debian clang version 19.1.7 (3+b1)
  debian:testing-slim           Debian clang version 19.1.7 (3+b1)
  debian:unstable-slim          Debian clang version 19.1.7 (3+b2)
  fedora:41                     clang version 19.1.7 (Fedora 19.1.7-4.fc41)
  fedora:latest                 clang version 20.1.8 (Fedora 20.1.8-3.fc42)
  fedora:rawhide                clang version 20.1.8 (Fedora 20.1.8-3.fc43)
  opensuse/leap:latest          clang version 17.0.6
  opensuse/tumbleweed:latest    clang version 20.1.8
  ubuntu:focal                  clang version 10.0.0-4ubuntu1
  ubuntu:jammy                  Ubuntu clang version 14.0.0-1ubuntu1.1
  ubuntu:noble                  Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:latest                 Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:rolling                Ubuntu clang version 20.1.2 (0ubuntu1)
  ubuntu:devel                  Ubuntu clang version 20.1.8 (0ubuntu1)

I plan to carry this via the Kbuild tree with the appropriate acks.

---
Changes in v2:
- Add two new patches for RISC-V to clean up more LLD_VERSION checks
  (Alex)
- Pick up provided tags (thanks all!)
- Link to v1: https://lore.kernel.org/r/20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org

---
Nathan Chancellor (12):
      kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
      arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
      ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
      arm64: Remove tautological LLVM Kconfig conditions
      mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
      powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
      riscv: Remove version check for LTO_CLANG selects
      riscv: Unconditionally use linker relaxation
      riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
      lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
      objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
      KMSAN: Remove tautological checks

 Documentation/process/changes.rst |  2 +-
 arch/Kconfig                      |  1 -
 arch/arm/Kconfig                  | 11 ++++-------
 arch/arm64/Kconfig                |  5 +----
 arch/mips/Kconfig                 |  2 +-
 arch/powerpc/include/asm/inst.h   |  4 ----
 arch/riscv/Kconfig                | 21 +++++++--------------
 arch/riscv/Makefile               |  9 +--------
 lib/Kconfig.debug                 |  2 +-
 lib/Kconfig.kcsan                 |  6 ------
 lib/Kconfig.kmsan                 | 11 +----------
 scripts/min-tool-version.sh       |  6 ++----
 tools/objtool/check.c             | 10 ----------
 13 files changed, 19 insertions(+), 71 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-bump-min-llvm-ver-15-95231f1eb655

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>



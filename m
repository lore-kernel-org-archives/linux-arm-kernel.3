Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C8BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F95Aqp7UwoY/7Y7Y2dbxMxQCH7fBooS400Hkf6P8rP8=; b=1PLdyBjWD/mtJyCnzWLl1+slDC
	PeBk000lBPdqgNuQca0PYtEGRo/UVL29szXJrfHqIVr6W3P1qjNqtYhy2zK5ErsxqPXFGncMZZVSO
	aAvZh6xBwKgxCi/s/n+AdTfMz3t5xQjUom8kyaTpb0vp1kfX8vJSWwpqef5bIeRehL2BjOvU/cZFK
	sLFBUm1YxmuOD+q7gyqRLIGemW/J7EIYmyu6cnPZ2FSG7WtnDh7BT1KGycolW85t6um+w72IOPEdv
	QUTjI/DqieUvYNmsc8WgzrLe2pzj96eyKbcrZ6qFPzAjLbGAFQoGtO93tyACy+92eaZ6TRlJDogl1
	j0h3E+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mj-000000013el-38oQ;
	Wed, 13 May 2026 03:34:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mh-000000013e4-2eXx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B303C600CB;
	Wed, 13 May 2026 03:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07F5C2BCC7;
	Wed, 13 May 2026 03:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643270;
	bh=3oqfclx78zKWNl/PM+bomMzSvStvzcGz0lbbX8cPMeE=;
	h=From:To:Cc:Subject:Date:From;
	b=tqGuPuh2s9Yuad2jAFCuchftjpS/NeJlQ3UArT0ujCd4EvuVE9a7MyLMtR9ZM3WEf
	 IwxWJgdjuABmwEjiT/wxwtY4HHpQ1LHLwY0IkgYwvIxfwjw/Uo7keM90Esdn3Hnm0m
	 ImSiR/QXRbFZHeBI8QwKaxH2QzONBFSuyj5aOFEqiJanktyPDe5jgsJu4a+Pa4CYf8
	 DbmR53T0vpceirjX8UUiCR1zYmh0U5kKyayBoNXrBIgVGb3Jk59+h1c157om2vRcpX
	 RD7tcNAXdbrJO7qTWXdbXm1DvN3awXJkElwGBpNvRjhZlcRfBxjCt/TAvfgoBbxEjV
	 Czs6+9J/Avhqg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 00/21] objtool/arm64: Port klp-build to arm64
Date: Tue, 12 May 2026 20:33:34 -0700
Message-ID: <cover.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Based on tip/objtool/core.

v3:
- Too many changes to list.  Did a lot of testing and fixed a bunch of
  issues (many of which have already been merged in tip/objtool/core).

v2: https://lore.kernel.org/cover.1773787568.git.jpoimboe@kernel.org
- patches 1-2 were merged, rebase on tip/master
- improve commit message for "objtool: Extricate checksum calculation from validate_branch()"
- add review tags

v1: https://lore.kernel.org/cover.1772681234.git.jpoimboe@kernel.org

Port objtool and the klp-build tooling (for building livepatch modules)
to arm64.

Note this doesn't bring all the objtool bells and whistles to arm64, nor
any of the CFG reverse engineering.  This only adds the bare minimum
needed for 'objtool --checksum'.

And note that objtool still doesn't get enabled at all for normal arm64
kernel builds, so this doesn't affect any users other than those running
klp-build directly.


Josh Poimboeuf (21):
  klp-build: Reject patches to init/*.c
  arm64: Annotate intra-function calls
  arm64: Fix EFI linking with -fdata-sections
  arm64: Rename TRAMP_VALIAS -> TRAMP_VALIAS_ASM in asm-offsets
  arm64: vdso: Discard .discard.* sections
  arm64: Annotate special section entries
  crypto: arm64: Move data to .rodata
  objtool: Allow setting --mnop without --mcount
  kbuild: Only run objtool if there is at least one command
  objtool: Ignore jumps to the end of the function for checksum runs
  objtool: Allow empty alternatives
  objtool: Refactor elf_add_data() to use a growable data buffer
  objtool: Reuse string references
  objtool: Prevent kCFI hashes from being decoded as instructions
  objtool/klp: Add arm64 support for prefix/PFE detection
  objtool/klp: Filter arm64 mapping symbols in find_symbol_by_offset()
  objtool/klp: Don't correlate arm64 mapping symbols
  objtool/klp: Clone inline alternative replacements
  objtool/klp: Introduce objtool for arm64
  klp-build: Support cross-compilation
  klp-build: Add arm64 syscall patching macro

 arch/arm64/Kconfig                            |   2 +
 arch/arm64/include/asm/alternative-macros.h   |  27 +-
 arch/arm64/include/asm/asm-bug.h              |   2 +
 arch/arm64/include/asm/asm-extable.h          |  21 +-
 arch/arm64/include/asm/jump_label.h           |   2 +
 arch/arm64/kernel/asm-offsets.c               |   7 +-
 arch/arm64/kernel/entry.S                     |  10 +-
 arch/arm64/kernel/proton-pack.c               |  12 +-
 arch/arm64/kernel/vdso/vdso.lds.S             |   1 +
 arch/arm64/kernel/vmlinux.lds.S               |   2 +-
 arch/x86/boot/startup/Makefile                |   2 +-
 include/linux/annotate.h                      |  14 +-
 include/linux/livepatch_helpers.h             |  19 ++
 include/linux/objtool_types.h                 |   1 +
 lib/crypto/arm64/sha2-armv8.pl                |  18 +-
 scripts/Makefile.build                        |   4 +-
 scripts/Makefile.lib                          |  52 ++--
 scripts/Makefile.vmlinux_o                    |  15 +-
 scripts/livepatch/klp-build                   |  24 +-
 tools/include/linux/objtool_types.h           |   1 +
 tools/objtool/Makefile                        |   4 +
 tools/objtool/arch/arm64/Build                |   2 +
 tools/objtool/arch/arm64/decode.c             | 177 +++++++++++++
 .../arch/arm64/include/arch/cfi_regs.h        |  11 +
 tools/objtool/arch/arm64/include/arch/elf.h   |  15 ++
 .../objtool/arch/arm64/include/arch/special.h |  21 ++
 tools/objtool/arch/arm64/special.c            |  21 ++
 tools/objtool/arch/x86/include/arch/elf.h     |   2 +
 tools/objtool/builtin-check.c                 |   5 -
 tools/objtool/check.c                         |  65 +++--
 tools/objtool/elf.c                           | 170 +++++++------
 tools/objtool/include/objtool/elf.h           |  48 +++-
 tools/objtool/klp-diff.c                      | 237 ++++++++++++++++--
 33 files changed, 819 insertions(+), 195 deletions(-)
 create mode 100644 tools/objtool/arch/arm64/Build
 create mode 100644 tools/objtool/arch/arm64/decode.c
 create mode 100644 tools/objtool/arch/arm64/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/elf.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/special.h
 create mode 100644 tools/objtool/arch/arm64/special.c

-- 
2.53.0



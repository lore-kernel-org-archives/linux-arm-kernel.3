Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D289FF6E9B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YvYDbFjHJMFsdv8/1v6+ci/V4yiXFvurvLOSfSXQ7sg=; b=qbnb0P1bviGyfMHuvyqm0EzkBM
	vE15W2YM7sdb6CjLA9YflOT/bYBQDgqUNiI0BNiZi/ziyxEKyezVq5mVxVnvyK5utAqW6UvFyf0KG
	Hk8ywSZdlI3eVWYrVQ65JgvIBNCWuWbSS29bf8FpJ1L2FEYAQ8Tylrm3aEmonxSdXTNIu45Rd4W/B
	LYrrGoZ4lG6QwoTjFsWYBdo6dm7aXaIATjx82412gHTDGCT0nKxWagCn4aUSOKS5oyoNnBy7jsHtQ
	j7nkNx9LTyy485SAWoTGV7LanB5acCgmi+US9OH0H6L/f9KaUcg2wjJ/HGM1Cts0UNYifQjXBYV+D
	1qbOfTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGC-00000007KW3-03tY;
	Tue, 17 Mar 2026 22:51:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dG9-00000007KUa-16bk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36E7D42B17;
	Tue, 17 Mar 2026 22:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B11FC4CEF7;
	Tue, 17 Mar 2026 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787892;
	bh=7M5eXaWqiZHHjx4e1XlzzVnXsumabdLsCWW8h6CRvew=;
	h=From:To:Cc:Subject:Date:From;
	b=VxevCvHp9lmUF7+dNOM9Ms5C+9yz9lhM+jGse9c/iwaf3jCf3nFEnFa1IwYgQaohm
	 OkWKIWfMxvmnya/OHFbUvY8ETvQ0dlghKyMM0YlYtPl9GH/qt3oG17TMoEUGauBUR+
	 8n9M7ua28N33VK8AB1b0uG+HWn9s9nFT/VQMIO36/gPa1Ae6hVhasMu1rUspJQY/2J
	 hS1MdrEy6BguCj0RwfqG9RHF/RS2pseU8N0ylS/OvhaDRUql4FxmsWcgTNdoUyzB63
	 z2oEqCcXfOht9Rpn91W8ofzOIiiNpHgKrLB1Vb+PhPTXD3Sw2mDMb3+e8MxRplHapP
	 EX4v21HOVgMBQ==
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
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 00/12] objtool/arm64: Port klp-build to arm64
Date: Tue, 17 Mar 2026 15:51:00 -0700
Message-ID: <cover.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_155133_341681_6F30030D 
X-CRM114-Status: GOOD (  11.72  )
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

v2:
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

Josh Poimboeuf (12):
  arm64: Annotate intra-function calls
  arm64: head: Move boot header to .head.data
  arm64: Fix EFI linking with -fdata-sections
  crypto: arm64: Move data to .rodata
  objtool: Extricate checksum calculation from validate_branch()
  objtool: Allow setting --mnop without --mcount
  kbuild: Only run objtool if there is at least one command
  objtool: Ignore jumps to the end of the function for non-CFG arches
  objtool: Allow empty alternatives
  objtool: Reuse consecutive string references
  objtool: Introduce objtool for arm64
  klp-build: Support cross-compilation

 arch/arm64/Kconfig                            |   2 +
 arch/arm64/kernel/entry.S                     |   2 +
 arch/arm64/kernel/head.S                      |   2 +-
 arch/arm64/kernel/proton-pack.c               |  12 +-
 arch/arm64/kernel/vmlinux.lds.S               |   2 +-
 arch/x86/boot/startup/Makefile                |   2 +-
 include/asm-generic/vmlinux.lds.h             |   2 +-
 include/linux/init.h                          |   1 +
 lib/crypto/arm64/sha2-armv8.pl                |  11 +-
 scripts/Makefile.build                        |   4 +-
 scripts/Makefile.lib                          |  46 +++----
 scripts/Makefile.vmlinux_o                    |  15 +--
 scripts/livepatch/klp-build                   |  11 +-
 tools/objtool/Makefile                        |   4 +
 tools/objtool/arch/arm64/Build                |   2 +
 tools/objtool/arch/arm64/decode.c             | 116 ++++++++++++++++++
 .../arch/arm64/include/arch/cfi_regs.h        |  11 ++
 tools/objtool/arch/arm64/include/arch/elf.h   |  13 ++
 .../objtool/arch/arm64/include/arch/special.h |  21 ++++
 tools/objtool/arch/arm64/special.c            |  21 ++++
 tools/objtool/builtin-check.c                 |   5 -
 tools/objtool/check.c                         |  83 +++++++++----
 tools/objtool/elf.c                           |   9 +-
 tools/objtool/include/objtool/checksum.h      |   6 +-
 24 files changed, 321 insertions(+), 82 deletions(-)
 create mode 100644 tools/objtool/arch/arm64/Build
 create mode 100644 tools/objtool/arch/arm64/decode.c
 create mode 100644 tools/objtool/arch/arm64/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/elf.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/special.h
 create mode 100644 tools/objtool/arch/arm64/special.c

-- 
2.53.0



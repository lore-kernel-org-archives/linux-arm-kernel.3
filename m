Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40239EFCE5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vSXCtybRNru+FDWPN2mbzSVTahhDzqw/u5Qy0+1RfXs=; b=trQCBhB8fVT0Kypx8QPhq1EaPM
	Zi+edJ+rfD0XWud8aSX8ILk4gm/VSTmKhYAW6cnTlCyIJvU0D2+q9oEsOMtdNvqh4CFofgA322r3L
	YaGYYCB3HM73rcYcq5GWBELLUe5DxE+8YET72i7Vk6EDWTxJOrU/PJwwVgCov/ZxIBqfdIq2zNP3Q
	PPPQ1UTlW2/Ef3HXcO0jGEnx9w3RWxFcZ8wQSgUGMX2BgMf21k2i4VeydfwVPKpkcQy6CSWE+JG91
	1PG0uzkqiRncl1chtlZfACmp6dZMAVvQnzdYd6A271z+QaxdZ2J5g/7UaxtinpUxaSsmDCPuXt431
	T54e4HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRD-00000000pl1-1l8t;
	Thu, 05 Mar 2026 03:31:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRB-00000000pkF-22oV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55C7D41B46;
	Thu,  5 Mar 2026 03:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A207C116C6;
	Thu,  5 Mar 2026 03:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681504;
	bh=ro/DIlxvmAZpX3kL05CC6asOTt/nbWmxKieEfFF6Jno=;
	h=From:To:Cc:Subject:Date:From;
	b=Gr4kCtCSnoXpSxdWhju3ZGzveXqO8JrfmwZxP7hWWnWrsKn3sKFnpn0ozsVa5j7Mv
	 n7eDfX2NZ6hwHtoPeFza2t2N0Rfr9cjcMzsM/LsVmfO3LWQicqWhdJ4GkH1ixD/yqG
	 yYNxTkc6zsS5Jr153pHqBIiul464oxH1E1yavyMecZMx0gItf+flavin4tx/62j2RN
	 6Z59dvG//rr4lvRNqrhW/ldeu8eUWca7YLn11ZOMGNUBzLhBDvMlCSp/CkfngFz08e
	 pS9wRvqeBMgf8v4gLeik11Omig0Lj7V/jCsbD2w3wJ/vJe0t1e8NTKCy7miRZJ/yrA
	 fAIdeFZ6sBORw==
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
Subject: [PATCH 00/14] objtool/arm64: Port klp-build to arm64
Date: Wed,  4 Mar 2026 19:31:19 -0800
Message-ID: <cover.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193145_590868_66F7C67D 
X-CRM114-Status: GOOD (  12.39  )
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

Port objtool and the klp-build tooling (for building livepatch modules)
to arm64.

Note this doesn't bring all the objtool bells and whistles to arm64, nor
any of the CFG reverse engineering.  This only adds the bare minimum
needed for 'objtool --checksum'.

And note that objtool still doesn't get enabled at all for normal arm64
kernel builds, so this doesn't affect any users other than those running
klp-build directly.

Josh Poimboeuf (14):
  objtool: Fix data alignment in elf_add_data()
  objtool: Fix ERROR_INSN() error message
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
 tools/objtool/elf.c                           |  11 +-
 tools/objtool/include/objtool/checksum.h      |   6 +-
 tools/objtool/include/objtool/warn.h          |   2 +-
 25 files changed, 323 insertions(+), 84 deletions(-)
 create mode 100644 tools/objtool/arch/arm64/Build
 create mode 100644 tools/objtool/arch/arm64/decode.c
 create mode 100644 tools/objtool/arch/arm64/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/elf.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/special.h
 create mode 100644 tools/objtool/arch/arm64/special.c

-- 
2.53.0



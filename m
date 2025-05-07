Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6862C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=588ABMbq1VMpf5fTo+jtcv84XIC4xdQpMVZmd3w3dGs=; b=tc65qJZoODoxxWlgOxRIdoINqD
	fFCHu3nAz4gyW1e09v4Y6zcZCIWfP/nL6+PP0ccyJtP98UPh4h37IpS+1jrk/+UR9ilwWT9LzDj8c
	S2L/tBvbduNKS1Uc+wMVD5LIFCV7rBvkSUNhlkpFxgRKgkfUnlAkFHJaUTWYgCjJy1JIRXI+wQmvl
	L5z9HEzFUD+L3bCL+dvQlgrOJrAkeP4e1L0RD5t3KY0kxDTWRrVwv5b29R5zk/RUS7x6U742J+D0J
	aNRUIJE56+KHkbmNmP3UwreasLmy68qMoRVoFMIt7sa4xpmb49EG8W2831fXKyuNCLwb4W1rWFgLa
	9FSHM9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjRL-0000000GTUV-0qKb;
	Wed, 07 May 2025 18:24:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjJc-0000000GRpT-2Rcm;
	Wed, 07 May 2025 18:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7C3FA4D92E;
	Wed,  7 May 2025 18:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E0CC4CEE2;
	Wed,  7 May 2025 18:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746641778;
	bh=QgH8ehGN6f9HfgN0XYJ8BWQbTspcTZep+O49/EkwCxs=;
	h=From:To:Cc:Subject:Date:From;
	b=BC9uw5GOIJnXPxMtqpDWHCEfkXPbmNn7t0cWCLNpKPKsnoNLHlqk8aNbz4Zy/aXN7
	 bm+yhIFILcF1DCIXTScc5wN4Bk9G1/powraLUOdozefqT0Aausk0IPrpMPkpcQLr96
	 37BspEHKByXTwR7NeetcRg6l9tkyN9gP27E9WclP7nohaoVdigqhZDgXq0zeIH2BDz
	 uIdzHXnQN7UUpektS5ORSN90IrYCE5Da63eBTQPSEThKcQzGbd2uRwxOK4p2++NjeH
	 ws8d5259AqgMR4a6JEPiJ0K0pt3gYlX1gilwkZXWc9DOv5QbQakn5fwSa2+p+DuKDt
	 NFZx5jNCzUKYA==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/8] stackleak: Support Clang stack depth tracking
Date: Wed,  7 May 2025 11:16:06 -0700
Message-Id: <20250507180852.work.231-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3469; i=kees@kernel.org; h=from:subject:message-id; bh=QgH8ehGN6f9HfgN0XYJ8BWQbTspcTZep+O49/EkwCxs=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnSi7OXB/nf2/RYVPv/qsRZa9yqy1d3KRS0fd0+3e/0Z mOmo6+/dpSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAExkaTfD/4gpl7Tzdxoot/B1 XkiZEXAzf8mNdas/f/b9e06jz0Os9y/DP5NK7e6JV6Unzc9+dL7NyOhP2UaDL/szeOxaV8Zseb3 iAisA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_111620_751951_DFB9C6C4 
X-CRM114-Status: GOOD (  12.57  )
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

Hi,

As part of looking at what GCC plugins could be replaced with Clang
implementations, this series uses the recently landed stack depth tracking
callback in Clang[1] to implement the stackleak feature. Since the Clang
feature is now landed, I'm moving this out of RFC to a v1.

Since this touches a lot of arch-specific Makefiles, I tried to trim
the CC list down to just mailing lists in those cases, otherwise the CC
was giant.

Thanks!

-Kees

[1] https://clang.llvm.org/docs/SanitizerCoverage.html#tracing-stack-depth

 v1:
  - Finalize Clang URLs for landed feature
  - Perform CFLAGS enabling more sanely, as done for randstruct
  - Split __no_sanitize_coverage into separate patch
  - Update hardening.config and MAINTAINERS
  - Fix bug found with nvme tree
 RFC: https://lore.kernel.org/lkml/20250502185834.work.560-kees@kernel.org/

Kees Cook (8):
  nvme-pci: Make nvme_pci_npages_prp() __always_inline
  init.h: Disable sanitizer coverage for __init and __head
  stackleak: Rename CONFIG_GCC_PLUGIN_STACKLEAK to CONFIG_STACKLEAK
  stackleak: Rename stackleak_track_stack to __sanitizer_cov_stack_depth
  stackleak: Split STACKLEAK_CFLAGS from GCC_PLUGINS_CFLAGS
  stackleak: Support Clang stack depth tracking
  configs/hardening: Enable CONFIG_STACKLEAK
  configs/hardening: Enable CONFIG_INIT_ON_FREE_DEFAULT_ON

 security/Kconfig.hardening                  | 25 ++++++----
 Makefile                                    |  1 +
 arch/arm/boot/compressed/Makefile           |  2 +-
 arch/arm/vdso/Makefile                      |  2 +-
 arch/arm64/kernel/pi/Makefile               |  2 +-
 arch/arm64/kernel/vdso/Makefile             |  3 +-
 arch/arm64/kvm/hyp/nvhe/Makefile            |  2 +-
 arch/riscv/kernel/pi/Makefile               |  2 +-
 arch/riscv/purgatory/Makefile               |  2 +-
 arch/sparc/vdso/Makefile                    |  3 +-
 arch/x86/entry/vdso/Makefile                |  3 +-
 arch/x86/purgatory/Makefile                 |  2 +-
 drivers/firmware/efi/libstub/Makefile       |  6 +--
 kernel/Makefile                             |  4 +-
 lib/Makefile                                |  2 +-
 scripts/Makefile.gcc-plugins                | 16 +------
 scripts/Makefile.stackleak                  | 21 +++++++++
 scripts/gcc-plugins/stackleak_plugin.c      | 52 ++++++++++-----------
 Documentation/admin-guide/sysctl/kernel.rst |  2 +-
 Documentation/security/self-protection.rst  |  2 +-
 arch/x86/entry/calling.h                    |  4 +-
 arch/x86/include/asm/init.h                 |  2 +-
 include/linux/init.h                        |  4 +-
 include/linux/sched.h                       |  4 +-
 include/linux/stackleak.h                   |  6 +--
 arch/arm/kernel/entry-common.S              |  2 +-
 arch/arm64/kernel/entry.S                   |  2 +-
 arch/riscv/kernel/entry.S                   |  2 +-
 arch/s390/kernel/entry.S                    |  2 +-
 drivers/misc/lkdtm/stackleak.c              |  8 ++--
 drivers/nvme/host/pci.c                     |  2 +-
 kernel/stackleak.c                          |  4 +-
 tools/objtool/check.c                       |  2 +-
 tools/testing/selftests/lkdtm/config        |  2 +-
 MAINTAINERS                                 |  6 ++-
 kernel/configs/hardening.config             |  6 +++
 36 files changed, 122 insertions(+), 90 deletions(-)
 create mode 100644 scripts/Makefile.stackleak

-- 
2.34.1



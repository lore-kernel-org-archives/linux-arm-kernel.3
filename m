Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA0DC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 19:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LNQ9DkKl6qCmFIej/fFnSuqjjjkR0T0oF8RPjcQSQRQ=; b=t+AQI4bD3QA2LPFxyuLYNaEVZw
	KewoUjaDjHKwcF7xZ8Ae7t0H9EO0/vmMRjbGkN3bfz7fHlk938QSkjaw1zWLiqFknlMoSPkl4SjWU
	7I0WVNlAVkk3ZHt5Dn3d7I+VvYrfrw2k7QVDJ9pI51tLlWrzPD39dEI1cbDyoAZKQKhpWxsxHAuUw
	l2Ik6bNtZgvuXdS8L/4QAeNtj7posrqwZ+mGbJ85whYNh5rkoLp5ucthykxvCTzQvjGDBs3Xf8Lse
	f3b2WRJqGHRzo5/4JmuSWslHDjptUhLSGNaVVicagJRlUpiMS4E34//MiNlWJF3LuWul/XDsarF+j
	zkQRBTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvig-00000002q7O-2H6k;
	Fri, 02 May 2025 19:06:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvdd-00000002p5E-25Y7;
	Fri, 02 May 2025 19:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32F0160010;
	Fri,  2 May 2025 19:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E94C4AF0B;
	Fri,  2 May 2025 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746212492;
	bh=1wZOixwKxeQr1a/J8UDK8Pi43lF4NiEy/AG7Bfq7Re4=;
	h=From:To:Cc:Subject:Date:From;
	b=ad1pf0qYzwltvdPY6h8Js7Wl0DIi8myWiHDbcB1cSBFmzC9mSMZIPVR3BzKgM172m
	 iNbS2PosMuTAbtnfjwddEk4KPhjyGSUg++66mDTKZrsIB5l5jfSyawi9NoRtv+9Ugr
	 9yW2VrOWsvi5+c9H0fxkfqM66iJospU3LRQ+8ichWKhhRhKOJp+Dv1OWNINvU9Ezyg
	 5sIx2RJl+l0vTrSnRFv+OwqUskys08h2ypCepqgKWFG3x7vv8krLXDTq2yxXgyHLtx
	 MK9Twz/c6du9hpjl974CokWewDDKj+Ip54dDwHTqq0tZrmsXUL9WYr1nKApR5jGYep
	 EYLuC24pH8Llg==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
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
	kasan-dev@googlegroups.com,
	llvm@lists.linux.dev
Subject: [PATCH RFC 0/4] stackleak: Support Clang stack depth tracking
Date: Fri,  2 May 2025 12:01:23 -0700
Message-Id: <20250502185834.work.560-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=kees@kernel.org; h=from:subject:message-id; bh=1wZOixwKxeQr1a/J8UDK8Pi43lF4NiEy/AG7Bfq7Re4=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmiYq0zXwVaP2MzO3LzSIm1wIuVjpVbzNOfXP638PIW1 evsBc8fd5SyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEwk6QfDb9YtkgtfuS4K4mA/ bzvl+EbWn7wiUjFvVCN5Q1IPTbA6XMjI8Fxv72puDZ2kv5tVLwqtW5KzIaDc7Xzr9HCGstmZxw5 6MwEA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Hi,

As part of looking at what GCC plugins could be replaced with Clang
implementations, this series uses the recently proposed stack depth
tracking callback in Clang[1] to implement the stackleak feature.

-Kees

[1] https://github.com/llvm/llvm-project/pull/138323

Kees Cook (4):
  stackleak: Rename CONFIG_GCC_PLUGIN_STACKLEAK to CONFIG_STACKLEAK
  stackleak: Rename stackleak_track_stack to __sanitizer_cov_stack_depth
  stackleak: Split STACKLEAK_CFLAGS from GCC_PLUGINS_CFLAGS
  stackleak: Support Clang stack depth tracking

 Documentation/admin-guide/sysctl/kernel.rst |  2 +-
 Documentation/security/self-protection.rst  |  2 +-
 arch/arm/boot/compressed/Makefile           |  2 +-
 arch/arm/kernel/entry-common.S              |  2 +-
 arch/arm/vdso/Makefile                      |  2 +-
 arch/arm64/kernel/entry.S                   |  2 +-
 arch/arm64/kernel/pi/Makefile               |  2 +-
 arch/arm64/kernel/vdso/Makefile             |  1 +
 arch/arm64/kvm/hyp/nvhe/Makefile            |  2 +-
 arch/riscv/kernel/entry.S                   |  2 +-
 arch/riscv/kernel/pi/Makefile               |  2 +-
 arch/riscv/purgatory/Makefile               |  2 +-
 arch/s390/kernel/entry.S                    |  2 +-
 arch/sparc/vdso/Makefile                    |  3 +-
 arch/x86/entry/calling.h                    |  4 +-
 arch/x86/entry/vdso/Makefile                |  3 +-
 arch/x86/include/asm/init.h                 |  2 +-
 arch/x86/purgatory/Makefile                 |  2 +-
 drivers/firmware/efi/libstub/Makefile       |  6 +--
 drivers/misc/lkdtm/stackleak.c              |  8 ++--
 include/linux/init.h                        |  4 +-
 include/linux/sched.h                       |  4 +-
 include/linux/stackleak.h                   |  6 +--
 kernel/Makefile                             |  4 +-
 kernel/stackleak.c                          |  4 +-
 lib/Makefile                                |  2 +-
 scripts/Makefile.gcc-plugins                | 13 +++---
 scripts/Makefile.ubsan                      | 12 +++++
 scripts/gcc-plugins/stackleak_plugin.c      | 52 ++++++++++-----------
 security/Kconfig.hardening                  | 25 ++++++----
 tools/objtool/check.c                       |  2 +-
 tools/testing/selftests/lkdtm/config        |  2 +-
 32 files changed, 105 insertions(+), 78 deletions(-)

-- 
2.34.1



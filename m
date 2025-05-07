Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534A7C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiONM8NAF1ek+5Qrsn/XPNAluqSaF4eM+UwbzQ4ovEM=; b=lzgQAlB7iwNOEbs6AhNr6xW/LZ
	dxwwUn/HSoJfNxBSEf2/krdUvLxc5lKad2aWNAAdzySrHPYnW6FgkS80hJiMKQpM2aISZwGdTRBJl
	2AE50r3iRGS1CQ9iw4C4I2DasbZSqO1QOsgMkEM8CRRP5vT8W/FzmgItAmGRddvLXbpwFPqN962pI
	xmsHgn2uEBx+qT2/IqzATIy3npluqVb4jfqbH8RX8YgZGOGglp1N5bmDnMs7tDPitRLQCc7X0y5XG
	DIKDVHwllq9WUEALMfQQXH41mWEcAw4JPPz7pLsmRXPwBabGHUxRMmuyBudDd2rTqQ2HWMaVNoR8A
	W7LOrDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjX8-0000000GUTj-0F4S;
	Wed, 07 May 2025 18:30:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjJd-0000000GRsI-2uo9;
	Wed, 07 May 2025 18:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ECBA4AB29;
	Wed,  7 May 2025 18:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415D2C4AF0D;
	Wed,  7 May 2025 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746641781;
	bh=HWoalOBMMGh9CGDJhSNrUZqEPdcdOzZUgEuD85/CAd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxTsO8ykqQtoOsOd9xDG+/enjDzLXUsyguLr8qcMDo7z25PUjNA3ctp+C5+vEU/iz
	 acPEf4SFolFxUXbbWo+yOPM+yOoeM+ecKmTktuuFRwMv7zhdF3FAc9f4w4MtU0SxmH
	 LMMBFfB1Fs5YdHx+JHb01PbWo+v5UXa/GUQlqAx0XW8c5NTL9x/1nSjokQuPwm45hZ
	 WbgmZM+qsjf0qmCZgGyHrUOf1/Dv8v3jFpNvk/ZWIe4liVXUsL3Mxq1tpVxtAmoOX1
	 0g/ZLCu3kk7zpO68JNaDl8pD7mK2VBFfnCeJZvUgWjGwU0tnN0TzoYaOTMZ+5ukiM4
	 YKu967X4A/fow==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 6/8] stackleak: Support Clang stack depth tracking
Date: Wed,  7 May 2025 11:16:12 -0700
Message-Id: <20250507181615.1947159-6-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507180852.work.231-kees@kernel.org>
References: <20250507180852.work.231-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395; i=kees@kernel.org; h=from:subject; bh=HWoalOBMMGh9CGDJhSNrUZqEPdcdOzZUgEuD85/CAd4=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnSi3OV3f9aX9C6psL+Z4P189SPmrHrPq2vaGzQi7++J e3+b/9ZHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABOZW8zIcOOQ8o9DShIK8v8K 78ip3l31Xjeztf3PMTP1fVIJigJ7RBj+absd2iPNURU2fbXh3XVreGuX+2wvdGKVFoni+iFa91+ TGwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_111621_769568_1A5AEF8C 
X-CRM114-Status: GOOD (  10.63  )
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

Wire up CONFIG_STACKLEAK to Clang 21's new stack depth tracking
callback[1] option.

Link: https://clang.llvm.org/docs/SanitizerCoverage.html#tracing-stack-depth [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <kasan-dev@googlegroups.com>
Cc: <linux-hardening@vger.kernel.org>
---
 security/Kconfig.hardening | 5 ++++-
 scripts/Makefile.stackleak | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 2be6aed71c92..94aa8612c4e4 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -158,10 +158,13 @@ config GCC_PLUGIN_STRUCTLEAK_VERBOSE
 	  initialized. Since not all existing initializers are detected
 	  by the plugin, this can produce false positive warnings.
 
+config CC_HAS_SANCOV_STACK_DEPTH_CALLBACK
+	def_bool $(cc-option,-fsanitize-coverage-stack-depth-callback-min=1)
+
 config STACKLEAK
 	bool "Poison kernel stack before returning from syscalls"
 	depends on HAVE_ARCH_STACKLEAK
-	depends on GCC_PLUGINS
+	depends on GCC_PLUGINS || CC_HAS_SANCOV_STACK_DEPTH_CALLBACK
 	help
 	  This option makes the kernel erase the kernel stack before
 	  returning from system calls. This has the effect of leaving
diff --git a/scripts/Makefile.stackleak b/scripts/Makefile.stackleak
index 1db0835b29d4..639cc32bcd1d 100644
--- a/scripts/Makefile.stackleak
+++ b/scripts/Makefile.stackleak
@@ -8,6 +8,12 @@ stackleak-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK_VERBOSE) += -fplugin-arg-stacklea
 DISABLE_STACKLEAK  := -fplugin-arg-stackleak_plugin-disable
 endif
 
+ifdef CONFIG_CC_IS_CLANG
+stackleak-cflags-y += -fsanitize-coverage=stack-depth
+stackleak-cflags-y += -fsanitize-coverage-stack-depth-callback-min=$(CONFIG_STACKLEAK_TRACK_MIN_SIZE)
+DISABLE_STACKLEAK  := -fno-sanitize-coverage=stack-depth
+endif
+
 STACKLEAK_CFLAGS   := $(stackleak-cflags-y)
 
 export STACKLEAK_CFLAGS DISABLE_STACKLEAK
-- 
2.34.1



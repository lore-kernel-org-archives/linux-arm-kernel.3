Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5827C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 04:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4j17pn+//SHkaX8ONm+HlhNEvqzcDQ+QNAUfr7A3lEQ=; b=Yu4NjPJIKrGppQazmD2UuSPCYp
	2Aqa9H+806+im0K9KgNNlEjSGQ/7PRgZZAEBScusX5JuUXomxWzNHaR81EY4XglIVq2SSlDegvSlm
	8IzsZZa8IaV0oVWt6COCRV/P7PCdiPGdI8ay5tKrZ/k7rh4S/nX2XDWaE0kzi5VhnJ6JgW5xvoeP4
	pl7WmPtNhOFIGqMkfF6rnZmRDCaUjJdAcAsBBk3f5/bI99n0eepsQKb9yvfCma+Fskm3ucl86YnsF
	Jb4yz2wr+GMMdQXdQTCMNjHPrYMVJjj7xEFUi26CM5I2JRqbaT/zIWvHjfRDhBWImjNPVTvsogkeB
	wnDV0PZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKKj-00000002vzo-2GjQ;
	Fri, 23 May 2025 04:48:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKC6-00000002tzW-0Egd;
	Fri, 23 May 2025 04:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 704BD62A6A;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37879C4AF09;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975181;
	bh=p+7YUBTmffdnZ8pKAPuZ2rzC3Zvp9P0MFRgY7Xz1ydU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cuoIUYt5lZT/MOb5bo+IaJ7aQ3M00dLryP3hUiTSuemr+Glf19Mqt9NCJ7hvzcGA8
	 cF6XXsa9V8bFu81nQe8KR17Go7G/c1wTpTz+HnOv+456DDqlf5145g9eKiconkOAhz
	 l4QndzvhhW3ELKWijIE2p1gBkE2eVtJAW19EridJn5a4hpye1jt2OTnUmVBXTxLD/F
	 kaPldkcRShipvrgSO1ODJHLlAGizRNTFYqWNtGcCgfWKe1QaSTl7fIOF4jpwa+gF2e
	 LBYHB8dyw1Ajs2TM/20TZSefBCyBo5opbte97pHeo20nA0S2wVguHNFvVg25EUr92m
	 95IVkUtrl6qVQ==
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
Subject: [PATCH v2 12/14] kstack_erase: Support Clang stack depth tracking
Date: Thu, 22 May 2025 21:39:22 -0700
Message-Id: <20250523043935.2009972-12-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523043251.it.550-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=kees@kernel.org; h=from:subject; bh=p+7YUBTmffdnZ8pKAPuZ2rzC3Zvp9P0MFRgY7Xz1ydU=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v3/vPnPUwKQyTLv6YDRX59942Z9pVg4x/Z3tr6sPL i8Lmbqoo5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCIh3gy/2RSNKlmvL8m9MY2r Wbrn3fITnxd82hB9cYHtv/Cm+4suZTMyPNm8de0lHpnV+k8jWq5Yr/ylxKmUuEhjp6St9pbzk2V 2cwEA
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

Wire up CONFIG_KSTACK_ERASE to Clang 21's new stack depth tracking
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
 security/Kconfig.hardening    | 5 ++++-
 scripts/Makefile.kstack_erase | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index f7aa2024ab25..b9a5bc3430aa 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -82,10 +82,13 @@ choice
 
 endchoice
 
+config CC_HAS_SANCOV_STACK_DEPTH_CALLBACK
+	def_bool $(cc-option,-fsanitize-coverage-stack-depth-callback-min=1)
+
 config KSTACK_ERASE
 	bool "Poison kernel stack before returning from syscalls"
 	depends on HAVE_ARCH_KSTACK_ERASE
-	depends on GCC_PLUGINS
+	depends on GCC_PLUGINS || CC_HAS_SANCOV_STACK_DEPTH_CALLBACK
 	help
 	  This option makes the kernel erase the kernel stack before
 	  returning from system calls. This has the effect of leaving
diff --git a/scripts/Makefile.kstack_erase b/scripts/Makefile.kstack_erase
index 5223d3a35817..c7bc2379e113 100644
--- a/scripts/Makefile.kstack_erase
+++ b/scripts/Makefile.kstack_erase
@@ -8,6 +8,12 @@ kstack-erase-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK_VERBOSE) += -fplugin-arg-stack
 DISABLE_KSTACK_ERASE := -fplugin-arg-stackleak_plugin-disable
 endif
 
+ifdef CONFIG_CC_IS_CLANG
+kstack-erase-cflags-y += -fsanitize-coverage=stack-depth
+kstack-erase-cflags-y += -fsanitize-coverage-stack-depth-callback-min=$(CONFIG_KSTACK_ERASE_TRACK_MIN_SIZE)
+DISABLE_KSTACK_ERASE  := -fno-sanitize-coverage=stack-depth
+endif
+
 KSTACK_ERASE_CFLAGS   := $(kstack-erase-cflags-y)
 
 export STACKLEAK_CFLAGS DISABLE_KSTACK_ERASE
-- 
2.34.1



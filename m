Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6511C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 19:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ze0pvXhySGK0L8vipVJusHHsV9ao9JZ+P8Ehobf9I4o=; b=gTU7yia2xinEgZdo1bjKr4OeS8
	O7c6G69dnXOLBclsJDaEWl/ssdMuPeZB2njtg+kpBQ2bUubljcpZ6eXGXgrdDQ1sx8mG4hSALSOnV
	mb6oDz3ONcwV6v/w3hc86WasvS5XJTDQiaUGbSPczPedg61+n2Q6wUBaU64bhk/a1j27nnSN8KYpT
	APiUOixKU6dQLGWVrxY1vC+2ys5e7oipWXGyjAjvcLTsWA3VSJP42WopTnZyfUHU/5IKeXEzVc8ix
	J0Fi2sMjRrPlQYSE6VpPy5zs5PEyQWTlUOeadkvluGZUCy2OHCy+eTzLyYViv85yKpanSUyLvAT/7
	l4jzj0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvmW-00000002qdU-0MEQ;
	Fri, 02 May 2025 19:10:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvdf-00000002p5Q-20Ne;
	Fri, 02 May 2025 19:01:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2296443EE;
	Fri,  2 May 2025 19:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA19C4CEED;
	Fri,  2 May 2025 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746212492;
	bh=OArrhviC9XaQ7OlcTfKqQMGsnz4armduOY/WBMGcbsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jB1YOX/WblarlM1ru+chkUcRI7n9ViNaZEATHHCcZU9HKHkXtQaiFa1ADnnNSHEfn
	 pxV/EexqPW/iO2BUs8r2oHGwy/9Wh+oNp1A5atSmV+xAncgPjqT8RJGnFSSHtmQkzE
	 UPmqFqbQ6KKii/W31CNxWg7FeU4snGvlYrWtTP21uUUHLpcqwPtQxofl5x4yxEQWCa
	 HwLSZcaV963TrPrvt3cOAxbzFvO38HxPRoaEke92VS2avjAcALnb+UJqHMA74Tz/D8
	 JUZIkKnmwrX/2Jemco5btqwU2P3ADx4coHH+136JT/FvbSfjWd+ts9cd4ecXPSUgg3
	 HONZP1ma8mZfQ==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Kai Huang <kai.huang@intel.com>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH RFC 4/4] stackleak: Support Clang stack depth tracking
Date: Fri,  2 May 2025 12:01:27 -0700
Message-Id: <20250502190129.246328-4-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502185834.work.560-kees@kernel.org>
References: <20250502185834.work.560-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4716; i=kees@kernel.org; h=from:subject; bh=OArrhviC9XaQ7OlcTfKqQMGsnz4armduOY/WBMGcbsA=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmiYm0eHYd/KD+/YrfhHLPdHAslHi9Fd//IiqqD/4I25 j38J1nZUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMBGBJYwMGxO93eMPrlt+5Jzt Oot7p+4nLPDlKnhnYFtxdhXvk+VS/Ax/Bd/vvaSguOh3WEFqRfyd1+x1/pxfFHj2REh++SY+fVI 9DwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_120135_556740_167C2873 
X-CRM114-Status: GOOD (  16.36  )
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

Wire up stackleak to Clang's proposed[1] stack depth tracking callback
option. While __noinstr already contained __no_sanitize_coverage, it was
still needed for __init and __head section markings. This is needed to
make sure the callback is not executed in unsupported contexts.

Link: https://github.com/llvm/llvm-project/pull/138323 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: <x86@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Kai Huang <kai.huang@intel.com>
Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <kasan-dev@googlegroups.com>
Cc: <linux-hardening@vger.kernel.org>
Cc: <linux-security-module@vger.kernel.org>
---
 arch/x86/include/asm/init.h |  2 +-
 include/linux/init.h        |  4 +++-
 scripts/Makefile.ubsan      | 12 ++++++++++++
 security/Kconfig.hardening  |  5 ++++-
 4 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
index 8b1b1abcef15..6bfdaeddbae8 100644
--- a/arch/x86/include/asm/init.h
+++ b/arch/x86/include/asm/init.h
@@ -5,7 +5,7 @@
 #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 170000
 #define __head	__section(".head.text") __no_sanitize_undefined __no_stack_protector
 #else
-#define __head	__section(".head.text") __no_sanitize_undefined
+#define __head	__section(".head.text") __no_sanitize_undefined __no_sanitize_coverage
 #endif
 
 struct x86_mapping_info {
diff --git a/include/linux/init.h b/include/linux/init.h
index ee1309473bc6..c65a050d52a7 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -49,7 +49,9 @@
 
 /* These are for everybody (although not all archs will actually
    discard it in modules) */
-#define __init		__section(".init.text") __cold  __latent_entropy __noinitretpoline
+#define __init		__section(".init.text") __cold __latent_entropy	\
+						__noinitretpoline	\
+						__no_sanitize_coverage
 #define __initdata	__section(".init.data")
 #define __initconst	__section(".init.rodata")
 #define __exitdata	__section(".exit.data")
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 9e35198edbf0..cfb3ecde07dd 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -22,3 +22,15 @@ ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
 	-fsanitize=implicit-unsigned-integer-truncation		\
 	-fsanitize-ignorelist=$(srctree)/scripts/integer-wrap-ignore.scl
 export CFLAGS_UBSAN_INTEGER_WRAP := $(ubsan-integer-wrap-cflags-y)
+
+ifdef CONFIG_CC_IS_CLANG
+stackleak-cflags-$(CONFIG_STACKLEAK)	+=	\
+	-fsanitize-coverage=stack-depth		\
+	-fsanitize-coverage-stack-depth-callback-min=$(CONFIG_STACKLEAK_TRACK_MIN_SIZE)
+export STACKLEAK_CFLAGS := $(stackleak-cflags-y)
+ifdef CONFIG_STACKLEAK
+    DISABLE_STACKLEAK		:= -fno-sanitize-coverage=stack-depth
+endif
+export DISABLE_STACKLEAK
+KBUILD_CFLAGS += $(STACKLEAK_CFLAGS)
+endif
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index edcc489a6805..e86b61e44b33 100644
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
-- 
2.34.1



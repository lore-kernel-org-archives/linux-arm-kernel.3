Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF07CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5E7Pe1wIdIGjatROlPGkY2Ofj85UacPtXXDcZ8mEbzM=; b=LHOxHqDRJ+1EZ8Kju1DLrFC5uB
	BB891hwjx2jQOP7VxFvf18WO/qs+sxxJwSUYZ7n5bKRrWDs06rJmdCHKQLOE5KmCJlTNSdAuog/NL
	2A9DJl4mhJWmCL94E5TRIh5Re3BcD1AwEzkw4YRYv4pU/VjsNNTy8VzpsduI8Eo7Qj/c2o58a03/l
	mRoKic7iuco3yXcIZIyEujKJhL3nQyiZUeNPAlss32zlJj9pFduY0m7rv5xuQKdYDK94gX1LOyUhO
	YhKwnIu2idHE6HdMbLVkRT2Pm1N+hdJ7NDT6RBeLWt0nI8msGcWumCVDqWfiz5wBV3ynuhavF6TCy
	guT1cgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu14F-00000008nwK-0pvS;
	Thu, 04 Sep 2025 03:55:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0w5-00000008lPH-3qwK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 03:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EFC24379D;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625BAC4CEF6;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=d3lOLi68KOsHVuJ/f3j08zMj0QWctUjZ54+wY+NXD08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WgQf/PimBcqXFchHFFEXbGkt8CPsVDbpv3hGvURMfReygav6u5xf86AMUd5DROUP6
	 fNC3wlARQSAoXfliV/h+AXt/o27Ivu9RfomLqUxm0+VdkuU5Nzk11H6HAohoCpzy6+
	 rbIMn0HY71k68cSQtrjQFhE2gFUFMtMOqoB+wbFR4PEGbhPCzXNb7Z70z/EY6zc5Ax
	 /lamD6uEhHQoHb3eW9UsQ4Tfw8JaEvOKTNv+0rhHdZhj0LEt1u8h9DgOrUth8TLAEN
	 /g+wNzxYIDGe18HCyIQNPgM4YFUvb06pMfW7n/JpltZ4z4x7wDWtoBIKF/UcW/DEPt
	 1iJYogmhAdLDQ==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	llvm@lists.linux.dev,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 1/9] compiler_types.h: Move __nocfi out of compiler-specific header
Date: Wed,  3 Sep 2025 20:46:40 -0700
Message-Id: <20250904034656.3670313-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=kees@kernel.org; h=from:subject; bh=d3lOLi68KOsHVuJ/f3j08zMj0QWctUjZ54+wY+NXD08=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYtuJi1qLixhqb860yLcbsEPyaa/uQe18+7JeZj9F RMXrm7sKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmMiSCIb/MfMWcC1u7nPcvDS9 tlDJtsX0xvJV3CKsf/eJimm8OfoxjZHhZYDFc4NVL3fzS9216vF/erDP5f6VnveKx15OPcOeoMn ADgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_204657_999363_A6DDC528 
X-CRM114-Status: GOOD (  13.76  )
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

Prepare for GCC KCFI support and move the __nocfi attribute from
compiler-clang.h to compiler_types.h. This was already gated by
CONFIG_CFI_CLANG, so this remains safe for non-KCFI GCC builds.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Marco Elver <elver@google.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Ramon de C Valle <rcvalle@google.com>
Cc: <llvm@lists.linux.dev>
---
 include/linux/compiler-clang.h | 5 -----
 include/linux/compiler_types.h | 4 +++-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index fa4ffe037bc7..7a4568e421dc 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -96,11 +96,6 @@
 # define __noscs	__attribute__((__no_sanitize__("shadow-call-stack")))
 #endif
 
-#if __has_feature(kcfi)
-/* Disable CFI checking inside a function. */
-#define __nocfi		__attribute__((__no_sanitize__("kcfi")))
-#endif
-
 /*
  * Turn individual warnings and errors on and off locally, depending
  * on version.
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 16755431fc11..a910f9fa5341 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -432,7 +432,9 @@ struct ftrace_likely_data {
 # define __noscs
 #endif
 
-#ifndef __nocfi
+#if defined(CONFIG_CFI_CLANG)
+# define __nocfi		__attribute__((__no_sanitize__("kcfi")))
+#else
 # define __nocfi
 #endif
 
-- 
2.34.1



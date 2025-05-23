Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D4EC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 05:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTTuFDULLlXHo29rEb16kTtXhwZm7ZhsK1So1LQJfmQ=; b=UYu+oUOeZyBqmaZtkWGl3h3PBV
	amcUVhoB4eaT6hvrTiseIfEB2vzUvj2BPwCDmHBx6LQebwr9rW8fvmCeO0UClUcqHAg6HLXN6rJfD
	XinWFHFACvdALV8CbKUTFfMMtqLbqDy98X4XcI8SrbE2Acmt8EWC9bzHBhH8QdIKfwpjAVDVxKGJy
	dhFz5jpUxbJ3plyE3ymypgmjeIHhGyNs+f2mjOH3rNyM13590+fVZzYeM+8d16Xeu7wwphtcS1GlV
	fLzwDhU8oCqF59wsSRX8dP10UP5PCmWI9PBzB59T2LhZ+3gsG+v6krykFfaUtRTcv8qjvChqoyX6D
	7uXC02mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKVt-00000002xVh-3mgP;
	Fri, 23 May 2025 05:00:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKC5-00000002tzF-39PY;
	Fri, 23 May 2025 04:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FB234A968;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D20C4CEF6;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975181;
	bh=Jd/sB6oZ8iltvnfrQDqGbUKjd0Ro3QNhdkLI+vDUogY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uE7AaIXpwC5UwsMRJ69CQY6UitGX9wnySf5tVkqGdVEf3R8NkbsWcogYuMzwCIPjU
	 PKOIlhjPY7eZqWnbn23WMH4eVsoeXc2gpbWtUYAl5lScvcTQhwCu+WHQ/weTwqFkY1
	 MKtNJT1gy9Ua87vncd628DzNyGV+pLo4o1GRdtLgYU4s0pK+yl1CFQL8tjutl60QfX
	 UIedCQqD0fEMZOR1fqZKF/lfM5q1EcIFwL7VMYlAEDzsOkmVJtO4+AOBJmSkAdh3q9
	 IX5DyMtDuEsfAVFqKg+pGrxwAZJxoDombtDDeetPTNkmjyHD7gtG+v5lDEGWWpUAoR
	 uheAXE53E4XBw==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
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
Subject: [PATCH v2 09/14] mips: Handle KCOV __init vs inline mismatches
Date: Thu, 22 May 2025 21:39:19 -0700
Message-Id: <20250523043935.2009972-9-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523043251.it.550-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=kees@kernel.org; h=from:subject; bh=Jd/sB6oZ8iltvnfrQDqGbUKjd0Ro3QNhdkLI+vDUogY=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v3/Zi0kce6axcl3IlGXXv7dekvhyRPSBTort1tP1K SyVtX0ZHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABOZysfIsPL2U8Z//9ZLv1JP aV33p2xj+sPc5oXl284XsjnqZc1ZtpPhf9Cv8pC7KxeE36nZ/nr2m3tGE9NjZ03f/PFc35H9N+K yTLkB
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_213941_912838_A1134BF0 
X-CRM114-Status: GOOD (  10.91  )
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

When KCOV is enabled all functions get instrumented, unless
the __no_sanitize_coverage attribute is used. To prepare for
__no_sanitize_coverage being applied to __init functions, we have to
handle differences in how GCC's inline optimizations get resolved. For
mips this requires forcing a function to be inline with __always_inline.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: <linux-mips@vger.kernel.org>
---
 arch/mips/include/asm/time.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.h
index e855a3611d92..044cff0e0764 100644
--- a/arch/mips/include/asm/time.h
+++ b/arch/mips/include/asm/time.h
@@ -55,7 +55,7 @@ static inline int mips_clockevent_init(void)
  */
 extern int init_r4k_clocksource(void);
 
-static inline int init_mips_clocksource(void)
+static __always_inline int init_mips_clocksource(void)
 {
 #ifdef CONFIG_CSRC_R4K
 	return init_r4k_clocksource();
-- 
2.34.1



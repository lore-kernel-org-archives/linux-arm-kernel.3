Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8720ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 04:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0Z/pTdbdovWbyHvSHReuxVD1HiyGRrZamOwAdV82+M=; b=Chw4JyIOWKaPWHlb6J2uDvDoQL
	mlVTmt7XZNaTeAycRKo63mAmPJquTyGun3/tHqcqqiKuJh3ZeDDUDp74eU8YkQkev5ddNu6ZaEMNj
	3Qfpiava0dJpX7GWUw9czR9eJkXeI4YRmvX18seMzpMPKN4asDRUy421/Pw0apQRyy/PzLpnjDvlT
	+xm18qBKFX5+UvT3PziCY7Gm0PAAKPNLbC35n4PKgEgHxFXdBsqrWDPJysyiX7l55itP64cWxAjOU
	r8oFpOuWMYkxLkVnH7RJLxrNmwPt0OQXXsLpamjq+kibuRHuudGmKhBbnQIdo37Sn9btqUWy7AUWK
	sYN8tBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJTb-00000001VlQ-1YXM;
	Fri, 22 Aug 2025 04:34:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCdi-00000000ds0-24hL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0F88A586B6;
	Thu, 21 Aug 2025 21:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCDAC113D0;
	Thu, 21 Aug 2025 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810965;
	bh=k8t2LMzkHbTix/DiHIeNz0Pk9z8ZvuqlTYVV5CKGLxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GD3v7WtlG5xYR/Z3EK1MnOl2iyyRM1rMSx2wm9Ua0PX2kRPwtG8LJifnqf+9Hwd7B
	 32ZCrQsemML2UayOB6DeS4YK8pe0XyMb89Te++sSe6Vog6m9tZjGoLxKAqo0E2CJFk
	 xYVKu7iBHzizPxx8io2A2sYbqBUjuVQiLm0izajDr7WaMPF2dS9VsvxxuggrICGoJj
	 bn8bX4seFrjEXTtlxAMNjOpOzDxq6OdxNQH+KI3j8C5uO6k/cVq6JOgi5iQer/XSrP
	 F2RRD6H1JQxwgBTl4R+pJI5IMnIbqOAsg0SQeUzDAt9cVnUDsdoJXxcIIvQtiyWbRE
	 n5dcfhppWLwzw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 14:15:41 -0700
Subject: [PATCH v2 04/12] arm64: Remove tautological LLVM Kconfig
 conditions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-bump-min-llvm-ver-15-v2-4-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412; i=nathan@kernel.org;
 h=from:subject:message-id; bh=k8t2LMzkHbTix/DiHIeNz0Pk9z8ZvuqlTYVV5CKGLxo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLe5rCEk5cW9wg6jDh4UvntsNHek/MaTbebxi/2m+5X
 3ltuUFoRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIE3dGhssZXDFm/YrseQVT
 Lpeqvv+hva78ke18lYRjTYU7ZaeWfWT4HxA96azS8XR/v3krUs34Wr7f+vrZO/2EVLPfhzU9dfY
 q/AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_141606_608030_F328A505 
X-CRM114-Status: GOOD (  11.89  )
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

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 15.0.0, two sets of always true conditions can be
safely removed in the arm64 Kconfig file.

Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a6..41c05562e9af 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1492,8 +1492,6 @@ choice
 
 config CPU_BIG_ENDIAN
 	bool "Build big-endian kernel"
-	# https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c2ba5308da1161c
-	depends on AS_IS_GNU || AS_VERSION >= 150000
 	help
 	  Say Y if you plan on running a kernel with a big-endian userspace.
 
@@ -2363,8 +2361,7 @@ config STACKPROTECTOR_PER_TASK
 
 config UNWIND_PATCH_PAC_INTO_SCS
 	bool "Enable shadow call stack dynamically using code patching"
-	# needs Clang with https://github.com/llvm/llvm-project/commit/de07cde67b5d205d58690be012106022aea6d2b3 incorporated
-	depends on CC_IS_CLANG && CLANG_VERSION >= 150000
+	depends on CC_IS_CLANG
 	depends on ARM64_PTR_AUTH_KERNEL && CC_HAS_BRANCH_PROT_PAC_RET
 	depends on SHADOW_CALL_STACK
 	select UNWIND_TABLES

-- 
2.50.1



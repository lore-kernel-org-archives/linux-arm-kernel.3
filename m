Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2171ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQ71g1vwloP0PYNAuZxpibyBfjpqEtWPRsvbgenPQmI=; b=jfGN+Sraq/swDEk0PlSnN4a740
	39eIwrKU91YwJcBsSvacLxAl4sevTeE3pB8kniEh5J0+UoMmGZnMPaAv6CdnrIzjNuXiE6vsji5MZ
	ST8PWuofJMCAsKHup/ndrmQpjCw436sKK5vx1AJxCF8gk7seWWJ7vrsQkifFFxwHZGMIZmJ5KILI9
	xcjdo+4w/zq4qf0aYZ8Op33CHdaBX5ydDv8VP/E2SgXZAHtDXd24U0SGmYfKuM/kBaZlizbjweC9g
	U52/2IqwqAFyfsTenOrr2V605ZRWcSKttjr4SwmBm+LdcLNha5nG6/NFs0gqeO+ZuP7uEsCAVB3bs
	GCuEgvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo62o-00000008a7A-0NAU;
	Mon, 18 Aug 2025 20:01:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo53O-00000008QhT-11JV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 023A544498;
	Mon, 18 Aug 2025 18:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F04EC116C6;
	Mon, 18 Aug 2025 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543477;
	bh=nJ35DlX2T53iUJ+subiqQJTdhVfvpvfP4TLzJ6JO4ao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ASunkgBL6b+ELW9k7q04RxRGKg3pAgxjh912ojXZgFYBNGtzTThQfljhg3ygVZv/K
	 wrha6otvNER9Oa01RTLYsynZDErbD7Dc7iGo+RlfzDnAXHwXBdts+UlB9rMwCTZoxd
	 HGyV+9BKt6plZWvO4V/YUBsDKgRp/W04hb+5i15ucE/Sdy/5QeeL2KgCnjHFDSAX9V
	 AAnsU9U3akAsIj/0kR90XEiToANu9Anzd+SvyTE7x14YJIPkwJeBbpEisfcWZMfvD/
	 eIA6MTrA1up6eD3LEM/3a6aXTqiiIVscuZZwozmiyNyBq8iuL0i8k4y7QvWSP5ija2
	 GfQhvKjzk28tg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 Aug 2025 11:57:20 -0700
Subject: [PATCH 04/10] arm64: Remove tautological LLVM Kconfig conditions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-bump-min-llvm-ver-15-v1-4-c8b1d0f955e0@kernel.org>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445; i=nathan@kernel.org;
 h=from:subject:message-id; bh=nJ35DlX2T53iUJ+subiqQJTdhVfvpvfP4TLzJ6JO4ao=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmLyxe6ysnU1s56xM/RNinw2qwitQrbe8YqwdL8pakrV
 oa4vc/sKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABN5EM3I0KAn5qeuXRWgzLLz
 t/7azPMMvOtl9j2ICfgbfMBHmyv6KSPDz1RFu4rli7qyL5z8U+417cq8n4VteZeLBI4t80x+25/
 NBAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115758_308534_9028DAF7 
X-CRM114-Status: GOOD (  12.60  )
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

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
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



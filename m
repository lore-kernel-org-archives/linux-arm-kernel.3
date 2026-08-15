Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ADFC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEo+RWxb9Cy4x3mJlC/JTMk3aY2wjCClrY8gzFpWMUM=; b=lFkvJ7oA0/pZGWETSmgGE1n62p
	ILoAKo3ENfb5olPnEyr2p26QSYvX2njpFmQ0IlUIAswvfIdO5/2XxkPwNEQ5qDwW0wwTnKsDxoJhi
	GeVC9h40gLO8LcGUPdjv6cB+UNumHuOX2zTtpOB0ZP6WE2YhLCwXzcS2rtZh7XrIymQcP1uME1ntF
	lUl9ogKcEV5dCwQSDL7icqB8J6b8oRlAjSpD6XZcP6gVUh9uhmrboeMyAc6U2sesMxrTEDem9inqQ
	NVsC7OfDTJx0S4Nc3K6HY7SCfnCmzwVih4y2za2D5pQrYpEtmGr5mobnFZhRbagzO74lpYtcvZ5wL
	1RjQq66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HZ-00000003VBJ-0NCY;
	Sat, 15 Aug 2026 04:46:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HI-00000003V14-2Box
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F115860DB5;
	Sat, 15 Aug 2026 04:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EE81F00A3D;
	Sat, 15 Aug 2026 04:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769151;
	bh=pEo+RWxb9Cy4x3mJlC/JTMk3aY2wjCClrY8gzFpWMUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Uds8CyUoF1Yopnalrb3vrGSp1Q4mPilcRNod/8Z5E79NsAJUV7kN6E8KsQiRZiThv
	 txwf0uf0ZhoRGhI+VbfmdzCqZ2te2ok20qQCpr//+LgJRGrSxmYigTtUp4NUlo9+cK
	 0b21ZzCEfVeRIqBfhkGXXsM6tsR0kUSCfnvC32Kbk6XZmKm5rwjqXUvBe39Gn31Mlm
	 /jN/eykVUsiIJl+rUOCu26NFUJKI8d/OWsZjGbs0LXHuj+YEt4kZTY4gMNgpEjjW9k
	 v4O0wdtksJhj4d4YMMwnXZmM/Io4n48I79x/7xM9kMV8ecYQGd79l+UWbEFRfy55GZ
	 IbSApACY/8QWQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-toolchains@vger.kernel.org
Subject: [PATCH 12/12] arm64/bti: Enable kernel BTI for GCC
Date: Fri, 14 Aug 2026 21:45:29 -0700
Message-ID: <c08ef46772d364db9b904fac0861adbb3a3bd4e2.1786768375.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
MIME-Version: 1.0
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

Commit c0a454b9044f ("arm64/bti: Disable in kernel BTI when cross
section thunks are broken") disabled in-kernel BTI for GCC because it
omits a function's BTI landing pad when it determines that a function
can only ever reached by a direct branch.  The observed failure was a
module whose init text landed far enough from its core text to need a
PLT, whose "br x16" then hit a function with no "bti c".

Note that behavior isn't GCC-specific: Clang 21 has started ommitting
landing pads as well.

Now that all the known BTI bugs have been sorted out, re-enable it for
GCC.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 2687b71438661..e150807b03016 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2114,8 +2114,6 @@ config ARM64_BTI_KERNEL
 	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
 	depends on !CC_IS_GCC || GCC_VERSION >= 100100
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
-	depends on !CC_IS_GCC
 	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
 	help
 	  Build the kernel with Branch Target Identification annotations
-- 
2.55.0



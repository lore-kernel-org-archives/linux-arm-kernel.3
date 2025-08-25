Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153A2CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cLSLchJUsVvpb6sBZV+qR+kQZI0wciojaAdDb7zGm0=; b=a8J9bX/BTJszg8gHbYpByFpheH
	w/dtEYHoR/3a/Gx0po2zldWebWYm3bgEujvBvjsal8OtkopbpoNSnwoJtofdPB0wxtmFkK9XbNG3u
	DPDXtSNX+Ig+o53qOfrmHTDB+JR6eKJX8RDEoSa0dL17ZDU/M6lxzqeEEsf+cQohQAoSB1UvRTsq1
	6pY5LZw5rmxGUVCh7olsbC6v91G5iP2JojYgTikTPEBjRotuTouCi5xgu9gdWJAY5r4PTCKfkic2a
	RJtFWS48vdIT6dH5UcUTNE9L+yI2t2IIW4EQLTaR0oaooC/vuMcKacQjdsGsERJ26To6a24GnGq6O
	q+nAX++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ3z-00000008VH8-44So;
	Mon, 25 Aug 2025 15:24:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY96-00000008FOW-1ehF;
	Mon, 25 Aug 2025 14:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9C024498D;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B565C113D0;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=IfkCd4rfs8BX5W2yJlQjYBmDWGwc+WqMINKq0hNU9co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U3Amj5rSMmJyWVnF3T/eoAK/Nms1l3PXpUH86iGRHYo3YSFwmHaeB/aVkYA/uPeV1
	 1e7Tpig/n6h1ywnL+8FJks9HTlc4uMgWG6JvKkC8OR1SkiN3YVEMElL6/qY06ReHhs
	 OoEXCtt+SmQL07/18kl6FgH6PRpd+dF30bJjJyuluLB4XzkVZiFdeQW+0nDYhgZGCX
	 CLpbyr8FT5OAL6iJCqVseitwpMbApOxxWmsFqVGi1K74cHtJM7P5cZhSZAJCemF8ZT
	 4fkkyfoZ3AoWS0dyFOgIGFrQ1q1fRvGgsc3cLD+aFz1u1df4w6+dI8NSeMi05cZ3Fo
	 EUZWCroZF/vQg==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 1/5] compiler_types.h: Move __nocfi out of compiler-specific header
Date: Mon, 25 Aug 2025 07:25:48 -0700
Message-Id: <20250825142603.1907143-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
References: <20250825141316.work.967-kees@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072604_450120_48D91308 
X-CRM114-Status: GOOD (  11.94  )
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

From: Kees Cook <kees@outflux.net>

Prepare for GCC KCFI support and move the __nocfi attribute from
compiler-clang.h to compiler_types.h. This was already effectively gated
by CONFIG_CFI_CLANG, so this remains safe for non-KCFI GCC builds.

Signed-off-by: Kees Cook <kees@outflux.net>
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



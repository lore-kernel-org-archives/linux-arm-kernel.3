Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9816EC5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3RAP4/V/S2Ka1HZIeZ+MI/MmRFw0KCRbzs9mdx3m/8=; b=f0WreRgq6z01gC0rXXBs95D//O
	fW6ghxRav4vHIoOQ1qJ5c/P0d/JzeiuWsl+M6UlLIJcKkgyzCOtf5JrHJWb3ggvrvojzxUQorz7Yf
	1reK3d2ml/E6yAxAEELp/JVXhf3qDpl+Itpqpzj8WuEYwKT12sgoyvNCmsQtwHqyUHY8h4DtwFZY0
	XFYkwnoSbq3Y8n+k8TseBco/buy1qP+P/GBMWtYvqrPYnW2wYU+SXeXGEo0P8lIRoVOijb7McLIQs
	m4YzXtzX/IruY/hEubF2ne128r/k7md7veKzrVXNfKeWjFZJq1zdp6xTQtzb3JNoe6v+BujepjAkD
	P+9mRUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HW-00000003V85-2KGV;
	Sat, 15 Aug 2026 04:46:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HH-00000003V0I-3UMt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43F5460A7B;
	Sat, 15 Aug 2026 04:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A381F00A3A;
	Sat, 15 Aug 2026 04:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769151;
	bh=y3RAP4/V/S2Ka1HZIeZ+MI/MmRFw0KCRbzs9mdx3m/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yh2lWpvnhz/fqU5jrXmd7zdXBwN04vdE8Z/rdgzWLKG0vWbPRSF34Y4UJkIZSwTOs
	 S4CkWWnCpBwkjvzo5FcwdusCciF7mOItmOGAPwvIuWuELsPaQOJ8gcLAnu460XMtlo
	 QO2PATvBByJLhdu2UjJ1jhXdjUsQi9BzR61XVcp/Y0VZgDpOkm80/sHY4DCroSkdzW
	 MtvS3EAex7G0Oqsiug7sSJekBehikkGIdr0L2ZpJe0ss1IlPNA70ziImVNr3QlEnYx
	 P7rBvcsr3r2B2TWM/tPLvFq1yVFWnUyh8HFFnVf4g/SCwrGzMEZIX+SXJpQm0bFbY6
	 QmA21yYigQvIQ==
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
Subject: [PATCH 11/12] arm64/bti: Force-enable BTI linker veneers
Date: Fri, 14 Aug 2026 21:45:28 -0700
Message-ID: <edae8b52c1cba6eecd0bc75f709f6009816b80b8.1786768375.git.jpoimboe@kernel.org>
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

The linker only emits the BTI veneers if *all* input objects have
GNU_PROPERTY_AARCH64_FEATURE_1_BTI.  All the kernel's objects now
advertise it, but if some object stops doing so, BTI veneers silently
stop getting created on >128MB kernels, resulting in BTI exceptions at
runtime.

Force BTI veneers enabled with "-z force-bti" to prevent a single bad
object from ruining things.  This also emits a warning (or error with
CONFIG_WERROR) if any objects are missing the bit.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 4eee721c0b278..d0db9a6766a2f 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -25,6 +25,7 @@ endif
 
 ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
 KBUILD_AFLAGS	+= -include $(srctree)/arch/arm64/include/asm/bti-note.h
+LDFLAGS_vmlinux	+= $(call ld-option,-z force-bti)
 endif
 
 cc_has_k_constraint := $(call try-run,echo				\
-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5BBC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHPbfRN1aXc5IcowpP0Zhp7GRqsoacbyPIsxiGgDAIc=; b=ZeQD/lTQLXIOWINxa2KsZCApkE
	6Wi3fGHt6oCCFsjXCqv8AYLl60GYJBsiJU9z9I74DzaWZtR7sVtPY4kpi8kdCr1LYeKQT5akQCLJ+
	mORZoKS+fSIwt81UhWuc71ArMyNWrVs9P94netLm0IH5ZVa2mEXMvdHaRm9jHsoalu8uDbwtOpETs
	5AS/D5qurMVOjKL+ApSDl1l5rWUiYfHzmE9VBDHpX29sAMcUA2ThDvb1U9tr26oYqF+rZTcpZ8McB
	+TXazn18+yaA3+z00hgfG9v6WaDSZNO24bx2AnIaic25D1UxVkIY9V07lYETzeEApfjCg1UfZqdkM
	ncDNSUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HC-00000003UyU-1eBt;
	Sat, 15 Aug 2026 04:45:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HA-00000003Uxq-1Ty4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90DF441A07;
	Sat, 15 Aug 2026 04:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92991F00ADB;
	Sat, 15 Aug 2026 04:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769143;
	bh=AHPbfRN1aXc5IcowpP0Zhp7GRqsoacbyPIsxiGgDAIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nFtaQ7HynKD0KIr6wOyIrZJDs8M0jhsHT8P2mazfzFwD85V++d7q5LtKKRfqokKs+
	 xbpmhxxcn7yo71SfMO3QKBccLMWmZYJVsd/pBqwyS3R22O5CcBoVTPJ9jdAeHyN2ry
	 5sC8e2cQF3vmVW5BWJQw1OUxUoPEmPszo0MJxbhx0f2m3CPy1rwR9PG3ul3OK6VUsU
	 Ldd1FYqKzEKvb+SnUQ8JpjTP5y81t0YTQPc+oXNvQ2jO9/oiR8Dq0c7E+w6A04pPRK
	 S/Qp6BqPFZBOBimSe7O3FXDta/3N7GjL0hYu7PX51uqjDq1a4YqUDSrbvEwEfOoJ3n
	 X4eBHNSyKPgqw==
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
Subject: [PATCH 01/12] arm64/bti: Add BTI landing pad to __sdei_asm_handler()
Date: Fri, 14 Aug 2026 21:45:18 -0700
Message-ID: <99226432cc316215829655c787f71a70f06d1600.1786768375.git.jpoimboe@kernel.org>
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

With CONFIG_UNMAP_KERNEL_AT_EL0, __sdei_asm_entry_trampoline() indirect
jumps to __sdei_asm_handler().  Add "bti j" to prevent a Branch Target
exception.

Discovered by code inspection.

Fixes: c50d32859e70 ("arm64: Add types to indirect called assembly functions")
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843a..16c21fcb41976 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -976,6 +976,7 @@ NOKPROBE(__sdei_asm_exit_trampoline)
  * want them.
  */
 SYM_CODE_START(__sdei_asm_handler)
+	bti	j
 	stp     x2, x3, [x1, #SDEI_EVENT_INTREGS + S_PC]
 	stp     x4, x5, [x1, #SDEI_EVENT_INTREGS + 16 * 2]
 	stp     x6, x7, [x1, #SDEI_EVENT_INTREGS + 16 * 3]
-- 
2.55.0



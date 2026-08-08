Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D661C5AD56
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gV4QRBMjF8SWDxF8bR0dzMkZJ2kMlPEch7VZ8Sz4gRc=; b=ipIn1TR15pJFQ57CK89xWStq26
	FyEbKNC3bRQ2vsGV7NNPPz1yJSThfsdLyojIzGQ4oVtjlEuuWXkjWJBU+ML3xmUzHcdnsUUZncpVk
	MorXQX+slV4qJBpM3GHmuCBjFPCowhLY+pYCLEysU13IdLcZgEc7QoUkJf0dslV4CPQLoxlY8x3n6
	k2O+CzSWHv+CyV+2ChY+7avM4z9r7EagL5TEcRnGuWosbqUTjFqaOoOpjav9fBEwbLUmgHNl2SR/V
	My/qaO/JMgj0l4DMEub/VSOhzjivMfQj3KGG4/eqYE0P/zHCj8jDdOghaEo7a4xb8COCKvzDkfTAU
	bpk4cK0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJJ-00000009mC4-1ga2;
	Sat, 08 Aug 2026 23:18:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJG-00000009m9b-4BRm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70D2D60A76;
	Sat,  8 Aug 2026 23:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9873C1F000E9;
	Sat,  8 Aug 2026 23:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231114;
	bh=gV4QRBMjF8SWDxF8bR0dzMkZJ2kMlPEch7VZ8Sz4gRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nAc5hpwNrSZ1ouVZFjbyGeSZn5j2elY1TzRKCTN/lK5f96kuAgdka1mLYO7o0P2dr
	 F2Tyh6yMp3RpW5Rve6BNBxG+inmwfLWnd9pJ82afHZiyQj7H/i1vAfI6/XXy1gSQsm
	 11vErT/6U4BaAJa7kLsX/AvEOY5RtoRBS0le4NTHkeTORomKVhXwQXAiEqfO071GB0
	 SFoKcl1t/uhfJ43gvH6E1LsVI62QgvE+fTYnGE3gOOqcB4zR+SMCHuzjl6IJxENSSI
	 lBWghi+LzluP3rd2ay8Gea88ktGKTA9Qql9s7i3VJ+JT+EMCnUThtD08J7qqF2w9+m
	 owasDHEpY+vrQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 10/22] objtool: Allow setting --mnop without --mcount
Date: Sat,  8 Aug 2026 16:17:14 -0700
Message-ID: <339aa792e9eec6de991f72bb3afc6016ddeb3d79.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
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

Instead of returning an error for --mnop without --mcount, just silently
ignore it.  This will help simplify kbuild's handling of objtool args.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/builtin-check.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index 75b11dc85010e..b89c7dc7983f3 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -145,11 +145,6 @@ int cmd_parse_options(int argc, const char **argv, const char * const usage[])
 
 static bool opts_valid(void)
 {
-	if (opts.mnop && !opts.mcount) {
-		ERROR("--mnop requires --mcount");
-		return false;
-	}
-
 	if (opts.noinstr && !opts.link) {
 		ERROR("--noinstr requires --link");
 		return false;
-- 
2.54.0



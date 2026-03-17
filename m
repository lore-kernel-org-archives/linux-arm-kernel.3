Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9136EFF6E9B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0TGxelnSqXBDOM7mYStNCfP3fD2NuOIazgCtMx7pgQ=; b=xt4XhHt8y1TwuMzL2+NVyQRSXV
	+8kpnlKFEv0c6vg8GpTdZZXDtaYUsJa7ROQm2o1rsyfOe5XUrGP95wDBBW39Vug6vZRrXepBI4A/U
	JVY5aZv568c3pyAPbbFg6xfDzYPWQcot3Ov4ADvkXOtL02e7o8LktSZdnfVpcECNuKeyOyigfAZam
	doVQnVrvq1nv7tUrXVYQtxSrSmdPzgY1ddIDAswBzKGU3x8Be+Jq3bhr9/bRFFfc1cSAYnWEOe5yH
	diX42n0lNRE/0SC9MzvMWv/gbBNdf9lltHXM6dR4TdXo9ufyw3cong5BOWex2iIVKAKBKVW5DnQei
	3Ow86xnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGQ-00000007KdY-2iza;
	Tue, 17 Mar 2026 22:51:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGD-00000007KVd-0dFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C3D444531;
	Tue, 17 Mar 2026 22:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75822C4CEF7;
	Tue, 17 Mar 2026 22:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787896;
	bh=LneP7wGKv2nwzC48EGP/qa4m/tgR04JXHfdr5Hy2OTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qngo6z11Y9Ew0q/w6MzKc0RDHuzv3zv3tiXXmAii/TUFdqaHGUiE77fX5laBcACdt
	 jBK8X+ZL41ymUm5gnCm4tvn376vpm2pJcgtRELAmhSl7gdxnxq4PCRwODiMjhPJF1G
	 v+lsWta3aS0+zy/Vopw3VMh0ddnhzp6yeJ+PzrOSY+qjni4yG/YrEVvuDOtJ+dW8dy
	 r61VBS8lpeF0XSxQuuHQiqosUWnGyBNdOpzknYHAkClT4p4QeiMuTGKIU9d4FTkpsF
	 hupC261b4CXaULZAnA5st3TPR4D0WnZ9UJTCcJUVlOth7LoPZ8WTBaUyKZ0pwqTrN5
	 HyhiNADADG70A==
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
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 08/12] objtool: Ignore jumps to the end of the function for non-CFG arches
Date: Tue, 17 Mar 2026 15:51:08 -0700
Message-ID: <f33fa991df5be569476769bcd970a555745028db.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_155137_217295_D0CDABBA 
X-CRM114-Status: GOOD (  13.15  )
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

Sometimes Clang arm64 code jumps to the end of the function for UB.
No need to make that an error, arm64 doesn't reverse engineer the CFG
anyway.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d428d63b29c6..6e33a29bd3ed 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1630,10 +1630,12 @@ static int add_jump_destinations(struct objtool_file *file)
 			/*
 			 * GCOV/KCOV dead code can jump to the end of
 			 * the function/section.
+			 *
+			 * Clang on arm64 also does this sometimes for
+			 * undefined behavior.
 			 */
-			if (file->ignore_unreachables && func &&
-			    dest_sec == insn->sec &&
-			    dest_off == func->offset + func->len)
+			if ((file->ignore_unreachables || (!opts.stackval && !opts.orc)) &&
+			    func && dest_sec == insn->sec && dest_off == func->offset + func->len)
 				continue;
 
 			ERROR_INSN(insn, "can't find jump dest instruction at %s",
-- 
2.53.0



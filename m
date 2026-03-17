Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AC2FF6E9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFUDYLdaGSQtaGCWJ0mcczUzmmf1OJA9JRC+RObCN/8=; b=LKKSgOeQXWqz2SQpop+dgRJj/D
	i+GzNm/XhqSs03GaQ62CrhA/uI2bQx8nIwCQa43jSh+WXmLhXRVxdoEcBs5idSw1MM5pE2R97JOXo
	Znc9352qaXC6JfOE6sERdWk2I4zC0XxnUqEvcACoxZmtjHedSfUbIMq4YxWjr3GgSVrHxv4T+S6A4
	CP0XXHLsTzypFw7ZDuwr8IjgJcIohJF0G0awMII74Nkmp/YdI/gU6Lsnx42UGzuyTskVV0vrrVlR4
	cfVNSr60OfaV1nuMMHsdCNMcw+w32YbprEdOqpkSvKsQXardZvEnRA7BPU7U7xS4zcIHXINADZbph
	FUBg0AHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGQ-00000007KeV-43eu;
	Tue, 17 Mar 2026 22:51:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGE-00000007KXs-22Tw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E427160053;
	Tue, 17 Mar 2026 22:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16372C2BC9E;
	Tue, 17 Mar 2026 22:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787897;
	bh=R5UiZpTiDDGQeFvx+x5fyQyw1CckBBaOg4b13Rc2GFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O05cfDTOoUN0o/a5xAMBqeA6JBv53owzUYaz7WqDnkXpa361njl5XUGAkFaMMp3u+
	 9uteSon8YEXqmi+jXEe1qpNPaCBqv4N/2HWOLQAP1ZR5U9HilJnpk5b9lQ8QQS3qP/
	 AchOaEvUekQtgTWU2jBME/yHKvRBqBZXm3g53CQc/XrVVXNtflKnNHmV0OgBHYTRu4
	 M6WvQGBAlW8nS2eVCAG1S3aDOLmpnJvxUofX1XOWQdqs3mxsyhHEZNZJq0Zq/4uvNs
	 7O2cyuQ2IV5vDquka3y+dNWifbssa+Kb/l7nm05PpS9XT5ALSB0X6RcXdggHJgc9cA
	 UFb656RNfSzPw==
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
Subject: [PATCH v2 09/12] objtool: Allow empty alternatives
Date: Tue, 17 Mar 2026 15:51:09 -0700
Message-ID: <1d74ee9e31727870266ffb69ce0d6a4a40b8e99a.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
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

arm64 can have empty alternatives, which are effectively no-ops.  Ignore
them.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 6e33a29bd3ed..7297fb87f876 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1994,10 +1994,8 @@ static int add_special_section_alts(struct objtool_file *file)
 		}
 
 		if (special_alt->group) {
-			if (!special_alt->orig_len) {
-				ERROR_INSN(orig_insn, "empty alternative entry");
+			if (!special_alt->orig_len)
 				continue;
-			}
 
 			if (handle_group_alt(file, special_alt, orig_insn, &new_insn))
 				return -1;
-- 
2.53.0



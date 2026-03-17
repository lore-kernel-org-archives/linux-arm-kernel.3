Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DFDFF6E9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0obxidBdUVcQz6IKab2e8RT0gz1q6/HtsB2D0L3TJc=; b=KrnO1VYpxI2d/oQEOBK/qg0qHQ
	saL3QA806o3MKsNCioRP+oVyWqwDqmVM/cCEQPZrhQi104uGtFX83klXa5MWv4CICHZ1MKNaMMqjm
	CtVpxy8+vXNlX2Z/KsAXM+NsJP5HZNr8OsWYgV53XAyFTSPLPAQ+kFZ9xafK94TeL2HfNCyQ6DnzZ
	xLRflmtefW6+8stILZmFuEcjTuIsdM8P8tpu0jkuXSl9+cD0DkkxLQKYdq+MJkKLt4KQTnOFOIluR
	sMZ1Q3ZBl5/ljkIJ2yeAu/6iHJkIDLHExOLnRYSv6JYfzZAoKausjyY8LlNUC1v6lzuzlP7abSWdT
	pm04cPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGQ-00000007KcX-032v;
	Tue, 17 Mar 2026 22:51:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGC-00000007KW2-0QnY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C947244555;
	Tue, 17 Mar 2026 22:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4439BC19425;
	Tue, 17 Mar 2026 22:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787895;
	bh=ZNFy3T2ljWwS1cXqTSDWH3OzAYlfT/ejcAHXOO7W/u0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ToH5ZCrMuabFXFe6yVOv0hFFBxF8DARKOazIF/k5JIlh1jstum9XHAAHik2UqpVAQ
	 vgSTyZgSm4/fIcmhNxeIJ7ebJ4I6yjGyMYHyUscJgklBfyKeAPUHkoXck0cmY7NDSu
	 6m9QRx5f3u5UivZMKbbNqhhZCRe3SF8mM/GDwqZn75X4ShzFsZez2lkA4c+kSzBy51
	 i3FntVwRWlXSWoxxjrCCS8UL79HtgwEwtZxUHxZloxZQ6FTgwV/+e998ovaC/9YwWa
	 z51rIPdBBX+bD2c6K7uiPa89oq6YQgK1+1VKvzW9Ltn+Zi97wlsY6deF3rZ4Fg4Hg6
	 5OEPeu7M9NWOQ==
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
Subject: [PATCH v2 06/12] objtool: Allow setting --mnop without --mcount
Date: Tue, 17 Mar 2026 15:51:06 -0700
Message-ID: <84977dbdf9e0b579cd5f8efe55fb38b0cc275198.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_155136_161367_B4267441 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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
index b780df513715..f528a58aca74 100644
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
2.53.0



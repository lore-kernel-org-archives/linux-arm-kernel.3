Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A94CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWoDbkMpvnLXMsOXX2tfgUjzZ1TVKHLgwurwHvoTUu4=; b=ECaddpqcGkpITuhJTjbjoDo+M6
	IMr2Q9G2PkLTmzWPlooXZZK5pzxT3OWg1f2N92Bs6RGv6ZaLqhUH7zehN+/vYTkt/JwkGwONygozB
	Qu9q9T23Zh2IbKTihIhV8pjxFDYajtbMKRgr/iS875Zdanj951qQzzs9o3m6G0TNDLtTK04WiysY/
	qOCxLK/0bPrWRLF0ReNlB0ZCJ439uiZx5ZrScI3oNAlllaI0dG4qSeohJVEN7AQEuxGnnDuNbVld3
	yC2T75HJw9dwP38UUADXHmQ718K0yfGOyH94f1FVH19rLgwoU3805wkLP5gDxAoGAlShc3AHdXMx/
	IWTmPlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mr-000000013nL-3hf7;
	Wed, 13 May 2026 03:34:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Ml-000000013gE-2dXN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 582974447A;
	Wed, 13 May 2026 03:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0423C4AF0D;
	Wed, 13 May 2026 03:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643275;
	bh=G1VVkFA+yVRTPwxqst2UM5oq5D62mSukpDgUevX4w2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FAq1sQGuE3TpxvXSQqiv81ymQkRW5Kz8xNVroB1+dCvMNfczjd5dD8sXkZBvKCAAZ
	 XFnCSG50et9MffoTcNedo57cFHrFe8cptzo26rVRvMczk/1ibH3mcsLFjfhN+U0rFq
	 R/TZI1F5+Ecd4H48ShdE9l0ZFlSepjYAGpY8ZfwUSjLb0UYXg/mDRxhRhVdny7ibAf
	 k/Fe2GZVsoCJXV5utkA5RANCNXn4DBZLBiLYKbNd3DbxTOphnQxaI+Pue5+jpjx/BL
	 C3KITB3RcLS2BTEs9KbSuo6CvRNOokWGeySDHZfGE9fqajzXijfkcriX/YaN/7ixRs
	 gMQ1LyRfGvozQ==
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
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 08/21] objtool: Allow setting --mnop without --mcount
Date: Tue, 12 May 2026 20:33:42 -0700
Message-ID: <87e956a4b3c8081c6ce0b75c043c15babf2a7f7e.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203435_696960_F6E1010D 
X-CRM114-Status: UNSURE (   8.55  )
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
index 118c3de2f293e..bd84f5b7c9ee9 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -144,11 +144,6 @@ int cmd_parse_options(int argc, const char **argv, const char * const usage[])
 
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B7DEFCE5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFqajIHfC6os6bP7WQPMww7yxBbHtNorc4kmGBIlsH4=; b=2xq0q3b+bL8J+xT5CVUyP7xn/2
	Nzjeqptw6ZjIGUGzfoG2XgCRMzvAL/pfe2jJOhiCzt0VfE1VHK7h9fJo20g9fdeK/yNVcikGekmWB
	DEFH4gNVBCtuShYIaLBBzYxBlgvfECNlDEKaHlIA3SQPGPk4eF0gQWbnJVseSs252wjEMV1UivBUz
	nLealQZJalXl5cXAONdho8h0l/JpSv0iGhkHVqp4r2sZdv7t4VadGmXpC8QaBk0If6GIUY8X3pd/E
	wKdfOD6/610P8Ij2kvZE3PiX3Ye043scWXSof1hVkC75sVzwI7n1eWfNRSn5vTK4Dyw3nUaMNghmf
	M95OIs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRO-00000000psU-1ChQ;
	Thu, 05 Mar 2026 03:31:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRK-00000000poR-0WL6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1EA643BF0;
	Thu,  5 Mar 2026 03:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F35C2BC9E;
	Thu,  5 Mar 2026 03:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681513;
	bh=ppmEZTT0et6+FTja7lnUY1XDuKPDfDpEbcW91C3ymXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h0yu4NsHtO8DNzcJksWB0ZAN+1FdSe4gSfSPR5ulL8YBtTvWbljhqmjMuLJzmTyh5
	 cZQrn03f0xfFudcFWEDGDC3ndrzA2LIckPKZMUjpPYW4kyt7iTLOMaiA19x7/1WaHk
	 xygjvmxlgVfbq5DKVJcLvM1Z5byXzbrR/EAb5Jo2UZ/Gp0t0tA94rh1cwuU6ITjhiE
	 FG19ExNYAmUgnGwaF/259f9nizSKnULJSElgKQt9IsPmjkdcuS7j6cDLNb+E9vCWwc
	 vsruqPRbKQiIXZizSM17qC+Shc5vD8qmoQSN2I6wRtkKKt3z0VgIZpw/2LhlOXJHpv
	 qvE4EInUL7oNQ==
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
Subject: [PATCH 08/14] objtool: Allow setting --mnop without --mcount
Date: Wed,  4 Mar 2026 19:31:27 -0800
Message-ID: <696aeb326a797e97b87c7657b5b3d0ada958cc5f.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193154_184239_EAF05E4C 
X-CRM114-Status: UNSURE (   8.38  )
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



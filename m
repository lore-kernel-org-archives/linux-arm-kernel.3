Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082B9EB7ED2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwSVMzW4vEBkddUbKEqdpVFwlAix1dpUJw6ixPzL2HE=; b=PEypE2ynuqgFKzs/OkVSSM4E7J
	yWXRPMaWyZHF2qa1VfVHqanXvyOhlTjj4CyR3t1cpzGhmNmQ5ePm++oB/EpwlUlKMbI1TAzsfr9Sz
	laTzWsv9nfV1kIcJs7OhM0v5ZroZv4GnbM6utnRNj+g0cxKP58IJMRflahnIq8/9vNKpaYswHbXnt
	ISQOxMYzpV7cMJ4KwTHrKiBNPZ8n3Pd6FRPQr0vBxGiXkidxURDAL87r4DDcd8aGlkqipG5pM/DJ0
	4DUoCKpe5nmA3wG6WJXhPgVdzvbVWM9ZpAAGwIAoqSdZfNZToQnHOLwbvnHYzpxijV/aZWxJlVw5l
	PImuOdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRF-00000000pmA-2ynk;
	Thu, 05 Mar 2026 03:31:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRC-00000000pka-2Yy1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56704404A9;
	Thu,  5 Mar 2026 03:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A26C2BC9E;
	Thu,  5 Mar 2026 03:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681506;
	bh=uw8loNTdetJKJb0ecjjs3Ff+STe7ASk8f759M6OLnzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bG6B1eBayupZYr06CVbq6jITb5ZWNrMTkugVPMLEV56qbUM/nzPPBUKnVBwneACmN
	 sJsv9K8425eeguY7bLhGYQq7MNpbnfFYMGVs86/pvokhgK3v2xo16VRGq2rBg2YvfQ
	 7W5/8MFGo9qXmyxBQfqVdSzEvJ/VFSvDLU5MMZKJsV7+sLgQ19hql7ZYX0Bc95mxgj
	 iIv7trv1roF1PTRKIOkb7jpcICna2KJd55vzsNjOuHQlqxrPZnzdNE6IbBYrqgOWHG
	 3LppCxN2krnh+IixH2pX66qufhL1YhpYDXImJw5UX6INk1XJYxbtUlEbNhW89iZtQQ
	 NeoOOrNFBP/Iw==
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
Subject: [PATCH 02/14] objtool: Fix ERROR_INSN() error message
Date: Wed,  4 Mar 2026 19:31:21 -0800
Message-ID: <c4fe793bb3d23fac2c636b2511059af1158410e2.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193146_670189_55947F93 
X-CRM114-Status: GOOD (  10.27  )
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

Confusingly, ERROR_INSN() shows "warning:" instead of "error:".  Fix that.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/include/objtool/warn.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index 2b27b54096b8..fa8b7d292e83 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -107,7 +107,7 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 #define ERROR_ELF(format, ...) __WARN_ELF(ERROR_STR, format, ##__VA_ARGS__)
 #define ERROR_GLIBC(format, ...) __WARN_GLIBC(ERROR_STR, format, ##__VA_ARGS__)
 #define ERROR_FUNC(sec, offset, format, ...) __WARN_FUNC(ERROR_STR, sec, offset, format, ##__VA_ARGS__)
-#define ERROR_INSN(insn, format, ...) WARN_FUNC(insn->sec, insn->offset, format, ##__VA_ARGS__)
+#define ERROR_INSN(insn, format, ...) ERROR_FUNC(insn->sec, insn->offset, format, ##__VA_ARGS__)
 
 extern bool debug;
 extern int indent;
-- 
2.53.0



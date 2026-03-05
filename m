Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F48EFCE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rHFO8CtRZKDQL4xCEE4Xwd7zfE9VNa09g9Dp2Sjhfc=; b=RMDd3uk/VjAzAZkJBv/+9UuR5l
	RNLRQnFhuS2krUrg+jYPSE8XM1ThvRvprd1TyRhls/O1JdU88AncJFI7GQuI+c2GWGH/Vu9L+xllu
	2q9+8kWeCnGcpNXDIa7X+Bzd/PdDbvhSstaEzeno91jdGqqJfuc/VoozbTH9ptkSBcl6yKTxy+8/l
	1pRYgPS5glQ//DtPZ3iEunoVW2K8/y+npvcwgXhOymkWKxODmnrNO2qxY0Y0jAtZwqkah/efOwj8k
	qZz/qUaS5L2owzL5YyS1z3Jq9hfPlzJdNDGaPW9jufWiXqs7aFLhbE/CnRF4kjxP9sZcEK6D1g8/7
	QuH3Nzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRR-00000000pvW-2GLt;
	Thu, 05 Mar 2026 03:32:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRM-00000000pqS-3Sny
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85D5844741;
	Thu,  5 Mar 2026 03:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AF2C2BCB1;
	Thu,  5 Mar 2026 03:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681516;
	bh=NbzuW+7uujyEcZZ30AyHwoJE50Su+M8O/JLaUCgVuZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KbeqmIyqV/ay83Ax51Gnb91by92icM4HeckvCSg7fd5//tXpXxY1HC8pfFb+VxIgB
	 mKpJtzzZEyUsZEntGsvM+LiTA2/dwgGVbrkRKx20sQLXEtlIKwl/VZb5HAtA8XXCaY
	 LIL8NZcbFooJ+11aFaXszGpQQlJWbhVKOeHbhqT2woGkqFe3yl4RoQE15CLNDY84xa
	 sbNZO7VDXSRfKMPQH3u/5bciI/yV1YbWoFs0Im2Dvkkd97yq3vbyl9gb4OkTMr52DY
	 QuQ7cVZ4dKMjpjTmuvqMSGrH84GkVszXcQMT8RZ3ReR0BeuaSyyEFPNtWVyFQxtt1d
	 Ja+0ZRFwtqerA==
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
Subject: [PATCH 10/14] objtool: Ignore jumps to the end of the function for non-CFG arches
Date: Wed,  4 Mar 2026 19:31:29 -0800
Message-ID: <4aaa59736860f593e18e5978ebd56e04e4deea9d.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193156_887912_B9910286 
X-CRM114-Status: GOOD (  13.25  )
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

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f73cf1382e5c..23cde2de66b9 100644
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



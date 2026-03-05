Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26150EB7ED2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfvunmsyqP5kE57kB+fiQFjXjXbwlyHQ1oLinUTVGhU=; b=W4vh2MH6s/3nGowBlVPoC+7Ttq
	pze1ipuoVeIQiQz7JQgSlAIb2UV2j/eTxO+/HBvuBlMF1lCme52JKZXR01py93vhwHmAPijpkNgFA
	//ZxId4hOuFZU0Vcp7SzOVNM1Bk/V1tLg1m/wlwMETP+6Me1DXWbg7GUj+3e5met12zXMM+lyZD2e
	bR/BkpU/YbO9L8i3bzPAwd/ZtwzF9y5lmruF2FcKXpk2DeTFUbXD17v7eJoxg7Dneekqqc3ff0Pw/
	TJWzGINZJ/otODT+M+IU/P1+Q4MgAajALiiQOqGC+X36MoXq7O9wrqASjB97LXF3w/KlNQMpuPVPd
	OqSUyDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRR-00000000pwG-3vZk;
	Thu, 05 Mar 2026 03:32:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzRO-00000000prq-0QKT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C793D437F8;
	Thu,  5 Mar 2026 03:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF595C2BCB2;
	Thu,  5 Mar 2026 03:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681517;
	bh=sna7ujIJJX2wXpTTTo8a2xChNhDmAoSGFIkZMWk8srk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AnH7Qa8ksu5mf2Gv83mjE9ZsD2k9/WUi6+NShvNbex9IjWIn3FsbOpjntGVs94l6B
	 QzuBnY9D8YVCERpjOgzHblVCNp+ffRlo4EHKVHDd/y2EUiau9BCvyJNRhBX0jdWBSf
	 snR5BLCyVcjqKjLO9YwXX5pRM0MklJCyN6Lnh8rGep5d6GIoe6YXLG3dC1ENAu7t7j
	 l6EN+ZGfOWwAb/dKcgfhy5vtvk7LJqcFSY34MDMHHAyx2PCBnpQWbGR8uITU4L/qgw
	 myvTfGj0zoFTtH7Rln9KExt3KT9/T1v5EgK3ljf2qZSKx85bksHnQf0+ab4yKNfSpu
	 VlaIyS01/c0Kw==
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
Subject: [PATCH 11/14] objtool: Allow empty alternatives
Date: Wed,  4 Mar 2026 19:31:30 -0800
Message-ID: <1af3deb308fd59086b63690c1e7b53586ba3c5e7.1772681234.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772681234.git.jpoimboe@kernel.org>
References: <cover.1772681234.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193158_181143_CD3306B9 
X-CRM114-Status: UNSURE (   9.56  )
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

arm64 can have empty alternatives, which are effectively no-ops.  Ignore
them.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 23cde2de66b9..036adbd67488 100644
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



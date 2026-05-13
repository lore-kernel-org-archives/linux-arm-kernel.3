Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A04BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RilAo0AC07SYUvwWHlTg5PS51NN+H4oJ9eXEklI23Pg=; b=MevZPpSgO5goZ/QwR0XFt4PCFU
	eiY5butRifcrwYKFaFky4HPkICWsnlxiULDAm6gAaJnqSyeRiq++jyQrfsb6K2jUISGzmnyDmBqun
	9ytWWCfzZmdzf8tLXx8d+x7kB9fUnw3VawPfDsMLM/864C2h9txeIQMipvernTKKWXv9UMxzCH7q4
	E2N0wE9gAU27+7vfUQWHLD4UTdgI26dTm4O4iOSS/UOPFwm9EUg3T8OT9V+UnTKPVXgcyFkDR1x2R
	9eO0u1q/mC2ZgbwWk0k4mkM70rmxgu3EqI+tnnoUx4Ob7e70v2gKNz5laGzKKxJxF9HhuwdHGkT4I
	l7XTixrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0NU-000000014dL-0ZkW;
	Wed, 13 May 2026 03:35:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mq-000000013kZ-2hIo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 613BF444B0;
	Wed, 13 May 2026 03:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8234C2BCFB;
	Wed, 13 May 2026 03:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643280;
	bh=+/sFHocRcUihmUH6/AgqXb/DZFT8Oa4f5kM+W19rLY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnB1C68tGrQ+hg40bSzILDRUj87xYxnqRY9/BJQhZg67HOujbCZsCfElQ0oEInBTU
	 7tv8z+bAbnURxLtVLeojl9BGOy9qkqaLXsDZOtgO36wyn9iYQCvWHzCASnC14oQHX1
	 i/M4WTGGdXN3aQ8s+O/Tzs/BsxlE67LVTTOQD+RlxQCTW3kCA5vvBXMwS3BpjNpy/s
	 OP9hTFojt1p8wBP1lKsoY8lmqu6OIiyUwLTUYxOa2+D8EDeCSp5l6qYAwmdlT9bDS9
	 MZ5e8uRti/DPMjq1lu8C8aXp3b0uVbxAOor3Ya4kChgc9DZbQA58zPO3eCsbgJaEgo
	 gewvx101BQYYw==
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
Subject: [PATCH v3 16/21] objtool/klp: Filter arm64 mapping symbols in find_symbol_by_offset()
Date: Tue, 12 May 2026 20:33:50 -0700
Message-ID: <236050080db7b2462fdb13a03ed48a8efb2415a4.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203440_696646_F0104F8D 
X-CRM114-Status: GOOD (  11.46  )
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

ARM64 ELF objects contain $d/$x mapping symbols (STT_NOTYPE) at offset 0
in data/text sections.  These aren't "real" symbols so filter them from
find_symbol_by_offset(), consistent with the existing section symbol
filter.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 9d5a926934dc2..a4d9afa3a079c 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -159,7 +159,7 @@ struct symbol *find_symbol_by_offset(struct section *sec, unsigned long offset)
 	struct symbol *sym;
 
 	__sym_for_each(sym, tree, offset, offset) {
-		if (sym->offset == offset && !is_sec_sym(sym))
+		if (sym->offset == offset && !is_sec_sym(sym) && !is_mapping_sym(sym))
 			return sym->alias;
 	}
 
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53C1C5AD56
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86Wu1e1fcjC+Q8R7XTOaEvr/qEDKKmtBvafngqJL0GY=; b=Sg2IDGCxFiP/gaXaBgkyPme46X
	2NCo6s5JzpXc7V6FcBFd1chqualKC5guJI6vZJbPyNR2Ioe0t86YNhvBZnBa05p48LjDzTlhRsKH2
	/R3UhApHoTysVvtT31IZZACzMGb3GHeQYy/rdPuFFiQffMpMuEznkOwE970PmuISXW/YyMLbjwrmc
	53RYGDji8V4OchlbEB0+X1ZL81W9cdlGDeJfsp2gjMo++jpC6Gh848WAuN/jLMVDeoDExgqlJVNYk
	Rskdtb33geSa9aY7ApY4IVUmBRJOJGs85AKcjN8VbsFnNBNE/p4M4C9OYZFgTXsRWxKxvwiKHI1jj
	2+q0zS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJZ-00000009mUv-3WGx;
	Sat, 08 Aug 2026 23:18:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJM-00000009mGm-16Wt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0D9A60DB5;
	Sat,  8 Aug 2026 23:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94161F00ADE;
	Sat,  8 Aug 2026 23:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231119;
	bh=86Wu1e1fcjC+Q8R7XTOaEvr/qEDKKmtBvafngqJL0GY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A6z/ksTtDqX8xK/Pg8CXwXiVstVJiHyhOq+A/N0C9Xf/FjsMOM0cvO323+zp7/9M4
	 kPZQ/1VUQV++1ZdNOa6TlleV5cGCZ9bfhhMjI/Art7YBB1/INMBdPpqVVmgsvvk9Xp
	 kF69ORpK31ONF/4wWNWYFxA2u93421BShKk2qf6rK3sn2ZLF9Y57uJr/IODREruh9w
	 yn5f+eLZYRvOq4/Nye/KvOKkvbFhl1P1P7qFeicOpolMjQMjk4I0pta8L2WnGGbOEd
	 fev60tWWdcWzGOOlAkzJ4C6hLSisj4awzKqmkTiZGkmWIVTZwXAv4bJB1cP+hS5bLm
	 2al7Qa9FiS8sg==
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
Subject: [PATCH v4 17/22] objtool/klp: Filter arm64 mapping symbols in find_symbol_by_offset()
Date: Sat,  8 Aug 2026 16:17:21 -0700
Message-ID: <9b74908379fb4054ff30a7e0960606baec08c555.1786230311.git.jpoimboe@kernel.org>
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

ARM64 ELF objects contain $d/$x mapping symbols (STT_NOTYPE) at offset 0
in data/text sections.  These aren't "real" symbols so filter them from
find_symbol_by_offset(), consistent with the existing section symbol
filter.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 180e0a0da00ff..f9d49325dbe0d 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -160,7 +160,7 @@ struct symbol *find_symbol_by_offset(struct section *sec, unsigned long offset)
 	struct symbol *sym;
 
 	__sym_for_each(sym, tree, offset, offset) {
-		if (sym->offset == offset && !is_sec_sym(sym))
+		if (sym->offset == offset && !is_sec_sym(sym) && !is_mapping_sym(sym))
 			return sym->alias;
 	}
 
-- 
2.54.0



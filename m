Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6CACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RilAo0AC07SYUvwWHlTg5PS51NN+H4oJ9eXEklI23Pg=; b=l/ZepR4ecSMFi/+LZBV0KOels/
	gdUYgdqC2qGqx5xssG4LsfBfwssYn+MrbXVhQ5MgwSa9Zk55l6CvTCu/1eZBA1C5P5I1FvOvvjTNm
	xdR2PutIqQd1wXH9lK6mTt+It5if6NgYJl32n5VDPEWMi2VeSs3VJMhxHHYg3E/zA2cN/BmhyGapU
	2+jHvO0osd/U1/ILLszKtdFHo69AwgvBJ78WY/aiV5MUQowiRTBYaIICwLwII1fL6MhcJoG2EWOnL
	UEGHpy2hGcm6KbTZY+op32a8EM/IQTAO4DrZnzLLyZFDtF0Pb/Xn1MrdUwKOLz8gJobspyd3R0lMZ
	Zu1VkJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Ns-000000015Ir-2mS8;
	Wed, 13 May 2026 03:35:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0N6-000000014CB-1FJg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E39D54453C;
	Wed, 13 May 2026 03:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA6FC32786;
	Wed, 13 May 2026 03:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643295;
	bh=+/sFHocRcUihmUH6/AgqXb/DZFT8Oa4f5kM+W19rLY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y1MLuE8k4Kpa6kSM6Z6CrgRxAE+UBR3BnTCR+4FUcvoe2XE26Cdb3MNR2oAiYLgPQ
	 EQ7s0wPlt/suiLGtDORkIo6s85HZk0gqXqB1zOP83dVa6y63DLhuCwAYqjgxqOx/bX
	 eLrqSGqcR4ou1gVc3wbFmR5XhNwP6dZN3ue79RAusmauQtUHndvL/iVIG0RVuBA5Jg
	 O1cs9TQ4dysgBpib8+8RZC5yaNSjHrNpBalkodz0Wpu4zxYXFQkaXPVQkUBRw77+mN
	 NeuWzvDz9lozpURNqiygbc6fKCnu6D3XzXO5DFEPBefsRnXIw9CmQGKRMhS9/Z+bho
	 U6V8vB3I/DLtg==
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
Date: Tue, 12 May 2026 20:34:12 -0700
Message-ID: <236050080db7b2462fdb13a03ed48a8efb2415a4.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203456_348464_7CCDCB94 
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
Message-ID: <20260513033412.8X4ZWEOluxGi46RzaDkLq6G-PYNgy0PVZbISsWArpvE@z>

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



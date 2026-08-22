Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47AEC5DF9A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3C1MhcgCYBzARL/+z1ptrjz40O26zol1QO0uE2euMIU=; b=0H8YfNUZLwCIRxVMEC8cI7GI8E
	0Zj5a3yNJdQqJmh68vCEjIE95giGjz6FrgplamgNClDYcpgcJowo9ERp6OKyUKsZrsP0BYFrnXKhh
	7KyI8Fp6swpEhRUz1sDo/aQOvsFqd8SeFGBgbFsd33guaAhpb5rpGmwRmd0gakSth6Qf2ax4i33P7
	xCMw0akijADqHcNoA1zIiG6IX+tujtyy7gaZ4Pdh8PvGEzW9iqCEzXqpBaRdBMEBe8dfn/YNdh5l3
	HbRmkhc36M9ObKbEOYKMWkc72m6ZzPuUl/jwZ0x06DI3pDTJs8kb3IP40Mi7cDOTTdrajzhddHY8U
	Wx+ceo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAn-0000000EYdB-1MoX;
	Sat, 22 Aug 2026 13:54:13 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAk-0000000EYa4-3Oz2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:11 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-47fe23b5acdso1549916f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406848; x=1788011648; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3C1MhcgCYBzARL/+z1ptrjz40O26zol1QO0uE2euMIU=;
        b=wWm4KCAKBg/tt0oYEFYJspzfkGrH6uINvHz5gGBMPobF885jVVxzBj+3UpiC/J6ci6
         ME72WN3mxAFpM10sd5+S+at+IgfMw3ipcp9jC3UdSaTmR/fPCLLFUsJyIdsA2EltyJDz
         5vNUIQn1UhmT6nHpqaWrG0KJaHW+Vu3wEfkzCIFO0NavWT064h7qyl2NM5794c06hwLL
         j5QzIR5xXS0XCcneCcVcvoxBEPA+O/22/PhPnlqMoBVXF5qC1ch81icdNnBURYlrya4r
         dV/f+IqhFS/1KAP+ZMyrjUNBuZhZCxVBztO2DIYfO4MdMsJsy8T3dB1TasDolUugjP7K
         NQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406848; x=1788011648;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3C1MhcgCYBzARL/+z1ptrjz40O26zol1QO0uE2euMIU=;
        b=XxeFD1/XwyCwJh77c9lOMO2LOpCPhUuCDW6WYR9sHZ5SzL5Jp4sbGrJ2Iv3ooBTVN3
         A3AxT1R5Z5JR2l44h2kQYyj/aM7d4aDUVDlzoENI6G/70wMn7Ycjo1K7vx5n37cE+Hxw
         dhAuu31eurNNhw+QZ/YUB48f2iI/m9GutLnV0FOxLml8fgiJCNyq8+GtPXDlm9TXR1BV
         HOJ5oJv8tVhQQ7QcmxI9lB6IsQhVpG7f9rLpb07ZvQgMwH/n+ezZzQgVjWyGxwjgf0i3
         R/riuemfO4QORFUlN7yJoHZn8ODuB4DFK69/AbtsIPoUpZsn5fsIntpWW551jXo+G42Y
         zYng==
X-Forwarded-Encrypted: i=1; AHgh+Rr3h6KpJgZwkNbQxyPWsybzm9Vf32MhUysPA1PfGeztLBONB4GEXtmgKtuMwR1pGdIA0005TX0jsQ/gmDjJiQi/@lists.infradead.org
X-Gm-Message-State: AFuF++mFjwpQ65egbLt1EX3rX28bxmZVefrZTgGoY9wvgnobTTWUTa+Z
	BuKrbGsarV0aGoiArH7sUoavR3LYrRKfSv/X39Gwhk8USKOt+B6Z39Tk+wGDPIHVEGaXQT9SRw=
	=
X-Received: from wrnk3.prod.google.com ([2002:adf:e8c3:0:b0:481:5a0f:19b5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:310f:b0:47f:7129:e30
 with SMTP id ffacd0b85a97d-482c0b976f1mr17563678f8f.11.1787406847588; Sat, 22
 Aug 2026 06:54:07 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:26 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204; i=ardb@kernel.org;
 h=from:subject; bh=2CJ7XIW20mRvuSe13JPdhhevFvLjPgwtnqW6fGhR0pc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5c1bi+7sDNh4oOHy8XMHks1ZWx/c9LM5qpAednXj/
 pol76fv6ChlYRDjYpAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQAT0dVjZGjsanuobS/bwOzn
 INDJt9ssjUtyEdfbFTGrcj54/RWdJsTw31v4rEPQ3sLVG+ati7dtnpxtEvm4wabQeZJex247NZX 3/AA=
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-15-ardb+git@google.com>
Subject: [RFC PATCH 4/9] module: Allocate MOD_INIT_TEXT from the MOD_TEXT ROX allocation
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_065410_870365_EAF01AC3 
X-CRM114-Status: GOOD (  17.29  )
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

From: Ard Biesheuvel <ardb@kernel.org>

When execmem ROX caches are used for module text and inittext, place
them adjacently in memory, by allocating space for both initially, and
splitting off the space for MOD_INIT_TEXT as needed.

This avoids the corner case on arm64, where .init.text being placed far
from .text results in a lot of complexity wrt indirect branches and PLTs
that we'd prefer to avoid.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 kernel/module/main.c | 22 ++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 46dd8d25a605..2d6213496359 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1342,7 +1342,7 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 {
 	unsigned int size = PAGE_ALIGN(mod->mem[type].size);
 	enum execmem_type execmem_type;
-	void *ptr;
+	void *ptr = NULL;
 
 	mod->mem[type].size = size;
 
@@ -1351,11 +1351,25 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 	else
 		execmem_type = EXECMEM_MODULE_TEXT;
 
-	ptr = execmem_alloc_rw(execmem_type, size);
+	bool is_rox = execmem_is_rox(execmem_type);
+	if (is_rox) {
+		/*
+		 * Special case for MOD_TEXT / MOD_INIT_TEXT: allocate the
+		 * latter by splitting off required space from the former
+		 * so that they are always placed close together.
+		 */
+		if (type == MOD_TEXT)
+			size += PAGE_ALIGN(mod->mem[MOD_INIT_TEXT].size);
+		else if (type == MOD_INIT_TEXT)
+			ptr = execmem_split(mod->mem[MOD_TEXT].base, size);
+	}
+
+	if (!ptr)
+		ptr = execmem_alloc_rw(execmem_type, size);
 	if (!ptr)
 		return -ENOMEM;
 
-	mod->mem[type].is_rox = execmem_is_rox(execmem_type);
+	mod->mem[type].is_rox = is_rox;
 
 	/*
 	 * The pointer to these blocks of memory are stored on the module
@@ -1368,7 +1382,7 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 	 * *do* eventually get freed, but let's just keep things simple
 	 * and avoid *any* false positives.
 	 */
-	if (!mod->mem[type].is_rox)
+	if (!is_rox)
 		kmemleak_not_leak(ptr);
 
 	memset(ptr, 0, size);
-- 
2.55.0.860.g4b6b3295ed-goog



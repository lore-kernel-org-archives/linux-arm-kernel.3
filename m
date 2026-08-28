Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7824DC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iZASGKq02X3MlmO8ig05lysxUTvXqLjttI83Y8LZB04=; b=3/LVcGQNTCTUsj8L81bnEFM5oA
	M95NkEj20dvnTwV6dRTjiC0YrydLbNV5PUN571fyRypmJqGUaT7savRZqlNBDr79pPndicUa4/hom
	Tu/OY6IiMltCvLxcIURZrxQmmc+JOn5wlN+XXbexqIo5OyIBUtB6WimtFThNI3Uw+FWywCfGc/6c1
	0tSQuKr3mPHTx0ErxN2aVrQDGT19GmSQD6yfi8EWMe1XGeFsjUlGNYoPUV3WIvWjkbZLIGcVgTzql
	HUUuXHeS045td4ed5zKvAMEfUt/RwNWUBAGQksBdFg3dacw+XP+DBbM9xHrPAxu0VWIgPE0qpR86k
	HZlWyuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxJ3-00000005x8P-3MIu;
	Fri, 28 Aug 2026 14:11:45 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxIz-00000005x71-1SDs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 14:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787926269; bh=iZASGKq02X3MlmO8ig05lys
	xUTvXqLjttI83Y8LZB04=; b=Ycnv+HBqjWQS5U5unDzB96IugCG4zABbml+qs+cqmqoPXqgymN
	G+vRqqgTKjoq8x60DPVW7sOXe0Hsqb5XVKob6OFULWPoJT11vMeGF3D6JUgoiFXpy8emipbSAo6
	IwZ457tXuzzZ7gSK37RTznHw3k8u1/25x4QLcudfso8yHnZrbd3bb+ih/OBHLubdyDLScT66loD
	ikQi4ZPR4efqWGzX5p2Yrzeq4egeTH6Z+oT6Jf1CHeGEwpw0pPrnrAFypM0ywwauY1QphgUu0c7
	SIURc0XASezSaZ5NV9SeEzXFGejC8yS+NYgdAuQWayIoBCn0E1BA9kJwQOGqmRnLmsw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787926269; bh=iZASGKq02X3MlmO8ig05lys
	xUTvXqLjttI83Y8LZB04=; b=pAwUirXl2vj2hacynI1LWN6FYowJY8LNRSofKFRBFio/OCLbR+
	G44FlI0f44HKl1e99r6flMyTrSMraop1b0DA==;
Date: Fri, 28 Aug 2026 15:11:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: ardb+git@google.com
CC: abarnas@google.com, akpm@linux-foundation.org, ardb@kernel.org,
 atomlin@atomlin.com, catalin.marinas@arm.com, da.gomez@kernel.org,
 kevin.brodsky@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 mark.rutland@arm.com, mcgrof@kernel.org, mhiramat@kernel.org,
 petr.pavlu@suse.com, rostedt@goodmis.org, rppt@kernel.org,
 ryan.roberts@arm.com, samitolvanen@google.com, will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_4/9=5D_module=3A_Allocate_MOD=5F?=
 =?US-ASCII?Q?INIT=5FTEXT_from_the_MOD=5FTEXT_ROX_allocation?=
In-Reply-To: <20260822135323.795946-15-ardb+git@google.com>
Message-ID: <5D55C497-95FF-4603-98E4-8C47CDAB504C@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_071143_250830_1B2A2FF5 
X-CRM114-Status: GOOD (  11.19  )
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

On 22 August 2026 14:53:26 BST, Ard Biesheuvel <ardb+git@google.com> wrote:
>From: Ard Biesheuvel <ardb@kernel.org>
>
>When execmem ROX caches are used for module text and inittext, place
>them adjacently in memory, by allocating space for both initially, and
>splitting off the space for MOD_INIT_TEXT as needed.
>
>This avoids the corner case on arm64, where .init.text being placed far
>from .text results in a lot of complexity wrt indirect branches and PLTs
>that we'd prefer to avoid.
>

I can't see anything wrong, thanks for the patch

Reviewed-by: Bradley Morgan <brads@mainlining.org> # kernel/

>Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>---
> kernel/module/main.c | 22 ++++++++++++++++----
> 1 file changed, 18 insertions(+), 4 deletions(-)
>
>diff --git a/kernel/module/main.c b/kernel/module/main.c
>index 46dd8d25a605..2d6213496359 100644
>--- a/kernel/module/main.c
>+++ b/kernel/module/main.c
>@@ -1342,7 +1342,7 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
> {
> 	unsigned int size = PAGE_ALIGN(mod->mem[type].size);
> 	enum execmem_type execmem_type;
>-	void *ptr;
>+	void *ptr = NULL;
> 
> 	mod->mem[type].size = size;
> 
>@@ -1351,11 +1351,25 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
> 	else
> 		execmem_type = EXECMEM_MODULE_TEXT;
> 
>-	ptr = execmem_alloc_rw(execmem_type, size);
>+	bool is_rox = execmem_is_rox(execmem_type);
>+	if (is_rox) {
>+		/*
>+		 * Special case for MOD_TEXT / MOD_INIT_TEXT: allocate the
>+		 * latter by splitting off required space from the former
>+		 * so that they are always placed close together.
>+		 */
>+		if (type == MOD_TEXT)
>+			size += PAGE_ALIGN(mod->mem[MOD_INIT_TEXT].size);
>+		else if (type == MOD_INIT_TEXT)
>+			ptr = execmem_split(mod->mem[MOD_TEXT].base, size);
>+	}
>+
>+	if (!ptr)
>+		ptr = execmem_alloc_rw(execmem_type, size);
> 	if (!ptr)
> 		return -ENOMEM;
> 
>-	mod->mem[type].is_rox = execmem_is_rox(execmem_type);
>+	mod->mem[type].is_rox = is_rox;
> 
> 	/*
> 	 * The pointer to these blocks of memory are stored on the module
>@@ -1368,7 +1382,7 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
> 	 * *do* eventually get freed, but let's just keep things simple
> 	 * and avoid *any* false positives.
> 	 */
>-	if (!mod->mem[type].is_rox)
>+	if (!is_rox)
> 		kmemleak_not_leak(ptr);
> 
> 	memset(ptr, 0, size);
>


--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/


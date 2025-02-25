Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F876C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=By02b8N+3nVeeDw8rOFha/kukv0eknqz8U+GuFCFIG0=; b=VZjnxSkPvDZSQx4y12rpS48ifW
	AiFxAozpTsPUQHhEO2Rn0dHFXN47SV11368gZL+4hMPoqtOI/ujJMnl03q3BkoAh/Yf2XteWKThpP
	PsH6yyIu8cB0GxcoPI/nydFJcgvTVsyE/R6+evZgI5aN7397rW2JBvBxFgPNibCuVZekUs23NuFMv
	vHYXxM0Vc2IfolXFYNKWAHvXW1E1zysWHKi0U6CwszqpGXq6D/VP4m/CqBUMiVOIr3eco54gHN6Ek
	RpAMC5A7ASW6k0zJ0yyEFoxfgaXhigtq+WCQqMaWebv546gSxbBlKCeQu6GM7YZqC9qmGJr+GdHK7
	6ZsgfVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy2j-00000000OHj-1g4c;
	Tue, 25 Feb 2025 16:44:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmx7W-000000006mh-2oIr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15D0F5C6FFA;
	Tue, 25 Feb 2025 15:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16DDC4CEDD;
	Tue, 25 Feb 2025 15:45:14 +0000 (UTC)
Date: Tue, 25 Feb 2025 10:45:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>, "Masahiro Yamada"
 <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nicolas@fjasle.eu>, "Zheng Yejian" <zhengyejian1@huawei.com>,
 "Martin Kelly" <martin.kelly@crowdstrike.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Josh Poimboeuf" <jpoimboe@redhat.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Vasily Gorbik"
 <gor@linux.ibm.com>, "Alexander Gordeev" <agordeev@linux.ibm.com>
Subject: Re: [PATCH v5 2/6] scripts/sorttable: Have mcount rela sort use
 direct values
Message-ID: <20250225104552.2acc5909@gandalf.local.home>
In-Reply-To: <91523154-072b-437b-bbdc-0b70e9783fd0@app.fastmail.com>
References: <20250218195918.255228630@goodmis.org>
	<20250218200022.538888594@goodmis.org>
	<893cd8f1-8585-4d25-bf0f-4197bf872465@app.fastmail.com>
	<20250224172147.1de3fda5@gandalf.local.home>
	<20250224211102.33e264fc@gandalf.local.home>
	<91523154-072b-437b-bbdc-0b70e9783fd0@app.fastmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_074518_797559_66BC882C 
X-CRM114-Status: GOOD (  26.02  )
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

On Tue, 25 Feb 2025 09:45:52 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> It fixes the build issue for me. I tried booting as well, but ran
> into a BUG() when I enable ftrace. I assume this is an unrelated
> issue, but you can find the output for reference in case this is
> relevant.

Thanks, can you try this patch instead? I'll be breaking it up if this works.

This also removes the kaslr_offset() code.

-- Steve

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 27c8def2139d..fdd5ffe268de 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7004,7 +7004,6 @@ static int ftrace_process_locs(struct module *mod,
 	unsigned long count;
 	unsigned long *p;
 	unsigned long addr;
-	unsigned long kaslr;
 	unsigned long flags = 0; /* Shut up gcc */
 	unsigned long pages;
 	int ret = -ENOMEM;
@@ -7056,25 +7055,37 @@ static int ftrace_process_locs(struct module *mod,
 		ftrace_pages->next = start_pg;
 	}
 
-	/* For zeroed locations that were shifted for core kernel */
-	kaslr = !mod ? kaslr_offset() : 0;
-
 	p = start;
 	pg = start_pg;
 	while (p < end) {
 		unsigned long end_offset;
-		addr = ftrace_call_adjust(*p++);
+
+		addr = *p++;
+
 		/*
 		 * Some architecture linkers will pad between
 		 * the different mcount_loc sections of different
 		 * object files to satisfy alignments.
 		 * Skip any NULL pointers.
 		 */
-		if (!addr || addr == kaslr) {
+		if (!addr) {
+			skipped++;
+			continue;
+		}
+
+		/*
+		 * If this is core kernel, make sure the address is in core
+		 * or inittext, as weak functions get zeroed and KASLR can
+		 * move them to something other than zero. It just will not
+		 * move it to an area where kernel text is.
+		 */
+		if (!mod && !(is_kernel_text(addr) || is_kernel_inittext(addr))) {
 			skipped++;
 			continue;
 		}
 
+		addr = ftrace_call_adjust(addr);
+
 		end_offset = (pg->index+1) * sizeof(pg->records[0]);
 		if (end_offset > PAGE_SIZE << pg->order) {
 			/* We should have allocated enough */
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 23c7e0e6c024..10aff2aeb868 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -611,13 +611,16 @@ static int add_field(uint64_t addr, uint64_t size)
 	return 0;
 }
 
+/* Used for when mcount/fentry is before the function entry */
+static int before_func;
+
 /* Only return match if the address lies inside the function size */
 static int cmp_func_addr(const void *K, const void *A)
 {
 	uint64_t key = *(const uint64_t *)K;
 	const struct func_info *a = A;
 
-	if (key < a->addr)
+	if (key + before_func < a->addr)
 		return -1;
 	return key >= a->addr + a->size;
 }
@@ -827,9 +830,14 @@ static void *sort_mcount_loc(void *arg)
 		pthread_exit(m_err);
 	}
 
-	if (sort_reloc)
+	if (sort_reloc) {
 		count = fill_relocs(vals, size, ehdr, emloc->start_mcount_loc);
-	else
+		/* gcc may use relocs to save the addresses, but clang does not. */
+		if (!count) {
+			count = fill_addrs(vals, size, start_loc);
+			sort_reloc = 0;
+		}
+	} else
 		count = fill_addrs(vals, size, start_loc);
 
 	if (count < 0) {
@@ -1248,6 +1256,8 @@ static int do_file(char const *const fname, void *addr)
 #ifdef MCOUNT_SORT_ENABLED
 		sort_reloc = true;
 		rela_type = 0x403;
+		/* arm64 uses patchable function entry placing before function */
+		before_func = 8;
 #endif
 		/* fallthrough */
 	case EM_386:


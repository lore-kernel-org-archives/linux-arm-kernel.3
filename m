Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A858C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=VXFiOteoRndUMjDIfghZJo/kzGnODUzHU+WRQHnHsyg=; b=vrHul/Qcuu3vXl
	+XYeArPU6Sz+/VO+PEQN6HpqWVv1yz8YVAtyxYaJ2Bv5fan2y09Ghz85G2Ah2dlg2iA10SA6rJoAV
	KLOv/9/7n0o/bJIIVCN9Ld76O2hh2Gpa1ESWNiQBLuuNgeunEzbf6cgPCROXhD2RAjoF9BBWffvwN
	YpF89oMmNKb78vR85YdZvieGSsJX165AXl0TgjbyzGk/InEMEi8S1P+0hC09Fg92lJcGcYcziMBbW
	TM5mqZzSmAzCM9VRQPooWq9B541QdRsXUxwa6xX5XL+OV3m60trIw2gxsNQqZ1qdQamJpB/s3VUgS
	tE/5G8AQPwrMJ0EOUJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eY-000000019C9-1qdd;
	Tue, 25 Feb 2025 19:31:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzXU-00000000tU7-1uXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3C49612E9;
	Tue, 25 Feb 2025 18:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DA3C4CEDD;
	Tue, 25 Feb 2025 18:20:15 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tmzY6-000000095Xv-1qYA;
	Tue, 25 Feb 2025 13:20:54 -0500
Message-ID: <20250225182054.290128736@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 25 Feb 2025 13:20:05 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] ftrace: Test mcount_loc addr before calling ftrace_call_addr()
References: <20250225182004.473875894@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Steven Rostedt <rostedt@goodmis.org>

The addresses in the mcount_loc can be zeroed and then moved by KASLR
making them invalid addresses. ftrace_call_addr() for ARM 64 expects a
valid address to kernel text. If the addr read from the mcount_loc section
is invalid, it must not call ftrace_call_addr(). Move the addr check
before calling ftrace_call_addr() in ftrace_process_locs().

Fixes: ef378c3b8233 ("scripts/sorttable: Zero out weak functions in mcount_loc table")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: "Arnd Bergmann" <arnd@arndb.de>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/20250225025631.GA271248@ax162/
Closes: https://lore.kernel.org/all/91523154-072b-437b-bbdc-0b70e9783fd0@app.fastmail.com/
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 27c8def2139d..183f72cf15ed 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7063,7 +7063,9 @@ static int ftrace_process_locs(struct module *mod,
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
@@ -7075,6 +7077,8 @@ static int ftrace_process_locs(struct module *mod,
 			continue;
 		}
 
+		addr = ftrace_call_adjust(addr);
+
 		end_offset = (pg->index+1) * sizeof(pg->records[0]);
 		if (end_offset > PAGE_SIZE << pg->order) {
 			/* We should have allocated enough */
-- 
2.47.2




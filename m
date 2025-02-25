Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFCBC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=RYcaaoJvKaPArz4biv3MH/IZ8a4ioOxWkNkp8V10ETM=; b=no6kdks99RMTQE
	6y9Wwh7xeRfH+X/GgNR9MWeGDdBAwy66/qOGPsxAgESLGLFuzeTzdpjBfPHrIUadar9u3PK3/31xm
	f6kEdStQA3jemajwoDb9MiaRYbyxfiwCDKiZ+2An2H+K+jSMHrHnpNSceYNZQVngr4PgNLzNYv9FH
	mbLtofFtDZAM6qf7f33aMUtAUFP3CI3cKnZpfucJycEFNN8+PHeGVkk1CYVulLrJKoAvVNlCPZpyc
	Hlb4DzSV54aXZoWz6qqhTnZh402lbcplNxsxSx8BrlNl/CJhDjsPbazBGmtHKJEuqsUHHukhgG+ZP
	h1PjseJw+/B1BxeRx2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eY-000000019CX-42eM;
	Tue, 25 Feb 2025 19:31:38 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzXU-00000000tUC-2qpW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26D83612FD;
	Tue, 25 Feb 2025 18:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE33C4CEEE;
	Tue, 25 Feb 2025 18:20:15 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tmzY6-000000095YQ-2bvl;
	Tue, 25 Feb 2025 13:20:54 -0500
Message-ID: <20250225182054.471759017@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 25 Feb 2025 13:20:06 -0500
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
Subject: [PATCH 2/4] ftrace: Check against is_kernel_text() instead of kaslr_offset()
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

As kaslr_offset() is architecture dependent and also may not be defined by
all architectures, when zeroing out unused weak functions, do not check
against kaslr_offset(), but instead check if the address is within the
kernel text sections. If KASLR added a shift to the zeroed out function,
it would still not be located in the kernel text. This is a more robust
way to test if the text is valid or not.

Fixes: ef378c3b8233 ("scripts/sorttable: Zero out weak functions in mcount_loc table")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Mark Brown <broonie@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/20250224180805.GA1536711@ax162/
Closes: https://lore.kernel.org/all/5225b07b-a9b2-4558-9d5f-aa60b19f6317@sirena.org.uk/
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 183f72cf15ed..bec7b5dbdb3b 100644
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
@@ -7056,9 +7055,6 @@ static int ftrace_process_locs(struct module *mod,
 		ftrace_pages->next = start_pg;
 	}
 
-	/* For zeroed locations that were shifted for core kernel */
-	kaslr = !mod ? kaslr_offset() : 0;
-
 	p = start;
 	pg = start_pg;
 	while (p < end) {
@@ -7072,7 +7068,18 @@ static int ftrace_process_locs(struct module *mod,
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
-- 
2.47.2




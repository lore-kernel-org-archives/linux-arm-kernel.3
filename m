Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B252BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 02:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMg5gXS3WItAEvrzJQGT1U7YJHwteiHRCuOesQlbXDo=; b=UntJqUuV+QrVTMIOrVCTehLKMx
	8b/0WiEiburQdIBJq59PLaGUCIJak9Fat//vGN0Oorg2MG7nFLEPYdAaVNUmhTA9o4y8wt6qP88O+
	bw8vSRm7IJMWOBGA4YIMdgx0EQgYvnvtJ4RZVYRI8sgft4E8OrslwSmxPr5pvQ6/VwPN9sME9HdSk
	ODT3Vbq5X7OX7vZm23UazEVLkWTvygN48UjeeGtkcilkUDzvkuUFyC6ebKRGZHUmU5qMtglCbgH5A
	8o7WlgdiRpBeT9C5G50KdqiHo57kiHKQDRVebr24SxQsYCsQ/kTEUABOm7CKF69xFtN+FBSgCVgpn
	XvwHIvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkQX-0000000FmH4-1Gja;
	Tue, 25 Feb 2025 02:12:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkP1-0000000Fm8R-0pyq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 02:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D43F5C49B9;
	Tue, 25 Feb 2025 02:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659A4C4CED6;
	Tue, 25 Feb 2025 02:10:26 +0000 (UTC)
Date: Mon, 24 Feb 2025 21:11:02 -0500
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
Message-ID: <20250224211102.33e264fc@gandalf.local.home>
In-Reply-To: <20250224172147.1de3fda5@gandalf.local.home>
References: <20250218195918.255228630@goodmis.org>
	<20250218200022.538888594@goodmis.org>
	<893cd8f1-8585-4d25-bf0f-4197bf872465@app.fastmail.com>
	<20250224172147.1de3fda5@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_181031_297557_A2983E6E 
X-CRM114-Status: GOOD (  17.20  )
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

On Mon, 24 Feb 2025 17:21:47 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Hmm, I haven't tried building this with clang.
> 
> Can you compile without that commit, run and give me the output from these
> two programs:
> 
>  ./dump_elf_sym vmlinux __start_mcount_loc __stop_mcount_loc
>  ./dump_elf_rela vmlinux .rela.dyn
> 
> If the second one fails, remove the '.rela.dyn' and see what that shows.
> 
>  https://rostedt.org/code/dump_elf_sym.c
>  https://rostedt.org/code/dump_elf_rela.c
> 

Nevermind, Masami told me all I need to do is add LLVM=1 and clang can
handle the cross compiling.

I looked, and sure enough clang on arm64 does it the same way x86 does. So
using the rela items to sort is a gcc thing :-p

Can you try this patch?

-- Steve


diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 23c7e0e6c024..07ad8116bc8d 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -827,9 +827,14 @@ static void *sort_mcount_loc(void *arg)
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


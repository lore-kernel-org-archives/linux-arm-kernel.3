Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FE9C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XW77CPwXLtPbXnhv/w9xtxDBmOcdzDR/5Jgcs8hAZZw=; b=MoZubeeOD6j+EbJTLYjarqr7a9
	xDR54+DjkkKKtZwqlNL5CVa4ECWilaAIIEaGlPEBJaX6b2GXjY6iV07zWEOH2hdl2ritMvmoL55Hp
	By0LuV6grtEavCpK45SSaBNkY21nGMNW6/9xrObNuIRPFXQaHR7PNP+jUTqf4PGVH1btBmtqJL/Ir
	9KLfcBS8fR9jxlD/GAZzrF7ZxPjPTeu0XYzUDrpngWUOkq1u6lseS2oThgHmW2P5a6nfTozGfennc
	D33DSnHrlRTSsQcp/xtvJvwaXNiC4ymlzInwAhSIjk3jxUZJj6F0b+5zzpe9K4FXSr05fc9lpMnl6
	t2OEtJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eZ-000000019Cs-21XD;
	Tue, 25 Feb 2025 19:31:39 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzXU-00000000tUB-2phs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26D04612FB;
	Tue, 25 Feb 2025 18:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6936EC4CEE2;
	Tue, 25 Feb 2025 18:20:15 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tmzY6-000000095XP-15hU;
	Tue, 25 Feb 2025 13:20:54 -0500
Message-ID: <20250225182004.473875894@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 25 Feb 2025 13:20:04 -0500
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
Subject: [PATCH 0/4] scripts/sorttable: ftrace: Fix some bugs with sorttable and ARM 64
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


A few bugs with ARM 64 has been reported with the removal of the unused
weak functions code.

One was that kaslr_offset() may not be defined by all architectures and
it's reference would cause the build to fail. This was fixed by removing
the kaslr_offset() to check valid mcount_loc addresses and use the
is_kernel_text() instead.

Another was that clang doesn't do the trick of storing the mcount_loc
addresses in the Elf_Rela sections like gcc does. Clang does it like
other achitectures do. To handle this, the Elf_Rela is first used
but no functions were found there, it then falls back to the same
code that all the other architectures use.

When reading the mcount_loc and creating the ftrace descriptors, the
architecture specific function ftrace_call_addr() is called on the
address from the mcount_loc. But because the unused weak functions were
zeroed out, but KASLR can still modify them, it can make the address
invalid. The ftrace_call_addr() from ARM 64 will crash if the address
passed in is invalid. Have the valid tests done before calling that
function.

On bug that was found while debugging this but was not reported was that
the test against the nm output to determine if a function is an unused
weak function or not was triggering false postives for all functions.
That's because the address in mcount_loc for ARM 64 is just before
the function entry. The check against nm would see if the address was
within the function text, but 8 bytes before is not in the function text
and this would cause all the functions to be considered unused weak
functions and there would be no function left to trace.

Steven Rostedt (4):
      ftrace: Test mcount_loc addr before calling ftrace_call_addr()
      ftrace: Check against is_kernel_text() instead of kaslr_offset()
      scripts/sorttable: Use normal sort if there's no relocs in the mcount section
      scripts/sorttable: Allow matches to functions before function entry

----
 kernel/trace/ftrace.c | 23 +++++++++++++++++------
 scripts/sorttable.c   | 16 +++++++++++++---
 2 files changed, 30 insertions(+), 9 deletions(-)


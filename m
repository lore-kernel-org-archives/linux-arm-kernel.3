Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C9BCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 02:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3oKwKkWyG/vWyIwRaVTyBxc1jr/03v4pA2jr8mdbyo=; b=S5O+65rNFxXqbqejTMnhqvVzQU
	LwxpzQPqKp3yyTF32h/FJOO8LWwethPUlRld6pCh1ImnH9oeQwcbDAWl5/jgiWXKlrXo+zKgTiLuW
	ToO0aaZE8AuMVHza2AdMNJpNxQ2Mvpcnh+g/7TEDlDvReByGTMvNWivb3XmgXiM/S4VtuRNi3P9mJ
	WqRZqxBM4VVtdafmFAwHd82gN1AWkSN0WVCJPrTa7fVR8xEZ8hJi+pmnOjR+vKQLbbLcNP/WZORaB
	v5TFDlsDMvaTtvqlaN/ky20fu0LhwdlBBPw7V4jbaWcHYHKAoznsp4CKfeKBsI0BHf9RDGZGbXWol
	d6Y4mjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKpGF-0000000FK6z-3ick;
	Mon, 17 Nov 2025 02:46:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKpGC-0000000FK6a-3e3m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 02:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0634D4074F;
	Mon, 17 Nov 2025 02:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A73C4CEF5;
	Mon, 17 Nov 2025 02:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763347590;
	bh=WckId20dWoL3Sm2pBxpsSPNRW6RlT7Dsm6IF/ZnMV/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jv4IAyaOD4AVcvfTrSXXHEBQWq8KCAZsS3yOCC2ZnSa5zb9dGp0KP5yw9+FkNhSXf
	 Apxz61+p14sURJhwVI6iUiRc69h5MBTw5i3wWuyKrzbLN4uTEMYFBwVGt9ZDrXMmBi
	 SOlUmJ3/3vhGqX0zd3OTjVJUj1eh8QAHYTlwh7xypVKk7iHspdR4kdfLvYbnsp4uoO
	 edfQ44DEBLWhjcTRBMH8cJNNQA0o5WFGgn8/SdAfWOUFoNU60L+dBGgXjYpWjCpbL6
	 qf4fG0tQVBbmRJMWv+kTiO0SluBlkGhXpgd2qghlM1dcPcACURQ5U4Hp2qELemiAzO
	 yey6qXzWDSfXg==
Date: Mon, 17 Nov 2025 11:46:24 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] tracing/wprobe: Fix to avoid inifinite watchpoint
 exception on arm64
Message-Id: <20251117114624.5fc972e65edac5bb91caa4b2@kernel.org>
In-Reply-To: <aRdWAshGkWjgXW3L@willie-the-truck>
References: <176179481538.959775.12326313742393696258.stgit@devnote2>
	<20251104223735.4164f224790ea0aea267dff1@kernel.org>
	<aRdWAshGkWjgXW3L@willie-the-truck>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_184632_959913_14F04D9B 
X-CRM114-Status: GOOD (  16.18  )
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

On Fri, 14 Nov 2025 16:17:06 +0000
Will Deacon <will@kernel.org> wrote:

> On Tue, Nov 04, 2025 at 10:37:35PM +0900, Masami Hiramatsu wrote:
> > Gently ping.
> > 
> > There is a bugfix (or strange behavior) on arm64 hw breakpoint but
> > to fix it cleanly, it should change the perf itself (but I'm not
> > sure why arm64 changes the behavior only for the default overflow
> > handlers.) Anyone knows it?
> 
> It's because GDB expects to handle the stepping itself when using the
> ptrace interface (with a custom overflow handler to deliver SIGTRAP).

Hmm, would you mean GDB for user program?
If so, it expects hw breakpoint is used by:
 - user-space ptrace (for GDB)
 - kernel-space perf (must be default overflow handler)

And not expects to be used by 

 - kernel-space custom overflow handler

This series is to handle the third use case.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


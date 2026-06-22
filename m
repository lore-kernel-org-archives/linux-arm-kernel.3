Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18E0CDB475
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2+mOP/j6lYd9qVyAamBJsy1djQW4CKGJJUDwRnuyXs=; b=QnQuVojKgeeTSPDzigVq0+EXak
	r2b3KtAxFJEGoXutP2ONIrjC7hhr3v6L8JT++5cB87stWCnEDDf2LfXd+peA18eo+CdqW3GmnZrbv
	RSadZpzdD3uizYlWnmELYN9txKKZbOMtPoPSBp2LQRNAbN1xS/06AIKa1EAlo2EbeuRzJmw+996oa
	51rsQnpcRD+QmTunNNFQpZdlDSBir+XDiM9r01fgkwJGpy3Ew71JyxrRo3ryA8bni/KC0UIbhesYv
	cUCSLluGAK5P6Kvofa2WaAjIS7I7g10YlFFU+7e6VdFQyBbjfjlu6sTmWlbG2HEgg0BuO0LXvCTyK
	eeQFjc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wba7B-00000004g3N-3vsQ;
	Mon, 22 Jun 2026 08:34:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wba7A-00000004g2v-0Fua
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y2+mOP/j6lYd9qVyAamBJsy1djQW4CKGJJUDwRnuyXs=; b=TuPlTRCUatJuuJgUUAwvzHwMKv
	dWwVfsTqUjTJh9SX5fPBCQGdiQcrZu7Ws4gSZKgN7rA0kNKxui7b5LEtKWEEQDe4V7j5A8N0jYuRY
	uas/iKoJjFjR3gKpo0uOWWxjsbSNbU4N4b8MGJpMvU190ZELYDlzfAoftHa96t+aSCVqbpoMUbpfL
	uOWtb+WeGCTtTYOdcuf3kQ/LcfWhZsQK+C/ri3C/zOHCtiyE1n8uDvDi3TDA+Xy225DqvitJuIeN0
	RneapmfngTU0PhOUCG9gkRpGwiGc3BAbq6jkG1ZvAJCnP1chuakPaLn4PyoFg+CyhHRv/kOJ0Ywl3
	cXoCNRYg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wba77-00000003u7U-1iUV;
	Mon, 22 Jun 2026 08:34:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 52395300B5F; Mon, 22 Jun 2026 10:34:40 +0200 (CEST)
Date: Mon, 22 Jun 2026 10:34:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/2] tracing: Move trace_printk.h out of kernel.h
Message-ID: <20260622083440.GX49951@noisy.programming.kicks-ass.net>
References: <20260621093430.264983361@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621093430.264983361@kernel.org>
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

On Sun, Jun 21, 2026 at 05:34:30AM -0400, Steven Rostedt wrote:
> There's been complaints about trace_printk() being defined in kernel.h as it
> can increase the compilation time. As it is only used by some developers for
> debugging purposes, it should not be in kernel.h causing lots of wasted CPU
> cycles for those that do not ever care about it.
> 
> Instead, add a CONFIG_TRACE_PRINTK_DEBUGGING option that developers that do
> use it can set and not have to always remember to add #include <linux/trace_printk.h>
> to the files they add trace_printk() while debugging. It also means that
> those that do not have that config set will not have to worry about wasted
> CPU cycles as it is only include in the CFLAGS when the option is set, and
> its completely ignored otherwise.

Did you forget your C 101 class? If you use a function, you gotta
include the relevant header.

You don't see userspace saying: 'Hey, you know what, perhaps we should
add stdio.h to every other header, just in case someone wants to
printf()' either.

I really don't understand your argument. Yes, maybe someone will forget
and then either their editor (if they have a halfway modern setup with
LSP enabled) or their build will complain, but so what? This is all
trivial stuff, surely we have more pressing matters to concern outselves
with?


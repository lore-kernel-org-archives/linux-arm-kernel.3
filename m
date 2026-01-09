Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC80D26D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFUPvQLYbQa9JFqCkFrL1r7pZr9xOmVQPjrGguIBdp8=; b=PfZWc5MQ3tmHWln5oBXUGzXu5D
	3r6ZOme5bS/yxrLXqQdwowj/5FltwVM2B8oR3z6EJ4/2JrZvv6khi1jr6JByPdH8dcN3GTM6CZhL4
	MfUyBD3sdxDbvJKRBjf6U3F/Qm6DJ/vrQeap5b9UhRpdPXJ0KfknaiDH5vMH4pqZHVGU/rEN3xCAn
	f6mXra+UANg+GYStEjsSSYiGduGSH5AueSvQdD9QjnXtw4SmDYBsHcV1gsPEDXeka54iCs8LMpvLr
	DEA4Q4wzu2ErXsOU1sadAHbasGxyixjp0zpxpqZ+/QoQaYVXGI0h8ImueJY/uI3tAHbccsYy44ohd
	9tA76pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIUd-00000002x42-38SX;
	Fri, 09 Jan 2026 19:49:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIUc-00000002x3v-1bt9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 19:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F11060160;
	Fri,  9 Jan 2026 19:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819F0C19422;
	Fri,  9 Jan 2026 19:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767988192;
	bh=gxptkWFKGqjGUpnowhws6x+yALAnQviMH3p9X5YSQtY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EqhRI0+vJQyE3ayoQmpkAO9dmShbp5UzdpE6/LGmkPGBF24H02ae3Gr0OOJRgHQyC
	 u8kwUzOOngJPL23yMF7DZ6g6wpUI3T0RzsRoEjqTuFT7EzmUSCtiRgsYR1TP75kByJ
	 SOGLynvhVAI9qKrmnWNx1dJBkPjyqDNab6dACNchYyD1kQ7NaCqdVyLr6Bc6KGJCED
	 5SHyQ33zL+xxf5QiTHdXKwnMCg78RBHAzY7qWNe71xrfmkGTcqLKTmIBRXeMyMOhYA
	 YxCmdEC9Mgu3O6DBoe6cf0MOnZVeJByjApUjBXam4P3KAM7ct5RjNdZeJ3l/1SXvg8
	 Ou+lpLZ4tAukg==
Date: Fri, 9 Jan 2026 14:50:22 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Laura
 Abbott <labbott@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, puranjay@kernel.org,
 usamaarif642@gmail.com, kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Fix annotated branch unbootable kernel
Message-ID: <20260109145022.35da01a3@gandalf.local.home>
In-Reply-To: <aVwp_BJx84gXHPlD@willie-the-truck>
References: <20251231-annotated-v1-1-9db1c0d03062@debian.org>
 <aVwp_BJx84gXHPlD@willie-the-truck>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

[ Resending with my kernel.org email, as I received a bunch of messages from gmail saying it's blocking me :-p ]

On Mon, 5 Jan 2026 21:15:40 +0000
Will Deacon <will@kernel.org> wrote:

> > Another approach is to disable profiling on all arch/arm64 code, similarly to
> > x86, where DISABLE_BRANCH_PROFILING is called for all arch/x86 code. See
> > commit 2cbb20b008dba ("tracing: Disable branch profiling in noinstr
> > code").  
> 
> Yes, let's start with arch/arm64/. We know that's safe and then if
> somebody wants to make it finer-grained, it's on them to figure out a
> way to do it without playing whack-a-mole.

OK, so by adding -DDISABLE_BRANCH_PROFILING to the Makefile configs and for
the files that were audited, could be opt-in?

CFLAGS_REMOVE_<autdit_file>.o = -DDISABLE_BRANCH_PROFILING

And add that for each file that has been fully audited?

-- Steve


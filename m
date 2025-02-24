Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3FBC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 21:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcB9qedzZiG87inJEGQHHDilYWUvx0qhd8gDegCHdPo=; b=dbJ/piNajAMJp3U2VPt5yuq+rX
	ras5eYJS7jALnl7JWc+hIJddchuEnX34Z0INNXzQ5IEDOkQstOL9MyDNI0S1clnHa2nni+bzbaG93
	3h1EoWQzlBvSZC7VxHotu1BSQhAUtYy9i6heyZyY+p3ymTcqkVwuqQ5q9yTIyK3q6rHhI5ZFb7+C8
	MjWcjGkQYWtxak1njLAE057e9rLhFSFQUS8PgIhDfjrDrukI+PGIXgwOWZFyKcSgbXhGK74kEKtE+
	6wH6zHZxJZoTDiLkhLivNxrCm0ksWIsXOmK7MyV7qCI7VhA/dHnZsr5WR1HkawkFNE4h4ysEljMs6
	AptrPsrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmg7Y-0000000FFqa-3Q2b;
	Mon, 24 Feb 2025 21:36:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmg64-0000000FFSx-2wCN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 21:34:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17CBC61129;
	Mon, 24 Feb 2025 21:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF62C4CED6;
	Mon, 24 Feb 2025 21:34:37 +0000 (UTC)
Date: Mon, 24 Feb 2025 16:35:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Zheng Yejian <zhengyejian1@huawei.com>, Martin
 Kelly <martin.kelly@crowdstrike.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>, Heiko
 Carstens <hca@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v5 4/6] scripts/sorttable: Zero out weak functions in
 mcount_loc table
Message-ID: <20250224163513.1ea561b7@gandalf.local.home>
In-Reply-To: <5225b07b-a9b2-4558-9d5f-aa60b19f6317@sirena.org.uk>
References: <20250218195918.255228630@goodmis.org>
	<20250218200022.883095980@goodmis.org>
	<5225b07b-a9b2-4558-9d5f-aa60b19f6317@sirena.org.uk>
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

On Mon, 24 Feb 2025 20:06:28 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Feb 18, 2025 at 02:59:22PM -0500, Steven Rostedt wrote:
> > From: Steven Rostedt <rostedt@goodmis.org>
> > 
> > When a function is annotated as "weak" and is overridden, the code is not
> > removed. If it is traced, the fentry/mcount location in the weak function
> > will be referenced by the "__mcount_loc" section. This will then be added
> > to the available_filter_functions list. Since only the address of the
> > functions are listed, to find the name to show, a search of kallsyms is
> > used.  
> 
> This breaks builds with ftrace on architectures without KASLR, one
> affected configuration is bcm2835_defconfig:
> 
> /home/broonie/git/bisect/kernel/trace/ftrace.c: In function 'ftrace_process_locs':
> /home/broonie/git/bisect/kernel/trace/ftrace.c:7057:24: error: implicit declaration of function 'kaslr_offset' [-Werror=implicit-function-declaration]
>  7057 |         kaslr = !mod ? kaslr_offset() : 0;
>       |                        ^~~~~~~~~~~~
> 
> since that happens to enable CONFIG_FUNCTION_TRACER but doesn't have
> KASLR, we don't have stubs for KASLR on architectures that don't have
> it.  It also looks like from a quick glance at least RISC-V will fail to
> link since it only provides kaslr_offset() with RANDOMIZE_BASE enabled.
> This all feels a bit footgunish.

Already reported:

  https://lore.kernel.org/all/20250224180805.GA1536711@ax162/

-- Steve


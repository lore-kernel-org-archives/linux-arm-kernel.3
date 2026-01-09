Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E03D26D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkci5cm1MTpNe1Hu1ac/RL8JH3rGikKGMBu6NigDd1o=; b=ZpONt433/atP05t4oQ8HfTP7Hb
	IhTmHsLFFr78qn0HioZOWHPQZD4qG2ePUq8vHT8SxBwR7s3w+UN3NL7GpEOm3rAp2pwQJm6o5LO2a
	CnI0yXLiJlHWDVSOs7LMBuR908RHlr0tB/0ERWU+6VvvTblmf9I9NkCxp1IDgvyOQOpRSCffYAERK
	rmlnd7xkREdeu54LzDTIV2w5ZTzh+lHeMBA+NuLXAL7Xz1vSuuCIN6z+WqgZVrOtMngiRaCz2X1bL
	xoADftFr+oQzwejyqbhX6No4g0GDmgm40xipuVD648c4BlvkiqUrzlWkC+BaK0r7BBQydISptH5TR
	LUA/iOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veISD-00000002wvT-1EFs;
	Fri, 09 Jan 2026 19:47:25 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veISA-00000002wv8-3zG0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 19:47:24 +0000
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 78E1213BED1;
	Fri,  9 Jan 2026 19:47:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id B7B0330;
	Fri,  9 Jan 2026 19:47:14 +0000 (UTC)
Date: Fri, 9 Jan 2026 14:47:46 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Laura
 Abbott <labbott@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, puranjay@kernel.org,
 usamaarif642@gmail.com, kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Fix annotated branch unbootable kernel
Message-ID: <20260109144746.4b86aff0@gandalf.local.home>
In-Reply-To: <aVwp_BJx84gXHPlD@willie-the-truck>
References: <20251231-annotated-v1-1-9db1c0d03062@debian.org>
	<aVwp_BJx84gXHPlD@willie-the-truck>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: B7B0330
X-Stat-Signature: y1irfeaeo9r3qazg5i1ufgoowtmksn5x
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18aQfYKwLFjc+j1fBAjUkFY2tQx54zt9Ag=
X-HE-Tag: 1767988034-189395
X-HE-Meta: U2FsdGVkX18aSF6HsSAMAz6VNgb0vhA/XykPHWKINq6EKVrPtdLYvWkca/CTYzPz962OC0FHShZH6YI8a5V0BZu08PDbuO6zi2PCdYYg3XkjdEg4yGu9sG+ItQzMQ+COZxGcRyEppbC4oBmsakrHKsKgb0BzEOJ2gNlytKlsKvxTOARvTNCwdpr02i3oViBFBEtXUe536R3LDv7lHSA8qchlGSqV5PU74Wi5l6CwzZQdU1+6T1SQMz4F8FM9u3YJ0NcVkEoRm/Y8viZObsnvBSXnn9u10mjEw6ADZCArqJ+petiaq83Sy6DqJXPViXpfCEnAZ9F/2WTn67tnRftG9A/IbPmiQ49D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_114723_054133_C4478A80 
X-CRM114-Status: GOOD (  12.45  )
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


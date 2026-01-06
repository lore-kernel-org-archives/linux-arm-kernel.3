Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54933CE9D70
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cnCEBntS2qizSZR88uAgtLU8YYmqrMUDodqtHGUC3o=; b=HiJE3MuKIv8RRsbEfJTRXcKgK+
	0xOc7yLTyU9bGbowNyzrBb1yAMU2D7MnFjUFGg9YITZHDsZIdcusFmRQy7S3kwtf9f+GTWx1OB6Qh
	ZgjjQtqAreZb3YCCMD4H6W9XfwF9HrnWX/LJbVX61erF/M5SfQ+HEmvcLhj1YhwGiixv5SFia8Tpz
	f3mnGPGKLz7eOddEPrNaxI2sXJqtxUbV2aB1FDJWmpJndWw6frAaFFpNaXTboUEmrQiWBjXiihIbA
	z9OzqGQgiHteFHh4dBbiuDE6BXgkLBb1yKJDYbREzPArD2TPTNyER2vtyJeLXHo1xFvTTdtQtQeRq
	ombKiBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9eZ-0000000DT3c-06RR;
	Tue, 06 Jan 2026 16:11:27 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9eV-0000000DT37-2dDw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:11:25 +0000
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 8FEA01A0448;
	Tue,  6 Jan 2026 16:11:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 116C12E;
	Tue,  6 Jan 2026 16:11:17 +0000 (UTC)
Date: Tue, 6 Jan 2026 11:11:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Breno Leitao <leitao@debian.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Laura Abbott
 <labbott@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, kernel-team@meta.com, puranjay@kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Disable branch profiling for all arm64 code
Message-ID: <20260106111142.1c123f12@gandalf.local.home>
In-Reply-To: <aVz-6WozGIxGiTUR@J2N7QTR9R3>
References: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
	<aVz-NHMG7rSJ9u1N@J2N7QTR9R3>
	<aVz-6WozGIxGiTUR@J2N7QTR9R3>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 5frgoyscigx4z31rwt79z9asah1swst1
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 116C12E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19aqk1VEwjvwODk6X1+zCgl3U2uFvAxYoY=
X-HE-Tag: 1767715877-848853
X-HE-Meta: U2FsdGVkX1+ONV73ZDOr3t6sUAMyVZ7qm6Lb1s+RwQ0nN2WCWtlSUJo4v4y1iXVQcMd4kBU8MbWXC6SUWuAOnfBiTl/yO4QKJIc7g+XwLRXQi6UqM90FGf5v0+Hxuoifaxo9VE7ngpPe+LYhUG/s7/dFRsrJ9nwIm4nhHw7gX0xlS+PeLbs44jSLfmBvZ2toHk1sh5qMGe65b9ydF75/CE88LH/pTWuUQ86EzBp4p3KH8kRSA4GssbWIQJc5MkqlorQ9BmekkCDNYQlld9Rwibgc21qhN1Kfq64y5eRgEnNms85TEEOeCCUbHtRyrC0sz5GfMfZEnz6yBd2zy+wI9fxdx5vBoD/KqGnYe6s2f0ukI6t4zTviCVvSKJ1uWRlVB8dl3nFJgIBkxJuuQ07ASluxfuvFaQss3NPT6UlB2lqz39LVgCjjc/Ef5RYXXuQW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_081123_744703_60621D69 
X-CRM114-Status: GOOD (  12.13  )
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

On Tue, 6 Jan 2026 12:24:09 +0000
Mark Rutland <mark.rutland@arm.com> wrote:


> Whoops; s/CONFIG_DEBUG_VIRTUAL/PROFILE_ANNOTATED_BRANCHES/ in both
> places in my reply.

Note, it could still be useful ;-) 

I've been running my yearly branch profiling build on both my main
workstation and my server. I post the results from my server publicly (this
is updated every night):

   https://rostedt.org/branches/current

If you check out the branch_annotated file, you can see there's still quite
a bit that gets it wrong. Some of these is because of bad assumptions by
the developer, others is because the code moved around causing new branches
to make later annotated branches go the opposite way.

Note, its still slow to download, not only because my internet is 20mbs up,
but also because that web server is running on a machine with this
profiling still enabled. I'll rebuild the kernel and disable it this weekend.

-- Steve


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A0CCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 02:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqISTVmIjAzj+5p6fJ1FTxQ6U4nsto7tFnbGrdroV7U=; b=dmy1ehvbwyz+XbCex+k8W9+Ho5
	SJTxlUHtneQhKJ+ROBSB19bguPIF8KjTrmBn/SH45Wm9ISDaKgMgFJvdCMkEY4R/c0Ms3SfqcZl/u
	Fovfdd76eAci5diMnZNlpvQx4jZsQl13tn4g9jykuqG0EyBvUNeADITmHxilgAJ9JTsvcT9bv9/HY
	wpwuEYGxjAqC9SYp1sM0BVQgc19eYA3wNI1NnrC0bQD2aSMF2zEix0xkXywSSqkN7lLQWUWNIT8g8
	L2XVBLMncw1sN9AiBt0x0ACncSdeiGpOg87tmm5xiYLgxLG+rkx7n3F6YMBIf0suchynALGT2iEOC
	rEPBD/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCzU-0000000D17d-3uNh;
	Mon, 27 Oct 2025 02:29:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCzS-0000000D16Y-23PF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 02:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 488A544FC1;
	Mon, 27 Oct 2025 02:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2BFC4CEE7;
	Mon, 27 Oct 2025 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761532185;
	bh=Jv0StzLdkPw7Qg9z8uEgyVO5Bn1RJ64wxzXC6DVC2TY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c9Vo/wKDewFAO95sAbUUfzBcIIrwLYXwl11n70C70LnH/SRsZG4SZKClOTqX7sNGg
	 8muV+pnX0khJDJQzpbKarmehAOJcRb1x9dCkRM+mrpebzSDX71j0WM01OlCvVfjE+F
	 t+bymSOZLVB+rK3B8YGxwlWIwGzvXfLkH9W/LTNJy3kGIiZWzw9grdlmseXOTKq2AJ
	 rhbA77IeJVMSBU66HM6cFtYgAP96KgHOI7MOULEcqK+DPD8dodR4xEHUwqQEMWajm1
	 68SIrV2b1jeuHiSHyhIpyu3RT0PgZuL7kL06uHXew6OZjU7enbK0Aw2LRBvTMKYpwI
	 O8SmIOPPrRapQ==
Date: Mon, 27 Oct 2025 11:29:38 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
 Jinchao Wang <wangjinchao600@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 6/8] selftests: tracing: Add a basic testcase for
 wprobe
Message-Id: <20251027112938.bd34197bdbb5394bb2b220d9@kernel.org>
In-Reply-To: <aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
References: <175859019940.374439.7398451124225791618.stgit@devnote2>
	<175859026716.374439.14852239332989324292.stgit@devnote2>
	<aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_192946_570749_4FBB9A31 
X-CRM114-Status: GOOD (  20.78  )
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

On Fri, 24 Oct 2025 22:31:06 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Sep 23, 2025 at 10:17:47AM +0900, Masami Hiramatsu (Google) wrote:
> > From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > 
> > Add 'add_remove_wprobe.tc' testcase for testing wprobe event that
> > tests adding and removing operations of the wprobe event.
> 
> Since this series has landed in -next we've been seeing hangs on a range
> of arm64 platforms running the ftrace tests, it looks like it's all of
> them.  Unfortunately the systems lock up with no output as soon as they
> start trying to do something with wprobes:

Oh, thanks for reporting!

> 
> # ok 19 Generic dynamic event - add/remove kprobe events
> # ok 20 Generic dynamic event - add/remove synthetic events
> # ok 21 Generic dynamic event - add/remove tracepoint probe events
> # ok 22 Generic dynamic event - add/remove tracepoint probe events on module
> # ok 23 Generic dynamic event - add/remove/test uprobe events

OK, let me check.

> 
> the next test being add_remove_wprobe.tc, which doesn't seem to
> complete.  Full log (for what little it's worth):
> 
>    https://lava.sirena.org.uk/scheduler/job/2000440#L1860
> 
> I turned on -vvv logging and that generated the rather spectacularly
> more verbose:
> 
>    https://lava.sirena.org.uk/scheduler/job/2000676/log_file/plain
> 
> (in a somewhat processed format unfortunately.).  Looking at that log I
> do notice a bunch of "unexpected operators" reported by the shell, these
> systems are running dash not bash, though that doesn't seem related.  It
> looks like the script hangs in reset_trigger_file while grepping the
> trigger files rather than actually trying to do the test.

Yeah, it seems do nothing on wprobe. Let me check why it happens.

Thanks!

> 
> Sorry about the delay in reporting this.


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


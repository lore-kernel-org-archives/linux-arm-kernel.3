Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C696CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 23:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8n2zOrHK5eWY+4D+d3YqnywyUXdMY6UIvwwz5QUIUII=; b=ensrg7xgz1OHfhGDmqrfDgXUIY
	Gcp0r6HvILIb/oT1mBuyiCURyZZuT/Tw8T0UaGqg4VqvSBoaaxcn8PkO/H4FzaMhKkGSJp14CKyXz
	NYt3Q1vLUzRlYKj/+djtOA+aJU6qOTwc2LAWWwYlmNH4Rleby3kj+W6MdKXN9ydIjrNCQz5gMxhx/
	0ytxacHyqrxhBKz1J+tgofqSLFZZ9xxci3nj9+WjBr8CRZNR6t3nB6eC1+iDkdWicVGBBle4i0IDf
	SW7d9DWMCvXuYQfzVNFVuunAYZ4+5GxAXT2ezXrpItT0/+FQ+pR6+FFqLjLcaz08oaYWcj5kZaa5P
	eYrxYqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWrA-0000000ExC7-0YZw;
	Mon, 27 Oct 2025 23:42:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWr8-0000000ExBy-0bGM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 23:42:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 354DF603C2;
	Mon, 27 Oct 2025 23:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC26C4CEF1;
	Mon, 27 Oct 2025 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761608548;
	bh=gG2hH7WhbSVVnynsoyf11RN3a15KjJlc/LYqB/bQr6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UQpSmeEgbKeE7n0VTh1TeiAoBQeZG363+PEtwIjtQe3waPrX5COqSqnSB3dTl5zM7
	 EhFzUbRu/xaFK9nfgaqPoI6GQustslioWdYRrTd2lTCVTdbpq4VHII9jKsRkYbM2Ed
	 Tgx6d1sPvXCGeuk4i8ZD/VC/ykUd1mJs9kuqvB4ga89qztME1MkgXQK2BWsOAc2IO5
	 0BOS2jSCzXb61VuE3MneYqCloavjOBJGeaQcWcj6SGl4eI+7yRXh9sfSCi9KDHE0AL
	 /b27W35ABmF0Su1mqLITW45SMmGgGo5yRDwIKoy8DgmoqbkIuc7XXrP8xUXbbMBBzI
	 TxDpfTeZqNkyw==
Date: Tue, 28 Oct 2025 08:42:22 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, Jinchao Wang <wangjinchao600@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 6/8] selftests: tracing: Add a basic testcase for
 wprobe
Message-Id: <20251028084222.a3c1ae97d125d9bd88fc565b@kernel.org>
In-Reply-To: <20251027224347.4c887cc956df63602f377550@kernel.org>
References: <175859019940.374439.7398451124225791618.stgit@devnote2>
	<175859026716.374439.14852239332989324292.stgit@devnote2>
	<aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
	<20251027224347.4c887cc956df63602f377550@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Mon, 27 Oct 2025 22:43:47 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> On Fri, 24 Oct 2025 22:31:06 +0100
> Mark Brown <broonie@kernel.org> wrote:
> 
> > On Tue, Sep 23, 2025 at 10:17:47AM +0900, Masami Hiramatsu (Google) wrote:
> > > From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > > 
> > > Add 'add_remove_wprobe.tc' testcase for testing wprobe event that
> > > tests adding and removing operations of the wprobe event.
> > 
> > Since this series has landed in -next we've been seeing hangs on a range
> > of arm64 platforms running the ftrace tests, it looks like it's all of
> > them.  Unfortunately the systems lock up with no output as soon as they
> > start trying to do something with wprobes:
> > 
> > # ok 19 Generic dynamic event - add/remove kprobe events
> > # ok 20 Generic dynamic event - add/remove synthetic events
> > # ok 21 Generic dynamic event - add/remove tracepoint probe events
> > # ok 22 Generic dynamic event - add/remove tracepoint probe events on module
> > # ok 23 Generic dynamic event - add/remove/test uprobe events
> > 
> > the next test being add_remove_wprobe.tc, which doesn't seem to
> > complete.  Full log (for what little it's worth):
> > 
> >    https://lava.sirena.org.uk/scheduler/job/2000440#L1860
> > 
> > I turned on -vvv logging and that generated the rather spectacularly
> > more verbose:
> > 
> >    https://lava.sirena.org.uk/scheduler/job/2000676/log_file/plain
> > 
> > (in a somewhat processed format unfortunately.).  Looking at that log I
> > do notice a bunch of "unexpected operators" reported by the shell, these
> > systems are running dash not bash, though that doesn't seem related.  It
> > looks like the script hangs in reset_trigger_file while grepping the
> > trigger files rather than actually trying to do the test.
> > 
> > Sorry about the delay in reporting this.
> 
> OK, eventually, I confirmed it is stopped on enabling wprobe
> 
> + . /mnt/ftrace/test.d/dynevent/add_remove_wprobe.tc
> + echo 0
> + echo
> + TARGET=jiffies
> + echo 'w:my_wprobe w@jiffies'
> + grep -q my_wprobe dynamic_events
> + '[' 0 -ne 0 ]
> + test -d events/wprobes/my_wprobe
> + '[' 0 -ne 0 ]
> + echo 1
> 

Interestingly, this stops in the cpu_function_call(). It does not call
__perf_install_in_context().

~ # cd /sys/kernel/tracing/
/sys/kernel/tracing # echo 'w:my_wprobe w@jiffies' >> dynamic_events 
/sys/kernel/tracing # echo 1 > events/wprobes/my_wprobe/enable 
[   54.942288] trace_wprobe: enable_trace_wprobe called
[   54.945306] trace_wprobe: trying to register wprobes
[   54.947367] trace_wprobe: __register_trace_wprobe called
[   54.949586] trace_wprobe: registering wprobe at addr: 0xffffb6ce429fb200, len: 4, type: 2
[   54.951639] Creating wide hw breakpoint on CPU 0
[   54.966390] Creating kernel counter on CPU 0 for event type 5
[   54.967758] perf_install_in_context: event 00000000736da1d9 ctx 000000005d4db900 cpu 0
[   54.972015] perf_install_in_context2: event 00000000736da1d9 ctx set to 000000005d4db900
[   54.976697] cpu_function_call: calling function on CPU 0, func: __perf_install_in_context+0x0/0x2c8

What happen if the cpu calls function on itself by
smp_call_function_single() on arm64?

  smp_call_function_single(this_cpu, remote_function, &data, 1);

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


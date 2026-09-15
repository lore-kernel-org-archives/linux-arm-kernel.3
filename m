Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1D7C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tD8a6exBiuiMZ+UoC5PJsvb3MP2QyoYGVvzltIQRI4=; b=rCb8jGrtZ6zXYbiRqk/6ttMuU1
	h2L74zoisk2HFyqMfAR60gpsoN3dI6CGuxGadp6XEkjy0SUDMklEEphKaeYx4QBf3CBk6NsZEgzPx
	eQW9jUc2XRM4PCVv7Ov/sF7KJUInQoPURFoggJsh9CHfmDdRZvlUQjxWI/O0BwQwka/K9crCiH0Qa
	Fs6NKVaZM4MJSr2+XrrAD+/kLfq20gspsJFRYXERUukTiIUy2q9uNQEUtZ/y/4eGcSM7UEHfVYCUK
	xwdVFPDDWe3mPqSJPpLsNK9lC7G3p0yVFwQy8D0KQMGv8Yrxmu3Sy/pYjXlqDsxzwbtlN9tLpvySJ
	0F4Zts1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SyV-00000006fmO-3xwK;
	Tue, 15 Sep 2026 13:13:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SyU-00000006fm2-2mO5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:13:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17A9D43572;
	Tue, 15 Sep 2026 13:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BE11F0089A;
	Tue, 15 Sep 2026 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789478006;
	bh=4tD8a6exBiuiMZ+UoC5PJsvb3MP2QyoYGVvzltIQRI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Knl5Rk7L79lys25DYi750mDQwSC6ffBx2Yd/MV/TjslA4t980FAtpJisR/xidrHPa
	 6T6sVPQ0O8X3eLpZ4aarQrxyNuteXmYp3jFjVCIelAbEeqFmpJ0aG+1p7qWMugMF2G
	 WnMT63DNSgDMnE4a4bsyEHD0XV1F9aDohAhutgwte6vXVNl4dHGI/2KBmBhezBvpJx
	 3GnTUXWxqs+EZxgeUrMfbLe6QI7ea2Bw2jnSpd87qTMVX6qIeb9u4IYVif7vUzusPZ
	 1kTqjhRNVP4VMysH92GYpVpSFfauL7AkXQtXSNc7pu9ap+gUdQdJdoxv0udHzAQgmY
	 SX9YeTJ0eXJvg==
Date: Tue, 15 Sep 2026 15:13:23 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v2 03/15] rcu-tasks: Hold trampoline nesting across
 irq-exit preemption in trampoline text
Message-ID: <aqlEcz5g5VNjHWzP@localhost.localdomain>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-3-eaaa61ed2da4@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-3-eaaa61ed2da4@toxicpanda.com>
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

Le Fri, Sep 11, 2026 at 02:08:41PM +0000, Josef Bacik a écrit :
> A trampoline's own rcu_tramp_nesting increment and decrement live inside
> the trampoline, so there is a window of a few instructions on entry and
> exit where the count is zero while the CPU is executing trampoline text
> (or text on the way into one, such as a static ftrace stub holding a
> direct-call target).  In that window the task has not called out, so it
> can only be preempted from an interrupt, and the interrupted instruction
> pointer identifies where it is.

I haven't read the whole patchset yet but what happens if the count is zero
on trampoline exit but the trampoline isn't finished yet and RCU tasks does a
fully quiescent scan of all tasks during that short window? Isn't that ending
with a too short grace period?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs


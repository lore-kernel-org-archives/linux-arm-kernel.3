Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8813C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVD5gFDBWDGN0X6QVeDbX5tNYhDXBkX15MX3Yd3diVU=; b=kC+iDPg2mNC398u2PUranwBoz2
	sNIxxoyZVkySU6n+XE1PuTjTKbCSlemRHWUV1eV7qEXOEmdKB3tU4/cjxk81/FGnuyfHZBsl0/Fdg
	MyGeM6XVC0GfUBM/bBc37zLYnYgjk7jnCWqLFIowILCk5I/99ggz0co+30GtXlAC2p+l31C3i3wT/
	vkuT6pnUWMCtTpIpXx+++PZiYzCL1i7U5MXGQKM4RS8+a6xKZaBpD6nr7Rwk23F/lJMZBbuV08YWB
	mSxmH69RIhOlyON6b1xmq7VETT8YgfBDe7HMTieVM95GNHX4cVjIwhFMTDrvm3SjE4oFdIIG6JbQd
	t1x8jg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ooC-00000001uAQ-1AF9;
	Sun, 13 Sep 2026 18:20:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ooB-00000001uAK-0FJV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 18:20:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40B0360F86;
	Sun, 13 Sep 2026 18:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B411F000FF;
	Sun, 13 Sep 2026 18:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789323606;
	bh=NVD5gFDBWDGN0X6QVeDbX5tNYhDXBkX15MX3Yd3diVU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=mJ27Jmv/mJW2LDKw6I+T6hZEXq/ZvlwdOOJIHR64P4TERWpoC7uE4AYU4tWeybXKS
	 IhEEGOMy0Mt1H/gMxVqeZRc1xjWs0hG72HL8fR9lzWZCJc+s6AutqyHSEJpptygnro
	 0ujyQ1jCJ2NdnkjiFiXL8AbMmC7IeFuaFqdm2wUUxnfYQ0605UquUF6v3IpXy6Hh9K
	 ExMw4X6yCJv4rFys9evu9uD9jNFtrK5cQCDs3clrr7SgfUfCJke6/bv86T4a0uTWDQ
	 s4J25tAJVZdbivSXe28DjPBWF9KgO0IoG9LWXGLAfbcUZYrE/yT1BmJCadTMNrOycI
	 H5sJ25eSRm+gQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 53A0ACE107B; Sun, 13 Sep 2026 11:20:05 -0700 (PDT)
Date: Sun, 13 Sep 2026 11:20:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Frederic Weisbecker <frederic@kernel.org>,
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
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Message-ID: <e88514c6-296f-431f-a7bc-7429967b01a9@paulmck-laptop>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
 <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
 <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
 <20260912221400.4045198b@pumpkin>
 <ffffa178-c475-4249-a609-c5d222704987@paulmck-laptop>
 <20260913122859.4d5067cd@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913122859.4d5067cd@pumpkin>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Sep 13, 2026 at 12:28:59PM +0100, David Laight wrote:
> On Sat, 12 Sep 2026 15:31:24 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > On Sat, Sep 12, 2026 at 10:14:00PM +0100, David Laight wrote:
> > > On Sat, 12 Sep 2026 11:03:34 -0700
> > > "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > >   
> > > > In the old kernels, yes, we have current->trc_reader_nesting++.
> > > > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > > > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > > > other thins is a bit faster and does not need to hook into the scheduler.  
> > > 
> > > Isn't that rather architecture dependant?
> > > It is fine on x86, but on arm incrementing a per-cpu variable is
> > > significantly expensive.  
> > 
> > Last I heard, slow ARM increments of per-CPU variables were to be a
> > transitory phenomemon.  Plus changes late last year greatly sped up the
> > per-CPU increment operations.
> 
> There are some unapplied patches to improve per-cpu operations for both
> arm64 and s390.
> Without those preemption has to be disabled (in current->xxx) which requires
> a conditional call in the preempt enable path.

These are on top of the patches that provided an order of magnitude
improvement late last year?  Very cool if so!

							Thanx, Paul

> David
> 
> > Plus this change removed some hundreds
> > of lines of RCU code.
> > 
> > 							Thanx, Paul
> > 
> 


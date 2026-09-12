Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8A8C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 22:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ce1HX5koLmAjYA7zzAHVeJdUkobP3h1/gtoI/ft1GtQ=; b=wv+YcgVIQojcfwZ5IAqiSyvhzR
	T0hC3gCqEEwjtGUYVv1JAkBYUolqkau/mpF09VxVCjV93Tp6w//fUOC9vjbaLj3n5Or5t+DJ/7WEF
	+vsOVHOZZvh6YNVagm4O4Fr91a1AwzKeLAdxCsHfWPHne+yDF1uZAQTH2Ut3/iXN9eO1EJ5dmdwH2
	CZbkUiebxASnKo4Dp/zFwku7clsoxjia1uEvPSd8Zbzi7EewgBIuKpS7pGmvvh33XjS/GrxS83zFS
	DWOcKdiQemfy5A3tFbsuXmEq7EE1A+NCNz64lscM45VJllq2++yFz0Do6Ji00cdq8i9V5aCVdG5cM
	uMGWCL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5WFt-00000001FuI-2zzA;
	Sat, 12 Sep 2026 22:31:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5WFs-00000001Ftt-1Il1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 22:31:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03E38429C6;
	Sat, 12 Sep 2026 22:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5401E1F000FF;
	Sat, 12 Sep 2026 22:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789252284;
	bh=ce1HX5koLmAjYA7zzAHVeJdUkobP3h1/gtoI/ft1GtQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=PVts4P+ZFRMNDP8IPda+oXXNIXvO3R62sGgiWrzFfvap+u4GoPR1dLdGGy1nA0Ytv
	 9fvL2deDyqRn/CzAhHJjEhGwZ5OAuVc1ga/S9ipJo7/P+0z1zArvcm+jE34YnTRk2r
	 bN80Leor8ep5neouVAB55Kn+ZdojDTppn7WbzVcdKArvfbTFSNU2IgySo2UA5sFUU8
	 Z6dbvvFLJjFVTcEO2IO3MHptg1MK8nbOVxr+EpfImqmCw/EkpZEVQ8cipgPpzd4nsr
	 g14pK3zn/l64SXO2vt4ABs94DMJN1Yr+vAqyP9X4MSsPkbnbKUh3IgJ94cqk9WHRfV
	 AqhUafm/316dA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 17205CE17BD; Sat, 12 Sep 2026 15:31:24 -0700 (PDT)
Date: Sat, 12 Sep 2026 15:31:24 -0700
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
Message-ID: <ffffa178-c475-4249-a609-c5d222704987@paulmck-laptop>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
 <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
 <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
 <20260912221400.4045198b@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912221400.4045198b@pumpkin>
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

On Sat, Sep 12, 2026 at 10:14:00PM +0100, David Laight wrote:
> On Sat, 12 Sep 2026 11:03:34 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > In the old kernels, yes, we have current->trc_reader_nesting++.
> > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > other thins is a bit faster and does not need to hook into the scheduler.
> 
> Isn't that rather architecture dependant?
> It is fine on x86, but on arm incrementing a per-cpu variable is
> significantly expensive.

Last I heard, slow ARM increments of per-CPU variables were to be a
transitory phenomemon.  Plus changes late last year greatly sped up the
per-CPU increment operations.  Plus this change removed some hundreds
of lines of RCU code.

							Thanx, Paul


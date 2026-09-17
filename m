Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D7BC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kimfGEK+WeQrCTnIb5ePzNtWXHK0EcqiD+euMxaQ0do=; b=M2CwI1vzr6ieP1c32LFjMBsPg5
	M0Bf7zqq8SZj4uwmcGEHwWVP8wVcMD4EN8XfW0BcSBFfocYjQiLh5pvJUjT3F28e35FPI+xyOlo+C
	5L4yQWOcJqPKewVlwJAk8cxLTBateUoT8jifp7k/lkJ4pULMBglSqCQdstu/Zdb2bCyXZYP+4Vo5S
	yA6jnjJvHwGyco5/LYtf3U3BoiXS6+nNIEccqmVIMsTrgVqEeXgJ5rN3plAsZV/2eoW8y8NkKsLnK
	/jROasWjnVJZrHaC9juzc/RyviAwmyseROYytWkoSA5aezz538IJKOV/L+qnpp3aSPv3TXUnUEVGH
	B61PL2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FOm-0000000C0pj-0hz1;
	Thu, 17 Sep 2026 16:55:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FOk-0000000C0pK-1qIK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:55:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95F76601EF;
	Thu, 17 Sep 2026 16:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EB21F00893;
	Thu, 17 Sep 2026 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789664145;
	bh=kimfGEK+WeQrCTnIb5ePzNtWXHK0EcqiD+euMxaQ0do=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=T9OE8qLzP1qfh6XFbx+1FEoAjXMXA5nopSdvlfyoaHtqeRG7yuIX6hvGsZ2fZDZHC
	 LlZHivU+VHSNOyLlTJD9LcDm74HSY0oBYS6V98tfaqWPsGPg0x3pT212aZxB1cTj2h
	 H5i+iwmISzuUJTFqG0ROiZDclaI7Dsm5HDgAJBJ1MUlStbHa5H1eEUO5Q0pdnLLmRn
	 bfDIUKXG/xV9fr8ZZBBKeo2cOSk+IR2Blsw1i4L2ofdwxlH5VeRL80zT4LC59Fh7Zv
	 2QJ/t3AdkTEG0yssMOFKDF+buK2RR78k+s/SfH4SFxaON89u5sImLoK7VX3+tMuq4b
	 4hANaNhRy05TA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0461BCE1716; Thu, 17 Sep 2026 09:55:45 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:55:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
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
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation
 for reader-marked trampolines
Message-ID: <5734196a-22ab-428e-9565-d7ba787d3eb1@paulmck-laptop>
References: <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
 <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
 <aqq0cwvRDsorGwgc@localhost.localdomain>
 <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
 <aqvZwfUVsiEI7q7y@localhost.localdomain>
 <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
 <c51591e0e96c837bcd762c207e5e1869.josef@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c51591e0e96c837bcd762c207e5e1869.josef@toxicpanda.com>
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

On Thu, Sep 17, 2026 at 04:35:19PM +0000, Josef Bacik wrote:
> On Thu, 17 Sep 2026 08:40:10 -0700, Paul E. McKenney wrote:
> > On Thu, Sep 17, 2026 at 02:14:57PM +0200, Frederic Weisbecker wrote:
> > > You're right. So we'll indeed need to reuse the deferred qs points here.
> >
> > Except this is getting a bit involved.
> >
> > Don't get me wrong, if Josef is happy to take this on, far be it from me
> > to stand in his way.  But if not, we should be willing to treat this
> > optimization as a follow-on effort, whether by Josef or someone else.
> 
> Follow-on works for me. For what it's worth 03/13 is already fairly
> close to what Frederic describes, just outside the core flavor: no
> task-list scan (the GP waits per CPU for a pass through __schedule() or
> an EQS), the irq-exit preemption path checks the interrupted IP and
> queues the task as a holdout before the switch, and the holdout is keyed
> on where the task was interrupted so nothing is needed from the
> trampoline tail. Moving that IP check into the tick / rcu_exp_handler() /
> deferred-QS paths and reusing the blocked-tasks list is something I'm
> happy to look at once this has settled.
> 
> v4 will pick up Alexei's ask (reader emitted by the BPF JIT around the
> fentry and fexit regions rather than in the glue) and the idle-CPU hole
> Sashiko found.

Even better!  ;-)

							Thanx, Paul


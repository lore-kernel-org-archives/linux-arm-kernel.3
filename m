Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4674C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV93ETFkrqs3pTKrkdQXX0D434rl02bBD6bSk/+peHA=; b=yCGBea8IfNI0A3zSj0X6sQXdL3
	7w6XynmP9fEy2yx2sPfAastNgDBowOFe+kuN0Z3Wm+eADLNizxW7zCzzxT3yrJAlTG7DdOz7UrAZS
	kACc+UvXin7VrxH62NIMWy61ZLptYgzB4vwFYFu9a6aD4hAzkMDrQtwuxQL2YALuf+ruNtjx1M3u5
	zgdJGZgnCzi6yiIoovLTTCcVEn7nBJshSKO3aeMT+M6JCLGKRX7oaxR6jWVYyChzsWIUPFZoxXYHY
	5mGaimPwoUgXJMNL1GtCoD5QujvC8hDWJ9gmqNC62EcQkQyv/s/8aa3Zmj8jjRzYl1NG8ZGmkyy1h
	MhDNDUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnGV-00000003JIc-3nWD;
	Tue, 11 Feb 2025 10:13:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnF7-00000003J59-139I
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 10:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PV93ETFkrqs3pTKrkdQXX0D434rl02bBD6bSk/+peHA=; b=miRlq9mP3oLnwBVm41ESdv4Rd/
	uLSFj20mx7H3po/BbLLy045i2QiQicSnht6rNCCLUol9u0EFRy9v+eYbRgwyrFPhr13vqyHLynlrl
	BKVzen+RSPUkikZejJclhIdJV3TrMutvu65yG9+nJG6SS2FZAC1Ni6H7Mqpb1UFYqeMqN2TjLyaLF
	zid52R8Famn3Gg8THdDiUdg58NUi8MquONAcc6yT6P0x6ieejo4UrVmtKVbwJcvGq44xxYyywbSvk
	p1rHFEfzsYnyApJi+s1VJs1ERxXb53ptPPkXNwKqqAYdMX1O7XrCAgUN+KmdTlwXGUHBbI85Ga1X1
	n3LbfjiQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thnF4-00000000voA-3zf4;
	Tue, 11 Feb 2025 10:11:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6293A3004AF; Tue, 11 Feb 2025 11:11:46 +0100 (CET)
Date: Tue, 11 Feb 2025 11:11:46 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Kernel Team <kernel-team@meta.com>
Subject: Re: [PATCH bpf-next v2 07/26] rqspinlock: Add support for timeouts
Message-ID: <20250211101146.GB29593@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
 <20250206105435.2159977-8-memxor@gmail.com>
 <20250210095607.GH10324@noisy.programming.kicks-ass.net>
 <CAADnVQKefT6iQVQ66QTCeRCMs_am4cC3pBt1Ym1fxfeeQVDDWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQKefT6iQVQ66QTCeRCMs_am4cC3pBt1Ym1fxfeeQVDDWA@mail.gmail.com>
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

On Mon, Feb 10, 2025 at 08:55:56PM -0800, Alexei Starovoitov wrote:
> On Mon, Feb 10, 2025 at 1:56 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Feb 06, 2025 at 02:54:15AM -0800, Kumar Kartikeya Dwivedi wrote:
> > > @@ -68,6 +71,44 @@
> > >
> > >  #include "mcs_spinlock.h"
> > >
> > > +struct rqspinlock_timeout {
> > > +     u64 timeout_end;
> > > +     u64 duration;
> > > +     u16 spin;
> > > +};
> > > +
> > > +static noinline int check_timeout(struct rqspinlock_timeout *ts)
> > > +{
> > > +     u64 time = ktime_get_mono_fast_ns();
> >
> > This is only sane if you have a TSC clocksource. If you ever manage to
> > hit the HPET fallback, you're *really* sad.
> 
> ktime_get_mono_fast_ns() is the best NMI safe time source we're aware of.
> perf, rcu, even hardlockup detector are using it.

perf is primarily using local_clock(), as is the scheduler.



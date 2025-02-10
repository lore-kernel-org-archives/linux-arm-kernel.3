Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418FEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0wPUHmZjIrRfM0ZgTZXmcA69jfXxoml1nbssdgLHCs=; b=44j7iWfGgjYNzy8iUmWo2cF5Px
	CZ88suVjwveUJk/5eosajzw+kg4Z/RP0bChIYqsgtiYtmL5bW4y0slZ2qmGz8J6hxch8sET4ySTu8
	p4SCl0OvoAAZ50y9phWwXmXQaW/XFjU1IeyTTUM1sBch1R+K8CkbHuQlns+V0cCpnLZHW91N69G21
	aCylusl+6hpS9nY5kPkaTdd0tnei5T5xWgGpmkjIzT3THzMr5iDFhdV5vigrd+jLbi5x06KvLnlEz
	gU8teIXSVtZa3NfOM+Ib7tnypWEWscsZA7SJ0mUMlTStcqHQFRlPNl00PcZoqiXJ30AsiBCINrj1G
	D5DSDaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQi4-0000000GwAl-2dhj;
	Mon, 10 Feb 2025 10:08:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQdL-0000000Guuo-2oYW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 10:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O0wPUHmZjIrRfM0ZgTZXmcA69jfXxoml1nbssdgLHCs=; b=K8XBpdDuiRODbexqwMX9pNYznz
	hULWHzlk8AlRFXXw69F0usCa6fxq5n35WcWIqmBvZnvD8nnXC0pbvcTrsVkoM6Fb5tJZnV47Jt8EL
	AIjtl0i2cK43NSQJmJC46mDcY5SjkrPcudRVuN5oYaccBKRxEnGYAf9BEQq4VnuiCBD/Io8uiwz6e
	QCL1xbjt0O3zyEzGuInfSU6OMcPrbjEMkwl5x6Ob9WPCuw9YsjVpLIdIIEhYbheILuDu9jeqa6MoL
	BX7P4JyGddLA1BHyBEjQTE/Cpzskv75SfF2rkb5gyHcu8fMqyew4h3vTyNn7CVBYxjy0wqpSJMfS2
	Noyh+HEw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thQdI-0000000FUSp-23kB;
	Mon, 10 Feb 2025 10:03:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 173AA3002E5; Mon, 10 Feb 2025 11:03:16 +0100 (CET)
Date: Mon, 10 Feb 2025 11:03:16 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 17/26] rqspinlock: Hardcode cond_acquire
 loops to asm-generic implementation
Message-ID: <20250210100316.GD31462@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
 <20250206105435.2159977-18-memxor@gmail.com>
 <20250210095324.GG10324@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210095324.GG10324@noisy.programming.kicks-ass.net>
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

On Mon, Feb 10, 2025 at 10:53:25AM +0100, Peter Zijlstra wrote:
> On Thu, Feb 06, 2025 at 02:54:25AM -0800, Kumar Kartikeya Dwivedi wrote:
> > Currently, for rqspinlock usage, the implementation of
> > smp_cond_load_acquire (and thus, atomic_cond_read_acquire) are
> > susceptible to stalls on arm64, because they do not guarantee that the
> > conditional expression will be repeatedly invoked if the address being
> > loaded from is not written to by other CPUs. When support for
> > event-streams is absent (which unblocks stuck WFE-based loops every
> > ~100us), we may end up being stuck forever.
> > 
> > This causes a problem for us, as we need to repeatedly invoke the
> > RES_CHECK_TIMEOUT in the spin loop to break out when the timeout
> > expires.
> > 
> > Hardcode the implementation to the asm-generic version in rqspinlock.c
> > until support for smp_cond_load_acquire_timewait [0] lands upstream.
> > 
> 
> *sigh*.. this patch should go *before* patch 8. As is that's still
> horribly broken and I was WTF-ing because your 0/n changelog said you
> fixed it.

And since you're doing local copies of things, why not take a lobal copy
of the smp_cond_load_acquire_timewait() thing?


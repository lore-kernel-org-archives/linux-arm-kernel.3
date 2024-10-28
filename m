Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB13AD3398D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5Wb81OCWchBd8SPc092S/wRHWxzD42JXfq1wj683YE=; b=vkNXjUgTrkTJCKUiGxpTmnt4UO
	ubbGcBHO4rILTvUTV9fbRpQ3kqp+zyZ0beruhSraCvH5Tdjop1jSEjNVnuk68f1vQMj5LjtYjqCAI
	YpzlGRSZRVHDHNM8dy8/yS1kLED+80w8fLwgJKcgX3xI1FR3+iaZvypVQDoh+tv61J02G9z6EI/kg
	8+8CydOANnzMB0qRzuNTR8kIjpIE7YS5cJ5darrx2O9qvIZZPWDXEqenuVEivDTK8kscyCann8MOg
	zTu5zC3z04bBQ4CAI5o4A36furIpXIZ0pXaGvKO14SgAAVbJtbdEjj3uqziV/v9lT50w2h5fzfIgu
	dfX5Y6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QiI-0000000B7Va-3meA;
	Mon, 28 Oct 2024 14:27:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QSC-0000000B3fA-2Yba
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 471335C4251;
	Mon, 28 Oct 2024 14:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67F6C4CEC3;
	Mon, 28 Oct 2024 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730124643;
	bh=UOyycE1D7kC/7syiC7gLva+nUvimfyrJhVci/Klvmwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=letOBCsLztxv7UCD3XJKGDi7cTdMqeJTGtS+t30wGG7u2sNrOjFZIozVUe3TPE6nh
	 ADe77XWlYc/slaPb1vm9mNmMbrF+rcEgTE0uOLVlu+7chTisdoWdZXDY72nJXWrdlQ
	 KfLaFHJhrUO5VDtj85QZR85bXz+NNwqAIDf76mVTdnPylLZf0z8c6DCQi9/7A+6KX+
	 uyau4g2alEkwFItib62BUjyvzk8hNt5DL05ZiDRnlX/+8cNoVbzKA7oCLHU5TLjQ00
	 VBd2TOQrwFySRiWneU5P/pw4VG6DkVE2R9A2Be4y1AysQS4rgdCbwxU7uZYaOgMrIm
	 +gVR9X0EBVplA==
Date: Mon, 28 Oct 2024 14:10:37 +0000
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v3] Avoid memory barrier in read_seqcount() through load
 acquire
Message-ID: <20241028141036.GA2008@willie-the-truck>
References: <20240912-seq_optimize-v3-1-8ee25e04dffa@gentwo.org>
 <20240917071246.GA27290@willie-the-truck>
 <4b546151-d5e1-22a3-a6d5-167a82c5724d@gentwo.org>
 <CAHk-=wgw3UErQuBuUOOfjzejGek6Cao1sSW4AosR9WPZ1dfyZg@mail.gmail.com>
 <CAHk-=wjdOX0t45a7aHerVPv_WBM3AmMi3sEp8xb19jpLFnk0dA@mail.gmail.com>
 <20241023194543.GD11151@noisy.programming.kicks-ass.net>
 <CAHk-=wi=Ji6-xi32167i3M1JL_YyRj6tgUAJS=YQ94GKzMBvkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi=Ji6-xi32167i3M1JL_YyRj6tgUAJS=YQ94GKzMBvkg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_071044_803859_4BF823D2 
X-CRM114-Status: GOOD (  23.40  )
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

On Wed, Oct 23, 2024 at 01:34:16PM -0700, Linus Torvalds wrote:
> On Wed, 23 Oct 2024 at 12:45, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Do we want to do the complementing patch and make write_seqcount_end()
> > use smp_store_release() ?
> >
> > I think at least ARM (the 32bit thing) has wmb but uses mb for
> > store_release. But I also think I don't really care about that.
> 
> So unlike the "acquire vs rmb", there are architectures where "wmb" is
> noticeably cheaper than a "store release".
> 
> Just as an example, on alpha, a "store release" is a full memory
> barrier followed by the store, because it needs to serialize previous
> loads too. But wmp_wmb() is lightweight.
> 
> Typically in traditional (pre acquire/release) architectures "wmb"
> only ordered the CPU write queues, so "wmb" has always been cheap
> pretty much everywhere.
> 
> And I *suspect* that alpha isn't the outlier in having a much cheaper
> wmb than store-release.
> 
> But yeah, it's kind of ugly how we now have three completely different
> orderings for seqcounts:
> 
>  - the initial load is done with the smp_read_acquire
> 
>  - the final load (the "retry") is done with a smp_rmb (because an
> acquire orders _subsequent_ loads, not the ones inside the lock: we'd
> actually want a "smp_load_release()", but such a thing doesn't exist)
> 
>  - the writer side uses smp_wmb
> 
> (and arguably there's a fourth pattern: the latching cases uses double
> smp_wmb, because it orders the sequence count wrt both preceding and
> subsequent stores)
> 
> Anyway, obviously on x86 (and s390) none of this matters.
> 
> On arm64, I _suspect_ they are mostly the same, but it's going to be
> very microarchitecture-dependent. Neither should be expensive, but wmb
> really is a fundamentally lightweight operation.

I agree here. An STLR additionally orders PO-prior loads on arm64, so
I'd stick with the wmb().

Will


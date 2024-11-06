Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189E8D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHhlvkY8UlSzLnmAPPPFJYM+1mV9xaApz1N9IxO+X3E=; b=0MNlH++BrvAklhnUsconYMhBU4
	myCSoON6uxm+o1jJcU4zzeWqu7E1g15zJpmkamzSgCcrLHA37jLs2YxKjbmOxZlNRSrY6BjvCTf1b
	3iiT5Iz3BBn1FTq3P6Q8eWDFkadYymuDL0fPTou3yKrwKoZU9No0afb7GiIucW609aHpJewLGy45H
	AXfxgfE3tUfmmvJnfqiRTkFRy4afaHH0HeCLFwXJDAdfZnIwu4c8pSkP4tsSHQr3zXI7k/ou/sUgQ
	+YGvusB+Fhmwlcc9OYaQImPJN7U0xCgr7g13jZeRAk8EpNw4oQHgnoWxL01wZUcY/4SXSdTfgWiMz
	Z9tNUBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ec5-000000031Zz-21Wr;
	Wed, 06 Nov 2024 11:54:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8drP-00000002s4O-0i2L
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Nov 2024 11:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KHhlvkY8UlSzLnmAPPPFJYM+1mV9xaApz1N9IxO+X3E=; b=YYc5yukyNei5Uqg2meExPOJ1cv
	4/f75h4eVieapeaztoHVEuXr6JM6ZSh3S95Iiz0oH29FJR5dNlaftCulT51z+1KKUMbX2j7lVKXOi
	fYN8I7PAKZgVQdUYlkqbHjowT6i1HBz0lEpO7N59D4wzQSOHJf15Z0/h/gQrEe9/MATutq/npDHO4
	BpqRuiztCUgxSok5E0he8kysi3woj0V0vqAhbDvc9QHVeOgUp0+132q3n16FwiruXa2FLQBnsAm2Y
	fRJ7oUjdqvbHU0OyKMhw7qv5bMoVeQdp4RSjS9OxVMs62DwKgLL81/9xylcyLEC3ruN/DXUG6obDO
	eCsXzMnA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t8drK-0000000BwK8-1Hm8;
	Wed, 06 Nov 2024 11:05:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 809ED300478; Wed,  6 Nov 2024 12:05:57 +0100 (CET)
Date: Wed, 6 Nov 2024 12:05:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
	bpf <bpf@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Liao Chang <liaochang1@huawei.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"linux-perf-use." <linux-perf-users@vger.kernel.org>,
	Kernel Team <kernel-team@meta.com>
Subject: Re: The state of uprobes work and logistics
Message-ID: <20241106110557.GY33184@noisy.programming.kicks-ass.net>
References: <CAEf4BzarhiBHAQXECJzP5e-z0fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com>
 <ZyH_fWNeL3XYNEH1@krava>
 <CAEf4BzZTTuBdCT2Qe=n7gqhf3yENZwHYUdsrQP9WfaEC4C35rw@mail.gmail.com>
 <20241106104639.GL10375@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106104639.GL10375@noisy.programming.kicks-ass.net>
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

On Wed, Nov 06, 2024 at 11:46:39AM +0100, Peter Zijlstra wrote:
> On Tue, Nov 05, 2024 at 06:11:07PM -0800, Andrii Nakryiko wrote:
> > On Wed, Oct 30, 2024 at 2:42 AM Jiri Olsa <olsajiri@gmail.com> wrote:
> > >
> > > On Wed, Oct 16, 2024 at 12:35:21PM -0700, Andrii Nakryiko wrote:
> > >
> > > SNIP
> > >
> > > >   - Jiri Olsa's uprobe "session" support ([5]). This is less
> > > > performance focused, but important functionality by itself. But I'm
> > > > calling this out here because the first two patches are pure uprobe
> > > > internal changes, and I believe they should go into tip/perf/core to
> > > > avoid conflicts with the rest of pending uprobe changes.
> > > >
> > > > Peter, do you mind applying those two and creating a stable tag for
> > > > bpf-next to pull? We'll apply the rest of Jiri's series to
> > > > bpf-next/master.
> > >
> > >
> > > Hi Ingo,
> > > there's uprobe session support change that already landed in tip tree,
> > > but we have bpf related changes that need to go in through bpf-next tree
> > >
> > > could you please create the stable tag that we could pull to bpf-next/master
> > > and apply the rest of the uprobe session changes in there?
> > 
> > Ping. We (BPF) are blocked on this, we can't apply Jiri's uprobe
> > session series ([0]), until we merge two of his patches that landed
> > into perf/core. Can we please get a stable tag which we can use to
> > pull perf/core's patches into bpf-next/master?
> 
> The whole tip/perf/core should be stable, but let me try and figure out
> how git tags work.. might as well read a man-page today.

I might have managed to create a perf-core-for-bpf-next tag, but I'm not
sure I know enough about git to even test it.

Let me know..


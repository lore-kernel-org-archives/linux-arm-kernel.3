Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151B1CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOG3vjg48Y2OExGcsPJnnxcSdeHB4GZLcBDULwcpd+s=; b=mMVoIseuRbV0sAi4rN9XXdEnBq
	CQ2n2yd2LiWEXpx1qe1532N0z3yE8TBhb/kH6TvEiN0yB4q8FmGlGYSiEQSToboKmdPMB3H4bw7qP
	1+OeX1ssz45NRH3XW87gFd5lb/6EQDWHwGTHuosLz/STnvRbnEDTlWQdt8K0RASdhMTcksfKiQlYk
	NSEchzpDtBbgrGwjC63WmCWgzLPpboXUo3+uQEre7ozg7lmI2/gMsLDFk3V2MITp/gCH5fDr6Kb07
	XaslKUz6BLsM66o35/ffvcNJ97xleX0adL8MfZnIZIniZsQ+90skAoxY07KjJTu8w4G3nBmA5ZS5e
	rk57jT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLGc-00000001nIe-2M0m;
	Tue, 19 May 2026 14:17:54 +0000
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLGV-00000001nH3-2Vp1;
	Tue, 19 May 2026 14:17:47 +0000
Date: Tue, 19 May 2026 10:17:34 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, vbabka@kernel.org, rppt@kernel.org, 
	mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, 
	chentao@kylinos.cn, lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
References: <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
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

On 26/05/19 05:14AM, Barry Song wrote:
> On Tue, May 19, 2026 at 3:57 AM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Mon, May 18, 2026 at 4:26 AM Barry Song <baohua@kernel.org> wrote:
> > >
> > > On Mon, May 18, 2026 at 5:47 PM Lorenzo Stoakes <ljs@kernel.org> wrote:
> > > >
> > > > On Sun, May 17, 2026 at 04:45:15PM +0800, Barry Song wrote:
> [...]
> > >
> > > I think we either need to fix `fork()`, or keep the current
> > > behavior of dropping the VMA lock before performing I/O.
> >
> > I see. So, this problem arises from the fact that we are changing the
> > pagefaults requiring I/O operation to hold VMA lock...
> > And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> > is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> > anonymous and COW VMAs only while holding mmap_write_lock, preventing
> > any VMA modification. On the surface, that looks ok to me but I might
> > be missing some corner cases. If nobody sees any obvious issues, I
> > think it's worth a try.

From Barry's description, I think what he is saying is that the vma
locking has caused the mmap_lock to become unfair?  I think what is
implied is that the per-vma locking may stall mmap_lock writes for
longer than if the mmap_lock was taken in read mode?  Barry, is that
correct?

Since Android is doing something (according to Barry) that should not be
done (according to Willy), both of these together are causing slow down?

> 
> Thanks. Besides the creation of processes via fork(), I
> am also beginning to worry about the death of processes.
> 
> One thing that came to my mind this morning
> is that when lowmemorykiller decides to kill an app, we
> want the memory to be released as quickly as possible so
> the new app or user scenario can get memory sooner.
> 
> In that case, if the app being killed is performing I/O
> while holding the VMA lock, the unmapping procedure
> could end up being blocked as well.
> 
> If we release the VMA lock as we currently do, we allow
> process exit to proceed.
> 
> I haven't thought it through very clearly yet, and I
> may be wrong. I'd like to do more investigation. I hope
> the apps being killed stay very still, but who knows—we
> have so many applications in the market.
> 
> Meanwhile, if you have any comments regarding the death
> of processes, they would be very welcome.

The oom killer only cleans out anon/not shared vmas [1].  So, what this
would hold up would be the actual process exit path.  Although that
would have resources associated with it, the amount of resources should
be relatively low compared to the amount freed by the oom reaper, right?

The other entry point that's mostly to do with android,
process_mrelease() [2] will end up in the same  __oom_reap_task_mm()
function.

So, for the most part, the memory will be freed while the file backed
vma completes IO and that sounds like the right thing to do anyways.

Thanks,
Liam

[1]. https://elixir.bootlin.com/linux/v7.1-rc4/source/mm/oom_kill.c#L547
[2]. https://elixir.bootlin.com/linux/v6.18.6/source/mm/oom_kill.c#L1210



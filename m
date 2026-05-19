Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F315CCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tEY/ViETcYWqMbew+LgZ2oRYOW85rqGc3tYxA7i0ak=; b=o4dvb3wk5u59uy7FuLiRQjElLM
	ZIQrXP5v7kZsVfpIDjmxywq9QRegW694UPYhX1rNJFFVd5qp5J0ZmhljSXi9XjHEdyq7XhJG8jN6Y
	2qbepqAbl/z8U1sbQAYc1vYN99MFDeDGMHgGNnHCZ5HaboYSJGwn60fjBiZr+4O7hNAIm81RlCgEU
	ezuOSaFsxsUrChWaZom4lp/AwNRjvXL7EhRQTH5sowJRlgez+HhXxX2cy41/xLiyGYXzf56qcUyNZ
	wQNZrady9QzzL5BVn6MKPnmSTZiQ498T2dFZUv4vQJrD1gtHmFdYp0yJ1e9lPwEVM4P2IdapLl7ES
	Kpv3jgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJpg-00000001Wb5-2kMF;
	Tue, 19 May 2026 12:46:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJpd-00000001WaS-3KSP;
	Tue, 19 May 2026 12:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 070F240267;
	Tue, 19 May 2026 12:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B010C2BCB8;
	Tue, 19 May 2026 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779194756;
	bh=0tEY/ViETcYWqMbew+LgZ2oRYOW85rqGc3tYxA7i0ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfLpklXMkKT1W9LjHbc6orFesNSR/WYbThmN3RY3KQ+Sj526oZ9knAqWz1hOSb2V8
	 dNS1B12b6zt9T5UOXQ1nrMbNWtECIR2msv6pUBdn/ZjxEPvXzm8/CRvLKqnqCU51sq
	 haxA77qodnAWypw1XScQZfjJLKwh9FciR3mqwcEzxbVxwnrLWlqLfHqEPk5J3o8Cmy
	 0Wlh1tz1PaNb1cIMkhcRqDoftNLeYh74seeYdw4fbd1+VoscIEyfDFSquLrWTQHUK9
	 L8E52Y782Q8/1j6v9de5qhI08YuU7rlNh8jgJpwnmYyrNumFGmR+cEYpT6UhTkfXca
	 +brOZETnCxkNA==
Date: Tue, 19 May 2026 13:45:46 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <agxbJHfa6J2UAtSf@lucifer>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_054557_871614_0E5716BC 
X-CRM114-Status: GOOD (  25.67  )
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

On Tue, May 19, 2026 at 05:14:45AM +0800, Barry Song wrote:
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
> >
>
> Thanks. Besides the creation of processes via fork(), I
> am also beginning to worry about the death of processes.
>
> One thing that came to my mind this morning
> is that when lowmemorykiller decides to kill an app, we

What's the lowmemorykiller? :P you mean the OOM killer?

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

Yeah let's tread very carefully please, you're picking two of the most fraught
areas of mm, I'm not going to want to see changes there unless they're
substantially more convincingly argued.

>
> Meanwhile, if you have any comments regarding the death
> of processes, they would be very welcome.

As above, leave it alone please :)

>
> Best Regards
> Barry

Thanks, Lorenzo


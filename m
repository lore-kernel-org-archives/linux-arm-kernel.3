Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DD0CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smo6PG71gks5CdB+S9N8OQcbl9Tnm001jvZXKeMS2ow=; b=GmsL+PsDPwxDSppx8HfjciDivG
	fhLqTXGXEPQGvvGiYAvvlZb8EDkGwCXqKjZz8WrcXxQ71iEz6H5CXvQY0Miqh+Evbj29yo2OwE1sP
	pbswMSrhUivbvHcUz466jZEigJiNA4N21xV0zqtY0w9/yaY0Hp8hOyTqal4Dq7GLLWdR39O2CXIaV
	aBZjL8zOmh2atKHG+Nh8WgtjQkMqMG7BXiIyzLWnXLRKPZf8a/9K6rD9mOnHhh5YyuabGplWV+b7k
	ymACD6ZmWUB6NDjWksM3lMfisTDL+/QSdhbk7/5hBPUzZvlrWleKb1TfEpqYS/FEIzH+QYXCYT4RP
	SUpJCKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRqG-00000002p0s-0fPG;
	Tue, 19 May 2026 21:19:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRqE-00000002p0L-3gDU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 21:19:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6E6960258
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 21:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8161F0089B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779225545;
	bh=smo6PG71gks5CdB+S9N8OQcbl9Tnm001jvZXKeMS2ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IuJhnnCs9B9YmsKmO6m3+Qhj4z5T6+OeMhTdQehdO4b+N2yxZ83/r9ANCYX0Tb1gw
	 DMyMD1bSvprYJ53QJhpWIZp0zflRYn3U8y52c/3W7wyU+vTXkGSvxapMxD8ZMFoVrc
	 j81p9X/NkxkhnK4vwIaVlAOuf+pLyT9aF9yygdR/2/hANkFwQFOFO4wDZEIidDDq9R
	 uA6CZqNER3t3OhIApelv4GoVAkcKHuoy9ZaUjDwUGarkWsSPmhbSSWSXLZP+neWk8q
	 Uc/3dypd996tr7HIMcfSCcSuCTMwIefm47+tzU4EQvXFpy6MvKpcLMGnWevG8Go+EQ
	 PuMTrRLgsb6EQ==
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50fb1ad3734so55282091cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 14:19:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+NK8cf8o142w9ahbmGBCUzwaU+NY+l2c5fhFq3WPPD+GEgJI0dHORqD5rPlBJ/0vwLGN+BJ5Mcg1oR0h8AeJzG@lists.infradead.org
X-Gm-Message-State: AOJu0YyXD483RARTdzFvjcZEwqDFkFk1satp4D7PsBQibDiUSjWEbLdq
	x2ulLwm+Gggat4R2JUEfhvNi1OAyG+OiEh4jiRA0pU0xEjnvUEpwKGrbTps6yUbZQlNul+SEk+u
	3jSmtsQ0hVxtYRi5bs3d2QMibt+gm43A=
X-Received: by 2002:a05:622a:8599:b0:50e:32cd:52fa with SMTP id
 d75a77b69052e-5164155aed1mr241957021cf.3.1779225544934; Tue, 19 May 2026
 14:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com> <agxbq1TxJdniMQT3@lucifer>
In-Reply-To: <agxbq1TxJdniMQT3@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Wed, 20 May 2026 05:18:52 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
X-Gm-Features: AVHnY4J8Vo_CuCIfUx0l4iAJBGF2Iz4ZMOGZd3FV7sXmKyNFMh0JMXgCJ8QhKkw
Message-ID: <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, May 19, 2026 at 8:53=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:
>
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
>
> Not sure if you noticed but I did raise concerns ;)
>
> I wonder if you've confused the fault path and fork here, as I think Barr=
y has
> been a little unclear on that.

I think I=E2=80=99ve been absolutely clear :-)
We should either stick to the current behavior - drop
the VMA lock before doing I/O, or change fork() so that it
does not wait on vma_start_write().

Before per-VMA locks, page faults dropped mmap_lock before
doing I/O. After per-VMA locks, page faults dropped the
VMA lock before doing I/O. In both cases, fork() would not
wait for I/O in the page-fault path.

Now you guys are suggesting performing I/O while holding
the VMA lock, which means fork() must wait for that I/O to
complete. Since an application can have more than 1000
VMAs, and I/O can be stalled for an unpredictable amount
of time in the bio/request queue or filesystem GC, fork()
could end up blocked on multiple VMAs while taking
vma_start_write() for each of them.

As a result, fork() could hold mmap_lock for a very, very,
very long time. fork() itself would become extremely slow,
and any other task needing mmap_lock would also be blocked
behind it.

>
> What's being suggested in this thread is to fundamentally change fork beh=
aviour
> so it's different from the entire history of the kernel (or - presumably =
- at
> least recent history :) and permit concurrent page faults to occur on a f=
orking
> process.
>
> I absolutely object to this for being pretty crazy. I mean I'm not sure w=
e
> really want to be simultaneously modifying page tables while invoking
> copy_page_range()? No?

If you object to touching fork(), can you at least accept
keeping the existing behavior of dropping the VMA lock
before doing I/O? If you object to both approaches, then I
really do not know how we can continue :-)

Thanks
Barry


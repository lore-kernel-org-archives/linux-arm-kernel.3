Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7053ACD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNZRK1xzyieW295ShspfGtTk8+AaEYUV8qNPdWcyUvs=; b=pWN1hww/65WQ71/mnPbcsDRLh5
	iSY6o/7OUfrcecFROF0a0P+b3B/3MfLI7tKCFDmf4Dqk3hYEkkOScGnwrEecl4RtWXc4p+Q9GNDI3
	HgxbH72DfPKRKCYgtsnMGdsOtxK4B0n24B7LZzRrCIJqkT77u0Etjy8iacL8NSsJCbsSxhF5xsqhZ
	P5oaWJwMLRKZDTlG7aLzPsCtGQqWGtiPVhunDbgjHgV2B/zRHz5qlVL6F6oZ6Wi1DFl6ob7K3iQ4C
	AhE/kjQU/29vnlQUZLoTaVASqegzVD6X47pfNfyNG1BZNKiAV+XqRliyJ+B7GEDRqXJ7YdLGCtgP8
	vmiSdqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJu6B-0000000DPLS-1TqF;
	Mon, 04 May 2026 14:16:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJu68-0000000DPJt-0g97
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:16:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D40344442C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 14:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D71C2BCFA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777904195;
	bh=dnulhm1JTuoUEhQzuO1u5rEt0FwJiLQjQxWn1rCEVQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EEZJoSA2+V1bS9N6/kBUrA73Kbqtv4rr5pK0ImtIEOP8hp3g/Pxpx3OB5nfBWsQkk
	 JTEXv4tAWXlTHtQj1YfWReoHeA2fuK78sq+jKA9LGBnAV9zfafUmGPkGTDF2a+XBKT
	 +Uj7+VoYbC8HwONiur8ukdewMwXCdtwSsCNlaLtM2b4MGnkCWPqRP3SJjZikftuCaL
	 Zml9OhkupD9qECWzXBsF54LDbks60MTExeOShwnCEz7JpZgbYDjwAIhw4paXPT+PST
	 uFaAxYZBh+fDrl8m4NnNjoZ/ehcrAwyzSNeHoJPSGdvmnM+nA216iRM7s/dgE18WlP
	 U21yQQlu9E1CA==
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8acb3dab8dfso33512066d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 07:16:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+qHLs89YDRvjgeE7ow6KpXt7W0/yyLzlxu/dwOkgneT52Kb4lNIXJf5qVI18tX55sGxTXbeghtpFsZCcjsyVi@lists.infradead.org
X-Gm-Message-State: AOJu0YySAhkc2ejBjt6616VowColK8/oAAVzquhap13G73qhz9QCLZcU
	0Glp8V/pWctPCqcKjryQfG0+HC0rvYhbgCHECHMAHZF4pr9+viTBGhMBUC9D5H6ZJxS4vzFtrfq
	9U0ZgcI4/pSgN9DOhvy4ZeCCadiFAGO8=
X-Received: by 2002:a05:6214:27c3:b0:8a4:db54:b3a4 with SMTP id
 6a1803df08f44-8b665d1127bmr158681076d6.7.1777904164104; Mon, 04 May 2026
 07:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
 <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com> <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
In-Reply-To: <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
From: Barry Song <baohua@kernel.org>
Date: Mon, 4 May 2026 22:15:52 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xM8W5NHB4J2c1dVyXhu9SHAK_iiVZPAtH0fMvJoz77ww@mail.gmail.com>
X-Gm-Features: AVHnY4LS13GrbYqayhsefNP68ODiwhwvddGMrFC2vbCyG8eLOAO_PeI0iks995A
Message-ID: <CAGsJ_4xM8W5NHB4J2c1dVyXhu9SHAK_iiVZPAtH0fMvJoz77ww@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_071636_685997_01A98DC7 
X-CRM114-Status: GOOD (  44.23  )
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

On Mon, May 4, 2026 at 9:04=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Mon 04-05-26 03:55:43, Barry Song wrote:
> > On Mon, May 4, 2026 at 2:17=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > > On Fri 01-05-26 18:57:52, Matthew Wilcox wrote:
> > > > On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> > > > > On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@inf=
radead.org> wrote:
> > > > > > On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> > > > > > > 1. There is no deterministic latency for I/O completion. It d=
epends on
> > > > > > > both the hardware and the software stack (bio/request queues =
and the
> > > > > > > block scheduler). Sometimes the latency is short; at other ti=
mes it can
> > > > > > > be quite long. In such cases, a high-priority thread performi=
ng operations
> > > > > > > such as mprotect, unmap, prctl_set_vma, or madvise may be for=
ced to wait
> > > > > > > for an unpredictable amount of time.
> > > > > >
> > > > > > But does that actually happen?  I find it hard to believe that =
thread A
> > > > > > unmaps a VMA while thread B is in the middle of taking a page f=
ault in
> > > > > > that same VMA.  mprotect() and madvise() are more likely to hap=
pen, but
> > > > > > it still seems really unlikely to me.
> > > > >
> > > > > It doesn=E2=80=99t have to involve unmapping or applying mprotect=
 to
> > > > > the entire VMA=E2=80=94just a portion of it is sufficient.
> > > >
> > > > Yes, but that still fails to answer "does this actually happen".  H=
ow much
> > > > performance is all this complexity in the page fault handler buying=
 us?
> > > > If you don't answer this question, I'm just going to go in and rip =
it
> > > > all out.
> > >
> > > I fully agree with you we should verify whether the retry code still =
brings
> > > in real-world advantage today with VMA locks. After all the retry log=
ic has
> > > been introduced in 2010. That being said if there are realistic loads=
 where
> > > one thread needs VMA write lock while another thread is faulting the =
VMA,
> > > then the latencies can be indeed extreme. For example things like cgr=
oup IO
> > > throttling happen on the IO path and thus can throttle IO of a low-pr=
iority
> > > thread for a long time.
> >
> > I=E2=80=99m quite sure that swap-in and VMA writes can occur
> > concurrently, and this is fairly common. For example,
> > Java GC may use mprotect or userfaultfd on a small
> > portion of a large Java heap while other portions are
> > still under do_swap_page().
>
> OK, makes sense.
>
> > If we start exploring different approaches for anon and
> > file, I agree I can revisit this on an Android phone if
> > there is a real, serious case where a file VMA can be
> > written and a page fault occurs at the same time.
> >
> > Please note that, as an Android developer, I am particularly
> > cautious about priority inversion. A recent issue causing
> > severe priority inversion is zram attempting to support
> > preemption[1]. When a task performing compression or
> > decompression is migrated to another CPU and then preempted
> > by other tasks, high-priority tasks waiting on the mutex may
> > be significantly delayed, impacting user experience.
>
> Well, container people are concerned about priority inversion as well. Bu=
t
> usually this is with coarse lock (such as global filesystem locks) but VM=
A
> lock is specific to a task (and a VMA) so there the opportunity for
> priority inversion looks more limited.  But the example with Java where G=
C
> thread can presumably have higher priority than ordinary Java threads is =
an
> interesting one.

A major difference in Android apps is that each thread can
affect user experience differently. And it is not simply a matter
of whether a VMA writer has higher or lower priority than a
page-fault (PF) thread performing I/O.

For example, thread A handles a PF; thread B attempts to
modify the VMA where the PF occurs; thread C tries to modify
another VMA (requiring mmap_lock in write mode) or iterate
VMAs (requiring mmap_lock in read mode). Regardless of
thread B=E2=80=99s priority, it holds mmap_lock in write mode while
waiting for the VMA lock. The usual pattern for a VMA writer
is:

mmap_write_lock()
vma_start_write()

As a result, thread C can be blocked even if it has higher
priority but operates on a different VMA.

In essence, when a PF and a VMA write occur concurrently,
high-priority threads may be blocked even if they operate on
different VMAs, not necessarily the same one.

Thanks
Barry


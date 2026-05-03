Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44611CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 19:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bhFmIB4GpwZzfLoiO6pcKAFE9QNelEpmmS09GV+5aw=; b=PexJUJ1S0ynGsvUkI2EAwNPInB
	6ZPB150k3Z4PPsEFntJKekH+ohPDaHTYcC4X39ZN0vM0L2QdZcmOxTiMxOAhRbVAvkB7/D6DqvVa7
	N9E609+oNuxTzCxBqUnm6K/rUp089QxyJL5g7gBhXuB1o3yZQnfp0ZpvjT6taWV+ggTcN28JStiTY
	6O6WAoaM9xS07ElYgu37qFKQwTZPC/p9FhPIdOK/ewxwxmgwF9sYoJkByUthQeJYF8Q981MsLUyC3
	5aNV4fRir6zcDQroXZ6k6rqfipn2CQspVj9i++iws5bgLo0PLYF8kn43/sOoxryGjd8iGoevimpyB
	+maTxQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcv2-0000000Bcsv-3CFI;
	Sun, 03 May 2026 19:56:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcuz-0000000Bcs0-2qtW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 19:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E2324448D
	for <linux-arm-kernel@lists.infradead.org>; Sun,  3 May 2026 19:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04621C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Sun,  3 May 2026 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777838156;
	bh=q0YQtTiiL7ieGdsHU5xDXtyCdqIQKThOK+46A5C32Gs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cj6v3ho8XQfyMkc2mcbVYz5gbjtO6TpIKfVRIfx39fBfRxlPpTTlEioyCOLKq/Bgy
	 syEeMHuA96cCtRmE0eK4D+1G69rilMXnWX9kM7MhwI3jo7W9szhkO9KRqgHk8t3NpG
	 Sk3ZsOqt3RVBSj0Ov1H0qqwVAM+QK5+tAsEylWo4xrOIvCwv5U7sQEbhIRuIemVE/4
	 YwF1wNxPmlb9Q6Qfxa4ZU5G6rDjOzJvG9Q8TiEcXSO8/EKWQxQ3yEG6s0RNjENWTrl
	 L3LcL6LYySHyCYYSkVHdPFUFAA06rWJJ1VpOBGHtiUfRaNjo+7z55NRH/ZW13KhGO3
	 ukBw+8sSdtS7w==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8d4f78fc9f6so384486985a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 12:55:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8FWPuxREpfzEVjwcS5JoidoPcRD/StzvJLwn6qzsYtCJMOhaYlAx6XM3zr1iDhYSTXAxLRoFKBfV1QAOdrKDBb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/KFpFjWsze68zwicKYlLrjn1k52oDMU7KHojKPeNXwTYAUjyU
	b+j3ABjEe3zs8g7+QF473tv88PjDQ9XH8OhtK/x+0SjDyl3GQzXkNoJk0RjUfSJv2RpUIij5zRg
	f3Af3DjZOLtqUbkHZBBrP7SoHI/tKkAc=
X-Received: by 2002:a05:620a:4706:b0:8ee:f390:8f85 with SMTP id
 af79cd13be357-8fd154fbfdemr1048725085a.3.1777838154653; Sun, 03 May 2026
 12:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
In-Reply-To: <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
From: Barry Song <baohua@kernel.org>
Date: Mon, 4 May 2026 03:55:43 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com>
X-Gm-Features: AVHnY4Ib9xDIPW1tJ1arRI_zR4ugsASIRuQ44tzF-c_n00UjvUcn8YpRrQawfp8
Message-ID: <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260503_125557_768470_C1C6ECF7 
X-CRM114-Status: GOOD (  33.88  )
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

On Mon, May 4, 2026 at 2:17=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Fri 01-05-26 18:57:52, Matthew Wilcox wrote:
> > On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> > > On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@infrade=
ad.org> wrote:
> > > >
> > > > On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> > > > > 1. There is no deterministic latency for I/O completion. It depen=
ds on
> > > > > both the hardware and the software stack (bio/request queues and =
the
> > > > > block scheduler). Sometimes the latency is short; at other times =
it can
> > > > > be quite long. In such cases, a high-priority thread performing o=
perations
> > > > > such as mprotect, unmap, prctl_set_vma, or madvise may be forced =
to wait
> > > > > for an unpredictable amount of time.
> > > >
> > > > But does that actually happen?  I find it hard to believe that thre=
ad A
> > > > unmaps a VMA while thread B is in the middle of taking a page fault=
 in
> > > > that same VMA.  mprotect() and madvise() are more likely to happen,=
 but
> > > > it still seems really unlikely to me.
> > >
> > > It doesn=E2=80=99t have to involve unmapping or applying mprotect to
> > > the entire VMA=E2=80=94just a portion of it is sufficient.
> >
> > Yes, but that still fails to answer "does this actually happen".  How m=
uch
> > performance is all this complexity in the page fault handler buying us?
> > If you don't answer this question, I'm just going to go in and rip it
> > all out.
>
> I fully agree with you we should verify whether the retry code still brin=
gs
> in real-world advantage today with VMA locks. After all the retry logic h=
as
> been introduced in 2010. That being said if there are realistic loads whe=
re
> one thread needs VMA write lock while another thread is faulting the VMA,
> then the latencies can be indeed extreme. For example things like cgroup =
IO
> throttling happen on the IO path and thus can throttle IO of a low-priori=
ty
> thread for a long time.

I=E2=80=99m quite sure that swap-in and VMA writes can occur
concurrently, and this is fairly common. For example,
Java GC may use mprotect or userfaultfd on a small
portion of a large Java heap while other portions are
still under do_swap_page().

If we start exploring different approaches for anon and
file, I agree I can revisit this on an Android phone if
there is a real, serious case where a file VMA can be
written and a page fault occurs at the same time.

Please note that, as an Android developer, I am particularly
cautious about priority inversion. A recent issue causing
severe priority inversion is zram attempting to support
preemption[1]. When a task performing compression or
decompression is migrated to another CPU and then preempted
by other tasks, high-priority tasks waiting on the mutex may
be significantly delayed, impacting user experience.

>
> BTW I'm not sure I quite understand Barry's priority inversion problem
> since I'd expect all threads of a task to generally be treated with the
> same priority...

Exactly not. Maybe these slides[2] and this project[3] can give
you a hint=E2=80=94they aim to standardize things on Linux by
learning from Apple OS. Basically, tasks are classified
into five types:

USER_INTERACTIVE: Requires immediate response.
USER_INITIATED: Tolerates a short delay, but must respond quickly still.
UTILITY: Tolerates long delays, but not prolonged ones.
BACKGROUND: Doesn=E2=80=99t mind prolonged delays.
DEFAULT: System default behavior.

[1] https://lore.kernel.org/linux-mm/20250303022425.285971-3-senozhatsky@ch=
romium.org/
[2] https://lpc.events/event/19/contributions/2089/attachments/1797/3877/Us=
erspace%20Assisted%20Scheduling%20via%20Sched%20QoS.pdf
[3] https://lore.kernel.org/lkml/20260415000910.2h5misvwc45bdumu@airbuntu/

Thanks
Barry


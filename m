Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE5FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 21:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=; b=H3ZrJJeT1AdvNFrrscrxExtn4Z
	O7TVwqtJyd6ZcvCzD8N+9YYpg7cSp1AItWqSHDCfV/Xqgbc4fT35kKyKRwi6/jXDE0HstCW4fd1ro
	QPqqKbVutpdgjtBIcYnKctG0ESidbWhqganT4abEnRout6GOvTWro1u0Iz7Vs09atuA51PxZ/T80s
	cJ5WnkF885h/pc42qFWLwBPqn+bFImbEe+/XH19N4+FhvXkpASdkRNZsZ+uFbmwy7+sJKUrGZ6YZ8
	NXori9DHE6MykKtsd4BsZinXK9WBV8yH5sQz2X46Zfd8LqGdHE/MFBp68FynARHZD37Y3AChbLKz+
	irIaNfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRa6-00000002nOI-1JIG;
	Tue, 19 May 2026 21:02:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRa3-00000002nNO-2kGA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 21:02:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-bd3d7c29b4dso610830466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 14:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779224542; cv=none;
        d=google.com; s=arc-20240605;
        b=ayHorGFOGRI/gfRz9R4Ogs4Q1dj1aWuieyBaBpYLk8g8tTTC35YubvMv0mtPJJUbUm
         l+vN9NUVr31J2/uf8gCjnKgN/buMIusNAKZJ4/fI1739Z2AyHh/0ZGRs+Zy7yqO97kM+
         XKcGTthrYLR8pIXUebmrzEmAOeGkZYJ65LC1AK8y62Lh+8D4P39VIs2JyXhVPgRuJEbA
         d7o1rQnbVknV2N+MI7iwwCOqZs3gRRufuJSUkaShPiqfj37+xXkztL0ff6KSZSeaXbI4
         2WzisQQ9JHJs1TNQ167OVitDShvdIB5NALCUC26HIwZe5EPLBsiyYbs1rh2/7GcQw/Ve
         c1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        fh=w1EE1DmJFY/wafD0jRzB2H/xgF0lsYenNGg4zMSEowM=;
        b=NNxc+9D/QwKw/JnkK6YGP6oGM75LCEhRP2cGTvxl4PgGfMk912kVZPxMpDtKRrJmUz
         r6uZppJW10VkCHoRgU8+yFsyrJbEyRDR/EnsSSxTQZUne1Qf1cTejfE3Ti/YXnK8iIJp
         bC3R+Io+LcVDNp6hx6JGfz4pH7rilBS7/6Z8xQhTIBwFk6mLWvNA72lwlC37O420QY5g
         Etu+ivjVz4qFx3PcT7R0pe98mfgBFR07m1HGQlFKLJqeGOc222JMH7/iy9TTRSQ4U+bW
         MB3efKD39Xz/iP5wcvMgyZB4QLFozOdJRxOR7/tTNOaK7ViwZ4s2tvjSlw0hrqp1F8L/
         HgxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779224542; x=1779829342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        b=l1mEbMj+4SyX8YW5uec1guFTXOaSMjX755UbpZ2u4TtDMenGLGuODsCHN8jB4GHUz3
         AbogcLMDMfX1ZbN2FVQfNZRYLHaJWSvTxM+sjxrct/Qy3hJtybFklal2MggUmzvNxe9R
         phjcsRHr0W6GR8uZb93XNMkKm+BTma0KgeUeKi9NJphtMQ2B5iu9ou8XFk3+4gjtEPNA
         YhYr2uCJL3tPoFu/fGqjvcIzKNjVmtdulkHfyybn2RnsRqUXaZ7UzBommKusI2d+DfQz
         oZDBJWMrtPEVi5++81aMwh+iE0wrbWz2a5yrGK6/MKXpbUlgBQNNH8ebgjZ+pKO8Zx39
         SiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779224542; x=1779829342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        b=YVE/Q6Li+YDRGmP83LuGjj+gMaTXh/sgr/19bfxRlPV7thM9PychXGcD4fN80jeCuR
         Xhb1I0pJeWh+kZHWPiUlDf/yCnWEaKkJlRbQsbScxftk742XFd+Vw8B786Lu81oElmg3
         o4aqB2CXOwM8tubIqw8Z6HrlY7CV3Pdcu+pYyTOdVySZyWoEC4WZpGGXywIhAFapV+4+
         rRzNiBhfI3PFFAj9BRchjlX+t0dMyqxRxEvGLx+FR0DP/8M3/qxOLYaZQ3tPVn+43jDy
         22lSWXqaGyFbh39VPHdTcI/ETQ9ZOxJb7Spf98Z8iMBrrhdJteNGK856oryQtQKrX8QW
         Z7lw==
X-Forwarded-Encrypted: i=1; AFNElJ9wFSviGvmBjZNIFLRwYe0WlgCAHqH1djXN60KJj/t55bQZRD36egWIvzBH4dMP9lbdtQBcW+4CCFcMejeAZYEP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd8HXOO/j6ILjY5qZWe6LspCx9+Cg2ktC+AH3f3I00OFFkVaDE
	hTtj82/nTK28hwD6nySr2UkzV8zKV5yveE1GI+lKpWZ2eusiF114uqvWUTim04YG8NTdU6pf8Ee
	VvWr0/XQMZ76OubEmjNq7ey0SlHDCm7I=
X-Gm-Gg: Acq92OGrrfdC5ikKB+z7TWf6jY0daoRxY2axmsUj6ZM2gdUc9bgKnlvRS85Yv62xImZ
	7PrbnJovA8OH4FcyLGfN/osCy/u+JCNsgnoU4issW8qd2cWkQwjsEugpVGw/INf7pbE4T0X8MWP
	fTb4h+eOGYwE74S/wJSQL4hMT15UEgIe8mSfMFn7b/5RDQFUooGfMn7t9TQfusleDtO8+DEyZfC
	rxTZXYjKHn7ouhjBSW8iQeB9AlFdIxs8zHs1Td/cZHQti7XBsTsPh4lBV2bMe2cGQxQPMYGZ0wk
	yXCAcnxuqoocTWq+fw==
X-Received: by 2002:a17:907:1b1c:b0:bd2:387:6bd with SMTP id
 a640c23a62f3a-bd5177afa91mr920483166b.4.1779224541529; Tue, 19 May 2026
 14:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <agxfLNuLCAT3F4cW@lucifer> <agxnJ8R-G3CRjeTR@lucifer> <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
In-Reply-To: <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 14:02:09 -0700
X-Gm-Features: AVHnY4IdUrtf0zjmci6G1wPksPxXO0JC_jVTm-UIYV_TFA36gqIEv83n9ohB0es
Message-ID: <CAHbLzkrTF7w+T5mGsQuDRuhnTk6evTKBNRcH4oS=nRcUg2zpsg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, surenb@google.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_140223_734625_E998241C 
X-CRM114-Status: GOOD (  55.71  )
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

On Tue, May 19, 2026 at 11:41=E2=80=AFAM Yang Shi <shy828301@gmail.com> wro=
te:
>
> On Tue, May 19, 2026 at 6:39=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> =
wrote:
> >
> > On Tue, May 19, 2026 at 02:12:10PM +0100, Lorenzo Stoakes wrote:
> > > On Mon, May 18, 2026 at 02:21:14PM -0700, Yang Shi wrote:
> > > > Maybe a little bit off topic. This is an interesting idea. It seems
> > > > possible we don't have to take vma write lock unconditionally. IIUC
> > > > the write lock is mainly used to serialize against page fault and
> > > > madvise, right? I got a crazy idea off the top of my head. We may b=
e
> > >
> > > Err no, it serialises against literally any modification or read of a=
ny
> > > characteristic of VMAs.
>
> If I remember correctly, you are not supposed to change VMA
> flags/size/mm pointer/vm_file/pgoff/prot, etc, under read vma lock or
> read mmap_lock.
>
> > >
> > > > able to just take vma write lock iff vma->anon_vma is not NULL.
> > >
> > > Except if we don't take it and vma->anon_vma is NULL, then somebody c=
an
> > > anon_vma_prepare() and change vma->anon_vma midway through a fork and=
 completely
> > > screw up the anon_vma fork hierarchy.
> >
> > correction: this won't happen as per Barry (see - I managed to confuse =
myself
> > here :), since for vma->anon_vma install we take the mmap read lock.
> >
> > BUT we also have to consider other cases.
> >
> > >
> > > So no.
> > >
> > > >
> > > > First of all, write mmap_lock is held, so the vma can't go or be
> > > > changed under us.
> > >
> > > vma->anon_vma can be changed.
> >
> > Correction: no it can't :)
>
> Yes, vma->anon_vma change should require taking read mmap_lock.
>
> >
> > >
> > > >
> > > > Secondly, if vma->anon_vma is NULL, it basically means either no pa=
ge
> > > > fault happened or no cow happened, so there is no page table to cop=
y,
> > > > this is also what copy_page_range() does currently. So we can shrin=
k
> > > > the critical section to:
> > >
> > > Firstly, with no VMA write lock, !vma->anon_vma means a fault can rac=
e and
> > > secondly copy_page_range() checks vma_needs_copy(), there are other c=
ases - PFN
> > > maps, mixed maps, UFFD W/P (ugh), guard regions.
> > >
> > > So yeah this isn't sufficient.
> >
> > However this is true...
>
> Yes, fault can race with fork. Basically this is actually the purpose
> of this idea. We can have improved page fault scalability. In my
> proposal (take write vma lock if vma->anon_vma is not NULL), the race
> just happens on the VMAs which page fault has not happened on before.

Sorry, this is incorrect. Page fault can't happen on those VMAs
because page fault needs to create anon_vma, but it requires taking
mmap_lock.
If anon_vma is not NULL, vma write lock will serialize against page
fault. So there should be no race with page fault. Removing vma write
lock suggested by Barry may increase race.

Thanks,
Yang

> vma_needs_copy() also skips the VMAs which don't have vma->anon_vma.
> So there is basically no difference in semantics other than more page
> fault races IIUC. It should be safe as long as we can guarantee there
> is no writable PTE point to a shared page after fork.
>
> For guard regions, it can be serialized by vma write lock if
> vma->anon_vma exists. If vma->anon_vma is NULL, it will prepare
> anon_vma, which will take read mmap_lock if I read the code correctly.
>
> I have not investigated UFFD yet.
>
> >
> > >
> > > >
> > > > if (vma->anon_vma) {
> > > >     vma_start_write_killable(src_vma);
> > > >     anon_vma_fork(dst_vma, src_vma);
> > > >     copy_page_range(dst_vma, src_vma);
> > > > }
> > >
> > > Yeah that's totally broken fo reasons above as I said :)
> > >
> > > >
> > > > But page fault can happen before write mmap_lock is taken, when we
> > > > check vma->anon_vma, it is possible it has not been set up yet. But=
 it
> > > > seems to be equivalent to page fault after fork and won't break the
> > > > semantic.
> > >
> > > It will totally break how the anon_vma hierarchy works :) See the lin=
ks at the
> > > top of https://ljs.io/talks for a link to various slides on anon_vma =
behaviour
> > > (it's really a pain to think about because it's a super broken abstra=
ction).
> > >
> > > You could end up with a CoW mapping that's unreachable from rmap and =
you could
> > > get some nasty issues with page table entries pointing at freed folio=
s :)
> >
> > Correction: actually we should be safe given mmap read lock on anon_vma=
 install.
> >
> > >
> > > >
> > > > Anyway, just a crazy idea, I may miss some corner cases.
> > >
> > > Yeah sorry to push back here but this is just not a viable approach.
>
> No worries. Thanks for all the feedback. Just tried to explore whether
> such an idea is feasible or not.
>
> > >
> > > And this is forgetting that we have relied on page faults being block=
ed by fork
> > > _forever_, who knows what else has baked in assumptions about that
> > > serialisation.
> > >
> > > Forking is one of the nastiest parts of mm and has had multiple, subt=
le, corner
> > > case breakages that have been a nightmare to deal with.
>
> Yes, this might be the biggest concern. The page fault can race with
> fork. If some applications rely on such subtle behavior, it may break,
> but such applications are fragile too.
>
> > >
> > > So I'm very much against changing this behaviour to try to fix someth=
ing in the
> > > fault path.
> > >
> > > We should address the fault path issues in the fault path :)
>
> Yeah, this idea was inspired by Barry's "not take vma read lock
> unconditionally" idea. Maybe irrelevant to Barry's priority inversion
> problem, just an idea for further optimization on page fault
> scalability. This probably should be a separate topic.
>
> Thanks,
> Yang
>
> >
> > Above still all true though.
> >
> > >
> > > >
> > > > Thanks,
> > > > Yang
> > > >
> > > > }
> > > >
> > > > >
> > > > > Based on the above, we may want to re-check whether fork()
> > > > > can be blocked by page faults. At the same time, if Suren,
> > > > > you, or anyone else has any comments, please feel free to
> > > > > share them.
> > > > >
> > > > > Best Regards
> > > > > Barry
> > > > >
> > >
> > > Cheers, Lorenzo
> >
> > So still a nope :)
> >
> > Cheers, Lorenzo


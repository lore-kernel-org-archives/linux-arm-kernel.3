Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7AFCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXxzzbCeNo3sDfk3dzWGFhN8IehnqsFdAWbxh92ducY=; b=M+6QOuvQ0on6SbwM0O4NzjkhSB
	nKfYekO2vRc6aDkehkPl1vsk89g5I10Ufkuef2+g3hQ30v/oJ5VuUSn03D8GhAs1/sEG4lTD1UAg7
	nz5abJbImwYzhISzOV4mHga/3+LCsNiZtDRjS3rKrAkdZv14VX5p2VSitLnnp2NBTUDamMgFdeTqL
	CfJn6SV0YCsOlxuAqw7Eqojj4sea2VUWG3U+uAoGKbiHwhaOYaDG5p5KvtQssh2bL67A3wHs0JqgO
	+h2LPK0RcVWgJcXDG9ZSeYFI8fF6GmOWr7AD05y/Vr75/A2rH5zfu1kK0y8Pcfwjry+uz8lXQ8Glf
	SRAXDD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc1e-00000003u7H-32Cs;
	Wed, 20 May 2026 08:11:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc1b-00000003u6G-3E4d;
	Wed, 20 May 2026 08:11:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1089060129;
	Wed, 20 May 2026 08:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B3F1F000E9;
	Wed, 20 May 2026 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264690;
	bh=CXxzzbCeNo3sDfk3dzWGFhN8IehnqsFdAWbxh92ducY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bnkpa3FzKkUUdWFG0smRQZfU40dk46M5NgdqdIyfXEPD1h20NL7bKr72VFJoHgNPK
	 Zpt0f97bM5yOlAFtMWk1oRJvIjsf1+ECrk3QzWUIz/BWNXDJW0ZYJ2FFouGZZmuMrM
	 Wo4p0Vkb6/RLl4doyo6ixLI4oE7LpahGy1KRkeyMwou5u+LN+Sw4rNKaJQ+5yI6oFf
	 vB2uTeyCpF+Vdg78uiOeOk2xvyBn7mhcgugFMKCdMzmjrO0Fwf6NwhxUTUhIuawNn+
	 NrJZl4Ke/LYbTbo3EkZd4QjkXwxp4OdeRjoSgwxJx/swz4bFwcKMo8A4KVWXBu3sjy
	 W937Gs5yLpfaw==
Date: Wed, 20 May 2026 09:11:20 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Yang Shi <shy828301@gmail.com>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	surenb@google.com, akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ag1qo0q_bfePgOzx@lucifer>
References: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <agxfLNuLCAT3F4cW@lucifer>
 <agxnJ8R-G3CRjeTR@lucifer>
 <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
 <CAHbLzkrTF7w+T5mGsQuDRuhnTk6evTKBNRcH4oS=nRcUg2zpsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHbLzkrTF7w+T5mGsQuDRuhnTk6evTKBNRcH4oS=nRcUg2zpsg@mail.gmail.com>
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

On Tue, May 19, 2026 at 02:02:09PM -0700, Yang Shi wrote:
> On Tue, May 19, 2026 at 11:41 AM Yang Shi <shy828301@gmail.com> wrote:
> > >
> > > >
> > > > >
> > > > > Secondly, if vma->anon_vma is NULL, it basically means either no page
> > > > > fault happened or no cow happened, so there is no page table to copy,
> > > > > this is also what copy_page_range() does currently. So we can shrink
> > > > > the critical section to:
> > > >
> > > > Firstly, with no VMA write lock, !vma->anon_vma means a fault can race and
> > > > secondly copy_page_range() checks vma_needs_copy(), there are other cases - PFN
> > > > maps, mixed maps, UFFD W/P (ugh), guard regions.
> > > >
> > > > So yeah this isn't sufficient.
> > >
> > > However this is true...
> >
> > Yes, fault can race with fork. Basically this is actually the purpose
> > of this idea. We can have improved page fault scalability. In my
> > proposal (take write vma lock if vma->anon_vma is not NULL), the race
> > just happens on the VMAs which page fault has not happened on before.
>
> Sorry, this is incorrect. Page fault can't happen on those VMAs
> because page fault needs to create anon_vma, but it requires taking
> mmap_lock.
> If anon_vma is not NULL, vma write lock will serialize against page
> fault. So there should be no race with page fault. Removing vma write
> lock suggested by Barry may increase race.

Firstly, let's none of us be worried about making mistakes here, the anon_vma
stuff is confusing, and I've stared at it more than mostly, and even so I
managed to make mistakes (as corrected here) and forget details :))

It's a sign it all needs simplifying, but hey that's what my scalable CoW
project is (partly) about :)

Removing the VMA write lock would cause races with page fault which can result
in page tables being installed which are then not correctly duplicated for
ranges that must be.

And again I think the underlying thing here overall I think is:

1. Clearly many cases require serialisation (any that cause copy_page_range() to
   fire).

2. If we were to decide not to take a lock with concurrent page faults, that
   lays a trap for any future change that (reasonably) assumes that page tables
   cannot be simultaneously copied while being accessible to page fault
   handlers, which is bug prone.

3. As per 2, even if we were to only take the lock when we felt we absolutely
   needed to, we still cause risk through adding yet another 'you just have to
   know' risk to this part of mm.

4. The serialisation is quite likely relied upon by other things, this is often
   the case in mm, and we may only realise that such serialisation is critical
   at the point a subtle issue arises out of it.

5. Fork is one of the most sensitive, intuation-defying, complicated, and
   corner- case-problem-baiting areas of mm and I really oppose us changing
   fundamental behaviour here unless incredibly well justified.

On this basis, let's let the sleeping dogs lie and leave fork alone I think :)

I think I am far more inclined to take Barry's fault approach (as I've said to
him) vs. changing fork behaviour.

But I want to make sure there's not a 'third way' that could avoid either!

I am going to have a look through Barry's series in detail so we can have some
movement on this one way or another :)

>
> Thanks,
> Yang
>

Cheers, Lorenzo


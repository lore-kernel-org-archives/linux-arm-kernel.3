Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F29FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yy36aEN1ISq3rx8gbkVjtmwzFJPPiPu+6w78nwiNyyA=; b=Tmq8Ve1QEJRSt4PJhzr6DYXJTF
	KKlFPHPrIOVyz8cw4XIQeojpC/sN4V2JdTq5X38tRgkCYDf8TlLxSVLDZ5WchriBpif5cbc4c9H4x
	tjswxGdDNuci9ncxveBB4sxOuqxG8ibI0DJhhXGQmisjoVwbwFzvIDW+E1o5bdKXk0bVANLhFDUK8
	2Fzk734leltfJxw/qvD1d7y3ktUYUhl4lczyKRVUys9ay8xYuCXssDDQx1c/xy7GPUrP0WNq+bvR8
	TBymV2B2SKVXDJs6DmT8421ABP+TKTjuGRPT0fAYh6eJ5U0D9ypdeTKzJzYayTGYiS4j7QciZqXiO
	cQf8zb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdb1-0000000Bh7l-4Bi8;
	Sun, 03 May 2026 20:39:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdaz-0000000Bh6e-1S3P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 20:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13DE44439B
	for <linux-arm-kernel@lists.infradead.org>; Sun,  3 May 2026 20:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE0CC4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Sun,  3 May 2026 20:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777840761;
	bh=OYTEHp7kfu60uKZpC7uNHUoEqcMaDbfVrENwGSgXkAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oQ4dUdb5atMjLxp1+0AQoh6FUEYpAUVniDRpLShr+tgiDJEUcO1b1w0o05Is6rA5e
	 pRFzBXnvnuTLiBO9M3mStfZmj5l2Phir3lVt8nCKUJ9m7GwyIlYqe2uUE/Y02LfVrm
	 OXG5kJ4RwS6QYH8yYF/2j+bhE3ruoMpxNmoR7wk5XFdZOMx3j08I5yywZW/QY0ITmb
	 0TvUcVyWVAXXQMJQ7404OC2maYfXJ4LXXcvP1b87ku9WVIfQN9ujMoudGa4tzmvuD8
	 gE1z7MR8oXxa5U1uOOgfQNng+9fpnnEzw/N2GvhkZ/P3qJXW2C2YRrCxSQular6VTi
	 8Oay8mWUM/23g==
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a093c784b0so36439356d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 13:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/d9TSAg/HCEFBVkYB7udJZpTS06iM7s4E6Io4SjWbjtONPE+SIywCmpuldhza3tFhu22lpsqLHII38rvCVDjmu@lists.infradead.org
X-Gm-Message-State: AOJu0YznYboi8OeqIDmMF8v8nHSKs7zLFefMXNPnAIMBuTUCEuExaBuI
	DZ1yrJZvCjIGWrKR6gxxht2AgO7I6BNtASb4VoMbYEhtJaIcqjws08Bip/SR05UsXQsEEBiJpIC
	ywon8yVqgSYWQy1YS55j3DPKXjya29yA=
X-Received: by 2002:ad4:5be8:0:b0:8a7:16f8:442a with SMTP id
 6a1803df08f44-8b6691f4b71mr126409566d6.39.1777840759244; Sun, 03 May 2026
 13:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
 <afUBXnPVnt7Jt5hh@casper.infradead.org>
In-Reply-To: <afUBXnPVnt7Jt5hh@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 4 May 2026 04:39:08 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z3MfP_sx1+qSr00dP5wshOuCAOcbT3RJ_He6Ddz_LnKA@mail.gmail.com>
X-Gm-Features: AVHnY4J-8SFfwvh8WWDAqxVa-cYngpmLlGJISHly6gCLbGvwUy-qMx6Jb2WhZWc
Message-ID: <CAGsJ_4z3MfP_sx1+qSr00dP5wshOuCAOcbT3RJ_He6Ddz_LnKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
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
X-CRM114-CacheID: sfid-20260503_133921_415934_CEC521D2 
X-CRM114-Status: GOOD (  27.77  )
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

On Sat, May 2, 2026 at 3:39=E2=80=AFAM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Sat, May 02, 2026 at 02:25:37AM +0800, Barry Song wrote:
> > On Sat, May 2, 2026 at 1:58=E2=80=AFAM Matthew Wilcox <willy@infradead.=
org> wrote:
> > > Yes, but that still fails to answer "does this actually happen".  How=
 much
> > > performance is all this complexity in the page fault handler buying u=
s?
> > > If you don't answer this question, I'm just going to go in and rip it
> > > all out.

I guess the only way to answer this question is to
remove all retry code for file VMA and run a real test.
For defensive programming, I am generally very cautious
about this approach, but if this is the only way to clarify
whether we still need PF retry for file, I can give it a try
and run a complete test on Android phones after lsf/mm/bpf.

> >
> > I=E2=80=99m getting quite confused. In patch 4/5, you suggest a more
> > restrictive condition using
> > if (folio_test_uptodate(folio) && !folio_test_writeback(folio))
> > rather than if (folio_test_uptodate(folio)), before we decide to skip
> > retrying the page fault [1].
> > That seems to suggest we should be more cautious about when we can skip
> > retrying the page fault.
> >
> > However, in the cover letter, you suggest removing all retry code entir=
ely.
> > Does this suggestion apply only to file-backed page faults?
>
> I'm making sure that if Andrew decides to override me he at least sees

No, I don=E2=80=99t want Andrew to override you unless there is a real PI
issue for file, and only if you still still insist on =E2=80=9Cripping it o=
ut=E2=80=9D
after a thorough test with it removed.

> that there are other problems with this patchset beyond "I don't like
> the additional complexity".

The other issue you are pointing out is that, for anon, we
should be more cautious before deciding to skip PF retry,
which seems to be the opposite direction of what you expect
for file.

>
> And maybe we decide to do the fallback for anon-mm but not file memory.

I was targeting a unified approach for both file-backed
and anonymous memory. For example, if anon requires retry
under the per-VMA lock, we may already have the necessary
branch in place that file-backed cases can also leverage.
For anon cases, high-level language GCs can operate on a
small portion of a large heap requiring VMA writes, which
is fairly common, as I explained to Jan.

> Or maybe it's just something somebody happens upon when reading the
> mailing list (or more likely it's just grist for an AI).

Maybe one or two years from now. For now, at least, there are still
humans working on the kernel :-)

Best Regards
Barry


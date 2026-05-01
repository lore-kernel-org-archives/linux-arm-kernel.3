Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C77BCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4A1t9IUPAxFiSXYXl3Z4jwgMAwfMFsg3JsxiXOyKCg=; b=blPzGwbGUZgb0kM8Z/WDthalMx
	SVNX/7XpXqo9SxTpDpHQUN722IBjRnxl/Olhbxayj0fyQ3VwfXHxL71FSNZZ1vmqNxw9gwkr8BkJX
	e+3T/6UJNAJ7A2usl9vAHzLAnBUXMIhZWXzjx8RCtIIDuItfD/B/H3YohSWAlSlw0kzL1UcxrlMjG
	x20XDSRnXolKYS08yk96Xn8+wDKFVuX4+Qq847AgkfFNUVarEJCAdNzOj0bcI8/mnh3Bt1axyU4v3
	keS/EiK0JhjB2dlFMnZK6js2NPsiMwY5IQQODGinLuwr/RRea6AomilNSsfA3DhZWP+7UcHT1LTt9
	vG8unl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsYj-00000007ZFc-1jKq;
	Fri, 01 May 2026 18:25:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsYh-00000007ZFH-0DiW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 18:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04E0560120
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 May 2026 18:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925B6C2BCF6
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 May 2026 18:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777659949;
	bh=lT/rPel9FmT35iq3NDhHuchj5jXwn6oKumOJ4dCsmXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FIVeO3aI7z+jFqDqXITJ+jWsf7lknsacv1Vzwcn4Qsr6jBLZMM2APApvdOADED8Ln
	 tAIwXt9R3qywh7SwzohMPLV0t1vg1LPT7kOq55TgbdDGfwhWLLAjfL+brTf/OPCywN
	 jEfUkX05+1k8ouTnvv+GA9F+JEnzTnf5Oa3U2Pt8IrB7QbY20FMPALZdtczL2ANGRj
	 CrACi6wIjjOv4ftAgLt74Gg2ts3YaDODuAFLoaOg1uLSZtNISIx6WZBJZfcCC4lqXH
	 2KD3b4Y7/PA6fAAoCZuEsL9/UflhQWvEAIT7FBdFCoa8CcfRc5UKFiKNKCX0uHRqoY
	 UbCOWCsY8mKUw==
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50e63771eb0so20673221cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 11:25:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ohvV2ja/qcw8K3DmACkJDmfOKvb9h6+3x18wgb9dKUUvibGwz8KUr9s6RMQ6xdJ7v2Oo6j77e/Ta3S1GpXYAF@lists.infradead.org
X-Gm-Message-State: AOJu0YzfaSB1W87LOK//Arcg82ASE9Tf/ODM0Pq8BYZbKcQL/Sphr2XJ
	6q/DVLxb2yFi4h8/RcqzktnNcK99PLyqiPOhH8v1TRW8uWN3Srd01ZojGXckKMfaw2x33ObeDTl
	7q4GChXhMTvnUzCTPe54oPhrjAwaz4N8=
X-Received: by 2002:ac8:7dce:0:b0:509:2455:2b53 with SMTP id
 d75a77b69052e-5104bf755a7mr5248631cf.49.1777659948730; Fri, 01 May 2026
 11:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
In-Reply-To: <afTpoL3FklpQZNMM@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Sat, 2 May 2026 02:25:37 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
X-Gm-Features: AVHnY4Jc3ag1bUQ2844h_SA5sVSne-TN_r5pli71-jMQXFzkdxM1Ig0IdK36GUU
Message-ID: <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
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

On Sat, May 2, 2026 at 1:58=E2=80=AFAM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> > On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@infradead=
.org> wrote:
> > >
> > > On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> > > > 1. There is no deterministic latency for I/O completion. It depends=
 on
> > > > both the hardware and the software stack (bio/request queues and th=
e
> > > > block scheduler). Sometimes the latency is short; at other times it=
 can
> > > > be quite long. In such cases, a high-priority thread performing ope=
rations
> > > > such as mprotect, unmap, prctl_set_vma, or madvise may be forced to=
 wait
> > > > for an unpredictable amount of time.
> > >
> > > But does that actually happen?  I find it hard to believe that thread=
 A
> > > unmaps a VMA while thread B is in the middle of taking a page fault i=
n
> > > that same VMA.  mprotect() and madvise() are more likely to happen, b=
ut
> > > it still seems really unlikely to me.
> >
> > It doesn=E2=80=99t have to involve unmapping or applying mprotect to
> > the entire VMA=E2=80=94just a portion of it is sufficient.
>
> Yes, but that still fails to answer "does this actually happen".  How muc=
h
> performance is all this complexity in the page fault handler buying us?
> If you don't answer this question, I'm just going to go in and rip it
> all out.

I=E2=80=99m getting quite confused. In patch 4/5, you suggest a more
restrictive condition using
if (folio_test_uptodate(folio) && !folio_test_writeback(folio))
rather than if (folio_test_uptodate(folio)), before we decide to skip
retrying the page fault [1].
That seems to suggest we should be more cautious about when we can skip
retrying the page fault.

However, in the cover letter, you suggest removing all retry code entirely.
Does this suggestion apply only to file-backed page faults?

[1] https://lore.kernel.org/linux-mm/afTQl12XcXVnku9J@casper.infradead.org/

Best Regards
Barry


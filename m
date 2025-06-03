Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C25C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 01:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjwz7K+3C5Y9HHx06yESpqFLa2bL0hzbV0H1wyWAxzY=; b=ePJXrZGV/b71wzbx6DWM+cGkwl
	ll3a0Tv6NeeRmLbIFKmSjkZU/XpS9p4DnFB+cCijRahsdhAPkc+NSPLf9i9nxrStXDRyykAo6Ehwb
	MrAugWVTbtu9py47DTIKrgt/PprlkwSzdyWFHupnjwD90HPn2diMmyYKmEdb5EaaGtWCbTdQ8rbIM
	VzEEHus/yw3ZsoXfyzvYVn4Kd6qW/YWrEcAYhA7rP27wcjxpftfXcsZXHxwGOtFC3yQZakXBoNsHD
	WEP1hctMWgFC8Cw2H85b4Wy084qJBd+kZSbZitJqvQ+RDyNGJFTzxTjqlGAy8yHxmcvWl2J+cgr36
	9Zg76Ikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMGuy-00000009W6q-2T6L;
	Tue, 03 Jun 2025 01:58:20 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMGsi-00000009Vwn-3Lnr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 01:56:02 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-87dfd390745so2686140241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 18:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748915759; x=1749520559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjwz7K+3C5Y9HHx06yESpqFLa2bL0hzbV0H1wyWAxzY=;
        b=S3ANV+ezgOditFTqoLpdC6klfrgQ/C8pejNjL5u8tPUc3n+LPMPdaA6XUEoMnGieGG
         NYD+FXqn29hxH2FworljRJ4FMVaoysm3NdM1kCoqme3qNULEdYkognfG2j5/L/7Psmmw
         G/YUBtaP/mRvvigZQUOqqo/gLysHb8kIlXTaF274L2yA1BulIY4Kiiqf3rRJxpLnMye6
         AiSg/I6QrxmHN5N7BXC1ys7RhyTKQSDAD0EpqBQeh9ynhdf7CEF3S6JUdUXdEN77DpPe
         dQZWigV/vgEi6DCuUTwdswJUq4eQV8cdgM8HgLHX+H2IfLer8GLIpoUn6xjUFI0RbE3N
         reTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748915759; x=1749520559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjwz7K+3C5Y9HHx06yESpqFLa2bL0hzbV0H1wyWAxzY=;
        b=Du/kY4VxeiylLqy3Grox+BFbQI/obZSpKUbLcnINvGJDsYnqMV8GOTTxD+IacSJFqf
         PzyduAi3aC+vsoZxL6wV1ltOnnl9FH1PuqvxC4pBq7SSfXNOYS99t9HZerVKWW77aUwn
         nk5YtJgDebaVx94T57AzoxFiNBq0dx3zLsTmYUYoBDRzDcp3YFzfJjs3YznIaX4rixBZ
         Vt0QSnosEeWO+Xe3HAbAYOupUt+F9sTsfTiOvRYoHsOGZLXl+8Ir5xAq4IwINRMOJJHq
         B8TYL5m6uAPRhAY+U0xMBXHObxU1NNCqwNlDxg5IIrJNn5ozyq7kPO7sAx9+/JhCb76n
         sa1w==
X-Forwarded-Encrypted: i=1; AJvYcCW6uV7h3YHWXvpbwaUgJyzYhoSRtpwpx09aPyFVZ3/fm0PyJH/TwFNGznf/Bb/u2dtALFaWnEEA2Pc6hwDhav+S@lists.infradead.org
X-Gm-Message-State: AOJu0YyO13tl5nku3bRlMNAGuyMcZ47mpEhFI7BUmBoGAO/qGs5MbeIm
	7360bdl+2DJx6bGp4OpyDQD6SWVEqG03R/BkrQ7RsBzGpoS1/ukHLIWGlIRRweOpRG2a6UQnhRv
	+iLcAvu81M+ZzMqn8Rl8Qfcg8oaXhcA5kWISX
X-Gm-Gg: ASbGnctwlUL/wvQmfpayjgYTT0XAd8i3O25DOP/vJQORofhtAQVbW5wA9OjYbcXLpnj
	vbGbq2Uc2zt/m07sDXNUC+AucMUstl3LY3WB+uPwni1HnvTZDTauBrGFDEXqccL1C2Q9IyEiRMs
	R1nqd6gva/FUh4nPaNGh41emVRH9Ie7xzqbQ==
X-Google-Smtp-Source: AGHT+IE0T9BO6q1wzLTJ95JtVQFrX3//75v+ctXp12UmlWdewLG/VBORVzYwyBSCoOuDuKGPa7/9WY/NaGFUHwwFnzk=
X-Received: by 2002:a05:6102:cd3:b0:4e5:a837:b0d2 with SMTP id
 ada2fe7eead31-4e701a2842emr8699909137.3.1748915742691; Mon, 02 Jun 2025
 18:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
 <20250602120042.GB1227@willie-the-truck> <8ef5cadd-2f9b-4a19-a85c-18e17d7edfbc@arm.com>
In-Reply-To: <8ef5cadd-2f9b-4a19-a85c-18e17d7edfbc@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 13:55:31 +1200
X-Gm-Features: AX0GCFuxwlQ8o1crYF9fsectv4nxVSCChPH3dMA3wh1aXX5xOBowo2lsIa0tFBM
Message-ID: <CAGsJ_4zZdfgiy0k+kK3Gqg5KvuFs8Rx3zQXLhkLk-K-+Hf0grw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mel Gorman <mgorman@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_185601_229198_2BE84EC6 
X-CRM114-Status: GOOD (  44.79  )
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

On Tue, Jun 3, 2025 at 2:00=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
>
> On 02/06/2025 13:00, Will Deacon wrote:
> > On Fri, May 30, 2025 at 04:23:47PM +0100, Ryan Roberts wrote:
> >> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing wi=
th
> >> a parallel reclaim leaving stale TLB entries") describes a race that,
> >> prior to the commit, could occur between reclaim and operations such a=
s
> >> mprotect() when using reclaim's tlbbatch mechanism. See that commit fo=
r
> >> details but the summary is:
> >>
> >> """
> >> Nadav Amit identified a theoritical race between page reclaim and
> >> mprotect due to TLB flushes being batched outside of the PTL being hel=
d.
> >>
> >> He described the race as follows:
> >>
> >>      CPU0                            CPU1
> >>      ----                            ----
> >>                                      user accesses memory using RW PTE
> >>                                      [PTE now cached in TLB]
> >>      try_to_unmap_one()
> >>      =3D=3D> ptep_get_and_clear()
> >>      =3D=3D> set_tlb_ubc_flush_pending()
> >>                                      mprotect(addr, PROT_READ)
> >>                                      =3D=3D> change_pte_range()
> >>                                      =3D=3D> [ PTE non-present - no fl=
ush ]
> >>
> >>                                      user writes using cached RW PTE
> >>      ...
> >>
> >>      try_to_unmap_flush()
> >> """
> >>
> >> The solution was to insert flush_tlb_batched_pending() in mprotect() a=
nd
> >> friends to explcitly drain any pending reclaim TLB flushes. In the
> >> modern version of this solution, arch_flush_tlb_batched_pending() is
> >> called to do that synchronisation.
> >>
> >> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> >> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> >> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the en=
d
> >> of the batch to wait for all the issued TLBIs to complete.
> >>
> >> Now, the Arm ARM states:
> >>
> >> """
> >> The completion of the TLB maintenance instruction is guaranteed only b=
y
> >> the execution of a DSB by the observer that performed the TLB
> >> maintenance instruction. The execution of a DSB by a different observe=
r
> >> does not have this effect, even if the DSB is known to be executed aft=
er
> >> the TLB maintenance instruction is observed by that different observer=
.
> >> """
> >>
> >> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> >> requirement because they are called from the same task (either kswapd =
or
> >> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU o=
r
> >> if the task was migrated, __switch_to() contains an extra dsb(ish).
> >>
> >> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented =
as
> >> a dsb(ish). But this may be running on a CPU remote from the one that
> >> issued the outstanding TLBIs. So there is no architectural gurantee of
> >> synchonization. Therefore we are still vulnerable to the theoretical
> >> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> >> potentially racing with a parallel reclaim leaving stale TLB entries")=
.
> >>
> >> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending()=
.
> >> This aligns with what the other arches that implement the tlbbatch
> >> feature do.
> >>
> >> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown du=
ring page reclamation/migration")
> >
> > Barry -- it would be great if you could re-run some of the benchmarks
> > from that commit with this fix applied.
>
> Worth rerunning if possible, but I would guess that those benchmarks will=
 still
> show the similar improvement because they are measuring the cost of doing=
 the
> TLB flushing. But with the fix, there is an extra cost that those benchma=
rks
> probably won't measure; subsequent work within the target mm will have no=
 VAs
> cached in the TLB so the miss rate will be much higher.

Right, not sure if we have a suitable benchmark to measure the
side effect, but I assume reclamation speed is more important
when we're reclaiming memory.

This was originally introduced in commit 3ea277194daae
("mm, mprotect: flush TLB if potentially racing with a parallel
reclaim leaving stale TLB entries").

Cc'ing Mel to see if he has any comments.

>
> >
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> ---
> >>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
> >>  1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/as=
m/tlbflush.h
> >> index eba1a98657f1..7d564c2a126f 100644
> >> --- a/arch/arm64/include/asm/tlbflush.h
> >> +++ b/arch/arm64/include/asm/tlbflush.h
> >> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(st=
ruct mm_struct *mm)
> >>  }
> >>
> >>  /*
> >> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need=
 to
> >> - * synchronise all the TLBI issued with a DSB to avoid the race menti=
oned in
> >> - * flush_tlb_batched_pending().
> >> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need=
 to ensure
> >> + * all the previously issued TLBIs targeting mm have completed. But s=
ince we
> >> + * can be executing on a remote CPU, a DSB cannot guarrantee this lik=
e it can
> >> + * for arch_tlbbatch_flush(). Our only option is to flush the entire =
mm.
> >>   */
> >>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *m=
m)
> >>  {
> >> -    dsb(ish);
> >> +    flush_tlb_mm(mm);
> >>  }
> >
> > Thanks, Ryan. I'll pick this as a fix, but perhaps the core code should
> > do this given that all the architectures selecting
> > ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH now have an identical implementation
> > of arch_flush_tlb_batched_pending()?
>
> Ha, yes... infact it looks like that's what it did prior to commit db6c1f=
6f236d
> ("mm/tlbbatch: introduce arch_flush_tlb_batched_pending()").

Yep, it was just a flush_tlb_mm(mm) inside flush_tlb_batched_pending().

>
> I'll do that tidy up once this fix appears in mm-unstable.
>
> Thanks,
> Ryan
>
>
> >
> > Will
>

Thanks
Barry


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28F9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 08:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIXoZ8nnG6zKXvBD8hYHXvLPlGzG2L6Za+aocYQ9cfw=; b=UsT2j7jEIodXFWGi6qEJWvuRdI
	EmA/NPbC5fJrQk2YuvM+HiAXlvaHLwvE3app+s9v0rQs/iCTrcNMs5A3RqFrUVZhk0cCAIll7mAJF
	rR+bYG5QKk/Z0Gh5Xxs0+Z0e/OfXvJagj41X1MUV06q+4/InDBR4XxiULyRAQeMQY9FzsiwJjk7e+
	m0hcwPtumtB1EPqXItFS8LqIsF5SNLAU7YZ73+rq6MXjBwOi90Cs5YGJdU2NJy6GxXlvFh1OXS9hT
	EtCi8OLkzLe9AHFwcw8wDqJejv67DD8qgvalPNDj276VGzdCAw24Vs4dcVRBXRsUXapxUji4pUqM5
	lk01Xo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5Y2-0000000F1Nk-0r6l;
	Thu, 05 Jun 2025 08:02:02 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5Vl-0000000F16p-0xF7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 07:59:46 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-52eec011ff2so248395e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749110379; x=1749715179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIXoZ8nnG6zKXvBD8hYHXvLPlGzG2L6Za+aocYQ9cfw=;
        b=A0Fdn+VLpD8UMtGH6vlliMDTw3JWqIuC0fGZLVlXVJND9ISh15j8UJjCkSyf7p17wJ
         aTDFTxW4cWN8KLlr9rvEIBCPwm3+LNGTQiK1RZzEZ8VIC+8MPvATV2tpFTcPN5DOXIQP
         xlnrCpGqjL0P8ikVrvCbhAgyNkGBVHqglg0+PfWZDLHg/noHOclL/XMTlXQihcWTYyC1
         M2XRSKS1WydnLrjplbXM5gxrBQfLFfdDNt7JDTRDrXRbrUqGEQYuYclnAcyAE47q4D99
         B/hDXhAspQuHTuTV4YqD7qYDKRASf7WRiWIISo4RaAkjDduE53xBPu0hABl5LpOUeA2L
         FQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749110379; x=1749715179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIXoZ8nnG6zKXvBD8hYHXvLPlGzG2L6Za+aocYQ9cfw=;
        b=wqxPA6sVmfMlibK+OsXEb+k7RpNzGxRmCbeFKjDt9PJqJzi/QWFCK7M9jzCcMJ1UsO
         6g/HYeol73KV4zszG+UZsrOgVp3OsZ1IdY0v/gUAdAgU8MTgTdG/fOKm17AiC4XuFSHT
         sb8WxHVys2mqhV0LEcce6oXMx4SvPQ9OU2WCnio6W37WYt4o2CMU2fyrHJm6zZbHuhyC
         fA9QhyprFpAcydceFGXX1vmnr8/x29ZVN0+0a7xrrXs1fLBbH/4QMFqj56Dzd+fbhmtm
         kJZB4r5pUhF0BkQsr4YdH9PyjDj+NiapvDo6W8wEoHkw6BtS+70wNXirMt9CdKvtpjo8
         pDbA==
X-Forwarded-Encrypted: i=1; AJvYcCUBOKazQnZ+lCmhavoispHS4ni2aALtxdSmVqgqKeXEJj3x0nGsjrpkwwks6EJrN9vkJdBLvIGd1wkAFj55Kj0M@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Ae558Xu2HdKEvhLNFLqxHJVp/pw4awI3764GdhLeqRRjCbfE
	9eaIEM+CHzxk/0fT3Ysj5QnYUYXHAXq3LdnTBSEolB5Us8x8N3B1jAoPLJg0gIlq7G+6MOkDZqn
	dmq1h1ROiUoKDKOdW1WHHe/C3lu50P1M=
X-Gm-Gg: ASbGncv2eHarrn30OM3PmncQVijN11b2gwx3vrGElcihiL3YfHCZ72CNXIktabTTWPb
	70YeldcSQkDVSEw0LR4wAK7s+44EX/N2qZN0tfgWVHdGPYMick9K8KDMWC+uhZ2+BMUI3k7Iblh
	D1q0VoDmka4xnkA4RMiOfy34wqX3/VyTZkxA==
X-Google-Smtp-Source: AGHT+IGD1VWwlaV9ZhRp/8D2WO1IzmDAledYMtYdxA5w0p2HGkI8w+20Zc5VcEKdQ1kaVVfw8TiY6UdV0u8G7Hcu04E=
X-Received: by 2002:a05:6122:1d0f:b0:530:6dc2:ba9c with SMTP id
 71dfb90a1353d-530c7277cf7mr5533878e0c.2.1749110379470; Thu, 05 Jun 2025
 00:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
 <CAGsJ_4wfhA6C2dV+a=dnx=EKRmrt80ujrh6KrepJ_P8JqCbPnw@mail.gmail.com> <96266c85-0a17-4291-8147-867925cac7ca@arm.com>
In-Reply-To: <96266c85-0a17-4291-8147-867925cac7ca@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 5 Jun 2025 19:59:28 +1200
X-Gm-Features: AX0GCFu-NeKAfhhcYcVhf3vSCPP-_eYGIgeZ7mHBWdE7DMc26rnYrXdIXoJNJwk
Message-ID: <CAGsJ_4wtbKb_q-QC1zXEtVkepp5ZumMKVAAQ_9YXS3CwR8dK2Q@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_005941_272923_B8FAADD7 
X-CRM114-Status: GOOD (  50.01  )
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

On Tue, Jun 3, 2025 at 10:32=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 03/06/2025 10:49, Barry Song wrote:
> > On Sat, May 31, 2025 at 3:24=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.=
com> wrote:
> >>
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
> >>         CPU0                            CPU1
> >>         ----                            ----
> >>                                         user accesses memory using RW =
PTE
> >>                                         [PTE now cached in TLB]
> >>         try_to_unmap_one()
> >>         =3D=3D> ptep_get_and_clear()
> >>         =3D=3D> set_tlb_ubc_flush_pending()
> >>                                         mprotect(addr, PROT_READ)
> >>                                         =3D=3D> change_pte_range()
> >>                                         =3D=3D> [ PTE non-present - no=
 flush ]
> >>
> >>                                         user writes using cached RW PT=
E
> >>         ...
> >>
> >>         try_to_unmap_flush()
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
> >
> > Hi Ryan,
> >
> > Sorry for bringing up another question late, but your explanation made =
me
> > reconsider whether I might also be wrong in arch_tlbbatch_flush(). Spec=
ifically,
> > try_to_unmap_flush() needs to ensure that all TLBI operations from othe=
r CPUs
> > for all involved memory contexts have completed. However, as you pointe=
d
> > out, a DSB ISH alone cannot guarantee this.
>
> Hmm, does try_to_unmap_flush() actually need to ensure that *all* pending=
 TLBIs
> are completed, or does it only need to ensure that the TLBIs previously i=
ssued
> by the same instance of shrink_folio_list() are completed?
>
> I understood it to be the latter and therefore thought the current
> arch_tlbbatch_flush() was safe.
>
> If another instance has concurrently queued up some TLBIs using tlbbatch =
(i.e.
> MADV_PAGEOUT) then the first instance would never see those PTEs so I don=
't
> think it matters that the TLB flush is still pending? Perhaps I'm wrong..=
.

You're right =E2=80=94 I got a bit scared that day. As long as each thread =
can
flush the pending TLBI for its own folio list, it's all good.

>
> >
> > This makes me wonder if we should take inspiration from RISC-V or x86 a=
nd use a
> > cpumask to track all CPUs that have pending TLBIs. Then, we could use I=
PIs to
> > explicitly request those CPUs to issue DSB ISH, ensuring their TLB
> > invalidations are fully completed.
> >
> > I mean something similar to what x86 and RISC-V do, but using just a
> > simpler approach like issuing DSB ISH on the relevant CPUs.
> >
> > void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> > {
> >         on_each_cpu_mask(&batch->cpumask, __ipi_flush_tlbi, NULL, NULL)=
;
> >         cpumask_clear(&batch->cpumask);
> > }
> >
> > static void __ipi_flush_tlbi(void *info)
> > {
> >         dsb(ish);
> > }
>
> My initial instinct is yuk :). I guess we would need to do a bunch of
> benchmarking if this is needed. But would be good to avoid if possible. L=
et's
> figure out if we definitely have a race first...
>
> Thanks,
> Ryan
>
> >
> > Sorry for the mess I made earlier.
>
> No worries, it happens.
>
> >
> >>
> >> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending()=
.
> >> This aligns with what the other arches that implement the tlbbatch
> >> feature do.
> >>
> >> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown du=
ring page reclamation/migration")
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
> >> -       dsb(ish);
> >> +       flush_tlb_mm(mm);
> >>  }
> >>
> >>  /*
> >> --
> >> 2.43.0
> >>
> >

Thanks
Barry


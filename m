Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28189CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auNMmPsKKmQDwMQx6p+X+IoKw+T0n0UlnhHmOoR8kKE=; b=SaLGbxyR9x4ru+SH9VqLJ2AnIr
	9gDnanH4BBeEVRI/KQ3tnoVPJ8Ef8pNBKJt3dIimICVv3vGcLznMuzoJEFtQevul2UuHSNWrmg/Mk
	rOhVkKyUJ0+40s8ZxCgwqAhbDhwzOKR0JSuV/UIhuT6I4NHSCDiPkeFF2lA7ay0MrYkpCGBB9i0tm
	6um7LE98z4Hid18QMF5bpvV8p0YnKRMqH8Dug8V0psEN+DohQnAQbd7AaHO1C+pIzXw5LuaAaPbnQ
	yJm33on7iKALCAkgxuKQVvx8QihVKcI4U36PWkz3SywEnoa8FWyzhY5LjDzJmrq/bnHdNl/S48Iuu
	cWkc6m9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPX3-00000002Y0c-11FQ;
	Tue, 19 May 2026 18:51:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPWz-00000002XzP-2vIW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 18:51:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so424028566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 11:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779216664; cv=none;
        d=google.com; s=arc-20240605;
        b=J9zWjcUKuc5ThsomWdKOe2/10XIMlkUyAz1p9IgcDBRQDaIxHjPZ52zxdbY9clxlQ6
         jEzBuJ/NGXys+qprYS8i8uGsPHvgM7YNbbkbYT4N0ACPlOM2fZY13I26t8RphxCaXFSm
         E7SlC3Gpw/1VCiczR224oMG2eO8XbwxzMrEndW8vsy/z0RMU7sM+z9rry28hxLB0JoQG
         neYPsS28mJZeOqOJ2CElhwuaJnyYfZTEmJQ2amrDwOFkVFdKbmINgoDrc0cqlHhxqNcv
         OkJ0ueHN5TUwNbQEh9/mgofxe0r/3JQHjPF8o5QFl6A3ZIOmxIM93++ME84RJNeY1nyN
         86bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auNMmPsKKmQDwMQx6p+X+IoKw+T0n0UlnhHmOoR8kKE=;
        fh=Z2Mv/PbHi+d0F3jL+opI3W4FamXIPfBMz144n50i7zQ=;
        b=USVD/OiD/kcL1iHcGSZZrwS286bpMDBIZNL2uW5zWEs9XVzuzt28Y6R3hpw8eEa0KH
         tzRCacYU8BbUWc2n9HsRl+OSN0aRRrh5sK9EOR5u0y6L1moMvixkEUz352Dgg8FMm7tL
         Kcymc89g6BACkr5egbKSoXOEOIi9mM5Y6cTQkwXppC4Ib+oSSK0VlTAupjHw5aZt3pQ+
         5xHohvZLQAnadAOP8zXdQzivhSrhbfr2aNLnGjvbI8Q31kqeIfHWaWy7kmaiNM3EqhUa
         Muh/kUonLOOTrr0RyBPbJb5CmexmprjPvVE+9wwcccouVceZUmRU8vJA+5OgDnRvySik
         0VlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779216664; x=1779821464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auNMmPsKKmQDwMQx6p+X+IoKw+T0n0UlnhHmOoR8kKE=;
        b=BM1POPyekBuzYCjy8pOMcL3CHknkLvojBisKgMPTypLjyf8jN1mB6yjDDqJ9Lik9+9
         k4OANUD90KVGC6GBGIpdorObbUBSGOAcXQyNcSL7Py41MVpBm1rMzTUweuwZn+TTrflT
         AF02mnW/lpVRqlZ3NWYxKTDbVcqrJPxCssdpiazpX4uMK2vZzsjIpaPeXSmqE27azMJf
         iNV7fKrHnrt0fCrAxAiukt1yFL9TlekOxUFJ+/Y60InTreesougC/igx6KasR72XYyzp
         a9Y2imxlCzOMW/9/GSfZRGd026v2ilxra8MZg+h64nfarz6JAZ03cotnQCeWZqM4/b+f
         R9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216664; x=1779821464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auNMmPsKKmQDwMQx6p+X+IoKw+T0n0UlnhHmOoR8kKE=;
        b=jEg7IZscEmnh3FDAaME46PhO6cJGiy9URkgJtdIbgq1RvRlsvT/tS9zksjEDmVFpoi
         bakWEmB4MFsUQjCKH3dJCsAY7uf6IrnnpO7BvTUuZIUVeSHfz2SZt+YFhssfObCCDIAt
         ab3zCBY1hxc+nquTGTIxkjApygO7VlkqN1727WiqVPWxAuCtkzupMHiXv60bWl1NXBOc
         tzHbaUoGYoCXQ9QuqcYF12WOSdjQ6kToXGfIiYz+0U0GPhsqOfCiLiW9BKKnJHeAZA4o
         2k70u3393IfQwFoo/TLX9xVACO7/yDnhaw1TENut4nRcG3MDYd6lxIAjAZWte5Yf74DQ
         zssg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z3w86ObT0Qn6LbMSVCCfj086wZ8kTokTtJaxdT3NPGOLvwVkF5fDJqILktgWCM6ZlP8g8EQegD1GHKKtGiuvV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1EtAUCj/GiM6lzVpwCYVa6xcwNY0EoboDD6TV/o05p5wqiaSZ
	z7y4a4TUzgiLIc2RnZFcZ/jxK/KVa20kR3v4vzW/UwsqUuosnhnrI5JEDNRPzxA6Hyre+rWgccO
	fw/fDWDBX2pKbuTEpsXcxN0haSFlCMlQ=
X-Gm-Gg: Acq92OH8HtN+BMlZnuvSWuC5tM4n8489BKajvv6oQbqF3HyTX+S2XQYD9x5hkSpFHOr
	k0XTA0EiBUurzdhDVCCrulnwjOIHOP5VCL5PTJwNj/W3+bjTdHF1X8IPSzWNxdtfDCqQ6jI1yDf
	EXZ2GgoV7MdcPGtFwYk4VdZyLv+/ZLIUodjBYRu+HRKgcEYjeOTNYrhbeqxm/B27V54zf6jDsLc
	j7ZB35RB8CPNJo6kg1DCqTEyuXzm5XKqIP18gQoWXaHaZp5viCXa1ECauWDxhdcH13ws20NhMZX
	NpTn2XAwww==
X-Received: by 2002:a17:907:a68b:b0:bda:2928:ff9a with SMTP id
 a640c23a62f3a-bda292920a3mr99249366b.39.1779216663733; Tue, 19 May 2026
 11:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com> <CAGsJ_4w_-Y8qNLDeLX9OWpLpK01YG2bF-N6_mGypgsauvfCvkA@mail.gmail.com>
In-Reply-To: <CAGsJ_4w_-Y8qNLDeLX9OWpLpK01YG2bF-N6_mGypgsauvfCvkA@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 11:50:51 -0700
X-Gm-Features: AVHnY4JjQJo4iM5wAoXXEGJ4OEpxos0PYW3wieiPnlRi6plEliJjiQongYt0ODQ
Message-ID: <CAHbLzkpbQ4Ca0xC74BJ6iJUVKdpH90qE+E=g7HkDXvcNH1+8+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, jack@suse.cz, 
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
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
X-CRM114-CacheID: sfid-20260519_115107_394838_25958341 
X-CRM114-Status: GOOD (  62.35  )
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

On Tue, May 19, 2026 at 4:07=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Tue, May 19, 2026 at 5:21=E2=80=AFAM Yang Shi <shy828301@gmail.com> wr=
ote:
> >
> > On Sun, May 17, 2026 at 1:45=E2=80=AFAM Barry Song <baohua@kernel.org> =
wrote:
> > >
> > > On Sat, May 2, 2026 at 1:58=E2=80=AFAM Matthew Wilcox <willy@infradea=
d.org> wrote:
> > > >
> > > > On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> > > > > On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@inf=
radead.org> wrote:
> > > > > >
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
> > > >
> > >
> > > Hi Matthew (and Lorenzo, Jan, and anyone else who may be
> > > waiting for answers),
> > >
> > > As promised during LSF/MM/BPF, we conducted thorough
> > > testing on Android phones to determine whether performing
> > > I/O in `filemap_fault()` can block `vma_start_write()`.
> > > I wanted to give a quick update on this question.
> > >
> > > Nanzhe at Xiaomi created tracing scripts and ran various
> > > applications on Android devices with I/O performed under
> > > the VMA lock in `filemap_fault()`. We found that:
> > >
> > > 1. There are very few cases where unmap() is blocked by
> > >    page faults. I assume this is due to buggy user code
> > >    or poor synchronization between reads and unmap().
> > > So I assume it is not a problem.
> > >
> > > 2. We observed many cases where `vma_start_write()`
> > >    is blocked by page-fault I/O in some applications.
> > >    The blocking occurs in the `dup_mmap()` path during
> > >    fork().
> > >
> > > With Suren's commit fb49c455323ff ("fork: lock VMAs of
> > > the parent process when forking"), we now always hold
> > > `vma_write_lock()` for each VMA. Note that the
> > > `mmap_lock` write lock is also held, which could lead to
> > > chained waiting if page-fault I/O is performed without
> > > releasing the VMA lock.
> > >
> > > My gut feeling is that Suren's commit may be overshooting,
> > > so my rough idea is that we might want to do something like
> > > the following (we haven't tested it yet and it might be
> > > wrong):
> > >
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 2311ae7c2ff4..5ddaf297f31a 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -1762,7 +1762,13 @@ __latent_entropy int dup_mmap(struct mm_struct
> > > *mm, struct mm_struct *oldmm)
> > >         for_each_vma(vmi, mpnt) {
> > >                 struct file *file;
> > >
> > > -               retval =3D vma_start_write_killable(mpnt);
> > > +               /*
> > > +                * For anonymous or writable private VMAs, prevent
> > > +                * concurrent CoW faults.
> > > +                */
> > > +               if (!mpnt->vm_file || (!(mpnt->vm_flags & VM_SHARED) =
&&
> > > +                                       (mpnt->vm_flags & VM_WRITE)))
> > > +                       retval =3D vma_start_write_killable(mpnt);
> > >                 if (retval < 0)
> > >                         goto loop_out;
> > >                 if (mpnt->vm_flags & VM_DONTCOPY) {
> >
> > Maybe a little bit off topic. This is an interesting idea. It seems
> > possible we don't have to take vma write lock unconditionally. IIUC
> > the write lock is mainly used to serialize against page fault and
> > madvise, right? I got a crazy idea off the top of my head. We may be
> > able to just take vma write lock iff vma->anon_vma is not NULL.
> >
> > First of all, write mmap_lock is held, so the vma can't go or be
> > changed under us.
> >
> > Secondly, if vma->anon_vma is NULL, it basically means either no page
> > fault happened or no cow happened, so there is no page table to copy,
> > this is also what copy_page_range() does currently. So we can shrink
> > the critical section to:
> >
> > if (vma->anon_vma) {
> >     vma_start_write_killable(src_vma);
> >     anon_vma_fork(dst_vma, src_vma);
> >     copy_page_range(dst_vma, src_vma);
> > }
> >
> > But page fault can happen before write mmap_lock is taken, when we
> > check vma->anon_vma, it is possible it has not been set up yet. But it
> > seems to be equivalent to page fault after fork and won't break the
> > semantic.
>
> Re-reading Suren's commit log for fb49c455323ff8
> ("fork: lock VMAs of the parent process when forking"),
> it seems that vm_start_write() is used to protect
> against a race where anon_vma changes from NULL to
> non-NULL during fork. In that scenario, we hold the
> mmap_lock write lock, but not vma_start_write(), so a
> concurrent anon_vma_prepare() could still install an
> anon_vma.
>
> "    A concurrent page fault on a page newly marked read-only by the page
>     copy might trigger wp_page_copy() and a anon_vma_prepare(vma) on the
>     source vma, defeating the anon_vma_clone() that wasn't done because t=
he
>     parent vma originally didn't have an anon_vma, but we now might end u=
p
>     copying a pte entry for a page that has one.
> "
>
> If that is the case, then your change does not work.
>
> Nowadays, nobody calls anon_vma_prepare(vma) directly.
> Instead, vmf_anon_prepare() is used, and we always
> require the mmap_lock read lock before calling
> __anon_vma_prepare(). As a result, anon_vma cannot
> transition from NULL to non-NULL during fork.
>
> So the original race condition has effectively
> disappeared.

anon_vma_prepare() has some usecases too, but it seems like it
requires taking read mmap_lock too if I read the code correctly.

>
> You also mentioned the madvise() case. If I understand
> correctly, madvise() should take mmap_lock before
> modifying anon_vma. Only some parts of madvise() can
> support per-VMA locking. Therefore, we probably do not
> need:
>
> if (vma->anon_vma) {
> vma_start_write_killable(src_vma);
> ...
> }

I think we still need write vma lock to serialize anon_vma fork
otherwise we may see:

        CPU 0                                                 CPU 1
fork                                                       page fault
   src vma has no anon_vma
       skip vma fork

allocate anon_vma for src vma
vma_needs_copy() sees anon_vma
copy page

Then we may end up being no anon_vma for dst vma, but with pages mapped in =
it.

Thanks,
Yang

>
> >
> > Anyway, just a crazy idea, I may miss some corner cases.
>
> To me, it seems that we could remove vma_start_write()
> entirely now. Or is that an even crazier idea?


>
> Thanks
> Barry


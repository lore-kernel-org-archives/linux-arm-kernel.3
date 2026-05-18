Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0734FCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsFks/IQaK5zPrUgVquMlDUWIMq4vDiBKG2waN9CznQ=; b=EG/Clgc3FvaLKLCiAoDpRhxOaz
	UGBt9SX7UYVRDW2UwU7dMf8PMW5GS6x5GrtUe9+cS97NRlKf5+K7A8IP1qbV6Fft9cIeFCDG9l0Cb
	kHugNH9PDvm1wy8Bum9Mz0m2KhT0XkvRpcAyG9GcS/0d/ZFr+4rqc8Yu0NtUdEdfSYfKJfLKNbIJr
	dG3aQrEkQZuJCzolekGp5yCG9tZsozUCD9Wufd7R+iHE3Ok11rStBfgox2+NJyz/WY9KhbKSIlyWw
	JOL5YfFJOI/PX8iMCVvTfLdd8eW4iskzsDoLCPhB8NECcKpCxAb0D5uy9oE5EMpJMwXQEOFdhblnl
	BWD32LhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5P1-0000000Gyvu-3pR0;
	Mon, 18 May 2026 21:21:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5Oz-0000000Gyub-30mR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 21:21:30 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so5580537a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139287; cv=none;
        d=google.com; s=arc-20240605;
        b=BbrSUbQF8n61z0IDndRGPGYhdcSF66R0SqsA0Mfqev6MqC8GyTtmKIkCI8PeXp9lFa
         jyy+SUzErXPsvg8ymOHVW7Nx4Ds9ArZkwDeNSad5DlzOYTxR7+e3141KwGPziw23bds/
         LfnnzzuwAEt/xdOS9aWpnxKLQlvTYZWtrJTKse0IoRamzRV2oN/I1WFAS6pm9swWtxh/
         a4mVeA7iwWRArWLS1RYtlW4tLQfddYzgHn+TDVU54DEjJkFJQVHlkKzL6DqeC60gtQ3s
         nfToUKU7jJO9bjr53kESXyS4g1bf5BVGcemRnNKcCUmgyNYBpAw2wi4Su1gbV8xNrQNT
         rCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EsFks/IQaK5zPrUgVquMlDUWIMq4vDiBKG2waN9CznQ=;
        fh=mAZaZLhNI/ul5Q6cjsl9hbj4Na25Ud+PqMNWvzGfrbg=;
        b=TXdiKlQlUBbXg+3/E92FwGL/RCvRavv6PwNBVyP8CviKziWGy1W3dr1R5BfGChY98l
         j4TA9RelC8N9b/SQ53f4CHI3DuOcGPy9b/4syue/+HI6xBc226X9aZSGd7PfdhybBUsb
         ngoPXzJohcb58YjWw3TGDStKgmoJNl/VMzJlka1F+Ujnb2kczUmGtC9Q/JEsRyTc7xsl
         VCmkgYwvreZLU7fWqNaEPxQxJoUFT5bkydmUCQq6QCrjWjE1A6f2q8eXy6RdZpN4tQD4
         rKHOBi9e9PeJOvhCVqEG+7iBkUSy9Y2NcOmDuHpEzSLtZPtfusKgnRdBE7jvEW+8JKQm
         /YoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779139287; x=1779744087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsFks/IQaK5zPrUgVquMlDUWIMq4vDiBKG2waN9CznQ=;
        b=rBtUJzjAGe8SlkxmEcmk4no6wsIfJg7VB4wdHe26/8NfNiQZjQjSouXVlDrkuWKex0
         sALvLvFj9yzCYXtSP3zr0UCMLhEm2V6RoQeDUacwHIcS4ge4W+4/SCYsrjvIVc+y0eIP
         xPWCONgTlOFoglawYb04eSsLbSV9MeyNV5sSHEQ1ozspMDgMfKpmCZ0os576sq3NCntM
         mXodrIBZ/eBrfhARawJH780yn53nyka1ihCAkDkIIi2oNMWJRO0Laz9JG/jD4B8PSSQq
         /T5Qw9cUTJIB2iu2z/ZB6KYaTYDaEZes7LfUq4JO4PS/23BT3xE6HG73n9TyMjzp9kx0
         b8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139287; x=1779744087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EsFks/IQaK5zPrUgVquMlDUWIMq4vDiBKG2waN9CznQ=;
        b=P2tTLTF72Z+AGWS6IHbXTKDQGFbu92kMP0WicYIN7mDa5RZxCQQ+WJB+dpfnEtpSls
         m5ZASEPVZp7F/bk7AUWX5A6WWnSif1PHsBenzUYupdikp+6UIPIBMZKj2ppDAw4clWoA
         GESB5S61ts088scgYDNQZSyJkUMrPn7DHIcws8cShV/7hu0vGPfAG8izHhnabt+1iwDk
         gi7ndFs79u8sSdUwhv418MDFDtZ9OgzpmaPEgj67cuiOBOw4m5FV7XY/xPcEDBQnwUrD
         KsTzaxQUgAMSS6PR8vHwQ1EtrSp7qeF1uxGiR5H+ASz5ipYxENZ9CW8eu2LCPWRZYue4
         w1uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uWqZ+Jr0wVxmQ69tgPx/ReAh24DvSmkfzHlWOnFiqWHqxpVywsoUubbPT4sERlCGxqme8MIJ3EMR2CR5XPZN5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm2UllsluSomsJip9cFTsaGbvo8AbEyug++CG827fqRh44Hd4y
	nkVjLNeQ07KQdg8Zny8jkGUcu+sVkpNF/SLWl5Ok6rgZR5LCyL2G+3P7QyTZ5Y102bHg6oQzKK8
	nvxGjXzNEsQV+redzXpwMrW2RnP2INV4=
X-Gm-Gg: Acq92OH61woSrMEpf0Ac/SMU1ecmyqOX6y5O4X9QlZaFH/tgCZuBfaG7lmDBmEtXrQz
	DtSIOu1bxP6KwS6lk+/FXKYgLzifS9kXZ7Ejb8N8+MwzW7j7h9kSBNLH6d8DzCz0gdNJyvrNArU
	SioYA9Pp4XH4I8W5MWW0FH2RzXhl4KS7m8AzmbopL0X2UPoaGYq7cak3jVxbYWZVlYaG7+/hSoq
	qn3YWWlJziD9lwEjIcjLDJ+OOVCt+vCZ+iLl11jKBqgOPBINiFkIJSVh3uVE5QKouwh7m/vQ3CC
	65q3pfs=
X-Received: by 2002:aa7:d315:0:b0:683:6705:6e09 with SMTP id
 4fb4d7f45d1cf-683bd38d823mr5757913a12.13.1779139286945; Mon, 18 May 2026
 14:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 18 May 2026 14:21:14 -0700
X-Gm-Features: AVHnY4JdohddXKx4c8RBQ6M1uUtTSitdJHlU74cl49fvebK4jjJ2w6iuf3X83y8
Message-ID: <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260518_142129_797291_DEB67B49 
X-CRM114-Status: GOOD (  51.65  )
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

On Sun, May 17, 2026 at 1:45=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Sat, May 2, 2026 at 1:58=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
> >
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
> >
>
> Hi Matthew (and Lorenzo, Jan, and anyone else who may be
> waiting for answers),
>
> As promised during LSF/MM/BPF, we conducted thorough
> testing on Android phones to determine whether performing
> I/O in `filemap_fault()` can block `vma_start_write()`.
> I wanted to give a quick update on this question.
>
> Nanzhe at Xiaomi created tracing scripts and ran various
> applications on Android devices with I/O performed under
> the VMA lock in `filemap_fault()`. We found that:
>
> 1. There are very few cases where unmap() is blocked by
>    page faults. I assume this is due to buggy user code
>    or poor synchronization between reads and unmap().
> So I assume it is not a problem.
>
> 2. We observed many cases where `vma_start_write()`
>    is blocked by page-fault I/O in some applications.
>    The blocking occurs in the `dup_mmap()` path during
>    fork().
>
> With Suren's commit fb49c455323ff ("fork: lock VMAs of
> the parent process when forking"), we now always hold
> `vma_write_lock()` for each VMA. Note that the
> `mmap_lock` write lock is also held, which could lead to
> chained waiting if page-fault I/O is performed without
> releasing the VMA lock.
>
> My gut feeling is that Suren's commit may be overshooting,
> so my rough idea is that we might want to do something like
> the following (we haven't tested it yet and it might be
> wrong):
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 2311ae7c2ff4..5ddaf297f31a 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1762,7 +1762,13 @@ __latent_entropy int dup_mmap(struct mm_struct
> *mm, struct mm_struct *oldmm)
>         for_each_vma(vmi, mpnt) {
>                 struct file *file;
>
> -               retval =3D vma_start_write_killable(mpnt);
> +               /*
> +                * For anonymous or writable private VMAs, prevent
> +                * concurrent CoW faults.
> +                */
> +               if (!mpnt->vm_file || (!(mpnt->vm_flags & VM_SHARED) &&
> +                                       (mpnt->vm_flags & VM_WRITE)))
> +                       retval =3D vma_start_write_killable(mpnt);
>                 if (retval < 0)
>                         goto loop_out;
>                 if (mpnt->vm_flags & VM_DONTCOPY) {

Maybe a little bit off topic. This is an interesting idea. It seems
possible we don't have to take vma write lock unconditionally. IIUC
the write lock is mainly used to serialize against page fault and
madvise, right? I got a crazy idea off the top of my head. We may be
able to just take vma write lock iff vma->anon_vma is not NULL.

First of all, write mmap_lock is held, so the vma can't go or be
changed under us.

Secondly, if vma->anon_vma is NULL, it basically means either no page
fault happened or no cow happened, so there is no page table to copy,
this is also what copy_page_range() does currently. So we can shrink
the critical section to:

if (vma->anon_vma) {
    vma_start_write_killable(src_vma);
    anon_vma_fork(dst_vma, src_vma);
    copy_page_range(dst_vma, src_vma);
}

But page fault can happen before write mmap_lock is taken, when we
check vma->anon_vma, it is possible it has not been set up yet. But it
seems to be equivalent to page fault after fork and won't break the
semantic.

Anyway, just a crazy idea, I may miss some corner cases.

Thanks,
Yang

}

>
> Based on the above, we may want to re-check whether fork()
> can be blocked by page faults. At the same time, if Suren,
> you, or anyone else has any comments, please feel free to
> share them.
>
> Best Regards
> Barry
>


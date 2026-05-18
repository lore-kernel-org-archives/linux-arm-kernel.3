Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6E1CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=; b=oujx4f+OR2JkCmfVA8ZdtHbM9Q
	xHLm1KCMt0h4V2ewEw+dhABheutr3aNVb0JshzcCAQQBE3ExWPRmtpeyDZrn0bygHE386pdyJbSWv
	Hg8dLvRYfi6OtPRg0A3wVzR9EiKv6kIukgua1OVrP/4Nei0TIgbbSSqVcDH/tsEDFVA8lRiRru+4k
	FC9FJhEGQ7Vo293FYWxFOPkM8nuoCdmJdv5Vr/k1vQ0aj6dbFnwhI6ptqiUOLlNslzHfq3/WuxGdy
	d5KMiRAIZQWd1B4Eox1y/DOlYkFMMex7oodYFI8jXJ1cTh98Zpxzgy8YOXt3bUzQRfRnfa/oz40bM
	OTMePFnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP45V-0000000GoiR-2dHk;
	Mon, 18 May 2026 19:57:17 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP45R-0000000Goh9-48Lv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:57:15 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50e61648f10so5801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 12:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779134232; cv=none;
        d=google.com; s=arc-20240605;
        b=lV7dqpdmLrdPp/jU/WKNFL5u9nR6UObaxn7VW0bWdHfRt7U/ELZOmh0WdQOyhU6M/n
         R5cppx+2UAtiBtp1IZwK+7PLd7l02BBq/u9iQYpS2P0Ler3jTiy+MiSrEvP5TlLamFtW
         frCiSa7r9iXirX8d1V5wnDDcJYi6z+JwMEoI1V6yiT3ebijSYg2iXm9LN+1BKT72oR5I
         bU62KVqgztbMAM7O3BiC96nzbYj2ccSD8Aa34PoesR44S/hbF6G84zHRxFyEUoTWSUpc
         MsmvGZL189V295qDmYsLTOgvOodpDTV+892B34zwy3b43sYHyAXdD+Lz1DjUJclSIlx7
         C8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        fh=c/mlyknvvV4AJ/LW2qogGnNhWynyhLzuMojQWn2Tlz0=;
        b=B8ki6CmSTo36pSImOn60zw/HmTpfaGYe5+me3qPLQANsKAazJNcDrQoT8l/2AhD928
         l/fyvlc6/gTnLKHkFLHipvhRgmzp8ZAaDFFvGjDq8/NKLjmAjSwxNmC300a6J5qV8pSn
         s/yhZHXdKXyJAkaMf9+KAnEmkGIDZwXxEjQVu2uBtKQLCy0/UqlQVaJXt357vORwIWY4
         Ckf326gn1WyoUYzdLjzd9hwqfd1IomTXdRM0mp4C8uql+iJqz+KrVzOtCrLgYo1Wwpgn
         a+1e4P9lIjjqGPASE6QdAEZkQPruiLfOL4eBFvpAWREIK4eRWpod6cwWdHCsfVJW+1Z1
         W4SA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779134232; x=1779739032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        b=UmME8FLbKuacmhsaR1BYtoJW/iZMQnTKoq3g/86dwxinwFHALTMAUjv7m8kUdR3vpj
         L6bscYzn57eIoVdu1meZppy/uTqh7J6bhMg2lWmvsf4Ut4TOz79r169NE+dtpYr+lIjY
         U0suor2m8nFJ1xJvBmTMkGtLxNPLVqj3Mfvk3OaCiT5mxUfBakRFb9nT3wH2kp7dNKd9
         E1uMPYtxCtSF6+4aDBIdGnicEylOuEapkeYDUW9POjQ3e2/1cYHTxFxtnd6wJiPR9wnJ
         p0hqrAdoy6cuq3tEiSf3BMGw5/Vba+hTqApIjPkIJIOABSvcldPloHLN92g5OWwDKMiO
         NfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134232; x=1779739032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        b=KWMPxtWtZrX6au9oRhw51kFic/o+UFkoF1gk5VR7CosV1ux2aJlhm/UvoYpN3bsVxd
         i1BehJ8gELdQqgww9A9QBktMwa3vhjOK21rjp0XSnNnOPyLfL+xdaQZjIXPT7/OWTEJZ
         xpx2TciVO8tpIRbqjuEpAt913wBQ87Hna/G3tr+vUzyUDkQB1PmEixKugCkvnFNtF0dc
         3UwgmKTj/bZRvJ3h55uGuBAObMiKQF6MJawhHExlh41nTX4PJ2Lxdu+cExWFl6gXD4oN
         ykEEgIhw6Huev8bQOWGls93UfjGvhLaVCf+jhp6iytHgnlyYNBUNB5FADEFO8TpMIQFV
         9Puw==
X-Forwarded-Encrypted: i=1; AFNElJ8b60jDmWNY4ZZf6HiTBzwS8rvbeV53f3fSvr1myyysljtGhoKKR/toMMBxjLG9cWK7jfTNvAlclgekevV94gUj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6qHJIUI7urQohTzz6tnVpYCDsZKYxtLUI8o/nQ0t2djaTSIwf
	y3w5DGL7An2KbYHyC1X3efjlx076rDIjnG+tIOC3x0dTzdcDXYkJcO8iw2BcebmXYDi6zokKxox
	2GJ/Q7UlJDEH9SFXRMXinswVkEItDUyxS+SFtf5W7
X-Gm-Gg: Acq92OHSNCoouGZFLygxOmB4ST9J3obrqMceZBwAaqVrMGpRm5blXOvhTaQqaHSjn6K
	grk3/GB2Ax+FRKadsqOo7rRHAt8IWKwLY56CbIROEmHIhsZuV2xvac/aCJUq6S0rDpIxOoIeOKJ
	5MCgdDGm6NG50k4hn/FS3VUJOrSO+WDenFiiUUru/w0hK7AfRGOcdNlUarv6u1uCphsKeyNbz3G
	i0t3UziC9igIiW1/saiXYoXNP7KOmOWbMBbaARSUWT3fgrstOZk+ailhd8iE7tsKcscQkII/m9c
	LRY8dXXvE43110f6
X-Received: by 2002:ac8:5907:0:b0:510:f9b:fb5f with SMTP id
 d75a77b69052e-51679440a95mr20949301cf.16.1779134231137; Mon, 18 May 2026
 12:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
In-Reply-To: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 18 May 2026 12:56:59 -0700
X-Gm-Features: AVHnY4LKURvCbX_IJPUmfCTmwYP6SL9RXK1r_86Qf4VKBQdD4r83VbCvOh5ZGPk
Message-ID: <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125714_083962_6CF5943F 
X-CRM114-Status: GOOD (  68.82  )
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

On Mon, May 18, 2026 at 4:26=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Mon, May 18, 2026 at 5:47=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> =
wrote:
> >
> > On Sun, May 17, 2026 at 04:45:15PM +0800, Barry Song wrote:
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
> >
> > Hm but did you observe this 'chained waiting'? And what were the latenc=
ies?
>
> We have clearly observed that the `fork()` operations of many
> popular Android apps, such as iQiyi, Baidu Tieba, and 10086,
> end up waiting on page-fault (PF) I/O when the VMA lock is
> held during I/O operations. This has already become a
> practical issue. I also believe this can lead to chained
> waiting, since the global `mmap_lock` blocks all threads that
> need to acquire it.
>
>
> >
> > >
> > > My gut feeling is that Suren's commit may be overshooting,
> > > so my rough idea is that we might want to do something like
> > > the following (we haven't tested it yet and it might be
> > > wrong):
> >
> > Yeah I'm really not sure about that.
> >
> > Prior to the VMA locks, the mmap write lock would have guaranteed no co=
ncurrent
> > page faults, which is really what fb49c455323ff is about.
> >
> > So Suren's patch was essentially restoring the _existing_ forking behav=
iour, and
> > now you're saying 'let's change the forking behaviour that's been like =
that for
> > forever'.
>
>
> I am afraid not. Before we introduced the per-VMA lock, we
> were not performing I/O while holding `mmap_lock`. A page fault
> that needed I/O would drop the `mmap_lock` read lock and allow
> `fork()` to proceed.
>
> Now, you are suggesting performing I/O while holding the VMA
> lock, which changes the requirements and introduces this
> problem.
>
> >
> > I think you would _really_ have to be sure that's safe. And forking is =
a very
> > dangerous time in terms of complexity and sensitivity and 'weird stuff'
> > happening so I'd tread _very_ carefully here.
>
> Yep. I think my original proposal did not require any changes
> to `fork()`, since it simply preserved the current behavior of
> dropping the VMA lock before performing I/O. In that model,
> `fork()` would not end up waiting on I/O at all.
>
> What you are suggesting now appears to be performing I/O while
> holding the VMA lock, which in turn introduces the need to
> change `fork()`.
>
> >
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
> >
> > To nit pick I think the comment's confusing but also tells you you don'=
t need to
> > specific anon check - writable private is sufficient. And it's not real=
ly just
> > CoW that's the issue, it's anon_vma population _at all_ as well as CoW.
> >
> > > +               if (!mpnt->vm_file || (!(mpnt->vm_flags & VM_SHARED) =
&&
> > > +                                       (mpnt->vm_flags & VM_WRITE)))
> > > +                       retval =3D vma_start_write_killable(mpnt);
> >
> > I think this has to be VM_MAYWRITE, because somebody could otherwise mp=
rotect()
> > it R/W.
> >
> > I also don't understand why !mpnt->vm_file for a read-only anon mapping=
 (more
> > likely PROT_NONE) is here, just do the second check?
> >
> > (Also please use the new interface, so !vma_test(mpnt, VMA_SHARED_BIT) =
&&
> > vma_test(mpnt, VMA_MAYWRITE_BIT))
>
> Yep, I can definitely refine the check further. But before
> doing that, I'd first like to confirm that we are aligned on
> the direction.
>
> If you still intend to hold the VMA lock while performing I/O,
> then I think we should fix `fork()` to avoid taking
> `vma_start_write()`.
>
> >
> > >                 if (retval < 0)
> > >                         goto loop_out;
> > >                 if (mpnt->vm_flags & VM_DONTCOPY) {
> > >
> > > Based on the above, we may want to re-check whether fork()
> > > can be blocked by page faults. At the same time, if Suren,
> > > you, or anyone else has any comments, please feel free to
> > > share them.
> > >
> > > Best Regards
> > > Barry
> >
> > Technical commentary above is sort of 'just cos' :) because I really qu=
estion
> > doing this honestly.
>
> I think we either need to fix `fork()`, or keep the current
> behavior of dropping the VMA lock before performing I/O.

I see. So, this problem arises from the fact that we are changing the
pagefaults requiring I/O operation to hold VMA lock...
And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
anonymous and COW VMAs only while holding mmap_write_lock, preventing
any VMA modification. On the surface, that looks ok to me but I might
be missing some corner cases. If nobody sees any obvious issues, I
think it's worth a try.




>
> >
> > I'd also like to get Suren's input, however.
>
> Yes. of course.
>
> >
> > Thanks, Lorenzo
>
> Best Regards
> Barry


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F992CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 00:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHIwIiKiSPJeb13YpcTgfxJcsK09+PRa0/JU1j/CnWg=; b=iYWabjh1t+ZxEasdB6kJaj+9Xk
	ANfehBHGNyBTXOAYgtjBly0o+wospk7UlFhqBg21+6IAXgYMHAuGEpCc5ro9M7Jhpq5hpEQgYIepO
	C0zqTkY3HjHS3msQuTBX38heqf2HivXDRLg4aluxamsMoqnDIViyVoT8KuZHxlQ2q/AqZEnPiQ3/s
	wSoE2HBJMTKQqdmo8K5s/3KutqYUYAnZyVNm0N8WSvx5CdYp20IOvJqm1rQPx70VHH8QEc5S+k/Rg
	XND1q0bpObAfFypXQyQ1BC0tCdNSUQbzhoMVK6VBuzlj9nbFq2uupvYNAI0mvCIYS+gXeWBl6j4zX
	TlUR9ehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbSKg-00000004FFW-0CGw;
	Mon, 22 Jun 2026 00:16:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbSKe-00000004FFH-1owk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 00:16:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1C4A444BF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 00:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9862C1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782087367;
	bh=IHIwIiKiSPJeb13YpcTgfxJcsK09+PRa0/JU1j/CnWg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cMLhsAttTe8dyYAVQ5ButgRPTCNVZUjJ+rFUJS/Nb+BEGqhTUydcs0LU3Lix/Z3ek
	 KD0MCI/yAPBWlN6wb7sqDiwlAttozmfCiUFWz9O3jE4hYXuyhq8p1QaOAF9Rxm+bPp
	 zboU9r+goMAm9xbYv8LFtKEEZ5j6ZLteAPSQZ6OcSh5MIs/62zPpZIj5oiIaFmvUDR
	 QC6ZRHtySEUkXZIEInSyph82+HpL4LpnJ7gqwRc/Aciq0eNZH9YLMUThL9XzXyeqjI
	 Rm0VjsR1+yxuogHe+HIFTcJ5KRUzQnReJU7/nUzkEoFcP0eQK2LX+MLHdOMaRBfjL5
	 BYH2jN1C6LQGQ==
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-517863a2edfso29922911cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 17:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8XgmH4AnuksmW0MH0boJGARt18n2jQPOAu4RZEijgsOhQgDisAma1Pfsay+5JFoQbG4aDrR3J5GvDoC+GC1WTE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+gk09Yo76MsN9cBwf74fhBP3rgVS6jX2tSbe8eC8OIaO3hpXW
	3l1U/v1ODd3+UtK97125f9SP9JniRpbWmaZRzpkdwvspSfPgxPWGpha2FsYi8UdRLkG/IMomDan
	oo+Kgbznrra0pFdp75KhLcHW/X574rq0=
X-Received: by 2002:a05:620a:2991:b0:920:bc4a:6d9f with SMTP id
 af79cd13be357-921d185ff31mr1291391485a.25.1782087366553; Sun, 21 Jun 2026
 17:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org> <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org> <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
 <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com>
 <ahB6QyHgYq8ksj65@lucifer> <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
 <CAJuCfpHTxaU4KdNmefU7C7cWZSLCFDLPdUrnqV6yzxzN+8RQ0Q@mail.gmail.com> <ajhOUdbWsswgQyl2@casper.infradead.org>
In-Reply-To: <ajhOUdbWsswgQyl2@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 22 Jun 2026 08:15:55 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ybg5LGYopTUJTh5R2rN6X3uR9xoJSL+RdTYVtm1-xqLg@mail.gmail.com>
X-Gm-Features: AVVi8CfKzSAPaNgcIJCxOHQBAHV_wanqXUmTigM-8i98Bk0ci-4XCgmSQNzZol4
Message-ID: <CAGsJ_4ybg5LGYopTUJTh5R2rN6X3uR9xoJSL+RdTYVtm1-xqLg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
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

On Mon, Jun 22, 2026 at 4:49=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Sat, Jun 20, 2026 at 04:48:57PM -0700, Suren Baghdasaryan wrote:
> > Just checking in on the followup plans. IIUC the RFC mentioned will
> > try to implement the solution we discussed at LSFMM: splitting
> > VM_FAULT_RETRY into two flags - one for retrying under per-VMA locks
> > and another one to fallback to mmap_lock.
>
> I continue to hate this idea.  I don't believe that those who were
> pushing for it have ever tried to understand the whole fault path.
> It's utterly byzantine.
>
> I defy anyone to make sense of this:
>
>         /*
>          * NOTE! This will make us return with VM_FAULT_RETRY, but with
>          * the fault lock still held. That's how FAULT_FLAG_RETRY_NOWAIT
>          * is supposed to work. We have way too many special cases..
>          */
>         if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
>                 return 0;
>
>         *fpin =3D maybe_unlock_mmap_for_io(vmf, *fpin);
>         if (vmf->flags & FAULT_FLAG_KILLABLE) {
>                 if (__folio_lock_killable(folio)) {
>                         /*
>                          * We didn't have the right flags to drop the
>                          * fault lock, but all fault_handlers only check
>                          * for fatal signals if we return VM_FAULT_RETRY,
>                          * so we need to drop the fault lock here and
>                          * return 0 if we don't have a fpin.
>                          */
>                         if (*fpin =3D=3D NULL)
>                                 release_fault_lock(vmf);
>                         return 0;
>                 }
>
> Wed need to simplify the fault path, not add additional complexity.
> Josef has said he wouldn't've done the lock dropping had we had per-VMA
> locks.  We should rip it out.

I think you have agreed that, at least for anon vma, we can
keep the current policy, since anon vma is much more volatile
than file vma.
Concurrent page faults and VMA modifications can happen more
often than with file VMAs.

For file vmas, how much code can we actually remove, given that
the first page fault might already be holding mmap_lock?
It could be the case that lock_vma_under_rcu() fails, and then
on the first page fault we end up holding mmap_lock before
retrying. So are we also going to rip out the lock release,
even if it risks holding mmap_lock for a long time?

        vma =3D lock_vma_under_rcu(mm, addr);
        if (!vma)
                goto lock_mmap;
       ...
lock_mmap:

        vma =3D lock_mm_and_find_vma(mm, addr, regs);
        if (unlikely(!vma)) {
                fault =3D 0;
                si_code =3D SEGV_MAPERR;
                goto bad_area;
        }

If we still need to keep the page fault retry code there, it
doesn't seem like "ripping out" really reduces complexity in
the page fault code?

Best Regards
Barry


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E787FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyIAHMCO2XSEKhIrNQWe82Ob3aOc1tSJG1laNn5OlYg=; b=MsLzSV9E7AWFeMTmdjcUUHwXsi
	cfJ5pjGkn2L8P1GevQT51NXvKpz6OgKpbXmS0jwpmdQ5CR23hb6NIGWHtREy6/Yp+LLrpnyUgP+B4
	znIwZaLjJnNRH3NaNVnTxBCa8AxLkg8Ml9ULeuMDL291qKRKBJlgzStgOx7nmhWTln+gtguferAl8
	8jz2f3/66pzyvWi7LMLbHw0YhW4xLU9K3f7Jfs/kVb3yL1vFC98k9sVz/xm75QnXHopkTRaJ/ajmb
	V+tM4pq0fbARkvfeq0sdKbvv1p8c0C9t1WIwq1JoM9gez4pTjd2SjTKadrUCGc2am7XMea3zOiaU5
	8h9U9Rfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIaD3-000000064RY-0dUx;
	Thu, 30 Apr 2026 22:50:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIaCz-000000064Qi-3mHF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 22:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C0AF444D1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 22:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D75C2BCFA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 22:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777589412;
	bh=EwR29NH5HVcLbVvA5ViI57mAmHT3DBCHHsLg0gf7Cic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dBXZ2oY8bPD0T7Gd4Of7GUZOb84hKrxvQlNnKxyNarxinIUzFHyBM9s+qDR4U9LPp
	 +Hc8F8WFDCZQqqo+npT5fUj0txmJKGzK48NWf+a5HFI0nv9pWEpw/7Z7MiE/1dYHmC
	 B12UZdt6YCq68u/rqEbIGy9P6FZiNurFRNlp3PZg9yOU7Gob8iSTSCXSUBOt2JbkAC
	 Fwp47SUVHvHazO57YaIALODnh+Wg6M0vRWtAdK9btMOZWw3UF7+id1X74wqvWjE3jS
	 uK3gMgeJ00mb08GoZiRN6AIHhiPzdeZPoa0S7aYZkNoWzKQDPWrMHLEaBFdV5I1od5
	 XDQUtFcs0lleA==
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8a032383008so15108226d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 15:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+jDmqL+8QFymJ7+tCzfJCoVHvyQtoyGJaGdIJH3I7+cA3PhMZnlt6weJRyG6TQ5x2/UMMA8S/7rutYqbQP0XSb@lists.infradead.org
X-Gm-Message-State: AOJu0YyqOptCoRNF+d1XalejALGBaQpsL7x9ShTJA3MrzmIqGIUUKqQw
	lhpWsmU32A5PNC2II0y2z58wwIizqXGOWxKdGPxlHmGlXyL1qbze8w2rGXp6uwFzQXE3L11e3U7
	/TJay9gWpuyPGiH9fI5FisTLSkr2Ns0Q=
X-Received: by 2002:a05:6214:3f81:b0:899:f092:9da with SMTP id
 6a1803df08f44-8b3fe7bd179mr81439146d6.28.1777589410935; Thu, 30 Apr 2026
 15:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
In-Reply-To: <afNM-gIqxpyJ6ro7@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 1 May 2026 06:49:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
X-Gm-Features: AVHnY4LNqeENq1Hu8yfE3Ha6l6qy4pcPzLhOvHSM0QbVepERNdbmRODWwcwvH-c
Message-ID: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260430_155014_017769_CB904C13 
X-CRM114-Status: GOOD (  18.18  )
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

On Thu, Apr 30, 2026 at 8:37=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Thu, Apr 30, 2026 at 12:04:22PM +0800, Barry Song (Xiaomi) wrote:
> > (1) If we need to wait for I/O completion, we still drop the per-VMA lo=
ck, as
> > current page fault handling already does. Holding it for too long may i=
ntroduce
> > various priority inversion issues on mobile devices. After I/O complete=
s, we
> > retry the page fault with the per-VMA lock, rather than falling back to
> > mmap_lock.
>
> You're going to have to do better than that.  You know I hate the
> additional complexity you're adding.  You need to explain why my idea of
> ripping out all the complexity now that we have per-VMA locks doesn't
> work.

Yep, I know you don=E2=80=99t like the added complexity, but I would rather=
 prioritize
user experience over simplicity. Let me try to explain in more detail.

1. There is no deterministic latency for I/O completion. It depends on
both the hardware and the software stack (bio/request queues and the
block scheduler). Sometimes the latency is short; at other times it can
be quite long. In such cases, a high-priority thread performing operations
such as mprotect, unmap, prctl_set_vma, or madvise may be forced to wait
for an unpredictable amount of time. For example, if low-priority tasks
trigger page faults and issue low-priority I/O, a high-priority task
requiring the write lock may end up waiting for an unknown amount of time,
depending on the block layer and filesystem behavior.

As a result, high-priority tasks are exposed to unpredictable I/O latency
introduced by many low-priority tasks that may generate a large number of
page faults.

On Android, latency in certain tasks can significantly affect user experien=
ce,
such as interactive threads. Priority inversion is particularly problematic=
 and
should be avoided, especially since we have no clear bound on how long we m=
ay
have to wait for I/O from other tasks.

Meanwhile, priority inversion can propagate through a long chain: a writer
waiting on I/O from multiple concurrent page faults may end up blocking oth=
er
writers and readers as well. A long-waiting writer can also amplify
mmap_lock contention, which we still rely on in many cases.

2. VMA sizes can be highly uneven: some VMAs may be very large while others=
 are
small. We used to have many reasons to release mmap_lock when we did not ha=
ve a
per-VMA lock. Since VMA sizes are not uniform, those same considerations ma=
y
still apply to the per-VMA lock when a small number of VMAs account for mos=
t
of a process=E2=80=99s address space. I recall that Suren also mentioned th=
is[1].

So I would prefer that we hold only the per-VMA lock and avoid retrying the
page fault when we are reasonably sure that I/O has already completed and w=
e
are only waiting for short-lived conditions. Uncertainties in the block lay=
er,
filesystem, and GC behavior, as well as latency-induced priority inversion
chains and potentially amplified mmap_lock contention, can significantly hu=
rt
Android user experience.

[1] https://lore.kernel.org/linux-mm/CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YEx=
w7gO1pmngC3Rw@mail.gmail.com/

Thanks
Barry


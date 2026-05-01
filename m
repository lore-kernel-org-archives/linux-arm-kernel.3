Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31118CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+/e7dJt2MU31Z+SqBYGMwjuUbd0OotWBmXxOfFOWyI=; b=mgRNcgQaxUibZ50be5xiGhpD41
	bXu/N5im0U5CFfbbykuQjP7jtr0ld4eALgpJ4IPR+KKe/B8/O6qDJnd7GRRO0vUWPzIqtZVUE5RSh
	eIFfoANzOAKzD/d8UAddGR2PdNe+NpDTginP39ype7qbyJ0KI+ZjtIipFcF2kVr/aEjvHicNbIh/m
	C9OP3ycWcONTo98UbOpgHp2vFD5maBoXHkJ8OHSuOy5Ztb5O/zELAouNhT0fTzWNTL6+pzxIxM60w
	CMrIKHgpT6ODFeL7U66aGsAXMuohdfBsPBMRFwSqgVGCHLuWb04DyavcnIACJXUbOIFNXov2Zybug
	7MBkEx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIs9B-00000007Xmf-2KBH;
	Fri, 01 May 2026 17:59:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIs98-00000007Xls-3MAA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 17:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFCDD4455B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 May 2026 17:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43CEC2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 May 2026 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777658365;
	bh=q/vvVmaTofrvdifxLcOjX8owb4zQpccO2C7Xr55syLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JbTv8Nf1y3JWuLvIXZgUs1p4s5+B1GUlld0WRZbXF6rHJnF7FXG1rC3Vd4wOH+FWf
	 /lu8+oad1AE755FSug1ZcbNt0IQc1USHsGef5ccGfcxzq95KtuLoC1nLMlrSQKzgi+
	 tTiQMMhrfbld8ymAgyQwEiY7I8BtqZz3pZGkD9sFmJ46nTjfdLk01RnECNuTHbUx0N
	 /o9MUrK9GRGCK4V7AJo9DxsUNN94FU6bSe/lBLB3HEZbgoDtdPCtJ4BLITTZoIcrFs
	 HYAyPtyGq9f56cLDbdFj9zzu20514g+BkK1RgtuqirVOywKHAzhsojpDQjUdjBms4R
	 0K/BQ+D5iTcCQ==
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8acb856a674so27617956d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 10:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+opDpFmMySXUp0wYvX+T4EINw/Vnm3pEgt7/p6+776bYR4WxFxSYSVHwbm9fvj/YTtik1yOqtp1Tl1Ted2e26i@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn70CaP7W71BhZd/w/JXwjbKo0Qc/mcngjJrJKkmt4gRTnnQdm
	KjjePCVgOkNF8dNoq36JpkM99m8AwCULARTywr74IPN5suqjyYzTpDml+PcLGGOK/k8TGO8EaOC
	TMQ0H9/KWEHuQLhs+SfeoOEf2m0PwGlA=
X-Received: by 2002:a05:6214:3113:b0:89c:7bf8:c564 with SMTP id
 6a1803df08f44-8b4000bc68amr106932516d6.27.1777658364833; Fri, 01 May 2026
 10:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <afTKsSj0i-ZkRZN5@lucifer>
In-Reply-To: <afTKsSj0i-ZkRZN5@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Sat, 2 May 2026 01:59:13 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w4jyQTzvPSzGtv1r5G35kARHrf4WgDvEiOAw8k5AAABg@mail.gmail.com>
X-Gm-Features: AVHnY4IozGRsOfIFCBuTWYpA9lpafQxUB9l3oBl_1mgfquoOdt6gfYLqIWFbDj8
Message-ID: <CAGsJ_4w4jyQTzvPSzGtv1r5G35kARHrf4WgDvEiOAw8k5AAABg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
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
X-CRM114-CacheID: sfid-20260501_105926_876265_0C5739E9 
X-CRM114-Status: GOOD (  21.88  )
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

On Fri, May 1, 2026 at 11:52=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Thu, Apr 30, 2026 at 01:37:14PM +0100, Matthew Wilcox wrote:
> > On Thu, Apr 30, 2026 at 12:04:22PM +0800, Barry Song (Xiaomi) wrote:
> > > (1) If we need to wait for I/O completion, we still drop the per-VMA =
lock, as
> > > current page fault handling already does. Holding it for too long may=
 introduce
> > > various priority inversion issues on mobile devices. After I/O comple=
tes, we
> > > retry the page fault with the per-VMA lock, rather than falling back =
to
> > > mmap_lock.
> >
> > You're going to have to do better than that.  You know I hate the
> > additional complexity you're adding.  You need to explain why my idea o=
f
> > ripping out all the complexity now that we have per-VMA locks doesn't
> > work.
>
> After a brief eyeball I share Matthew's assessment, I really don't like t=
his
> series, it's piling on complexity for what seem like niche cases.

I=E2=80=99d really appreciate it if you could point out the specific parts =
you
dislike, rather than the whole series=E2=80=94I don=E2=80=99t think that=E2=
=80=99s a fair
assessment.

I=E2=80=99m not sure what you mean by =E2=80=9Cniche cases.=E2=80=9D Do you=
 mean avoiding taking
mmap_lock for major page faults, or releasing the per-VMA lock and retrying
the page fault?

Right now, major page faults always fall back to mmap_lock, which is a
significant source of lock contention. I assume we agree that this fallback
should be eliminated. Or is there still no agreement on this point either?

Where we may differ is whether to hold the per-VMA lock and
avoid retrying the page fault, or to rely on retrying the
fault while using the per-VMA lock (with the current
mainline approach using mmap_lock instead) ?

>
> We already have enough weirdness in fault code honestly.
>
> Let's maybe discuss at LSF if you're attending?

Sure :-)

>
> I will try to have a more thorough look through when I get a chance.

Thank you, much appreciated.

Best Regards
Barry


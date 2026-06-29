Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FCFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViaMG4AIx4t7Xw8EOKV5lY2S4wNOCDcLNhNIuR/tVoE=; b=xcjq7yYydZykbMeT5nqCyP75pj
	PZAbNRnDBxLqKksC1iBTMmS0dayGnYh5ALxRwK8TUAzxkhzuBxEOS2LpArSgOd3DFVpCW2a2hNZfT
	/UVqVGHhD2/qAIo0Z5QT5fKGCPJYQkPtMB7iEz7Zn5QR/17hFTl03Ceu0cPq8nefKikc4foGGRaz2
	em2yt7DmIz9Muzqb878J1N7nDiQohLc0xrJjlPMTofHAEaLyu5JjTqUYY4E1bqDcHcHpcCrJzmkIh
	5f9oZ1sWs3W0sSsVX9ih8Qxmh/NwTCYDOjCtSa3Xwj8GTMfWAUIU+btzdaMVm4qyr4qXCe4OMwZth
	IIgzB40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAPL-0000000ETtm-1zNU;
	Mon, 29 Jun 2026 11:44:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAPK-0000000ETtS-0G9w;
	Mon, 29 Jun 2026 11:44:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A71B6001D;
	Mon, 29 Jun 2026 11:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D281F000E9;
	Mon, 29 Jun 2026 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782733448;
	bh=ViaMG4AIx4t7Xw8EOKV5lY2S4wNOCDcLNhNIuR/tVoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q8m5WZPQxys7TASSEPS79b1PS7Camd9Fn+c6d1C9gq57MCQiYrcQnCXQfgL5Pom18
	 DEi/W04AGewzD/rKoMQlj7PH7ZlvfhgT5wCxco8mN/yozzeDJebmnwHsmAjUc92Hvw
	 6FvQmlN57DCT6ekazGvEXvtaVtlZGacM99DDCOSxpOBVSleTe4irqCX5KbtC2izNKF
	 T291dor9anDtABM3b/yxgkDP56ANzslcvn4NGksr9xxTxzQ33O68zYsFM+1kAbKewL
	 8f2NZFEXGGeHuNzx86QM2uiAaWdYbAx+u9ZKEshlHOlDMKPf26u4dffwBuDK6k7Dw4
	 85OiP+UwZqwrw==
Date: Mon, 29 Jun 2026 14:43:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
Message-ID: <akJafRKJJBd5Jrv0@kernel.org>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
 <aj426bA-YiOKt06m@kernel.org>
 <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>
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

On Fri, Jun 26, 2026 at 07:59:22PM +0900, Sang-Heon Jeon wrote:
> On Fri, Jun 26, 2026 at 5:23 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Sun, Jun 21, 2026 at 11:59:10PM +0900, Sang-Heon Jeon wrote:
> > > The memblock API guarantees that for_each_mem_range() and
> > > for_each_mem_pfn_range() never return an invalid range, meaning start is
> > > always less than end.
> > >
> > > Several memblock callers still have unnecessary invalid range checks in
> > > their loop bodies, so remove them.
> > >
> > > Sang-Heon Jeon (6):
> > >   arm64: mm: remove unreachable invalid range check in
> > >     kasan_init_shadow()
> > >   LoongArch: remove unreachable invalid range check in kasan_init()
> > >   riscv: remove unreachable invalid range check in
> > >     create_linear_mapping_page_table()
> > >   riscv: remove unreachable invalid range check in kasan_init()
> > >   mm: remove unnecessary empty range check in
> > >     early_calculate_totalpages()
> > >   mm/hugetlb: remove unnecessary empty range check in
> > >     hugetlb_bootmem_set_nodes()
> >
> > I queued this for inclusion into memblock tree.
> 
> Thank you, Mike.
> 
> Could you please review and queue this patch [1] as well? It does the
> same kind of clean up, I just missed it at the time.

Can you please resend them all as a single set?
 
> [1] https://lore.kernel.org/all/20260626032902.703944-1-ekffu200098@gmail.com/
> 
> > >  arch/arm64/mm/kasan_init.c     | 3 ---
> > >  arch/loongarch/mm/kasan_init.c | 3 ---
> > >  arch/riscv/mm/init.c           | 2 --
> > >  arch/riscv/mm/kasan_init.c     | 3 ---
> > >  mm/hugetlb.c                   | 3 +--
> > >  mm/mm_init.c                   | 3 +--
> > >  6 files changed, 2 insertions(+), 15 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
> >
> > --
> > Sincerely yours,
> > Mike.
> 
> Best Regards,
> Sang-Heon Jeon

-- 
Sincerely yours,
Mike.


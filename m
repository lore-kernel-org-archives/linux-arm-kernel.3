Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE521CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AXphWvQV6X4jC/MRKf1KbDWGJMoBqs4UZ3fr8cRQqA=; b=tJ3GSCXE0bvMW0DmzFWow7qqPE
	kDBMSE2+Bio8cy4p/ynYjUHQs85ZeR0ZLv1DLv6df9XsGHiBuwcwogpQ8qVnGH4ZB6QSfx+ayr2B7
	jMaOvBL5tO3BEmV3IRZuanh9+RetnT3PDfcat4V1/gf9A4pehhOFT3cnSZ8YcMyhrtQSN+JYQq14s
	sOM5VYjqIuuDmuCqyubx8M2D0Y0/HOIpyjVLjwcGvPJGBlvcZ/+mVjRkIHr1bDdTFK5dt9mwOHMsw
	f/IiP1wnv5HQN9tLdI2YjBNHQxK6Z+DDnSzPAy9ItgbtyPVPS5o/Ts3z6JDgNlq76BSrl+oKnNbi2
	FTlg6lHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPny3-00000005mVX-1kLg;
	Wed, 20 May 2026 20:56:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPny1-00000005mV7-2z3Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:56:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA71860122
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 20:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820211F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 20:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779310596;
	bh=2AXphWvQV6X4jC/MRKf1KbDWGJMoBqs4UZ3fr8cRQqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZVmEYd/8zxa4603xK34IC/TbSS8+GsRvpCzgDShciFrGe87PJWckkngN+a0aYuohQ
	 MtOBm8iMX5F2gAT46oduwpmioYZ4W+5330LRHqPO0j95zY/Ei/qSdZIsecMfR5JyJl
	 6twI+HLYUTrBoi7Dm8I1qVyKoT9IG8pZH60197+SfcaABytEzy17y/MSs0UvDWy9RR
	 Sh4H55aixk68FSm3iry+q9jfnx0Ftl9vUGgyaFuWEobiM5nxJQmLG5D0g7pI/kRJTl
	 4WcvjwW/x0e1UdtljpwoMoqp7icRbUOz6VevqHA6UHZY+9B21rAfqdEmDfq8wNygjT
	 ByK8JI1n9DaAA==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-902deb2412fso664944285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:56:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9RbIZRj29ZgZMBohWfJdIAmQqJxDAU8vtxLVbMid5LeyJrt93kdjnOC1Ddeqb7XFS85lZii83L3lmAsTeR0FLl@lists.infradead.org
X-Gm-Message-State: AOJu0YzHloo5Sad/AV5JceR5zm6YIboNkbArL1xDMtyj7EAHcR4msVJR
	FFaiiOgLEXt3nxQCX1NPDTQALz7EKDiesxExacFBoGzwjEFmw2C2SnY8RWEYFVTYDKvdy9vfsO8
	6YyGL4L/wcMuUODTaJU5hs8iOjDkMXTU=
X-Received: by 2002:a05:620a:28d0:b0:90c:a08f:c5f0 with SMTP id
 af79cd13be357-911ce8129f8mr3817766685a.33.1779310595916; Wed, 20 May 2026
 13:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260514094108.2016201-5-jiangwen6@xiaomi.com> <177927799624.3551615.1232032128494296554.b4-review@b4>
In-Reply-To: <177927799624.3551615.1232032128494296554.b4-review@b4>
From: Barry Song <baohua@kernel.org>
Date: Thu, 21 May 2026 04:56:23 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wWV7kA9NZnC1nKLuLEnd+wH7v=7=x8WJMznRNtHKhh4A@mail.gmail.com>
X-Gm-Features: AVHnY4IbJNNziZOusY4XlGaZUjTKeiA_BxxPElnZpTAi1mLurw4T57tnAOPIyN0
Message-ID: <CAGsJ_4wWV7kA9NZnC1nKLuLEnd+wH7v=7=x8WJMznRNtHKhh4A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] mm/vmalloc: Extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Mike Rapoport <rppt@kernel.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com, 
	Xueyuan.chen21@gmail.com, dev.jain@arm.com, david@kernel.org, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com, 
	linux-kernel@vger.kernel.org, Wen Jiang <jiangwen6@xiaomi.com>
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

On Wed, May 20, 2026 at 7:53=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, 14 May 2026 17:41:05 +0800, Wen Jiang <jiangwenxiaomi@gmail.com> =
wrote:
>
> Hi,
>
> > vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflus=
h())
> > provides a clean interface by taking struct page **pages and mapping th=
em
> > via direct PTE iteration. This avoids the page table rewalk seen when
> > using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> >
> > Extend it to support larger page_shift values, and add PMD- and
> > contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_=
walk()
> > since it now handles more than just small pages.
> >
> > For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> > iterate over pages one by one via vmap_range_noflush(), which would
> > otherwise lead to page table rewalk. The code is now unified with the
> > PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
>
> After this patch we have two very simalar page table walkers:
> vmap_pages_range_noflush_walk() and vmap_range_noflush().
>
> The subtly differ at what levels they try huge mappings, how they
> account page table modifucations and, at last vmap_range_noflush() is
> left without support for contiguous mappings.
>
> Is there a fundamental reason to have two page walkers?
> Is there a reason not to support contiguous mappings in
> vmap_range_noflush()?

Hi Mike,

They are two completely different cases. In one case, you have a contiguous
physical address range for ioremap(). Since the range is fully contiguous,
many things can be simplified. We already support large mappings there, but
this patchset still improves performance through larger batching.

In the other case, you have a pages[] array whose pages are not physically
contiguous as a whole. You iterate over the pages and attempt to create lar=
ge
mappings whenever a subset of adjacent pages happens to be physically
contiguous.

Best Regards
Barry


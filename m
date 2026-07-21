Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6704AC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzkhmVysTB+3FhpZHqTBXRWAVQ4ajFkqoNkLX2Icq6U=; b=0zhoOa3uthwIPtGISqYzd2tOwE
	eQJP1axrZYikJoyR+DTFyn+KVdDNtYqDDY3LyFAXl0XNz20LB8BqV/T7CDgmmsix+4p3k+jPyV3Z/
	8HSk/WtHQJMSPMLXBbrS3VHQSxw8kOoWSCTcWNzPFTBq5LaD3D2TxiQoTEM/XCHOX0iegDaJhtGzu
	3gfOhrkSKZDEZLHHuJdduv6oFcSMf/6vRqayX9e3x7QGn0fiGZjJYbfz1JCT86lSaAJ15QxB8wWFM
	SXmYIGaNXSr8LW4mC6b2nh9HrYYo/hd6wrXbibknxtZoEi47jwCsQkBlCr4l0IItMJBawq3xxzVcV
	/H7IuZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm35Q-00000008SZI-13cz;
	Tue, 21 Jul 2026 05:32:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm35O-00000008SYt-2adi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:32:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11CA244F9A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 05:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2C51F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 05:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784611930;
	bh=RzkhmVysTB+3FhpZHqTBXRWAVQ4ajFkqoNkLX2Icq6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pv9Dk/qIHbPTp1TcvouwvjEvzHvFrzaRFKaHRQiQZtOfDSnEI5TFTS0drSz0POFGy
	 kwfWrg3kzWlIdl5XaIMLqWBq3+eJ/tT6SGotMX/B8cxA5q9OjAeloF9KsnT0r0VC9z
	 TtJY1TuUObzX+iGGdIwfIfXUhamZqILZP0KozQCC2saIB726SaZhGaSbOckwd62wSt
	 9d1LZc01HM3IX2GoCyon/OPiofKVi0mJ/9rLbYtHkWP/9l464X5nSZIZLQLKs1MThn
	 zg29K4Mx5raZjyfbMO+gkM7gvdz+IwWKrNXuaHMMdTRyvZIAdKNHYItzacjM3n+jsV
	 j09dXUQvtgINg==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e7c6ec9dbso572212385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 22:32:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQTr77XNHaeWXbnVDQEmeHfY9rQ+QA9ohw/4ZFb+9/ilfglfX3MWGAsxR6YFqW6JnV0cbi8X/J30oAgu+h37cm@lists.infradead.org
X-Gm-Message-State: AOJu0YxHl3b1KXXOhp57ji7H64nMOBzNuvn5wHOu0OdZGCkBCChZ32cO
	2jpv/GTTNdB7WN0MeQA6l1RT+Us33lTajoSZTYa8IC2/r7dw+OT+bkYM/ShHys1OpI/G66Up5Uu
	pvGrzwKMULeGz5GT4F4L63xX5CACAuEo=
X-Received: by 2002:a05:620a:708a:b0:92e:fd2c:6a21 with SMTP id
 af79cd13be357-930b3ed4e6bmr1663562985a.27.1784611928996; Mon, 20 Jul 2026
 22:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-2-jiangwen6@xiaomi.com> <6adafb9c-b966-473b-90ba-3432b5574039@kernel.org>
In-Reply-To: <6adafb9c-b966-473b-90ba-3432b5574039@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 21 Jul 2026 13:31:56 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y6EQp0mC7d7Pzah_3s+zOz=Q1_ZLUZm6LkM4TU-2u8YA@mail.gmail.com>
X-Gm-Features: AUfX_mybLSmHnkoJKgQHlMTCQ-UCwhsLJMzd21312ixk_MsP-fohERkDNrtkZ54
Message-ID: <CAGsJ_4y6EQp0mC7d7Pzah_3s+zOz=Q1_ZLUZm6LkM4TU-2u8YA@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com, 
	dev.jain@arm.com, Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
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

On Mon, Jul 20, 2026 at 4:16=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 7/15/26 13:08, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> > we can handle CONT_PTE_SIZE groups together.
> >
> > These additional sizes are mapping spans used by non-hugetlbfs(vmalloc)
> > mm code, not new HugeTLB hstate sizes.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  arch/arm64/mm/hugetlbpage.c | 15 +++++++++++++++
>
> Huh, why are we touching hugetlbpage.c, which is HUGETLB-only material:
>
> $ cat arch/arm64/mm/Makefile  | grep hugetlbpage
> obj-$(CONFIG_HUGETLB_PAGE)      +=3D hugetlbpage.o
>
> Something is off here, if vmalloc ends up reusing some of these helpers, =
they
> should probably get moved out here into common arm64 code.

This has been an issue since the original commit f7ee1f13d606c1
("mm/vmalloc: enable mapping of huge pages at pte level in vmap").

I agree that this likely needs some code reorganization. However, that woul=
d
probably be better handled as a separate follow-up series rather than as pa=
rt
of this one, since it is not a small or trivial change.

The main problem is that the kernel lacks a set_ptes() helper for kernel
space. As a result, hugetlb has been repurposed for this across multiple
architectures since 2021 [1].

[1] https://lore.kernel.org/all/cover.1620795204.git.christophe.leroy@csgro=
up.eu/

Best Regards
Barry


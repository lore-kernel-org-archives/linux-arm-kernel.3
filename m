Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7908BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 04:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmixZEfyJshPgnbSdLOJ6mmAwvFWMoeYmvzBr3qbCRs=; b=1qSWKemcd/jaYgDFn2eYh+2QO4
	PnpU13AokAjj9URyE95TuLd5QRDrdCzmUXbx5rKmf49IdAeaEAhx670O8Y+iLcMeFnZWW6fwWWOoB
	29nVjjt0RlbJL27Pr+uFCaOwwp3bNNdHRqaGqym/PiNCOt9Mz+NGsVYct4ddq9fCQ2LC/lOY0+fuR
	7nI9JhFSyyF9jg9y59RMwnkL5wlHgwqfU0QbatxBZ4T770qv+9PvE9uIgYV5F7OQSJ+pWBpNlVSqi
	/zNLt47nO7Cu0pdvfdzylIYKgqDnFRzHS5ynUq02LfDy8jgnOJEjU+97Ea5ChbhqrIPDJsl9mlSFK
	WsPk6uQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow4S-00000006rBK-1cs1;
	Wed, 29 Jul 2026 04:39:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow4Q-00000006rAn-3Fg5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 04:39:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E78244E96
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 04:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AD31F0155B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 04:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785299945;
	bh=nmixZEfyJshPgnbSdLOJ6mmAwvFWMoeYmvzBr3qbCRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fTGpAqT894sz7e6Fd7jtewE7MzSr4V0SC3/lU+F0oI206vIx3Qp0xMHoVM/AKefEh
	 N9gr5Yer27N2YVlNrW3QMIq5l0OSRydMDIhMCQNymwHWhoOgeskMC2Ouud8f1JssSW
	 jRB812CzlQ1wlIfuzMX7soE+J1SgY/VH/xK2Gl4QaUXWq/Pex/52M5vAtyc9/s/F+y
	 yncIOaOKZEwZrG+wcYOc4qFo26gtQyp59az9HMR8gJZzXYwoWewZYjEpppWviSQB5t
	 cr4iDuEaI+nw9rlt7YGsa7zqhj6UV++i1NnLsf2iZJGD2N8Gsq7LsI6Aq6ASgLZKSN
	 uYEz/yQ6mlGfg==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e57a753f9so44650085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 21:39:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpgYrVhVdRun7ugLj68OFfD9/tGBvkpM1ampq7Er9mtVg2m5YhUI9r35Y+leR7hNq0nNOdCXMy9WRXcCqzCt5WO@lists.infradead.org
X-Gm-Message-State: AOJu0YyhLK0Py1ingZQ1HFjie5DntEcvj+dvVnhfbEXLUfaoJ/q/fz1y
	Nc8RHnYPOsIPaK7hw4yhNgRxcJZ5b6GO9S3H4/XEyEyzGiYY5dYBGmqlX60KA1x2lEHU4RW0el4
	DeqQtPIz2MA7R7q1Huva07oHC6WkSueY=
X-Received: by 2002:a05:620a:839a:b0:92e:694a:77b1 with SMTP id
 af79cd13be357-9330267b394mr478027485a.4.1785299944999; Tue, 28 Jul 2026
 21:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-3-jiangwen6@xiaomi.com> <amib2d8um2ZwsMDU@willie-the-truck>
In-Reply-To: <amib2d8um2ZwsMDU@willie-the-truck>
From: Barry Song <baohua@kernel.org>
Date: Wed, 29 Jul 2026 12:38:52 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wCPLZQbrgDnujxGDSyDQ8YeaPhuNP89yK-o1exe6kZfw@mail.gmail.com>
X-Gm-Features: AUfX_mxSl7FmCTPLbPin_HsGwEEMq7LdYhi94gKpfCRIekDy_TsQI9q2ZPSHUT4
Message-ID: <CAGsJ_4wCPLZQbrgDnujxGDSyDQ8YeaPhuNP89yK-o1exe6kZfw@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: Will Deacon <will@kernel.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com, 
	david@kernel.org, linux-arm-kernel@lists.infradead.org, 
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

On Tue, Jul 28, 2026 at 8:09=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
[...]
> > @@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_s=
ize(unsigned long addr,
> >       if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> >               return PAGE_SIZE;
> >
> > -     return CONT_PTE_SIZE;
> > +     size =3D min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> > +     size =3D rounddown_pow_of_two(size);
> > +     return size;
>
> Why does this have to be a power of two? We should be able to work with
> regions where the start and end are suitably aligned. Is it because the
> hugetlb code works in terms of shifts?

Yep. For `vmap`, `vmalloc`, and `hugetlb`, this is all about
the page size shift, since their memory is typically backed by
the buddy allocator. However, after taking another look, I
think `ioremap()` could benefit. For example, if someone calls
`ioremap()` on a 576 KB region (64 KB * 9), we currently have
to map it as 512 KB + 64 KB. Without our patch, it would
require nine 64 KB mappings. If we allowed non-power-of-two
sizes, it could be mapped with single time.

So supporting non-power-of-two sizes might provide a small
performance benefit for `ioremap()`, although I suspect the
gain would be limited. I can investigate this as a follow-up
task, and if it turns out to provide a measurable improvement,
I can send an incremental patch.

Thanks
Barry


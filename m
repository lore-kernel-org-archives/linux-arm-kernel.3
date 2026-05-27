Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79D0CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zvjt27z8kXkbGkzX4jrChRm57mlyR6guk2SEu0CSjpw=; b=z/oMqaN7S9F29nVFr2mpeFvMrg
	aaxhkc2C3NoUir17hujDgCxgNuEFzCQaUcvFKaQDaFBGIKq/H9ORAMaYQ68iUw0LYBJKD5zCkkL0t
	gwB10JhJa6SM64ujD4ZoLVyEpEpq9OhKFey6YWMzOOMpm9etvW6DinmbNIYYAkTVn2N/zF3JF19u2
	m/Ebfo1aXPBYDjNVAoQBJVV7LCj1YZlPmeNRE80TdHtsUr79MOMXb41+K7EqKQJHFmc5a+bDM1806
	SKSGASLtEpnMUw3Eq9579OkQtDOfxT7rGNbQGJ1y5vcLeR6uLMBJohaGjqEHn+kc16W90rhl1qItU
	tGXfopWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSATL-00000003d5A-39qh;
	Wed, 27 May 2026 09:22:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSATJ-00000003d4W-2UAt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:22:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4904127c32cso33184385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779873759; x=1780478559; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zvjt27z8kXkbGkzX4jrChRm57mlyR6guk2SEu0CSjpw=;
        b=j+aaysY34k4xYo9fGm0gAFs3PceWT8TsBZ6DthWq2tvey35gnkiiCuJfD0ZKsVzOU+
         47ucrtFqSMo2kFEk3NIIdNSxikyMJtvGOv1k1IPbN78BFhpKf4NY5J8AxhZhHBP7BiFv
         NlPtY/N5yPjvOForWnjzi6UdCpVmf2wr9Ck6ZVziIoo8TZXem0Qs/VOYJ5HqKuXedcqp
         TSgEa0l5+DA9pneJRw9GmS56EUHK2acY8KOY25SmjFUoG3PEEGw9yuMI5BnNacDxZlUu
         dJUeprpJPT0FSaGsvWjh/KXDiDQBqIsB5N85mBYIZF4WNKCkSALHeDrGMuLWPyWvDWji
         oLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779873759; x=1780478559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zvjt27z8kXkbGkzX4jrChRm57mlyR6guk2SEu0CSjpw=;
        b=ZxFVBi3EIklEpU/usa6n/ByzEmw9Xt5ZHHgTI1L9ydcWhr6TqGDw/J4sJYR9+hexUu
         uAnuCkGU/boNDvp3Un6bHd36hBYCvfpprcUDOkrgiWWNpYw+q5YkDKBmNZi75TBfmAQp
         k05SApXHkGh/xHFa/NoMMQ8c+/nC6ehto9zmlNoYitDVfZtIyvpo5I6C5YYW7s9MEGhq
         k9u2q6KwWOVJGElzbCYfrO4AtMA7WxrIKu3R2FXRtT0iNRr1uS7khG5GBfYw0cdgPGtG
         nyGP/25bF1KQgecQmTorQiuIp8cmlb5Xc3+fFvjSVM+6d76wgIBKv+E1c1D6l78F65Pc
         cYRA==
X-Forwarded-Encrypted: i=1; AFNElJ/L8dJvNn2YOXvVb3OeasKOKqQTaqHuuJhGn54Hq4UdK1NdV5tyTvjAAadCUcAjM/s5FV0sLwGcQ2BjmCmT4DyV@lists.infradead.org
X-Gm-Message-State: AOJu0YynB/suQSRwuilacbxggku3X6WmUjnKVYUMDYExIP14tP4RI5Oh
	FcNy9PmifLzTeYfJT5Byz6yKo60RjRgAKYnBjmi/nQsteRM5gcHmgrJGDeVaVuMb
X-Gm-Gg: Acq92OHAMq5/Tx5Tn3xqvlBvCSEJOTRK4zSCaMj2Od/oSbjWQTzRlCFNmvhah5ZbMP1
	Qk1p//3+V0aD9LZqk53Hb4aqcacYtLHhQaRxZ0MdPjVa7kVmIz1x0Hno3pBywZKlgw+PmH1a1/R
	iIPyeLee/3YSyW0qvMMwTiQYEZKmzPIbRHyDlh2cAdh8pFVlj0AwBsQIxWhv2Om3GFY5gxF4EtY
	q4SRvel4uAdjSz01YJnGiZvTM9Qvu6XzU7dIMAwd4tq6gjNTF4CrO3kfnbyowv+sHKPvkpd35pK
	k9NRh+qGexGRNG41nsnIcvLZ9/izAwt/5bncrfMAoEHhcsECI8fUtMVxJgRBDvd+V75a8fH7WUD
	6Cr/lbhkwguTQeFRa5Azmn++XynaHJO2xW/fQ4ll/CZ2nOK7SptsKc+qD6mManIfrF8Ucrotd+w
	go2hUOTMS4Vfzr0Jqc/bBJgCWnA/mpIIdRR515iU7MEw1FP7QLiXGvXIXbuWubYyN76QSprnSep
	G0Z012F+srAaNr4s7h6i4JpbMonJiRKMk832cGkl38X1T4nJgCoBPA=
X-Received: by 2002:a05:600c:1f90:b0:490:5e2a:dbaf with SMTP id 5b1f17b1804b1-4905e2adc0dmr212138645e9.21.1779873758884;
        Wed, 27 May 2026 02:22:38 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net. [86.16.54.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4907e6a1f29sm14599705e9.5.2026.05.27.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:22:38 -0700 (PDT)
Date: Wed, 27 May 2026 10:22:35 +0100
From: Vishal Moola <vishal.moola@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, will@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-ID: <aha321ndGSdReBJR@fedora>
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com>
 <ahAjudlB32VbkKbG@fedora>
 <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
 <1be38262-53de-4a27-9841-393e12fc1475@kernel.org>
 <db11078b-a283-4717-bed2-da56e77c7132@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db11078b-a283-4717-bed2-da56e77c7132@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_022241_650909_E6B7352C 
X-CRM114-Status: GOOD (  23.46  )
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

On Wed, May 27, 2026 at 09:34:19AM +0200, Kevin Brodsky wrote:
> On 26/05/2026 14:31, David Hildenbrand (Arm) wrote:
> > On 5/26/26 13:54, Kevin Brodsky wrote:
> >> On 22/05/2026 11:36, Vishal Moola wrote:
> >>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>>> index 4c8959153ac4..9d42cbddce27 100644
> >>>> --- a/arch/arm64/mm/mmu.c
> >>>> +++ b/arch/arm64/mm/mmu.c
> >>>> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
> >>>>  
> >>>>  static void free_hotplug_pgtable_page(struct page *page)
> >>>>  {
> >>>> +	if (folio_test_pgtable(page_folio(page)))
> >>> This should work.
> >>>
> >>>> +		pagetable_dtor(page_ptdesc(page));
> >>>> +
> >>>>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> >>> In the case we presumably have a page table page (ptdesc) at this
> >>> point, we should really be freeing it with pagetable_free() as well.
> >> Agreed, I think this is the right thing to do, something like:
> >>
> >> if (folio_test_pgtable(page_folio(page)))
> >> pagetable_dtor_free(page_ptdesc(page)); else
> >> free_hotplug_page_range(page, PAGE_SIZE, NULL);
> > That code pattern is wrong.
> >
> > folio_test_pgtable() shouldn't exist.
> >
> > In the future, something is either a pgtable or a folio, not both.
> >
> > So check the type against the page, not the folio.
> 
> In other words use PageTable(page) instead? Interestingly I can see a
> few calls to folio_test_pgtable() across the kernel but none to
> PageTable(), maybe just an antipattern then? The ctor/dtor also use
> __folio_{set,clear}_pgtable().

If we know for sure we have the head page (which we probably do here), we
should use PageTable(page).

I included the folio APIs as a defensive way to ensure large order page
table users don't break. We only set the type on the head page, and using
a folio guarantees we're accessing that head page. This can go away as soon
as someone looks at the architectures that allocate large order ptdescs.

Also, most (if not all) 'pgtables' don't use ptdescs yet, but they
probably should... Anyway, in this particular case, it looks like pgtable
is just a name symbolizing 'page table' and not our type 'pgtable_t' anyway
so I'm just rambling.


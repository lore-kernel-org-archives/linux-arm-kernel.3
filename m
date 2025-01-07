Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744C1E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRVwfwslXJGI74kLFIi5nDLkpW6F2l/Qx8c6R/av2xg=; b=UmWK7wEdQsfMquxuia8sHBR+Yz
	NmdOOA39sh4WIzwgFVKdO4U/fXUFP/nFyhzh06fQCeVS8G1/5SefRlp3hf0jfpsTWppP7q5/Qi9sR
	cWoLKD2cEO3b2EZKMeclUr8/kAR4wdRsetWtgI0Ufl3hjyVG75SOtag6QYYF4I3hf3ULubGWAY0NI
	n05hq+Q8J5Oy622ui0Zn+5nia/s/ZIKVwJB8//oFHIekVcMlKAVXb8NbnKzvdtWI0f3GQ9ClvmLW9
	8wnpK5v5XZnBLCX6DHI9CZorAmH9Yv54oqNcbsUxgZSBvtA0jnbG805ffUiX3KCpEP3cmZ0GkeM0a
	hwsvkcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV2mR-00000003boK-2pVB;
	Tue, 07 Jan 2025 06:09:31 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV2lC-00000003bXz-2id6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 06:08:16 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4afeb79b52fso4273345137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 22:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736230093; x=1736834893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRVwfwslXJGI74kLFIi5nDLkpW6F2l/Qx8c6R/av2xg=;
        b=XxqU7Cctznpj24PoicjXwWxsns31krp4/VVMWJIuuSfG2lxsMFGfQi6f1TNos6D1qd
         NPrmqxhmoANk0wKdg+PyrysIWlVtGGYQrrP5FCqs6HcQ0Lng/Qd1r6+JR0cWnCWoV2G1
         FjGRl/UYC+ih7ZS28GzgUE7rR90lky6g5ejFfPgskV2578iRjuDRxziGtXJKiTzgapV3
         DelCT1YgB12sj8B7SdffGvNa4+WrI7kj2kUR1HbhVW6uqxoPapNR7gp2hyFii4+JPwh0
         m0WPvCQH5odz02WLv4iA9S0JqnHCpwSiyLKRs/M18BMf/vWhuObBxYfrxfX78m7wj9J2
         8ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736230093; x=1736834893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRVwfwslXJGI74kLFIi5nDLkpW6F2l/Qx8c6R/av2xg=;
        b=rue1Q3w36LfGC+ortuQwIzGwZjjjsQcM/ugsqNdwhvOpJ6+WYCDzo3Ms+3rnRI7Ar5
         nWS2JgFZRwhroFWcr2zwoxEqH4A7MXfr1tX8bNfjaucNjiem25E5KMs+YESMPXtYey94
         qLBA0VTb5oYLjOU3uGDbKnGTpjRjvarGuktvI/kCRIQfLKSqn9bgLnHHTZvKH/qqtnPk
         QTLucniurVy6rF3PSgiXIFj0l4W5qpOwFHZP2oUu6duZcmu1110h3vCbdsx4R1+ybpYL
         z55INoftzWAqdEVAKP2Ira0oYT9yA7UhgQk+WsmHq+yXEK5miaHzi+SdcIAakV+PxWvO
         BBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXazlOtM/0uRcaWdHHRMuplFu13NBPGoiLrfcTeKhy4xzw3UvTTRFEODFisYuY5+qXJ+j6CC+Q5cmU/vJYQvLci@lists.infradead.org
X-Gm-Message-State: AOJu0YziJo2OqfRpObuijT5yAQCzI4sYtQZERBPn05FfkgqiXga7KcPo
	TINaZifiSWdlKRxvytrjA4CuMGpUZrXfQuHVyG1qYnQFrlK9MGFo7KtxK73UZbP7CLNCK8AI1C8
	SaZtsz+5+f1P0JCtsMDmlSjnzGJqGI/QpmroI
X-Gm-Gg: ASbGncsk56t1iUqCiHyovtHeLzxPLgyEgLbmMHIGEY+oLz0fjL8cB8nHq86KOHWWxKI
	RtS1ENHcMGAEOUznBPaUvJt6ShRJoc4RGdQyd1Qv5po7tv+7HL6hWNjubYfYKlTgureA7r1s=
X-Google-Smtp-Source: AGHT+IEZaqmWCdbsnlneTQG3404W2PKonER8bomGI+FtnJ1u//oEs3rufk2b98smus/r1ny3nrGHnU/2nnAkoAcwgVE=
X-Received: by 2002:a05:6102:e13:b0:4b2:4877:80f4 with SMTP id
 ada2fe7eead31-4b2cc116628mr52396664137.0.1736230093357; Mon, 06 Jan 2025
 22:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20241107202033.2721681-1-yuzhao@google.com> <20241125152203.GA954@willie-the-truck>
 <CAOUHufYUMYcf=uF7=2zj-PsGXePCDdsRHJGa8t-e-k9VUvYyQQ@mail.gmail.com> <20241128142028.GA3506@willie-the-truck>
In-Reply-To: <20241128142028.GA3506@willie-the-truck>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 6 Jan 2025 23:07:36 -0700
Message-ID: <CAOUHufbUOBy1DweSV4CF4LMK3kxi7EGCDDztmtuYXXe=fZM7zA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] mm/arm64: re-enable HVO
To: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_220814_708311_AB002936 
X-CRM114-Status: GOOD (  39.42  )
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

On Thu, Nov 28, 2024 at 7:20=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Nov 25, 2024 at 03:22:47PM -0700, Yu Zhao wrote:
> > On Mon, Nov 25, 2024 at 8:22=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > > On Thu, Nov 07, 2024 at 01:20:27PM -0700, Yu Zhao wrote:
> > > > HVO was disabled by commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disab=
le
> > > > HUGETLB_PAGE_OPTIMIZE_VMEMMAP") due to the following reason:
> > > >
> > > >   This is deemed UNPREDICTABLE by the Arm architecture without a
> > > >   break-before-make sequence (make the PTE invalid, TLBI, write the
> > > >   new valid PTE). However, such sequence is not possible since the
> > > >   vmemmap may be concurrently accessed by the kernel.
> > > >
> > > > This series presents one of the previously discussed approaches to
> > > > re-enable HugeTLB Vmemmap Optimization (HVO) on arm64.
> > >
> > > Before jumping into the new mechanisms here, I'd really like to
> > > understand how the current code is intended to work in the relatively
> > > simple case where the vmemmap is page-mapped to start with (i.e. when=
 we
> > > don't need to worry about block-splitting).
> > >
> > > In that case, who are the concurrent users of the vmemmap that we nee=
d
> > > to worry about?
> >
> > Any speculative PFN walkers who either only read `struct page[]` or
> > attempt to increment page->_refcount if it's not zero.
> >
> > > Is it solely speculative references via
> > > page_ref_add_unless() or are there others?
> >
> > page_ref_add_unless() needs to be successful before writes can follow;
> > speculative reads are always allowed.
> >
> > > Looking at page_ref_add_unless(), what serialises that against
> > > __hugetlb_vmemmap_restore_folio()? I see there's a synchronize_rcu()
> > > call in the latter, but what prevents an RCU reader coming in
> > > immediately after that?
> >
> > In page_ref_add_unless(), the condtion `!page_is_fake_head(page) &&
> > page_ref_count(page)` returns false before a PTE becomes RO.
> >
> > For HVO, i.e., a PTE being switched from RW to RO, page_ref_count() is
> > frozen (remains zero), followed by synchronize_rcu(). After the
> > switch, page_is_fake_head() is true and it appears before
> > page_ref_count() is unfrozen (become non-zero), so the condition
> > remains false.
> >
> > For de-HVO, i.e., a PTE being switched from RO to RW, page_ref_count()
> > again is frozen, followed by synchronize_rcu(). Only this time
> > page_is_fake_head() is false after the switch, and again it appears
> > before page_ref_count() is unfrozen. To answer your question, readers
> > coming in immediately after that won't be able to see non-zero
> > page_ref_count() before it sees page_is_fake_head() being false. IOW,
> > regarding whether it is RW, the condition can be false negative but
> > never false positive.
>
> Thanks, but I'm still not seeing how this works. When you say "appears
> before", I don't see any memory barriers in page_ref_add_unless() that
> enforce that e.g. the refcount and the flags are checked in order and

Right, there is a missing barrier in page_ref_add_unless() and the
order of those two checks, i.e., page_is_fake_head() and then
page_ref_count() is wrong.

I posted a fix here [1].

[1] https://lore.kernel.org/20250107043505.351925-1-yuzhao@google.com/

> I can't see how the synchronize_rcu() helps either as it's called really
> earlyi (I think that's just there for the static key).

That fix makes sure no speculative PFN walkers will try to modify
page->_refcount during the transition from the counter being frozen to
modifiable. synchronize_rcu() makes sure something similar won't
happen during the transition from the counter being modifiable to
frozen.

> If page_is_fake_head() is reliable, then I'm thinking we could use that
> to steer page_ref_add_unless() away from the tail pages during the
> remapping operations and it would be fine to use a break-before-make
> sequence.

The struct page pointer passed into page_is_fake_head() would become
inaccessible during BBM. So it would just crash there. That's why I
think we either have to handle kernel PFs or pause other CPUs.

(page_is_fake_head() works by detecting whether it's accessing the
original struct page or a remapped (r/o) one, and the latter has a
signature for it to tell.)


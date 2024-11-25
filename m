Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00DFD59D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPfWzthEWoH2qXCJl59i7kJGHDW2eEE8lyzCKgg7LSc=; b=kQltBtaRX9oFf98zdMN6kKmSno
	AbEBf2F2O4tpO55autg0LhfJRlXuaHDZl07vIxCntdy//Mpl6+0O9T+t5ZkegccQGQjB/MnTVlavu
	/PGWSfZq7cWTid804Q8pM7E1nUHXlsNeOphAJnR9vH78Z/B62MMnZb9lcCn+2po9oVKRHp4d6kC7I
	1r/J/iQ1OLUleTq8danmKHlk7NwDfskEukTLbzRlYvid1PRifwGsMRHzp99wSS7s1ssbguKTNjyOD
	4+dbCbBsxO4GNnHAfczpxjbJS0+KAP2V+Sarzpp1UXt2C0dP6mfvgVjHt6b9o8H4h3Al9v8zK8cT7
	sxrJuGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhVK-00000009CdB-3AWZ;
	Mon, 25 Nov 2024 22:24:26 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhUM-00000009CXp-3aK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 22:23:27 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4af16d741dfso452902137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 14:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732573405; x=1733178205; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPfWzthEWoH2qXCJl59i7kJGHDW2eEE8lyzCKgg7LSc=;
        b=m1T4h0jnNK7XjsxZBamW70H83VZxSImB4rFMO2F4uAI4A5Do/WGx/AzLhtzaUifAqv
         PpiEbirDwrQQ9Zj/q6sGVfdEvd7jcsnsv5cib8K5MiGjoj/XjLQUaq8nQdZMx91PNGSk
         X33c1skxSbwCwRWE/QNT7/NbMJu/YTbGdd0qgT5KSObI5Iz28mc0zlAG9jmarjciNHsL
         fFjSn2lbj7yywGcO6i54K94E9oMFGdglg6L8kQTq62yS1kTuo/pEV5EEGfcv3dAaJBmC
         CBb1QyD4178xg/AC+VLr9Jsmr9xkXkz3M+DOQyK1Q11s+lZGd1WMyFc5xK1cZ6Rno/lX
         vyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732573405; x=1733178205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPfWzthEWoH2qXCJl59i7kJGHDW2eEE8lyzCKgg7LSc=;
        b=kaf2aY1P5QsIUqVuYsXMNUSJdXqnQ+oQ7PjB78JrdIRxWKDYIkLzUOvBaTkXtF1zNr
         +aa4ZBpLbElQO90o5sBMpDgxw62apWskYMWcb4B7tQyVHLc0g3SDXx75Elz9/l+hwUz+
         K+eFTyu/BFhaoUZpnZvmiIRL5tX4cDQQoxEEzRmqrlxQI6FEE7yCvj/KEtY5Hy1CBy6e
         TJ+HqKWSxiWc410rw4q+MkO2glYfQj43GL43PZdANDdf7a3RZbbj5+Rb4hqsRFI53acu
         HSKFXk9gWwmWRDIFyWtNF7N9OqT3wFImJGqfF69x6qGeMmAQnxBz4eZhBpIHmdZGeKR4
         cYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm5XI7oQfQwqVRy1pYaHikpsxYbq/FSNKo0opuus8iuJ3XVw7xs60hchXa9DoLmXV2RV960FJPz+rQrjdBnymF@lists.infradead.org
X-Gm-Message-State: AOJu0YwBnGqqTIBg5oRwpYMiBTwnneMN9y7KJaGHkNAalUdX0ZHe1FbR
	R9zjrjLGk+oV8MtWQJvRo5TrRaRhJiMPdvfyZdyZ+cPXX+MRZXNkxB/ALGgsz4P4z+3GYIIvlbC
	6utENuDbtQQHbOQvnDMkDw2B74k9atXxPH3LL
X-Gm-Gg: ASbGncsmfgaR5w4o3uv6jrJVrWEwyqjVWAn+m4Os9KySH5h7PzkmTFvDkLzV0YQZfaq
	+9GCyWAmG1pwwK4vdJO36AbuBF2T1QKOfm3exFGs8YbIWvEU1P06q7AIh2SLKpl5l
X-Google-Smtp-Source: AGHT+IGqMzc1OyPSWSlieeYBzujX5tl4Y0054LB+eF4R09ye8ciu10JBJUzb6hqH9f2pJ7Sfaoe8ukBDGJNLm5dZMcY=
X-Received: by 2002:a05:6102:161f:b0:4af:19c3:61c1 with SMTP id
 ada2fe7eead31-4af19c36469mr6481868137.27.1732573404437; Mon, 25 Nov 2024
 14:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20241107202033.2721681-1-yuzhao@google.com> <20241125152203.GA954@willie-the-truck>
In-Reply-To: <20241125152203.GA954@willie-the-truck>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 25 Nov 2024 15:22:47 -0700
Message-ID: <CAOUHufYUMYcf=uF7=2zj-PsGXePCDdsRHJGa8t-e-k9VUvYyQQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241125_142326_898604_DC0C5CE2 
X-CRM114-Status: GOOD (  28.74  )
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

On Mon, Nov 25, 2024 at 8:22=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> Hi Yu Zhao,
>
> On Thu, Nov 07, 2024 at 01:20:27PM -0700, Yu Zhao wrote:
> > HVO was disabled by commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable
> > HUGETLB_PAGE_OPTIMIZE_VMEMMAP") due to the following reason:
> >
> >   This is deemed UNPREDICTABLE by the Arm architecture without a
> >   break-before-make sequence (make the PTE invalid, TLBI, write the
> >   new valid PTE). However, such sequence is not possible since the
> >   vmemmap may be concurrently accessed by the kernel.
> >
> > This series presents one of the previously discussed approaches to
> > re-enable HugeTLB Vmemmap Optimization (HVO) on arm64.
>
> Before jumping into the new mechanisms here, I'd really like to
> understand how the current code is intended to work in the relatively
> simple case where the vmemmap is page-mapped to start with (i.e. when we
> don't need to worry about block-splitting).
>
> In that case, who are the concurrent users of the vmemmap that we need
> to worry about?

Any speculative PFN walkers who either only read `struct page[]` or
attempt to increment page->_refcount if it's not zero.

> Is it solely speculative references via
> page_ref_add_unless() or are there others?

page_ref_add_unless() needs to be successful before writes can follow;
speculative reads are always allowed.

> Looking at page_ref_add_unless(), what serialises that against
> __hugetlb_vmemmap_restore_folio()? I see there's a synchronize_rcu()
> call in the latter, but what prevents an RCU reader coming in
> immediately after that?

In page_ref_add_unless(), the condtion `!page_is_fake_head(page) &&
page_ref_count(page)` returns false before a PTE becomes RO.

For HVO, i.e., a PTE being switched from RW to RO, page_ref_count() is
frozen (remains zero), followed by synchronize_rcu(). After the
switch, page_is_fake_head() is true and it appears before
page_ref_count() is unfrozen (become non-zero), so the condition
remains false.

For de-HVO, i.e., a PTE being switched from RO to RW, page_ref_count()
again is frozen, followed by synchronize_rcu(). Only this time
page_is_fake_head() is false after the switch, and again it appears
before page_ref_count() is unfrozen. To answer your question, readers
coming in immediately after that won't be able to see non-zero
page_ref_count() before it sees page_is_fake_head() being false. IOW,
regarding whether it is RW, the condition can be false negative but
never false positive.

> Even if we resolve the BBM issues, we still need to get the
> synchronisation right so that we don't e.g. attempt a cmpxchg() to a
> read-only mapping, as the CAS instruction requires write permission on
> arm64 even if the comparison ultimately fails.

Correct. This applies to x86 as well, i.e., CAS on RO memory crashes
the kernel, even if CAS would fail otherwise.

> So please help me to understand the basics of HVO before we get bogged
> down by the block-splitting on arm64.

Gladly. Please let me know if anything from the core MM side is unclear.


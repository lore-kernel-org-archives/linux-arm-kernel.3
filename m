Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114C7C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZK/qXqHwCHYaftZ/w1GoLbX5tP80qRmxiIDWeISJO6Q=; b=CjaspEXQu2tgIOaH6xQdXmK1RJ
	BvWUxqmbii9vstN8mnGWw2cOdGPdjW5iqWpZoOv1ORtzA0p26jgtkWudVonvz27jFk+DyzgjpS5Hn
	GKUtFau2d7yQtf12lyTxo6JwGMp2yeuNq8Fp5V86EKKaneC2azdp9vEvymLO410vazY5RObUSpbOo
	h1mzyH2frK9Xw25ARc7133HQPjKGSeaJV0YxwE5Y2sRP86OJS5Y/ySUu3QT3gzz5ynFZxa1Ru042j
	4xYZX3t7kzeYm82md11RKOeZ8NN7uNQhKbHvQvXw3V/2jDhhTncUBzQqThOLHwCDNUHYHI4ZdM3ho
	Ty3af4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnO23-0000000HHlY-1Hgr;
	Fri, 24 Jul 2026 22:06:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnO22-0000000HHlO-0Hf2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 22:06:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 127BA60A84
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 22:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6991F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 22:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784930772;
	bh=ZK/qXqHwCHYaftZ/w1GoLbX5tP80qRmxiIDWeISJO6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fpmg/N6H4iLzNaEYpIheWxuLoPYqARr98BQMPUPoDfLeUOQ3SUhup8BjYe5I/YSsw
	 +z1fmszvtnfUlJh21r6pA6BLwwcwoMiq+k045FawsKK6ElqCdl2gyWEWa+/jgStKFb
	 hMlgsNcJgaQYABY1AnauxjqU73T3oJOBXQUawm53ooM1oIYy8iBrK3CmFV6BiuTynp
	 VnmCeBu/ezj6bYMDeV2Wr+htc2ljCOleiwsU8PlmgyvXUUNCCtx3aBxoyZCSYco2JL
	 LQbvgbVKxE2pPDE9v0CFtvTHGhsp6WTr8NoLWdme/4FFbsb3MfvDxskhmOQTKU8axj
	 jju0Cy7bUINKw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c9452244aso9200781fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:06:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoOqm6oNH35N3jkOcwFi8q1M6m9t6RYtsflKaTkdOv5C81K5RHP7O/CjulzUL9yl/DiGwVP0F9TchojagCoAx6j@lists.infradead.org
X-Gm-Message-State: AOJu0YxkDGZEBvwWJ8wUh4/XXVIVgH4l5mbaK24+CAcl2HNnzgFu5z4v
	8XlklXEczG1ibsvYzgGvECVh8QytG+4P1ceFzrpIPkJaxFj1CRUZnBOYtq7CVkEBPm90Nqg6XdH
	fqhDzi4aBrs72qkFuX9NVIvhX0D6tr4Q=
X-Received: by 2002:ac2:419a:0:b0:5b2:a339:b422 with SMTP id
 2adb3069b0e04-5b2b2e57025mr1270110e87.14.1784930771522; Fri, 24 Jul 2026
 15:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260716014022.2823-1-xieyuanbin1@huawei.com>
In-Reply-To: <20260716014022.2823-1-xieyuanbin1@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 00:05:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLn_DDvWAudHC2Qtz9kaaonuC0YGTXn9nvPtZfGLbtUsOA@mail.gmail.com>
X-Gm-Features: AUfX_mx2hFCYIaz4S_jxIhA6OwkPZhUBrv5ELnxYqV8yBlY24tuCz2ltyfNSBms
Message-ID: <CAD++jLn_DDvWAudHC2Qtz9kaaonuC0YGTXn9nvPtZfGLbtUsOA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: mm: acquire mmap write lock around show_pte() for
 user faults
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, ljs@kernel.org, akpm@linux-foundation.org, 
	xiqi2@huawei.com, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, liaohua4@huawei.com, lilinjie8@huawei.com, 
	sunnanyong@huawei.com
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

On Thu, Jul 16, 2026 at 3:42=E2=80=AFAM Xie Yuanbin <xieyuanbin1@huawei.com=
> wrote:

> When CONFIG_DEBUG_USER=3Dy, and cmdline "user_debug=3D31" is set,
> a user fault may trigger show_pte() without any lock.
> If another thread in the same process concurrently calls munmap(),
> the page table pages may be freed while show_pte() is still traversing
> them, causing a use-after-free in show_pte().
>
> If CONFIG_ARM_LPAE=3Dy, this may cause a kernel panic if the pages table
> of PMD are freed when show_pte() is running.
>
> Acquire mmap_write_lock() around show_pte() for user faults to fix the
> contention.
>
> For user faults, additionally restrict that show_pte() is called only
> when the addr is a user-space address (addr < TASK_SIZE). This is because
> the lock of tsk->mm only protects the virtual memory of user address spac=
e,
> furthermore, dumping the page tables of a kernel-space address for user
> faults is unnecessary and may have security implications.
>
> Keep everything unchanged for kernel faults, because the kernel is
> already in the "oops" state, acquiring a lock may risk a deadlock.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: 6d021b724481 ("ARM: dump pgd, pmd and pte states on unhandled data=
 abort faults")
> Depends-on: <20260629123349.134224-1-xieyuanbin1@huawei.com>
> Depends-on: 59e4f3b45b96 ("ARM: ensure interrupts are enabled in __do_use=
r_fault()")

This looks a bit odd. I don't get the first fix tag, drop it.
I think drop both Depends-on as well.

> Cc: Russell King <linux@armlinux.org.uk>
> Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
> Co-developed-by: Qi Xi <xiqi2@huawei.com>
> Signed-off-by: Qi Xi <xiqi2@huawei.com>
> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>

Looks correct to me otherwise.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Put it in Russell's patch tracker after dropping the weird
tags.

Yours,
Linus Walleij


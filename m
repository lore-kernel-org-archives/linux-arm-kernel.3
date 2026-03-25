Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42133109C033
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOgXW4PS5InKdsPmZGMr7FHOwjdka6gP/0zsYjE+/u4=; b=FYwCeLO81sN8GfwtD4yH9daCsB
	Nc2VmvbvtVLKGAkWCj8VHYWDbUw9lDjhZh5aYk15XOwVahwW2eetk1bAmKbJE9Wq6cE8nOn2tZVtS
	inRERbyWEo0hfcLO3p74XmY5j/8gYsuMTc49KrunWUxICkckJ76fUqPyiZMX+BG/8riFdJEbjSJUv
	1NpBTyyvj+9GXvZjJ4e2KvZnk2eIDnW2NeInG9J/zYRSIsBBLxSBL9Jc+1opEvsVlLskkozRaEhr4
	t3yis2j8Sn2yUV2Qm4Sjh5McveSqitKH7eu7BP76/O1HWZB7Fl4PdwBEgHUZ0xSI90stzDVwUFM4j
	c+3r8Qpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QZv-00000003pdf-3PiM;
	Wed, 25 Mar 2026 15:55:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QZt-00000003pcA-1PLq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:55:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E2191E8D;
	Wed, 25 Mar 2026 08:55:22 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066C33F915;
	Wed, 25 Mar 2026 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774454128; bh=YQUNJN6zkse+VSauT7FpCBg1zlDjtEPhRb6cnGEJo3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h8JB7WbLLPhhNKdwHewQJz8w+JkyrvDnAG4/VGG5xLycbGrGIBZfkpXEzNGax363a
	 DyMKpQnDFv5EJyjol41ofV3pwnkLQEaHLIv+H/8z64TWhKHXcywuIxr9f1hOB/Iedl
	 g0IhNDMiR/fjZHdnXnvW74mg0i/jF65VNF2vtzks=
Date: Wed, 25 Mar 2026 15:55:21 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, mark.rutland@arm.com, harisokn@amazon.com,
	cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
	daniel.lezcano@linaro.org, memxor@gmail.com,
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
	rdunlap@infradead.org, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <acQFaVR_bGZU2JmJ@arm.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
 <20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
 <874imftol4.fsf@oracle.com>
 <20260316233712.7cbfac27@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316233712.7cbfac27@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_085529_498081_AA8FED33 
X-CRM114-Status: GOOD (  22.98  )
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

On Mon, Mar 16, 2026 at 11:37:12PM +0000, David Laight wrote:
> On Mon, 16 Mar 2026 15:08:07 -0700
> Ankur Arora <ankur.a.arora@oracle.com> wrote:
> > However, as David Laight pointed out in this thread
> > (https://lore.kernel.org/lkml/20260214113122.70627a8b@pumpkin/)
> > that this would be fine so long as the polling is on memory, but would
> > need some work to handle MMIO.
> 
> I'm not sure the current code works with MMIO on arm64.

It won't but also passing an MMIO pointer to smp_cond_load() is wrong in
general. You'd need a new API that takes an __iomem pointer.

> I was looking at the osq_lock() code, it uses smp_cond_load() with 'expr'
> being 'VAL || need_resched()' expecting to get woken by the IPI associated
> with the preemption being requested.
> But the arm64 code relies on 'wfe' being woken when the memory write
> 'breaks' the 'ldx' for the monitored location.
> That will only work for cached addresses.

Even worse, depending on the hardware, you may even get a data abort
when attempting LDXR on Device memory.

> For osq_lock(), while an IPI will wake it up, there is also a small timing
> window where the IPI can happen before the ldx and so not actually wake up it.
> This is true whenever 'expr' is non-trivial.

Hmm, I thought this is fine because of the implicit SEVL on exception
return but the arm64 __cmpwait_relaxed() does a SEVL+WFE which clears
any prior event, it can wait in theory forever when the event stream is
disabled.

Expanding smp_cond_load_relaxed() into asm, we have something like:

	LDR	X0, [PTR]
	condition check for VAL || need_resched() with branch out
	SEVL
	WFE
	LDXR	X1, [PTR]
	EOR	X1, X1, X0
	CBNZ	out
	WFE
  out:

If the condition is updated to become true (need_resched()) after the
condition check but before the first WFE while *PTR remains unchanged,
the IPI won't do anything. Maybe we should revert 1cfc63b5ae60 ("arm64:
cmpwait: Clear event register before arming exclusive monitor"). Not
great but probably better than reverting f5bfdc8e3947 ("locking/osq: Use
optimized spinning loop for arm64")).

Using SEV instead of IPI would have the same problem.

-- 
Catalin


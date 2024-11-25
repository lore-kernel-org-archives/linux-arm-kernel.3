Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69D4D58D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyX0cTgA/MvjHnLtiS0Xd8bF9aSHKXc1mygDDIUAEu8=; b=j4ipPZFuv41iy5r6TywSY2lXg7
	eRJ1Ha7mm9lxrGdl1mnXlZ5+GnAM6HeMaKToU3o4ccTkuQSIA7YHNT7gYPHCJSkKQG86LASnJZifB
	55jKnWtmdnuXyNC6/ZdZ6A/oaIyNUXyGY9t/PlvkQdAKlSzL5Dht2xOPrqf4CzO0jQkfyYgGVXu1C
	4tnka8TZIutroiM/pedZ1IGvDYxo6xgu5eD80vDe3TEcXkMHBNlTqJlyHGxvfF2UDnfjTYiIG0YYQ
	Ju/3zkup1P3LcqhUwKn1sVxHKSctFxHRzR4NynMCQEEBfLYVlbyK10vzkhwuhhul0WuADVWud+aWb
	LK4JCMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFave-00000008SsQ-2CMr;
	Mon, 25 Nov 2024 15:23:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaug-00000008Sfm-1LHd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F4475C5B2F;
	Mon, 25 Nov 2024 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42357C4CECE;
	Mon, 25 Nov 2024 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732548129;
	bh=dy2fUC3Stp8CrKtZQSEcsiEhBheaz3FIUb1u3DlnIdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QR3rS21M2KGkHEHHH8+vdXJI0OSl9SBbDyKKk7PcozxHkk3zUnqUIaDOpxeeetRgg
	 kBNBSbIwXN7917M36RVEDC5JrNihq/Kk2RUcbG/XKlHhOom1iK5Z5RUAqpnmXRcZv1
	 l9Ht9LmV1UkcMDcgeq6CArGanLjiQbZ+t/H9yhDVBqpB+YRHXy/GmV062UcVbRq9JD
	 ckMwZcOGpnLlGqBbLxVjlgw4cNfxg8uakhCZ2RBlf9fXpHw4vtE+eXwKEB3sCzehHP
	 /FS5qlpVU048kOl5H2NvfPMFCg2tlR+CuM3cuMFPEJDe7UgQpLw6XOpo8rE9xoQMML
	 kGB8VEBsmgAsQ==
Date: Mon, 25 Nov 2024 15:22:03 +0000
From: Will Deacon <will@kernel.org>
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 0/6] mm/arm64: re-enable HVO
Message-ID: <20241125152203.GA954@willie-the-truck>
References: <20241107202033.2721681-1-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107202033.2721681-1-yuzhao@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_072210_398709_C78A5BF8 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Yu Zhao,

On Thu, Nov 07, 2024 at 01:20:27PM -0700, Yu Zhao wrote:
> HVO was disabled by commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable
> HUGETLB_PAGE_OPTIMIZE_VMEMMAP") due to the following reason:
> 
>   This is deemed UNPREDICTABLE by the Arm architecture without a
>   break-before-make sequence (make the PTE invalid, TLBI, write the
>   new valid PTE). However, such sequence is not possible since the
>   vmemmap may be concurrently accessed by the kernel.
> 
> This series presents one of the previously discussed approaches to
> re-enable HugeTLB Vmemmap Optimization (HVO) on arm64.

Before jumping into the new mechanisms here, I'd really like to
understand how the current code is intended to work in the relatively
simple case where the vmemmap is page-mapped to start with (i.e. when we
don't need to worry about block-splitting).

In that case, who are the concurrent users of the vmemmap that we need
to worry about? Is it solely speculative references via
page_ref_add_unless() or are there others?

Looking at page_ref_add_unless(), what serialises that against
__hugetlb_vmemmap_restore_folio()? I see there's a synchronize_rcu()
call in the latter, but what prevents an RCU reader coming in
immediately after that?

Even if we resolve the BBM issues, we still need to get the
synchronisation right so that we don't e.g. attempt a cmpxchg() to a
read-only mapping, as the CAS instruction requires write permission on
arm64 even if the comparison ultimately fails.

So please help me to understand the basics of HVO before we get bogged
down by the block-splitting on arm64.

Cheers,

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E596CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBvZjwLe5zdrCJH73EVqsmX0tJp3K8ogpghIuJyZiG0=; b=D9PoLVHgMZwfMNYx7AVLmYPhpw
	VOrKVUjJ3tEh8/4YaaSOdPwVUHC0g37iHjhJjQmYJmPTE49BUTAtoqJLgR9EWn/lZR/iTCSOxr/En
	78wCuT0cPdLHq21Nn4LDWvSyuWp7Fr73D4RK4l18LZo9nMCMT9YvGFyHGe3vFJ/0yhQCWEI9nqW5I
	e+xgtoB9FjvZ2P9HfwRTCTk6BWpq4eb08yWdiv6ngjbHCGoUBoEDCyAtT1UcIOJkjiV/hkMvWoVB9
	7IJ02XteSWE5nwLziC/ZKsk1ZMXJ9zYKQv75OBt7Ze5l3KSJsVEKx12p9UkyKljG/dLMaBNqQFk0S
	KK0DK5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyfB-0000000FvOh-3xVY;
	Mon, 18 May 2026 14:09:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyf9-0000000FvMy-0PMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:09:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9641D6F;
	Mon, 18 May 2026 07:09:35 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF0FB3F85F;
	Mon, 18 May 2026 07:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779113380; bh=l/Qlu3Hv8DU45+5xpV6c4Ys2pdhcs0h9f9qT0mq7CAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fF0Rbl+3+beUy/Z/uEmudgn3t5s4SroQO42yF9HRXheF6oLVt9/UdhuMxyo5YJYem
	 061Y/QZdP51yOHhLMIL9Lmv6zQ4EaLf5wxtJaWug/AmesDsc8mD/rQEkGe+uQIVYsO
	 V2VQnzwfK/BX+w+nZ/E1KWe2awZTmPh4Q84ZHVEA=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Optimize S2 page splitting
Date: Mon, 18 May 2026 15:09:36 +0100
Message-ID: <agsdoBEpPLx38lkI@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87o6ifaf5z.wl-maz@kernel.org>
References: <20260515195904.2466381-1-leo.bras@arm.com> <87o6ifaf5z.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_070943_203086_21C2F94A 
X-CRM114-Status: GOOD (  25.87  )
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

On Sat, May 16, 2026 at 10:15:36AM +0100, Marc Zyngier wrote:
> On Fri, 15 May 2026 20:59:01 +0100,
> Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > While playing with dirty-bit tracking, I decided to take a look on how page
> > splitting works. Found out all entries are walked, even though we can infer,
> > for instance that:
> > - If a level-3 entry is walked, it means the parent level-2 entry is split
> > - If a split just succeeded in an table entry, it means all children nodes
> >   are already split
> > 
> > So I tried to optimize it in a way that it does not break other users.
> > 
> > My main idea is to introduce positive return values that hint to the
> > pagetable walking mechanism that either siblings or children can be 
> > skipped. That should be contained to the visitor function, that returns
> > zero if no error was detected.
> > 
> > Numbers on above optimization are promising:
> > A 1GB VM, running on the model, splitting all at the beginning 
> > (no manual protect):
> > - Memory was already split (4k pages): 	-97.33% runtime (-172ms) - 20 runs
> > - THP backed memory: 			-19.82% runtime (-153ms) - 10 runs
> > - 1x1GB hugetlb memory:			-20.65% runtime (-150ms) - 10 runs
> >
> 
> I haven't looked at the changes in details, but the methodology is
> quite flawed. For a start, measuring anything on a software model
> (QEMU or FVP) doesn't mean anything performance-wise. The trade-offs
> are completely different from a HW implementation, and even the notion
> of time is pretty inconsistent.
> 
> Please run this on actual HW. I'm sure your employer can give you
> access to one of these mythical arm64 toys.

Ok, will use real hardware next.

> Measure things from
> userspace, not from the kernel, so that you have all the overheads.
> Don't add console output, because that will make things far worse.
> 
> I'm sure you can hack one of the selftests for this purpose.

I think the dirty_log_perf_test should have an config I can use for that 
without introducing any change. 

Thanks!
Leo


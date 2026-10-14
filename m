Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8CDCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQUi+czjlj2G8bPHbQlwLRvffZMJsf+TVrp4oXR7v6U=; b=e7j9oUpCWNrZf8rNLcPbq8dOPX
	9ZxloBVVbLTNvkWXrOn2+Pe4kbAuD5zGtPaTfl2575aNbW2kiWCpMBxMHnD7+Uc63D9P8FrhvJRP6
	s61o1SyZuBOcjPMqjdkESeFFRbnmPgaZfFIS6w9q5TDXL3OP8PrTEyhI3vXkdILF3HdC9eYXKOpRw
	4ROs1Y/TAqx2Wus9kQ3SpwyCeixR8QxK2qtR6lTxf2YerxgbdskjcgLBQXxndyMkqjGIVxJIXUyLH
	oy6XPD2zj1NIV4fJpw8EgNIxFzFpRA0/ScpktDE6nmKuzIZta9rMHXZF31DF/srebfNxwitF6u2QA
	XNGD16yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1LD-0000000FudE-0z1V;
	Wed, 14 Oct 2026 15:56:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1LA-0000000FucM-3qCB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 15:56:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43B3D14BF;
	Wed, 14 Oct 2026 08:56:16 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 890BA3F7B4;
	Wed, 14 Oct 2026 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791993379; bh=va13RaM/sanuKVZ3CaYPU08d6tBndpG5IAYdTqJH6Zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J3j8A+o7YMnGQzWRo3Z55LcdGh0AeUHPrlQxrh+yhl6FsnnpzMxM6D9BXg0A0gTAg
	 C1Ab0IcjTSRIDPSFmfs7zaufoifA+gC2NpOekh0hFjItW/wNaTum6HLrjMfY9BL8ej
	 cd+J+gOyOsf8XLF2oRHGcSe54kVXiZjIQ+TjmUZk=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on migration
Date: Wed, 14 Oct 2026 16:56:15 +0100
Message-ID: <as-mH36YSMxAosND@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <aqvt2gnlBZeNsaf4@LeoBrasDK>
References: <20260901171558.2674031-1-leo.bras@arm.com> <20260901171558.2674031-6-leo.bras@arm.com> <aqneWnlsdpocLIl6@kernel.org> <aqqhDs3NyjtkZzXK@LeoBrasDK> <aqsl1_IqnV2r8kUL@kernel.org> <aqvt2gnlBZeNsaf4@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_085629_051651_390F1384 
X-CRM114-Status: GOOD (  30.17  )
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

On Thu, Sep 17, 2026 at 02:40:42PM +0100, Leonardo Bras wrote:
> On Wed, Sep 16, 2026 at 04:27:19PM -0700, Oliver Upton wrote:
> > On Wed, Sep 16, 2026 at 03:00:46PM +0100, Leonardo Bras wrote:
> > > On Tue, Sep 15, 2026 at 05:10:02PM -0700, Oliver Upton wrote:
> > > > Hi,
> > > > 
> > > > On Tue, Sep 01, 2026 at 06:15:56PM +0100, Leonardo Bras wrote:
> > > > > When dirty-logging is disabled, even non-write faults make a page dirty,
> > > > > which avoids a second fault when the page is actually written to.
> > > > > 
> > > > > On dirty-logging enable, this approach causes all (writable) pages on the
> > > > > memslot to be marked clean, even if they were not written to, which can
> > > > > take a lot of time, while holding the MMU lock, doing atomic writes to
> > > > > PTEs.
> > > > 
> > > > Do you have any performance numbers for this? Enabling HAFDBS seems a
> > > > bit involved to avoid some stores on the first pass.
> > > 
> > > Not yet, but if the idea does not look too crazy I can find hardware and 
> > > collect some data :)
> > 
> > TBH this looks like a micro-optimization so I'm not expecting the
> > performance gains to justify the behavior change.
> > 
> 
> Okay then, I will get a machine to figure the performance gains :)

Got the performance numbers here. 
I tested both the case where all PTEs are dirty, and the case that 50% of 
the PTEs are dirty.

For that test, actually patch #5 could make kvm_pgtable_stage2_wrprotect() 
slower, which is counter-intuitive, in all platforms tested:

When we walk the S2 pagetable to wrprotect, using the new walker, the 
write to the PTE itself is so cheap* that the cost of the branch 
misprediction (write PTE or not) for the 50/50 case is significantly higher 
than the cost of the 50% extra writes, which makes the 50/50 up to 60% 
slower than the 100% dirty case. It is still slower in the '25% dirty' as 
well, and starts to get even at '10% dirty'. 

* (non-atomic, everything is in order, walker is small, cpu will probably 
bundle it all in a single cacheline write) 

Since the idea of patch #5 was to reduce PTE writes in the first wrprotect 
walk, it becomes faster only if only a small portion (<10%) of the VM was 
write-faulted while the remaining was read-faulted, which seems to be a 
really reduced audience.

Since this comes with increased complexity, and also carry costs of 
having HAFDBS itself enabled outside dirty-tracking, I don't think it's a 
good idea to further pursue patch #5. It's only value is that it served as 
a base for HDBSS implementation.

Thanks for reading!
Leo


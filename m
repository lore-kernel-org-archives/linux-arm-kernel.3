Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB87CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mV5xQ+ej5DL/f42EabFbqOXtI7iA4Q72glnDSq9mF3g=; b=Dk1I9zVP+vf+Cx9yhoIEeOTDTi
	zZ62MkpQ8fehgvHWCrcoqJNeTe2MNwrKPMmHZOf/6+4I6jPpl+c1ItJVDydB3PXoBdjV9Hg6YA+9q
	pTg3YRhkcTrT9GdJUJg/J8Fq8cxZa2qyiTHzN/HbTAXu2U4aoOb8h9xw6srNe8Mi1P6Nsp2mNAyTv
	bkSzhiwll9f20bwLCbyUlQ3NiwiuIHQeqSNGh5mqDzwVBijzjCs0ThJOo6DCaJ0o7cHZxQOHHvkYD
	ZjXvUxkyshLgNN4IJK8zxHvq0Jywwb1arYU9NQ8g/YPvEwUGuEbw1RtZfJBwd17C5dTUOBML2KMoh
	o/ILWx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwl1-00000007PdX-0kr4;
	Fri, 29 May 2026 12:56:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwkz-00000007Pd4-3AKL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:56:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D25B2247;
	Fri, 29 May 2026 05:56:03 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE8F63F632;
	Fri, 29 May 2026 05:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780059368; bh=n9Zij2lTC42O0asoob6by1uG5qjwnMEU9gT53E+5GRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qd2CTztfz4vNPG0hjcltiRX7d1CN+N7kVrQbZgWBMumpPVNtiJl0Z9e1m6kpB6cim
	 OFhbZ9KfEgYrH5GzNV6okJXqNqC6E07ZsSCimFczPiJ1PQM9eiGT1cZIweogUM1h9D
	 WV7mS0/LoD9/gK+rxp6oMAU73NmPzbLjqUEXr9gQ=
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
Date: Fri, 29 May 2026 13:56:03 +0100
Message-ID: <ahmMuyhcgWIGgkSe@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <865x46v1w9.wl-maz@kernel.org>
References: <20260515195904.2466381-1-leo.bras@arm.com> <87o6ifaf5z.wl-maz@kernel.org> <ahh0wOamCIKbmQqp@devkitleo> <865x46v1w9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_055609_876807_D224684B 
X-CRM114-Status: GOOD (  43.87  )
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

On Fri, May 29, 2026 at 01:25:10PM +0100, Marc Zyngier wrote:
> On Thu, 28 May 2026 18:00:48 +0100,
> Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > On Sat, May 16, 2026 at 10:15:36AM +0100, Marc Zyngier wrote:
> > > On Fri, 15 May 2026 20:59:01 +0100,
> > > Leonardo Bras <leo.bras@arm.com> wrote:
> > > > 
> > > > While playing with dirty-bit tracking, I decided to take a look on how page
> > > > splitting works. Found out all entries are walked, even though we can infer,
> > > > for instance that:
> > > > - If a level-3 entry is walked, it means the parent level-2 entry is split
> > > > - If a split just succeeded in an table entry, it means all children nodes
> > > >   are already split
> > > > 
> > > > So I tried to optimize it in a way that it does not break other users.
> > > > 
> > > > My main idea is to introduce positive return values that hint to the
> > > > pagetable walking mechanism that either siblings or children can be 
> > > > skipped. That should be contained to the visitor function, that returns
> > > > zero if no error was detected.
> > > > 
> > > > Numbers on above optimization are promising:
> > > > A 1GB VM, running on the model, splitting all at the beginning 
> > > > (no manual protect):
> > > > - Memory was already split (4k pages): 	-97.33% runtime (-172ms) - 20 runs
> > > > - THP backed memory: 			-19.82% runtime (-153ms) - 10 runs
> > > > - 1x1GB hugetlb memory:			-20.65% runtime (-150ms) - 10 runs
> > > >
> > > 
> > > I haven't looked at the changes in details, but the methodology is
> > > quite flawed. For a start, measuring anything on a software model
> > > (QEMU or FVP) doesn't mean anything performance-wise. The trade-offs
> > > are completely different from a HW implementation, and even the notion
> > > of time is pretty inconsistent.
> > > 
> > > Please run this on actual HW. I'm sure your employer can give you
> > > access to one of these mythical arm64 toys. Measure things from
> > > userspace, not from the kernel, so that you have all the overheads.
> > > Don't add console output, because that will make things far worse.
> > > 
> > > I'm sure you can hack one of the selftests for this purpose.
> > 
> > Hello Marc,
> > 
> > I have ran some tests in real hardware (AmpereOne) and calling from 
> > userspace as you suggested.
> > 
> > The tests create a 64GB VM, using either regular pages (no split needed), 
> > THP backed memory or Hugetlb. 
> > 
> > Those tests measured the times for the whole syscall that happens to do
> > eager page splitting, in this case,
> > 1 - Manual protect and init set: On every KVM_CLEAR_DIRTY_LOG, if the page
> >     was requested to be cleaned, it is also split.
> > 2 - Otherwise, on dirty log enable (aka KVM_SET_USER_MEMORY_REGION2 with
> >     KVM_MEM_LOG_DIRTY_PAGES set in flags), for the whole memslot is split
> >     at once.
> > 
> > Tests reflect new suggestions I got in this patchset: instead of using 
> > return values, I am using flags to skip whole levels, or skipping children 
> > nodes. I tested those 2 kernels, on top of vanilla:
> > a - Skip levels
> > b - Skip levels, and skip children node
> > 
> > Results averaged across 4k, 16k and 64k pages, a percentage of time 
> > saved, compared to vanilla kernel. More is better.
> > 
> > For (1), we have
> > regular pages:	26.7% (a) and 25.3% (b)
> > THP:		13.2% (a) and 11.9% (b)
> > Hugetlb:	14.3% (a) and 13.2% (b)
> > 
> > For (2), we have:
> > regular pages:	33.1% (a) and 35.0% (b)
> > THP:		11.9% (a) and 10.7% (b)
> > Hugetlb:	13.4% (a) and 13.2% (b)
> > 
> > On above results, I could notice about 1% overhead showing that skipping 
> > child nodes (testing flag) ends up being counter-productive compared to 
> > just skipping levels. The only case this does not happen is (2a), but it's 
> > not clear on why that happens.
> > 
> > Based on that, I plan to remove the skip_child patch, and send a v2 with a 
> > flag-based mechanism, which results are shown above.
> > 
> > Please let me know of any thoughts, suggestions or ideas you might have 
> > about it.
> 
> Right, that seems compelling.

Awesome!

> I'd suggest you send a new version with:
> 
> - a pointer to the test and its the exact invocation parameters so
>   that people other than you can reproduce it
> 
> - these numbers with a bit of analysis explaining where the gains are
> 
> With that, we can look at it again and compare results on different
> workloads and HW.
> 

Noted!
Will attach test parameters and full results, describing where the gains 
come from. 

Thanks!
Leo



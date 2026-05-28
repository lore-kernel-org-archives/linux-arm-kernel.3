Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28940CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Znfjor+zJ70etFiFDbpb0jYMeDkXX1SFodOSy+D/Sw=; b=ImHyHXsoYCIeHZrweshIZlCI6/
	iMoXl7nusiUI+4fgpDViu6K7uk6Al2F86+IpgBoHOfSvPR026BnzWMp9c4hJ1ACnCPBy9hLxO05Ai
	EJIo3DexreCVXDANPmAnqiL25NBKh/87Z02MtN4ufkBZn85LeMdjFak8gi+kdwgucGXGQlkkKqeMQ
	ITLsbYTG5+KF+/yrWUfZMjxyji3Sbak0kVaahIRqO7hpVxMNd794pa58IdWuWuNuQCOGASqygKLyO
	JFOV453RYtpk9Lnv0E1UDJKhtdrlkU97JjSf+js+UizejoI7JCuKpt4L53apXX3niSk6AFFKPNNBY
	VjVMSZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSe6L-000000063tU-0ygR;
	Thu, 28 May 2026 17:00:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSe6I-000000063sh-19Rr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:00:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62CD14617;
	Thu, 28 May 2026 10:00:47 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 845303F905;
	Thu, 28 May 2026 10:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779987652; bh=CTP15c6ZTQAbPUo//xK8LqjektCEHBQDQm+RD2xFupM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pylq86ayT02MasE10PueW9vf56oVo+Exa5ofT6xhS0uiZ8K+FNNhPU7eYE7Y0ubja
	 88FRnwjfHOPwRRPlUJrc5mgKuSn1mY6YrrGWkL2UPzyHuEUpHv8pd65cIsOQPqIfrb
	 GajKq0iNr6IBPXKC2tsc2UuWgbovFAWWMwak9W98=
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
Date: Thu, 28 May 2026 18:00:48 +0100
Message-ID: <ahh0wOamCIKbmQqp@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87o6ifaf5z.wl-maz@kernel.org>
References: <20260515195904.2466381-1-leo.bras@arm.com> <87o6ifaf5z.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_100054_393792_2E3BEC82 
X-CRM114-Status: GOOD (  29.44  )
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
> access to one of these mythical arm64 toys. Measure things from
> userspace, not from the kernel, so that you have all the overheads.
> Don't add console output, because that will make things far worse.
> 
> I'm sure you can hack one of the selftests for this purpose.

Hello Marc,

I have ran some tests in real hardware (AmpereOne) and calling from 
userspace as you suggested.

The tests create a 64GB VM, using either regular pages (no split needed), 
THP backed memory or Hugetlb. 

Those tests measured the times for the whole syscall that happens to do
eager page splitting, in this case,
1 - Manual protect and init set: On every KVM_CLEAR_DIRTY_LOG, if the page
    was requested to be cleaned, it is also split.
2 - Otherwise, on dirty log enable (aka KVM_SET_USER_MEMORY_REGION2 with
    KVM_MEM_LOG_DIRTY_PAGES set in flags), for the whole memslot is split
    at once.

Tests reflect new suggestions I got in this patchset: instead of using 
return values, I am using flags to skip whole levels, or skipping children 
nodes. I tested those 2 kernels, on top of vanilla:
a - Skip levels
b - Skip levels, and skip children node

Results averaged across 4k, 16k and 64k pages, a percentage of time 
saved, compared to vanilla kernel. More is better.

For (1), we have
regular pages:	26.7% (a) and 25.3% (b)
THP:		13.2% (a) and 11.9% (b)
Hugetlb:	14.3% (a) and 13.2% (b)

For (2), we have:
regular pages:	33.1% (a) and 35.0% (b)
THP:		11.9% (a) and 10.7% (b)
Hugetlb:	13.4% (a) and 13.2% (b)

On above results, I could notice about 1% overhead showing that skipping 
child nodes (testing flag) ends up being counter-productive compared to 
just skipping levels. The only case this does not happen is (2a), but it's 
not clear on why that happens.

Based on that, I plan to remove the skip_child patch, and send a v2 with a 
flag-based mechanism, which results are shown above.

Please let me know of any thoughts, suggestions or ideas you might have 
about it.

Thanks!
Leo



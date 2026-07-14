Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2281CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgMuD31kCrS+fD+T9mBtweK9/sH7EXdZCkmeWX6ajB4=; b=ucVCuEX4TVsQdE4oMnKQ/uOFAr
	yjd4ZW7U+rs7dpMEVxmmEGfUR3N0J0VmMlWvTOolu9OY036yRez0oYLHIN69JQiFlGv+pavipjnSt
	pwZowdexHtJxiSDCr1QnS3qFfwM0uob9AoelqZ/gewkrIV8meshzR6BT7OS5jIg7+ctu9D8FUy7Ar
	Uk55mkGCi8FHdiNNpbTm8Dz546ewYeHGsV+mGsYqpJC32+zq/QpVy8t98g8OK6KYZ2FIcN+MCRrqg
	Z6Af+CvbKWDWe2r0oTEfiXjm9gJbeAa2oDBdIVJW+GJlB7M3WIq6Lud2vurleM+umd1cftbPovVhz
	24BmaAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjW08-0000000AzCU-2tfX;
	Tue, 14 Jul 2026 05:48:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjW04-0000000AzBq-3GY3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:48:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F4161570;
	Mon, 13 Jul 2026 22:48:06 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4776E3F7D8;
	Mon, 13 Jul 2026 22:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784008090; bh=LnW4ts9Lwbe3BPXxuqMwhfTHqufwNRGWcggpm0tvBew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkBjiN/MvkBffP/FzGvlZqOgTYAlnIXETK3uWmobYyBHaVLT0R47JIZ55AA68T0My
	 ESgPLI8Yl/40kJ+jQs7FjrimUBDULfv0uFCr0Q7sHtNnPJTqc1TwVa5FW05TekZbDs
	 05Ai63DX98GIXiCBZY0DkcquX50aTkmTd1vAcIOQ=
Date: Tue, 14 Jul 2026 06:47:54 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/5] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <ytl6idu3chd7hg5xsgbqwdh24gdckinngirflls7o2st3moyw2@m5jeouveqw6n>
References: <20260510145338.322962-1-weilin.chang@arm.com>
 <alVweBtKt_4jH1q3@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alVweBtKt_4jH1q3@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_224812_869738_12D40D2E 
X-CRM114-Status: GOOD (  23.48  )
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

On Tue, Jul 14, 2026 at 08:10:48AM +0900, Itaru Kitayama wrote:
> On Sun, May 10, 2026 at 03:53:33PM +0100, Wei-Lin Chang wrote:
> > Hi,
> > 
> > This is v3 of optimizing the shadow s2 mmu unmapping during MMU
> > notifiers.
> > 
> > Two new preparatory patches are added, one reduces a hole in kvm_s2_mmu
> > and another refactors the code a bit during s2 faults. Other changes are
> > listed below.
> > 
> > * Changes from v2 [1]:
> > 
> >   - Removed "polluted" teminology.
> > 
> >   - Use xa_{mk, to}_value() when storing and retriving values from maple
> >     trees.
> > 
> >   - Avoid using the 63rd bit in maple tree values so that xa_{mk, to}_value()
> >     does not lose us a bit.
> > 
> >   - Added reverse map removal during TLBI handling.
> > 
> >   - Other suggested refactorings.
> > 
> > Thanks!
> 
> Hi Wei-Lin
> As this series is no longer cleanly applied on top of the recent kvmarm/fixes,
> I wonder if you could update the series; I can wait if you're in the
> works of preparing v4. I am planning to test this series on HW with your
> proposed nested virtualization KVM selftests.

Hey Itaru,

Sorry for the delay. I have been working on something else in parallel
hence I haven't updated this series for a while. Yes I am almost done
preparing v4, it should be posted sometime this week.

Thanks for your feedback and testing!

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Itaru.
> 
> > 
> > [1]: https://lore.kernel.org/kvmarm/20260411125024.3735989-1-weilin.chang@arm.com/
> > 
> > Wei-Lin Chang (5):
> >   KVM: arm64: Use a variable for the canonical GPA in kvm_s2_fault_map()
> >   KVM: arm64: Move shadow_pt_debugfs_dentry to reduce holes in
> >     kvm_s2_mmu
> >   KVM: arm64: nv: Avoid full shadow s2 unmap
> >   KVM: arm64: nv: Remove reverse map entries during TLBI handling
> >   KVM: arm64: nv: Create nested IPA direct map to speed up reverse map
> >     removal
> > 
> >  arch/arm64/include/asm/kvm_host.h   |  17 +-
> >  arch/arm64/include/asm/kvm_nested.h |   6 +
> >  arch/arm64/kvm/mmu.c                |  43 +++--
> >  arch/arm64/kvm/nested.c             | 238 +++++++++++++++++++++++++++-
> >  arch/arm64/kvm/sys_regs.c           |   3 +
> >  5 files changed, 290 insertions(+), 17 deletions(-)
> > 
> > -- 
> > 2.43.0
> > 


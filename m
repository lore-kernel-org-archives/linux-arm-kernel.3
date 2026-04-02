Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB85FD3941D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Liea33ZiAixoJJgrSxmZrM3eaD0U9yoorf62adWMFCQ=; b=NINTlCQ1XrxyNxWbczcjWRx5Hw
	6881B4+qVHNKVlAjFN84q5r6uialP2L4zdX26X3RavMfOmy2MH6RbHSrADg5dArd6N4vwjRK7qx19
	xykzmMXfM5hEcOXOcRsj/uqv0MJqZ/mJx2jR9tlZFNf3zq6ZlBQG5D30DpWI95gXqm5XfEBw4Ohnz
	Aq0gJox7tT6UoUItQExcSRZwW0TR+6c5pw2LDSXrYyLFPUgiuPHL10IT9Dv4w6JHb1pZFYuJJzHE4
	OAI1F+HKw+6KtShpwwhb3rkK3L727wjWhqVcRFvlHdH4szyzpBG+sxOSCsoftiojU2W0thrEBTQoY
	xvAKAKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HNe-0000000069g-0Jbf;
	Thu, 02 Apr 2026 12:42:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HNc-0000000069R-1eiK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 12:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Liea33ZiAixoJJgrSxmZrM3eaD0U9yoorf62adWMFCQ=; b=fAIf0+HvYEKb5if3GpQaojkbjD
	zVrcC5wNIFQ+Aj4UQtMrwn1lRz0sydOM50BOn+tVXL0N65qreRkn/JXgQabSMvJuDdzzFNN8W/Sp0
	+x1CtguJOmIhSl00NL309BCAS7Ta4hO1GYAc0naahalfLKAjFYQTtVl5LKrGfZSJJNAMWdxZ/KjFo
	lTrw+U0T3AIrW0Gj0DCNfDgtBPVjb217nGQe3qpL/FKlRrWaFZnmmDRoh2VTB1TooTMYs3bNpQoLJ
	F7NDMy7zVWIHpd3mJOk/nk9ZkIEpGCQcZNJ4F4KMyMXss62VQQWiofG1w7iOh7t3k+ICQkahMv+WQ
	FQDCBptw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HNW-00000002SsW-1Waf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 12:42:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2B312C43;
	Thu,  2 Apr 2026 05:42:21 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 534263F915;
	Thu,  2 Apr 2026 05:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775133747; bh=eXuiAgdKHKGDwjhMoJPybkXIHLyx2xl4IR43FDNFuXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mjn/K6kuBcKdeIR3d/RDCeq8IGk9fAR4uLseX84J6PK0lk7X6fvW7GsGpxYK69NPz
	 TagyLFaP67hiiK+hPeAtNGk5rtn59RNu2q84pljWIfC0qxjiqqLoVRn17vHnIWfIIm
	 xNx6D9GvNhQE/O10koxyjTdCvO9Xx4q/DRG6csNA=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	liuyonglong@huawei.com,
	Jonathan.Cameron@huawei.com,
	yezhenyu2@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
Date: Thu,  2 Apr 2026 13:42:17 +0100
Message-ID: <ac5kKQZEnS93qdDm@devkitleo>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <730aaffa-9dfd-40c3-a372-c774d203b6e1@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com> <acvWnjG0AZBHL21q@devkitleo> <730aaffa-9dfd-40c3-a372-c774d203b6e1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_134230_775117_6B852765 
X-CRM114-Status: GOOD (  33.32  )
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

On Thu, Apr 02, 2026 at 10:40:37AM +0800, Tian Zheng wrote:
> 
> On 3/31/2026 10:13 PM, Leonardo Bras wrote:
> > On Wed, Feb 25, 2026 at 12:04:16PM +0800, Tian Zheng wrote:
> > > This series of patches add support to the Hardware Dirty state tracking
> > > Structure(HDBSS) feature, which is introduced by the ARM architecture
> > > in the DDI0601(ID121123) version.
> > > 
> > > The HDBSS feature is an extension to the architecture that enhances
> > > tracking translation table descriptors' dirty state, identified as
> > > FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
> > > page tracking, aiming to significantly reduce the overhead of scanning
> > > for dirty pages.
> > > 
> > > The purpose of this feature is to make the execution overhead of live
> > > migration lower to both the guest and the host, compared to existing
> > > approaches (write-protect or search stage 2 tables).
> > > 
> > > After these patches, users(such as qemu) can use the
> > > KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl to enable or disable the HDBSS
> > > feature before and after the live migration.
> > > 
> > > v2:
> > > https://lore.kernel.org/linux-arm-kernel/20251121092342.3393318-1-zhengtian10@huawei.com/
> > > 
> > > v2->v3 changes:
> > > - Remove the ARM64_HDBSS configuration option and ensure this feature
> > > is only enabled in VHE mode.
> > > - Move HDBSS-related variables to the arch-independent portion of the
> > > kvm structure.
> > > - Remove error messages during HDBSS enable/disable operations
> > > - Change HDBSS buffer flushing from handle_exit to vcpu_put,
> > > check_vcpu_requests, and kvm_handle_guest_abort.
> > > - Add fault handling for HDBSS including buffer full, external abort,
> > > and general protection fault (GPF).
> > > - Add support for a 4KB HDBSS buffer size, mapped to the value 0b0000.
> > > - Add a second argument to the ioctl to turn HDBSS on or off.
> > > 
> > > Tian Zheng (1):
> > >    KVM: arm64: Document HDBSS ioctl
> > > 
> > > eillon (4):
> > >    arm64/sysreg: Add HDBSS related register information
> > >    KVM: arm64: Add support to set the DBM attr during memory abort
> > >    KVM: arm64: Add support for FEAT_HDBSS
> > >    KVM: arm64: Enable HDBSS support and handle HDBSSF events
> > > 
> > >   Documentation/virt/kvm/api.rst       |  16 +++++
> > >   arch/arm64/include/asm/cpufeature.h  |   5 ++
> > >   arch/arm64/include/asm/esr.h         |   7 ++
> > >   arch/arm64/include/asm/kvm_host.h    |  17 +++++
> > >   arch/arm64/include/asm/kvm_mmu.h     |   1 +
> > >   arch/arm64/include/asm/kvm_pgtable.h |   4 ++
> > >   arch/arm64/include/asm/sysreg.h      |  11 +++
> > >   arch/arm64/kernel/cpufeature.c       |  12 ++++
> > >   arch/arm64/kvm/arm.c                 | 102 +++++++++++++++++++++++++++
> > >   arch/arm64/kvm/hyp/pgtable.c         |   6 ++
> > >   arch/arm64/kvm/hyp/vhe/switch.c      |  19 +++++
> > >   arch/arm64/kvm/mmu.c                 |  70 ++++++++++++++++++
> > >   arch/arm64/kvm/reset.c               |   3 +
> > >   arch/arm64/tools/cpucaps             |   1 +
> > >   arch/arm64/tools/sysreg              |  29 ++++++++
> > >   include/uapi/linux/kvm.h             |   1 +
> > >   tools/include/uapi/linux/kvm.h       |   1 +
> > >   17 files changed, 305 insertions(+)
> > > 
> > > --
> > > 2.33.0
> > > 
> > 
> > Hi Tian,
> > 
> > I was thinking: maybe instead of putting the HDBSS (and HACDBS) stuff
> > across a bunch of KVM files, we should try to focus them all on a single
> > arch/arm64/kvm/dirty_bit.c file (plus a header such as
> > arch/arm64/include/asm/kvm_dirty_bit.h).
> > 
> > What is your opinion on that?
> > 
> > Thanks!
> > Leo
> 
> 
> Sorry for the late reply. Yes, I had the same thought before. In the next
> version, I will
> 
> move all the HDBSS-related content into the same file, such as
> arch/arm64/kvm/dirty_bit.c
> 
> and arch/arm64/include/asm/kvm_dirty_bit.h.
> 
> 
> Tian
> 
> 
> > 
> > 


Awesome! Then I will work my HACDBS enablement that way as well.

Thanks!
Leo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82941E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ITETtXYs2RuPBQjD/ZQ3S2/BEHPuHJ2nAfRrmxcJLxI=; b=GMUqrXRvzhxBpI+sgRw9WTVn+K
	FKIhULzUOQdK2rt/UE6zs1NajZTYEz2v2gBcnb8uoPD5dgyW3Hm0RvNnPrz7XS5Xybrs2GkW6PgMX
	ga7Y/NKUio58d27YTmNEroXNzD4OOBsl+d7jDrzYi37sgolebBb6mq88UWzQeufFRCYBbsPukWsAb
	dMtej2AbCZcm3ylGG9DglI55Ic3MUhsoqzdYkjY6hrSrimEKjWqTV+1q7+Cw7lOEUGlvTeU2141YI
	BMtvQmPL1LFkXywZCdiLE3bG5YWT3DWOLoptO2AMpgorfXJTdZPSUBB7y/M93A3ZV7aALLLgE9mdq
	bxfkrdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPIz-0000000FP82-1mas;
	Wed, 11 Dec 2024 16:11:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPAw-0000000FNJQ-1xtf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:02:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3B4F1063;
	Wed, 11 Dec 2024 08:03:25 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D7383F5A1;
	Wed, 11 Dec 2024 08:02:55 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [RESEND RFC PATCH v1 0/5] Initial BBML2 support for contpte_convert()
Date: Wed, 11 Dec 2024 16:01:36 +0000
Message-ID: <20241211160218.41404-1-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_080258_592777_88CCC9B8 
X-CRM114-Status: GOOD (  17.48  )
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

Resending as had wrong address for linux-doc and kvmarm. Apologies for
spam.

Hi All,

This patch series seeks to gather feedback on adding initial support
for level 2 of the Break-Before-Make arm64 architectural feature,
specifically to contpte_convert().

This support reorders a TLB invalidation in contpte_convert(), and
optionally elides said invalidation completely which leads to a 12%
improvement when executing a microbenchmark designed to force the
pathological path where contpte_convert() gets called. This
represents an 80% reduction in the cost of calling contpte_convert().

However, the elision of the invalidation is still pending review to
ensure it is architecturally valid. Without it, the reodering also
represents a performance improvement due to reducing thread contention,
as there is a smaller time window for racing threads to see an invalid
pagetable entry (especially if they already have a cached entry in their
TLB that they are working off of).

This series is based on v6.13-rc2 (fac04efc5c79).

Break-Before-Make Level 2
=========================

Break-Before-Make (BBM) sequences ensure a consistent view of the
page tables. They avoid TLB multi-hits and ensure atomicity and
ordering guarantees. BBM level 0 simply defines the current use
of page tables. When you want to change certain bits in a pte,
you need to:

- clear the pte
- dsb()
- issue a tlbi for the pte
- dsb()
- repaint the pte
- dsb()

When changing block size, or toggling the contiguous bit, we
currently use this BBM level 0 sequence. With BBM level 2 support,
however, we can relax the BBM sequence and benefit from a performance
improvement. The hardware would then either automatically handle the
TLB invalidations, or would take a TLB Conflict Abort Exception.

This exception can either be a stage 1 or stage 2 exception, depending
on whether stage 1 or stage 2 translations are in use. The architecture
currently mandates a worst-case invalidation of vmalle1 or vmalls12e1,
when stage 2 translation is not in-use and in-use respectively.

Outstanding Questions and Remaining TODOs
=========================================

Patch 4 moves the tlbi so that the window where the pte is invalid is
significantly smaller. This reduces the chances of racing threads
accessing the memory during the window and taking a fault. This is
confirmed to be architecturally sound.

Patch 5 removes the tlbi entirely. This has the benefit of
significantly reducing the cost of contpte_convert(). While testing
has demonstrated that this works as expected on Arm-designed CPUs, we
are still in the process of confirming whether it is architecturally
correct. I am requesting review while that process is on-going. Patch 5
would be dropped if it turns out to be architecturally unsound.

Another note is that the stage 2 TLB conflict handling is included as
patch 1 of this series. This patch could (and probably should) be sent
separately as it may be useful outside this series, but is included for
reference.

Thanks,
Miko

Mikołaj Lenczewski (5):
  arm64: Add TLB Conflict Abort Exception handler to KVM
  arm64: Add BBM Level 2 cpu feature
  arm64: Add errata and workarounds for systems with broken BBML2
  arm64/mm: Delay tlbi in contpte_convert() under BBML2
  arm64/mm: Elide tlbi in contpte_convert() under BBML2

 Documentation/arch/arm64/silicon-errata.rst |  32 ++++
 arch/arm64/Kconfig                          | 164 ++++++++++++++++++++
 arch/arm64/include/asm/cpufeature.h         |  14 ++
 arch/arm64/include/asm/esr.h                |   8 +
 arch/arm64/kernel/cpufeature.c              |  37 +++++
 arch/arm64/kvm/mmu.c                        |   6 +
 arch/arm64/mm/contpte.c                     |   3 +-
 arch/arm64/mm/fault.c                       |  27 +++-
 arch/arm64/tools/cpucaps                    |   1 +
 9 files changed, 290 insertions(+), 2 deletions(-)

-- 
2.45.2



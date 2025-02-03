Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5EBC02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 05:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rnYE5hLkcP1+8fFW5D83Ve/VXqfCL+5OcIkBLzDMTz8=; b=ENGTu9C00orkNyGMAi1r5H84CE
	QVh/MDLJWZayFN2lzRrZZhzYMb9GEG8b//iJ6iznrVqzpmBwjp7W7UJ64fRlR1FkWu7ZIGZIef3d2
	yU0tJubtQcAbsy8a1Mdu0mhvJmf4B+KGqX2RR30MA9WsMRiWXP3mKJ+9CLHmI95nWvsMdy8LGITVQ
	mKkxxXDbjzxqIYOD5VXIeJxTViPV2ezGu8qj49xQ3zaJ+h6WNj3uKBf/i/ouZF5UPKJibkFlvlyLX
	AXHK+HAf26fcw5R2hYlg+zN06zlybVzkbzY4UdqS6lkS23JY44uZ7gxkLzzQZvBUFUamfqbN370kD
	pp+2YyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teoio-0000000EZKO-2OxZ;
	Mon, 03 Feb 2025 05:10:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teohR-0000000EYzN-0H1g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 05:08:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15DD41476;
	Sun,  2 Feb 2025 21:09:08 -0800 (PST)
Received: from a077893.blr.arm.com (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80C423F5A1;
	Sun,  2 Feb 2025 21:08:39 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <robh@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>,
	kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
Date: Mon,  3 Feb 2025 10:38:21 +0530
Message-Id: <20250203050828.1049370-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_210845_160770_560BF2C1 
X-CRM114-Status: GOOD (  11.35  )
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

This series adds fine grained trap control in EL2 required for FEAT_PMUv3p9
registers like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 which are already
being used in the kernel. This is required to prevent their EL1 access trap
into EL2.

PMZR_EL0 register trap control i.e HDFGWTR2_EL2.nPMZR_EL0 remains unchanged
for now as it does not get accessed in the kernel, and there is no plan for
its access from user space.

I have taken the liberty to pick up all the review tags for patches related
to tools sysreg update from the KVM FGT2 V2 patch series posted earlier.

https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@arm.com/

Rob had earler mentioned about FEAT_FGT2 based trap control requirement for
FEAT_PMUv3p9 registers that are currently being used in kernel. The context
can be found here.

https://lore.kernel.org/all/20241216234251.GA629562-robh@kernel.org/

This series is based on v6.14-rc1

Changes in V2:

- Rebased on v6.14-rc1
- Updated tools sysreg patches with latest DDI0601 2024-12 definitions
- Updated document version as DDI0601 2024-12 in all commit messages
- Added latest tags from Rob Herring for the last patch

Changes in V1:

https://lore.kernel.org/all/20241220072240.1003352-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <robh@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: kvmarm@lists.linux.dev
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Anshuman Khandual (7):
  arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
  arm64/sysreg: Add register fields for HDFGRTR2_EL2
  arm64/sysreg: Add register fields for HDFGWTR2_EL2
  arm64/sysreg: Add register fields for HFGITR2_EL2
  arm64/sysreg: Add register fields for HFGRTR2_EL2
  arm64/sysreg: Add register fields for HFGWTR2_EL2
  arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9

 Documentation/arch/arm64/booting.rst |  18 +++++
 arch/arm64/include/asm/el2_setup.h   |  25 +++++++
 arch/arm64/tools/sysreg              | 103 +++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)

-- 
2.25.1



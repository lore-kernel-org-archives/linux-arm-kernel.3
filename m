Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5445C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fTOSR5nWK/3+b9eKcahbH+r08eutGIXXOX0UT8IUdAw=; b=lMEnjhrldOFPNJG9po3/NFoVbH
	w9cj5uwaANootbaCvLKfWvI8SGWjTsCjYvHMCHx/NXbmJK48gV/Q+t2UtHp8TU0arINK/zOBlN6Zm
	pGRciLUYo0ghXlDVkXYTQPzWZ77VuSrRTihvXviz/DbWYl9Z7XovB8nzA8H0vULFvBfxKvX/yBxk2
	zWO+OlDJfhE1RXgRJyMbcrT1HsElcP5mWsi0qzUb4hMa5RpZDp0a67R/cfyj+qCwgKwjNRSD/xXE/
	yGZ4clym0+xHTNOl0vozPFqZflowthPgZrrzYc7ICEa/XJ7XDlk4pwRElynGjLk3Mu8ffARFcYdD+
	pv10U0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlFx-0000000DPGS-1YsC;
	Thu, 23 Jul 2026 04:42:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlFu-0000000DPFx-243l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:42:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7450F1595;
	Wed, 22 Jul 2026 21:41:52 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C47483F86F;
	Wed, 22 Jul 2026 21:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784781716; bh=wtMGDCZcLEGEh1yX4/vwpKbFUb8yUlIMMwg6fQRKGKY=;
	h=From:To:Cc:Subject:Date:From;
	b=MPbj8IMQdkTHie1IuSp8NHn1Dka27XP+6CW514bDxNCVDnM+NAjilNdmscajx0PHG
	 HIS4CpPZVU3wtBKjdPa/pt57UJSGMnPNO0YLhltTXuki8DcOQKUI9slTMZcDWumeuY
	 uv0ab3qzp8aXFXVCElaZLEZr/YzIwQcHI6uFOsEM=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v4 0/6] Add BBML3 cpu feature 
Date: Thu, 23 Jul 2026 10:10:27 +0530
Message-ID: <20260723044034.2983651-1-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214158_670715_42B131CC 
X-CRM114-Status: GOOD (  10.91  )
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

- Patches 1, 2 and 3 adds more cpus to the bbml2_noabort 
  support list. bbml2_noabort would eventually gets renamed
  to bbml3 in a subsequent patch as they are functionally
  equivalent. 
- Patches 4, 5 & 6 introduces BBML3 cpu feature

Changelog from v3:
* In order to cover future C1-Ultra and C1-Premium cpus starting
from r1p1, replaced MIDR_REV_RANGE with MIDR_RANGE in patch 3

* Few minor fixes in comments

* Collected Reviewed-bys.

Changelog from v2:
* Added errata id to Documentation/arch/arm64/silicon-errata.rst
  in patch 3. Added comments in code related to errata as well.

* Fixed register name typo in commit message in patch 4.

* Renamed patch title in patch 5. 

* Commit message reworded in patch 6.

* No functional changes in this version.

Changelog from v1:
* Patches associated with adding cpus to BBML2_NOABORT,
  support list, were kept at bottom in v1 is now moved
  up in this version, for ease of backporting.

* Adding BBM_3 definition in sysreg moved into a separate patch

* MMFR2_ID check for BBM_3 has been changed from == BBM_3 to
  >= BBM_3, so that BBML3 cpu feature gets enabled for BBM_4 as well.

* For feature detection, MMFR2_ID check comes first followed by 
  midr check for code readability

* Errata details for C1-Ultra and C1-Premium added to commit message





Linu Cherian (6):
  arm64: cputype: Add Cortex-A520AE definitions
  arm64: cputype: Add C1-Nano definitions
  arm64: cpufeature: Extend bbml2_noabort support list
  arm64: sysreg: Add BBM_3
  arm64: cpufeature: Rename BBML2_NOABORT as BBML3
  arm64: cpufeature: Detect BBML3 based on ID_AA64MMFR2_EL1.BBM

 Documentation/arch/arm64/silicon-errata.rst |  4 ++
 arch/arm64/include/asm/cpufeature.h         |  6 +--
 arch/arm64/include/asm/cputype.h            |  4 ++
 arch/arm64/kernel/cpufeature.c              | 55 ++++++++++-----------
 arch/arm64/mm/contpte.c                     | 21 +++-----
 arch/arm64/mm/mmu.c                         | 54 ++++++++++----------
 arch/arm64/mm/proc.S                        |  4 +-
 arch/arm64/tools/cpucaps                    |  2 +-
 arch/arm64/tools/sysreg                     |  1 +
 9 files changed, 77 insertions(+), 74 deletions(-)

-- 
2.43.0



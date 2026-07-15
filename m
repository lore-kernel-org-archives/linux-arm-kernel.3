Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4F8C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pGFxVkFBgWQteGegOeYeqnDNCJgseYMngdYe0TnGP2E=; b=crsay5OUJNphZETJsKkOfXud2G
	10PpDQ6NWqmnNtu55YnlSOIYY0K37B43kl5yuF1FfFAZT2dDd0LvDM4DqSE9/rNLYdI0VqTaMYqEz
	+cvq6Z1fNfiHR95u+12KQPK4KEtrPM+cNIeQE0R7D7bONLRuiarveVfiE5MDcMpezyZEm1Mx6jWmm
	qr8on6xNARRYT4QmytRNquCS7pzpUu6rvLjfmRpR2PaxKyjXJeArjyZpuGf183F/4BRicqxgFdw95
	QeeIQH9QqtAfLFAILz5EQhFX0YCk16R5/9EatiX24BOU6RJfPA14dodblR26ub3xiECUfnpLJp4O7
	vP6t+nMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsGT-0000000DoDE-0J54;
	Wed, 15 Jul 2026 05:34:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsGP-0000000DoCR-2Y3m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:34:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FD39339;
	Tue, 14 Jul 2026 22:34:28 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6537E3F915;
	Tue, 14 Jul 2026 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784093672; bh=uwJV+EsB0lwOLAI7SAT6zxl/zg4JX03Zlp6o4bG1BNY=;
	h=From:To:Cc:Subject:Date:From;
	b=lteo+As5uQ6WqmOCAjra1YlPd9gItBMt/iEnjyacnFqCM1RAuC03P+3kX226O9Bte
	 TPdo/AH93nsVUzE3ScJG980b5pXq9q8vOrMcumWgXQwcDf4u/8CcwUTnhJlYvsmZnC
	 m5IP54mflHUUe5pvvBz2DLJXoHrT2CHXuJz/JvA0=
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
Subject: [PATCH v3 0/6] Add BBML3 cpu feature 
Date: Wed, 15 Jul 2026 11:04:02 +0530
Message-ID: <20260715053408.1950475-1-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_223433_769062_106F9597 
X-CRM114-Status: GOOD (  10.26  )
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
 arch/arm64/mm/mmu.c                         | 52 +++++++++----------
 arch/arm64/mm/proc.S                        |  4 +-
 arch/arm64/tools/cpucaps                    |  2 +-
 arch/arm64/tools/sysreg                     |  1 +
 9 files changed, 76 insertions(+), 73 deletions(-)

-- 
2.43.0



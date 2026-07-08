Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703B1C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7yyVToNBncWBiaSgF0uUkZd17kcwMguzJKxwkT8l9ls=; b=y5qJTFOjjDxTvOH4DXf51McJqF
	ApTp24UvfptTaokCpEfbQ2mpXQQA8Xw9bAJf63EbPZa0N4tR8q8UX2Qs9UE6CCoDwM/bxoBRkcQ0r
	FMGxb84XNwif2Oitd3tz3byfcPptJeme4fUsmVwfxsFpaf20N3hTkK61T9MkuNlamO54m+gAdbP9L
	Y/VE0krbsyyofEb143vcdnMQrONqXE1Ib9hz6nVMlcc1CCr1Ql9sV2h4XE5vMW+xcxV9xNTq1tB+z
	yoNuRsHqgHGgj5IeIJoJI9qmooKZjhNAp9u9YMraIxnVwf5NzB1LrUgDmQ++4k4jWjUfxfNDHuGIh
	vId5eNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVO-0000000HNMN-3RCU;
	Wed, 08 Jul 2026 14:44:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVM-0000000HNLi-2MWS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:44:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A24AC1CDD;
	Wed,  8 Jul 2026 07:43:56 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 203113F7B4;
	Wed,  8 Jul 2026 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783521840; bh=PHN32ex2ufL8mW+siWwXKAxwSV8HYJONz7jukXjGBKI=;
	h=From:To:Cc:Subject:Date:From;
	b=KIeiA2ZTN8KfIxqM14f5juJxThtYcmvICWu/A3cggH0s7uZYmqBVrvZWLmwn5Jebj
	 39VxVSrEIUdzMQJ7cfXfJ/yOqWV2Y6njS21WRz3NoCa17BrP56pCkyXgRc/NoaoLX8
	 1HJ4QiQ6Nr1ok+3OwdpgfTVzexqtEVE4g/6mIbYM=
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
Subject: [PATCH v2 0/6] Add BBML3 cpu feature 
Date: Wed,  8 Jul 2026 20:13:25 +0530
Message-ID: <20260708144331.679816-1-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_074404_664239_9D6A7D5C 
X-CRM114-Status: GOOD (  10.69  )
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
  arm64: cpufeature: Add BBML3
  arm64: cpufeature: Detect BBML3 based on MMFR2 ID

 arch/arm64/include/asm/cpufeature.h |  6 ++--
 arch/arm64/include/asm/cputype.h    |  4 +++
 arch/arm64/kernel/cpufeature.c      | 54 ++++++++++++++---------------
 arch/arm64/mm/contpte.c             | 21 +++++------
 arch/arm64/mm/mmu.c                 | 52 +++++++++++++--------------
 arch/arm64/mm/proc.S                |  4 +--
 arch/arm64/tools/cpucaps            |  2 +-
 arch/arm64/tools/sysreg             |  1 +
 8 files changed, 71 insertions(+), 73 deletions(-)

-- 
2.43.0



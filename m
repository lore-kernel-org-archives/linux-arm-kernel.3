Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD819E677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YVgMdYyPuqw2ABUMjWOrkWm89CE0YucUx3DJ5UnWQS0=; b=CA351uQ2cSRYGLce7YwBDfz3R/
	OpZP6vbO+ZXPQ7x+85jlsantxBYBmJ2Pl/GgeABBjwD68A9UBBqKAzUhGo8BLKPmRJ/hpvj30Gv0I
	MjMBCVDkCWWnK5/PNzWLDMc0APl2QQ8LDtfNufQm38nTBAWSWcAx1jHC9lssscSpJXFOpS0tgkcIt
	HvrYOn9CObqkjd7AR5W5JYnA28aB0956HF8rSZnUo3EWXrQhSiu6mgTaNheUYrFfjONh5zIgZLo9+
	U64b8LX+YJrxb0nze9x+A58QAMDCFuo+6iNpCm2r0UMuJFxttHfSjzTwJ5xJcdwUXm96yhK1lMUW+
	fKriHfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7BjM-00000009Wxh-3cLi;
	Sat, 02 Nov 2024 10:51:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bb9-00000009W3p-2orv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 10:43:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XgZ5G6RRXz10PC4;
	Sat,  2 Nov 2024 18:40:50 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id E71E6180AEA;
	Sat,  2 Nov 2024 18:43:05 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 2 Nov 2024 18:43:05 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <oliver.upton@linux.dev>, <ryan.roberts@arm.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangkefeng.wang@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v4 0/5] Support Armv8.9/v9.4 FEAT_HAFT
Date: Sat, 2 Nov 2024 18:42:30 +0800
Message-ID: <20241102104235.62560-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_034316_114865_9A66744E 
X-CRM114-Status: GOOD (  13.07  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

This series adds basic support for FEAT_HAFT introduced in Armv8.9/v9.4
and enable ARCH_HAS_NONLEAF_PMD_YOUNG. The latter will be used in
lru-gen aging. Tested with lru-gen in below steps:
1. Generate a 1GiB workingset by `stress-ng --vm 1`. Then hang the task to
   stop accessing the memory. (AF bit won't be updated)
2. try to age the memory by /sys/kernel/debug/lru_gen

Run above steps with LRU_GEN_NONLEAF_YOUNG(0x4) and not respectively
(switching by /sys/kernel/mm/lru_gen/enabled). LRU_GEN_NONLEAF_YOUNG
will clear and test the PMD AF bit on page walking for aging,
otherwise will clear and test the PTE AF bit for aging. In this case
LRU_GEN_NONLEAF_YOUNG will improve the efficiency of page scanning
since pages won't be accessed and we don't need to scan each PTE.
Observed ~40% time saved for 1GiB memory on our emulated platform
with LRU_GEN_NONLEAF_YOUNG.

For lru-gen aging:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/mm/multigen_lru.rst?h=v6.11-rc1#n94

Change since v3:
Address the comments per Catalin. Add tags for Patch 1/5 and 2/5.
- Make HAFT a ARM64_CPUCAP_SYSTEM_FEATURE feature then:
  o checking the feature will be more efficient
  o avoid race between onlining a non-HAFT CPU when using the HAFT features
- Set table AF for task entries as well
- Set TCR2.HAFT unconditionally
Link: https://lore.kernel.org/linux-arm-kernel/20241022092734.59984-1-yangyicong@huawei.com/

Change since v2:
- Address comments per Will and Catalin:
  o detect and enable the feature in __cpu_setup()
  o allow online the CPU that doesn't have this feature and mismatch with the boot CPU
  o only advertise the feature if it's enabled system widely
  o set AF bit for kernel page table entries to save later hardware update
  o warn unexpected pmdp_test_and_clear_young()
- Update all the new AA64MMFR1_EL1 fields per Mark
Link: https://lore.kernel.org/linux-arm-kernel/20240814092333.7727-1-yangyicong@huawei.com/

Change since v1:
- Address comments from Marc, improve comments/Kconfig, clean code. Thanks for
  the comments.
Link: https://lore.kernel.org/linux-arm-kernel/20240802093458.32683-1-yangyicong@huawei.com/

Yicong Yang (5):
  arm64/sysreg: Update ID_AA64MMFR1_EL1 register
  arm64: setup: name 'tcr2' register
  arm64: Add support for FEAT_HAFT
  arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG
  arm64: pgtable: Warn unexpected pmdp_test_and_clear_young()

 arch/arm64/Kconfig                     | 16 ++++++++++++++++
 arch/arm64/include/asm/cpufeature.h    |  6 ++++++
 arch/arm64/include/asm/pgalloc.h       | 12 +++++++-----
 arch/arm64/include/asm/pgtable-hwdef.h |  4 ++++
 arch/arm64/include/asm/pgtable.h       | 10 ++++++++--
 arch/arm64/kernel/cpufeature.c         | 15 +++++++++++++++
 arch/arm64/mm/fixmap.c                 |  9 ++++++---
 arch/arm64/mm/mmu.c                    |  8 ++++----
 arch/arm64/mm/proc.S                   | 16 ++++++++++++++--
 arch/arm64/tools/cpucaps               |  1 +
 arch/arm64/tools/sysreg                |  4 ++++
 11 files changed, 85 insertions(+), 16 deletions(-)

-- 
2.24.0



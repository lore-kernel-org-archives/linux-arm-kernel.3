Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728ADD49C9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HANEif71gXqrsrhLvwNILu6A06+xOO/p91YBeamN21o=; b=WvINGTQ1TRRSiXSakahhF5Nth7
	HwN/qqhdofzQ0JEz8OSZm09z8Ln8k9j7oSoUwzdffAHxEvq3egQjpa+6uk0KNj2q9q3eMzMnr5Xdg
	ljKUoqfbuW4z96/nnllL+VPzOSKugBzg1rn7NLoKWHlMwfPMizQL+NgfSSGPuIw3mOZ9HO3j3lSvc
	nSMwLC4XysJ5B+Cnq1pbHwKHdzHf5tECtlc4FfYOBaKrkU2sx0jqmhpx4rNkcajD3XCnMv3f3Fdyn
	6pYyUsHjuy9XTIMQFIF0VKJ80NqouEVxTAb5IelljOSUJgmkUMv+71//NsCt2kt9vRJin89HbTc7e
	2zxUOATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllXf-00000001ItS-0zED;
	Fri, 30 Jan 2026 10:15:55 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllXb-00000001Isk-2nm0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769768151; x=1801304151;
  h=date:from:to:cc:subject:message-id;
  bh=+hJDwYcFWKJHbZAG5sl1bKhP8QLhDujsRfC9s+LHDDE=;
  b=gPqaIwcIAoxBdVYbk03G1bZt+gPTReM1xBpqkZw3OB/PVHh0JpumvoFa
   ulaJQDhTOtn2d4tgj7zaEilxHKETcvkCcmOyo0VcMQfQgSUfa5zE4ETr2
   CV95/mKkhm4w3B8s02slpyIcZ5Wkd8Cj5z5pc5yTCEPeyDhOH8RAcRaaH
   v4ZzgRfr5DXbpRd8avevEZ3Eie0NeVeX/zP964i9JkmusMLwjL4acV14y
   VDpDOVdyiN0IO8a+5TXwhUgdznL9oUH6Oo4mICiRxFk3yqU6d0PNX55sp
   ox1eirU3icPPgx+O6rSN8e++2FvcHOZpf4IY/ct9+pFnPjqdPZ9gqTWvx
   A==;
X-CSE-ConnectionGUID: 5TV5rpaFTh66gVZjkWIOZA==
X-CSE-MsgGUID: HeVEmc8AT46bLnly9Tc0bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82129036"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="82129036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 02:15:49 -0800
X-CSE-ConnectionGUID: b0oEeyV1RqupO++cLu7bCw==
X-CSE-MsgGUID: okZXpwGZSPeHQaAiB2VijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208629757"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jan 2026 02:15:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vllXV-00000000cV2-0vMq;
	Fri, 30 Jan 2026 10:15:45 +0000
Date: Fri, 30 Jan 2026 18:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 0a82d3d40716a4d71009fa89e9b218c360228abb
Message-ID: <202601301812.dOZ8VAKB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_021551_784626_D57C7E46 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: 0a82d3d40716a4d71009fa89e9b218c360228abb  Merge tag 'ti-k3-dt-for-v6.20' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/dt

elapsed time: 1403m

configs tested: 265
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260130    clang-17
arc                   randconfig-001-20260130    gcc-13.4.0
arc                   randconfig-002-20260130    clang-17
arc                   randconfig-002-20260130    gcc-15.2.0
arc                        vdk_hs38_defconfig    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    clang-22
arm                          collie_defconfig    clang-22
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-22
arm                          moxart_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                   randconfig-001-20260130    clang-17
arm                   randconfig-001-20260130    clang-22
arm                   randconfig-002-20260130    clang-17
arm                   randconfig-003-20260130    clang-17
arm                   randconfig-003-20260130    clang-22
arm                   randconfig-004-20260130    clang-17
arm                   randconfig-004-20260130    clang-22
arm                           stm32_defconfig    clang-22
arm                           sunxi_defconfig    clang-22
arm                           u8500_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260130    gcc-8.5.0
arm64                 randconfig-002-20260130    gcc-8.5.0
arm64                 randconfig-003-20260130    gcc-8.5.0
arm64                 randconfig-004-20260130    clang-22
arm64                 randconfig-004-20260130    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260130    gcc-15.2.0
csky                  randconfig-001-20260130    gcc-8.5.0
csky                  randconfig-002-20260130    gcc-15.2.0
csky                  randconfig-002-20260130    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260130    clang-19
hexagon               randconfig-001-20260130    gcc-11.5.0
hexagon               randconfig-002-20260130    clang-18
hexagon               randconfig-002-20260130    gcc-11.5.0
i386                             alldefconfig    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260130    clang-20
i386        buildonly-randconfig-002-20260130    clang-20
i386        buildonly-randconfig-003-20260130    clang-20
i386        buildonly-randconfig-004-20260130    clang-20
i386        buildonly-randconfig-004-20260130    gcc-14
i386        buildonly-randconfig-005-20260130    clang-20
i386        buildonly-randconfig-006-20260130    clang-20
i386        buildonly-randconfig-006-20260130    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260130    clang-20
i386                  randconfig-001-20260130    gcc-14
i386                  randconfig-002-20260130    clang-20
i386                  randconfig-002-20260130    gcc-14
i386                  randconfig-003-20260130    clang-20
i386                  randconfig-003-20260130    gcc-14
i386                  randconfig-004-20260130    clang-20
i386                  randconfig-004-20260130    gcc-14
i386                  randconfig-005-20260130    gcc-14
i386                  randconfig-006-20260130    clang-20
i386                  randconfig-006-20260130    gcc-14
i386                  randconfig-007-20260130    gcc-14
i386                  randconfig-011-20260130    clang-20
i386                  randconfig-012-20260130    clang-20
i386                  randconfig-013-20260130    clang-20
i386                  randconfig-014-20260130    clang-20
i386                  randconfig-015-20260130    clang-20
i386                  randconfig-016-20260130    clang-20
i386                  randconfig-017-20260130    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260130    clang-22
loongarch             randconfig-001-20260130    gcc-11.5.0
loongarch             randconfig-002-20260130    clang-18
loongarch             randconfig-002-20260130    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5407c3_defconfig    clang-22
m68k                           virt_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-22
mips                        omega2p_defconfig    clang-22
nios2                         3c120_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260130    gcc-11.5.0
nios2                 randconfig-001-20260130    gcc-8.5.0
nios2                 randconfig-002-20260130    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260130    gcc-14.3.0
parisc                randconfig-001-20260130    gcc-8.5.0
parisc                randconfig-002-20260130    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     ksi8560_defconfig    clang-22
powerpc                       ppc64_defconfig    clang-22
powerpc               randconfig-001-20260130    gcc-14.3.0
powerpc               randconfig-001-20260130    gcc-8.5.0
powerpc               randconfig-002-20260130    gcc-10.5.0
powerpc               randconfig-002-20260130    gcc-8.5.0
powerpc                     tqm8541_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20260130    clang-22
powerpc64             randconfig-001-20260130    gcc-8.5.0
powerpc64             randconfig-002-20260130    clang-22
powerpc64             randconfig-002-20260130    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260130    clang-22
riscv                 randconfig-001-20260130    gcc-14.3.0
riscv                 randconfig-002-20260130    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260130    clang-22
s390                  randconfig-002-20260130    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260130    clang-22
sh                    randconfig-001-20260130    gcc-9.5.0
sh                    randconfig-002-20260130    clang-22
sh                    randconfig-002-20260130    gcc-13.4.0
sh                          rsk7269_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260130    clang-22
sparc                 randconfig-001-20260130    gcc-8.5.0
sparc                 randconfig-002-20260130    clang-22
sparc                 randconfig-002-20260130    gcc-8.5.0
sparc                       sparc32_defconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260130    clang-22
sparc64               randconfig-002-20260130    clang-22
sparc64               randconfig-002-20260130    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260130    clang-22
um                    randconfig-002-20260130    clang-22
um                    randconfig-002-20260130    gcc-13
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260130    clang-20
x86_64      buildonly-randconfig-002-20260130    clang-20
x86_64      buildonly-randconfig-002-20260130    gcc-14
x86_64      buildonly-randconfig-003-20260130    clang-20
x86_64      buildonly-randconfig-004-20260130    clang-20
x86_64      buildonly-randconfig-005-20260130    clang-20
x86_64      buildonly-randconfig-006-20260130    clang-20
x86_64      buildonly-randconfig-006-20260130    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260130    clang-20
x86_64                randconfig-002-20260130    clang-20
x86_64                randconfig-002-20260130    gcc-14
x86_64                randconfig-003-20260130    clang-20
x86_64                randconfig-003-20260130    gcc-14
x86_64                randconfig-004-20260130    clang-20
x86_64                randconfig-004-20260130    gcc-14
x86_64                randconfig-005-20260130    clang-20
x86_64                randconfig-005-20260130    gcc-14
x86_64                randconfig-006-20260130    clang-20
x86_64                randconfig-011-20260130    clang-20
x86_64                randconfig-012-20260130    clang-20
x86_64                randconfig-013-20260130    clang-20
x86_64                randconfig-014-20260130    clang-20
x86_64                randconfig-014-20260130    gcc-14
x86_64                randconfig-015-20260130    clang-20
x86_64                randconfig-016-20260130    clang-20
x86_64                randconfig-016-20260130    gcc-14
x86_64                randconfig-071-20260130    clang-20
x86_64                randconfig-072-20260130    clang-20
x86_64                randconfig-073-20260130    clang-20
x86_64                randconfig-074-20260130    clang-20
x86_64                randconfig-075-20260130    clang-20
x86_64                randconfig-076-20260130    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260130    clang-22
xtensa                randconfig-001-20260130    gcc-12.5.0
xtensa                randconfig-002-20260130    clang-22
xtensa                randconfig-002-20260130    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


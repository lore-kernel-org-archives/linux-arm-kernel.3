Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4615FC72AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 04:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvEKT7WF60GCMGYH7zU9LOr1+DQFTYLW6cyipp80FRM=; b=TkN94V4MwMSDAkaspv1vsrtHG1
	lJV6NyZSIY0zsoNfN2kQ9u2QBVqNPY4U8HeAUCUlbkcQtQYd9vSSb9NUIdJrwUGPw2WTpKluQiPnN
	R+U+qeTMsK281nKQyYL8c+hbCcdhlH93QLZMV4w4g6v72zHmNcR3gYyIX2zBb4J34jnZ31qSyteNK
	dCseswYRhQlpeWxMbtYD/LY2ut8ltd5CWq95oJJKID1yXE7PV2F59poj/mqYzDR732YTEh+tdhudW
	8hlAX1XdCejEJRNPqNd6pdhhkAMYPCP6/8izjRYKAsq4AxjvOMU9XBCIkPzhyxeQXU/DCNS+f0PNw
	dLmmciIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4AcF-0000000F4GV-0Rl0;
	Sun, 22 Mar 2026 04:40:43 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4AcB-0000000F4Fm-3HvV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 04:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774154440; x=1805690440;
  h=date:from:to:cc:subject:message-id;
  bh=mdRdXZaU1FIvJuk/VtNrbw7z2tPNLjdkoEa6xnENnr0=;
  b=hZeHtPpcVE6G5t75fgTlq6GqCtdPnd8gpfZhTHX9EeQujIkRM5O10W3A
   6EWuqJ9q6ELHwlJ3xiLn6R8YdvAoe2w5NjgPPjJj+r+fj3t253MsWKftz
   i+S/Zve9lSP28f3rBdUaInB4jsVirXI2s9ZStvNgO8vsz/SqVetc3B+HD
   7peYjFr6nJMpVlhfDlBh7UqmMux1IgmqmNdYaVCWqC2rZwjJUN6Wu49Kc
   4ua8inz74yFqDiOPKBD5x6vJhUkYfOAion2z1aOSb9IM14E262IT4OdjM
   AK6voTQoHVda9iWpighLrWTGLshPXQInuf1sxrDWHuqrhbX9jPLfegeZU
   g==;
X-CSE-ConnectionGUID: /OOvf4EeReSzTmmidWJ5zQ==
X-CSE-MsgGUID: ++oGPvl6Ttyy7Ix8k56//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="86559851"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="86559851"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 21:40:38 -0700
X-CSE-ConnectionGUID: EpQVEs3NR3KFG+2ZzpTOjw==
X-CSE-MsgGUID: yMjhgxzxRoqfM5uokIJTAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="222764013"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Mar 2026 21:40:36 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Abu-000000001hB-3Zkm;
	Sun, 22 Mar 2026 04:40:27 +0000
Date: Sun, 22 Mar 2026 12:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 5088998cad9cc9a4170513aeba55dfbb38bb4996
Message-ID: <202603221231.0sgPVaue-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_214040_104859_83E43732 
X-CRM114-Status: UNSURE (   4.95  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: 5088998cad9cc9a4170513aeba55dfbb38bb4996  soc: document merges

elapsed time: 796m

configs tested: 175
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260322    gcc-14.3.0
arc                   randconfig-002-20260322    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260322    gcc-14.3.0
arm                   randconfig-002-20260322    gcc-14.3.0
arm                   randconfig-003-20260322    gcc-14.3.0
arm                   randconfig-004-20260322    gcc-14.3.0
arm                         s3c6400_defconfig    gcc-15.2.0
arm                           sama5_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260322    gcc-11.5.0
arm64                 randconfig-002-20260322    gcc-11.5.0
arm64                 randconfig-003-20260322    gcc-11.5.0
arm64                 randconfig-004-20260322    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260322    gcc-11.5.0
csky                  randconfig-002-20260322    gcc-11.5.0
hexagon                          alldefconfig    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260322    gcc-11.5.0
hexagon               randconfig-002-20260322    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260322    clang-20
i386        buildonly-randconfig-002-20260322    clang-20
i386        buildonly-randconfig-003-20260322    clang-20
i386        buildonly-randconfig-004-20260322    clang-20
i386        buildonly-randconfig-005-20260322    clang-20
i386        buildonly-randconfig-006-20260322    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260322    gcc-14
i386                  randconfig-002-20260322    gcc-14
i386                  randconfig-003-20260322    gcc-14
i386                  randconfig-004-20260322    gcc-14
i386                  randconfig-005-20260322    gcc-14
i386                  randconfig-006-20260322    gcc-14
i386                  randconfig-007-20260322    gcc-14
i386                  randconfig-011-20260322    gcc-13
i386                  randconfig-012-20260322    gcc-13
i386                  randconfig-013-20260322    gcc-13
i386                  randconfig-014-20260322    gcc-13
i386                  randconfig-015-20260322    gcc-13
i386                  randconfig-016-20260322    gcc-13
i386                  randconfig-017-20260322    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson32_defconfig    clang-23
loongarch             randconfig-001-20260322    gcc-11.5.0
loongarch             randconfig-002-20260322    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260322    gcc-11.5.0
nios2                 randconfig-002-20260322    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260322    clang-23
parisc                randconfig-002-20260322    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260322    clang-23
powerpc               randconfig-002-20260322    clang-23
powerpc64             randconfig-001-20260322    clang-23
powerpc64             randconfig-002-20260322    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260322    gcc-12.5.0
riscv                 randconfig-002-20260322    gcc-12.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260322    gcc-12.5.0
s390                  randconfig-002-20260322    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260322    gcc-12.5.0
sh                    randconfig-002-20260322    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260322    gcc-14
sparc                 randconfig-002-20260322    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260322    gcc-14
sparc64               randconfig-002-20260322    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260322    gcc-14
um                    randconfig-002-20260322    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260322    clang-20
x86_64      buildonly-randconfig-002-20260322    clang-20
x86_64      buildonly-randconfig-003-20260322    clang-20
x86_64      buildonly-randconfig-004-20260322    clang-20
x86_64      buildonly-randconfig-005-20260322    clang-20
x86_64      buildonly-randconfig-006-20260322    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260322    clang-20
x86_64                randconfig-002-20260322    clang-20
x86_64                randconfig-003-20260322    clang-20
x86_64                randconfig-004-20260322    clang-20
x86_64                randconfig-005-20260322    clang-20
x86_64                randconfig-006-20260322    clang-20
x86_64                randconfig-011-20260322    gcc-14
x86_64                randconfig-012-20260322    gcc-14
x86_64                randconfig-013-20260322    gcc-14
x86_64                randconfig-014-20260322    gcc-14
x86_64                randconfig-015-20260322    gcc-14
x86_64                randconfig-016-20260322    gcc-14
x86_64                randconfig-071-20260322    gcc-14
x86_64                randconfig-072-20260322    gcc-14
x86_64                randconfig-073-20260322    gcc-14
x86_64                randconfig-074-20260322    gcc-14
x86_64                randconfig-075-20260322    gcc-14
x86_64                randconfig-076-20260322    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260322    gcc-14
xtensa                randconfig-002-20260322    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


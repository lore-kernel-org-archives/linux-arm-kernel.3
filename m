Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CA6FA0C43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yQ4oWem9zL5OcdNpzK1ad5CzdOyWIbzRpVNGZi451ZM=; b=dVI/NACYM7FvwbaSDWOdGYa8BC
	RKamPJBGDoGdw6wfGjBudYSepmE/ZB+WmYltfLqAySrN8f65TwrSR9k1vyrD5jyBV2PKxOTczqq8T
	0zhfA7EgfbBUntmqixR5HDCAmhwXQKxIPhcCgcSg4geXF5YGfZfO4PWZYmVpqKcCSY3CunyCvz1FT
	6Bdbj8t76e2XT2Axyr9Xrd1UXoU9yi5izUH9MBWjnD15OWv2cthZX1yZbG/m/uTmZ+a3m5StuQVq3
	hLsbu1xMW8A5O4PnxTfDgzvl+iEJ//MYEEoD6v4qPwXovsPXaKUXX9UyZkGeexDas3BaZa2Nw1wmO
	sd8aTEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvIo-00000000m6L-0f1V;
	Wed, 15 Apr 2026 08:08:50 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvIl-00000000m5u-1qwz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776240527; x=1807776527;
  h=date:from:to:cc:subject:message-id;
  bh=x3Hy+t4VmXJCRS8gpB6vVUB1eu/US9phD69OFGYwA/o=;
  b=PyQK7rydr+6eOSi5Q8xU6DkvQMHAcJClQVv8UBcBqFQWhj4U+fl0hG29
   sbLYvyWEyQeznOV7mMvUstjxIBmDZyrfxU6l7m8P8u22eMgSJiuaRaBEK
   jSleURV9S9k3T72CGw4dlT+gYr08Ycirg+RNC4rr8Cw3XT2ALblaXWSgi
   fAG9zDAWfIH7PIsA9EjCHJoJKGzgJkO9QZYib3qfOimbTRcL58QCJmfQ7
   iUqVi+3vvpsYtJhz6/4AxcBZAYBdFSDVg9dwkPOhYaVDTF21vkk2vLUZR
   Avz8t4NzqC0uR3CRhKdbssOJpzZChTbdwY4cQPKTAKWp8V4fVmDWG0ER0
   w==;
X-CSE-ConnectionGUID: V+CEZee4SPmZ1XCw5MnqEw==
X-CSE-MsgGUID: igSxlgV5RVmz+3VRTX5RcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77116377"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77116377"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 01:08:47 -0700
X-CSE-ConnectionGUID: u/MZ1w0XQca8U78e12+q0Q==
X-CSE-MsgGUID: ArJ9YazIT6iyTPVRbZ4Dqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253760262"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2026 01:08:45 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCvIg-000000000HF-2kBE;
	Wed, 15 Apr 2026 08:08:42 +0000
Date: Wed, 15 Apr 2026 16:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:ti/dt-2] BUILD SUCCESS
 abe76f9f47d59ff80eb2fc59482aa76bbf6fd13a
Message-ID: <202604151617.PimDf1FC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_010847_538022_5C62D206 
X-CRM114-Status: UNSURE (   4.79  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git ti/dt-2
branch HEAD: abe76f9f47d59ff80eb2fc59482aa76bbf6fd13a  arm64: dts: ti: k3: Use memory-region-names for r5f

elapsed time: 765m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260415    gcc-13.4.0
arc                   randconfig-002-20260415    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                     davinci_all_defconfig    clang-19
arm                   randconfig-001-20260415    clang-23
arm                   randconfig-002-20260415    clang-23
arm                   randconfig-003-20260415    gcc-8.5.0
arm                   randconfig-004-20260415    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260415    gcc-15.2.0
arm64                 randconfig-002-20260415    gcc-14.3.0
arm64                 randconfig-003-20260415    gcc-13.4.0
arm64                 randconfig-004-20260415    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260415    gcc-9.5.0
csky                  randconfig-002-20260415    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon               randconfig-001-20260415    clang-23
hexagon               randconfig-002-20260415    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260415    clang-20
i386        buildonly-randconfig-002-20260415    gcc-14
i386        buildonly-randconfig-003-20260415    clang-20
i386        buildonly-randconfig-004-20260415    gcc-14
i386        buildonly-randconfig-005-20260415    gcc-14
i386        buildonly-randconfig-006-20260415    clang-20
i386                  randconfig-011-20260415    gcc-14
i386                  randconfig-012-20260415    clang-20
i386                  randconfig-013-20260415    gcc-14
i386                  randconfig-014-20260415    gcc-14
i386                  randconfig-015-20260415    clang-20
i386                  randconfig-016-20260415    gcc-14
i386                  randconfig-017-20260415    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260415    clang-18
loongarch             randconfig-002-20260415    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260415    gcc-10.5.0
nios2                 randconfig-002-20260415    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260415    gcc-8.5.0
parisc                randconfig-002-20260415    gcc-9.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260415    clang-20
powerpc               randconfig-002-20260415    clang-20
powerpc64             randconfig-001-20260415    clang-23
powerpc64             randconfig-002-20260415    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260415    gcc-9.5.0
riscv                 randconfig-002-20260415    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260415    gcc-15.2.0
s390                  randconfig-002-20260415    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260415    gcc-13.4.0
sh                    randconfig-002-20260415    gcc-11.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260415    gcc-8.5.0
sparc                 randconfig-002-20260415    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260415    clang-23
sparc64               randconfig-002-20260415    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260415    clang-23
um                    randconfig-002-20260415    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260415    clang-20
x86_64      buildonly-randconfig-002-20260415    gcc-13
x86_64      buildonly-randconfig-003-20260415    gcc-14
x86_64      buildonly-randconfig-004-20260415    clang-20
x86_64      buildonly-randconfig-005-20260415    clang-20
x86_64      buildonly-randconfig-006-20260415    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20260415    clang-20
x86_64                randconfig-072-20260415    clang-20
x86_64                randconfig-073-20260415    gcc-13
x86_64                randconfig-074-20260415    clang-20
x86_64                randconfig-075-20260415    clang-20
x86_64                randconfig-076-20260415    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260415    gcc-8.5.0
xtensa                randconfig-002-20260415    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D193D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tarxce2czO36dSQczRyFT1ZuZIL6u/nV46zbuqDgD08=; b=geYmCuHqbqCntgCaYCv6m67Jyq
	qog9fSWf+xk3f//oY+Juk0yVquQnnpOoMZT5Grn9eDzBFufLrFwnGrLnGD9bL3QADAVZOTFqbj4b5
	/eyQNmbjYznugbeo3o/jTyeiE+zbZvCf5BLpeNx8ZiUjQseeIa1CpslDTl8mCVBsmXRQXtKsnU3h7
	ZFlMMywgklh3ZL0S+4DmIE+8TKUi6YdM6P+e2W6wHUeb0O0ONuCEFljIODGo8j178j89wDOqvpIWp
	mjJYEDPIyLDjWv/+UlRo2/DrTd+x1NMrAomR+B631sKj8bjcmzlBOMgcBrXqHq5GEXmDlioIV5fab
	eKlW1KSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7rT-0000000133j-3Uk7;
	Fri, 28 Nov 2025 23:26:47 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7rQ-0000000133N-2gLb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 23:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764372405; x=1795908405;
  h=date:from:to:cc:subject:message-id;
  bh=7CXyyMQ3qGcFRoyNK8zwITFOymM3/wFowNk66OiKuos=;
  b=fuxR7V+G2s0tNsovcm3Pyovz0r+tlbn7y5zHXAVxlKOnjwK54zHJT91M
   hQaAu9va8xCXVQavQ71ehtykGkBxDHPiT4fJ6CfM7C6wgmWt0TAr+VSUk
   L8udoC+kNCQbwmDEyE39bhiL3gmxzN31aS8ER/eBLPlYE9U3kKsvFONbR
   /TAHiA4sfNJUrzLJZ4/nIpZJyWukc7dPHYhD3bFf+UrWl1w+sGgdNpExR
   sR5RV3y6A1l9M/ZfE4L/kUEo8iv+CjnCbqZ5hiPszILNsMqz0T9Bn0tMI
   iivDko8sTZvWEsU2oh3egbf/Bi21f4gS8FG2FsvaCi2iYiKX9wsPAuyb9
   w==;
X-CSE-ConnectionGUID: yCd8cCOfQ1GNOpCQ2mHXcQ==
X-CSE-MsgGUID: +a+4h3KVTBuWJzb1wGMuKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66296290"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66296290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 15:26:43 -0800
X-CSE-ConnectionGUID: EuGpm6XJT+mVaVJGR3iQWg==
X-CSE-MsgGUID: prQ7Q12uQ9G2okHcs5EtDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="197740733"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Nov 2025 15:26:41 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP7rK-000000006of-1Vt0;
	Fri, 28 Nov 2025 23:26:38 +0000
Date: Sat, 29 Nov 2025 07:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 e5b2299997d3760840111ff2e6c5df9f2224f253
Message-ID: <202511290740.WdzYrClN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_152644_690504_1AAC7F9E 
X-CRM114-Status: UNSURE (   5.54  )
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
branch HEAD: e5b2299997d3760840111ff2e6c5df9f2224f253  soc: document merges

elapsed time: 1461m

configs tested: 158
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251128    gcc-8.5.0
arc                   randconfig-002-20251128    gcc-15.1.0
arc                   randconfig-002-20251128    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251128    gcc-14.3.0
arm                   randconfig-001-20251128    gcc-8.5.0
arm                   randconfig-002-20251128    gcc-8.5.0
arm                   randconfig-003-20251128    clang-22
arm                   randconfig-003-20251128    gcc-8.5.0
arm                   randconfig-004-20251128    clang-17
arm                   randconfig-004-20251128    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251128    gcc-15.1.0
arm64                 randconfig-002-20251128    gcc-15.1.0
arm64                 randconfig-003-20251128    gcc-15.1.0
arm64                 randconfig-004-20251128    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251128    gcc-15.1.0
csky                  randconfig-002-20251128    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251128    clang-22
hexagon               randconfig-002-20251128    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20251128    gcc-13
i386        buildonly-randconfig-002-20251128    gcc-13
i386        buildonly-randconfig-003-20251128    gcc-13
i386        buildonly-randconfig-004-20251128    gcc-13
i386        buildonly-randconfig-005-20251128    gcc-13
i386        buildonly-randconfig-006-20251128    gcc-13
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251128    gcc-14
i386                  randconfig-002-20251128    gcc-14
i386                  randconfig-003-20251128    gcc-14
i386                  randconfig-004-20251128    gcc-14
i386                  randconfig-005-20251128    gcc-14
i386                  randconfig-006-20251128    gcc-14
i386                  randconfig-007-20251128    gcc-14
i386                  randconfig-011-20251128    gcc-14
i386                  randconfig-012-20251128    gcc-14
i386                  randconfig-013-20251128    gcc-14
i386                  randconfig-014-20251128    gcc-14
i386                  randconfig-015-20251128    gcc-14
i386                  randconfig-016-20251128    gcc-14
i386                  randconfig-017-20251128    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251128    clang-22
loongarch             randconfig-002-20251128    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    gcc-15.1.0
mips                        omega2p_defconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251128    clang-22
nios2                 randconfig-002-20251128    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251128    clang-22
parisc                randconfig-002-20251128    clang-22
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251128    clang-22
powerpc               randconfig-002-20251128    clang-22
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251128    clang-22
powerpc64             randconfig-002-20251128    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251128    gcc-15.1.0
riscv                 randconfig-002-20251128    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251128    gcc-15.1.0
s390                  randconfig-002-20251128    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251128    gcc-15.1.0
sh                    randconfig-002-20251128    gcc-15.1.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251128    clang-22
sparc                 randconfig-002-20251128    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251128    clang-22
sparc64               randconfig-002-20251128    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251128    clang-22
um                    randconfig-002-20251128    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20251128    clang-20
x86_64      buildonly-randconfig-002-20251128    clang-20
x86_64      buildonly-randconfig-003-20251128    clang-20
x86_64      buildonly-randconfig-004-20251128    clang-20
x86_64      buildonly-randconfig-005-20251128    clang-20
x86_64      buildonly-randconfig-006-20251128    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251128    gcc-14
x86_64                randconfig-002-20251128    gcc-14
x86_64                randconfig-003-20251128    gcc-14
x86_64                randconfig-004-20251128    gcc-14
x86_64                randconfig-005-20251128    gcc-14
x86_64                randconfig-006-20251128    gcc-14
x86_64                randconfig-011-20251128    gcc-13
x86_64                randconfig-012-20251128    gcc-13
x86_64                randconfig-013-20251128    gcc-13
x86_64                randconfig-014-20251128    gcc-13
x86_64                randconfig-015-20251128    gcc-13
x86_64                randconfig-016-20251128    gcc-13
x86_64                randconfig-071-20251128    gcc-14
x86_64                randconfig-072-20251128    gcc-14
x86_64                randconfig-073-20251128    gcc-14
x86_64                randconfig-074-20251128    gcc-14
x86_64                randconfig-075-20251128    gcc-14
x86_64                randconfig-076-20251128    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251128    clang-22
xtensa                randconfig-002-20251128    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


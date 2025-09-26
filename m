Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876C6CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2FFBG3EvI8SoBwggxBVvkNBz4/F0fAIKsl+jy1vg+uI=; b=xvG4RABsmqlnsPaJoxA7KRlGpB
	IV7ZeV+9CkuaLGDjpXLbWLiNEGIdQelqqtslEs96NA2U1VPO/aDQlpux1Q7IaIRhIQsnBt97Mg8G6
	tPkaGX233BLBwc7QJ1Z/lgQaT58FPoS3Wx4RYdZonccJwOaeib/1/JAZswxYSf3uxWwLJXpH7Fuiu
	ji0lffNxbc9PtHXfzUBbka3sDQXTI1hzMumizgKJ7qVqiKpSiJ0MFRCl+TgC/iXHVSwgDC1VApMHy
	f8MNFlnH/X/PK742CZIYcBy2oWL33Da8UnftmCeXl/J6wBxLieSVasBnfd2EgFKmKiUedBAmjn/M8
	3WXjASCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2A2U-00000002HqP-0yj1;
	Fri, 26 Sep 2025 15:07:14 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2A2P-00000002Hm2-3YAu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 15:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758899229; x=1790435229;
  h=date:from:to:cc:subject:message-id;
  bh=Wfir4M8BzaQL76EJr/KIHrgFzH7gSxkdaRo+Rd6NOW4=;
  b=apMDG6c4KtCwpOGrpRIOmeComyHaWvGKQVj2RwFl6hEZK5SK2Yr87OWb
   NmYZfDNVzc59FbS0xDDrBnv5OIHEfDiK7iT4MTDUlXmryHgZqx+jX/jR4
   f8MDOwd0iziRX4m0Kt3MJMNkF38p9A/ghw70omDsqbbLvY33dO6Ds7Ysk
   518xDonSREpJjg/cZ6bqAdho/1YztwgyTzNOCYsHWukGB0DTU5vuzjxcO
   G5jdxLZ+lUcWF5QkH/Skh7sC/ennlnohofMYF6a/CfdduZQgVN4zir4WH
   sANOFfhSH7buBXQCvvsbW/YyhB+NCZMt/xaCSabL4dC60eBEkUWbkoKlf
   g==;
X-CSE-ConnectionGUID: TQKqYynYRse9PvqhnkjHpA==
X-CSE-MsgGUID: B1JaS6FmTlSlKu7vjSvhjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72666841"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="72666841"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 08:07:09 -0700
X-CSE-ConnectionGUID: Nf0gEHyIS7eNrxZvGqzTPg==
X-CSE-MsgGUID: b3EqiXTVSO6RP4lWKQ+gMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="178020862"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2025 08:07:07 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2A2L-0006LI-17;
	Fri, 26 Sep 2025 15:07:05 +0000
Date: Fri, 26 Sep 2025 23:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/newsoc] BUILD SUCCESS
 fee2f45def0379ed140de4db8f998edb1d78e619
Message-ID: <202509262338.ASiBfuLH-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_080709_951153_1BFA1B11 
X-CRM114-Status: UNSURE (   5.64  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/newsoc
branch HEAD: fee2f45def0379ed140de4db8f998edb1d78e619  riscv: dts: eswin: add HiFive Premier P550 board device tree

elapsed time: 1450m

configs tested: 229
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250926    gcc-8.5.0
arc                   randconfig-002-20250926    gcc-8.5.0
arc                   randconfig-002-20250926    gcc-9.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                         axm55xx_defconfig    gcc-15.1.0
arm                         bcm2835_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250926    clang-22
arm                   randconfig-001-20250926    gcc-8.5.0
arm                   randconfig-002-20250926    clang-17
arm                   randconfig-002-20250926    gcc-8.5.0
arm                   randconfig-003-20250926    clang-22
arm                   randconfig-003-20250926    gcc-8.5.0
arm                   randconfig-004-20250926    clang-22
arm                   randconfig-004-20250926    gcc-8.5.0
arm                        realview_defconfig    gcc-15.1.0
arm                           stm32_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250926    gcc-8.5.0
arm64                 randconfig-002-20250926    gcc-12.5.0
arm64                 randconfig-002-20250926    gcc-8.5.0
arm64                 randconfig-003-20250926    gcc-8.5.0
arm64                 randconfig-003-20250926    gcc-9.5.0
arm64                 randconfig-004-20250926    clang-22
arm64                 randconfig-004-20250926    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250926    clang-22
csky                  randconfig-001-20250926    gcc-15.1.0
csky                  randconfig-002-20250926    clang-22
csky                  randconfig-002-20250926    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250926    clang-22
hexagon               randconfig-002-20250926    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-006-20250926    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250926    clang-20
i386                  randconfig-002-20250926    clang-20
i386                  randconfig-003-20250926    clang-20
i386                  randconfig-004-20250926    clang-20
i386                  randconfig-005-20250926    clang-20
i386                  randconfig-006-20250926    clang-20
i386                  randconfig-007-20250926    clang-20
i386                  randconfig-011-20250926    gcc-12
i386                  randconfig-012-20250926    gcc-12
i386                  randconfig-013-20250926    gcc-12
i386                  randconfig-014-20250926    gcc-12
i386                  randconfig-015-20250926    gcc-12
i386                  randconfig-016-20250926    gcc-12
i386                  randconfig-017-20250926    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250926    clang-22
loongarch             randconfig-001-20250926    gcc-15.1.0
loongarch             randconfig-002-20250926    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip28_defconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250926    clang-22
nios2                 randconfig-001-20250926    gcc-11.5.0
nios2                 randconfig-002-20250926    clang-22
nios2                 randconfig-002-20250926    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250926    clang-22
parisc                randconfig-001-20250926    gcc-10.5.0
parisc                randconfig-002-20250926    clang-22
parisc                randconfig-002-20250926    gcc-10.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      pasemi_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250926    clang-22
powerpc               randconfig-002-20250926    clang-18
powerpc               randconfig-002-20250926    clang-22
powerpc               randconfig-003-20250926    clang-22
powerpc                     skiroot_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250926    clang-22
powerpc64             randconfig-002-20250926    clang-16
powerpc64             randconfig-002-20250926    clang-22
powerpc64             randconfig-003-20250926    clang-22
powerpc64             randconfig-003-20250926    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20250926    clang-22
riscv                 randconfig-001-20250926    gcc-15.1.0
riscv                 randconfig-002-20250926    clang-22
riscv                 randconfig-002-20250926    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250926    clang-22
s390                  randconfig-001-20250926    gcc-15.1.0
s390                  randconfig-002-20250926    gcc-15.1.0
s390                  randconfig-002-20250926    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20250926    gcc-12.5.0
sh                    randconfig-001-20250926    gcc-15.1.0
sh                    randconfig-002-20250926    gcc-15.1.0
sh                          rsk7201_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250926    gcc-14.3.0
sparc                 randconfig-001-20250926    gcc-15.1.0
sparc                 randconfig-002-20250926    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250926    gcc-12.5.0
sparc64               randconfig-001-20250926    gcc-15.1.0
sparc64               randconfig-002-20250926    clang-22
sparc64               randconfig-002-20250926    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250926    clang-22
um                    randconfig-001-20250926    gcc-15.1.0
um                    randconfig-002-20250926    clang-22
um                    randconfig-002-20250926    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250926    clang-20
x86_64      buildonly-randconfig-001-20250926    gcc-14
x86_64      buildonly-randconfig-002-20250926    clang-20
x86_64      buildonly-randconfig-002-20250926    gcc-14
x86_64      buildonly-randconfig-003-20250926    gcc-14
x86_64      buildonly-randconfig-004-20250926    gcc-14
x86_64      buildonly-randconfig-005-20250926    gcc-14
x86_64      buildonly-randconfig-006-20250926    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250926    gcc-14
x86_64                randconfig-002-20250926    gcc-14
x86_64                randconfig-003-20250926    gcc-14
x86_64                randconfig-004-20250926    gcc-14
x86_64                randconfig-005-20250926    gcc-14
x86_64                randconfig-006-20250926    gcc-14
x86_64                randconfig-007-20250926    gcc-14
x86_64                randconfig-008-20250926    gcc-14
x86_64                randconfig-071-20250926    gcc-14
x86_64                randconfig-072-20250926    gcc-14
x86_64                randconfig-073-20250926    gcc-14
x86_64                randconfig-074-20250926    gcc-14
x86_64                randconfig-075-20250926    gcc-14
x86_64                randconfig-076-20250926    gcc-14
x86_64                randconfig-077-20250926    gcc-14
x86_64                randconfig-078-20250926    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250926    gcc-14.3.0
xtensa                randconfig-001-20250926    gcc-15.1.0
xtensa                randconfig-002-20250926    gcc-15.1.0
xtensa                randconfig-002-20250926    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A19C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4MQh60A3xy1UrxdJfttPTKe+lB4rviRay+etgOMece0=; b=rSG0/hTDXTk7G5RYymN5nA8/Yw
	1AuYFwmEirH3GaEI1zud7vvN9538iPDWppaXVMes2wCVcGosUKNxYwOiutkNt8jl7w4UrlZnQ7VJG
	ufSOU+2c0CDjPm5+SfIULfBKPzt//fpEANF5IzX85AwSuzprsEDTxHfWdYBJuiAumc6o5ndG6OFFs
	ib964YmY0Uixqbf7Pj0z9kFiDCpv//9rCElFxTtW3mD5RhkLSpahiumJmAKFdL6TZtZQdw3S8NR2b
	sDm4Yrv08feICnrlN7veSGtuwycg7S1uA97K6iRrsVEFwPWPwDkI94bgzww9jz7Zebp1ml9F1DCoP
	NtJE+RzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOVk-0000000DOTp-3NYw;
	Thu, 20 Mar 2025 22:37:12 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOSO-0000000DO2l-2s0Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742510025; x=1774046025;
  h=date:from:to:cc:subject:message-id;
  bh=xIlQzOCYgHuPCeD61rfJvmkrmye1nSsqN3tmnw2+L+0=;
  b=D8XL7/BzLNNkeVebqxDK1bqFUzsESF1XAEmN5bG+uekwz/m/Dw3DN/Mt
   7lRVh1O3rXecroy7ZGBYXOhizPAO041fV6aXN8hZL0Sumf+mfNIU5vj0U
   52K/wo6P8fLvh/+d7I7TzGYj1IvlR4SUc/fSZgmPsPAcc9DKRk1bjBKkH
   WYsJwkNufsk77U95azAiZrH5fYmC1ckjQ484uAZQKRUA/54SckxVXKAkj
   f0dNSviHnUb07uHFiy32KMmz6QOGzA2GoW/W1K5NfaSR9W/pCYC/GE5XT
   NVAjm50VRTB2ru6S3CzX78BK9OWkBZzhPuHWZ4GlxH6GCR4qGKe7BQA3r
   g==;
X-CSE-ConnectionGUID: 5DUM8cmPQ76kG0EzWXrg8A==
X-CSE-MsgGUID: G7X1eY5kRpC3z5LeAEu6eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43014942"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43014942"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 15:33:43 -0700
X-CSE-ConnectionGUID: vht3Y6anQxCDuwMZwts0/A==
X-CSE-MsgGUID: HAnbmQh0QSGUb/KafioHTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="123402680"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2025 15:33:41 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvOSJ-0000pS-0n;
	Thu, 20 Mar 2025 22:33:39 +0000
Date: Fri, 21 Mar 2025 06:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 911a44cf6ddcb809ef5a5e0345986285a62ef462
Message-ID: <202503210613.9HDHKE0X-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_153344_740138_5EFD1A5F 
X-CRM114-Status: UNSURE (   4.92  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
branch HEAD: 911a44cf6ddcb809ef5a5e0345986285a62ef462  Merge tag 'at91-soc-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm

elapsed time: 1444m

configs tested: 239
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-9.3.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                   randconfig-001-20250320    gcc-10.5.0
arc                   randconfig-001-20250321    clang-21
arc                   randconfig-002-20250320    gcc-8.5.0
arc                   randconfig-002-20250321    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                   randconfig-001-20250320    clang-20
arm                   randconfig-001-20250321    clang-21
arm                   randconfig-002-20250320    clang-16
arm                   randconfig-002-20250321    clang-21
arm                   randconfig-003-20250320    gcc-8.5.0
arm                   randconfig-003-20250321    clang-21
arm                   randconfig-004-20250320    gcc-7.5.0
arm                   randconfig-004-20250321    clang-21
arm                           sama7_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm                       versatile_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250320    clang-21
arm64                 randconfig-001-20250321    clang-21
arm64                 randconfig-002-20250320    clang-21
arm64                 randconfig-002-20250321    clang-21
arm64                 randconfig-003-20250320    clang-19
arm64                 randconfig-003-20250321    clang-21
arm64                 randconfig-004-20250320    gcc-8.5.0
arm64                 randconfig-004-20250321    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250320    gcc-10.5.0
csky                  randconfig-001-20250321    gcc-7.5.0
csky                  randconfig-002-20250320    gcc-14.2.0
csky                  randconfig-002-20250321    gcc-7.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250320    clang-18
hexagon               randconfig-001-20250321    gcc-7.5.0
hexagon               randconfig-002-20250320    clang-21
hexagon               randconfig-002-20250321    gcc-7.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250320    gcc-12
i386        buildonly-randconfig-002-20250320    clang-20
i386        buildonly-randconfig-003-20250320    clang-20
i386        buildonly-randconfig-004-20250320    clang-20
i386        buildonly-randconfig-005-20250320    gcc-12
i386        buildonly-randconfig-006-20250320    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250321    clang-20
i386                  randconfig-002-20250321    clang-20
i386                  randconfig-003-20250321    clang-20
i386                  randconfig-004-20250321    clang-20
i386                  randconfig-005-20250321    clang-20
i386                  randconfig-006-20250321    clang-20
i386                  randconfig-007-20250321    clang-20
i386                  randconfig-011-20250321    clang-20
i386                  randconfig-012-20250321    clang-20
i386                  randconfig-013-20250321    clang-20
i386                  randconfig-014-20250321    clang-20
i386                  randconfig-015-20250321    clang-20
i386                  randconfig-016-20250321    clang-20
i386                  randconfig-017-20250321    clang-20
loongarch                        allmodconfig    gcc-12.4.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250320    gcc-14.2.0
loongarch             randconfig-001-20250321    gcc-7.5.0
loongarch             randconfig-002-20250320    gcc-12.4.0
loongarch             randconfig-002-20250321    gcc-7.5.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-6.5.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-9.3.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250320    gcc-6.5.0
nios2                 randconfig-001-20250321    gcc-7.5.0
nios2                 randconfig-002-20250320    gcc-12.4.0
nios2                 randconfig-002-20250321    gcc-7.5.0
openrisc                          allnoconfig    clang-15
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250320    gcc-13.3.0
parisc                randconfig-001-20250321    gcc-7.5.0
parisc                randconfig-002-20250320    gcc-11.5.0
parisc                randconfig-002-20250321    gcc-7.5.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250320    gcc-6.5.0
powerpc               randconfig-001-20250321    gcc-7.5.0
powerpc               randconfig-002-20250320    clang-21
powerpc               randconfig-002-20250321    gcc-7.5.0
powerpc               randconfig-003-20250320    clang-21
powerpc               randconfig-003-20250321    gcc-7.5.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250320    clang-21
powerpc64             randconfig-001-20250321    gcc-7.5.0
powerpc64             randconfig-002-20250320    gcc-8.5.0
powerpc64             randconfig-002-20250321    gcc-7.5.0
powerpc64             randconfig-003-20250320    clang-21
powerpc64             randconfig-003-20250321    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250320    clang-21
riscv                 randconfig-001-20250321    gcc-6.5.0
riscv                 randconfig-002-20250320    gcc-8.5.0
riscv                 randconfig-002-20250321    gcc-6.5.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                             allyesconfig    gcc-8.5.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250320    gcc-5.5.0
s390                  randconfig-001-20250321    gcc-6.5.0
s390                  randconfig-002-20250320    gcc-7.5.0
s390                  randconfig-002-20250321    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                               allmodconfig    gcc-9.3.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250320    gcc-14.2.0
sh                    randconfig-001-20250321    gcc-6.5.0
sh                    randconfig-002-20250320    gcc-10.5.0
sh                    randconfig-002-20250321    gcc-6.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250320    gcc-7.5.0
sparc                 randconfig-001-20250321    gcc-6.5.0
sparc                 randconfig-002-20250320    gcc-7.5.0
sparc                 randconfig-002-20250321    gcc-6.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250320    gcc-5.5.0
sparc64               randconfig-001-20250321    gcc-6.5.0
sparc64               randconfig-002-20250320    gcc-13.3.0
sparc64               randconfig-002-20250321    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-15
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250320    gcc-12
um                    randconfig-001-20250321    gcc-6.5.0
um                    randconfig-002-20250320    clang-16
um                    randconfig-002-20250321    gcc-6.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250320    clang-20
x86_64      buildonly-randconfig-001-20250321    clang-20
x86_64      buildonly-randconfig-002-20250320    gcc-12
x86_64      buildonly-randconfig-002-20250321    clang-20
x86_64      buildonly-randconfig-003-20250320    clang-20
x86_64      buildonly-randconfig-003-20250321    clang-20
x86_64      buildonly-randconfig-004-20250320    clang-20
x86_64      buildonly-randconfig-004-20250321    clang-20
x86_64      buildonly-randconfig-005-20250320    clang-20
x86_64      buildonly-randconfig-005-20250321    clang-20
x86_64      buildonly-randconfig-006-20250320    gcc-12
x86_64      buildonly-randconfig-006-20250321    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250321    clang-20
x86_64                randconfig-002-20250321    clang-20
x86_64                randconfig-003-20250321    clang-20
x86_64                randconfig-004-20250321    clang-20
x86_64                randconfig-005-20250321    clang-20
x86_64                randconfig-006-20250321    clang-20
x86_64                randconfig-007-20250321    clang-20
x86_64                randconfig-008-20250321    clang-20
x86_64                randconfig-071-20250321    gcc-12
x86_64                randconfig-072-20250321    gcc-12
x86_64                randconfig-073-20250321    gcc-12
x86_64                randconfig-074-20250321    gcc-12
x86_64                randconfig-075-20250321    gcc-12
x86_64                randconfig-076-20250321    gcc-12
x86_64                randconfig-077-20250321    gcc-12
x86_64                randconfig-078-20250321    gcc-12
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250320    gcc-9.3.0
xtensa                randconfig-001-20250321    gcc-6.5.0
xtensa                randconfig-002-20250320    gcc-11.5.0
xtensa                randconfig-002-20250321    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


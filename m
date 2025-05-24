Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E97C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 22:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yIa4AR50YtwZ2GcbLT8TiroEN31hhPzxQ3s5MA0JWOg=; b=gmrZ1cKhKj2wefPlirHLAH77eG
	1HFKM6szIDbn4nDyMUViWc4vkwspV7A81qIrmXvsBp3AK6jPsQcxlASCAih33LCM65pn19tXQmIcQ
	Vq/KPnAG78IU9Io57b/7de2cVw9yy1QODMDLnHb7+K2K1ienYZk7INISM3LFNTYzk1hvSTeQd0kbk
	i4O49s+9WM5VVvOYi/An5cI8Yq/qkzE5DKqKsouEtOxa737tZhv50VyzcTOXD0ew8KRA7x6xoCeql
	aYPgV/WuUSfmM84A69oxTZ5e8kRxJ+mbDN+rC1U4OOEMAp8+Zt5R7n7xc2PqFUcWpM2jn9+UAdgkN
	QATH8AmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIxMK-00000006L1N-3NWn;
	Sat, 24 May 2025 22:28:52 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIxKF-00000006KvM-0fxr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 22:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748125603; x=1779661603;
  h=date:from:to:cc:subject:message-id;
  bh=s7RXyv6Wgw6d6oiv42fly72T7v5QWzTeuKz+NHuU+R4=;
  b=JIEgrNfJD6GdtjMrcXq0TIXHJ+GabcPA5JqL1GUnxXTxFowPbaSFa2Fs
   sWcYYJ2FxbNWGyr0fzSa660ci5QQsybSftW7PYbFADbXaGVgewH+Ivltv
   qpk0nHRpzq0XCCWi3m5j4gZ25kbPZio2cn/S1OOjXvyQ3jN6kmkoqqpeY
   Q3Bd0t2EqKEiT0cey8JPRC05OU3ajv5HxEOvuaUuKEJRlrBFkjy2gsTDF
   MEr5qThePBeAdWoFNa+ySWhCB4Sxkop5dtFgGhiYjoBwy3xKLVSa7LbJk
   f/3zLkKC6fj+0doXN8B6uI0wq2aCMP9AOqCWDXIHUvrqHFpGnkzdy3YSf
   g==;
X-CSE-ConnectionGUID: zQtronVjS6C16+A3XIwnPg==
X-CSE-MsgGUID: LoViQoF3R7Sdu8rKs2Veqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="61497264"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61497264"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 15:26:42 -0700
X-CSE-ConnectionGUID: T+C9AtrNQ1qC+Ap/bdDEow==
X-CSE-MsgGUID: q4d5FoodR4KwSCnQPPN54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142105851"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 May 2025 15:26:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIxKA-000RUQ-32;
	Sat, 24 May 2025 22:26:38 +0000
Date: Sun, 25 May 2025 06:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/late] BUILD SUCCESS
 9bba618694cc905b898661c18e3e40955573ef5e
Message-ID: <202505250641.rvSRYugC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_152643_249645_6D8D12E2 
X-CRM114-Status: UNSURE (   5.20  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/late
branch HEAD: 9bba618694cc905b898661c18e3e40955573ef5e  Merge tag 'riscv-sophgo-dt-for-v6.16' of https://github.com/sophgo/linux into soc/late

elapsed time: 1441m

configs tested: 216
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    clang-21
arc                   randconfig-001-20250524    gcc-15.1.0
arc                   randconfig-002-20250524    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-21
arm                       imx_v4_v5_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                      integrator_defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250524    gcc-7.5.0
arm                   randconfig-002-20250524    gcc-7.5.0
arm                   randconfig-003-20250524    clang-20
arm                   randconfig-004-20250524    gcc-7.5.0
arm                           sama5_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    clang-18
arm                        spear6xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250524    gcc-5.5.0
arm64                 randconfig-002-20250524    gcc-7.5.0
arm64                 randconfig-003-20250524    clang-19
arm64                 randconfig-004-20250524    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250524    gcc-11.5.0
csky                  randconfig-001-20250524    gcc-13.3.0
csky                  randconfig-002-20250524    gcc-13.3.0
csky                  randconfig-002-20250524    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250524    clang-21
hexagon               randconfig-001-20250524    gcc-13.3.0
hexagon               randconfig-002-20250524    clang-21
hexagon               randconfig-002-20250524    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250524    clang-20
i386        buildonly-randconfig-002-20250524    gcc-12
i386        buildonly-randconfig-003-20250524    gcc-12
i386        buildonly-randconfig-004-20250524    gcc-12
i386        buildonly-randconfig-005-20250524    clang-20
i386        buildonly-randconfig-006-20250524    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250524    clang-20
i386                  randconfig-002-20250524    clang-20
i386                  randconfig-003-20250524    clang-20
i386                  randconfig-004-20250524    clang-20
i386                  randconfig-005-20250524    clang-20
i386                  randconfig-006-20250524    clang-20
i386                  randconfig-007-20250524    clang-20
i386                  randconfig-011-20250524    clang-20
i386                  randconfig-012-20250524    clang-20
i386                  randconfig-013-20250524    clang-20
i386                  randconfig-014-20250524    clang-20
i386                  randconfig-015-20250524    clang-20
i386                  randconfig-016-20250524    clang-20
i386                  randconfig-017-20250524    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250524    gcc-13.3.0
loongarch             randconfig-002-20250524    gcc-13.3.0
loongarch             randconfig-002-20250524    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-18
mips                       rbtx49xx_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250524    gcc-13.3.0
nios2                 randconfig-002-20250524    gcc-13.3.0
nios2                 randconfig-002-20250524    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250524    gcc-13.3.0
parisc                randconfig-001-20250524    gcc-6.5.0
parisc                randconfig-002-20250524    gcc-13.3.0
parisc                randconfig-002-20250524    gcc-8.5.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    clang-18
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-18
powerpc                   motionpro_defconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250524    gcc-13.3.0
powerpc               randconfig-001-20250524    gcc-5.5.0
powerpc               randconfig-002-20250524    gcc-13.3.0
powerpc               randconfig-002-20250524    gcc-7.5.0
powerpc               randconfig-003-20250524    clang-21
powerpc               randconfig-003-20250524    gcc-13.3.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    clang-21
powerpc64             randconfig-001-20250524    gcc-13.3.0
powerpc64             randconfig-001-20250524    gcc-7.5.0
powerpc64             randconfig-002-20250524    gcc-10.5.0
powerpc64             randconfig-002-20250524    gcc-13.3.0
powerpc64             randconfig-003-20250524    clang-21
powerpc64             randconfig-003-20250524    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250524    clang-21
riscv                 randconfig-002-20250524    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20250524    clang-17
s390                  randconfig-002-20250524    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250524    gcc-13.3.0
sh                    randconfig-002-20250524    gcc-7.5.0
sh                           se7721_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250524    gcc-6.5.0
sparc                 randconfig-002-20250524    gcc-6.5.0
sparc64                          alldefconfig    clang-18
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250524    gcc-8.5.0
sparc64               randconfig-002-20250524    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250524    gcc-12
um                    randconfig-002-20250524    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250524    gcc-12
x86_64      buildonly-randconfig-002-20250524    gcc-12
x86_64      buildonly-randconfig-003-20250524    gcc-12
x86_64      buildonly-randconfig-004-20250524    gcc-12
x86_64      buildonly-randconfig-005-20250524    gcc-11
x86_64      buildonly-randconfig-006-20250524    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250524    clang-20
x86_64                randconfig-002-20250524    clang-20
x86_64                randconfig-003-20250524    clang-20
x86_64                randconfig-004-20250524    clang-20
x86_64                randconfig-005-20250524    clang-20
x86_64                randconfig-006-20250524    clang-20
x86_64                randconfig-007-20250524    clang-20
x86_64                randconfig-008-20250524    clang-20
x86_64                randconfig-071-20250524    clang-20
x86_64                randconfig-072-20250524    clang-20
x86_64                randconfig-073-20250524    clang-20
x86_64                randconfig-074-20250524    clang-20
x86_64                randconfig-075-20250524    clang-20
x86_64                randconfig-076-20250524    clang-20
x86_64                randconfig-077-20250524    clang-20
x86_64                randconfig-078-20250524    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250524    gcc-8.5.0
xtensa                randconfig-002-20250524    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


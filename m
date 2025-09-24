Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C194CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 22:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tbia3zaEGpP6Y2ZR6mxWLraF6qsmihZIKtdWtZu9OC4=; b=MQNSvXnPvHV4DQGL3/B1SLS5eL
	yU7iLC8wbYoU6BLPegwW/msxrtGB3fT1St9SFDyktWQhErIp/ZBWEg17f+d2xozFYQ7RxoCbdNT77
	5ZMV2SreLKCdOsxNEPPym9xyMUi+yTo7lG44DgmlM1ktZ7olyXwne682wB8zevsKPAgZCXFVqWOtn
	LzTFzfFwRWORW2utzraoHuDP0wRGxLZABQWQk4WLrTIN2WJh75CnYcFc0v5pVq+c0SiI0yGcXLOOQ
	R5oC90tvwX8X/M1TfPD6HqsbKWNbA1JiX4Qw/tzntXhbVlzk0iJX8Wqltr4mFcL4yqwSAMN5VA8F6
	w7l40vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Xt9-00000004Fox-0PnI;
	Wed, 24 Sep 2025 22:23:03 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Xt5-00000004Fjk-2GIs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 22:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758752580; x=1790288580;
  h=date:from:to:cc:subject:message-id;
  bh=hBRiMGTRbVrpfUG+YePtajLdNfc+MW0Lt4dLBxhRKs4=;
  b=QxtjL2fNGfioIzsgcQT1muqOqIBMJJPUrQFMmJRsywYFPwbDDLDV902i
   NdcHTeKmWbAd98aFqe9Uyu0yzzue5TB7EjKr403nhhJttsLSsrZ+DgIFM
   rn03pTcXFLH4rJXeSM7VOPX0y9XaWEKvxRGfGPNPWepwfmW1TSnVRQwCV
   WeR75EioBNMMpV0aGtGSksfgq7CQMN4OE+Qiulb30bMeZgxrGVyYKkxUI
   oCTeCBSTAOQj5H6StOjRu1OFhkupxJmXepyiVHoWCRFlzlktGFMsCRvfj
   N7i3OOxpfE7kOsuDYvQeNbeiUozLqhexttVx9q3yYCwzg8ftqoh4rP8zL
   w==;
X-CSE-ConnectionGUID: De6rnkz6SxuXN0fWeapU9g==
X-CSE-MsgGUID: r/KthJzeQHeIrFs30dypwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64703144"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="64703144"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 15:23:00 -0700
X-CSE-ConnectionGUID: QyHRcORnTO6a3Iqlxi2UMg==
X-CSE-MsgGUID: Cww2MlcsTSCeqzm6Dc7YAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181424644"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2025 15:22:58 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Xsx-0004bf-2b;
	Wed, 24 Sep 2025 22:22:52 +0000
Date: Thu, 25 Sep 2025 06:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:tee/qcom] BUILD SUCCESS
 dcc7a571a3665a16581b5b18ca6b113f60a9a41a
Message-ID: <202509250601.g3l2XMNQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_152259_653227_9D0128EE 
X-CRM114-Status: UNSURE (   5.73  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tee/qcom
branch HEAD: dcc7a571a3665a16581b5b18ca6b113f60a9a41a  Documentation: tee: Add Qualcomm TEE driver

elapsed time: 1458m

configs tested: 250
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250924    gcc-11.5.0
arc                   randconfig-002-20250924    gcc-11.5.0
arc                   randconfig-002-20250924    gcc-14.3.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            mmp2_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20250924    clang-22
arm                   randconfig-001-20250924    gcc-11.5.0
arm                   randconfig-002-20250924    clang-22
arm                   randconfig-002-20250924    gcc-11.5.0
arm                   randconfig-003-20250924    clang-22
arm                   randconfig-003-20250924    gcc-11.5.0
arm                   randconfig-004-20250924    gcc-11.5.0
arm                   randconfig-004-20250924    gcc-13.4.0
arm                             rpc_defconfig    clang-18
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250924    gcc-11.5.0
arm64                 randconfig-001-20250924    gcc-14.3.0
arm64                 randconfig-002-20250924    clang-18
arm64                 randconfig-002-20250924    gcc-11.5.0
arm64                 randconfig-003-20250924    gcc-11.5.0
arm64                 randconfig-003-20250924    gcc-12.5.0
arm64                 randconfig-004-20250924    clang-22
arm64                 randconfig-004-20250924    gcc-11.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250924    clang-22
csky                  randconfig-001-20250924    gcc-14.3.0
csky                  randconfig-002-20250924    clang-22
csky                  randconfig-002-20250924    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250924    clang-22
hexagon               randconfig-002-20250924    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250924    gcc-14
i386        buildonly-randconfig-002-20250924    clang-20
i386        buildonly-randconfig-002-20250924    gcc-14
i386        buildonly-randconfig-003-20250924    gcc-13
i386        buildonly-randconfig-003-20250924    gcc-14
i386        buildonly-randconfig-004-20250924    gcc-14
i386        buildonly-randconfig-005-20250924    clang-20
i386        buildonly-randconfig-005-20250924    gcc-14
i386        buildonly-randconfig-006-20250924    clang-20
i386        buildonly-randconfig-006-20250924    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20250924    clang-20
i386                  randconfig-002-20250924    clang-20
i386                  randconfig-003-20250924    clang-20
i386                  randconfig-004-20250924    clang-20
i386                  randconfig-005-20250924    clang-20
i386                  randconfig-006-20250924    clang-20
i386                  randconfig-007-20250924    clang-20
i386                  randconfig-011-20250924    gcc-14
i386                  randconfig-012-20250924    gcc-14
i386                  randconfig-013-20250924    gcc-14
i386                  randconfig-014-20250924    gcc-14
i386                  randconfig-015-20250924    gcc-14
i386                  randconfig-016-20250924    gcc-14
i386                  randconfig-017-20250924    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250924    clang-22
loongarch             randconfig-001-20250924    gcc-15.1.0
loongarch             randconfig-002-20250924    clang-22
loongarch             randconfig-002-20250924    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        mvme147_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250924    clang-22
nios2                 randconfig-001-20250924    gcc-11.5.0
nios2                 randconfig-002-20250924    clang-22
nios2                 randconfig-002-20250924    gcc-8.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250924    clang-22
parisc                randconfig-001-20250924    gcc-12.5.0
parisc                randconfig-002-20250924    clang-22
parisc                randconfig-002-20250924    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    clang-22
powerpc                      pmac32_defconfig    clang-22
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250924    clang-18
powerpc               randconfig-001-20250924    clang-22
powerpc               randconfig-002-20250924    clang-18
powerpc               randconfig-002-20250924    clang-22
powerpc               randconfig-003-20250924    clang-22
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250924    clang-22
powerpc64             randconfig-002-20250924    clang-22
powerpc64             randconfig-002-20250924    gcc-15.1.0
powerpc64             randconfig-003-20250924    clang-22
powerpc64             randconfig-003-20250924    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250924    gcc-8.5.0
riscv                 randconfig-002-20250924    clang-22
riscv                 randconfig-002-20250924    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250924    gcc-8.5.0
s390                  randconfig-002-20250924    clang-22
s390                  randconfig-002-20250924    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    clang-22
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250924    gcc-15.1.0
sh                    randconfig-001-20250924    gcc-8.5.0
sh                    randconfig-002-20250924    gcc-15.1.0
sh                    randconfig-002-20250924    gcc-8.5.0
sh                      rts7751r2d1_defconfig    clang-22
sh                           se7206_defconfig    clang-22
sh                           se7705_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                            alldefconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250924    gcc-15.1.0
sparc                 randconfig-001-20250924    gcc-8.5.0
sparc                 randconfig-002-20250924    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250924    gcc-8.5.0
sparc64               randconfig-002-20250924    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250924    clang-16
um                    randconfig-001-20250924    gcc-8.5.0
um                    randconfig-002-20250924    clang-19
um                    randconfig-002-20250924    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250924    clang-20
x86_64      buildonly-randconfig-002-20250924    clang-20
x86_64      buildonly-randconfig-003-20250924    clang-20
x86_64      buildonly-randconfig-004-20250924    clang-20
x86_64      buildonly-randconfig-004-20250924    gcc-14
x86_64      buildonly-randconfig-005-20250924    clang-20
x86_64      buildonly-randconfig-006-20250924    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250924    gcc-14
x86_64                randconfig-002-20250924    gcc-14
x86_64                randconfig-003-20250924    gcc-14
x86_64                randconfig-004-20250924    gcc-14
x86_64                randconfig-005-20250924    gcc-14
x86_64                randconfig-006-20250924    gcc-14
x86_64                randconfig-007-20250924    gcc-14
x86_64                randconfig-008-20250924    gcc-14
x86_64                randconfig-071-20250924    clang-20
x86_64                randconfig-072-20250924    clang-20
x86_64                randconfig-073-20250924    clang-20
x86_64                randconfig-074-20250924    clang-20
x86_64                randconfig-075-20250924    clang-20
x86_64                randconfig-076-20250924    clang-20
x86_64                randconfig-077-20250924    clang-20
x86_64                randconfig-078-20250924    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250924    gcc-13.4.0
xtensa                randconfig-001-20250924    gcc-8.5.0
xtensa                randconfig-002-20250924    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


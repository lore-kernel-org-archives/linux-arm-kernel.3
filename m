Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A531AD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G0aKZcvpO/2+GlcNAJFZTjpRnorRPFF3/hUG4FlxAb0=; b=osbXNJe9VohiRUUeob1Uh6g8IU
	jeVGtqouB2R/Mvmje3noSNySErajryK2zOGdKnPV94SfyEgC6jK0zDAJWF4ZO/ob+S+8xJD3xp46A
	BHwibBwmkhat+o9Ph1hzHfRUF5aeG7O+wyEnWni16cnXPrx62ZI+p+px0qXW7HtndSyggWnejJ7Pd
	H1UcvEl2Lh/u1BfWw+opFlmx+epsWxsn7TTY6FHLP7ICsSSGWRWS7cvmI4MQqATJqjRwSStbIhte/
	wnxAJglNgwBATucxpC9UkJ3QEahqgrmSalwgIJaC3yzBGSFoJp36N/LQ2DK/HUQ7NrXUGVw4suow/
	nmVUEZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7ld-000000012fK-3egz;
	Fri, 28 Nov 2025 23:20:45 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7lb-000000012eZ-3s3Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 23:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764372044; x=1795908044;
  h=date:from:to:cc:subject:message-id;
  bh=+eJ7sqbJoq1iV7GDrCYu2jAggqErBoPluP+wJT2Ldu0=;
  b=Ot2ASaqQonokQFgYdnD/cM1TpSwAaFnIkUor/dKArIxt+Yl0l/sLSR/2
   QlZ08t57+E0Wgk7+i/wPNQ2PW5JiNv53+EAPg/cQRcLrjPS5ndqXzrT86
   pHA7xDjKK8E/eDSyP0S6Y917q71o18JhrH1tnciSkfYptfEL1M6wbfiKY
   BWULVlAdPLPynAemfk0h9uNEKCP6R7dPw+jrrqQrM/hcUlMIam6o4phK1
   RBhjOm0AjFhskud535PigFu/xx3iO8gAOzn/y5kn+Fw+UvDYqiXKLqMP7
   tbPikEj7EWqyBX1RSilbwgoBWTBjkAce57P4Fgt6jrUv2/zwvmT77eI2/
   A==;
X-CSE-ConnectionGUID: +oklL8GkQO+nlGwalV9yQA==
X-CSE-MsgGUID: zI74O1DuR8KRQs/Sv7Q9Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66358531"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66358531"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 15:20:42 -0800
X-CSE-ConnectionGUID: XV5+cIjESpyD08FBHGMH/g==
X-CSE-MsgGUID: W/HQx1pPTUOv1y/jNSKsPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="224496934"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2025 15:20:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP7lW-000000006oP-0LAN;
	Fri, 28 Nov 2025 23:20:38 +0000
Date: Sat, 29 Nov 2025 07:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers-late] BUILD SUCCESS
 8e2baac0f2bb5ceff5858ac89eff04a67c98b789
Message-ID: <202511290727.ksHnmzZW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_152044_071250_E8F19A0C 
X-CRM114-Status: UNSURE (   5.34  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers-late
branch HEAD: 8e2baac0f2bb5ceff5858ac89eff04a67c98b789  Merge tag 'cache-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/drivers-late

elapsed time: 1456m

configs tested: 209
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251128    gcc-8.5.0
arc                   randconfig-002-20251128    gcc-15.1.0
arc                   randconfig-002-20251128    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251128    gcc-14.3.0
arm                   randconfig-001-20251128    gcc-8.5.0
arm                   randconfig-002-20251128    gcc-8.5.0
arm                   randconfig-003-20251128    clang-22
arm                   randconfig-003-20251128    gcc-8.5.0
arm                   randconfig-004-20251128    clang-17
arm                   randconfig-004-20251128    gcc-8.5.0
arm64                            allmodconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251128    gcc-15.1.0
arm64                 randconfig-002-20251128    gcc-15.1.0
arm64                 randconfig-003-20251128    gcc-15.1.0
arm64                 randconfig-004-20251128    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251128    gcc-15.1.0
csky                  randconfig-002-20251128    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251128    clang-22
hexagon               randconfig-002-20251128    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
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
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251128    clang-22
loongarch             randconfig-002-20251128    clang-22
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                malta_qemu_32r6_defconfig    gcc-15.1.0
mips                  maltasmvp_eva_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251128    clang-22
nios2                 randconfig-002-20251128    clang-22
openrisc                         alldefconfig    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251128    clang-22
parisc                randconfig-001-20251128    gcc-14.3.0
parisc                randconfig-001-20251129    clang-22
parisc                randconfig-002-20251128    clang-22
parisc                randconfig-002-20251128    gcc-15.1.0
parisc                randconfig-002-20251129    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251128    clang-22
powerpc               randconfig-001-20251128    gcc-11.5.0
powerpc               randconfig-001-20251129    clang-22
powerpc               randconfig-002-20251128    clang-22
powerpc               randconfig-002-20251129    clang-22
powerpc64             randconfig-001-20251128    clang-22
powerpc64             randconfig-001-20251129    clang-22
powerpc64             randconfig-002-20251128    clang-22
powerpc64             randconfig-002-20251128    gcc-8.5.0
powerpc64             randconfig-002-20251129    clang-22
riscv                            allmodconfig    clang-16
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251128    gcc-15.1.0
riscv                 randconfig-002-20251128    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251128    gcc-15.1.0
s390                  randconfig-002-20251128    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20251128    gcc-15.1.0
sh                    randconfig-002-20251128    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251128    clang-22
sparc                 randconfig-002-20251128    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251128    clang-22
sparc64               randconfig-002-20251128    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251128    clang-22
um                    randconfig-002-20251128    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    gcc-15.1.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
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
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251128    clang-22
xtensa                randconfig-002-20251128    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


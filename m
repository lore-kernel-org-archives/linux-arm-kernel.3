Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B86CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sFulBqk+pUJkXGAcsQXQMYAJnr7uyFJLWS40iaQYai8=; b=tcMrQdZ5+6hjrFeBNwehEOfeB5
	aGYiru2+bPyvwul5eygP7oZ3QhDyo0aV7sJO3/LEpErEz8lPCwwrG7qWaokKzv3jU3k3izfn0iQHn
	OTWMF68iAd/GiFxjsFcFsqUz9OcaGxMt0hv3dklD57A+T+eCL9p5zjXa50WBwbm1nXoNhI1QkqB0j
	z07o+EdqY08P56AH++Wn4ULMGb87ntUXcibNhextPRFXF7nHt1Z9nW4Ymt1gZNLrZ+ofuLhVh6mmF
	1cSAhbO2XhLedCmM26+2zpY1qeqByAXIDflBLVlj2rZ2rsnt4/O3OEDBrxKpcIK943ZIkE32lid4G
	uo8Jgi+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1u0p-0000000DOFx-1yvW;
	Thu, 25 Sep 2025 22:00:27 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1u0m-0000000DOEL-3Hmc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 22:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758837625; x=1790373625;
  h=date:from:to:cc:subject:message-id;
  bh=dvqUPuVvrFqGe7yOG5vuKaX6hhFVwI0WzHW9nCrAsho=;
  b=XRLjdVkji/1BRwo/GU33GbBySYVtHF/g6N6hyP6G8Lzr0nSyRG72+eY6
   gP1kQxJzr3WZBFuKGq/7mxd6x0sb/fFUEOAfZ09907tXQwMxOYheI4pj6
   Pt7f8snZFT18CTgSaFl/5blOObc/+qir3PwGTMRfDhdR8R69vL+z6CuiN
   aHkuWswPlG2/97mb4KIDiO6x8RZA+9veKB7KpIwJFtuZFex0t/5InHQKF
   GWhfjCV087ynNC/nr05lPvqz8Ft9RSa6URqtSy1EvnyHDlW0dk4xNoomd
   vKlMK5sCAOSJYaAJQto3XuT3fbCkfHaF5l/FgYgExiWZkgsrQwOCJON4r
   A==;
X-CSE-ConnectionGUID: VUXCxw4sSNWlJlsVdamdYw==
X-CSE-MsgGUID: O3301mf7TtKW6fv14ioBRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61221650"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61221650"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 15:00:24 -0700
X-CSE-ConnectionGUID: yjA8v0GLQ96NrQJugy9YDg==
X-CSE-MsgGUID: GAuuPWrfSmm3iku+Bc8o7A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2025 15:00:22 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1u0i-0005f0-0W;
	Thu, 25 Sep 2025 22:00:20 +0000
Date: Fri, 26 Sep 2025 05:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:tee/fix2] BUILD SUCCESS
 d5cf5b37064b1699d946e8b7ab4ac7d7d101814c
Message-ID: <202509260516.HpgJQTcR-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_150024_919213_11C01A5B 
X-CRM114-Status: UNSURE (   5.28  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tee/fix2
branch HEAD: d5cf5b37064b1699d946e8b7ab4ac7d7d101814c  tee: fix register_shm_helper()

elapsed time: 1459m

configs tested: 251
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
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250925    gcc-13.4.0
arc                   randconfig-002-20250925    gcc-13.4.0
arc                   randconfig-002-20250925    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20250925    gcc-11.5.0
arm                   randconfig-001-20250925    gcc-13.4.0
arm                   randconfig-002-20250925    gcc-10.5.0
arm                   randconfig-002-20250925    gcc-13.4.0
arm                   randconfig-003-20250925    gcc-13.4.0
arm                   randconfig-003-20250925    gcc-8.5.0
arm                   randconfig-004-20250925    gcc-13.4.0
arm                   randconfig-004-20250925    gcc-14.3.0
arm                           sama7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250925    gcc-11.5.0
arm64                 randconfig-001-20250925    gcc-13.4.0
arm64                 randconfig-002-20250925    gcc-13.4.0
arm64                 randconfig-002-20250925    gcc-15.1.0
arm64                 randconfig-003-20250925    clang-19
arm64                 randconfig-003-20250925    gcc-13.4.0
arm64                 randconfig-004-20250925    gcc-13.4.0
arm64                 randconfig-004-20250925    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250925    clang-22
csky                  randconfig-001-20250925    gcc-14.3.0
csky                  randconfig-002-20250925    clang-22
csky                  randconfig-002-20250925    gcc-15.1.0
hexagon                          alldefconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250925    clang-22
hexagon               randconfig-002-20250925    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250925    clang-20
i386        buildonly-randconfig-001-20250925    gcc-14
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-002-20250925    clang-20
i386        buildonly-randconfig-002-20250925    gcc-14
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-003-20250925    gcc-14
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-004-20250925    gcc-14
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-005-20250925    clang-20
i386        buildonly-randconfig-005-20250925    gcc-14
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-006-20250925    clang-20
i386        buildonly-randconfig-006-20250925    gcc-14
i386        buildonly-randconfig-006-20250926    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250925    gcc-14
i386                  randconfig-001-20250926    clang-20
i386                  randconfig-002-20250925    gcc-14
i386                  randconfig-002-20250926    clang-20
i386                  randconfig-003-20250925    gcc-14
i386                  randconfig-003-20250926    clang-20
i386                  randconfig-004-20250925    gcc-14
i386                  randconfig-004-20250926    clang-20
i386                  randconfig-005-20250925    gcc-14
i386                  randconfig-005-20250926    clang-20
i386                  randconfig-006-20250925    gcc-14
i386                  randconfig-006-20250926    clang-20
i386                  randconfig-007-20250925    gcc-14
i386                  randconfig-007-20250926    clang-20
i386                  randconfig-011-20250925    clang-20
i386                  randconfig-011-20250926    gcc-12
i386                  randconfig-012-20250925    clang-20
i386                  randconfig-012-20250926    gcc-12
i386                  randconfig-013-20250925    clang-20
i386                  randconfig-013-20250926    gcc-12
i386                  randconfig-014-20250925    clang-20
i386                  randconfig-014-20250926    gcc-12
i386                  randconfig-015-20250925    clang-20
i386                  randconfig-015-20250926    gcc-12
i386                  randconfig-016-20250925    clang-20
i386                  randconfig-016-20250926    gcc-12
i386                  randconfig-017-20250925    clang-20
i386                  randconfig-017-20250926    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250925    clang-18
loongarch             randconfig-001-20250925    clang-22
loongarch             randconfig-002-20250925    clang-22
loongarch             randconfig-002-20250925    gcc-12.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250925    clang-22
nios2                 randconfig-001-20250925    gcc-8.5.0
nios2                 randconfig-002-20250925    clang-22
nios2                 randconfig-002-20250925    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250925    clang-22
parisc                randconfig-001-20250925    gcc-8.5.0
parisc                randconfig-002-20250925    clang-22
parisc                randconfig-002-20250925    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 canyonlands_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    clang-22
powerpc                      pmac32_defconfig    clang-22
powerpc               randconfig-001-20250925    clang-22
powerpc               randconfig-002-20250925    clang-22
powerpc               randconfig-002-20250925    gcc-8.5.0
powerpc               randconfig-003-20250925    clang-22
powerpc               randconfig-003-20250925    gcc-8.5.0
powerpc64             randconfig-001-20250925    clang-22
powerpc64             randconfig-002-20250925    clang-22
powerpc64             randconfig-002-20250925    gcc-14.3.0
powerpc64             randconfig-003-20250925    clang-22
powerpc64             randconfig-003-20250925    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250925    clang-22
riscv                 randconfig-001-20250925    gcc-12.5.0
riscv                 randconfig-002-20250925    clang-22
riscv                 randconfig-002-20250925    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250925    gcc-12.5.0
s390                  randconfig-001-20250925    gcc-15.1.0
s390                  randconfig-002-20250925    gcc-12.5.0
s390                  randconfig-002-20250925    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20250925    gcc-12.5.0
sh                    randconfig-001-20250925    gcc-15.1.0
sh                    randconfig-002-20250925    gcc-12.5.0
sh                    randconfig-002-20250925    gcc-13.4.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250925    gcc-12.5.0
sparc                 randconfig-001-20250925    gcc-15.1.0
sparc                 randconfig-002-20250925    gcc-12.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250925    gcc-10.5.0
sparc64               randconfig-001-20250925    gcc-12.5.0
sparc64               randconfig-002-20250925    gcc-10.5.0
sparc64               randconfig-002-20250925    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250925    gcc-12.5.0
um                    randconfig-001-20250925    gcc-14
um                    randconfig-002-20250925    clang-22
um                    randconfig-002-20250925    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250925    clang-20
x86_64      buildonly-randconfig-002-20250925    clang-20
x86_64      buildonly-randconfig-002-20250925    gcc-14
x86_64      buildonly-randconfig-003-20250925    clang-20
x86_64      buildonly-randconfig-003-20250925    gcc-14
x86_64      buildonly-randconfig-004-20250925    clang-20
x86_64      buildonly-randconfig-005-20250925    clang-20
x86_64      buildonly-randconfig-006-20250925    clang-20
x86_64      buildonly-randconfig-006-20250925    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250925    gcc-14
x86_64                randconfig-002-20250925    gcc-14
x86_64                randconfig-003-20250925    gcc-14
x86_64                randconfig-004-20250925    gcc-14
x86_64                randconfig-005-20250925    gcc-14
x86_64                randconfig-006-20250925    gcc-14
x86_64                randconfig-007-20250925    gcc-14
x86_64                randconfig-008-20250925    gcc-14
x86_64                randconfig-071-20250925    gcc-14
x86_64                randconfig-072-20250925    gcc-14
x86_64                randconfig-073-20250925    gcc-14
x86_64                randconfig-074-20250925    gcc-14
x86_64                randconfig-075-20250925    gcc-14
x86_64                randconfig-076-20250925    gcc-14
x86_64                randconfig-077-20250925    gcc-14
x86_64                randconfig-078-20250925    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250925    gcc-12.5.0
xtensa                randconfig-002-20250925    gcc-11.5.0
xtensa                randconfig-002-20250925    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


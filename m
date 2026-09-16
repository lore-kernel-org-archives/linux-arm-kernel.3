Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935CFC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T9Sct4MOrGkijUm/PuPZcwVzYvxBvGY/TQPARiF+l0M=; b=oiDmZqcudLDo6RwUpXPiPR5JB0
	wqki46uVeMoerVxsm9XLBiIdc27OVi50sXbDF6jbYOaNBHUbVhgmv/ojKB/GMZbJZ0nyXp9uDF77V
	uI4TYDcu05bPdT5alt5UtNL5503u6vED3x0uvU9Toy5aFkzczEVMJpVyLckK0b1VjcrW0vCuagOGk
	OkOhwj5uxwdpV6B7osFeyHaX54nIdP4cqCICZUElamXKQjrpGfVzhL110kw1FtJjzF/FAwn4XfExl
	+ICXv/whW0UpnvCd9WfP87fh4z/YLc2/0bTKnvbfZ9dDVfa04crMOxqzr3bndMSYKEDNn3Atc26uD
	eEFa2veA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6oax-000000099cd-0b7P;
	Wed, 16 Sep 2026 12:18:35 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6oat-000000099bj-3hV9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789561112; x=1821097112;
  h=date:from:to:cc:subject:message-id;
  bh=ZIA/ukuHJb+AIAQpM5d8IphA26jnRSfAYQb/ZDrUfM8=;
  b=QuIscUDX0/3spbs5gAj3n7uC4h4eyORDfF9bX3EIboiT2X911Ey47t25
   aDIDQME+KqLpKWWDElbtTJ2nddFjJo/k9AidKJuc6fEjlP4wgplEBXoj+
   nlEig2pEuOCQkEAMFgQEjwc+Yuxa0uHRqSQwgYKDGYjGCiRh0jm18pcdf
   2TKrluVfnEvZeGbXizzka1gqB2KUtBDlbsGbo36qJO0TH8xde4VYfmz+e
   yEhfbB0EUYVdyN4qDMgWIaskzWpOZP1BYGdyUZrtrUO8NLC4RzXVzw+LI
   711m7mu4r1I78ftoUZ7IVnociXfpIcVRZHYJuzxoeDBeRAiDCI/Nr7cBA
   Q==;
X-CSE-ConnectionGUID: 9Xq8qxYSSE2VMd3yEJ1R2A==
X-CSE-MsgGUID: Id5mOeA3TxiX9gS3DLZVhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107304490"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107304490"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:18:31 -0700
X-CSE-ConnectionGUID: bdH5iLh+QTSJ+sgKM0Wd5w==
X-CSE-MsgGUID: 32ruoxorRj6eyiDYH8YV+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270692017"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 05:18:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6oap-00000000637-0DQe;
	Wed, 16 Sep 2026 12:18:27 +0000
Date: Wed, 16 Sep 2026 20:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-power-domains-v7.3-rc1] BUILD
 SUCCESS 1c07443d031ad04c2774a499278f0c2794943bba
Message-ID: <202609162020.foZMZt4m-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_051832_000300_33E47F9A 
X-CRM114-Status: UNSURE (   5.40  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-power-domains-v7.3-rc1
branch HEAD: 1c07443d031ad04c2774a499278f0c2794943bba  ARM: dts: ux500: Remove DB8500 EPOD regulators

elapsed time: 2317m

configs tested: 261
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20260916    clang-24
arc                   randconfig-002-20260916    clang-24
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                           h3600_defconfig    gcc-16.1.0
arm                      integrator_defconfig    gcc-16.1.0
arm                         lpc32xx_defconfig    gcc-16.1.0
arm                   randconfig-001-20260916    clang-24
arm                   randconfig-002-20260916    clang-24
arm                   randconfig-003-20260916    clang-24
arm                   randconfig-004-20260916    clang-24
arm                  randconfig-r052-20260915    gcc-9.5.0
arm                  randconfig-r062-20260915    clang-24
arm                  randconfig-r133-20260916    gcc-16.1.0 sparse
arm                           tegra_defconfig    clang-20
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260916    gcc-16.1.0
arm64                 randconfig-002-20260916    gcc-16.1.0
arm64                 randconfig-003-20260916    gcc-16.1.0
arm64                 randconfig-004-20260916    gcc-16.1.0
arm64                randconfig-r053-20260915    clang-17
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260916    gcc-16.1.0
csky                  randconfig-002-20260916    gcc-16.1.0
csky                 randconfig-r111-20260916    clang-24 sparse
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260916    gcc-16.1.0
hexagon               randconfig-002-20260916    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260916    clang-22
i386        buildonly-randconfig-002-20260916    clang-22
i386        buildonly-randconfig-003-20260916    clang-22
i386        buildonly-randconfig-004-20260916    clang-22
i386        buildonly-randconfig-005-20260916    clang-22
i386        buildonly-randconfig-006-20260916    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260916    gcc-14
i386                  randconfig-002-20260916    gcc-14
i386                  randconfig-003-20260916    gcc-14
i386                  randconfig-004-20260916    gcc-14
i386                  randconfig-005-20260916    gcc-14
i386                  randconfig-006-20260916    gcc-14
i386                  randconfig-007-20260916    gcc-14
i386                  randconfig-011-20260916    clang-22
i386                  randconfig-012-20260916    clang-22
i386                  randconfig-013-20260916    clang-22
i386                  randconfig-014-20260916    clang-22
i386                  randconfig-015-20260916    clang-22
i386                  randconfig-016-20260916    clang-22
i386                  randconfig-017-20260916    clang-22
i386                  randconfig-051-20260915    clang-22
i386                  randconfig-052-20260915    clang-22
i386                  randconfig-053-20260915    clang-22
i386                  randconfig-054-20260915    clang-22
i386                  randconfig-061-20260916    clang-22 sparse
i386                  randconfig-062-20260916    clang-22 sparse
i386                  randconfig-063-20260916    clang-22 sparse
i386                  randconfig-141-20260915    clang-22
i386                 randconfig-r051-20260915    gcc-9.5.0
i386                 randconfig-r112-20260916    clang-24 sparse
i386                 randconfig-r131-20260916    gcc-16.1.0 sparse
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260916    gcc-16.1.0
loongarch             randconfig-002-20260916    gcc-16.1.0
loongarch            randconfig-r111-20260916    gcc-12.5.0 sparse
loongarch            randconfig-r121-20260916    gcc-12.5.0 sparse
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                          hp300_defconfig    gcc-16.1.0
m68k                       m5329evb_defconfig    clang-20
m68k                 randconfig-r061-20260915    clang-24
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze           randconfig-r053-20260915    gcc-9.5.0
microblaze           randconfig-r054-20260915    gcc-15.2.0
microblaze           randconfig-r121-20260916    clang-24 sparse
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                         cobalt_defconfig    gcc-16.1.0
mips                           ip22_defconfig    gcc-16.1.0
mips                 randconfig-r054-20260915    gcc-9.5.0
mips                 randconfig-r113-20260916    clang-24 sparse
mips                 randconfig-r123-20260916    gcc-12.5.0 sparse
mips                           rs90_defconfig    gcc-16.1.0
mips                        vocore2_defconfig    clang-20
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260916    gcc-16.1.0
nios2                 randconfig-002-20260916    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
openrisc             randconfig-r071-20260915    gcc-14.3.0
openrisc             randconfig-r123-20260916    clang-24 sparse
openrisc             randconfig-r134-20260916    gcc-16.1.0 sparse
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260916    clang-24
parisc                randconfig-002-20260916    clang-24
parisc               randconfig-r122-20260916    gcc-12.5.0 sparse
parisc               randconfig-r132-20260916    gcc-11.5.0 sparse
parisc64                         alldefconfig    clang-20
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                        cell_defconfig    gcc-16.1.0
powerpc                   currituck_defconfig    clang-20
powerpc                     ksi8560_defconfig    gcc-16.1.0
powerpc                 linkstation_defconfig    gcc-16.1.0
powerpc                     mpc512x_defconfig    clang-20
powerpc               randconfig-001-20260916    clang-24
powerpc               randconfig-002-20260916    clang-24
powerpc              randconfig-r063-20260915    clang-24
powerpc              randconfig-r064-20260915    clang-24
powerpc              randconfig-r072-20260915    gcc-9.5.0
powerpc              randconfig-r113-20260916    clang-24 sparse
powerpc              randconfig-r113-20260916    gcc-12.5.0 sparse
powerpc              randconfig-r122-20260916    clang-24 sparse
powerpc                         wii_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260916    clang-24
powerpc64             randconfig-002-20260916    clang-24
powerpc64            randconfig-r071-20260915    gcc-10.5.0
powerpc64            randconfig-r112-20260916    gcc-12.5.0 sparse
powerpc64            randconfig-r122-20260916    clang-24 sparse
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260916    gcc-16.1.0
riscv                 randconfig-002-20260916    gcc-16.1.0
riscv                randconfig-r053-20260915    clang-24
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260916    gcc-16.1.0
s390                  randconfig-002-20260916    gcc-16.1.0
s390                 randconfig-r051-20260915    gcc-8.5.0
s390                 randconfig-r064-20260915    gcc-13
s390                 randconfig-r073-20260915    clang-19
s390                 randconfig-r133-20260916    gcc-11.5.0 sparse
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    gcc-16.1.0
sh                          kfr2r09_defconfig    gcc-16.1.0
sh                          lboxre2_defconfig    gcc-16.1.0
sh                    randconfig-001-20260916    gcc-16.1.0
sh                    randconfig-002-20260916    gcc-16.1.0
sh                   randconfig-r054-20260915    clang-24
sh                   randconfig-r123-20260916    clang-24 sparse
sh                          sdk7786_defconfig    clang-20
sh                           se7751_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260916    gcc-14.3.0
sparc                 randconfig-002-20260916    gcc-14.3.0
sparc                randconfig-r063-20260915    gcc-13
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260916    gcc-14.3.0
sparc64               randconfig-002-20260916    gcc-14.3.0
sparc64              randconfig-r052-20260915    gcc-14.3.0
sparc64              randconfig-r112-20260916    clang-24 sparse
sparc64              randconfig-r134-20260916    gcc-11.5.0 sparse
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260916    gcc-14.3.0
um                    randconfig-002-20260916    gcc-14.3.0
um                   randconfig-r052-20260915    clang-24
um                   randconfig-r072-20260915    clang-17
um                   randconfig-r121-20260916    clang-24 sparse
um                   randconfig-r132-20260916    gcc-16.1.0 sparse
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-24
x86_64      buildonly-randconfig-001-20260916    clang-22
x86_64      buildonly-randconfig-002-20260916    clang-22
x86_64      buildonly-randconfig-003-20260916    clang-22
x86_64      buildonly-randconfig-004-20260916    clang-22
x86_64      buildonly-randconfig-005-20260916    clang-22
x86_64      buildonly-randconfig-006-20260916    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260916    clang-22
x86_64                randconfig-002-20260916    clang-22
x86_64                randconfig-003-20260916    clang-22
x86_64                randconfig-004-20260916    clang-22
x86_64                randconfig-005-20260916    clang-22
x86_64                randconfig-006-20260916    clang-22
x86_64                randconfig-011-20260916    gcc-14
x86_64                randconfig-012-20260916    gcc-14
x86_64                randconfig-013-20260916    gcc-14
x86_64                randconfig-014-20260916    gcc-14
x86_64                randconfig-015-20260916    gcc-14
x86_64                randconfig-016-20260916    gcc-14
x86_64                randconfig-071-20260916    gcc-14
x86_64                randconfig-072-20260916    gcc-14
x86_64                randconfig-073-20260916    gcc-14
x86_64                randconfig-074-20260916    gcc-14
x86_64                randconfig-075-20260916    gcc-14
x86_64                randconfig-076-20260916    gcc-14
x86_64                randconfig-101-20260915    clang-22
x86_64                randconfig-102-20260915    clang-22
x86_64                randconfig-103-20260915    clang-22
x86_64                randconfig-104-20260915    clang-22
x86_64                randconfig-121-20260916    clang-22 sparse
x86_64                randconfig-122-20260916    clang-22 sparse
x86_64                randconfig-123-20260916    clang-22 sparse
x86_64                randconfig-161-20260915    clang-22
x86_64               randconfig-r061-20260915    gcc-13
x86_64               randconfig-r073-20260915    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    clang-22
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260916    gcc-14.3.0
xtensa                randconfig-002-20260916    gcc-14.3.0
xtensa               randconfig-r051-20260915    clang-24
xtensa               randconfig-r062-20260915    gcc-13
xtensa               randconfig-r111-20260916    clang-24 sparse
xtensa               randconfig-r131-20260916    gcc-11.5.0 sparse
xtensa                    smp_lx200_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24585C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 11:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cs7Wf+1ePpIs2dlaZ7qd/Vvq9ba6jB4ELGogYBU/8R4=; b=D4kSr3hKUZeSopAn7orsidDuXU
	V8MZNKCY7Y0Xllo4N+A3JxKG0qTyR60ne3qhHEssYNuwSt/2zQpEMg9apKlIT0ZYYZtRelDFgRaEH
	YaZQL8Gt/jhR4Ocdbvp7cp7fq8qwq3ZiekJI/e1yKC0jlYMF+my7Jnd80QoBQKjaMuMbIL3Tp/cbi
	U2oOn4NLm7KJQA+QBAnQgEhTIXom3n03hHjgXP2vtbnWISjni1T2OLfjDq4b+elMmLDO/40QVJ4vp
	xdf+rugFWOAMkpW7boJQ5iqy0rBgHm9//wWHEwOeCp4HI7ndiUPQCTFKleGdz6MYUCcUfvxlLquXX
	FGJNaEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNfT-0000000EfkQ-1PiO;
	Thu, 16 Jan 2025 11:04:07 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNeD-0000000EfTq-0Q6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 11:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737025369; x=1768561369;
  h=date:from:to:cc:subject:message-id;
  bh=D9LphmDLziwABaVfQgiF763p78FlD7pQuoSL9NIn3+k=;
  b=S3jAetWE+OlV/R0ZOl4knWbe6fqc+otC/hPJ1jNLFNWy5VFy5UY2x+N7
   oRm1D66Oy+sDjMmUzTd1eSJHRGFVQBLRcAuDNWgSzwhYyBsahtgeY0PFI
   zZV1YewfvMk8kCtwBpZyrQwCPDYchmelMoA8Au2VMXko9DO+uFgzCKnH3
   4HMkp8eUZ2V5xgTB/ZD67CD7iNg5+9o27cgqUEKSIpRU0CzuiuDsdNqm9
   wFVdBVNqpv5rZIyHMdK5Ksg7HMFG+dKN7G0QjmN6WqO75iNEsBKSFA4Vf
   pWtCkHKZh3BEDPeR0jSH1/xcZlHKF4YOSShM8QWdfy/qfDs9GowRPKDtk
   A==;
X-CSE-ConnectionGUID: bM4H8dVQTtunbfx7jXnY2A==
X-CSE-MsgGUID: 6bFqfiPVSiSYS6T8yKKPsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37643303"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="37643303"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:02:46 -0800
X-CSE-ConnectionGUID: 4TkaH256Sw6B21KxS0w3RA==
X-CSE-MsgGUID: 7v/OQ65oTi+hl7f4tcii0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105320691"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2025 03:02:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYNe6-000RjD-1Q;
	Thu, 16 Jan 2025 11:02:42 +0000
Date: Thu, 16 Jan 2025 19:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:ti/defconfig] BUILD SUCCESS
 184caba444cfd4b90231de7d071b9966c115c29f
Message-ID: <202501161956.oHf326uL-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_030249_179957_175D53E5 
X-CRM114-Status: UNSURE (   5.23  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git ti/defconfig
branch HEAD: 184caba444cfd4b90231de7d071b9966c115c29f  arm64: defconfig: Enable TI K3 M4 remoteproc driver

elapsed time: 1246m

configs tested: 119
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                   randconfig-001-20250116    clang-15
arc                   randconfig-002-20250116    clang-15
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                            mmp2_defconfig    gcc-14.2.0
arm                   randconfig-001-20250116    clang-15
arm                   randconfig-002-20250116    clang-15
arm                   randconfig-003-20250116    clang-15
arm                   randconfig-004-20250116    clang-15
arm                         s3c6400_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250115    clang-20
arm64                 randconfig-001-20250116    clang-15
arm64                 randconfig-002-20250115    gcc-14.2.0
arm64                 randconfig-002-20250116    clang-15
arm64                 randconfig-003-20250115    clang-18
arm64                 randconfig-003-20250116    clang-15
arm64                 randconfig-004-20250115    gcc-14.2.0
arm64                 randconfig-004-20250116    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250116    clang-20
csky                  randconfig-002-20250116    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon               randconfig-001-20250116    clang-20
hexagon               randconfig-002-20250116    clang-20
i386        buildonly-randconfig-001-20250116    clang-19
i386        buildonly-randconfig-002-20250116    clang-19
i386        buildonly-randconfig-003-20250116    clang-19
i386        buildonly-randconfig-004-20250116    clang-19
i386        buildonly-randconfig-005-20250116    clang-19
i386        buildonly-randconfig-006-20250116    clang-19
i386                  randconfig-001-20250116    clang-19
i386                  randconfig-002-20250116    clang-19
i386                  randconfig-003-20250116    clang-19
i386                  randconfig-004-20250116    clang-19
i386                  randconfig-005-20250116    clang-19
i386                  randconfig-006-20250116    clang-19
i386                  randconfig-007-20250116    clang-19
i386                  randconfig-011-20250116    gcc-12
i386                  randconfig-012-20250116    gcc-12
i386                  randconfig-013-20250116    gcc-12
i386                  randconfig-014-20250116    gcc-12
i386                  randconfig-015-20250116    gcc-12
i386                  randconfig-016-20250116    gcc-12
i386                  randconfig-017-20250116    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250116    clang-20
loongarch             randconfig-002-20250116    clang-20
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250116    clang-20
nios2                 randconfig-002-20250116    clang-20
parisc                randconfig-001-20250116    clang-20
parisc                randconfig-002-20250116    clang-20
powerpc                   bluestone_defconfig    clang-16
powerpc                      ep88xc_defconfig    clang-16
powerpc                          g5_defconfig    clang-16
powerpc                    gamecube_defconfig    clang-16
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                     ppa8548_defconfig    clang-16
powerpc               randconfig-001-20250116    clang-20
powerpc               randconfig-002-20250116    clang-20
powerpc               randconfig-003-20250116    clang-20
powerpc                    sam440ep_defconfig    clang-16
powerpc64             randconfig-001-20250116    clang-20
powerpc64             randconfig-002-20250116    clang-20
powerpc64             randconfig-003-20250116    clang-20
riscv                 randconfig-001-20250116    gcc-14.2.0
riscv                 randconfig-002-20250116    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250116    gcc-14.2.0
s390                  randconfig-002-20250116    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250116    gcc-14.2.0
sh                    randconfig-002-20250116    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250116    gcc-14.2.0
sparc                 randconfig-002-20250116    gcc-14.2.0
sparc64               randconfig-001-20250116    gcc-14.2.0
sparc64               randconfig-002-20250116    gcc-14.2.0
um                    randconfig-001-20250116    gcc-14.2.0
um                    randconfig-002-20250116    gcc-14.2.0
x86_64                randconfig-001-20250116    gcc-12
x86_64                randconfig-002-20250116    gcc-12
x86_64                randconfig-003-20250116    gcc-12
x86_64                randconfig-004-20250116    gcc-12
x86_64                randconfig-005-20250116    gcc-12
x86_64                randconfig-006-20250116    gcc-12
x86_64                randconfig-007-20250116    gcc-12
x86_64                randconfig-008-20250116    gcc-12
x86_64                randconfig-071-20250116    gcc-12
x86_64                randconfig-072-20250116    gcc-12
x86_64                randconfig-073-20250116    gcc-12
x86_64                randconfig-074-20250116    gcc-12
x86_64                randconfig-075-20250116    gcc-12
x86_64                randconfig-076-20250116    gcc-12
x86_64                randconfig-077-20250116    gcc-12
x86_64                randconfig-078-20250116    gcc-12
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250116    gcc-14.2.0
xtensa                randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


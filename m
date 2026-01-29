Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720CED73E89
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uwOrKw1yfbFCzFLKtnVgYF56d1VTqctYewT1SDZ74XA=; b=A8TtY/QalTNIShV6A6/ds9PNF6
	rowK4H6mr8L1V75H+w7s2+nqrxBrOVbHBvxA9qPUWiT12r1wsSx+EMwuSyMoazjtPsj/h+sOK5kR9
	YULbpi8vwNMUpCw0W/K7bFut8+qgodkIxEY7mbLF9DQlKQbPHEINYnjkKGqzPtvV8Jbb16hP1Rzgh
	qz02zfiRLrWZI+585rNKfLQrV4PJHID9fZqQe0o+cjsymXUq9q3G6EUHQyQa+ChdlHL1kXXZSnk0c
	Y+j37BH7PGi6TcuLy7zSj1rSULsCEjfYoz8c4fuSS8PbvwwMHR6wZyDHKc4ELyxCJ0DRWuEYVzXQl
	9NfRnepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZCe-00000000dxs-1GfK;
	Thu, 29 Jan 2026 21:05:24 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZCX-00000000dwj-1SkA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769720717; x=1801256717;
  h=date:from:to:cc:subject:message-id;
  bh=YvzUbORK5/8I7sn3P/NtEXw22ZAzHQb5TwiNyXpsO4Q=;
  b=dc4JD3uyLhwptyDG6PoUxWyq/8/jVcjLXhpTLW1YMujBm1HbjsWIjqRR
   B2D2imPSSVHDrnKG1527+JcIDer0vEbJIkPdnnitspVjV8dUtbQ+5yslJ
   sBp23o9K7my9szv4KJL0cEEyJwW056GegzegfKBDwuLVb4srAHXNi+Xvr
   zAoqiIj2ebFg9vIDWvHmOJXooKWOesXQZM3O2KefdIHT1UGbRA/wPuppI
   K4X6cMW9+mLNAFKMqWxOliFKDjgsyRX2xZ65eiCoSkIX48rLiBvF6zwcG
   JI1LIYAPJjnHGs7/TpAyRCgHdzLFkdnpOz9fYHapndz17z1/PpQjafM8F
   Q==;
X-CSE-ConnectionGUID: ScqU9btKTt2r1tIAvK8Hiw==
X-CSE-MsgGUID: X3zZK0oWQDGHUjoY7Rt3wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81288984"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="81288984"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 13:05:17 -0800
X-CSE-ConnectionGUID: fcvQatXRRGWXp37Ba/IsnA==
X-CSE-MsgGUID: tG0cCsG3TV2P9PCNeU4PgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208792451"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Jan 2026 13:05:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlZCS-00000000bsO-1Uff;
	Thu, 29 Jan 2026 21:05:12 +0000
Date: Fri, 30 Jan 2026 05:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:ti/defconfig] BUILD SUCCESS
 65428481cf6e174cc1bb45444ddc7489e3f2ef0d
Message-ID: <202601300551.tgfFum9j-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_130517_489969_49610999 
X-CRM114-Status: UNSURE (   5.16  )
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
branch HEAD: 65428481cf6e174cc1bb45444ddc7489e3f2ef0d  arm64: defconfig: Enable configurations for Kontron SMARC-sAM67

elapsed time: 723m

configs tested: 229
configs skipped: 156

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260129    clang-18
arc                   randconfig-001-20260130    clang-17
arc                   randconfig-002-20260129    clang-18
arc                   randconfig-002-20260130    clang-17
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-22
arm                          moxart_defconfig    clang-22
arm                        mvebu_v5_defconfig    clang-22
arm                   randconfig-001-20260129    clang-18
arm                   randconfig-001-20260130    clang-17
arm                   randconfig-002-20260129    clang-18
arm                   randconfig-002-20260130    clang-17
arm                   randconfig-003-20260129    clang-18
arm                   randconfig-003-20260130    clang-17
arm                   randconfig-004-20260129    clang-18
arm                   randconfig-004-20260130    clang-17
arm                           stm32_defconfig    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260129    gcc-11.5.0
arm64                 randconfig-001-20260130    gcc-8.5.0
arm64                 randconfig-002-20260129    gcc-11.5.0
arm64                 randconfig-002-20260130    gcc-8.5.0
arm64                 randconfig-003-20260129    gcc-11.5.0
arm64                 randconfig-003-20260130    gcc-8.5.0
arm64                 randconfig-004-20260129    gcc-11.5.0
arm64                 randconfig-004-20260130    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260129    gcc-11.5.0
csky                  randconfig-001-20260130    gcc-8.5.0
csky                  randconfig-002-20260129    gcc-11.5.0
csky                  randconfig-002-20260130    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260129    clang-22
hexagon               randconfig-002-20260129    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260129    clang-20
i386        buildonly-randconfig-002-20260129    clang-20
i386        buildonly-randconfig-003-20260129    clang-20
i386        buildonly-randconfig-004-20260129    clang-20
i386        buildonly-randconfig-005-20260129    clang-20
i386        buildonly-randconfig-006-20260129    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260129    clang-20
i386                  randconfig-002-20260129    clang-20
i386                  randconfig-003-20260129    clang-20
i386                  randconfig-004-20260129    clang-20
i386                  randconfig-005-20260129    clang-20
i386                  randconfig-006-20260129    clang-20
i386                  randconfig-007-20260129    clang-20
i386                  randconfig-011-20260129    clang-20
i386                  randconfig-011-20260130    clang-20
i386                  randconfig-012-20260129    clang-20
i386                  randconfig-012-20260130    clang-20
i386                  randconfig-013-20260129    clang-20
i386                  randconfig-013-20260130    clang-20
i386                  randconfig-014-20260129    clang-20
i386                  randconfig-014-20260130    clang-20
i386                  randconfig-015-20260129    clang-20
i386                  randconfig-015-20260130    clang-20
i386                  randconfig-016-20260129    clang-20
i386                  randconfig-016-20260130    clang-20
i386                  randconfig-017-20260129    clang-20
i386                  randconfig-017-20260130    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260129    clang-22
loongarch             randconfig-002-20260129    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                          atari_defconfig    clang-22
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260129    clang-22
nios2                 randconfig-002-20260129    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260129    gcc-8.5.0
parisc                randconfig-001-20260130    gcc-8.5.0
parisc                randconfig-002-20260129    gcc-8.5.0
parisc                randconfig-002-20260130    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                     ep8248e_defconfig    clang-22
powerpc                     ksi8560_defconfig    clang-22
powerpc               randconfig-001-20260129    gcc-8.5.0
powerpc               randconfig-001-20260130    gcc-8.5.0
powerpc               randconfig-002-20260129    gcc-8.5.0
powerpc               randconfig-002-20260130    gcc-8.5.0
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20260129    gcc-8.5.0
powerpc64             randconfig-001-20260130    gcc-8.5.0
powerpc64             randconfig-002-20260129    gcc-8.5.0
powerpc64             randconfig-002-20260130    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260129    gcc-15.2.0
riscv                 randconfig-001-20260130    clang-22
riscv                 randconfig-002-20260129    gcc-15.2.0
riscv                 randconfig-002-20260130    clang-22
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260129    gcc-15.2.0
s390                  randconfig-001-20260130    clang-22
s390                  randconfig-002-20260129    gcc-15.2.0
s390                  randconfig-002-20260130    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260129    gcc-15.2.0
sh                    randconfig-001-20260130    clang-22
sh                    randconfig-002-20260129    gcc-15.2.0
sh                    randconfig-002-20260130    clang-22
sh                          rsk7201_defconfig    clang-22
sh                          rsk7269_defconfig    clang-22
sh                           se7705_defconfig    clang-22
sh                           se7722_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260129    gcc-15.2.0
sparc                 randconfig-001-20260130    clang-22
sparc                 randconfig-002-20260129    gcc-15.2.0
sparc                 randconfig-002-20260130    clang-22
sparc                       sparc32_defconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260129    gcc-15.2.0
sparc64               randconfig-001-20260130    clang-22
sparc64               randconfig-002-20260129    gcc-15.2.0
sparc64               randconfig-002-20260130    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260129    gcc-15.2.0
um                    randconfig-001-20260130    clang-22
um                    randconfig-002-20260129    gcc-15.2.0
um                    randconfig-002-20260130    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260129    gcc-13
x86_64      buildonly-randconfig-002-20260129    gcc-13
x86_64      buildonly-randconfig-003-20260129    gcc-13
x86_64      buildonly-randconfig-004-20260129    gcc-13
x86_64      buildonly-randconfig-005-20260129    gcc-13
x86_64      buildonly-randconfig-006-20260129    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260129    clang-20
x86_64                randconfig-001-20260130    clang-20
x86_64                randconfig-002-20260129    clang-20
x86_64                randconfig-002-20260130    clang-20
x86_64                randconfig-003-20260129    clang-20
x86_64                randconfig-003-20260130    clang-20
x86_64                randconfig-004-20260129    clang-20
x86_64                randconfig-004-20260130    clang-20
x86_64                randconfig-005-20260129    clang-20
x86_64                randconfig-005-20260130    clang-20
x86_64                randconfig-006-20260129    clang-20
x86_64                randconfig-006-20260130    clang-20
x86_64                randconfig-011-20260129    clang-20
x86_64                randconfig-012-20260129    clang-20
x86_64                randconfig-013-20260129    clang-20
x86_64                randconfig-014-20260129    clang-20
x86_64                randconfig-015-20260129    clang-20
x86_64                randconfig-016-20260129    clang-20
x86_64                randconfig-071-20260129    gcc-14
x86_64                randconfig-072-20260129    gcc-14
x86_64                randconfig-073-20260129    gcc-14
x86_64                randconfig-074-20260129    gcc-14
x86_64                randconfig-075-20260129    gcc-14
x86_64                randconfig-076-20260129    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260129    gcc-15.2.0
xtensa                randconfig-001-20260130    clang-22
xtensa                randconfig-002-20260129    gcc-15.2.0
xtensa                randconfig-002-20260130    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33A1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VzMtEEqRPMKU40RWWbLMfin1UdCsSuB4HU56yro8pEM=; b=zuldx4YHYeK6JW/ztY7PKJjAeY
	RNi8nvZi7qwlfSlkZktXkbQWNVlMI0Lh5H6WvX2F8/diR2dCAHxXp0Kl1DeDqCLxObWrJhaTgYlJw
	0m9Lzf0516bSkcBfLZlBf7r0S7P52260/bdLHYV011vv72dZprULUF4tSR3pQKOzkrItwBRpkIxwH
	wdHBy5yDo9pih7mnzeio8hRJUunWPmKbjKNJGChnsXo6J78ZAw0I/nm9ZrVmyIeTYfPApuPP33w3y
	JVLYkBkQltS6JQhMqFRGESa+Ga0L3PQpOCCv//rW2TXTkoEgLuHjV+m5oX5eUO4eZSjRa/OcahH1I
	LKS5A6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWNiZ-0000000HA9m-0XO0;
	Fri, 10 Jan 2025 22:43:03 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWNhK-0000000H9yX-0X5q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 22:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736548906; x=1768084906;
  h=date:from:to:cc:subject:message-id;
  bh=QbollDvY/A/7eQBJ4jy/YSV9hFhV59DLGYiZtt1nr68=;
  b=HlhIFkfXrT0Urv7pMmnHtz6N9glt0h7OU/BsgaUMT7iZKqkgMr6ZvRUa
   iA9zJouwJhqqLeRxPXCTg3TIL/l05ybKk2s9ijgHLE+MBlMdbUhcGgclU
   Z0ZZmG91jqUbdEiueWxb4VJqVi3apCtQs5CJdgKprFK4kj9O/jQD5Koe3
   RZiZmejlLwGe4y9qnfilI580Rp9M7tW2uSi/tz4Eo6RgOqL/f3MeFo+H0
   aetLH7ssaur2MHo2bSGx+r57vUi+ZBoB5DN8AZjXtkh7EqdpOb5Tg/swp
   pj5kNz8EuaYhvmem5tMssLIJ9Mi6Nj0F5ild2Fj9EuIIEk0U4yrFiP3WO
   A==;
X-CSE-ConnectionGUID: AXix8Ia3Q06vOcUdmVYq3A==
X-CSE-MsgGUID: q6XDL5UQShO2c3LDIB1BUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62227459"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="62227459"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 14:41:40 -0800
X-CSE-ConnectionGUID: X/r+tiQ7S3K70iZqRUXiFg==
X-CSE-MsgGUID: zXt9k7aUQYa8GRttyWLVgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="103665080"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jan 2025 14:41:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWNhA-000JqN-1n;
	Fri, 10 Jan 2025 22:41:36 +0000
Date: Sat, 11 Jan 2025 06:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 155c5bf26f983e9988333eeb0ef217138304d13b
Message-ID: <202501110636.I4MY1ugP-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_144146_215118_A6DE3930 
X-CRM114-Status: UNSURE (   5.55  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: 155c5bf26f983e9988333eeb0ef217138304d13b  firewall: remove misplaced semicolon from stm32_firewall_get_firewall

elapsed time: 1468m

configs tested: 234
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250110    gcc-13.2.0
arc                   randconfig-001-20250111    clang-18
arc                   randconfig-002-20250110    gcc-13.2.0
arc                   randconfig-002-20250111    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    clang-20
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20250110    clang-20
arm                   randconfig-001-20250111    clang-18
arm                   randconfig-002-20250110    gcc-14.2.0
arm                   randconfig-002-20250111    clang-18
arm                   randconfig-003-20250110    clang-19
arm                   randconfig-003-20250111    clang-18
arm                   randconfig-004-20250110    gcc-14.2.0
arm                   randconfig-004-20250111    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250110    gcc-14.2.0
arm64                 randconfig-001-20250111    clang-18
arm64                 randconfig-002-20250110    gcc-14.2.0
arm64                 randconfig-002-20250111    clang-18
arm64                 randconfig-003-20250110    clang-17
arm64                 randconfig-003-20250111    clang-18
arm64                 randconfig-004-20250110    gcc-14.2.0
arm64                 randconfig-004-20250111    clang-18
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250110    gcc-14.2.0
csky                  randconfig-001-20250111    gcc-14.2.0
csky                  randconfig-002-20250110    gcc-14.2.0
csky                  randconfig-002-20250111    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250110    clang-20
hexagon               randconfig-001-20250111    gcc-14.2.0
hexagon               randconfig-002-20250110    clang-20
hexagon               randconfig-002-20250111    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250110    clang-19
i386        buildonly-randconfig-001-20250111    gcc-11
i386        buildonly-randconfig-002-20250110    clang-19
i386        buildonly-randconfig-002-20250111    gcc-11
i386        buildonly-randconfig-003-20250110    clang-19
i386        buildonly-randconfig-003-20250111    gcc-11
i386        buildonly-randconfig-004-20250110    gcc-12
i386        buildonly-randconfig-004-20250111    gcc-11
i386        buildonly-randconfig-005-20250110    gcc-12
i386        buildonly-randconfig-005-20250111    gcc-11
i386        buildonly-randconfig-006-20250110    clang-19
i386        buildonly-randconfig-006-20250111    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20250111    clang-19
i386                  randconfig-002-20250111    clang-19
i386                  randconfig-003-20250111    clang-19
i386                  randconfig-004-20250111    clang-19
i386                  randconfig-005-20250111    clang-19
i386                  randconfig-006-20250111    clang-19
i386                  randconfig-007-20250111    clang-19
i386                  randconfig-011-20250111    clang-19
i386                  randconfig-012-20250111    clang-19
i386                  randconfig-013-20250111    clang-19
i386                  randconfig-014-20250111    clang-19
i386                  randconfig-015-20250111    clang-19
i386                  randconfig-016-20250111    clang-19
i386                  randconfig-017-20250111    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250110    gcc-14.2.0
loongarch             randconfig-001-20250111    gcc-14.2.0
loongarch             randconfig-002-20250110    gcc-14.2.0
loongarch             randconfig-002-20250111    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
mips                        vocore2_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250110    gcc-14.2.0
nios2                 randconfig-001-20250111    gcc-14.2.0
nios2                 randconfig-002-20250110    gcc-14.2.0
nios2                 randconfig-002-20250111    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250110    gcc-14.2.0
parisc                randconfig-001-20250111    gcc-14.2.0
parisc                randconfig-002-20250110    gcc-14.2.0
parisc                randconfig-002-20250111    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc               randconfig-001-20250110    clang-20
powerpc               randconfig-001-20250111    gcc-14.2.0
powerpc               randconfig-002-20250110    clang-20
powerpc               randconfig-002-20250111    gcc-14.2.0
powerpc               randconfig-003-20250110    clang-20
powerpc               randconfig-003-20250111    gcc-14.2.0
powerpc64             randconfig-001-20250110    clang-17
powerpc64             randconfig-001-20250111    gcc-14.2.0
powerpc64             randconfig-002-20250110    clang-19
powerpc64             randconfig-002-20250111    gcc-14.2.0
powerpc64             randconfig-003-20250110    clang-17
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250110    clang-17
riscv                 randconfig-001-20250111    gcc-14.2.0
riscv                 randconfig-002-20250110    clang-20
riscv                 randconfig-002-20250111    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250110    gcc-14.2.0
s390                  randconfig-001-20250111    gcc-14.2.0
s390                  randconfig-002-20250110    gcc-14.2.0
s390                  randconfig-002-20250111    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20250110    gcc-14.2.0
sh                    randconfig-001-20250111    gcc-14.2.0
sh                    randconfig-002-20250110    gcc-14.2.0
sh                    randconfig-002-20250111    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                          rsk7203_defconfig    clang-20
sh                           sh2007_defconfig    clang-20
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sh                              ul2_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250110    gcc-14.2.0
sparc                 randconfig-001-20250111    gcc-14.2.0
sparc                 randconfig-002-20250110    gcc-14.2.0
sparc                 randconfig-002-20250111    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250110    gcc-14.2.0
sparc64               randconfig-001-20250111    gcc-14.2.0
sparc64               randconfig-002-20250110    gcc-14.2.0
sparc64               randconfig-002-20250111    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250110    clang-20
um                    randconfig-001-20250111    gcc-14.2.0
um                    randconfig-002-20250110    gcc-12
um                    randconfig-002-20250111    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250110    gcc-12
x86_64      buildonly-randconfig-001-20250111    clang-19
x86_64      buildonly-randconfig-002-20250110    clang-19
x86_64      buildonly-randconfig-002-20250111    clang-19
x86_64      buildonly-randconfig-003-20250110    clang-19
x86_64      buildonly-randconfig-003-20250111    clang-19
x86_64      buildonly-randconfig-004-20250110    gcc-12
x86_64      buildonly-randconfig-004-20250111    clang-19
x86_64      buildonly-randconfig-005-20250110    clang-19
x86_64      buildonly-randconfig-005-20250111    clang-19
x86_64      buildonly-randconfig-006-20250110    clang-19
x86_64      buildonly-randconfig-006-20250111    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250111    clang-19
x86_64                randconfig-002-20250111    clang-19
x86_64                randconfig-003-20250111    clang-19
x86_64                randconfig-004-20250111    clang-19
x86_64                randconfig-005-20250111    clang-19
x86_64                randconfig-006-20250111    clang-19
x86_64                randconfig-007-20250111    clang-19
x86_64                randconfig-008-20250111    clang-19
x86_64                randconfig-071-20250111    gcc-12
x86_64                randconfig-072-20250111    gcc-12
x86_64                randconfig-073-20250111    gcc-12
x86_64                randconfig-074-20250111    gcc-12
x86_64                randconfig-075-20250111    gcc-12
x86_64                randconfig-076-20250111    gcc-12
x86_64                randconfig-077-20250111    gcc-12
x86_64                randconfig-078-20250111    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250110    gcc-14.2.0
xtensa                randconfig-001-20250111    gcc-14.2.0
xtensa                randconfig-002-20250110    gcc-14.2.0
xtensa                randconfig-002-20250111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


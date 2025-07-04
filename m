Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3E4C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 21:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gT/kE2FbqcydtbANQy4bEzpXBOWokCdE192f4lpw46w=; b=3Jxo9VCHXDRnRWFgdyMhcJfZ5T
	sHwEJeJvWe8Hhi9NaaLzP/rt2iMNJAKtX52CA1U4jFoAZCdtJNccg1f0JoGYYZrCBJ4QejYDryj/s
	oE5Z6KTYoooU6qEoOZKblVZyMU+9aC3oNAf424C9ZxjrNA7o8OmQFQVlZgj/shuY7Vbr2KPsMz86L
	b77UGOSAqK63ESr6flMO8xkkp1d6YZTEIv0ZX1s2CcIoXNH/rZr3aLALYusBAIHu7QMqHxSrE72XZ
	2eqHFqVFnytecCKiiMRNZc1Zsau4VRbl/KZw6U5eU2N47reAlZpfH1J/0Hb8BEB/u+WRv919O0qw5
	u1OY1NKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXoJO-0000000FYZI-1uzr;
	Fri, 04 Jul 2025 21:51:14 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXoH1-0000000FYNa-1OpO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 21:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751665727; x=1783201727;
  h=date:from:to:cc:subject:message-id;
  bh=1ApMdvcuHi/U4jmw42xfLo6nf+LkGA2NDX/+ISjjiSc=;
  b=Y2sbVKy+99eAUrEpOStl3Kide6USS2jsTkPT4iZIIUVEDGJ0Nq5uJUD6
   tKu8gEPoA095QNT0tehsB0mIz4OXcTzgZrdY1gBGA9gbaM4cymMCzhD9P
   Uez0KPjduNR3S3AS/iFVM+E6lnkQoRk9ZawNPQHPGAKRZTpRP2LCAheOf
   6AibdAHCzBFJ0wMLnTHxtu6rgcmyTILlC/G+29Rqho8Tik/tmqYYKpi7H
   cBHVLPRjTX/5buOmcuv1isDy5l5xtNFlHqCoQG3qPPmT05NbJgLEsb5kB
   2Vq9iL8RVP93SLDr1N2FrViKlTHIIpkIRuYL80sSbN9TmVff+aipdIbwa
   g==;
X-CSE-ConnectionGUID: 9VVbByl8RX6hEywDnO5ENA==
X-CSE-MsgGUID: 0DpDPvbRSTW0Sa58K+9fYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="56617640"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="56617640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 14:48:45 -0700
X-CSE-ConnectionGUID: xJQ7q6rjSDSPnzFDiSk5mg==
X-CSE-MsgGUID: CZVqH4nFSZGCEXjnQmHcTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="155291214"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jul 2025 14:48:44 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXoGw-00046h-0L;
	Fri, 04 Jul 2025 21:48:42 +0000
Date: Sat, 05 Jul 2025 05:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 241a3be4775651703bfd25531a618825458fcf54
Message-ID: <202507050554.CApIfUGo-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_144847_387010_AE587ABC 
X-CRM114-Status: UNSURE (   5.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/defconfig
branch HEAD: 241a3be4775651703bfd25531a618825458fcf54  Merge tag 'arm-soc/for-6.17/defconfig-arm64' of https://github.com/Broadcom/stblinux into soc/defconfig

elapsed time: 735m

configs tested: 130
configs skipped: 110

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
arc                               allnoconfig    clang-21
arc                   randconfig-001-20250705    clang-21
arc                   randconfig-002-20250705    clang-21
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250704    gcc-8.5.0
arm                   randconfig-001-20250705    clang-21
arm                   randconfig-002-20250704    clang-21
arm                   randconfig-002-20250705    clang-21
arm                   randconfig-003-20250704    gcc-8.5.0
arm                   randconfig-003-20250705    clang-21
arm                   randconfig-004-20250704    gcc-13.4.0
arm                   randconfig-004-20250705    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250704    gcc-14.3.0
arm64                 randconfig-001-20250705    clang-21
arm64                 randconfig-002-20250704    clang-21
arm64                 randconfig-002-20250705    clang-21
arm64                 randconfig-003-20250704    clang-16
arm64                 randconfig-003-20250705    clang-21
arm64                 randconfig-004-20250704    gcc-10.5.0
arm64                 randconfig-004-20250705    clang-21
csky                              allnoconfig    clang-21
csky                  randconfig-001-20250705    gcc-9.3.0
csky                  randconfig-002-20250705    gcc-9.3.0
hexagon                           allnoconfig    clang-21
hexagon               randconfig-001-20250705    gcc-9.3.0
hexagon               randconfig-002-20250705    gcc-9.3.0
i386        buildonly-randconfig-001-20250705    gcc-12
i386        buildonly-randconfig-002-20250705    gcc-12
i386        buildonly-randconfig-003-20250705    gcc-12
i386        buildonly-randconfig-004-20250705    gcc-12
i386        buildonly-randconfig-005-20250705    gcc-12
i386        buildonly-randconfig-006-20250705    gcc-12
i386                  randconfig-001-20250705    gcc-12
i386                  randconfig-002-20250705    gcc-12
i386                  randconfig-003-20250705    gcc-12
i386                  randconfig-004-20250705    gcc-12
i386                  randconfig-005-20250705    gcc-12
i386                  randconfig-006-20250705    gcc-12
i386                  randconfig-007-20250705    gcc-12
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250705    gcc-9.3.0
loongarch             randconfig-002-20250705    gcc-9.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250705    gcc-9.3.0
nios2                 randconfig-002-20250705    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250705    gcc-9.3.0
parisc                randconfig-002-20250705    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                       ebony_defconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250705    gcc-9.3.0
powerpc               randconfig-002-20250705    gcc-9.3.0
powerpc               randconfig-003-20250705    gcc-9.3.0
powerpc64             randconfig-001-20250705    gcc-9.3.0
powerpc64             randconfig-002-20250705    gcc-9.3.0
powerpc64             randconfig-003-20250705    gcc-9.3.0
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250705    gcc-12
riscv                 randconfig-002-20250705    gcc-12
s390                              allnoconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250705    gcc-12
s390                  randconfig-002-20250705    gcc-12
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250705    gcc-12
sh                    randconfig-002-20250705    gcc-12
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250705    gcc-12
sparc                 randconfig-002-20250705    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250705    gcc-12
sparc64               randconfig-002-20250705    gcc-12
um                                allnoconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250705    gcc-12
um                    randconfig-002-20250705    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64      buildonly-randconfig-001-20250705    gcc-12
x86_64      buildonly-randconfig-002-20250705    gcc-12
x86_64      buildonly-randconfig-003-20250705    gcc-12
x86_64      buildonly-randconfig-004-20250705    gcc-12
x86_64      buildonly-randconfig-005-20250705    gcc-12
x86_64      buildonly-randconfig-006-20250705    gcc-12
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250705    clang-20
x86_64                randconfig-002-20250705    clang-20
x86_64                randconfig-003-20250705    clang-20
x86_64                randconfig-004-20250705    clang-20
x86_64                randconfig-005-20250705    clang-20
x86_64                randconfig-006-20250705    clang-20
x86_64                randconfig-007-20250705    clang-20
x86_64                randconfig-008-20250705    clang-20
x86_64                randconfig-071-20250705    clang-20
x86_64                randconfig-072-20250705    clang-20
x86_64                randconfig-073-20250705    clang-20
x86_64                randconfig-074-20250705    clang-20
x86_64                randconfig-075-20250705    clang-20
x86_64                randconfig-076-20250705    clang-20
x86_64                randconfig-077-20250705    clang-20
x86_64                randconfig-078-20250705    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250705    gcc-12
xtensa                randconfig-002-20250705    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


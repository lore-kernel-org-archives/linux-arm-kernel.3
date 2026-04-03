Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51916E7E363
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lmNZhVF7kVWJx42RnBDqbRJ2agbwuAuGLJKRFuEr6AM=; b=LhLVFnRQkL+sMTC1zWZsSfyICf
	wyyKQZZlKvMOiW7FSP88TyqU/0amzkJq5WcgWGR8wr0adqtWAxsZwrB8/Al2ugonilAU8gHDMLWKz
	h/UDwTjdhb5oBMqV/YbrEyLGGQdn7BJlV9Qr0Yi/f3zHrDXgLGfweoN7T3wJCp9tHIafNn1NUFJEZ
	1PK4YVWMPRAyo2lWeRVHOrOIJQOfvi5DtmcZuGbc7uf1ZqPMyI3CGUZhXiMEBZf5t88/kddTyYqSg
	Dzdw8gPHVhWgOaWjwF2/tqAiTm4cB9EnPC16HoJikkSgsdxMaObz/tGO4OzP/9RqzfjS4xvafLclg
	XuEcvXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bSu-00000001reO-2YHd;
	Fri, 03 Apr 2026 10:09:24 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bSr-00000001rdm-2P3O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 10:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775210961; x=1806746961;
  h=date:from:to:cc:subject:message-id;
  bh=/jr4eJke97JDTDVbopTr//DREEQXLl+ealBG2ZSncGo=;
  b=a5gF6DZCzt2SvOFb8CIJ99AlsPQ168Tj1MPUS513MpVAxRVK0MlJdj5l
   sth04fysCZu1qS/Cub5ZmGAWHZhttAPsY/fZZFdM8xq1baHzBLYBx3WC+
   dJGy+ZTaVsYg/ST6kPY0fFNwgQnT3Syyvfaj0kJH+Bl+M1/K4XqPjcTDq
   mKZoWkVvKueLAwG4CQhr3oZ6rECISSR7SPCIgpAj7Bf0wfQjjtCWvHl0B
   1fyfvA1XVFxtVO6wKFi8F3/Bcbm6rJqzmuqHxQNwCI/8iwTTlVM/STWHC
   SVtlOVZtY3nfbPBK8kwuaY1TAtukW2zppdBGOxq3I8yR657/UPFNh1e6m
   Q==;
X-CSE-ConnectionGUID: eIuvJIitQi2rxGE+CQM4cw==
X-CSE-MsgGUID: WvG2SAmQTQ+ksIYZZ+ewzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75997551"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75997551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 03:09:20 -0700
X-CSE-ConnectionGUID: 7ugJ78FpQbG3ZAGogkJpZw==
X-CSE-MsgGUID: B/UPfZoTQAyQxKVDq67c4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223963779"
Received: from lkp-server01.sh.intel.com (HELO c7fa6caadbb2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 03:09:18 -0700
Received: from kbuild by c7fa6caadbb2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8bSm-0000000003t-2n7h;
	Fri, 03 Apr 2026 10:09:16 +0000
Date: Fri, 03 Apr 2026 18:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 16695153f8af940c55d21ee270ca0faef7414b30
Message-ID: <202604031855.skmvs0Dp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_030921_688683_E672254A 
X-CRM114-Status: UNSURE (   5.31  )
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
branch HEAD: 16695153f8af940c55d21ee270ca0faef7414b30  Merge tag 'omap-for-v7.1/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm

elapsed time: 736m

configs tested: 173
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260403    gcc-10.5.0
arc                   randconfig-002-20260403    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         orion5x_defconfig    clang-23
arm                   randconfig-001-20260403    gcc-10.5.0
arm                   randconfig-002-20260403    gcc-10.5.0
arm                   randconfig-003-20260403    gcc-10.5.0
arm                   randconfig-004-20260403    gcc-10.5.0
arm                         vf610m4_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-004-20260403    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-002-20260403    gcc-13.4.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-002-20260403    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-006-20260403    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260403    gcc-14
i386                  randconfig-002-20260403    gcc-14
i386                  randconfig-003-20260403    gcc-14
i386                  randconfig-004-20260403    gcc-14
i386                  randconfig-005-20260403    gcc-14
i386                  randconfig-006-20260403    gcc-14
i386                  randconfig-007-20260403    gcc-14
i386                  randconfig-011-20260403    clang-20
i386                  randconfig-012-20260403    clang-20
i386                  randconfig-013-20260403    clang-20
i386                  randconfig-014-20260403    clang-20
i386                  randconfig-015-20260403    clang-20
i386                  randconfig-016-20260403    clang-20
i386                  randconfig-017-20260403    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-002-20260403    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-002-20260403    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260403    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260403    clang-23
riscv                 randconfig-002-20260403    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260403    clang-23
s390                  randconfig-002-20260403    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                     magicpanelr2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260403    clang-23
sh                    randconfig-002-20260403    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-002-20260403    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-002-20260403    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-002-20260403    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260403    clang-20
x86_64                randconfig-002-20260403    clang-20
x86_64                randconfig-003-20260403    clang-20
x86_64                randconfig-004-20260403    clang-20
x86_64                randconfig-005-20260403    clang-20
x86_64                randconfig-006-20260403    clang-20
x86_64                randconfig-011-20260403    gcc-14
x86_64                randconfig-012-20260403    gcc-14
x86_64                randconfig-013-20260403    gcc-14
x86_64                randconfig-014-20260403    gcc-14
x86_64                randconfig-015-20260403    gcc-14
x86_64                randconfig-016-20260403    gcc-14
x86_64                randconfig-071-20260403    gcc-14
x86_64                randconfig-072-20260403    gcc-14
x86_64                randconfig-073-20260403    gcc-14
x86_64                randconfig-074-20260403    gcc-14
x86_64                randconfig-075-20260403    gcc-14
x86_64                randconfig-076-20260403    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-002-20260403    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


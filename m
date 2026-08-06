Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F0EC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oYE/eJ+BHTU4p8ztaJG0efdI6Z1eSoFJzPCiaxVtShU=; b=ahSAXWYHacjrGTHGkkeT7wDFPq
	znaF66VCK4rUZ+SiQ+qcbQf0Fmk6OIXQMTD8EbZN6xKdJ2UG2uuJQpOEeexQhgDa09+oe5ByCt/xM
	HWft/SMda02o84vY0Wm1qaAZQntRNWK0YNQE30Cmg7JRda6b405Px6puizU5aolpQ6WwJ7yeVpsbg
	Jh+KEYFYmWIP4qbW8LJ+9avyqZvXwf1QcvtnlQzmuGxE9dWrGNiHrXcj4aw6hX7e3I635R9c0KmbJ
	f1qAvzU0jNjAWz3OyDmt3zCJ8rlMEWB9AOzAM2TzIuL5R1Ab7JKdrICT3a3lJFmr7/v38/kwH/cBU
	cNpZkYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5k2-00000006k0D-1br4;
	Thu, 06 Aug 2026 21:35:06 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5jz-00000006jzG-3lsk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786052104; x=1817588104;
  h=date:from:to:cc:subject:message-id;
  bh=IbFRQX/TsKggMG8gBlFp0hMhNQxYKwLckP+f3PtChF8=;
  b=KUzdvLBpBV2DWvLTCbsHn2YspG1pco6ONUy9wZb8KVRQKXaCM4WPNDh3
   asWmK9oX9apHPemx9VNb3HG+5WxWaNUU/F70uHyi3nVQhpg232USytNkR
   zlPPZ6AThGCqe7MbVn9kQr9a6nl7By3XSYp3u8XN6T7Vv5WpA4ff+IEMG
   NPFY4U19zawLTzWnrOg1zRgHBUClJBbtdNg+23YZznEYQ6z5Bbh4ldXZ+
   iCc5YZxv0LNBqZhf3JA2y2iEwEZ9QpcjJxBbLV4t/i/lA7H0Uu6Rb7wep
   6PQuPRHyYfTkdwhvuhBug3ztP7ejabmR/F3V/76cyLJPmKr6QSZHC3Nx5
   w==;
X-CSE-ConnectionGUID: AIf1GvJDRaWgvNsesKMUEg==
X-CSE-MsgGUID: cABpj5OwQBe1dFSGt9XK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86426365"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86426365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:35:04 -0700
X-CSE-ConnectionGUID: 244L1cE+Td2ODRiU4gkaSQ==
X-CSE-MsgGUID: kgdtOTMLRBiPKNYxuWytHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="266059201"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2026 14:35:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws5ju-00000000GHh-41vY;
	Thu, 06 Aug 2026 21:34:58 +0000
Date: Fri, 07 Aug 2026 05:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 1ec9093bc9e42e3f3638506bf8adbaf47b5e3057
Message-ID: <202608070548.iyheyvWW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_143503_985993_0E8CB104 
X-CRM114-Status: UNSURE (   5.45  )
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
branch HEAD: 1ec9093bc9e42e3f3638506bf8adbaf47b5e3057  Merge tag 'tegra-for-7.3-arm-core' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/arm

elapsed time: 2939m

configs tested: 101
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260805    gcc-12.5.0
arc                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-001-20260805    gcc-12.5.0
arm                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-003-20260805    gcc-12.5.0
arm                  randconfig-004-20260805    gcc-12.5.0
arm64                randconfig-001-20260805    gcc-10.5.0
arm64                randconfig-002-20260805    gcc-10.5.0
arm64                randconfig-003-20260805    gcc-10.5.0
arm64                randconfig-004-20260805    gcc-10.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260805    gcc-10.5.0
csky                 randconfig-002-20260805    gcc-10.5.0
hexagon              randconfig-001-20260805    clang-18
hexagon              randconfig-002-20260805    clang-18
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260805    clang-22
i386       buildonly-randconfig-002-20260805    clang-22
i386       buildonly-randconfig-003-20260805    clang-22
i386       buildonly-randconfig-004-20260805    clang-22
i386       buildonly-randconfig-005-20260805    clang-22
i386       buildonly-randconfig-006-20260805    clang-22
i386                 randconfig-001-20260805    gcc-13
i386                 randconfig-002-20260805    gcc-13
i386                 randconfig-003-20260805    gcc-13
i386                 randconfig-004-20260805    gcc-13
i386                 randconfig-005-20260805    gcc-13
i386                 randconfig-006-20260805    gcc-13
i386                 randconfig-007-20260805    gcc-13
i386                 randconfig-011-20260805    gcc-14
i386                 randconfig-012-20260805    gcc-14
i386                 randconfig-013-20260805    gcc-14
i386                 randconfig-014-20260805    gcc-14
i386                 randconfig-015-20260805    gcc-14
i386                 randconfig-016-20260805    gcc-14
i386                 randconfig-017-20260805    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260805    clang-18
loongarch            randconfig-002-20260805    clang-18
mips                          jazz_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260805    clang-18
nios2                randconfig-002-20260805    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260805    gcc-9.5.0
parisc               randconfig-002-20260805    gcc-9.5.0
powerpc              randconfig-001-20260805    gcc-9.5.0
powerpc              randconfig-002-20260805    gcc-9.5.0
powerpc64            randconfig-001-20260805    gcc-9.5.0
powerpc64            randconfig-002-20260805    gcc-9.5.0
riscv                         randconfig-001    gcc-8.5.0
riscv                randconfig-001-20260805    gcc-8.5.0
riscv                randconfig-002-20260805    gcc-8.5.0
s390                            alldefconfig    gcc-16.1.0
s390                 randconfig-001-20260805    gcc-8.5.0
s390                 randconfig-002-20260805    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260805    gcc-8.5.0
sh                   randconfig-002-20260805    gcc-8.5.0
sparc                randconfig-001-20260805    gcc-11.5.0
sparc                randconfig-002-20260805    gcc-11.5.0
sparc64              randconfig-001-20260805    gcc-11.5.0
sparc64              randconfig-002-20260805    gcc-11.5.0
um                   randconfig-001-20260805    gcc-11.5.0
um                   randconfig-002-20260805    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260805    gcc-14
x86_64     buildonly-randconfig-002-20260805    gcc-14
x86_64     buildonly-randconfig-003-20260805    gcc-14
x86_64     buildonly-randconfig-004-20260805    gcc-14
x86_64     buildonly-randconfig-005-20260805    gcc-14
x86_64     buildonly-randconfig-006-20260805    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260805    gcc-14
x86_64               randconfig-002-20260805    gcc-14
x86_64               randconfig-003-20260805    gcc-14
x86_64               randconfig-004-20260805    gcc-14
x86_64               randconfig-005-20260805    gcc-14
x86_64               randconfig-006-20260805    gcc-14
x86_64               randconfig-011-20260805    gcc-14
x86_64               randconfig-012-20260805    gcc-14
x86_64               randconfig-013-20260805    gcc-14
x86_64               randconfig-014-20260805    gcc-14
x86_64               randconfig-015-20260805    gcc-14
x86_64               randconfig-016-20260805    gcc-14
x86_64               randconfig-071-20260805    clang-22
x86_64               randconfig-072-20260805    clang-22
x86_64               randconfig-073-20260805    clang-22
x86_64               randconfig-074-20260805    clang-22
x86_64               randconfig-075-20260805    clang-22
x86_64               randconfig-076-20260805    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260805    gcc-11.5.0
xtensa               randconfig-002-20260805    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


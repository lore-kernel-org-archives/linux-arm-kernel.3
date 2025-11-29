Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F83D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 05:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zivVoquyF45j/Jb6CzYj4uuO8/f0RD8wsvrJPWCcI58=; b=QXY3S2qEUCq9ccCd1kQmLIutOF
	JAapzcdhkxRgmla2qwC8Uhw/rRdpxv4ekGeFrxdGYkXJr/t0vXvC030cvKD1V5BL5MgWwgNzMCzzn
	pR6eKvZhRVh7aJ7rn+mwOya/cHGQX3ClsZDSUOCEKLtXwgOEK3key/gB9basX0CBI+CF4oiVMQUCE
	JoAxJ8ec97quPrWJxjJAuNAeSzBMs1lziTjiu5a5AA7pI4pthhckaPzsNiKZKJD0L+4TLXTRT+MzZ
	cl8jenv+JQhdc+DfU8R4RnjF0NoQcAnAkvLLtcY9+tXGUJ8KnHf5RiYKiav/AaRM1JPTc66B0yEPU
	ZRpEOn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPDKL-00000001IOz-48GV;
	Sat, 29 Nov 2025 05:16:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPDKJ-00000001IOf-0g91
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 05:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764393415; x=1795929415;
  h=date:from:to:cc:subject:message-id;
  bh=5gvIuWtA48wGs5Ev+8rbctd4FzJvJdVlkG8TY84QCbs=;
  b=l2QOeu6ZYIxSgKeRCwvkoZhtBglpGwDMG2kdFPa4Pd2DVHvGKuvYnLX6
   EuY8Qhp1qOBXqquULoMOk0Bgt1UP+Ej5ICPwCtihTxya3RTZdMpELeF1z
   dCKTb3w7kr6UKVi7ftHqw3yt+cIqt82sTGyr06O9aeNayoR0OQ7gIwjXq
   1HZje6H5evBJlEu7XnZIhWcfsh8o5m46i6RB5uYZ4VxdZXNym+ljNh9TR
   3xKyY6z4IBpQW0/YviFPVtcQr5Lzxux2ETaYN0VePOe6vCwqZHDiKhc2R
   NbLQ0GxN5NDulWNF3CHw8vyO/J+sBK1/oI69DlX3dOrSoNQ65rmsFUIn7
   A==;
X-CSE-ConnectionGUID: 56oNZTC6SK+LUxLikh+ueQ==
X-CSE-MsgGUID: 6jRk4YTrSi+5reIdXIGEPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="91881712"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="91881712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 21:16:51 -0800
X-CSE-ConnectionGUID: U5as32tvRDOSGg1J0R3e7g==
X-CSE-MsgGUID: 3CwJ0J2tT/a+j4/DAheHHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="224296662"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2025 21:16:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPDKB-000000006z3-2xaz;
	Sat, 29 Nov 2025 05:16:47 +0000
Date: Sat, 29 Nov 2025 13:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 3aa9940035a17edd4dba87da90a23c4b13cff121
Message-ID: <202511291332.Iz4Mww0D-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_211655_275549_5F3922A3 
X-CRM114-Status: UNSURE (   5.36  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: 3aa9940035a17edd4dba87da90a23c4b13cff121  Merge tag 'riscv-dt-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/dt

elapsed time: 1812m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251128    gcc-8.5.0
arc                   randconfig-002-20251128    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251128    gcc-14.3.0
arm                   randconfig-002-20251128    gcc-8.5.0
arm                   randconfig-003-20251128    clang-22
arm                   randconfig-004-20251128    clang-17
arm                         s3c6400_defconfig    gcc-15.1.0
arm                           u8500_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251129    clang-22
arm64                 randconfig-002-20251129    clang-22
arm64                 randconfig-003-20251129    gcc-8.5.0
arm64                 randconfig-004-20251129    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251129    gcc-15.1.0
csky                  randconfig-002-20251129    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251129    clang-22
hexagon               randconfig-002-20251129    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251129    clang-20
i386        buildonly-randconfig-002-20251129    clang-20
i386        buildonly-randconfig-003-20251129    gcc-14
i386        buildonly-randconfig-004-20251129    gcc-12
i386        buildonly-randconfig-005-20251129    gcc-14
i386        buildonly-randconfig-006-20251129    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251129    gcc-14
i386                  randconfig-002-20251129    gcc-12
i386                  randconfig-003-20251129    clang-20
i386                  randconfig-004-20251129    gcc-14
i386                  randconfig-005-20251129    clang-20
i386                  randconfig-006-20251129    clang-20
i386                  randconfig-007-20251129    gcc-14
i386                  randconfig-011-20251129    clang-20
i386                  randconfig-012-20251129    gcc-13
i386                  randconfig-013-20251129    clang-20
i386                  randconfig-014-20251129    clang-20
i386                  randconfig-015-20251129    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251129    gcc-15.1.0
loongarch             randconfig-002-20251129    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251129    gcc-11.5.0
nios2                 randconfig-002-20251129    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251128    gcc-14.3.0
parisc                randconfig-002-20251128    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      pcm030_defconfig    clang-22
powerpc               randconfig-001-20251128    gcc-11.5.0
powerpc               randconfig-002-20251128    clang-22
powerpc64             randconfig-001-20251128    clang-22
powerpc64             randconfig-002-20251128    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
s390                              allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251129    gcc-8.5.0
sparc                 randconfig-002-20251129    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251129    gcc-8.5.0
sparc64               randconfig-002-20251129    gcc-14.3.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251129    clang-22
um                    randconfig-002-20251129    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251129    gcc-14
x86_64                randconfig-073-20251129    gcc-14
x86_64                randconfig-074-20251129    gcc-12
x86_64                randconfig-075-20251129    gcc-14
x86_64                randconfig-076-20251129    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251129    gcc-10.5.0
xtensa                randconfig-002-20251129    gcc-14.3.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


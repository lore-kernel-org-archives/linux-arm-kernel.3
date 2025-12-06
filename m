Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FBAD3B7D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bIZ07T4nV2E3I4dxrXBmXMAUaD/YmXQ/y7Eio1xutt8=; b=PL5M3O+Xa53GrxSV0NBhuEfIQ8
	q0XbDH5I6siTR+SNWh+ggEROTTqlH4W9KfGfV00nbFMLfDFYcdWr5nRgcet7XBYQUI709xTuWUoxW
	N6HB1Baf44VcdmdpgAhYh8807hRyCbqiDQSpRewgn7f9pup3+o5o9LgEffwpd9NiTl0n43s7Gt9gd
	RgRAp4/EDaxlY5GuSZnHuu0ql29+/gXv7Q2Em4NSWBgBSTk7jpZDVNRQ68oRlUNyME3EketFl3hTg
	1SPtikemrf2VO7vDE6udCRNqC1OUxvNFsdEp2pDtqo0feTRJ2mFLKwCfng3itMcGZblhIBQD3J9Lu
	tvfLVtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRvVV-0000000B4ZK-1nKM;
	Sat, 06 Dec 2025 16:51:41 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRvVS-0000000B4YX-0YUF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 16:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765039898; x=1796575898;
  h=date:from:to:cc:subject:message-id;
  bh=+9A/hmU7mB6IYMu6F9nYXj2T4UsAwUWe/D3gtaJrWuQ=;
  b=ESnErBclPjIMdPbT1WMwqC1rEzPdTfYIXeAAgWdv7Ga+kjyEvPnCF3bh
   CWXlbB6pYeu21Z4YVDVj8HggU/mPsDIvfX8qNvngOQQUgFD+y+wG0MSBJ
   aSldwkydGQMBMt/J4OYlO4mfjcZ4Q5VWOxU6xcEg6BYC0BdUiExS9I34O
   tcNIaVUrVxVYOtiAWeq6KBhy1v1yVmWEWA6McbGFJ1CUHEdmPXQJu2QIQ
   RXXbnKZizaq+9VSKFwhqxGWpiMdEAKgbsywCqv5uG91wOQpRsUv8hZB6Y
   BsNdgcUv88Cxm7Y6SHZqVohBscHbmZxrv/pepLCeYhu0Vvjz+9sUn4hsI
   w==;
X-CSE-ConnectionGUID: gnXpslnJQsmyCfhC2W8hjQ==
X-CSE-MsgGUID: TYQl+tlBRnSMzLWWIe4Njg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66935527"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="66935527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 08:51:37 -0800
X-CSE-ConnectionGUID: ADf4OFA5ToKNnd1RJ0l0yg==
X-CSE-MsgGUID: MKJbx+kPSxS8R2U/ewWNxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="218907982"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Dec 2025 08:51:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRvVM-00000000ISC-44q5;
	Sat, 06 Dec 2025 16:51:32 +0000
Date: Sun, 07 Dec 2025 00:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers-late] BUILD SUCCESS
 68f9bbf4dfc356ccc6586ba6e7dd79576c48f7f0
Message-ID: <202512070017.9vRMuFUJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_085138_267970_CE07937C 
X-CRM114-Status: UNSURE (   4.61  )
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
branch HEAD: 68f9bbf4dfc356ccc6586ba6e7dd79576c48f7f0  Merge tag 'samsung-drivers-6.19-2-late' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/drivers-late

elapsed time: 1560m

configs tested: 104
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251206    gcc-8.5.0
arc                   randconfig-002-20251206    gcc-14.3.0
arm                                 defconfig    clang-22
arm                            mmp2_defconfig    gcc-15.1.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20251206    clang-22
arm                   randconfig-002-20251206    clang-22
arm                   randconfig-003-20251206    clang-16
arm                   randconfig-004-20251206    clang-20
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251206    gcc-8.5.0
arm64                 randconfig-002-20251206    clang-22
arm64                 randconfig-003-20251206    clang-22
arm64                 randconfig-004-20251206    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251206    gcc-15.1.0
csky                  randconfig-002-20251206    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251206    clang-16
hexagon               randconfig-002-20251206    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251206    gcc-14
i386        buildonly-randconfig-002-20251206    gcc-14
i386        buildonly-randconfig-004-20251206    clang-20
i386                                defconfig    clang-20
i386                  randconfig-003-20251206    gcc-14
i386                  randconfig-004-20251206    gcc-14
i386                  randconfig-012-20251206    gcc-14
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251206    gcc-15.1.0
loongarch             randconfig-002-20251206    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251206    gcc-8.5.0
nios2                 randconfig-002-20251206    gcc-8.5.0
openrisc                            defconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251206    gcc-11.5.0
parisc                randconfig-002-20251206    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251206    gcc-11.5.0
powerpc               randconfig-002-20251206    clang-22
powerpc64             randconfig-001-20251206    gcc-15.1.0
powerpc64             randconfig-002-20251206    clang-22
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251206    clang-22
riscv                 randconfig-002-20251206    clang-19
s390                                defconfig    clang-22
s390                  randconfig-001-20251206    clang-22
s390                  randconfig-002-20251206    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251206    gcc-15.1.0
sh                    randconfig-002-20251206    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251206    gcc-12.5.0
sparc                 randconfig-002-20251206    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251206    clang-22
sparc64               randconfig-002-20251206    gcc-8.5.0
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251206    gcc-14
um                    randconfig-002-20251206    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251206    clang-20
x86_64      buildonly-randconfig-002-20251206    gcc-14
x86_64      buildonly-randconfig-003-20251206    clang-20
x86_64      buildonly-randconfig-004-20251206    clang-20
x86_64      buildonly-randconfig-005-20251206    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251206    clang-20
x86_64                randconfig-002-20251206    gcc-14
x86_64                randconfig-003-20251206    gcc-14
x86_64                randconfig-004-20251206    gcc-14
x86_64                randconfig-005-20251206    gcc-14
x86_64                randconfig-006-20251206    gcc-14
x86_64                randconfig-071-20251206    clang-20
x86_64                randconfig-072-20251206    clang-20
x86_64                randconfig-073-20251206    gcc-14
x86_64                randconfig-074-20251206    gcc-14
x86_64                randconfig-075-20251206    gcc-14
x86_64                randconfig-076-20251206    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                randconfig-001-20251206    gcc-8.5.0
xtensa                randconfig-002-20251206    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


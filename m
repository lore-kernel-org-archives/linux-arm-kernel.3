Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260B8E6B26E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 04:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k3Kw8AAKRWr6/YMYyy9PfmyVbsU25CZ05FUGW4H2lPM=; b=3qJi3UVYLK/qCqwk6OgQ/8QsiY
	nCSxwME/R4G+09JG2zIlKgvOYjUGmdBQrZjl8+/vAsxwCcRWw388RCtWxvKze9olafQAvB9whv62k
	5g5iOv9edtyh1aO0yuzGSdPbO1x0FXt+cksWpiWdCoufl65woY1+UVgCLAXLI8L8V1Tvdnh4U7PaQ
	jhmzWtNrMg5z/CPdpFS8yTVHDCcQlGT8lr1LUjSmdO2jVcmuzKH7xrtZjZ+ueaC2zgCv7jC2ZpFDu
	1+FQXvXocsRtKjRABbgnpRrF3MFjDlNVTA9Ls8SrxLhmRVqWHQcU+0YdZtzP5cyrkQrDfK8o7okFo
	/AJMRBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXtzP-0000000EVI4-0mnb;
	Tue, 23 Dec 2025 04:27:15 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXtzL-0000000EVHT-07Kt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 04:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766464031; x=1798000031;
  h=date:from:to:cc:subject:message-id;
  bh=V78EZv25rQBA6DuRfRJtqfXiQyzcGPLTaZsrHWbiSH4=;
  b=meSJfHEWtkDC6j/fxLVK2L3035Wx+Y9dKHsWcLbHb/1CBH9OE4sYx9ZT
   7mFFNY1bFpwxGvvFoX34OlIjWRBWivsFdl+Ewl+iRGo1ofbaKt0n2vCys
   Ug31CGAbIoKMIBEgDkF/Uo6d6kXiXVAbSHd4n0CpVRBcS9wkbX5F7nEXZ
   OTyrJozmQwmyDpehMrPl2NarwG8WzwFZvi9zDi1P5FAZ7Ssidm1S0rQph
   hZhlDwyH9nu5F/4hqkPkR38LnWJ4MBOotQ6P2sh+TbqNgA3doy16OsJa4
   z3i5f81ApGAeFUlhXlmk8hBDL0FTF4mFRMZ3kwfhLGuhBzE//d/+ynFjP
   w==;
X-CSE-ConnectionGUID: RexqNbX0SpuFL8bV1wygqg==
X-CSE-MsgGUID: XOZklNz0SyOmLqIADpTXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68298849"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68298849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 20:27:10 -0800
X-CSE-ConnectionGUID: QMY44j9CSkCxdwrpd2VkEw==
X-CSE-MsgGUID: Q1W3tcqwR0u/hehgMkFznw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204180829"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Dec 2025 20:27:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXtzA-000000001SN-1nPN;
	Tue, 23 Dec 2025 04:27:02 +0000
Date: Tue, 23 Dec 2025 12:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 c4c6db7ac54649c0cfe7d86b4a5358296dc8d08b
Message-ID: <202512231207.yLZmN61U-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_202711_304719_75EFCB0F 
X-CRM114-Status: UNSURE (   4.76  )
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
branch HEAD: c4c6db7ac54649c0cfe7d86b4a5358296dc8d08b  MAINTAINERS: Fix a linusw mail address

elapsed time: 1092m

configs tested: 157
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251223    gcc-8.5.0
arc                   randconfig-002-20251223    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20251223    clang-22
arm                   randconfig-002-20251223    gcc-10.5.0
arm                   randconfig-003-20251223    clang-20
arm                   randconfig-004-20251223    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251223    clang-17
arm64                 randconfig-002-20251223    clang-22
arm64                 randconfig-003-20251223    clang-18
arm64                 randconfig-004-20251223    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251223    gcc-11.5.0
csky                  randconfig-002-20251223    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251223    clang-22
hexagon               randconfig-002-20251223    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251223    clang-20
i386        buildonly-randconfig-002-20251223    gcc-14
i386        buildonly-randconfig-003-20251223    clang-20
i386        buildonly-randconfig-004-20251223    clang-20
i386        buildonly-randconfig-005-20251223    gcc-14
i386        buildonly-randconfig-006-20251223    clang-20
i386                  randconfig-001-20251223    clang-20
i386                  randconfig-002-20251223    gcc-14
i386                  randconfig-003-20251223    clang-20
i386                  randconfig-004-20251223    gcc-14
i386                  randconfig-005-20251223    gcc-13
i386                  randconfig-006-20251223    gcc-14
i386                  randconfig-007-20251223    gcc-14
i386                  randconfig-011-20251223    gcc-12
i386                  randconfig-012-20251223    gcc-14
i386                  randconfig-013-20251223    gcc-12
i386                  randconfig-014-20251223    gcc-14
i386                  randconfig-015-20251223    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251223    gcc-15.1.0
loongarch             randconfig-002-20251223    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251223    gcc-11.5.0
nios2                 randconfig-002-20251223    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251223    gcc-8.5.0
parisc                randconfig-002-20251223    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251223    clang-22
powerpc               randconfig-002-20251223    clang-22
powerpc64             randconfig-001-20251223    clang-17
powerpc64             randconfig-002-20251223    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251223    gcc-8.5.0
riscv                 randconfig-002-20251223    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251223    gcc-14.3.0
s390                  randconfig-002-20251223    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251223    gcc-10.5.0
sh                    randconfig-002-20251223    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251223    gcc-15.1.0
sparc                 randconfig-002-20251223    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251223    gcc-8.5.0
sparc64               randconfig-002-20251223    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251223    clang-22
um                    randconfig-002-20251223    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251223    clang-20
x86_64      buildonly-randconfig-002-20251223    clang-20
x86_64      buildonly-randconfig-003-20251223    gcc-14
x86_64      buildonly-randconfig-004-20251223    gcc-14
x86_64      buildonly-randconfig-005-20251223    clang-20
x86_64      buildonly-randconfig-006-20251223    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251223    gcc-14
x86_64                randconfig-002-20251223    clang-20
x86_64                randconfig-003-20251223    gcc-14
x86_64                randconfig-004-20251223    clang-20
x86_64                randconfig-005-20251223    gcc-14
x86_64                randconfig-006-20251223    clang-20
x86_64                randconfig-011-20251223    gcc-14
x86_64                randconfig-012-20251223    clang-20
x86_64                randconfig-013-20251223    clang-20
x86_64                randconfig-014-20251223    clang-20
x86_64                randconfig-015-20251223    gcc-14
x86_64                randconfig-016-20251223    gcc-14
x86_64                randconfig-071-20251223    gcc-14
x86_64                randconfig-072-20251223    clang-20
x86_64                randconfig-073-20251223    clang-20
x86_64                randconfig-074-20251223    gcc-14
x86_64                randconfig-075-20251223    gcc-14
x86_64                randconfig-076-20251223    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251223    gcc-8.5.0
xtensa                randconfig-002-20251223    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


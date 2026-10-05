Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AC2CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2qrFvYplIXCeoc63IZ4+DCmwMp0dDzYSrIxAGsYQ6jE=; b=SIvy+K+4FRbfnd8GGmgUGFMlTK
	c4FcCPedCtuR3czq3BUnHKm18UCBhwwCB6OrsyMS990JTOjLhaHZqFaJy+WqnYPesOi+PYAvooNze
	GLQoRqNJdaCZ6z94vmP91FeNax3kppXheBd2xcGTvig3zHvBc81WKb16XS2XjgaOjzoRt3Kj6y9Tg
	7LMv+fmz5UG+7faZxbXNcSKe1sPgY0777PdUelrGQwTyk5WCOi/Q6pkxkLg377DzRipuKJzGI8aTm
	xkobkpOw7R2Mvp2lHPghSX8tcvGj7ZfujtYoY9EnQF+fkav/5h1xVdIFLsbnwxns/KZ18YFEb89y7
	ITkZRAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf9X-0000000G1Tf-335l;
	Mon, 05 Oct 2026 09:38:35 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf9U-0000000G1Sl-3mL5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791193113; x=1822729113;
  h=date:from:to:cc:subject:message-id;
  bh=Jh+i3DaeSMUmfmTz95CddJQEDRqEIUZFGmj2KhriLbg=;
  b=RC6fhUJWPmsxqKtcAlmgm5jCtzpdK3SQeIo3si/GoK9R1BdLQFRcWZKF
   1pHycOaYtAkgWJuOXK6gycOYI725pNDmmVLpbgMCfIxmddJmyr0EBo2aD
   3hhld2jKvQRa9QRRdvHlDqo+OcAH1Q2glq+bITXKwgkkgtyMt5Z2MGWy2
   IigjByqZvWlt289mrSLEs/o94EOESbW38UQV1pKShaNJ7RZrO9H3Y2bsf
   OL1tm4y2wl71dnsyNnfDACpi9LOQ3nB7ab7qZj17MMwHwG8JiaO1wf3zg
   9rsJAUIluqKfnzP953SonzVtd3Xj+jAT2EAKQ3XZLkti74YEyMvt4lSTa
   w==;
X-CSE-ConnectionGUID: ZWHMQo4rTnKrbvKb/XpDIw==
X-CSE-MsgGUID: as3Wx3pkQWWnfULsHXDy6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="95670596"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="95670596"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 02:38:20 -0700
X-CSE-ConnectionGUID: ZDZIau9DQ7iWvEL2dZgeWQ==
X-CSE-MsgGUID: VcT3fudETlK6glHxfT6D/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="276300330"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Oct 2026 02:38:19 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDf9E-0000000008B-1w9e;
	Mon, 05 Oct 2026 09:38:16 +0000
Date: Mon, 05 Oct 2026 17:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm:fixes] BUILD SUCCESS
 1fc2d80928b706147e371602dabd0ba927dfe4a3
Message-ID: <202610051700.nGHSfwTt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_023832_964722_F5A1AA65 
X-CRM114-Status: UNSURE (   5.27  )
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
branch HEAD: 1fc2d80928b706147e371602dabd0ba927dfe4a3  Merge tag 'tee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes

elapsed time: 957m

configs tested: 309
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.1.0
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2105-20261004    clang-24   cocci
alpha                randconfig-r2106-20261004    gcc-8.5.0  cocci
alpha                randconfig-r2309-20261004    clang-19   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                         nsimosci_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                  randconfig-r2304-20261004    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                        imx_v4_v5_defconfig    gcc-16.1.0
arm                         keystone_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                  randconfig-r2104-20261004    clang-17   cocci
arm                  randconfig-r2201-20261004    gcc-13.4.0 smatch
arm                  randconfig-r2202-20261004    gcc-11.5.0 smatch
arm                  randconfig-r2302-20261004    clang-20   sparse
arm                  randconfig-r2304-20261004    gcc-16.1.0 sparse
arm                  randconfig-r2306-20261004    gcc-14.3.0 sparse
arm                         spear6xx_defconfig    gcc-16.1.0
arm                         vexpress_defconfig    gcc-16.1.0
arm                          wpcm450_defconfig    gcc-16.1.0
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261005    gcc-16.1.0
arm64                 randconfig-1001-20261005    gcc-16.1.0
arm64                 randconfig-1002-20261005    gcc-16.1.0
arm64                 randconfig-1003-20261005    gcc-16.1.0
arm64                randconfig-r2100-20261004    gcc-11.5.0 cocci
arm64                randconfig-r2300-20261004    clang-20   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261005    gcc-16.1.0
csky                  randconfig-1001-20261005    gcc-16.1.0
csky                 randconfig-r2302-20261004    gcc-16.1.0 sparse
csky                 randconfig-r2304-20261004    clang-20   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261005    gcc-16.1.0
hexagon               randconfig-1001-20261005    gcc-16.1.0
hexagon              randconfig-r2102-20261004    gcc-11.5.0 cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261005    clang-22
i386        buildonly-randconfig-1001-20261005    clang-22
i386        buildonly-randconfig-1002-20261005    clang-22
i386        buildonly-randconfig-1003-20261005    clang-22
i386        buildonly-randconfig-1004-20261005    clang-22
i386        buildonly-randconfig-1005-20261005    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261005    clang-22
i386                  randconfig-1001-20261005    clang-22
i386                  randconfig-1002-20261005    clang-22
i386                  randconfig-1003-20261005    clang-22
i386                  randconfig-1004-20261005    clang-22
i386                  randconfig-1005-20261005    clang-22
i386                  randconfig-1006-20261005    clang-22
i386                  randconfig-1007-20261005    clang-22
i386                  randconfig-1008-20261005    clang-22
i386                  randconfig-1009-20261005    clang-22
i386                  randconfig-1010-20261005    clang-22
i386                  randconfig-1011-20261005    clang-22
i386                  randconfig-1012-20261005    clang-22
i386                  randconfig-1013-20261005    clang-22
i386                  randconfig-2100-20261004    clang-22   cocci
i386                  randconfig-2101-20261004    clang-22   cocci
i386                  randconfig-2101-20261004    gcc-14     cocci
i386                  randconfig-2102-20261004    clang-22   cocci
i386                  randconfig-2102-20261004    gcc-14     cocci
i386                  randconfig-2103-20261004    clang-22   cocci
i386                  randconfig-2103-20261004    gcc-14     cocci
i386                  randconfig-2200-20261004    clang-22   smatch
i386                  randconfig-2300-20261004    clang-22   sparse
i386                  randconfig-2301-20261004    clang-22   sparse
i386                  randconfig-2301-20261004    gcc-14     sparse
i386                  randconfig-2302-20261004    clang-22   sparse
i386                  randconfig-2302-20261004    gcc-14     sparse
i386                 randconfig-r2303-20261004    clang-20   sparse
i386                 randconfig-r2309-20261004    gcc-14     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261005    gcc-16.1.0
loongarch             randconfig-1001-20261005    gcc-16.1.0
loongarch            randconfig-r2102-20261004    clang-24   cocci
loongarch            randconfig-r2302-20261004    gcc-16.1.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                             q40_defconfig    gcc-16.1.0
m68k                 randconfig-r2103-20261004    gcc-11.5.0 cocci
m68k                 randconfig-r2200-20261004    gcc-8.5.0  smatch
m68k                 randconfig-r2202-20261004    gcc-8.5.0  smatch
m68k                 randconfig-r2300-20261004    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
microblaze           randconfig-r2107-20261004    clang-22   cocci
microblaze           randconfig-r2305-20261004    clang-20   sparse
microblaze           randconfig-r2305-20261004    gcc-16.1.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20261004    gcc-11.5.0 cocci
mips                 randconfig-r2307-20261004    gcc-14.3.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261005    gcc-16.1.0
nios2                 randconfig-1001-20261005    gcc-16.1.0
nios2                randconfig-r2100-20261004    gcc-11.5.0 cocci
nios2                randconfig-r2105-20261004    gcc-11.5.0 cocci
nios2                randconfig-r2107-20261004    clang-24   cocci
nios2                randconfig-r2308-20261004    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2102-20261004    gcc-11.5.0 cocci
openrisc             randconfig-r2306-20261004    clang-19   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261005    gcc-8.5.0
parisc                randconfig-1001-20261005    gcc-8.5.0
parisc               randconfig-r2107-20261004    gcc-14.3.0 cocci
parisc               randconfig-r2201-20261004    gcc-15.2.0 smatch
parisc               randconfig-r2307-20261004    clang-19   sparse
parisc               randconfig-r2308-20261004    gcc-14.3.0 sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                    bluestone_defconfig    gcc-16.1.0
powerpc                         cell_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261005    gcc-8.5.0
powerpc               randconfig-1001-20261005    gcc-8.5.0
powerpc              randconfig-r2101-20261004    gcc-11.5.0 cocci
powerpc              randconfig-r2104-20261004    clang-24   cocci
powerpc              randconfig-r2106-20261004    clang-24   cocci
powerpc              randconfig-r2301-20261004    gcc-16.1.0 sparse
powerpc              randconfig-r2309-20261004    gcc-14.3.0 sparse
powerpc                     sam440ep_defconfig    gcc-16.1.0
powerpc                      tqm8540_defconfig    gcc-16.1.0
powerpc                      tqm8555_defconfig    gcc-16.1.0
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261005    gcc-8.5.0
powerpc64             randconfig-1001-20261005    gcc-8.5.0
powerpc64            randconfig-r2301-20261004    clang-20   sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-2000-20261004    clang-24
riscv                 randconfig-2000-20261004    gcc-11.5.0
riscv                 randconfig-2001-20261004    clang-24
riscv                 randconfig-2001-20261004    gcc-11.5.0
riscv                randconfig-r2301-20261004    clang-19   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-2000-20261004    clang-24
s390                  randconfig-2000-20261004    gcc-11.5.0
s390                  randconfig-2001-20261004    gcc-10.5.0
s390                  randconfig-2001-20261004    gcc-11.5.0
s390                 randconfig-r2101-20261004    gcc-11.5.0 cocci
s390                 randconfig-r2101-20261004    gcc-14.3.0 cocci
s390                 randconfig-r2202-20261004    gcc-9.5.0  smatch
s390                 randconfig-r2303-20261004    gcc-16.1.0 sparse
s390                 randconfig-r2305-20261004    clang-24   sparse
s390                 randconfig-r2308-20261004    clang-19   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-2000-20261004    gcc-11.5.0
sh                    randconfig-2000-20261004    gcc-13.4.0
sh                    randconfig-2001-20261004    gcc-11.5.0
sh                           rsk7201_defconfig    gcc-16.1.0
sh                       rts7751r2d1_defconfig    gcc-16.1.0
sh                            se7750_defconfig    gcc-16.1.0
sh                               ul2_defconfig    gcc-16.1.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261005    clang-24
sparc                 randconfig-1001-20261005    clang-24
sparc                 randconfig-2000-20261004    clang-17
sparc                 randconfig-2000-20261004    gcc-8.5.0
sparc                 randconfig-2001-20261004    clang-17
sparc                 randconfig-2001-20261004    gcc-15.2.0
sparc                randconfig-r2100-20261004    gcc-13.4.0 cocci
sparc                randconfig-r2105-20261004    clang-22   cocci
sparc                randconfig-r2201-20261004    gcc-16.1.0 smatch
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261005    clang-24
sparc64               randconfig-1001-20261005    clang-24
sparc64               randconfig-2000-20261004    clang-17
sparc64               randconfig-2000-20261004    clang-20
sparc64               randconfig-2001-20261004    clang-17
sparc64               randconfig-2001-20261004    gcc-10.5.0
sparc64              randconfig-r2306-20261004    clang-24   sparse
sparc64              randconfig-r2307-20261004    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261005    clang-24
um                    randconfig-1001-20261005    clang-24
um                    randconfig-2000-20261004    clang-17
um                    randconfig-2000-20261004    gcc-14
um                    randconfig-2001-20261004    clang-17
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261005    gcc-13
x86_64      buildonly-randconfig-1001-20261005    gcc-13
x86_64      buildonly-randconfig-1002-20261005    gcc-13
x86_64      buildonly-randconfig-1003-20261005    gcc-13
x86_64      buildonly-randconfig-1004-20261005    gcc-13
x86_64      buildonly-randconfig-1005-20261005    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261005    gcc-14
x86_64                randconfig-1001-20261005    gcc-14
x86_64                randconfig-1002-20261005    gcc-14
x86_64                randconfig-1003-20261005    gcc-14
x86_64                randconfig-1004-20261005    gcc-14
x86_64                randconfig-1005-20261005    gcc-14
x86_64                randconfig-1006-20261005    gcc-14
x86_64                randconfig-1007-20261005    gcc-14
x86_64                randconfig-1008-20261005    gcc-14
x86_64                randconfig-1009-20261005    gcc-14
x86_64                randconfig-1010-20261005    gcc-14
x86_64                randconfig-1011-20261005    gcc-14
x86_64                randconfig-1012-20261005    gcc-14
x86_64                randconfig-1013-20261005    gcc-14
x86_64                randconfig-1014-20261005    gcc-14
x86_64                randconfig-1015-20261005    gcc-14
x86_64                randconfig-1016-20261005    gcc-14
x86_64                randconfig-1017-20261005    gcc-14
x86_64                randconfig-2100-20261004    gcc-14     cocci
x86_64                randconfig-2101-20261004    clang-22   cocci
x86_64                randconfig-2101-20261004    gcc-14     cocci
x86_64                randconfig-2102-20261004    gcc-14     cocci
x86_64                randconfig-2103-20261004    gcc-14     cocci
x86_64                randconfig-2200-20261004    gcc-14     smatch
x86_64                randconfig-2300-20261004    clang-22   sparse
x86_64                randconfig-2300-20261004    gcc-14     sparse
x86_64                randconfig-2301-20261004    clang-22   sparse
x86_64                randconfig-2301-20261004    gcc-14     sparse
x86_64                randconfig-2302-20261004    clang-22   sparse
x86_64               randconfig-r2103-20261004    gcc-14     cocci
x86_64               randconfig-r2104-20261004    clang-22   cocci
x86_64               randconfig-r2106-20261004    clang-22   cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261005    clang-24
xtensa                randconfig-1001-20261005    clang-24
xtensa                randconfig-2000-20261004    clang-17
xtensa                randconfig-2000-20261004    gcc-8.5.0
xtensa                randconfig-2001-20261004    clang-17
xtensa                randconfig-2001-20261004    gcc-9.5.0
xtensa               randconfig-r2300-20261004    gcc-16.1.0 sparse
xtensa               randconfig-r2303-20261004    gcc-10.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


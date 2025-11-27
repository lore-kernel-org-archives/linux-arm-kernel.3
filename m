Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB73CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eGiLgZn1SrdJs9cNpH+Vyrc14MkZGDjurg/cFsv08cA=; b=A0aXYwamFaXA7ZUygHTWczR7uZ
	k6Vft+97ZhC76AKfVU5R2BHLxgsw+v6dg7GpsEWhEfLml7oMK55osIp4yKwhjCEqcDl6k3aulhrnG
	j+f2nBQHjvn4uWh0YdkgMkDpaiW48dBYNhjyqa4U25zzZd7TTdSE+7Kal7/4ewBFqOYWHGtaSS0In
	ryPvDKc1jldTNz4lvQJycLr72jnHpl/ZE1cKXMcyZLv5qUtj8NgPnxl1CWaKwvlecQhIUhdyaqQqc
	zFGMlPqZcrxm8X053f2su9N04rwnwwC47HuMGPJhCvw/0Lt9ZnYpdaRweyfc7pwjctSkSWsrFDIHt
	hZG+V1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXga-0000000GEbF-1W4u;
	Thu, 27 Nov 2025 08:49:08 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXgX-0000000GEal-27Uw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 08:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764233345; x=1795769345;
  h=date:from:to:cc:subject:message-id;
  bh=lxVzGM+TWy6URVQkClChYmFbLyERgiOk+iTFPzDCDPc=;
  b=DYzg4+L6HKGIxfQzy+5mT3aNx1yO9uskc4lbvzVJPoOz7Dhmh6b7alpm
   UZRPp2N0UGZ3w9oSEIJkp3MhPrP7JvYbPSDxsZcIr3rNjQaOcrLpsqlPj
   UqjtRSPJFEZJ/5yRDD65fVMLl+a3TQfwkHb9fe/0mFIjzRJKfRlGWCGqo
   rXCPAj4/NGhcfKNd7BESvNjDu2zoppGgv91ugwPBMYOmY+lGEwhvkrtsS
   9LJbjFl/6v7lG4su2vlC39bOhTkca0SjbWe5BkoNw0b5DOFtaaympybhj
   VkbDCPn5iYiIApUIXvM5XYislMDJe7HUPsmktZojCFK2SZ1XfEjSF7orz
   Q==;
X-CSE-ConnectionGUID: Fsvf+EUuT7apUNgmjs3teg==
X-CSE-MsgGUID: tPd6j3vgT/ecPcZaU73jUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66168856"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66168856"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:49:02 -0800
X-CSE-ConnectionGUID: kijXa7wHSDeTq4Bi4nZYzg==
X-CSE-MsgGUID: 4m9n7JgtQciVrZVxAWDx5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="197336862"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Nov 2025 00:49:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOXgQ-0000000040T-2Xd4;
	Thu, 27 Nov 2025 08:48:58 +0000
Date: Thu, 27 Nov 2025 16:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/newsoc] BUILD SUCCESS
 9b418a3bfdd421c01002424958fbd86a1001c2c2
Message-ID: <202511271608.JJQGV4GY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_004905_582875_CA70A898 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/newsoc
branch HEAD: 9b418a3bfdd421c01002424958fbd86a1001c2c2  Merge tag 'anlogic-initial-6.19-v2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/newsoc

elapsed time: 7899m

configs tested: 126
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    clang-19
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    clang-19
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251127    clang-22
arc         randconfig-002-20251127    clang-22
arm                     allnoconfig    clang-22
arm                     allnoconfig    gcc-15.1.0
arm                    allyesconfig    gcc-15.1.0
arm            integrator_defconfig    clang-22
arm         randconfig-001-20251127    clang-22
arm         randconfig-002-20251127    clang-22
arm         randconfig-003-20251127    clang-22
arm         randconfig-004-20251127    clang-22
arm               s3c6400_defconfig    clang-22
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                 allnoconfig    gcc-15.1.0
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                    allnoconfig    gcc-14
i386                    allnoconfig    gcc-15.1.0
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch               allnoconfig    gcc-15.1.0
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                   allmodconfig    clang-19
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    clang-19
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    clang-22
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    clang-22
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc               allmodconfig    clang-22
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    clang-22
openrisc                allnoconfig    gcc-15.1.0
openrisc                  defconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    clang-22
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc                    defconfig    gcc-15.1.0
parisc      randconfig-001-20251127    gcc-13.4.0
parisc      randconfig-002-20251127    gcc-13.4.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    clang-22
powerpc                 allnoconfig    gcc-15.1.0
powerpc            bamboo_defconfig    clang-22
powerpc         bluestone_defconfig    clang-22
powerpc       linkstation_defconfig    clang-22
powerpc       mpc836x_rdk_defconfig    clang-22
powerpc     randconfig-001-20251127    gcc-13.4.0
powerpc     randconfig-002-20251127    gcc-13.4.0
powerpc64   randconfig-001-20251127    gcc-13.4.0
powerpc64   randconfig-002-20251127    gcc-13.4.0
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
riscv                     defconfig    gcc-15.1.0
riscv       randconfig-001-20251127    gcc-12.5.0
riscv       randconfig-002-20251127    gcc-12.5.0
s390                   allmodconfig    clang-18
s390                   allmodconfig    gcc-15.1.0
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390                      defconfig    gcc-15.1.0
s390        randconfig-001-20251127    gcc-12.5.0
s390        randconfig-002-20251127    gcc-12.5.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    clang-22
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh                        defconfig    gcc-14
sh                kfr2r09_defconfig    clang-22
sh          randconfig-001-20251127    gcc-12.5.0
sh          randconfig-002-20251127    gcc-12.5.0
sparc                   allnoconfig    clang-22
sparc                   allnoconfig    gcc-15.1.0
sparc                     defconfig    gcc-15.1.0
sparc       randconfig-001-20251127    clang-22
sparc       randconfig-002-20251127    clang-22
sparc64                allmodconfig    clang-22
sparc64                   defconfig    gcc-14
sparc64     randconfig-001-20251127    clang-22
sparc64     randconfig-002-20251127    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
um                        defconfig    gcc-14
um                   i386_defconfig    gcc-14
um          randconfig-001-20251127    clang-22
um          randconfig-002-20251127    clang-22
um                 x86_64_defconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                  allnoconfig    clang-22
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    clang-22
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    clang-22
xtensa                 allyesconfig    gcc-15.1.0
xtensa      randconfig-001-20251127    clang-22
xtensa      randconfig-002-20251127    clang-22
xtensa          xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


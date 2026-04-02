Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BF8D6AB00
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YKF92yW6A+6PkNEc9K7XWcrabWv2PCRO5qYr5MUD0go=; b=4/kGqWmQIcW/kLC0xV5SObEcCO
	bG2JroVePEgfp8S3zlfgjPCvdqty5mKCxDC4yYfw0CNASXPY5kBIDxGyvtlaGsHaGXwE8VQJXjLNn
	3ZyXDCLGPbmwCd4MF08MOHxhXwy4t4gdJc4HQetEYSHg8bKkDnT9Tz/ZsNxghIiABGbWyqAq0aA6H
	8eTtDgJyhFN7/tZt3LovJed2rPbHzApAoOIH4mHwTE0F1IdqmNMJBLtLn0B9kDolwEiZ7Z1+hE2qq
	ZFe2eiHlsyOF73U4kB1ZHbIkIdN729j0zeFqovc2WVS4bt3BeUUQ4lN9Jn3bDfaF7ljptQEt6JtbM
	mqghe0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8NuN-00000000it7-3nvj;
	Thu, 02 Apr 2026 19:40:51 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8NuL-00000000ism-0L4C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 19:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775158849; x=1806694849;
  h=date:from:to:cc:subject:message-id;
  bh=9MfCREldME0DMV9qWptTY45nsBfIZ3BclgLG/eO2GFM=;
  b=n8vheTyfeYlmzzNpoH21EUA0Eag9xDAGQ0hvey3wUbNwvZ5Gsfz5kBTY
   KRAQybO3v47OpozIa+rnQlCmjp4yuCNjD5ME/ra+5LUw+1Di4LKq+WyVy
   Cm0vYXThG5jbWSEvIXOilhmAtsVOLoIhpeMrl+QjHOCFEIpIGeAXtMpdY
   +TFgpDgBMY/vNC7Dia8BjauQXv0TjDv4iOm4Pi0zXGv3s3/XYdMtL2srv
   ImT9dNqopR+T9ZGroavZ/Wepx6KeU4nwBSGb5XUFixC64PJlKuKjZGxXx
   96Bdh8LCqZBRon3n7+96R6aZI8TjTEdaUlFc9bKXuT8ZnMDoGx7uxG6ZS
   A==;
X-CSE-ConnectionGUID: WJlGPdiITy+km3VpovdVpg==
X-CSE-MsgGUID: iVJexjZjQr25E6xLae7SwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75946063"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75946063"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 12:40:46 -0700
X-CSE-ConnectionGUID: 49sPQ09fRnac/7/jQ2ao0Q==
X-CSE-MsgGUID: duZeNjTxRJ2w8nAikjIhcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="257542653"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Apr 2026 12:40:43 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8NuC-000000000Mh-2Ahd;
	Thu, 02 Apr 2026 19:40:40 +0000
Date: Fri, 03 Apr 2026 03:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:riscv/soc-fixes-2] BUILD SUCCESS
 c7596f9001e2b83293e3658e4e1addde69bb335d
Message-ID: <202604030328.7xsVPekf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_124049_219673_00F9CA2F 
X-CRM114-Status: UNSURE (   4.86  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git riscv/soc-fixes-2
branch HEAD: c7596f9001e2b83293e3658e4e1addde69bb335d  firmware: microchip: fail auto-update probe if no flash found

elapsed time: 10067m

configs tested: 537
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260327    gcc-8.5.0
arc                   randconfig-001-20260328    gcc-15.2.0
arc                   randconfig-001-20260331    clang-23
arc                   randconfig-001-20260401    clang-23
arc                   randconfig-001-20260402    gcc-11.5.0
arc                   randconfig-002-20260327    gcc-8.5.0
arc                   randconfig-002-20260328    gcc-15.2.0
arc                   randconfig-002-20260331    clang-23
arc                   randconfig-002-20260401    clang-23
arc                   randconfig-002-20260402    gcc-11.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    clang-23
arm                         orion5x_defconfig    clang-23
arm                   randconfig-001-20260327    gcc-8.5.0
arm                   randconfig-001-20260328    gcc-15.2.0
arm                   randconfig-001-20260331    clang-23
arm                   randconfig-001-20260401    clang-23
arm                   randconfig-001-20260402    gcc-11.5.0
arm                   randconfig-002-20260327    gcc-8.5.0
arm                   randconfig-002-20260328    gcc-15.2.0
arm                   randconfig-002-20260331    clang-23
arm                   randconfig-002-20260401    clang-23
arm                   randconfig-002-20260402    gcc-11.5.0
arm                   randconfig-003-20260327    gcc-8.5.0
arm                   randconfig-003-20260328    gcc-15.2.0
arm                   randconfig-003-20260331    clang-23
arm                   randconfig-003-20260401    clang-23
arm                   randconfig-003-20260402    gcc-11.5.0
arm                   randconfig-004-20260327    gcc-8.5.0
arm                   randconfig-004-20260328    gcc-15.2.0
arm                   randconfig-004-20260331    clang-23
arm                   randconfig-004-20260401    clang-23
arm                   randconfig-004-20260402    gcc-11.5.0
arm                       spear13xx_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260327    clang-23
arm64                 randconfig-001-20260328    gcc-14.3.0
arm64                 randconfig-001-20260331    clang-18
arm64                 randconfig-001-20260401    gcc-15.2.0
arm64                 randconfig-001-20260402    gcc-15.2.0
arm64                 randconfig-002-20260327    clang-23
arm64                 randconfig-002-20260328    gcc-14.3.0
arm64                 randconfig-002-20260331    clang-18
arm64                 randconfig-002-20260401    gcc-15.2.0
arm64                 randconfig-002-20260402    gcc-15.2.0
arm64                 randconfig-003-20260327    clang-23
arm64                 randconfig-003-20260328    gcc-14.3.0
arm64                 randconfig-003-20260331    clang-18
arm64                 randconfig-003-20260401    gcc-15.2.0
arm64                 randconfig-003-20260402    gcc-15.2.0
arm64                 randconfig-004-20260327    clang-23
arm64                 randconfig-004-20260328    gcc-14.3.0
arm64                 randconfig-004-20260331    clang-18
arm64                 randconfig-004-20260401    gcc-15.2.0
arm64                 randconfig-004-20260402    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260327    clang-23
csky                  randconfig-001-20260328    gcc-14.3.0
csky                  randconfig-001-20260331    clang-18
csky                  randconfig-001-20260401    gcc-15.2.0
csky                  randconfig-001-20260402    gcc-15.2.0
csky                  randconfig-002-20260327    clang-23
csky                  randconfig-002-20260328    gcc-14.3.0
csky                  randconfig-002-20260331    clang-18
csky                  randconfig-002-20260401    gcc-15.2.0
csky                  randconfig-002-20260402    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260327    gcc-8.5.0
hexagon               randconfig-001-20260328    gcc-11.5.0
hexagon               randconfig-001-20260331    gcc-11.5.0
hexagon               randconfig-001-20260401    gcc-15.2.0
hexagon               randconfig-001-20260402    clang-18
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-002-20260327    gcc-8.5.0
hexagon               randconfig-002-20260328    gcc-11.5.0
hexagon               randconfig-002-20260331    gcc-11.5.0
hexagon               randconfig-002-20260401    gcc-15.2.0
hexagon               randconfig-002-20260402    clang-18
hexagon               randconfig-002-20260403    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260327    clang-20
i386        buildonly-randconfig-001-20260328    clang-20
i386        buildonly-randconfig-001-20260331    clang-20
i386        buildonly-randconfig-001-20260401    gcc-14
i386        buildonly-randconfig-001-20260402    clang-20
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-002-20260327    clang-20
i386        buildonly-randconfig-002-20260328    clang-20
i386        buildonly-randconfig-002-20260331    clang-20
i386        buildonly-randconfig-002-20260401    gcc-14
i386        buildonly-randconfig-002-20260402    clang-20
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-003-20260327    clang-20
i386        buildonly-randconfig-003-20260328    clang-20
i386        buildonly-randconfig-003-20260331    clang-20
i386        buildonly-randconfig-003-20260401    gcc-14
i386        buildonly-randconfig-003-20260402    clang-20
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-004-20260327    clang-20
i386        buildonly-randconfig-004-20260328    clang-20
i386        buildonly-randconfig-004-20260331    clang-20
i386        buildonly-randconfig-004-20260401    gcc-14
i386        buildonly-randconfig-004-20260402    clang-20
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-005-20260327    clang-20
i386        buildonly-randconfig-005-20260328    clang-20
i386        buildonly-randconfig-005-20260331    clang-20
i386        buildonly-randconfig-005-20260401    gcc-14
i386        buildonly-randconfig-005-20260402    clang-20
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-006-20260327    clang-20
i386        buildonly-randconfig-006-20260328    clang-20
i386        buildonly-randconfig-006-20260331    clang-20
i386        buildonly-randconfig-006-20260401    gcc-14
i386        buildonly-randconfig-006-20260402    clang-20
i386        buildonly-randconfig-006-20260403    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260327    clang-20
i386                  randconfig-001-20260328    clang-20
i386                  randconfig-001-20260331    gcc-14
i386                  randconfig-001-20260401    gcc-14
i386                  randconfig-001-20260402    clang-20
i386                  randconfig-002-20260327    clang-20
i386                  randconfig-002-20260328    clang-20
i386                  randconfig-002-20260331    gcc-14
i386                  randconfig-002-20260401    gcc-14
i386                  randconfig-002-20260402    clang-20
i386                  randconfig-003-20260327    clang-20
i386                  randconfig-003-20260328    clang-20
i386                  randconfig-003-20260331    gcc-14
i386                  randconfig-003-20260401    gcc-14
i386                  randconfig-003-20260402    clang-20
i386                  randconfig-004-20260327    clang-20
i386                  randconfig-004-20260328    clang-20
i386                  randconfig-004-20260331    gcc-14
i386                  randconfig-004-20260401    gcc-14
i386                  randconfig-004-20260402    clang-20
i386                  randconfig-005-20260327    clang-20
i386                  randconfig-005-20260328    clang-20
i386                  randconfig-005-20260331    gcc-14
i386                  randconfig-005-20260401    gcc-14
i386                  randconfig-005-20260402    clang-20
i386                  randconfig-006-20260327    clang-20
i386                  randconfig-006-20260328    clang-20
i386                  randconfig-006-20260331    gcc-14
i386                  randconfig-006-20260401    gcc-14
i386                  randconfig-006-20260402    clang-20
i386                  randconfig-007-20260327    clang-20
i386                  randconfig-007-20260328    clang-20
i386                  randconfig-007-20260331    gcc-14
i386                  randconfig-007-20260401    gcc-14
i386                  randconfig-007-20260402    clang-20
i386                  randconfig-011-20260327    gcc-14
i386                  randconfig-011-20260328    gcc-13
i386                  randconfig-011-20260331    clang-20
i386                  randconfig-011-20260401    clang-20
i386                  randconfig-011-20260402    clang-20
i386                  randconfig-012-20260327    gcc-14
i386                  randconfig-012-20260328    gcc-13
i386                  randconfig-012-20260331    clang-20
i386                  randconfig-012-20260401    clang-20
i386                  randconfig-012-20260402    clang-20
i386                  randconfig-013-20260327    gcc-14
i386                  randconfig-013-20260328    gcc-13
i386                  randconfig-013-20260331    clang-20
i386                  randconfig-013-20260401    clang-20
i386                  randconfig-013-20260402    clang-20
i386                  randconfig-014-20260327    gcc-14
i386                  randconfig-014-20260328    gcc-13
i386                  randconfig-014-20260331    clang-20
i386                  randconfig-014-20260401    clang-20
i386                  randconfig-014-20260402    clang-20
i386                  randconfig-015-20260327    gcc-14
i386                  randconfig-015-20260328    gcc-13
i386                  randconfig-015-20260331    clang-20
i386                  randconfig-015-20260401    clang-20
i386                  randconfig-015-20260402    clang-20
i386                  randconfig-016-20260327    gcc-14
i386                  randconfig-016-20260328    gcc-13
i386                  randconfig-016-20260401    clang-20
i386                  randconfig-016-20260402    clang-20
i386                  randconfig-017-20260327    gcc-14
i386                  randconfig-017-20260328    gcc-13
i386                  randconfig-017-20260331    clang-20
i386                  randconfig-017-20260401    clang-20
i386                  randconfig-017-20260402    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260327    gcc-8.5.0
loongarch             randconfig-001-20260328    gcc-11.5.0
loongarch             randconfig-001-20260331    gcc-11.5.0
loongarch             randconfig-001-20260401    gcc-15.2.0
loongarch             randconfig-001-20260402    clang-18
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-002-20260327    gcc-8.5.0
loongarch             randconfig-002-20260328    gcc-11.5.0
loongarch             randconfig-002-20260331    gcc-11.5.0
loongarch             randconfig-002-20260401    gcc-15.2.0
loongarch             randconfig-002-20260402    clang-18
loongarch             randconfig-002-20260403    clang-23
m68k                             alldefconfig    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260327    gcc-8.5.0
nios2                 randconfig-001-20260328    gcc-11.5.0
nios2                 randconfig-001-20260331    gcc-11.5.0
nios2                 randconfig-001-20260401    gcc-15.2.0
nios2                 randconfig-001-20260402    clang-18
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-002-20260327    gcc-8.5.0
nios2                 randconfig-002-20260328    gcc-11.5.0
nios2                 randconfig-002-20260331    gcc-11.5.0
nios2                 randconfig-002-20260401    gcc-15.2.0
nios2                 randconfig-002-20260402    clang-18
nios2                 randconfig-002-20260403    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260327    clang-18
parisc                randconfig-001-20260328    gcc-10.5.0
parisc                randconfig-001-20260331    clang-23
parisc                randconfig-001-20260401    gcc-8.5.0
parisc                randconfig-001-20260402    clang-20
parisc                randconfig-002-20260327    clang-18
parisc                randconfig-002-20260328    gcc-10.5.0
parisc                randconfig-002-20260331    clang-23
parisc                randconfig-002-20260401    gcc-8.5.0
parisc                randconfig-002-20260402    clang-20
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     mpc512x_defconfig    clang-23
powerpc               randconfig-001-20260327    clang-18
powerpc               randconfig-001-20260328    gcc-10.5.0
powerpc               randconfig-001-20260331    clang-23
powerpc               randconfig-001-20260401    gcc-8.5.0
powerpc               randconfig-001-20260402    clang-20
powerpc               randconfig-002-20260327    clang-18
powerpc               randconfig-002-20260328    gcc-10.5.0
powerpc               randconfig-002-20260331    clang-23
powerpc               randconfig-002-20260401    gcc-8.5.0
powerpc               randconfig-002-20260402    clang-20
powerpc64             randconfig-001-20260327    clang-18
powerpc64             randconfig-001-20260328    gcc-10.5.0
powerpc64             randconfig-001-20260331    clang-23
powerpc64             randconfig-001-20260401    gcc-8.5.0
powerpc64             randconfig-001-20260402    clang-20
powerpc64             randconfig-002-20260327    clang-18
powerpc64             randconfig-002-20260328    gcc-10.5.0
powerpc64             randconfig-002-20260331    clang-23
powerpc64             randconfig-002-20260401    gcc-8.5.0
powerpc64             randconfig-002-20260402    clang-20
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    clang-23
riscv                 randconfig-001-20260327    gcc-12.5.0
riscv                 randconfig-001-20260328    clang-23
riscv                 randconfig-001-20260331    gcc-15.2.0
riscv                 randconfig-001-20260401    gcc-9.5.0
riscv                 randconfig-001-20260402    clang-23
riscv                 randconfig-002-20260327    gcc-12.5.0
riscv                 randconfig-002-20260328    clang-23
riscv                 randconfig-002-20260331    gcc-15.2.0
riscv                 randconfig-002-20260401    gcc-9.5.0
riscv                 randconfig-002-20260402    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260327    gcc-12.5.0
s390                  randconfig-001-20260328    clang-23
s390                  randconfig-001-20260331    gcc-15.2.0
s390                  randconfig-001-20260401    gcc-9.5.0
s390                  randconfig-001-20260402    clang-23
s390                  randconfig-002-20260327    gcc-12.5.0
s390                  randconfig-002-20260328    clang-23
s390                  randconfig-002-20260331    gcc-15.2.0
s390                  randconfig-002-20260401    gcc-9.5.0
s390                  randconfig-002-20260402    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260327    gcc-12.5.0
sh                    randconfig-001-20260328    clang-23
sh                    randconfig-001-20260331    gcc-15.2.0
sh                    randconfig-001-20260401    gcc-9.5.0
sh                    randconfig-001-20260402    clang-23
sh                    randconfig-002-20260327    gcc-12.5.0
sh                    randconfig-002-20260328    clang-23
sh                    randconfig-002-20260331    gcc-15.2.0
sh                    randconfig-002-20260401    gcc-9.5.0
sh                    randconfig-002-20260402    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260327    gcc-14.3.0
sparc                 randconfig-001-20260328    gcc-14
sparc                 randconfig-001-20260331    gcc-15.2.0
sparc                 randconfig-001-20260401    clang-16
sparc                 randconfig-001-20260402    gcc-14
sparc                 randconfig-002-20260327    gcc-14.3.0
sparc                 randconfig-002-20260328    gcc-14
sparc                 randconfig-002-20260331    gcc-15.2.0
sparc                 randconfig-002-20260401    clang-16
sparc                 randconfig-002-20260402    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260327    gcc-14.3.0
sparc64               randconfig-001-20260328    gcc-14
sparc64               randconfig-001-20260331    gcc-15.2.0
sparc64               randconfig-001-20260401    clang-16
sparc64               randconfig-001-20260402    gcc-14
sparc64               randconfig-002-20260327    gcc-14.3.0
sparc64               randconfig-002-20260328    gcc-14
sparc64               randconfig-002-20260331    gcc-15.2.0
sparc64               randconfig-002-20260401    clang-16
sparc64               randconfig-002-20260402    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260328    gcc-14
um                    randconfig-001-20260331    gcc-15.2.0
um                    randconfig-001-20260401    clang-16
um                    randconfig-001-20260402    gcc-14
um                    randconfig-002-20260327    gcc-14.3.0
um                    randconfig-002-20260328    gcc-14
um                    randconfig-002-20260331    gcc-15.2.0
um                    randconfig-002-20260401    clang-16
um                    randconfig-002-20260402    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260327    clang-20
x86_64      buildonly-randconfig-001-20260328    clang-20
x86_64      buildonly-randconfig-001-20260331    clang-20
x86_64      buildonly-randconfig-001-20260401    gcc-12
x86_64      buildonly-randconfig-001-20260402    clang-20
x86_64      buildonly-randconfig-002-20260327    clang-20
x86_64      buildonly-randconfig-002-20260328    clang-20
x86_64      buildonly-randconfig-002-20260331    clang-20
x86_64      buildonly-randconfig-002-20260401    gcc-12
x86_64      buildonly-randconfig-002-20260402    clang-20
x86_64      buildonly-randconfig-003-20260327    clang-20
x86_64      buildonly-randconfig-003-20260328    clang-20
x86_64      buildonly-randconfig-003-20260331    clang-20
x86_64      buildonly-randconfig-003-20260401    gcc-12
x86_64      buildonly-randconfig-003-20260402    clang-20
x86_64      buildonly-randconfig-004-20260327    clang-20
x86_64      buildonly-randconfig-004-20260328    clang-20
x86_64      buildonly-randconfig-004-20260331    clang-20
x86_64      buildonly-randconfig-004-20260401    gcc-12
x86_64      buildonly-randconfig-004-20260402    clang-20
x86_64      buildonly-randconfig-005-20260327    clang-20
x86_64      buildonly-randconfig-005-20260328    clang-20
x86_64      buildonly-randconfig-005-20260331    clang-20
x86_64      buildonly-randconfig-005-20260401    gcc-12
x86_64      buildonly-randconfig-005-20260402    clang-20
x86_64      buildonly-randconfig-006-20260327    clang-20
x86_64      buildonly-randconfig-006-20260328    clang-20
x86_64      buildonly-randconfig-006-20260331    clang-20
x86_64      buildonly-randconfig-006-20260401    gcc-12
x86_64      buildonly-randconfig-006-20260402    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260327    gcc-14
x86_64                randconfig-001-20260328    gcc-14
x86_64                randconfig-001-20260331    gcc-14
x86_64                randconfig-001-20260401    clang-20
x86_64                randconfig-001-20260402    gcc-14
x86_64                randconfig-002-20260327    gcc-14
x86_64                randconfig-002-20260328    gcc-14
x86_64                randconfig-002-20260331    gcc-14
x86_64                randconfig-002-20260401    clang-20
x86_64                randconfig-002-20260402    gcc-14
x86_64                randconfig-003-20260327    gcc-14
x86_64                randconfig-003-20260328    gcc-14
x86_64                randconfig-003-20260331    gcc-14
x86_64                randconfig-003-20260401    clang-20
x86_64                randconfig-003-20260402    gcc-14
x86_64                randconfig-004-20260327    gcc-14
x86_64                randconfig-004-20260328    gcc-14
x86_64                randconfig-004-20260331    gcc-14
x86_64                randconfig-004-20260401    clang-20
x86_64                randconfig-004-20260402    gcc-14
x86_64                randconfig-005-20260327    gcc-14
x86_64                randconfig-005-20260328    gcc-14
x86_64                randconfig-005-20260331    gcc-14
x86_64                randconfig-005-20260401    clang-20
x86_64                randconfig-005-20260402    gcc-14
x86_64                randconfig-006-20260327    gcc-14
x86_64                randconfig-006-20260328    gcc-14
x86_64                randconfig-006-20260331    gcc-14
x86_64                randconfig-006-20260401    clang-20
x86_64                randconfig-006-20260402    gcc-14
x86_64                randconfig-011-20260327    gcc-14
x86_64                randconfig-011-20260328    clang-20
x86_64                randconfig-011-20260331    clang-20
x86_64                randconfig-011-20260401    gcc-14
x86_64                randconfig-011-20260402    clang-20
x86_64                randconfig-012-20260327    gcc-14
x86_64                randconfig-012-20260328    clang-20
x86_64                randconfig-012-20260331    clang-20
x86_64                randconfig-012-20260401    gcc-14
x86_64                randconfig-012-20260402    clang-20
x86_64                randconfig-013-20260327    gcc-14
x86_64                randconfig-013-20260328    clang-20
x86_64                randconfig-013-20260331    clang-20
x86_64                randconfig-013-20260401    gcc-14
x86_64                randconfig-013-20260402    clang-20
x86_64                randconfig-014-20260327    gcc-14
x86_64                randconfig-014-20260328    clang-20
x86_64                randconfig-014-20260331    clang-20
x86_64                randconfig-014-20260401    gcc-14
x86_64                randconfig-014-20260402    clang-20
x86_64                randconfig-015-20260327    gcc-14
x86_64                randconfig-015-20260328    clang-20
x86_64                randconfig-015-20260331    clang-20
x86_64                randconfig-015-20260401    gcc-14
x86_64                randconfig-015-20260402    clang-20
x86_64                randconfig-016-20260327    gcc-14
x86_64                randconfig-016-20260328    clang-20
x86_64                randconfig-016-20260331    clang-20
x86_64                randconfig-016-20260401    gcc-14
x86_64                randconfig-016-20260402    clang-20
x86_64                randconfig-071-20260327    gcc-13
x86_64                randconfig-071-20260328    gcc-12
x86_64                randconfig-071-20260331    clang-20
x86_64                randconfig-071-20260401    gcc-14
x86_64                randconfig-071-20260402    clang-20
x86_64                randconfig-072-20260327    gcc-13
x86_64                randconfig-072-20260328    gcc-12
x86_64                randconfig-072-20260331    clang-20
x86_64                randconfig-072-20260401    gcc-14
x86_64                randconfig-072-20260402    clang-20
x86_64                randconfig-073-20260327    gcc-13
x86_64                randconfig-073-20260328    gcc-12
x86_64                randconfig-073-20260331    clang-20
x86_64                randconfig-073-20260401    gcc-14
x86_64                randconfig-073-20260402    clang-20
x86_64                randconfig-074-20260327    gcc-13
x86_64                randconfig-074-20260328    gcc-12
x86_64                randconfig-074-20260331    clang-20
x86_64                randconfig-074-20260401    gcc-14
x86_64                randconfig-074-20260402    clang-20
x86_64                randconfig-075-20260327    gcc-13
x86_64                randconfig-075-20260328    gcc-12
x86_64                randconfig-075-20260331    clang-20
x86_64                randconfig-075-20260401    gcc-14
x86_64                randconfig-075-20260402    clang-20
x86_64                randconfig-076-20260327    gcc-13
x86_64                randconfig-076-20260328    gcc-12
x86_64                randconfig-076-20260331    clang-20
x86_64                randconfig-076-20260401    gcc-14
x86_64                randconfig-076-20260402    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260327    gcc-14.3.0
xtensa                randconfig-001-20260328    gcc-14
xtensa                randconfig-001-20260331    gcc-15.2.0
xtensa                randconfig-001-20260401    clang-16
xtensa                randconfig-001-20260402    gcc-14
xtensa                randconfig-002-20260327    gcc-14.3.0
xtensa                randconfig-002-20260328    gcc-14
xtensa                randconfig-002-20260331    gcc-15.2.0
xtensa                randconfig-002-20260401    clang-16
xtensa                randconfig-002-20260402    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


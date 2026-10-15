Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CB5CC6B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DsWqr7Wl5g/5E+xY6x/r0dDseomiel7zEj1NVBXFdpM=; b=zdbUB9JlllzQF5xZwv3ojl3ZMd
	4lQCcascpaO838V3FmIE6xTwTiemyiC3QRa4/Gi+KDiMeGS3i/2slGMxR59QFl0WwGWeg3ndqK1Pe
	KFZdACDeWVdJhB6lZXo3sFB6fPS2Bhz+6pMnN9JcfjFvzo0KfgPyuMGkieLxkxHZY2JRMx8Nn4cmV
	rvIRSqlolqPbAeVwLoYRBbtA5DRkrW/ExdjRj2V9bJ9JAOkumAucs/Gb0qc0wCKU2opLvEKAcx0M9
	cFUrYVHd2SLSZ9gsKPvMlRjHDCRA/QHr6sQGkYkcNGunu4MxSJMID6Kh0zutBaiuFMIrJOKLQMgQ7
	gkEX8f8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH9xw-0000000GWnJ-0Plu;
	Thu, 15 Oct 2026 01:09:04 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH9xt-0000000GWmu-2TYf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792026542; x=1823562542;
  h=date:from:to:cc:subject:message-id;
  bh=PgvYFrSZOZr1+U7I/1rsX1CaynzbOXzTxn8cfJGsS7g=;
  b=LfthgcFFy/7KsWnpbKzlt6ZOq0Swd0MIRjBdmu66kNaP2CnWDBjFc9jM
   z6WBpTUPD/m3I3v/luF3P9VK5PTH02CiAQnMIYJOnD3iadLiC07u4SkC0
   g4aAskGa1rE2wFwP6mW5dsLzdMmYbWsLnxvhze4CIbU+MlQJjbMNmgr/M
   Vo+QZd95OD5QrU+C6+D/vF75xgoM+GOpW3gMhw7PvHHaq4lXx/ZbtjGwW
   e3zYLkLhFbzwXN7oru17f1sZ5poMf/ywiYvrhCr1ggklTHdPawLY12TUQ
   cWc79c3Rb5gh76s2wTWxyXsm8y9zcJw7QYQaYIWUooY2hgykPmYhYWg3n
   g==;
X-CSE-ConnectionGUID: KBSE3c86T8Cmnv0NbUmqxg==
X-CSE-MsgGUID: vD16xqHSRkqetHIOaMvoEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="784883"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="784883"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 18:09:01 -0700
X-CSE-ConnectionGUID: jmrbCGlpRSeShmQ08oBNiA==
X-CSE-MsgGUID: MNJKxDhkS6icIDLwyz+r1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1645791"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Oct 2026 18:08:58 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH9xo-00000000FSa-0xeR;
	Thu, 15 Oct 2026 01:08:56 +0000
Date: Thu, 15 Oct 2026 09:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:qcom:drivers] BUILD SUCCESS
 87802d4dc4850bf27b3955ee9162b1e52c99da1a
Message-ID: <202610150930.M2ZkLsPE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_180901_707375_9D8249B6 
X-CRM114-Status: UNSURE (   4.80  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/drivers
branch HEAD: 87802d4dc4850bf27b3955ee9162b1e52c99da1a  firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA)

elapsed time: 1928m

configs tested: 438
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261014    gcc-8.5.0  cocci
alpha                randconfig-r2102-20261014    gcc-12.5.0 cocci
alpha                randconfig-r2105-20261014    gcc-10.5.0 cocci
alpha                randconfig-r2109-20261014    gcc-13.4.0 cocci
alpha                randconfig-r2306-20261013    gcc-9.5.0  sparse
alpha                randconfig-r2308-20261014    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261014    clang-17
arc                   randconfig-1001-20261014    clang-17
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                  randconfig-r2102-20261014    gcc-8.5.0  cocci
arc                  randconfig-r2306-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261013    gcc-14.3.0 sparse
arc                  randconfig-r2308-20261014    gcc-16.1.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      davinci_all_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       jornada720_defconfig    clang-24
arm                   randconfig-1000-20261014    clang-17
arm                   randconfig-1001-20261014    clang-17
arm                   randconfig-1002-20261014    clang-17
arm                   randconfig-1003-20261014    clang-17
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm                          s3c6400_defconfig    clang-24
arm                            u8500_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261014    gcc-16.1.0
arm64                 randconfig-1000-20261015    gcc-8.5.0
arm64                 randconfig-1001-20261014    gcc-16.1.0
arm64                 randconfig-1001-20261015    gcc-8.5.0
arm64                 randconfig-1002-20261014    gcc-16.1.0
arm64                 randconfig-1002-20261015    gcc-8.5.0
arm64                 randconfig-1003-20261014    gcc-16.1.0
arm64                 randconfig-1003-20261015    gcc-8.5.0
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                randconfig-r2100-20261014    gcc-13.4.0 cocci
arm64                randconfig-r2101-20261014    gcc-11.5.0 cocci
arm64                randconfig-r2104-20261014    gcc-10.5.0 cocci
arm64                randconfig-r2105-20261014    gcc-8.5.0  cocci
arm64                randconfig-r2201-20261014    clang-24   smatch
arm64                randconfig-r2305-20261014    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261014    gcc-16.1.0
csky                  randconfig-1000-20261015    gcc-8.5.0
csky                  randconfig-1001-20261014    gcc-16.1.0
csky                  randconfig-1001-20261015    gcc-8.5.0
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                 randconfig-r2100-20261014    gcc-12.5.0 cocci
csky                 randconfig-r2106-20261014    gcc-10.5.0 cocci
csky                 randconfig-r2108-20261014    gcc-13.4.0 cocci
csky                 randconfig-r2201-20261014    gcc-14.3.0 smatch
csky                 randconfig-r2302-20261014    clang-24   sparse
csky                 randconfig-r2303-20261014    clang-24   sparse
csky                 randconfig-r2309-20261014    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261014    clang-18
hexagon               randconfig-1000-20261015    clang-24
hexagon               randconfig-1001-20261014    clang-18
hexagon               randconfig-1001-20261015    clang-24
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon              randconfig-r2103-20261014    gcc-11.5.0 cocci
hexagon              randconfig-r2104-20261014    gcc-10.5.0 cocci
hexagon              randconfig-r2107-20261014    gcc-10.5.0 cocci
hexagon              randconfig-r2304-20261014    clang-24   sparse
hexagon              randconfig-r2305-20261014    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261014    gcc-14
i386        buildonly-randconfig-1001-20261014    gcc-14
i386        buildonly-randconfig-1002-20261014    gcc-14
i386        buildonly-randconfig-1003-20261014    gcc-14
i386        buildonly-randconfig-1004-20261014    gcc-14
i386        buildonly-randconfig-1005-20261014    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261014    clang-22
i386                  randconfig-1001-20261014    clang-22
i386                  randconfig-1002-20261014    clang-22
i386                  randconfig-1003-20261014    clang-22
i386                  randconfig-1004-20261014    clang-22
i386                  randconfig-1005-20261014    clang-22
i386                  randconfig-1006-20261014    clang-22
i386                  randconfig-1007-20261014    gcc-14
i386                  randconfig-1007-20261015    clang-22
i386                  randconfig-1008-20261014    gcc-14
i386                  randconfig-1008-20261015    clang-22
i386                  randconfig-1009-20261014    gcc-14
i386                  randconfig-1009-20261015    clang-22
i386                  randconfig-1010-20261014    gcc-14
i386                  randconfig-1010-20261015    clang-22
i386                  randconfig-1011-20261014    gcc-14
i386                  randconfig-1011-20261015    clang-22
i386                  randconfig-1012-20261014    gcc-14
i386                  randconfig-1012-20261015    clang-22
i386                  randconfig-1013-20261014    gcc-14
i386                  randconfig-1013-20261015    clang-22
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2100-20261013    clang-22   cocci
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2101-20261013    gcc-14     cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2102-20261013    gcc-12     cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2103-20261013    gcc-14     cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2104-20261013    gcc-12     cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2105-20261013    gcc-14     cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2300-20261013    gcc-14     sparse
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2301-20261013    gcc-14     sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2302-20261013    gcc-14     sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                 randconfig-r2110-20261014    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261014    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261014    clang-24   sparse
i386                 randconfig-r2300-20261014    gcc-13.4.0 sparse
i386                 randconfig-r2305-20261014    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    clang-24
loongarch             randconfig-1000-20261014    clang-18
loongarch             randconfig-1000-20261015    clang-24
loongarch             randconfig-1001-20261014    clang-18
loongarch             randconfig-1001-20261015    clang-24
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch            randconfig-r2104-20261014    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261014    gcc-10.5.0 cocci
loongarch            randconfig-r2301-20261014    clang-24   sparse
loongarch            randconfig-r2302-20261014    gcc-8.5.0  sparse
loongarch            randconfig-r2303-20261014    gcc-13.4.0 sparse
loongarch            randconfig-r2305-20261014    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2103-20261014    gcc-13.4.0 cocci
m68k                 randconfig-r2107-20261014    gcc-10.5.0 cocci
m68k                 randconfig-r2108-20261014    gcc-12.5.0 cocci
m68k                 randconfig-r2200-20261014    gcc-9.5.0  smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261014    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261014    gcc-10.5.0 cocci
microblaze           randconfig-r2310-20261014    gcc-14.3.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath79_defconfig    gcc-16.1.0
mips                 randconfig-r2101-20261014    gcc-13.4.0 cocci
mips                 randconfig-r2103-20261014    gcc-8.5.0  cocci
mips                 randconfig-r2201-20261014    clang-24   smatch
mips                 randconfig-r2302-20261014    clang-24   sparse
mips                 randconfig-r2303-20261014    gcc-8.5.0  sparse
mips                 randconfig-r2304-20261014    gcc-13.4.0 sparse
mips                 randconfig-r2307-20261014    gcc-14     sparse
mips                 randconfig-r2307-20261014    gcc-14.3.0 sparse
mips                 randconfig-r2311-20261014    gcc-16.1.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261014    clang-18
nios2                 randconfig-1000-20261015    clang-24
nios2                 randconfig-1001-20261014    clang-18
nios2                 randconfig-1001-20261015    clang-24
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                randconfig-r2102-20261014    gcc-11.5.0 cocci
nios2                randconfig-r2201-20261013    gcc-8.5.0  smatch
nios2                randconfig-r2302-20261014    gcc-13.4.0 sparse
nios2                randconfig-r2304-20261014    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                    de0_nano_defconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2103-20261013    gcc-14.3.0 cocci
openrisc             randconfig-r2108-20261014    gcc-11.5.0 cocci
openrisc             randconfig-r2200-20261013    gcc-13.4.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261014    clang-22
parisc                randconfig-1000-20261015    gcc-8.5.0
parisc                randconfig-1001-20261014    clang-22
parisc                randconfig-1001-20261015    gcc-8.5.0
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc               randconfig-r2106-20261014    gcc-10.5.0 cocci
parisc               randconfig-r2108-20261014    gcc-8.5.0  cocci
parisc               randconfig-r2202-20261014    gcc-12.5.0 smatch
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                         cell_defconfig    clang-24
powerpc                       pasemi_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261014    clang-22
powerpc               randconfig-1000-20261015    gcc-8.5.0
powerpc               randconfig-1001-20261014    clang-22
powerpc               randconfig-1001-20261015    gcc-8.5.0
powerpc               randconfig-2000-20261013    gcc-8.5.0
powerpc               randconfig-2000-20261014    clang-22
powerpc               randconfig-2001-20261013    clang-22
powerpc               randconfig-2001-20261014    clang-22
powerpc              randconfig-r2107-20261014    gcc-8.5.0  cocci
powerpc              randconfig-r2111-20261014    gcc-10.5.0 cocci
powerpc              randconfig-r2300-20261014    clang-24   sparse
powerpc              randconfig-r2308-20261014    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261014    gcc-16.1.0 sparse
powerpc              randconfig-r2310-20261014    gcc-8.5.0  sparse
powerpc                      tqm8540_defconfig    clang-24
powerpc64             randconfig-1000-20261014    clang-22
powerpc64             randconfig-1000-20261015    gcc-8.5.0
powerpc64             randconfig-1001-20261014    clang-22
powerpc64             randconfig-1001-20261015    gcc-8.5.0
powerpc64             randconfig-2000-20261013    gcc-8.5.0
powerpc64             randconfig-2000-20261014    clang-22
powerpc64             randconfig-2001-20261013    gcc-14.3.0
powerpc64             randconfig-2001-20261014    clang-22
powerpc64            randconfig-r2101-20261014    gcc-12.5.0 cocci
powerpc64            randconfig-r2108-20261013    clang-24   cocci
powerpc64            randconfig-r2301-20261014    clang-24   sparse
powerpc64            randconfig-r2304-20261014    gcc-8.5.0  sparse
powerpc64            randconfig-r2306-20261014    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261014    clang-18
riscv                 randconfig-1000-20261015    gcc-11.5.0
riscv                 randconfig-1001-20261014    clang-18
riscv                 randconfig-1001-20261015    gcc-11.5.0
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
riscv                randconfig-r2102-20261013    clang-24   cocci
riscv                randconfig-r2307-20261013    gcc-16.1.0 sparse
riscv                randconfig-r2307-20261014    gcc-16.1.0 sparse
riscv                randconfig-r2309-20261013    gcc-12.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261014    clang-18
s390                  randconfig-1000-20261015    gcc-11.5.0
s390                  randconfig-1001-20261014    clang-18
s390                  randconfig-1001-20261015    gcc-11.5.0
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                 randconfig-r2106-20261014    gcc-8.5.0  cocci
s390                 randconfig-r2109-20261014    gcc-12.5.0 cocci
s390                 randconfig-r2200-20261014    gcc-8.5.0  smatch
s390                 randconfig-r2202-20261013    gcc-15.2.0 smatch
s390                 randconfig-r2310-20261014    gcc-16.1.0 sparse
s390                 randconfig-r2311-20261013    clang-24   sparse
s390                 randconfig-r2311-20261014    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          ap325rxa_defconfig    clang-24
sh                          ap325rxa_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261014    clang-18
sh                    randconfig-1000-20261015    gcc-11.5.0
sh                    randconfig-1001-20261014    clang-18
sh                    randconfig-1001-20261015    gcc-11.5.0
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sh                   randconfig-r2309-20261014    gcc-8.5.0  sparse
sh                   randconfig-r2311-20261014    gcc-14     sparse
sh                   randconfig-r2311-20261014    gcc-8.5.0  sparse
sh                            se7619_defconfig    gcc-16.1.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261014    clang-24
sparc                 randconfig-1000-20261015    gcc-8.5.0
sparc                 randconfig-1001-20261014    clang-24
sparc                 randconfig-1001-20261015    gcc-8.5.0
sparc                 randconfig-2000-20261013    gcc-11.5.0
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261013    gcc-16.1.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                randconfig-r2103-20261014    gcc-12.5.0 cocci
sparc                randconfig-r2110-20261014    gcc-8.5.0  cocci
sparc                randconfig-r2300-20261014    gcc-8.5.0  sparse
sparc                randconfig-r2301-20261014    gcc-13.4.0 sparse
sparc                randconfig-r2303-20261014    clang-24   sparse
sparc                randconfig-r2304-20261014    clang-24   sparse
sparc                randconfig-r2306-20261014    gcc-16.1.0 sparse
sparc                randconfig-r2309-20261014    gcc-14     sparse
sparc                randconfig-r2310-20261013    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261014    clang-24
sparc64               randconfig-1000-20261015    gcc-8.5.0
sparc64               randconfig-1001-20261014    clang-24
sparc64               randconfig-1001-20261015    gcc-8.5.0
sparc64               randconfig-2000-20261013    clang-24
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261013    clang-24
sparc64               randconfig-2001-20261014    gcc-14.3.0
sparc64              randconfig-r2100-20261013    clang-24   cocci
sparc64              randconfig-r2102-20261014    gcc-13.4.0 cocci
sparc64              randconfig-r2109-20261013    clang-24   cocci
sparc64              randconfig-r2202-20261014    clang-22   smatch
sparc64              randconfig-r2301-20261014    gcc-8.5.0  sparse
sparc64              randconfig-r2305-20261014    gcc-13.4.0 sparse
sparc64              randconfig-r2310-20261014    gcc-14     sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261014    clang-24
um                    randconfig-1000-20261015    gcc-8.5.0
um                    randconfig-1001-20261014    clang-24
um                    randconfig-1001-20261015    gcc-8.5.0
um                    randconfig-2000-20261013    gcc-14
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2001-20261013    gcc-14
um                    randconfig-2001-20261014    gcc-14.3.0
um                   randconfig-r2109-20261014    gcc-8.5.0  cocci
um                   randconfig-r2200-20261014    clang-17   smatch
um                   randconfig-r2302-20261014    clang-24   sparse
um                   randconfig-r2308-20261014    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261014    clang-22
x86_64      buildonly-randconfig-1001-20261014    clang-22
x86_64      buildonly-randconfig-1002-20261014    clang-22
x86_64      buildonly-randconfig-1003-20261014    clang-22
x86_64      buildonly-randconfig-1004-20261014    clang-22
x86_64      buildonly-randconfig-1005-20261014    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261014    gcc-14
x86_64                randconfig-1001-20261014    gcc-14
x86_64                randconfig-1002-20261014    gcc-14
x86_64                randconfig-1003-20261014    gcc-14
x86_64                randconfig-1004-20261014    gcc-14
x86_64                randconfig-1005-20261014    gcc-14
x86_64                randconfig-1006-20261014    gcc-14
x86_64                randconfig-1007-20261014    gcc-14
x86_64                randconfig-1008-20261014    gcc-14
x86_64                randconfig-1009-20261014    gcc-14
x86_64                randconfig-1010-20261014    gcc-14
x86_64                randconfig-1011-20261014    gcc-14
x86_64                randconfig-1012-20261014    gcc-14
x86_64                randconfig-1012-20261015    gcc-13
x86_64                randconfig-1013-20261014    gcc-14
x86_64                randconfig-1013-20261015    gcc-13
x86_64                randconfig-1014-20261014    gcc-14
x86_64                randconfig-1014-20261015    gcc-13
x86_64                randconfig-1015-20261014    gcc-14
x86_64                randconfig-1015-20261015    gcc-13
x86_64                randconfig-1016-20261014    gcc-14
x86_64                randconfig-1016-20261015    gcc-13
x86_64                randconfig-1017-20261014    gcc-14
x86_64                randconfig-1017-20261015    gcc-13
x86_64                randconfig-2000-20261013    gcc-14
x86_64                randconfig-2000-20261014    clang-22
x86_64                randconfig-2001-20261013    gcc-14
x86_64                randconfig-2001-20261014    clang-22
x86_64                randconfig-2100-20261013    clang-22   cocci
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2101-20261013    gcc-14     cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2102-20261013    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2103-20261013    gcc-14     cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2104-20261013    gcc-14     cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2105-20261013    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2200-20261013    gcc-13     smatch
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2300-20261013    gcc-14     sparse
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2301-20261013    clang-22   sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2302-20261013    gcc-14     sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64               randconfig-r2101-20261013    clang-22   cocci
x86_64               randconfig-r2109-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2202-20261014    clang-22   smatch
x86_64               randconfig-r2306-20261014    gcc-14     sparse
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
xtensa                randconfig-1000-20261014    clang-24
xtensa                randconfig-1000-20261015    gcc-8.5.0
xtensa                randconfig-1001-20261014    clang-24
xtensa                randconfig-1001-20261015    gcc-8.5.0
xtensa                randconfig-2000-20261013    gcc-8.5.0
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261013    gcc-11.5.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa               randconfig-r2100-20261014    gcc-11.5.0 cocci
xtensa               randconfig-r2303-20261014    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


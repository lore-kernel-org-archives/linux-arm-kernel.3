Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EE9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 18:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nKm+2jLJzQjlOVIXUnYb838tD02sd/ViHbfbQJoph58=; b=3cOygIJAeN6+NT6eTZhWqXxg4s
	zCN7DikzyLjAe0uffUrS5wMu4WBIC+pOaSiVndhTESmXqkrdTVVFU82DZaFXw3W4tDC59Nl30VVnH
	kYfwRldUfc2tUtcgyacSLtcX2DYJkcn4Jrfsp8Q0vvkMM2V/EnlsPa+iit4F38bI93+y0NJfgU3UZ
	yE3UB90Sn/7qjOi3efUIVzY38EsxHkQ2DBzOAsQVDVt/U9z59jxHWNTUTUMZdWCPKqGd8YBoPL5k3
	BceCTR6bW55hEq19WZ/8kfiJNCTH4VvZPSEg5nBoS8O9N8nZZXHJY1NC0mDIQirU95G9VzMxC5TYL
	f5ZDfjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP49E-00000007HWF-3AAC;
	Sat, 21 Dec 2024 18:24:20 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP46V-00000007H8x-0c4m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 18:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734805291; x=1766341291;
  h=date:from:to:cc:subject:message-id;
  bh=R70Omeeu5rJbgB7oyB/GXxztXx9pijKD8US33KhnsGw=;
  b=ZaE1RRozDze21yTZ+Rv5Y0tzRy7J6XkAemYLtN8EbU+y/+vu6c3uephL
   xNLTFQ4y2m0bExv/oXUH8MB4aeGBK8Vy/n4rK5OMYgLUmJZIfIvkICwpe
   nnKbL5uvgY3bxPmbPd49h8ynHyjmciWA12K5tylzzOtSPG7k3zs8P1TcJ
   ajElrIjlu9ar+/3FNO3iWur8HUU/oXyiOxZxVjRN5FTNTTmwMICdTBll6
   OdclWXX/4n8mIUqYI7ltHgi0wGrLSdoNw8ZF5uSJzud3xNeg+E2bQSz28
   h4sfDGMnU2g9Vqoc5GWAvA5g74d/cOlZ89PFtVI5MtrSfOQy7XGf/pPiG
   Q==;
X-CSE-ConnectionGUID: DWAeZLL2Q/OwE9jdgxn7MA==
X-CSE-MsgGUID: W0WI2D5BQyqk6nvfVnJl8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="45933726"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="45933726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:21:31 -0800
X-CSE-ConnectionGUID: 99Kx+XviQ8urqrYBAFdBFw==
X-CSE-MsgGUID: fA5YS30BTDi0FjUNnWcycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98873951"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2024 10:21:30 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP46R-0002O0-1C;
	Sat, 21 Dec 2024 18:21:27 +0000
Date: Sun, 22 Dec 2024 02:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 b5d57dcb214665c17dbd8606797a36a2048ae345
Message-ID: <202412220221.VOgu1nPI-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_102131_203763_E960868C 
X-CRM114-Status: UNSURE (   4.75  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: b5d57dcb214665c17dbd8606797a36a2048ae345  soc: document merges

elapsed time: 1447m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241221    gcc-13.2.0
arc                   randconfig-002-20241221    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241221    gcc-14.2.0
arm                   randconfig-002-20241221    gcc-14.2.0
arm                   randconfig-003-20241221    gcc-14.2.0
arm                   randconfig-004-20241221    clang-18
arm                          sp7021_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241221    clang-18
arm64                 randconfig-002-20241221    clang-16
arm64                 randconfig-003-20241221    clang-20
arm64                 randconfig-004-20241221    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241221    gcc-14.2.0
csky                  randconfig-002-20241221    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-002-20241221    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241221    gcc-12
i386        buildonly-randconfig-002-20241221    gcc-12
i386        buildonly-randconfig-003-20241221    clang-19
i386        buildonly-randconfig-004-20241221    clang-19
i386        buildonly-randconfig-005-20241221    clang-19
i386        buildonly-randconfig-006-20241221    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241221    gcc-14.2.0
loongarch             randconfig-002-20241221    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241221    gcc-14.2.0
nios2                 randconfig-002-20241221    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241221    gcc-14.2.0
parisc                randconfig-002-20241221    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    clang-20
powerpc               randconfig-001-20241221    gcc-14.2.0
powerpc               randconfig-002-20241221    gcc-14.2.0
powerpc               randconfig-003-20241221    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241221    gcc-14.2.0
powerpc64             randconfig-002-20241221    gcc-14.2.0
powerpc64             randconfig-003-20241221    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241221    gcc-14.2.0
riscv                 randconfig-002-20241221    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241221    gcc-14.2.0
s390                  randconfig-002-20241221    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241221    gcc-14.2.0
sh                    randconfig-002-20241221    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241221    gcc-14.2.0
sparc                 randconfig-002-20241221    gcc-14.2.0
sparc64               randconfig-001-20241221    gcc-14.2.0
sparc64               randconfig-002-20241221    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241221    clang-18
um                    randconfig-002-20241221    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241221    gcc-12
x86_64      buildonly-randconfig-002-20241221    gcc-12
x86_64      buildonly-randconfig-003-20241221    gcc-12
x86_64      buildonly-randconfig-004-20241221    gcc-12
x86_64      buildonly-randconfig-005-20241221    gcc-11
x86_64      buildonly-randconfig-006-20241221    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241221    gcc-14.2.0
xtensa                randconfig-002-20241221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


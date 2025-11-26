Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B19AD11183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JKOxvZQGIRK6JKVYaVZ7aEDAgMUgtEIpNRjTwaJvO/4=; b=gnGe1wLVuqEWUWIl9sTqAUTPvP
	uelhhHobXKKJDUPphpBN/s549j9L3yVRurHYQcgrmxq7wa5KQ+srVqQdAT37vN30C3LtVe2MyxEcp
	ER+ukPWC/KJa/Ddf+GTxxiQmoYpogmT6p0lbXMPGxfxAPI4krTCxUTCy6swJTiL75MY66NqWj7xHL
	n02EyJjdD53gjCACVs21lC8sA2MZtdPoXIac7vVx8KHJhneNJUMnPddf5VvauULxa9FoqvdyEXBs7
	6/M/PeU/leUGzbuXTC9y2aUSKJNgXyBx7Q78Yv4JHyluyj5/t48DbHRwtVxH5sY1im1bzUU+nKTlQ
	/Kh+X1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIDc-0000000FHib-0O9m;
	Wed, 26 Nov 2025 16:18:12 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIDZ-0000000FHhr-2QMT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764173890; x=1795709890;
  h=date:from:to:cc:subject:message-id;
  bh=6oEIukgb/AoJoD80+SNUTwb93fb+O/GAQZF8TXtoLcA=;
  b=IUBi+CKKTpmjETL1N51MBhDjBowWYe1UNCsIlTliLBvBCXaWz9fgzcC9
   ixD6Qoh0U0Lv3Rc4XljzrJcEhtc6VcA/biIlvOUL0P6ZdkDaJ5O9y4Rry
   nnmZWMaOsPXAEOU8uZzJaChb9MlMo1gWC1PJBdgALoHXPli+5tN/d19UU
   L94iSXZwk7Ie4DnWHy1eQlfbfJ1UzELgLP3b4JfU2veQnyliARGqft6zn
   GbdXtqEIsmJ6GAp8uDN5FSxz+OPxuSFlJug/wn4HT6QwxkzFo3CaPNAeG
   taZ4sYCY/KmBubZx7aRJfFboUxANHZjt1vS4F52+6kf50ERn0ilwTDIcZ
   Q==;
X-CSE-ConnectionGUID: mSxnv6DdTQ++I0v+s8pZtA==
X-CSE-MsgGUID: bu5JN5v/TA6Ipk7oNoIkvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66256931"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66256931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:18:08 -0800
X-CSE-ConnectionGUID: eWn8QgftTdyW8giyLV/nhw==
X-CSE-MsgGUID: W5ck4acnTRmOL4BihADslw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193211499"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2025 08:18:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOIDU-0000000036H-3hHY;
	Wed, 26 Nov 2025 16:18:04 +0000
Date: Thu, 27 Nov 2025 00:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:drivers/reset] BUILD SUCCESS
 1387cb78f101553c7fc14ec04ba730cab03ea3df
Message-ID: <202511270014.PODeS1SE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_081809_662076_240604E7 
X-CRM114-Status: UNSURE (   5.43  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git drivers/reset
branch HEAD: 1387cb78f101553c7fc14ec04ba730cab03ea3df  Documentation: reset: Remove reset_controller_add_lookup()

elapsed time: 1602m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251125    gcc-9.5.0
arc                   randconfig-002-20251125    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                            mmp2_defconfig    gcc-15.1.0
arm                   randconfig-001-20251125    clang-22
arm                   randconfig-002-20251125    gcc-10.5.0
arm                   randconfig-003-20251125    gcc-10.5.0
arm                   randconfig-004-20251125    gcc-8.5.0
arm                        spear6xx_defconfig    clang-22
arm                           spitz_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251126    gcc-8.5.0
arm64                 randconfig-003-20251126    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251126    gcc-11.5.0
csky                  randconfig-002-20251126    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251125    clang-19
hexagon               randconfig-002-20251125    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251126    clang-20
i386        buildonly-randconfig-002-20251126    gcc-14
i386        buildonly-randconfig-003-20251126    clang-20
i386        buildonly-randconfig-004-20251126    clang-20
i386        buildonly-randconfig-005-20251126    clang-20
i386        buildonly-randconfig-006-20251126    gcc-14
i386                  randconfig-001-20251126    clang-20
i386                  randconfig-002-20251126    clang-20
i386                  randconfig-003-20251126    gcc-14
i386                  randconfig-004-20251126    clang-20
i386                  randconfig-005-20251126    gcc-14
i386                  randconfig-006-20251126    gcc-14
i386                  randconfig-007-20251126    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251125    gcc-15.1.0
loongarch             randconfig-002-20251125    gcc-12.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251125    gcc-8.5.0
nios2                 randconfig-002-20251125    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251126    gcc-8.5.0
parisc                randconfig-002-20251126    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-22
powerpc               randconfig-001-20251126    gcc-10.5.0
powerpc               randconfig-002-20251126    gcc-8.5.0
powerpc64             randconfig-001-20251126    clang-19
powerpc64             randconfig-002-20251126    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251126    gcc-10.5.0
riscv                 randconfig-002-20251126    clang-22
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251126    gcc-8.5.0
s390                  randconfig-002-20251126    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                    randconfig-001-20251126    gcc-14.3.0
sh                    randconfig-002-20251126    gcc-11.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251126    gcc-8.5.0
sparc                 randconfig-002-20251126    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251126    gcc-8.5.0
sparc64               randconfig-002-20251126    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251126    clang-19
um                    randconfig-002-20251126    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251126    clang-20
x86_64      buildonly-randconfig-002-20251126    gcc-14
x86_64      buildonly-randconfig-003-20251126    clang-20
x86_64      buildonly-randconfig-004-20251126    clang-20
x86_64      buildonly-randconfig-005-20251126    gcc-14
x86_64      buildonly-randconfig-006-20251126    clang-20
x86_64                              defconfig    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251126    gcc-14.3.0
xtensa                randconfig-002-20251126    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


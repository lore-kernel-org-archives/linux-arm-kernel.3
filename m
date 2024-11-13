Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12933D41C30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jzqkNChPlqhBoU3sQctYXfkUASlkp/JRIqbHtyENv7I=; b=UqmKJ4OxYsrqW4Cygv0fesBYTN
	35a8RHwT2mpeRH1g/H+KQr+Q1QSGUZmyhOHyjWZANnufNWwnezpeeols4q5E6oM+tXoNNxgGmjbus
	7FKOBwFW+fo62zrCEKPWR8/uFM9dGNTAO5H3xXMA51S/pMAYUj+SlIGAHmJzzO+iyW98q1q1YV/9B
	gV7jsnSmn2r4vGYxB1BhJqrKf3QWuJn6EJfuepavJ5PFUZAU7mh2W2yud2Gt472BnAAKAWJGZXFVS
	EQ/2EZGt9syhTjtYJ3S1W3jdeLrLLrF6hq/QIeWA4iwEQ4YDNt2CM86Rr5bKbFNX+fVr7hzxbPVNP
	25sMV6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAf0-00000006S34-2KfW;
	Wed, 13 Nov 2024 10:31:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAPs-00000006PJA-1xIZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Nov 2024 10:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=jzqkNChPlqhBoU3sQctYXfkUASlkp/JRIqbHtyENv7I=; b=Ue5dmMyUSfutBmtZtFz5oVO/Tw
	gajwsOow3TFtZx4iOnok4NJCE7jpHZoWcPs2xEF1xuH1YeFyOoeANLyKfWFwHhIjeMC+UtYWKmBmG
	3P2lXNP/6jPyucpuELsVQmfrBRR0j7LStnbfCQ083i3NKJLWnNP3D6tqH+GbSV8RmO0A1y7txhWAr
	EOSa/g4Y98G3La3MSok2MrB8BP9P8hSDxkAtH0xZshwAT6RYBtCLRoTMx+2a4Int0Q2wnpwX6TP+M
	itYQLlYzGMrYG8JZZIzbVoPsWCfH/BFmqsB/ew8THpActVQvdGXiSOjlFXwvDc1sB0YnkRGHLRrKw
	MRqwnaWg==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAPn-0000000DFAl-1K5R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 10:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731492961; x=1763028961;
  h=date:from:to:cc:subject:message-id;
  bh=OH8TsJYfpqjP6gsv9Pb0RD7jtreiBy69ZyzlBcJJe/M=;
  b=l7OwHilwReBTlkJyGKy+yjO2KpyDL4/4+D3VQc0ErOQ0OfrMWGDSr8+y
   0H2xpCQQzdSlX4mRqwORe4FRomzk964LQZgz5+rQl85ngS3D8SthmNmaH
   wrdren2lKJJyc55rHgbx9l65IJZoDmyHZHGEUMpgM5sdiYa+cTeDGan2f
   hNsdl29unk1np/JmWk1mPhmVJQkeglVMpW2DVRc+GsBQHcOOqiMtAn621
   w5tPGhL7waPcrKF1mVS1MUwZopgSdlQU56bljCGuvoyZG52E7l6Qg/glw
   +lGRzNXPYaxT8bzctkadx9JEmPgWU3anV5JPuQQkJNCyni1tnAP/XueYQ
   w==;
X-CSE-ConnectionGUID: uH/eockiSNSQDO81jiF3gA==
X-CSE-MsgGUID: LdBkeLX8Q6uV0xAr8ARfbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31147288"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31147288"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:15:54 -0800
X-CSE-ConnectionGUID: eUqcZWftRGe8Q2NZ0VAvdQ==
X-CSE-MsgGUID: cgDGo4y6TQqSZgwkuUmGMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="92905642"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2024 02:15:53 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBAPe-0000Dr-1D;
	Wed, 13 Nov 2024 10:15:50 +0000
Date: Wed, 13 Nov 2024 18:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:omap/dt] BUILD SUCCESS
 13be2307b577726bf2e4a9029738912c03d53aa9
Message-ID: <202411131848.nusLuSAb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_101601_159960_8BBB6F3A 
X-CRM114-Status: UNSURE (   5.39  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap/dt
branch HEAD: 13be2307b577726bf2e4a9029738912c03d53aa9  ARM: dts: omap4-kc1: fix twl6030 power node

elapsed time: 736m

configs tested: 121
configs skipped: 97

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241113    clang-19
i386        buildonly-randconfig-002-20241113    clang-19
i386        buildonly-randconfig-003-20241113    clang-19
i386        buildonly-randconfig-004-20241113    clang-19
i386        buildonly-randconfig-005-20241113    clang-19
i386        buildonly-randconfig-006-20241113    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241113    clang-19
i386                  randconfig-002-20241113    clang-19
i386                  randconfig-003-20241113    clang-19
i386                  randconfig-004-20241113    clang-19
i386                  randconfig-005-20241113    clang-19
i386                  randconfig-006-20241113    clang-19
i386                  randconfig-011-20241113    clang-19
i386                  randconfig-012-20241113    clang-19
i386                  randconfig-013-20241113    clang-19
i386                  randconfig-014-20241113    clang-19
i386                  randconfig-015-20241113    clang-19
i386                  randconfig-016-20241113    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                       maple_defconfig    gcc-14.2.0
powerpc                  mpc885_ads_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


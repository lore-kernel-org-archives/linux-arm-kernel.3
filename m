Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA31CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qafY+l1s4JTVoeHjMwA9ntLNoQCvFclO9ozQnhVi554=; b=yVrM+BRdYphBJO/qvwPZX9rfuy
	lJnQk8/b567SWcQxOPzxJAp1ynawNPtVb9vLHPH0fhtBmDqk6YP+YX/JvsSTITG874on91hYyInQX
	hDlgP1Jqo0p98YdMiaeZVumT42/S/qYBm/g2Oc9W9qcRNKQOrU2S/ZiA1vh2oqYCMh7y/fPxNLnEF
	4mcQdebWi3XQiXIXBfiqUkPjIumwq906sowgNixNNulpboOwQiJO7JQb/4ECN8cB/YBIdb/3NXdMi
	k5yMPZiNjaIc4NUZMaLR46+X/BbJfpnjkA7vama4gwk3K2nPXOfpp5ddVJOT/CASIEUb9x2z6CnN/
	W1CjQFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZJC-0000000B5ud-1TL2;
	Fri, 02 Oct 2026 09:12:02 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZJ2-0000000B5qJ-20sS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790932312; x=1822468312;
  h=date:from:to:cc:subject:message-id;
  bh=mRsAR7ycbsmnZNI342bK3uW4CkkyAhNCMf5r/1+4x/8=;
  b=T7ELja8L6x7FgPx972BsOV5zp4DkvGVRO4SdH4xYP5toNEP91fNOtOC/
   e74oNqFYuWPAirUJw4tql2pWW8od/nNM4r0WoKfg8QLdJ6ZOKOlQ1waem
   AoUptHTTlnFewU1QISMxduypfginaKiF9lnABeSy56dgiLmeDRxfxqWDY
   OSZsQauZagd8d4keGPykeSI7TKZZEhzcAlFMZKntQLvw+ozbeOxeXTnTd
   +G5ruKzPyYjjVCvSOU8807XxSKKhf+85NNQXDr32A186mwys+WgQ+FgSc
   y9QGsJhPba5SWz2Ws4YPt3yq5wTVXau/hsLx2ViGZWhIcF613aqPW2mMc
   g==;
X-CSE-ConnectionGUID: NmLsRgDeR/W/BAhmSFMC4w==
X-CSE-MsgGUID: CYiGTBkcQO2puBplmmLdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90834525"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90834525"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:11:49 -0700
X-CSE-ConnectionGUID: VTU582xMS/y882otJ5sOYQ==
X-CSE-MsgGUID: exvdzQltQ7aIewYiMpVP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="272612878"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Oct 2026 02:11:47 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZIv-00000000SsE-1Dgb;
	Fri, 02 Oct 2026 09:11:45 +0000
Date: Fri, 02 Oct 2026 17:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc:dt] BUILD SUCCESS
 497b269da564db66af3d1b0191c0b8e9339b1b69
Message-ID: <202610021729.iNRxxRuQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021152_582419_1AE040C3 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: 497b269da564db66af3d1b0191c0b8e9339b1b69  Merge tag 'juno-updates-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into soc/dt

elapsed time: 1083m

configs tested: 319
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2307-20261001    gcc-16.1.0 sparse
alpha                randconfig-r2307-20261002    gcc-13.4.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261002    clang-17
arc                   randconfig-1001-20261002    clang-17
arc                  randconfig-r2101-20261001    gcc-13.4.0 cocci
arc                  randconfig-r2102-20261001    gcc-13.4.0 cocci
arc                  randconfig-r2308-20261001    gcc-16.1.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                             dove_defconfig    gcc-16.1.0
arm                       integrator_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261002    clang-17
arm                   randconfig-1001-20261002    clang-17
arm                   randconfig-1002-20261002    clang-17
arm                   randconfig-1003-20261002    clang-17
arm                  randconfig-r2103-20261001    gcc-8.5.0  cocci
arm                  randconfig-r2201-20261001    gcc-16.1.0 smatch
arm                          s3c6400_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261002    gcc-12.5.0
arm64                 randconfig-1001-20261002    gcc-12.5.0
arm64                 randconfig-1002-20261002    gcc-12.5.0
arm64                 randconfig-1003-20261002    gcc-12.5.0
arm64                randconfig-r2101-20261002    gcc-14     cocci
arm64                randconfig-r2104-20261002    clang-17   cocci
arm64                randconfig-r2300-20261001    gcc-9.5.0  sparse
arm64                randconfig-r2303-20261001    gcc-15.2.0 sparse
arm64                randconfig-r2303-20261001    gcc-9.5.0  sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261002    gcc-12.5.0
csky                  randconfig-1001-20261002    gcc-12.5.0
csky                 randconfig-r2105-20261001    clang-24   cocci
csky                 randconfig-r2107-20261002    gcc-14     cocci
csky                 randconfig-r2302-20261001    gcc-14     sparse
csky                 randconfig-r2305-20261001    gcc-9.5.0  sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261002    gcc-13.4.0
hexagon               randconfig-1001-20261002    gcc-13.4.0
hexagon              randconfig-r2104-20261001    clang-24   cocci
hexagon              randconfig-r2106-20261001    clang-24   cocci
hexagon              randconfig-r2202-20261002    clang-18   smatch
hexagon              randconfig-r2300-20261001    gcc-14     sparse
hexagon              randconfig-r2303-20261001    gcc-14     sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261002    clang-22
i386        buildonly-randconfig-1001-20261002    clang-22
i386        buildonly-randconfig-1002-20261002    clang-22
i386        buildonly-randconfig-1003-20261002    clang-22
i386        buildonly-randconfig-1004-20261002    clang-22
i386        buildonly-randconfig-1005-20261002    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261002    gcc-14
i386                  randconfig-1001-20261002    gcc-14
i386                  randconfig-1002-20261002    gcc-14
i386                  randconfig-1003-20261002    gcc-14
i386                  randconfig-1004-20261002    gcc-14
i386                  randconfig-1005-20261002    gcc-14
i386                  randconfig-1006-20261002    gcc-14
i386                  randconfig-1007-20261002    clang-22
i386                  randconfig-1008-20261002    clang-22
i386                  randconfig-1009-20261002    clang-22
i386                  randconfig-1010-20261002    clang-22
i386                  randconfig-1011-20261002    clang-22
i386                  randconfig-1012-20261002    clang-22
i386                  randconfig-1013-20261002    clang-22
i386                  randconfig-2100-20261001    gcc-14     cocci
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2101-20261001    gcc-14     cocci
i386                  randconfig-2101-20261002    gcc-14     cocci
i386                  randconfig-2102-20261001    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2103-20261001    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2200-20261001    clang-22   smatch
i386                  randconfig-2200-20261002    gcc-14     smatch
i386                  randconfig-2300-20261001    gcc-14     sparse
i386                  randconfig-2301-20261001    gcc-14     sparse
i386                  randconfig-2302-20261001    gcc-14     sparse
i386                 randconfig-r2103-20261001    gcc-9.5.0  cocci
i386                 randconfig-r2309-20261002    gcc-13.4.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261002    gcc-13.4.0
loongarch             randconfig-1001-20261002    gcc-13.4.0
loongarch            randconfig-r2102-20261001    gcc-8.5.0  cocci
loongarch            randconfig-r2104-20261001    gcc-14     cocci
loongarch            randconfig-r2107-20261001    gcc-14     cocci
loongarch            randconfig-r2201-20261001    clang-18   smatch
loongarch            randconfig-r2202-20261001    clang-21   smatch
loongarch            randconfig-r2305-20261001    gcc-15.2.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.1.0
m68k                        m5275evb_defconfig    gcc-16.1.0
m68k                       m54418evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261002    gcc-14     cocci
m68k                 randconfig-r2105-20261002    clang-17   cocci
m68k                 randconfig-r2200-20261001    gcc-8.5.0  smatch
m68k                 randconfig-r2301-20261001    gcc-14     sparse
m68k                 randconfig-r2302-20261001    gcc-9.5.0  sparse
m68k                 randconfig-r2306-20261002    gcc-13.4.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2200-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2201-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2202-20261002    gcc-8.5.0  smatch
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                      decstation_defconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                            mtx1_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261001    gcc-8.5.0  cocci
mips                 randconfig-r2102-20261001    gcc-9.5.0  cocci
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261002    gcc-13.4.0
nios2                 randconfig-1001-20261002    gcc-13.4.0
nios2                randconfig-r2100-20261001    gcc-9.5.0  cocci
nios2                randconfig-r2101-20261001    gcc-9.5.0  cocci
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261002    gcc-14     cocci
openrisc             randconfig-r2307-20261001    gcc-16.1.0 sparse
openrisc             randconfig-r2308-20261001    clang-20   sparse
openrisc             randconfig-r2308-20261002    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261002    gcc-14.3.0
parisc                randconfig-1001-20261002    gcc-14.3.0
parisc               randconfig-r2106-20261001    gcc-14     cocci
parisc               randconfig-r2107-20261001    clang-24   cocci
parisc               randconfig-r2200-20261001    gcc-8.5.0  smatch
parisc               randconfig-r2302-20261001    gcc-15.2.0 sparse
parisc               randconfig-r2304-20261001    gcc-15.2.0 sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                   iss476-smp_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    gcc-16.1.0
powerpc                      mpc83xx_defconfig    gcc-16.1.0
powerpc                       pcm030_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261002    gcc-14.3.0
powerpc               randconfig-1001-20261002    gcc-14.3.0
powerpc              randconfig-r2301-20261001    gcc-15.2.0 sparse
powerpc                      tqm8555_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261002    gcc-14.3.0
powerpc64             randconfig-1001-20261002    gcc-14.3.0
powerpc64            randconfig-r2306-20261001    gcc-16.1.0 sparse
powerpc64            randconfig-r2309-20261001    clang-20   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261002    clang-24
riscv                 randconfig-1001-20261002    clang-24
riscv                 randconfig-2000-20261001    gcc-10.5.0
riscv                 randconfig-2001-20261001    gcc-10.5.0
riscv                randconfig-r2103-20261002    gcc-14     cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261002    clang-24
s390                  randconfig-1001-20261002    clang-24
s390                  randconfig-2000-20261001    gcc-10.5.0
s390                  randconfig-2001-20261001    gcc-10.5.0
s390                 randconfig-r2100-20261001    gcc-13.4.0 cocci
s390                 randconfig-r2106-20261002    clang-17   cocci
s390                 randconfig-r2306-20261001    clang-20   sparse
s390                 randconfig-r2308-20261001    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          ap325rxa_defconfig    gcc-16.1.0
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261002    clang-24
sh                    randconfig-1001-20261002    clang-24
sh                    randconfig-2000-20261001    gcc-10.5.0
sh                    randconfig-2001-20261001    gcc-10.5.0
sh                   randconfig-r2306-20261001    gcc-16.1.0 sparse
sh                           sdk7780_defconfig    gcc-16.1.0
sh                            se7780_defconfig    gcc-16.1.0
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261002    clang-24
sparc                 randconfig-1001-20261002    clang-24
sparc                 randconfig-2000-20261001    clang-24
sparc                 randconfig-2000-20261002    clang-24
sparc                 randconfig-2001-20261001    clang-24
sparc                 randconfig-2001-20261002    clang-24
sparc                randconfig-r2201-20261002    gcc-8.5.0  smatch
sparc                randconfig-r2309-20261001    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261002    clang-24
sparc64               randconfig-1001-20261002    clang-24
sparc64               randconfig-2000-20261001    clang-24
sparc64               randconfig-2000-20261002    clang-24
sparc64               randconfig-2001-20261001    clang-24
sparc64               randconfig-2001-20261002    clang-24
sparc64              randconfig-r2101-20261001    gcc-8.5.0  cocci
sparc64              randconfig-r2103-20261001    gcc-13.4.0 cocci
sparc64              randconfig-r2106-20261002    gcc-14     cocci
sparc64              randconfig-r2107-20261002    clang-17   cocci
sparc64              randconfig-r2301-20261001    gcc-9.5.0  sparse
sparc64              randconfig-r2304-20261001    gcc-14     sparse
sparc64              randconfig-r2307-20261001    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261002    clang-24
um                    randconfig-1001-20261002    clang-24
um                    randconfig-2000-20261001    clang-24
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2001-20261001    clang-24
um                    randconfig-2001-20261002    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261002    gcc-14
x86_64      buildonly-randconfig-1001-20261002    gcc-14
x86_64      buildonly-randconfig-1002-20261002    gcc-14
x86_64      buildonly-randconfig-1003-20261002    gcc-14
x86_64      buildonly-randconfig-1004-20261002    gcc-14
x86_64      buildonly-randconfig-1005-20261002    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261002    gcc-14
x86_64                randconfig-1001-20261002    gcc-14
x86_64                randconfig-1002-20261002    gcc-14
x86_64                randconfig-1003-20261002    gcc-14
x86_64                randconfig-1004-20261002    gcc-14
x86_64                randconfig-1005-20261002    gcc-14
x86_64                randconfig-1006-20261002    clang-22
x86_64                randconfig-1007-20261002    clang-22
x86_64                randconfig-1008-20261002    clang-22
x86_64                randconfig-1009-20261002    clang-22
x86_64                randconfig-1010-20261002    clang-22
x86_64                randconfig-1011-20261002    clang-22
x86_64                randconfig-1012-20261002    clang-22
x86_64                randconfig-1013-20261002    clang-22
x86_64                randconfig-1014-20261002    clang-22
x86_64                randconfig-1015-20261002    clang-22
x86_64                randconfig-1016-20261002    clang-22
x86_64                randconfig-1017-20261002    clang-22
x86_64                randconfig-2100-20261001    gcc-14     cocci
x86_64                randconfig-2101-20261001    gcc-14     cocci
x86_64                randconfig-2102-20261001    gcc-14     cocci
x86_64                randconfig-2103-20261001    gcc-14     cocci
x86_64                randconfig-2200-20261001    clang-22   smatch
x86_64                randconfig-2200-20261002    clang-22   smatch
x86_64                randconfig-2300-20261001    gcc-14     sparse
x86_64                randconfig-2301-20261001    gcc-14     sparse
x86_64                randconfig-2302-20261001    gcc-14     sparse
x86_64               randconfig-r2102-20261002    gcc-14     cocci
x86_64               randconfig-r2105-20261001    gcc-14     cocci
x86_64               randconfig-r2105-20261002    gcc-14     cocci
x86_64               randconfig-r2202-20261001    clang-22   smatch
x86_64               randconfig-r2304-20261001    gcc-9.5.0  sparse
x86_64               randconfig-r2305-20261001    gcc-14     sparse
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
xtensa                randconfig-1000-20261002    clang-24
xtensa                randconfig-1001-20261002    clang-24
xtensa                randconfig-2000-20261001    clang-24
xtensa                randconfig-2000-20261002    clang-24
xtensa                randconfig-2001-20261001    clang-24
xtensa                randconfig-2001-20261002    clang-24
xtensa               randconfig-r2300-20261001    gcc-15.2.0 sparse
xtensa               randconfig-r2309-20261001    gcc-16.1.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


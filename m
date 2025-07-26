Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B996C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 21:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ikHNcrRJ2MWnJMD5yn7wxhlCm/gji9jSv3wDa2odHFk=; b=m0Moc0r93Cm3FSFycn8/3ya943
	AWtsIro5g4nx21BoZwkkpmw3Nxa18Vn3OWqat5SOkyiMxfIu9/x3IEttYaoLLxDzcYFnP5/yp5oNz
	OrsWL2VmMIg5Ykfb8Oim/yOK3zi/Ujf74JV32wp9gcEQEGZzkAwOBBqppw+ixWw83E7vgeHNy1ZC0
	XkXblCYmn1HPo90GD062+Yjo7uJ/yNdTNy5sTRN4bRfOl12iJIzNP904DO2B3P0y59jqQ7OhCJ83W
	xQavJxLj/eVxurF00DxAadrN/+qDED2CIOG5NWdtQTEoJjj5mWYgYsztEWlzW9ieWXylA9BVA0jJm
	/sKGmFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmOm-0000000Bvwb-29uX;
	Sat, 26 Jul 2025 21:25:44 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmKd-0000000BvbQ-1V07
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 21:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753564888; x=1785100888;
  h=date:from:to:cc:subject:message-id;
  bh=FAOrBPTCNHV5crGf/uPPU20oOBqcpJ6kozOWuFI7V+4=;
  b=Ouysth8JCnTI5ncG629l8G6YrViIBzr59nI4vhUYoYTi/lt7kxOuPEGy
   7ZrKOnZQO/chvYWVrRdQr3LwP/bnOZ6IY80xnGR0qAJB9pha+J6E7RWPI
   EmYd6uCWGAo9mem1coqh97ZELyyl9ajC7LC7opl+A30OcrvwXDAQYs7Bo
   GbfF38aR8nHGvDYp1cw0K6igwuh4W8Q2WWn6H3SOYld4AOgyiRdZVzvbW
   1PE0L/yP/cV3GH3pV7KxUNO8Bz5ogyOlfn1R6UFcaLViIsw4CEcB3R2OX
   aeTTp6LO9JLMPaCBFlHD5CfezcJvlpkcy08JTTE7hMFkT0sL+dztihp4c
   g==;
X-CSE-ConnectionGUID: 5974IIu4T3KS2RcR1pKDCA==
X-CSE-MsgGUID: ZEla9EQAQrqoeHm9/BARWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56011146"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56011146"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 14:21:27 -0700
X-CSE-ConnectionGUID: jlFPJGd5ST65w40f5OZdWw==
X-CSE-MsgGUID: EhNSPQL4Q3KIpnTFfkRocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192638163"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 14:21:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufmKZ-000MI3-2f;
	Sat, 26 Jul 2025 21:21:23 +0000
Date: Sun, 27 Jul 2025 05:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 ba594704b9e775a7e141a3ab767537c40fecd676
Message-ID: <202507270528.SlR0R4Is-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_142127_440449_6E9FC6DC 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: ba594704b9e775a7e141a3ab767537c40fecd676  soc: document merges

elapsed time: 1383m

configs tested: 127
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250726    gcc-14.3.0
arc                   randconfig-002-20250726    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                   randconfig-001-20250726    gcc-8.5.0
arm                   randconfig-002-20250726    gcc-10.5.0
arm                   randconfig-003-20250726    gcc-10.5.0
arm                   randconfig-004-20250726    gcc-8.5.0
arm                           sama7_defconfig    clang-22
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250726    gcc-8.5.0
arm64                 randconfig-002-20250726    clang-22
arm64                 randconfig-003-20250726    gcc-12.5.0
arm64                 randconfig-004-20250726    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250726    gcc-15.1.0
csky                  randconfig-002-20250726    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250726    clang-22
hexagon               randconfig-002-20250726    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250726    gcc-12
i386        buildonly-randconfig-002-20250726    gcc-12
i386        buildonly-randconfig-003-20250726    clang-20
i386        buildonly-randconfig-004-20250726    gcc-12
i386        buildonly-randconfig-005-20250726    clang-20
i386        buildonly-randconfig-006-20250726    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250726    gcc-15.1.0
loongarch             randconfig-002-20250726    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250726    gcc-8.5.0
nios2                 randconfig-002-20250726    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250726    gcc-8.5.0
parisc                randconfig-002-20250726    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250726    clang-16
powerpc               randconfig-002-20250726    gcc-11.5.0
powerpc               randconfig-003-20250726    gcc-8.5.0
powerpc64             randconfig-001-20250726    clang-22
powerpc64             randconfig-002-20250726    gcc-10.5.0
powerpc64             randconfig-003-20250726    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250726    gcc-11.5.0
riscv                 randconfig-002-20250726    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250726    clang-22
s390                  randconfig-002-20250726    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250726    gcc-12.5.0
sh                    randconfig-002-20250726    gcc-9.5.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250726    gcc-8.5.0
sparc                 randconfig-002-20250726    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250726    clang-22
sparc64               randconfig-002-20250726    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250726    gcc-12
um                    randconfig-002-20250726    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250726    gcc-12
x86_64      buildonly-randconfig-002-20250726    gcc-12
x86_64      buildonly-randconfig-003-20250726    gcc-12
x86_64      buildonly-randconfig-004-20250726    clang-20
x86_64      buildonly-randconfig-005-20250726    clang-20
x86_64      buildonly-randconfig-006-20250726    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250726    gcc-8.5.0
xtensa                randconfig-002-20250726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


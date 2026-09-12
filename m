Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34811C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ndF+Ahl/00pkHTGdmeYbeYwBggFcmMC1z041MAQiywY=; b=sjPfzyKG1lrjBzmAiVXPCBXUfd
	Ukm9qwqZTVav69ubuWuCAAaKoHamPLGmlHqfoILDWdIEdjKmbaPt6v5wBaWV1kl9wnWg1wJUbfYLA
	gJ1btuhQEnu1hp+c1swWbAy8eS9xISRLFVZrpDLSJ9EyE9dBE82iKLDJ7MgaLDhsJlUu8GSfhoP7Y
	BRn5+dYicB/Pj0TidXbs7M1I4b4/Wt4FUpe7lOS3bv1lgfRVKrjCdGD6T0g3GKEJoWRQE4j6wUAO2
	WJrNjuPp9IpsNP04vAeDIBbbzsOqHB7dwnjmDIneL5PbcldHvjtZUJHjgqri5pahDijGKDf2FYG2A
	DRsl3beQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LXj-00000000oLM-2BKg;
	Sat, 12 Sep 2026 11:05:11 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LXg-00000000oKw-14P7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 11:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789211109; x=1820747109;
  h=date:from:to:cc:subject:message-id;
  bh=CNpHkiMb0301FYj4fK0YYL/nsJVnzp0YjZA60uN7tAA=;
  b=cXyG1XEGzeL8Cd4GqUVjbGPMIuTEQoZ3ZeZHxNt8+ikCSzfoLMSzF4B8
   HWKk6I7wLAHFp2dBJ3sYXkcpOXagIOmtngSfeeZIsXr4JTTyfQuVt4hbO
   j+6yqZ0Pvy2MKEEup5FhAduPJPnY3bPzTVCSlwlCSwTcpAu5js5zM4tSK
   +JR9T9A8cul1q+xhXvQj4S5hJ9H7TVwiFj3xQq4yKOVlGyYXTgnjz8eit
   yewqKf6siMF7SSkrKkmHDDbzaRTMCVLKFHvSWFkEaWYJ6bU20kwl1MFuc
   ICgTvtTgY2xoRSIwW1JPonZwbb5gjbppttVxWsAmRlEHYbpdA1u45P/MH
   w==;
X-CSE-ConnectionGUID: /mXnxhLVR12e3PwwduSkKw==
X-CSE-MsgGUID: 2orHcLzhSAm/rasf+YISWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93350555"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="93350555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:05:06 -0700
X-CSE-ConnectionGUID: 4lFz7tVJSO2dBOgCvSZgyA==
X-CSE-MsgGUID: GU5GAQSLR9mx3y+D0jRwWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="310426254"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Sep 2026 04:05:05 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5LWB-000000002t7-3qLG;
	Sat, 12 Sep 2026 11:03:53 +0000
Date: Sat, 12 Sep 2026 18:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-simple-sound] BUILD SUCCESS
 2eb80219e8fce070d765e9882a7fe586861ee64a
Message-ID: <202609121851.JiQjTnJg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_040508_359708_76B5DD96 
X-CRM114-Status: UNSURE (   5.79  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-simple-sound
branch HEAD: 2eb80219e8fce070d765e9882a7fe586861ee64a  ARM: config: u8500: Enable the simple audio card

elapsed time: 2109m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                   randconfig-001-20260912    gcc-11.5.0
arc                   randconfig-002-20260912    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-16.1.0
arm                          pxa3xx_defconfig    clang-17
arm                   randconfig-001-20260912    gcc-10.5.0
arm                   randconfig-002-20260912    clang-18
arm                   randconfig-003-20260912    gcc-13.4.0
arm                   randconfig-004-20260912    clang-17
arm                         wpcm450_defconfig    gcc-16.1.0
arm64                             allnoconfig    gcc-16.1.0
arm64                 randconfig-001-20260912    gcc-15.2.0
arm64                 randconfig-002-20260912    clang-24
arm64                 randconfig-003-20260912    gcc-11.5.0
arm64                 randconfig-004-20260912    gcc-9.5.0
csky                              allnoconfig    gcc-16.1.0
csky                  randconfig-001-20260912    gcc-13.4.0
csky                  randconfig-002-20260912    gcc-15.2.0
hexagon                           allnoconfig    clang-24
hexagon               randconfig-001-20260912    clang-22
hexagon               randconfig-002-20260912    clang-17
i386                              allnoconfig    gcc-14
i386                  randconfig-011-20260912    clang-22
i386                  randconfig-012-20260912    gcc-13
i386                  randconfig-013-20260912    gcc-14
i386                  randconfig-014-20260912    clang-22
i386                  randconfig-015-20260912    clang-22
i386                  randconfig-016-20260912    clang-22
i386                  randconfig-017-20260912    gcc-14
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260912    clang-24
loongarch             randconfig-002-20260912    gcc-13.4.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260912    gcc-8.5.0
nios2                 randconfig-002-20260912    gcc-11.5.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260912    gcc-8.5.0
parisc                randconfig-002-20260912    gcc-8.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc                      arches_defconfig    gcc-16.1.0
powerpc                   currituck_defconfig    clang-24
powerpc                 mpc837x_rdb_defconfig    gcc-16.1.0
powerpc                  mpc866_ads_defconfig    clang-17
powerpc                      ppc44x_defconfig    clang-17
powerpc               randconfig-001-20260912    gcc-13.4.0
powerpc               randconfig-002-20260912    clang-24
powerpc                     tqm8548_defconfig    clang-24
powerpc64             randconfig-001-20260912    clang-24
powerpc64             randconfig-002-20260912    gcc-8.5.0
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-24
riscv                               defconfig    clang-24
riscv                 randconfig-001-20260912    gcc-15.2.0
riscv                 randconfig-002-20260912    clang-24
s390                              allnoconfig    clang-24
s390                                defconfig    clang-18
s390                  randconfig-001-20260912    clang-24
s390                  randconfig-002-20260912    clang-17
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260912    gcc-9.5.0
sh                    randconfig-002-20260912    gcc-11.5.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260912    gcc-12.5.0
sparc                 randconfig-002-20260912    gcc-14.3.0
sparc64                             defconfig    clang-24
sparc64               randconfig-001-20260912    clang-24
sparc64               randconfig-002-20260912    clang-20
um                                allnoconfig    clang-17
um                                  defconfig    clang-24
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260912    gcc-14
um                    randconfig-002-20260912    clang-24
um                           x86_64_defconfig    clang-24
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260912    gcc-14
x86_64      buildonly-randconfig-002-20260912    gcc-14
x86_64      buildonly-randconfig-003-20260912    gcc-14
x86_64      buildonly-randconfig-004-20260912    gcc-14
x86_64      buildonly-randconfig-005-20260912    clang-22
x86_64      buildonly-randconfig-006-20260912    gcc-12
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260912    clang-22
x86_64                randconfig-002-20260912    gcc-14
x86_64                randconfig-003-20260912    gcc-14
x86_64                randconfig-004-20260912    clang-22
x86_64                randconfig-005-20260912    clang-22
x86_64                randconfig-006-20260912    clang-22
x86_64                randconfig-011-20260912    gcc-14
x86_64                randconfig-012-20260912    gcc-14
x86_64                randconfig-013-20260912    gcc-14
x86_64                randconfig-014-20260912    clang-22
x86_64                randconfig-015-20260912    gcc-14
x86_64                randconfig-016-20260912    clang-22
x86_64                randconfig-071-20260912    gcc-14
x86_64                randconfig-072-20260912    gcc-14
x86_64                randconfig-073-20260912    gcc-14
x86_64                randconfig-074-20260912    clang-22
x86_64                randconfig-075-20260912    gcc-14
x86_64                randconfig-076-20260912    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                randconfig-001-20260912    gcc-16.1.0
xtensa                randconfig-002-20260912    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


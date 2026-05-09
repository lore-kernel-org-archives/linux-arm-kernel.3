Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1687CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SgNyI10oqkZ1NTuK0M610TrIHZuq/ZGM+jkwC/bqNkU=; b=ZokwYKU+0G2/9fb01k/2rKB5+c
	uzcGIuO0lb3XUvfjMzQwnRHisnIsraUAo6aiWL1H9YPIzKRct0zcyLrqi3eaV/ZEzzw1VcSLRYSTj
	Zw2YeJ8Om1p1Y6lm1iV05PIQKjvH6Ra/nSXw3bPb6qeFXU9SNDloz24n4KSPwvRotKAD9xMABZuvG
	GFyS79ExR2vuxNidpDIK9SL3homF4h+3TtzBNvxzGe0l4C/wmzuqEZr5+yaJ/TWx0Ekm3V5GEqD68
	iHx0lC1BJFh4NlwERL3onnIxiwxfeiPpPnEIgrBxF25AtXEtKaOcjfMSe43xJTpYWv6lyhQw2fkGD
	ge3fzIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXnE-000000083cW-1cVP;
	Sat, 09 May 2026 02:51:52 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXnB-000000083bv-08rf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 02:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778295109; x=1809831109;
  h=date:from:to:cc:subject:message-id;
  bh=V4q5v5ngEZ3EZanGLZzzCjcKRA/7t8nSE4ZG7/ZS2Fw=;
  b=BTcYqwKrIcE6rCqEj4A0F9e9jBHdwj5uwACitWJTvEFP/oHJhmdaOUoY
   A8HpEalYtWqkEdjWftYw/CfUlmHE9sDmDOsqJ4K586Sl5Sz0u7zDIm5lQ
   p31z9KHhuBFKiCNBShthyuJS4OAnzhRTd5MHUL550kdhkMIAyrlQ1+gOS
   CRoxSyaJzgX9XUM+eNTiU+HE/yifBpitsOGlS9FQ2W9M4s5iX+67JxERQ
   SsMH7juzfM2qax+TJEtMIvQKqOF+xwz+Md1OD/8CW3+VIsS+EN18whNMe
   dAMI4lPBNrLWp7S/fxUFvWXSjZl1mBM8UFQQtra6G6Hc8ZSPW+4Z08L5R
   Q==;
X-CSE-ConnectionGUID: h/H+cJXiSkC8dNGZjrUM3w==
X-CSE-MsgGUID: W+v0Frz1QGyymzwk3ao8qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="81836278"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="81836278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 19:51:47 -0700
X-CSE-ConnectionGUID: RHY2B+xZRLa5C2zbFaBYBg==
X-CSE-MsgGUID: mulzRS45S6iVBzgy5dPYRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="275042674"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2026 19:51:45 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLXn4-000000000c9-1bnJ;
	Sat, 09 May 2026 02:51:42 +0000
Date: Sat, 09 May 2026 10:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 8bb9429a291964ca7a2244f48a34e02bb862c95d
Message-ID: <202605091009.U8DZEeR3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_195149_096687_B299D2AA 
X-CRM114-Status: UNSURE (   5.12  )
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
branch HEAD: 8bb9429a291964ca7a2244f48a34e02bb862c95d  soc: document merges

elapsed time: 783m

configs tested: 250
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260508    gcc-12.5.0
arc                   randconfig-001-20260509    gcc-9.5.0
arc                   randconfig-002-20260508    gcc-12.5.0
arc                   randconfig-002-20260509    gcc-9.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                   randconfig-001-20260508    gcc-12.5.0
arm                   randconfig-001-20260509    gcc-9.5.0
arm                   randconfig-002-20260508    gcc-12.5.0
arm                   randconfig-002-20260509    gcc-9.5.0
arm                   randconfig-003-20260508    gcc-12.5.0
arm                   randconfig-003-20260509    gcc-9.5.0
arm                   randconfig-004-20260508    gcc-12.5.0
arm                   randconfig-004-20260509    gcc-9.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260508    gcc-14.3.0
arm64                 randconfig-001-20260509    gcc-10.5.0
arm64                 randconfig-002-20260508    gcc-14.3.0
arm64                 randconfig-002-20260509    gcc-10.5.0
arm64                 randconfig-003-20260508    gcc-14.3.0
arm64                 randconfig-003-20260509    gcc-10.5.0
arm64                 randconfig-004-20260508    gcc-14.3.0
arm64                 randconfig-004-20260509    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260508    gcc-14.3.0
csky                  randconfig-001-20260509    gcc-10.5.0
csky                  randconfig-002-20260508    gcc-14.3.0
csky                  randconfig-002-20260509    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260508    clang-23
hexagon               randconfig-001-20260509    clang-17
hexagon               randconfig-002-20260508    clang-23
hexagon               randconfig-002-20260509    clang-17
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260509    gcc-14
i386        buildonly-randconfig-002-20260509    gcc-14
i386        buildonly-randconfig-003-20260509    gcc-14
i386        buildonly-randconfig-004-20260509    gcc-14
i386        buildonly-randconfig-005-20260509    gcc-14
i386        buildonly-randconfig-006-20260509    gcc-14
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260508    gcc-14
i386                  randconfig-001-20260509    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260508    gcc-14
i386                  randconfig-002-20260509    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260508    gcc-14
i386                  randconfig-003-20260509    clang-20
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260508    gcc-14
i386                  randconfig-004-20260509    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260508    gcc-14
i386                  randconfig-005-20260509    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260508    gcc-14
i386                  randconfig-006-20260509    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260508    gcc-14
i386                  randconfig-007-20260509    clang-20
i386                  randconfig-011-20260509    gcc-14
i386                  randconfig-012-20260509    gcc-14
i386                  randconfig-013-20260509    gcc-14
i386                  randconfig-014-20260509    gcc-14
i386                  randconfig-015-20260509    gcc-14
i386                  randconfig-016-20260509    gcc-14
i386                  randconfig-017-20260509    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260508    clang-23
loongarch             randconfig-001-20260509    clang-17
loongarch             randconfig-002-20260508    clang-23
loongarch             randconfig-002-20260509    clang-17
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260508    clang-23
nios2                 randconfig-001-20260509    clang-17
nios2                 randconfig-002-20260508    clang-23
nios2                 randconfig-002-20260509    clang-17
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260508    gcc-9.5.0
parisc                randconfig-001-20260509    gcc-11.5.0
parisc                randconfig-002-20260508    gcc-9.5.0
parisc                randconfig-002-20260509    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260508    gcc-9.5.0
powerpc               randconfig-001-20260509    gcc-11.5.0
powerpc               randconfig-002-20260508    gcc-9.5.0
powerpc               randconfig-002-20260509    gcc-11.5.0
powerpc64             randconfig-001-20260508    gcc-9.5.0
powerpc64             randconfig-001-20260509    gcc-11.5.0
powerpc64             randconfig-002-20260508    gcc-9.5.0
powerpc64             randconfig-002-20260509    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260508    clang-23
riscv                 randconfig-001-20260509    clang-23
riscv                 randconfig-002-20260508    clang-23
riscv                 randconfig-002-20260509    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260508    clang-23
s390                  randconfig-001-20260509    clang-23
s390                  randconfig-002-20260508    clang-23
s390                  randconfig-002-20260509    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                     magicpanelr2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260508    clang-23
sh                    randconfig-001-20260509    clang-23
sh                    randconfig-002-20260508    clang-23
sh                    randconfig-002-20260509    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260509    clang-23
sparc                 randconfig-002-20260509    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260509    clang-23
sparc64               randconfig-002-20260509    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260509    clang-23
um                    randconfig-002-20260509    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260508    gcc-14
x86_64      buildonly-randconfig-001-20260509    clang-20
x86_64      buildonly-randconfig-002-20260508    gcc-14
x86_64      buildonly-randconfig-002-20260509    clang-20
x86_64      buildonly-randconfig-003-20260508    gcc-14
x86_64      buildonly-randconfig-003-20260509    clang-20
x86_64      buildonly-randconfig-004-20260508    gcc-14
x86_64      buildonly-randconfig-004-20260509    clang-20
x86_64      buildonly-randconfig-005-20260508    gcc-14
x86_64      buildonly-randconfig-005-20260509    clang-20
x86_64      buildonly-randconfig-006-20260508    gcc-14
x86_64      buildonly-randconfig-006-20260509    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260508    clang-20
x86_64                randconfig-001-20260509    gcc-14
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260508    clang-20
x86_64                randconfig-002-20260509    gcc-14
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260508    clang-20
x86_64                randconfig-003-20260509    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260508    clang-20
x86_64                randconfig-004-20260509    gcc-14
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260508    clang-20
x86_64                randconfig-005-20260509    gcc-14
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260508    clang-20
x86_64                randconfig-006-20260509    gcc-14
x86_64                randconfig-011-20260508    gcc-14
x86_64                randconfig-011-20260509    gcc-14
x86_64                randconfig-012-20260508    gcc-14
x86_64                randconfig-012-20260509    gcc-14
x86_64                randconfig-013-20260508    gcc-14
x86_64                randconfig-013-20260509    gcc-14
x86_64                randconfig-014-20260508    gcc-14
x86_64                randconfig-014-20260509    gcc-14
x86_64                randconfig-015-20260508    gcc-14
x86_64                randconfig-015-20260509    gcc-14
x86_64                randconfig-016-20260508    gcc-14
x86_64                randconfig-016-20260509    gcc-14
x86_64                randconfig-071-20260509    clang-20
x86_64                randconfig-072-20260509    clang-20
x86_64                randconfig-073-20260509    clang-20
x86_64                randconfig-074-20260509    clang-20
x86_64                randconfig-075-20260509    clang-20
x86_64                randconfig-076-20260509    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260509    clang-23
xtensa                randconfig-002-20260509    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


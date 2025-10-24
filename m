Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A132CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J1XUI3R0raPDO7k6Cu9zhAdo6fic1qKuLAOlstatU7w=; b=PKinvZI/RK9IXNVo1wx2eYY4zH
	ac8SNZASRRwTkWwBot1SHdw1BQEHnOBad3c7OuhjL08jUaeLriZmLXckX1B4kBDv9J3VMNdVzEfsG
	8Pc0WAksPWz1ydb1Dqo2sOGQ36OnrYRF6b+jvzd4nrmMMiHmFHtCMX3GU9QVBhD0QgVwcpHVbOXQL
	yHy76QwQnwjleTUjkVPzL34y5S5CRy2jSUqmFXBvjWUobi4xHj22aMC78RsO1gp3eEpSI09tH21LY
	4lSFtRH7btScis/fL9LfObuyCmPefKV/O+VMxu+EU5IZom4nvJVXUMsAttRBetVC0VvRc55kAI+aI
	9vkJm//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLtz-0000000A99i-45Yb;
	Fri, 24 Oct 2025 17:48:35 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLtx-0000000A998-0B7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761328113; x=1792864113;
  h=date:from:to:cc:subject:message-id;
  bh=3iojfhbCFrYuMu4Jb4bdVnKZQHEy5sdgsG6ovvO/Lh0=;
  b=YtS4vq+jqEI3gJxzpcR7kAD0tzP0HtJTBYI+k2gJ340s/+ov+qi090bH
   cGtzkH0o2BUCtNxlcQo5ZNjOIIYHzBlckSI/tXSuhFNX15Qpf9Z96Lqlo
   4fVCHRB/+FrDRo9FI4J+K/0jViJQllnia36SPjVSG0KAe2LEjObtq8Rj4
   MEsd7dyuBslN2U0u3k6lpaCFESGCI8O09iytDszHROcmi2KNLrNQqPzKW
   L65YgEKg6A0V+zZZnhYvZfONxg1MLlk3bhnrrYWNQo6RHnu2fDJhn/lGe
   S25bAqVJ10opbWfmigQmZI19ukfEY/vbX3O+Dsx6d6WLqthib0DJwVVEj
   A==;
X-CSE-ConnectionGUID: CRfsO9TaTNmOqJsOoV0QXg==
X-CSE-MsgGUID: HfOKNsJnTqy1RT27rcYKZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63419274"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63419274"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 10:48:29 -0700
X-CSE-ConnectionGUID: BgZYmwE/Q22gLbE7cAtzww==
X-CSE-MsgGUID: MhD3OzyvRF2XrNEG9zmpeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184553357"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2025 10:48:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCLtp-000Ekb-21;
	Fri, 24 Oct 2025 17:48:25 +0000
Date: Sat, 25 Oct 2025 01:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-codina-tmo-v6.18-rc1] BUILD SUCCESS
 e9e9d7abfe3f1e6e0f204b4f9d0d5d4e42a3ca76
Message-ID: <202510250155.DzBOqMrW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_104833_124603_E7A43077 
X-CRM114-Status: UNSURE (   5.41  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-codina-tmo-v6.18-rc1
branch HEAD: e9e9d7abfe3f1e6e0f204b4f9d0d5d4e42a3ca76  brcmfmac: Obtain reset GPIO

elapsed time: 1118m

configs tested: 210
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20251024    clang-22
arc                   randconfig-001-20251024    gcc-8.5.0
arc                   randconfig-002-20251024    clang-22
arc                   randconfig-002-20251024    gcc-14.3.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                        clps711x_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20251024    clang-20
arm                   randconfig-001-20251024    clang-22
arm                   randconfig-002-20251024    clang-22
arm                   randconfig-002-20251024    gcc-15.1.0
arm                   randconfig-003-20251024    clang-22
arm                   randconfig-004-20251024    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251024    clang-22
arm64                 randconfig-001-20251024    gcc-8.5.0
arm64                 randconfig-002-20251024    clang-16
arm64                 randconfig-002-20251024    clang-22
arm64                 randconfig-003-20251024    clang-22
arm64                 randconfig-003-20251024    gcc-13.4.0
arm64                 randconfig-004-20251024    clang-17
arm64                 randconfig-004-20251024    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251024    gcc-14.3.0
csky                  randconfig-001-20251024    gcc-8.5.0
csky                  randconfig-002-20251024    gcc-11.5.0
csky                  randconfig-002-20251024    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251024    clang-22
hexagon               randconfig-001-20251024    gcc-8.5.0
hexagon               randconfig-002-20251024    clang-22
hexagon               randconfig-002-20251024    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251024    clang-20
i386        buildonly-randconfig-001-20251024    gcc-14
i386        buildonly-randconfig-002-20251024    gcc-14
i386        buildonly-randconfig-003-20251024    clang-20
i386        buildonly-randconfig-003-20251024    gcc-14
i386        buildonly-randconfig-004-20251024    gcc-14
i386        buildonly-randconfig-005-20251024    gcc-14
i386        buildonly-randconfig-006-20251024    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251024    clang-20
i386                  randconfig-002-20251024    clang-20
i386                  randconfig-003-20251024    clang-20
i386                  randconfig-004-20251024    clang-20
i386                  randconfig-005-20251024    clang-20
i386                  randconfig-006-20251024    clang-20
i386                  randconfig-007-20251024    clang-20
i386                  randconfig-011-20251024    clang-20
i386                  randconfig-012-20251024    clang-20
i386                  randconfig-013-20251024    clang-20
i386                  randconfig-014-20251024    clang-20
i386                  randconfig-015-20251024    clang-20
i386                  randconfig-016-20251024    clang-20
i386                  randconfig-017-20251024    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251024    gcc-15.1.0
loongarch             randconfig-001-20251024    gcc-8.5.0
loongarch             randconfig-002-20251024    gcc-15.1.0
loongarch             randconfig-002-20251024    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251024    gcc-11.5.0
nios2                 randconfig-001-20251024    gcc-8.5.0
nios2                 randconfig-002-20251024    gcc-11.5.0
nios2                 randconfig-002-20251024    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251024    gcc-8.5.0
parisc                randconfig-001-20251024    gcc-9.5.0
parisc                randconfig-002-20251024    gcc-13.4.0
parisc                randconfig-002-20251024    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-002-20251024    clang-17
powerpc               randconfig-002-20251024    gcc-8.5.0
powerpc               randconfig-003-20251024    clang-16
powerpc               randconfig-003-20251024    gcc-8.5.0
powerpc64             randconfig-001-20251024    gcc-12.5.0
powerpc64             randconfig-001-20251024    gcc-8.5.0
powerpc64             randconfig-002-20251024    gcc-14.3.0
powerpc64             randconfig-002-20251024    gcc-8.5.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251024    clang-22
riscv                 randconfig-002-20251024    clang-22
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251024    clang-22
s390                  randconfig-001-20251024    gcc-13.4.0
s390                  randconfig-002-20251024    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251024    clang-22
sh                    randconfig-001-20251024    gcc-12.5.0
sh                    randconfig-002-20251024    clang-22
sh                    randconfig-002-20251024    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251024    clang-22
sparc                 randconfig-001-20251024    gcc-12.5.0
sparc                 randconfig-002-20251024    clang-22
sparc                 randconfig-002-20251024    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251024    clang-20
sparc64               randconfig-001-20251024    clang-22
sparc64               randconfig-002-20251024    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251024    clang-22
um                    randconfig-001-20251024    gcc-14
um                    randconfig-002-20251024    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251024    clang-20
x86_64      buildonly-randconfig-001-20251024    gcc-14
x86_64      buildonly-randconfig-002-20251024    clang-20
x86_64      buildonly-randconfig-002-20251024    gcc-14
x86_64      buildonly-randconfig-003-20251024    clang-20
x86_64      buildonly-randconfig-003-20251024    gcc-14
x86_64      buildonly-randconfig-004-20251024    gcc-14
x86_64      buildonly-randconfig-005-20251024    gcc-14
x86_64      buildonly-randconfig-006-20251024    clang-20
x86_64      buildonly-randconfig-006-20251024    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251024    gcc-14
x86_64                randconfig-002-20251024    gcc-14
x86_64                randconfig-003-20251024    gcc-14
x86_64                randconfig-004-20251024    gcc-14
x86_64                randconfig-005-20251024    gcc-14
x86_64                randconfig-006-20251024    gcc-14
x86_64                randconfig-007-20251024    gcc-14
x86_64                randconfig-008-20251024    gcc-14
x86_64                randconfig-071-20251024    clang-20
x86_64                randconfig-072-20251024    clang-20
x86_64                randconfig-073-20251024    clang-20
x86_64                randconfig-074-20251024    clang-20
x86_64                randconfig-075-20251024    clang-20
x86_64                randconfig-076-20251024    clang-20
x86_64                randconfig-077-20251024    clang-20
x86_64                randconfig-078-20251024    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251024    clang-22
xtensa                randconfig-001-20251024    gcc-11.5.0
xtensa                randconfig-002-20251024    clang-22
xtensa                randconfig-002-20251024    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


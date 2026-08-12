Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CC1C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TIXiyYhixpff17uCNDg5Belg9nEUanNQiy84Lb3l19A=; b=xVJz0g/WZMi0y8aF0EGqSBjtkD
	pr3bOU4TJgIX8FFckAlxJ5UvDIO7pxnfl445stLTgDKf/Kdxl5XAKyhrYItUw+TCcKnOksegjlqSW
	6MUI1vCrUkO7+xWXwB5C9qtY6AePoFfLRqWcavqjjRW+1RSocI8gasL89lWF/ZGp4JJmpNAf+wRZm
	T+3obnTfjcesM6mPq0MkNbBjZ+BAGHuYaRczoxY2MAc5XCvf9Kh62xltNpwLegiqAPYK7xx7G8BYB
	43Dsmn1a9tR2wRod2tdJZYIFwVOHdx+A89jT1W4Z7/RUPqvih+NEGvuu+Rr/sffVI1D4gNNKzNVzv
	5deArRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7CS-0000000G5vP-45To;
	Wed, 12 Aug 2026 11:32:49 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7CQ-0000000G5tT-1utU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786534366; x=1818070366;
  h=date:from:to:cc:subject:message-id;
  bh=sLPlM2upfEnHuzFo2eLGdDgjhK1x9Cv7eDO0m8xBy2c=;
  b=NHQYockPa4sTdce2BacnqeUCc4j0BCh+kuG+1OFGtbvvP04Jf8x8jsFd
   r67HwW5b6L0qD7/eYav6Z1oo50N+nLIigEWSgRjmnJpT3m0kwZD4SoZWk
   oB7qBih+Z8+LzyXASIBCxuTCAkH2Zg8g3DZgXz7gDKHiMohRPQSEYvbE+
   PdH1bRCkfOh0DLPaE9e9MQCmE+JoL3P/EwraIHg2k+j09oLUcneJv3e9T
   ug7iff3P+tQAF5UjXmhfwSs7b0T9RaCXoxvFAWgrhYmUK0ZFRCutb4QZ9
   ZD33MRi1eYzjgOZGBVl1LweX739NjALYg/sYee+24QOxE7VD7K90cgFWw
   Q==;
X-CSE-ConnectionGUID: YmFfiVBmTFui5IBfO1/ZZA==
X-CSE-MsgGUID: xePNKDMHTOKTS55WmNE+uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87158577"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87158577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:32:46 -0700
X-CSE-ConnectionGUID: fHysDKrXQi6Q5alO8638Sg==
X-CSE-MsgGUID: IbyjYG5gQwimxvofVDrTRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="260302962"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2026 04:32:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu7CM-00000000QXi-017w;
	Wed, 12 Aug 2026 11:32:42 +0000
Date: Wed, 12 Aug 2026 19:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:sophgo/dt] BUILD SUCCESS
 59c682ffc76ebda27ecbbbd1423e23ec482d61b9
Message-ID: <202608121920.Ecw0dH64-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_043246_570784_5AD43D78 
X-CRM114-Status: UNSURE (   5.76  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
branch HEAD: 59c682ffc76ebda27ecbbbd1423e23ec482d61b9  riscv: dts: sophgo: Add Milk-V Duo 256M board support

elapsed time: 1520m

configs tested: 194
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                       nsim_700_defconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260811    gcc-11.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-002-20260811    gcc-9.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                  randconfig-001-20260811    gcc-13.4.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-002-20260811    gcc-15.2.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-003-20260811    gcc-13.4.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-004-20260811    clang-24
arm                  randconfig-004-20260812    gcc-12.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260811    gcc-8.5.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260811    gcc-9.5.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260811    clang-17
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260811    gcc-13.4.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260811    gcc-13.4.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260811    gcc-16.1.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
hexagon              randconfig-001-20260811    clang-24
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260811    clang-22
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260811    clang-22
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260811    gcc-14
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260811    gcc-14
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260811    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260811    gcc-14
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260811    clang-22
i386       buildonly-randconfig-006-20260812    clang-22
i386                 randconfig-001-20260811    gcc-14
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-002-20260811    gcc-14
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-003-20260811    gcc-14
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260811    gcc-14
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-005-20260811    gcc-14
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-006-20260811    gcc-14
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260811    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-011-20260811    gcc-14
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260811    gcc-14
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260811    clang-22
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260811    gcc-13
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260811    gcc-14
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260811    gcc-14
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260811    gcc-14
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260811    gcc-15.2.0
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260811    clang-24
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260811    gcc-8.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260811    gcc-9.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260811    gcc-10.5.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-002-20260811    gcc-16.1.0
parisc               randconfig-002-20260812    clang-17
powerpc              randconfig-001-20260811    clang-24
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-002-20260811    clang-17
powerpc              randconfig-002-20260812    clang-17
powerpc64            randconfig-001-20260811    gcc-15.2.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-002-20260811    gcc-13.4.0
powerpc64            randconfig-002-20260812    clang-17
riscv                randconfig-001-20260811    clang-24
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-002-20260811    clang-24
riscv                randconfig-002-20260812    clang-24
s390                 randconfig-001-20260811    clang-20
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-002-20260811    clang-24
s390                 randconfig-002-20260812    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260811    gcc-13.4.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-002-20260811    gcc-16.1.0
sh                   randconfig-002-20260812    clang-24
sparc                randconfig-001-20260811    gcc-16.1.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-002-20260811    gcc-16.1.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260811    gcc-8.5.0
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-002-20260811    gcc-8.5.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260811    gcc-14
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-002-20260811    gcc-14
um                   randconfig-002-20260812    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-12
x86_64     buildonly-randconfig-001-20260811    gcc-14
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260811    clang-22
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260811    clang-22
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260811    gcc-12
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260811    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260811    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260811    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260811    gcc-14
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260811    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260811    gcc-14
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260811    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260811    gcc-13
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260811    gcc-14
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260811    gcc-14
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260811    gcc-14
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260811    gcc-14
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260811    gcc-14
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260811    gcc-14
x86_64               randconfig-016-20260812    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260811    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260811    gcc-14
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260811    gcc-14
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-074-20260811    gcc-14
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260811    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260811    gcc-14
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260811    gcc-16.1.0
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260811    gcc-10.5.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


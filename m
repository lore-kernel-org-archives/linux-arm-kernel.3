Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F18C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LC6wwAJxmzvVovRIxrKTgww+oot4CVF6FF6nztjHnZw=; b=j6yGRZ8VZoGUcK23p/MoKL2rcx
	lTDmUHCVuI/bg60XtRjcJlTXWUpeWDZLbScYFpzNkMjcj/uJ2gkduNMZMhY/gGT6v/fxwgySvejBS
	CgusrtSUmJTPbVfLKRLIr6AQn0q9DgGqGjPpHJ4n5sqMd0rcI7c7dQyS0SEwESZe5jfJyo+btHIOq
	FCEsoApqZNHe17tsjSYvdnychQMWlMqZsXeFP49uxUrJf8+jwDTFcXbN/GPrXiSl7v3oAnq0gW9K+
	zKCUU5vmf72OEo18uDQdgV7yJfhaAihYpTIKhqkS+8M318R1hEcLFkw69oX55/ajZs/YpFn1/EY1I
	CWULXUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7ET-0000000G6pi-0DLu;
	Wed, 12 Aug 2026 11:34:53 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7EM-0000000G6of-3njD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786534487; x=1818070487;
  h=date:from:to:cc:subject:message-id;
  bh=yPOJGnQaMEoDRk6J8CFNCms1XsHkZUa7Qm2N4BEFXsQ=;
  b=UaCdqtf4yJ6+q4qJ8oe6CgsobViLRPvdTOOVO2hm5SKDjxUBV6G720dE
   YB9RZG2+/suCSOY96JvH3KgVwWYOWy0lxUBSpWSMSa2RK60rmC5RwAqIp
   5R9g7e/SclzjhqYlvqLM5QuXQmyDvhCYAPfxteLISpzGCAkHTue/u0AYt
   FbCISPop9824wKnlTc5dHT9vVLOLnY6vIBwTXRh8QiCPjZUZzVU7EFRh2
   kjmpnlWEnkYsy+wuX5mHsSLFWbAY+oWbae5odY16kV3JSD+6wRyOOSas3
   an55upbpop7kJuAkIw+BIrq3iU0Rgbaced0/i7Evi+e7y+lMD2NIWvHX5
   Q==;
X-CSE-ConnectionGUID: HcdZegKjTOOIQ98G4dfUjw==
X-CSE-MsgGUID: bNuFjWXqTXqEtbxGD5R5sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98230847"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98230847"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:34:46 -0700
X-CSE-ConnectionGUID: psFZv1dQSgG3C/SYKRecCw==
X-CSE-MsgGUID: I8MP9ZEUT1mV4TEEUJoCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="293563702"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Aug 2026 04:34:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu7EI-00000000QY8-2cPm;
	Wed, 12 Aug 2026 11:34:42 +0000
Date: Wed, 12 Aug 2026 19:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:zynx/firmware] BUILD SUCCESS
 0e8860367da261116cd290bcd6a54d2e597a0c5c
Message-ID: <202608121943.ZMhbdMNl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_043447_077112_53F6C5D1 
X-CRM114-Status: UNSURE (   5.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git zynx/firmware
branch HEAD: 0e8860367da261116cd290bcd6a54d2e597a0c5c  firmware: xilinx: Clear firmware notifiers across kexec transitions

elapsed time: 1520m

configs tested: 196
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
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
hexagon                       randconfig-001    clang-17
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
i386                          randconfig-001    clang-22
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
mips                          ip22_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260811    gcc-8.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260811    gcc-9.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
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


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1623ACFD315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 02:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LTIdwnl2VaOl59Ms/+JQsMLwX3Sicsrpbna9NIo+FwU=; b=CPMYEHLldxsghpZkeC1fyer04l
	VHm1UbBPGp9aQooZwG/RebIA8/NOfuQDjxaVjYh2j/CfzBqK3ChQgXcry/qbWs63gwUGBGhD1s378
	Ul9W9WVhw0TearDw5jedBpXWOl+VrAMUnrL1WAs7XoL53pMR2RnSiKE12+TORpjTVzrE17GZhFWTq
	elAAQL67I63CYDZLCSortwlJgYuaFsOxEa4cEsv9yxi5PmhDXFQ/OfHqYT52W344iFil/tmNRn/v3
	Nwmk9kZyAk5is/iyPfraLEQqs4TlvTzuJ4fAPfLzcaQneretzSVbXkYwo/u58OnqubX5sACCGIB78
	dvPRUTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMzcX-0000000A3F4-2lqc;
	Sun, 23 Nov 2025 02:14:33 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMzcU-0000000A3EB-3M5M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 02:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763864071; x=1795400071;
  h=date:from:to:cc:subject:message-id;
  bh=7EZ2uXE9XJeLy+ENWFYeynrm9RlzSvjrdCwLgcOLAzk=;
  b=L5iXeqX2kNYrM5LZoIizPZ+Z/m3tcRC3SZQf/zecQlOT1ou46Uq9mXjb
   xA7BNZlSwKBq2KHWWdv0g35A2JyO0a3mqe00zUF/w5e/y35HwGgSpkI7i
   fWEeToVqzVN2uhgyjlkpu/WiF4y4M66wEw9cCiY9n9VX5+c6UxfCIA90j
   yns68Y7RIeg+t42cEffbnFC+wgzKM+NOsa84b0NaoUpNnKgD6DxnwcBe3
   QCHucDdNPqGh6rTQ3gtFCRcqvyfqih4tgpcztnu9kgpDf4VFEs7IWEOOW
   tgBdAsVkgBLUL7PAJUHpYtZAVGtqEq3WEZ9HXnxDjnMg7nglNdkHHnQ36
   A==;
X-CSE-ConnectionGUID: h/URs8/6QMy5QxiHjOFNZQ==
X-CSE-MsgGUID: teYFqKyQSYC3jeWoL+a4fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76520871"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="76520871"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 18:14:27 -0800
X-CSE-ConnectionGUID: y0xS5/lnTmy1uc/YTn4vXA==
X-CSE-MsgGUID: x5PYq5kuRNuYLCrLOA0Q+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="222963100"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2025 18:14:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMzcN-0007zX-3D;
	Sun, 23 Nov 2025 02:14:23 +0000
Date: Sun, 23 Nov 2025 10:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4/mcde-drm-regression-thirdfix] BUILD
 SUCCESS 8d5b5f3ef2fcd21df8f500e83fb53d5439e01fbb
Message-ID: <202511231054.Vy3ltF8b-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_181430_880074_63090307 
X-CRM114-Status: UNSURE (   5.40  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/mcde-drm-regression-thirdfix
branch HEAD: 8d5b5f3ef2fcd21df8f500e83fb53d5439e01fbb  drm/rcar-du: Modify custom commit tail

elapsed time: 2041m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                axs103_defconfig    gcc-15.1.0
arc         randconfig-001-20251122    gcc-14.3.0
arc         randconfig-002-20251122    gcc-9.5.0
arm                     allnoconfig    clang-22
arm               assabet_defconfig    clang-18
arm         randconfig-001-20251122    clang-22
arm         randconfig-002-20251122    clang-22
arm         randconfig-003-20251122    clang-22
arm         randconfig-004-20251122    gcc-12.5.0
arm                 spitz_defconfig    gcc-15.1.0
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251122    gcc-8.5.0
arm64       randconfig-002-20251122    gcc-9.5.0
arm64       randconfig-003-20251122    gcc-10.5.0
arm64       randconfig-004-20251122    clang-22
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251122    gcc-15.1.0
csky        randconfig-002-20251122    gcc-14.3.0
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                   alldefconfig    gcc-14
i386                    allnoconfig    gcc-14
i386        randconfig-001-20251123    gcc-14
i386        randconfig-002-20251123    gcc-14
i386        randconfig-003-20251123    gcc-14
i386        randconfig-004-20251123    gcc-14
i386        randconfig-005-20251123    gcc-14
i386        randconfig-006-20251123    clang-20
i386        randconfig-007-20251123    gcc-14
loongarch               allnoconfig    clang-22
loongarch                 defconfig    clang-19
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                    allnoconfig    gcc-15.1.0
m68k                      defconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze                defconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc                allnoconfig    gcc-15.1.0
openrisc                  defconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                    defconfig    gcc-15.1.0
parisc      randconfig-001-20251122    gcc-14.3.0
parisc      randconfig-002-20251122    gcc-14.3.0
parisc64                  defconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc                g5_defconfig    gcc-15.1.0
powerpc     randconfig-001-20251122    clang-16
powerpc     randconfig-002-20251122    gcc-11.5.0
powerpc           tqm8555_defconfig    gcc-15.1.0
powerpc64   randconfig-001-20251122    clang-17
powerpc64   randconfig-002-20251122    gcc-10.5.0
riscv                   allnoconfig    gcc-15.1.0
riscv                     defconfig    clang-22
riscv       randconfig-001-20251122    clang-22
riscv       randconfig-002-20251122    clang-22
s390                    allnoconfig    clang-22
s390                      defconfig    clang-22
s390        randconfig-001-20251122    clang-16
s390        randconfig-002-20251122    gcc-13.4.0
sh                      allnoconfig    gcc-15.1.0
sh                        defconfig    gcc-15.1.0
sh                     j2_defconfig    gcc-15.1.0
sh          randconfig-001-20251122    gcc-15.1.0
sh          randconfig-002-20251122    gcc-10.5.0
sh            rts7751r2d1_defconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                     defconfig    gcc-15.1.0
sparc       randconfig-001-20251122    gcc-13.4.0
sparc       randconfig-002-20251122    gcc-11.5.0
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20251122    gcc-13.4.0
sparc64     randconfig-002-20251122    clang-22
um                      allnoconfig    clang-22
um                        defconfig    clang-22
um                   i386_defconfig    gcc-14
um                 x86_64_defconfig    clang-22
x86_64                  allnoconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64      randconfig-011-20251123    gcc-14
x86_64      randconfig-012-20251123    gcc-14
x86_64      randconfig-013-20251123    clang-20
x86_64      randconfig-014-20251123    gcc-14
x86_64      randconfig-015-20251123    gcc-14
x86_64      randconfig-016-20251123    clang-20
x86_64      randconfig-071-20251123    clang-20
x86_64      randconfig-072-20251123    gcc-14
x86_64      randconfig-073-20251123    gcc-12
x86_64      randconfig-074-20251123    clang-20
x86_64      randconfig-075-20251123    clang-20
x86_64      randconfig-076-20251123    gcc-12
xtensa                  allnoconfig    gcc-15.1.0
xtensa      randconfig-001-20251122    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


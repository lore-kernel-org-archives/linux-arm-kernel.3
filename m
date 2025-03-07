Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED692C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JvJK3X4tGMJeFXEIJt8NMnUo6+JUUfB1onZUIJWWxlY=; b=BpdnD9Z++UiEvjNc7pOy9T3ytY
	8RY8f5+FIfZ6lsLUNNZV1RfEFfXAW53GiHSNo74XjOqPs94LJf7acnWbSezJaBaf5Kirg0tlJRPEd
	rID2ZbNYmtdK4S2knWAPGOoTAI46/p7pytSygfIGm6ori6Bn6jjxfBkzvHh7/Op1VvVX+zVni97xO
	opHm/ifcEiaNYx+kH7MkE+UPXcR4QEGTv1lU9l8cxGEv8lL2u7hw7HifIi9XlH12ifU86AznIYyv/
	qvHu7i6EDdq6Tr4W0pCNW9lTOHsq1iDbqUaizW3LzGrxa+fB80JQ6nvkTGP+8mbjq1G08GkCT7rIm
	dApG0Nxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbb4-0000000F3j4-2dxj;
	Fri, 07 Mar 2025 17:34:54 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbXr-0000000F3JE-1vm0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741368695; x=1772904695;
  h=date:from:to:cc:subject:message-id;
  bh=tsmVsOhzOjgfAtBk1NggtN5vqLoXCBCiAU5HGQ5rFJk=;
  b=Fj15XSwZj/Wb7VLgQcXh96LhHyV0JCFbEW3guDxwHh6teXV8s8CJkxLG
   e04MCNjZmt4PdjoCXxREI6xnZIDu4CCkbIS7QYQPmWoLRL9r6I167XFX8
   U6zBFvhLpM9pOtG7bwnRwGVhep4ZlDj49vufZTGZhHQvNomyrGf/dypDS
   LEu1Awd3kkH1E77yNW0fN1kucJre2IlYG9fNTXg+rD/zFdw8H9VyplfhW
   WF902mtLcyKmSqvEOiFFaWWaaJ9Xn83hqNwilIvabqaPSkDmBHCvhE8wv
   lvMsoUQ5CUc626RHKUrxAM/JDzCCP5xbvVYxSwIAMIJ9yB5hQomlZcplA
   Q==;
X-CSE-ConnectionGUID: J11I/4oKT0SzStdpYGPKPQ==
X-CSE-MsgGUID: pHzWPTRgQfinSecaqg57rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42653358"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42653358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:31:31 -0800
X-CSE-ConnectionGUID: MkJ6Ho1UQcCAILe98hm5cg==
X-CSE-MsgGUID: 295f1wXaQAGroa335P6g+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124611333"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2025 09:31:30 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbXj-0000rD-2l;
	Fri, 07 Mar 2025 17:31:27 +0000
Date: Sat, 08 Mar 2025 01:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:mediatek/drivers] BUILD SUCCESS
 1e12efbee8f3fe09d23ad75d2e38a6335ca2d159
Message-ID: <202503080157.vg9WxpEw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093135_509076_022C6836 
X-CRM114-Status: UNSURE (   5.20  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mediatek/drivers
branch HEAD: 1e12efbee8f3fe09d23ad75d2e38a6335ca2d159  soc: mediatek: mtk-socinfo: Add extra entry for MT8395AV/ZA Genio 1200

elapsed time: 1820m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20250307    gcc-13.2.0
arc                   randconfig-002-20250307    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                            dove_defconfig    gcc-14.2.0
arm                   randconfig-001-20250307    clang-21
arm                   randconfig-002-20250307    gcc-14.2.0
arm                   randconfig-003-20250307    clang-19
arm                   randconfig-004-20250307    clang-21
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250307    gcc-14.2.0
arm64                 randconfig-002-20250307    clang-15
arm64                 randconfig-003-20250307    gcc-14.2.0
arm64                 randconfig-004-20250307    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250307    gcc-14.2.0
csky                  randconfig-002-20250307    gcc-14.2.0
hexagon                           allnoconfig    clang-21
hexagon               randconfig-001-20250307    clang-21
hexagon               randconfig-002-20250307    clang-21
i386        buildonly-randconfig-001-20250307    clang-19
i386        buildonly-randconfig-002-20250307    clang-19
i386        buildonly-randconfig-003-20250307    gcc-11
i386        buildonly-randconfig-004-20250307    clang-19
i386        buildonly-randconfig-005-20250307    gcc-12
i386        buildonly-randconfig-006-20250307    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250307    gcc-14.2.0
loongarch             randconfig-002-20250307    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                           xway_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250307    gcc-14.2.0
nios2                 randconfig-002-20250307    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250307    gcc-14.2.0
parisc                randconfig-002-20250307    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250307    gcc-14.2.0
powerpc               randconfig-002-20250307    clang-21
powerpc               randconfig-003-20250307    clang-19
powerpc64             randconfig-001-20250307    clang-21
powerpc64             randconfig-002-20250307    gcc-14.2.0
powerpc64             randconfig-003-20250307    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250307    gcc-14.2.0
riscv                 randconfig-002-20250307    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250307    gcc-14.2.0
s390                  randconfig-002-20250307    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250307    gcc-14.2.0
sh                    randconfig-002-20250307    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250307    gcc-14.2.0
sparc                 randconfig-002-20250307    gcc-14.2.0
sparc64               randconfig-001-20250307    gcc-14.2.0
sparc64               randconfig-002-20250307    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250307    clang-17
um                    randconfig-002-20250307    clang-21
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250307    clang-19
x86_64      buildonly-randconfig-002-20250307    gcc-12
x86_64      buildonly-randconfig-003-20250307    clang-19
x86_64      buildonly-randconfig-004-20250307    clang-19
x86_64      buildonly-randconfig-005-20250307    clang-19
x86_64      buildonly-randconfig-006-20250307    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250307    gcc-14.2.0
xtensa                randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


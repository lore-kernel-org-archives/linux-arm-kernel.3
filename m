Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22D3D10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 03:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tQAKyicCqXpPSNe2qYsg7VJLZGbgSiu+enxEzqb/NDQ=; b=lMuC0dG/wT0njKUtQTbKdPsIRp
	p4GBe/GqBrZUzQGB9qfJrqAegKuaszDe7FZwcpgbXgss2u7xiP+miE89bNwPIDsxYemC7guXCQXOa
	vVPNnenXh0co0AFriLm7UcWo6WFk5u7C8qtV0fRLiLkY+VYWiwYdCS+HwCOwm+N2VXYqCHKwVVDW8
	KxB6IejT3FT/gdwKoP65S/LtFQMUhcAAGhWv3gf+kJ1DS6qTYmMlaG098Bdl2MT5ibhlgGdfpBzEA
	x+73h3cS/vnvLER5IaG44PV2DGW98+8GhUunGFEBVysoPSr7Va2GOqYnz5KNb55Rk+5/dodqJoS+9
	7PKND4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOSea-0000000Fvow-2jqi;
	Thu, 27 Nov 2025 03:26:44 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOSeY-0000000Fvob-26vT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 03:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764214002; x=1795750002;
  h=date:from:to:cc:subject:message-id;
  bh=eaaDbQXsa0MxX2AC54mRt6nDCR3LFyW38ydDLR6gmjM=;
  b=IFbE4Jqcvt1ns3fhp5pasmGvuG4n8VqDv52dJcpGRUmfl5g4Hdn7/LPL
   EjiBalLJ6mii0URmA9/7h+FYqPYe6sXGPTV+zLAexXdlBwLFYvnyBJayQ
   4nnjoZwVdHDNrpgKD8X/2FYsvSrky/CXhuHzuAw5EWeQLLWlMLXS4+1GA
   KfCEh+7NUVk+gLVJBFG7b64Q5Q4hjvBIICtAY7Ktmn2K+nCHWwwXDuzzP
   pbcIDr/8jLkStNwc7Hzc81AH7BrJK7mTA/HTJ5PZtdqAfio7yRkP8ISnL
   rPx1Be/KYy9e40xr1uYQKynW3u54fJ+bCgX24m7Mq+Ybo7cVZLcXiO69u
   Q==;
X-CSE-ConnectionGUID: C/Rb/WbKSW6Nhby0kizXww==
X-CSE-MsgGUID: P/7m8qsGT4OVSFPyDAzc4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65968805"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="65968805"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 19:26:40 -0800
X-CSE-ConnectionGUID: d3GtnCjeQGKdDkYLhjUVnw==
X-CSE-MsgGUID: 4sWTa95+Rq+a0BP6Pt90Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192369564"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2025 19:26:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOSeS-000000003cz-0hwH;
	Thu, 27 Nov 2025 03:26:36 +0000
Date: Thu, 27 Nov 2025 11:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:sophgo/dt] BUILD SUCCESS
 af5eb17ff893bf6e52680a31059e1816749c2d20
Message-ID: <202511271116.h9SQFiLu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_192642_616436_4D70F41C 
X-CRM114-Status: UNSURE (   5.44  )
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
branch HEAD: af5eb17ff893bf6e52680a31059e1816749c2d20  riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2

elapsed time: 7577m

configs tested: 65
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251122    gcc-14.3.0
arc         randconfig-002-20251122    gcc-9.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251122    clang-22
arm         randconfig-002-20251122    clang-22
arm         randconfig-003-20251122    clang-22
arm         randconfig-004-20251122    gcc-12.5.0
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
openrisc                  defconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc                    defconfig    gcc-15.1.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
riscv                   allnoconfig    gcc-15.1.0
riscv                     defconfig    gcc-15.1.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390                      defconfig    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                     defconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


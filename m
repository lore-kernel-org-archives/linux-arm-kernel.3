Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB86D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 19:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UBbI06L9v1rtOvt/m3p8qVKQ0BclUC1IRY/2Uc3krW0=; b=Nv7mtyexqWoIwCqqMG8xG7KXe9
	xSi234YmFqzPyvEDZyluM11kkrC/ei4iB6jcFW2OPxNU7hVgYzhb/68VHC41k0U4eNjk0hYhjLBFX
	Nd18X9nVPV+llP5IRcm0fwLrZm0FmugG5mxnWgQ8Y28Q5FTaZDZ/ElHc/w0bcNBw1UhR5RYPSOIi0
	HCUlG+Rg+8nqkVGobEbxUQA6jJXhl/w3p+BlXpsXTrRTU+JsRJyZ1HUzX4k2vh2lGtrTK+EKYzyor
	5ajuxwTV8E+EAyIZmL6ZGcoo4pEEbPPjK/PtLAM+bVYPEWBoY8JYZzxlkhoEtNVW5tbcejWPscZvX
	oDCbCdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPn1k-00000002Vig-3XXF;
	Sun, 30 Nov 2025 19:24:08 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPn1i-00000002ViL-0s8W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 19:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764530647; x=1796066647;
  h=date:from:to:cc:subject:message-id;
  bh=0J7GikinT6yBXm3NimfuUSJejPiXvZ+/gqTWvUYHbzs=;
  b=FIP7kVF+TmH9PWjkP98V59KTNyXqeVJv5SjlRjSGrZgpivBJ6zEvXT0j
   ZtosHP019WB4N2OhPAi6k9ZVTHOERQVDvgJGFHuGoz3AYYrNnAd8BHPo/
   MkNcXt1n+sm8tbrf//b+BFKFSih6rCMeGdiytT/oeCH75aPKLOP+nPl9z
   pKPdozfQ2K4cOIQuT0LDzUFT7APLsIEZ1omZJdIXwG9ZFp/5gStap8Ec0
   YJuehL8V+UynfNNSRtxPpYAj1EREd6DP2KuM+jY0oNQIVrcvHGsQRWMtZ
   9j32lD8sTHEhm3vwCCyghSR7TTvNKNzm7s0TnhXmAsg1fGc2YQ0YZ1/RL
   g==;
X-CSE-ConnectionGUID: 7Y1L2hDpQuCy5zFE5K+OKw==
X-CSE-MsgGUID: ylFqoNrkTnaJ73A0FNtyPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66425320"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="66425320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 11:24:03 -0800
X-CSE-ConnectionGUID: pCpSP0f7S/+i/dv2M5hSbg==
X-CSE-MsgGUID: xXIKYYYBQUiGM4OgTciFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="194681833"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Nov 2025 11:24:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPn1b-0000000088V-0VdJ;
	Sun, 30 Nov 2025 19:23:59 +0000
Date: Mon, 01 Dec 2025 03:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 00de4ef9d3abc0b195988c23aea2fefe5f76d3c4
Message-ID: <202512010357.N2w7SOtH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_112406_345941_95A6BAAB 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/defconfig
branch HEAD: 00de4ef9d3abc0b195988c23aea2fefe5f76d3c4  Merge tag 'riscv-config-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/defconfig

elapsed time: 4098m

configs tested: 76
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                    allmodconfig    clang-19
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    clang-19
arc         randconfig-001-20251128    gcc-8.5.0
arc         randconfig-002-20251128    gcc-15.1.0
arm                     allnoconfig    clang-22
arm                     allnoconfig    gcc-15.1.0
arm                    allyesconfig    gcc-15.1.0
arm                       defconfig    clang-22
arm         randconfig-001-20251128    gcc-14.3.0
arm         randconfig-002-20251128    gcc-8.5.0
arm         randconfig-003-20251128    clang-22
arm         randconfig-004-20251128    clang-17
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
arm64                     defconfig    gcc-15.1.0
arm64       randconfig-001-20251129    clang-22
arm64       randconfig-002-20251129    clang-22
arm64       randconfig-003-20251129    gcc-8.5.0
arm64       randconfig-004-20251129    clang-22
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                 allnoconfig    gcc-15.1.0
i386                    allnoconfig    gcc-15.1.0
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    gcc-15.1.0
m68k                   allmodconfig    clang-19
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    clang-19
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    clang-22
openrisc               allmodconfig    clang-22
parisc                 allmodconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
powerpc                allmodconfig    gcc-15.1.0
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
riscv                     defconfig    clang-22
riscv       randconfig-001-20251129    gcc-8.5.0
riscv       randconfig-001-20251201    clang-22
riscv       randconfig-002-20251129    gcc-11.5.0
riscv       randconfig-002-20251201    clang-22
s390                   allmodconfig    gcc-15.1.0
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251201    clang-22
s390        randconfig-002-20251201    clang-22
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh                        defconfig    gcc-14
sh          randconfig-001-20251201    clang-22
sh          randconfig-002-20251201    clang-22
sparc                   allnoconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
sparc64                   defconfig    gcc-14
um                      allnoconfig    clang-22
um                        defconfig    gcc-14
um                   i386_defconfig    gcc-14
um                 x86_64_defconfig    gcc-14
x86_64                    defconfig    gcc-14
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


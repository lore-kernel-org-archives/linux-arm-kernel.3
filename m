Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5955CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 04:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WjPu5iTRlEfW02VCExNqXC/gyJXQLZHRT4jdYn7b6q4=; b=3LDWOeZc1PHK4NWkiQNha2ayX4
	7mZzxvXoFlUw7BvkrKGa1cILD0IeeVI6MYoKWXk5kjTeYrkNh4cAHefuVZppeOe7rip+cl5IXhJ/k
	euxddmZ/2oFzkhDzhuQO3a1xLISQiRgpe/fLV6Ahcx9vF/kDMhTxCMLY5SN57JaSjbwVdA5QO3Iep
	fVdnF0G0XgLNPx37RJXo6wXMLfn3hvy5iUcXvzQfYsIG8HMCw7ylTrV6W/nr32vO4efKWq+6NG2Ks
	vfw9/+0m0NeQHt26u/LIfz+zincFkNaYQsxk99nquh9f4d+GyuuJJ+evDpHwsRl2R5BCr+3DDb9py
	zOwksEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTvz-0000000Fyly-1uWV;
	Thu, 27 Nov 2025 04:48:47 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTvx-0000000Fylf-0Y8V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 04:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764218925; x=1795754925;
  h=date:from:to:cc:subject:message-id;
  bh=M32/aiISx/hwXPym06dKVWHiYLDL6hs5GfpdhcRs0eA=;
  b=Ge2Qsh17clRf/Oq3VnuPMy7/IC+8Ban1TNuqSx6ufhE+COKPqmOsqbWd
   dyBrekGZ6zXK9At7i3dWrxKlyyInI4PnmnYQAveSr4eQeuDN4pEG3hBnC
   e4yDxIHV+VtNMj/QNthJqZCmNKbuW55YmBbD1qsmelzEgIUXt6Zu4x/37
   tYXe7YXKlWD/AWORkux5k6QHSeOUU+gg1+i7ZsjCH9W9wkTWODBA+vwJ7
   cRz5RhVSaCkSZA5Sc7YV7vTRLirmEAChBTpC0mkXzfr13EpCZWYyeQLXj
   WpBzPHeDW9bq0j/cUYD/1+qfSfRr1mHQw1f6Orv2fzUvk+dDYJ3+DM/a8
   A==;
X-CSE-ConnectionGUID: 4q9p2fNaQYuoBFNz0Pnp4Q==
X-CSE-MsgGUID: SdwxQrGbSragZdlxnVDK0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66209983"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66209983"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 20:48:44 -0800
X-CSE-ConnectionGUID: yH3G5wE0SV6ovZhrq+bayw==
X-CSE-MsgGUID: y0q2a9FlQNeZc5sp/inhlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192944977"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 20:48:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOTvs-000000003hJ-1vSo;
	Thu, 27 Nov 2025 04:48:40 +0000
Date: Thu, 27 Nov 2025 12:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:k3/dt-2] BUILD SUCCESS
 56baa9190988f35d53b1479a87c1bf44f6c979c6
Message-ID: <202511271200.zEkDWunm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_204845_265833_46353803 
X-CRM114-Status: UNSURE (   5.60  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git k3/dt-2
branch HEAD: 56baa9190988f35d53b1479a87c1bf44f6c979c6  arm64: dts: ti: k3-am62l: Fix unit address of cbass_wakeup

elapsed time: 7660m

configs tested: 82
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-16
arm64                            allmodconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251122    clang-22
hexagon               randconfig-002-20251122    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251127    clang-20
i386        buildonly-randconfig-002-20251127    clang-20
i386        buildonly-randconfig-003-20251127    clang-20
i386        buildonly-randconfig-004-20251127    clang-20
i386        buildonly-randconfig-005-20251127    clang-20
i386        buildonly-randconfig-006-20251127    clang-20
i386                  randconfig-011-20251127    clang-20
i386                  randconfig-012-20251127    clang-20
i386                  randconfig-013-20251127    clang-20
i386                  randconfig-014-20251127    clang-20
i386                  randconfig-015-20251127    clang-20
i386                  randconfig-016-20251127    clang-20
i386                  randconfig-017-20251127    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251122    gcc-12.5.0
loongarch             randconfig-002-20251122    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251122    gcc-11.5.0
nios2                 randconfig-002-20251122    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                            allmodconfig    clang-16
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                randconfig-001-20251127    gcc-14
x86_64                randconfig-002-20251127    gcc-14
x86_64                randconfig-003-20251127    gcc-14
x86_64                randconfig-004-20251127    gcc-14
x86_64                randconfig-005-20251127    gcc-14
x86_64                randconfig-006-20251127    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


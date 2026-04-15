Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF1FFA0C40
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uACkS06bTUnKgsYI7O4O4WeANoMQD0BTtPdGChfhCzs=; b=4Gxeuikv68hSb2MPVvVPsujC1t
	k8Eu+d27SdspRAmTPeB5PSZHWrqcqUltMXvNyaD6NMltWCB4Zag2+lBnZW+hD3KcmvNIASUrgLoXB
	x8TH3iEFXV4Jwo9jXShGf+smEi7dx4T4BPWSXxw1fQGG1kv43/TpQSukWodFg/UkAds6Vupsefsjx
	LHWJNphx3EDa2Hs+iH9yHyw+2vyit8Ab+cMctH6ZWRv3ZqKsCOYryRXMNo5hkr1+XND10BVlHGJBN
	Aftjtm0thtHtydLM2fjFGNuDwsbhmvWlZcWClj8uZwpD8eDX7eFUp0Cs24h+EPwbJ8plJC8itIdhn
	+q/BTpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuiz-00000000jZo-1Blu;
	Wed, 15 Apr 2026 07:31:49 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuiw-00000000jZU-3ntS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 07:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776238307; x=1807774307;
  h=date:from:to:cc:subject:message-id;
  bh=17keJmKqSRRl6llWR4Mj3RP+4beLxsCMxTBwN6fMh/g=;
  b=BfwPTelfYJiKYSyxoTs7JMy5iizNkZFqMSbwKx2gCd8h7eqqBiX1tFZe
   LfV//52PesqjT8pAQTCONvoTbpE1lBhCZxYee0HhTqKhUQ7txZUyPCU/I
   YsptiBSTKOn7OEtUofAGvSOqIip32nJ98pIjnfKvGuq99sV6lZ6W0Spvn
   Me0/GGQOwNe6/HXKnTXn2lrL94FK2hmUTsKKQXeb5fwtmRWX249WkfsWZ
   aNNE3HOt3aromRoTr0tzqyjtilby7cXbfzjSPVxGlZjUsOmUScUZYYaXt
   PJrITx0qjYZR4zs2dEEsvcfze63DZz6xkwPZvyK5COVBBJ38CGUCoxMCG
   A==;
X-CSE-ConnectionGUID: 29Pcy6xOTzOOT6PDOOuUhg==
X-CSE-MsgGUID: E7YPjiE8TaKzZNP3tArCew==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88656966"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88656966"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 00:31:45 -0700
X-CSE-ConnectionGUID: wBG2xHyCRaG4gZWpFZOTAg==
X-CSE-MsgGUID: mxhnHXHvSYSpkZYtayLcXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234375834"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2026 00:31:44 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCuir-000000000FR-0omF;
	Wed, 15 Apr 2026 07:31:41 +0000
Date: Wed, 15 Apr 2026 15:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 41d7004ab4e521ccbd98793d7da55022796c463f
Message-ID: <202604151525.RNiMNIrw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_003147_040842_6C8A3366 
X-CRM114-Status: UNSURE (   4.89  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: 41d7004ab4e521ccbd98793d7da55022796c463f  Merge tag 'ti-k3-dt-for-v7.1-part2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/dt

elapsed time: 728m

configs tested: 75
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260415    gcc-8.5.0
sparc                 randconfig-002-20260415    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260415    clang-23
sparc64               randconfig-002-20260415    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                    randconfig-001-20260415    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260415    clang-20
x86_64      buildonly-randconfig-002-20260415    gcc-13
x86_64      buildonly-randconfig-003-20260415    gcc-14
x86_64      buildonly-randconfig-004-20260415    clang-20
x86_64      buildonly-randconfig-005-20260415    clang-20
x86_64      buildonly-randconfig-006-20260415    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E64D75BA2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9kEGhgPMsQM8K8bGXZN9cSvs1hdDBG6uzi3+T3N2iUU=; b=nE0ORCu0CrE/UuQZAlVS3J8Xu4
	I5IkqplPjXNCJc+d83vh45w8ZNOr8eUFycL4ZspmpMivesu24h+1g2GVC1ni6wePRfh0E5pLbEbvU
	1vQJkAMahrcvuwRmEqQXHg+igToQUUikxGWwvM6Hhgyxl5ADQ9VFfeuOJT9B7HxIGFI8niD7aTQEx
	i3PXxqhIwqrTOscAsZabqT3QUQHBDEBtiMj1QXEHN2wjCMt1jVH7DFDJxCU0GoIQWEzUCBpp19RNg
	NMZs7IBBCCmalSukgvatGMOou6kmBF31c97rBmWTF1PhZj4b/HtWHE9AQ8abN3Ecv9YmHuliSYKyt
	pQSTiOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwpj-0000000GauT-2gdO;
	Thu, 21 Nov 2024 02:22:15 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwoo-0000000GasF-0JL3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732155678; x=1763691678;
  h=date:from:to:cc:subject:message-id;
  bh=N8FnIWiSZIJSFCVy+7lizgCMwGHK+ORpuJFLrsB1aIY=;
  b=XxWchPOPojjs0mdnyCV9N5eS8fSjvCY7vNOdEhSVF78EUpmaFj4KsD+O
   eNSkPklF6NgSL7akJMIqt69p3BzIY6/fI6GKKd0ZB6tZmi7NHyY7v5km8
   7DtYz7HZ1Rm5zwBiZ9AogHUNKt+dMyTIsPiwawEb992EcDnGf8L05iKbk
   3UAiXBD6zCbSRo3rgJyQpadrjHgO00+0IklexW6mOZaebw0OyBsoy0ukk
   t7nZ0dEYitBR1dFhgX8Nh1etvp+niSzbcNUmOk//qPHEbuwIZnrzCwgoN
   ia4ohCGX4y3/K3deiwXcrfVvywHy1mtrZuaMzF2jWt6Hfn0VZytb7AMzD
   A==;
X-CSE-ConnectionGUID: rja9SkogTgSxPH6w6xupCw==
X-CSE-MsgGUID: rDb35eA7TemEtjh9vHHtQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32379926"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="32379926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 18:21:16 -0800
X-CSE-ConnectionGUID: 2xjM8xSLSZagvzgjHMNHcw==
X-CSE-MsgGUID: ysBE9V42Sw60WJNlqdUdLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90226292"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2024 18:21:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDwoj-0001RL-06;
	Thu, 21 Nov 2024 02:21:13 +0000
Date: Thu, 21 Nov 2024 10:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 b77587ac51d2fe4b9d5751662ddc083d19153662
Message-ID: <202411211022.vk8580jQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_182118_160643_0B501B1F 
X-CRM114-Status: UNSURE (   5.42  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: b77587ac51d2fe4b9d5751662ddc083d19153662  Merge tag 'soc_fsl-6.13-1' of https://github.com/chleroy/linux into soc/drivers

elapsed time: 1450m

configs tested: 85
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                     allnoconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241121    gcc-13.2.0
arc         randconfig-002-20241121    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                     allnoconfig    clang-20
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20241121    clang-20
arm         randconfig-002-20241121    gcc-14.2.0
arm         randconfig-003-20241121    clang-20
arm         randconfig-004-20241121    gcc-14.2.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.2.0
arm64       randconfig-001-20241121    clang-20
arm64       randconfig-002-20241121    clang-20
arm64       randconfig-003-20241121    gcc-14.2.0
arm64       randconfig-004-20241121    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20241121    gcc-14.2.0
csky        randconfig-002-20241121    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241121    clang-20
hexagon     randconfig-002-20241121    clang-15
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch   randconfig-001-20241121    gcc-14.2.0
loongarch   randconfig-002-20241121    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2       randconfig-001-20241121    gcc-14.2.0
nios2       randconfig-002-20241121    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc                    defconfig    gcc-14.2.0
parisc      randconfig-001-20241121    gcc-14.2.0
parisc      randconfig-002-20241121    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-001-20241121    clang-15
powerpc     randconfig-002-20241121    gcc-14.2.0
powerpc     randconfig-003-20241121    clang-20
powerpc64   randconfig-001-20241121    gcc-14.2.0
powerpc64   randconfig-002-20241121    clang-20
powerpc64   randconfig-003-20241121    clang-20
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    clang-20
riscv                     defconfig    clang-20
riscv       randconfig-001-20241121    gcc-14.2.0
riscv       randconfig-002-20241121    gcc-14.2.0
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.2.0
s390                      defconfig    clang-20
s390        randconfig-001-20241121    gcc-14.2.0
s390        randconfig-002-20241121    clang-20
sh                     allmodconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh                        defconfig    gcc-14.2.0
sh          randconfig-001-20241121    gcc-14.2.0
sh          randconfig-002-20241121    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
sparc64                   defconfig    gcc-14.2.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
um                        defconfig    clang-20
um                   i386_defconfig    gcc-12
um                 x86_64_defconfig    clang-15
x86_64                        kexec    clang-19
x86_64                     rhel-9.4    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


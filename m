Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D950C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1QNy/7gvgmU/E67RG266zicM9HX4ieZNC8ECh76/Op8=; b=Bq4xuXRjziFcUOc8qHhJN0b3dE
	u+5sIs04ZzQCT3maYez/BgOrbPkZPFlWHo2KjXcGTxTuH28GwPie1PUXp1ndZg07hIEKrbeJUluMB
	Wha7/TosS+6WYBMPn2CAikL2LynEHOld54o1Fk8ILIbyno1o7kQflbevS5yLw6hEtZ1B73A10gT/+
	gLJuV/HPoScRwRmAZrF3jB0MjTZeN/lq1lrVc+wEGksdNN+dJOPKgPOqCpHKVfnu1BZZRH4sFvd1O
	fXJhfp8G7FyVehdyMODDvg0unKbHYOGk7ZdXNkypJZi57HH3NHbCeoTyk5ULALUqZody3wO02bdf9
	q5nBCbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57MK-000000003Bu-00ms;
	Fri, 11 Sep 2026 19:56:28 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57MH-000000003BR-16xg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 19:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789156585; x=1820692585;
  h=date:from:to:cc:subject:message-id;
  bh=sAEo9k+sWvUXSyU6ky3lRRjm0y++hKLzLz2dHFXSL7Q=;
  b=f7nhPGRb4+P2B9Odvw2B0V3G5lQ/meZOSjtEH9hI6KgMr1JEbSumxgbs
   H37JdXBc9VIDbubSCcxdvrhRzomanFFDK3E0u0DOlYupk9eL+1Bw6Qpel
   Eh/3IZolTLSozUBDspw5YlrSjNneYFNc5e1AfuHPDrs61skaagKYwi2lj
   FBZdPAYuCQnWftBhPOrc8kbdGL5pJQuD6ERGfNCIjymKQnYOg0+HlkiT1
   D/i16tP+1k2zC2YGlzFPARD85GWxA/FP7g9F3jqzt38peks5ERFY2hFaF
   IQJ12cg/PCDvKIg3h5McA3+01W6dGsfCoOSj7dlE9sB8T6OCE+JC237CY
   g==;
X-CSE-ConnectionGUID: bJ/4At2PQc6/50wvSH88cA==
X-CSE-MsgGUID: /PaSfkM1TESNMDOKoZeOVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="77187937"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="77187937"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 12:56:24 -0700
X-CSE-ConnectionGUID: N6kyTagwRgiwzCEHmBMddw==
X-CSE-MsgGUID: 70cCFgcARoSKe60iERurww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="276167018"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 12:56:23 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x57MC-0000000025w-20nA;
	Fri, 11 Sep 2026 19:56:20 +0000
Date: Sat, 12 Sep 2026 03:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove-7.3] BUILD REGRESSION
 cf983087c51a9c74c3d4d3b353eb811ae5030823
Message-ID: <202609120357.QwUJs8ue-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_125625_311157_C6AA1E38 
X-CRM114-Status: UNSURE (   4.71  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
branch HEAD: cf983087c51a9c74c3d4d3b353eb811ae5030823  power: supply: sbs-battery: remove platform_data based probing

Error/Warning (recently discovered and may have been fixed):

    drivers/mtd/spi-nor/winbond.c:115:7: error: expected expression

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-at91_dt_defconfig
|   `-- drivers-mtd-spi-nor-winbond.c:error:expected-expression
|-- m68k-randconfig-r133-20260911
|   `-- include-linux-spi-spi-mem.h:error:expected-expression-before-token
|-- powerpc64-randconfig-r121-20260911
|   `-- drivers-mtd-spi-nor-winbond.c:error:expected-expression
|-- x86_64-randconfig-012-20260911
|   `-- include-linux-spi-spi-mem.h:error:expected-expression-before-token
`-- x86_64-randconfig-013-20260911
    `-- drivers-mtd-spi-nor-winbond.c:error:expected-expression

elapsed time: 1492m

configs tested: 48
configs skipped: 3

tested configs:
alpha                   allnoconfig    gcc-16.1.0
alpha                     defconfig    gcc-16.1.0
arc                     allnoconfig    gcc-16.1.0
arc                       defconfig    gcc-16.1.0
arm                     allnoconfig    clang-17
arm               at91_dt_defconfig    clang-17
arm64                   allnoconfig    gcc-16.1.0
csky                    allnoconfig    gcc-16.1.0
csky                      defconfig    gcc-16.1.0
hexagon                 allnoconfig    clang-24
hexagon                   defconfig    clang-24
hexagon     randconfig-001-20260912    clang-22
hexagon     randconfig-002-20260912    clang-17
i386                    allnoconfig    gcc-14
loongarch               allnoconfig    clang-20
loongarch                 defconfig    clang-24
loongarch   randconfig-001-20260912    clang-24
loongarch   randconfig-002-20260912    gcc-13.4.0
m68k                    allnoconfig    gcc-16.1.0
m68k                      defconfig    gcc-16.1.0
m68k                 sun3_defconfig    gcc-16.1.0
microblaze              allnoconfig    gcc-16.1.0
microblaze                defconfig    gcc-16.1.0
mips                    allnoconfig    gcc-16.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    gcc-11.5.0
nios2       randconfig-001-20260912    gcc-8.5.0
nios2       randconfig-002-20260912    gcc-11.5.0
openrisc                allnoconfig    gcc-16.1.0
parisc                  allnoconfig    gcc-16.1.0
parisc64                  defconfig    gcc-16.1.0
powerpc                 allnoconfig    gcc-16.1.0
powerpc                g5_defconfig    gcc-16.1.0
powerpc            katmai_defconfig    clang-24
riscv                   allnoconfig    gcc-16.1.0
s390                    allnoconfig    clang-24
sh                      allnoconfig    gcc-16.1.0
sparc                  alldefconfig    gcc-16.1.0
sparc                   allnoconfig    gcc-16.1.0
um                      allnoconfig    clang-17
x86_64                  allnoconfig    clang-22
x86_64      randconfig-011-20260911    gcc-14
x86_64      randconfig-012-20260911    gcc-14
x86_64      randconfig-013-20260911    clang-22
x86_64      randconfig-014-20260911    clang-22
x86_64      randconfig-015-20260911    clang-22
x86_64      randconfig-016-20260911    clang-22
xtensa                  allnoconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772E8C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 22:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FMsnrWky6nnIbMZo7oybp8hGSrSxKTLqYIBn/2T4aqI=; b=aJOqutKr/xb6JCG+aU+Mb/1Enb
	/HyXGJ+jtu92FqKNcW76WhWFVxQ1eUTqLguhFcQJw9KFiuO4PN/qiuJCKJAH3w/XTZ/BhNKyw1M9W
	ffhiVAaVCX4sAwch5qg7Jf9fiI4HiHut0XR6L9caswEGlfM129W/WoKcFpgaHemB1GnFylsxvHKQ9
	QHYy/bK4QXvraJ+NOVMSQCIEQiP3kPst0rbr0DEeVpsdRDOjUgODwh7dEf2QRUFx93izpQd7YKWRA
	4wI+J2YE3jjTKPQnJF9+2i8xEWGio7jHL097aElu6AB2SLoA1qKzrZikXN3BTVuh45Zdy5TiIaWge
	qI1R8JTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxXIe-0000000E5fv-4Aji;
	Fri, 21 Aug 2026 22:01:21 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxXIY-0000000E5fb-2i8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 22:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787349675; x=1818885675;
  h=date:from:to:cc:subject:message-id;
  bh=pj5avFMWdUFjdAoJBkO/qnxiaO0qUFxXBT/FaTjjIBg=;
  b=DbtnqoGcsBinICmYTK5NM/tL7C8QBLd0AoHJQLNLPnKbDMemu4u2+85J
   K4UAcUYCt2VKI+UVpXOvlDaqvtpv3Yu+kdHbUTQRUi9QWW8YcIomCglq9
   I+NbVKJ2cy6VW/Wo5cC+UJMSDhWH9sAJMOZ1dWvRmakAjaAqhXG302lqu
   PDCfKULjYtdQimcH4qrbWY8hyuyEBe9KHnCniXrnZuIAHSTB3LupcsPNh
   73CeGwxOuP3NAier6N/TIXxZ/Ra2y11AZcjAYXlM9Imetk+8E9xzB1Sae
   3lv+zKtSHHp4NZba78xU79uCi9Z/DZjtd3JlgSzjcYcdHPo/xTmxSmAqo
   g==;
X-CSE-ConnectionGUID: LeX/FXXOQ3aAamjlhNMPyg==
X-CSE-MsgGUID: akr7Qo+RRry9ZjvE50G4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="98494975"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="98494975"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 15:01:13 -0700
X-CSE-ConnectionGUID: rFjV5Q/2QU6IbNEjpuX+bg==
X-CSE-MsgGUID: RdoW6DhHTYCvgLYWT/DZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="271672962"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Aug 2026 15:01:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxXIT-00000000qVh-2mRl;
	Fri, 21 Aug 2026 22:01:09 +0000
Date: Sat, 22 Aug 2026 06:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4/ux500-power-domains-v7-2] BUILD SUCCESS
 2a0960023575ddaed421e8c109b6fc17bb45bafc
Message-ID: <202608220621.eNlrsDFF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_150114_754134_D471EDD1 
X-CRM114-Status: UNSURE (   5.43  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-power-domains-v7-2
branch HEAD: 2a0960023575ddaed421e8c109b6fc17bb45bafc  ARM: dts: ux500: Remove DB8500 EPOD regulators

elapsed time: 2927m

configs tested: 99
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260820    gcc-16.1.0
arc                  randconfig-002-20260820    gcc-10.5.0
arm                  randconfig-001-20260820    clang-24
arm                  randconfig-002-20260820    clang-24
arm                  randconfig-003-20260820    gcc-8.5.0
arm                  randconfig-004-20260820    clang-24
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260820    clang-24
arm64                randconfig-002-20260820    clang-24
arm64                randconfig-003-20260820    clang-24
arm64                randconfig-004-20260820    clang-24
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260820    gcc-16.1.0
csky                 randconfig-002-20260820    gcc-16.1.0
hexagon              randconfig-001-20260820    clang-18
hexagon              randconfig-002-20260820    clang-19
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260820    gcc-14
i386       buildonly-randconfig-002-20260820    clang-22
i386       buildonly-randconfig-003-20260820    gcc-14
i386       buildonly-randconfig-004-20260820    clang-22
i386       buildonly-randconfig-005-20260820    gcc-14
i386       buildonly-randconfig-006-20260820    gcc-13
i386                 randconfig-001-20260820    gcc-14
i386                 randconfig-002-20260820    gcc-14
i386                 randconfig-003-20260820    gcc-14
i386                 randconfig-004-20260820    gcc-14
i386                 randconfig-005-20260820    clang-22
i386                 randconfig-006-20260820    clang-22
i386                 randconfig-007-20260820    clang-22
i386                 randconfig-011-20260820    gcc-14
i386                 randconfig-012-20260820    gcc-14
i386                 randconfig-013-20260820    gcc-14
i386                 randconfig-014-20260820    gcc-14
i386                 randconfig-015-20260820    clang-22
i386                 randconfig-016-20260820    gcc-14
i386                 randconfig-017-20260820    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260820    clang-18
loongarch            randconfig-002-20260820    gcc-14.3.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260820    gcc-11.5.0
nios2                randconfig-002-20260820    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260820    gcc-8.5.0
parisc               randconfig-002-20260820    gcc-11.5.0
powerpc              randconfig-001-20260820    clang-24
powerpc              randconfig-002-20260820    gcc-8.5.0
powerpc                   sam440ep_defconfig    gcc-16.1.0
powerpc64            randconfig-001-20260820    clang-24
powerpc64            randconfig-002-20260820    gcc-10.5.0
riscv                randconfig-001-20260820    gcc-8.5.0
riscv                randconfig-002-20260820    clang-21
s390                 randconfig-001-20260820    gcc-8.5.0
s390                 randconfig-002-20260820    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260820    gcc-10.5.0
sh                   randconfig-002-20260820    gcc-12.5.0
sparc                randconfig-001-20260820    gcc-8.5.0
sparc                randconfig-002-20260820    gcc-16.1.0
sparc64              randconfig-001-20260820    gcc-11.5.0
sparc64              randconfig-002-20260820    gcc-9.5.0
um                   randconfig-001-20260820    gcc-14
um                   randconfig-002-20260820    gcc-14
x86_64     buildonly-randconfig-001-20260820    gcc-14
x86_64     buildonly-randconfig-002-20260820    gcc-14
x86_64     buildonly-randconfig-003-20260820    clang-22
x86_64     buildonly-randconfig-004-20260820    clang-22
x86_64     buildonly-randconfig-005-20260820    clang-22
x86_64     buildonly-randconfig-006-20260820    clang-22
x86_64               randconfig-001-20260820    gcc-14
x86_64               randconfig-002-20260820    gcc-14
x86_64               randconfig-003-20260820    clang-22
x86_64               randconfig-004-20260820    clang-22
x86_64               randconfig-005-20260820    clang-22
x86_64               randconfig-006-20260820    clang-22
x86_64               randconfig-011-20260820    clang-22
x86_64               randconfig-012-20260820    clang-22
x86_64               randconfig-013-20260820    gcc-13
x86_64               randconfig-014-20260820    clang-22
x86_64               randconfig-015-20260820    gcc-14
x86_64               randconfig-016-20260820    clang-22
x86_64               randconfig-071-20260820    clang-22
x86_64               randconfig-072-20260820    gcc-14
x86_64               randconfig-073-20260820    clang-22
x86_64               randconfig-074-20260820    clang-22
x86_64               randconfig-075-20260820    clang-22
x86_64               randconfig-076-20260820    clang-22
xtensa               randconfig-001-20260820    gcc-8.5.0
xtensa               randconfig-002-20260820    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


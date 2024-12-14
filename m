Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F2BE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2O4oOoLPC2yVW2hcYdsg08MBKCAp7j2tKdV81phEJeM=; b=ESnSUm+zgJYTZHQPgYZ308HVGz
	aSQEtNG5HHBU8Jopx5Wljmzwa01TnnJE0LWo31fg1A5jxb/OFyLRn1JKmgMU+EDKdK3Gyd08Tk0Yc
	Gj9Ila1gEDAUNcuVEleoyxmhnksfidnzf/At9bnu2mg3o8dnb30mE0vK0D4Yve7eOFLvqEJMy26wu
	GtJPLN5a+Q1clbhZUfVSJE0YtVTdPhpW5a6SxoY4/p5dgyX5Mef+2BKCTnU5c9rOXF19Z0Sr+t4Ot
	s6FsBu9rFbXkmHWTOqpTecp1NePaSD+0k5q+PRLLIJO+tAYq4uDwM16hCyWPauNu3OfY/kD+L33Ju
	/zjlCyvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMV0F-00000006d2Z-1C0X;
	Sat, 14 Dec 2024 16:28:27 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMUz7-00000006czL-1qjU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 16:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734193638; x=1765729638;
  h=date:from:to:cc:subject:message-id;
  bh=2RJtHk9lJyJ1rmk6GbovFVSVTVzAbW80Cmer3++SJr8=;
  b=iqqWSxImGoA8pCfpfYiDeFuHk9qlNfTav5DEhjrADXOZ92i6lK6B22d2
   bm/UPUUZ4UAJRrlcAVdTN7mDvBXSWzeSRpzHTOxmrfOlEHwjab36ObAsr
   LJFQMlbJ/UuHQAP597KpQpADvb8s7DLd75oTDYvNe+qgRMfbW+E23OwVU
   n/1nkb0xx4GHpfQ5OOkJLg2QRQuzKNv7mXcYo3bu3hBCaJFhgze5Pk3u6
   o+vP8MJjA/x7nKD26mGdEkcu8G2XxyJ1RjSYalIOEJkxv9kSr45iAjI8U
   4aO1gtQ6qb5uVBG4EI5nnvV80+V3OELYUw0X0Gv83agIZEaw5fzK8iGTS
   w==;
X-CSE-ConnectionGUID: J6KYs84iSLKkVVBQEvOS2A==
X-CSE-MsgGUID: 1M2RTW+zShqUOj5702jpKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38317313"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="38317313"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 08:27:11 -0800
X-CSE-ConnectionGUID: LOYjh2M6T7yJFyIw1J4dAw==
X-CSE-MsgGUID: Oax0MDr4TtmmUjMw/dU+wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="96875046"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Dec 2024 08:27:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMUyx-000D4V-1t;
	Sat, 14 Dec 2024 16:27:07 +0000
Date: Sun, 15 Dec 2024 00:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/newsoc] BUILD SUCCESS
 d4c0d167b1f6535da7183783688850b8c51e3c44
Message-ID: <202412150001.cNMrfMVU-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_082717_563751_AA0813AB 
X-CRM114-Status: UNSURE (   4.60  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/newsoc
branch HEAD: d4c0d167b1f6535da7183783688850b8c51e3c44  MAINTAINER: Add entry for Blaize SoC

elapsed time: 1448m

configs tested: 65
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241214    gcc-13.2.0
arc                  randconfig-002-20241214    gcc-13.2.0
arm                  randconfig-001-20241214    gcc-14.2.0
arm                  randconfig-002-20241214    clang-15
arm                  randconfig-003-20241214    gcc-14.2.0
arm                  randconfig-004-20241214    gcc-14.2.0
arm64                randconfig-001-20241214    clang-15
arm64                randconfig-002-20241214    clang-20
arm64                randconfig-003-20241214    clang-15
arm64                randconfig-004-20241214    gcc-14.2.0
csky                 randconfig-001-20241214    gcc-14.2.0
csky                 randconfig-002-20241214    gcc-14.2.0
hexagon              randconfig-001-20241214    clang-20
hexagon              randconfig-002-20241214    clang-14
i386                             allnoconfig    gcc-12
i386       buildonly-randconfig-001-20241214    gcc-12
i386       buildonly-randconfig-002-20241214    gcc-12
i386       buildonly-randconfig-003-20241214    clang-19
i386       buildonly-randconfig-004-20241214    clang-19
i386       buildonly-randconfig-005-20241214    gcc-11
i386       buildonly-randconfig-006-20241214    gcc-12
loongarch            randconfig-001-20241214    gcc-14.2.0
loongarch            randconfig-002-20241214    gcc-14.2.0
nios2                randconfig-001-20241214    gcc-14.2.0
nios2                randconfig-002-20241214    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20241214    gcc-14.2.0
parisc               randconfig-002-20241214    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20241214    clang-20
powerpc              randconfig-002-20241214    clang-15
powerpc              randconfig-003-20241214    clang-20
powerpc64            randconfig-001-20241214    gcc-14.2.0
powerpc64            randconfig-003-20241214    clang-20
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20241214    clang-20
riscv                randconfig-002-20241214    clang-20
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241214    gcc-14.2.0
s390                 randconfig-002-20241214    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241214    gcc-14.2.0
sh                   randconfig-002-20241214    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241214    gcc-14.2.0
sparc                randconfig-002-20241214    gcc-14.2.0
sparc64              randconfig-001-20241214    gcc-14.2.0
sparc64              randconfig-002-20241214    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20241214    clang-20
um                   randconfig-002-20241214    clang-17
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20241214    gcc-11
x86_64     buildonly-randconfig-002-20241214    clang-19
x86_64     buildonly-randconfig-003-20241214    gcc-12
x86_64     buildonly-randconfig-004-20241214    gcc-12
x86_64     buildonly-randconfig-005-20241214    gcc-12
x86_64     buildonly-randconfig-006-20241214    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20241214    gcc-14.2.0
xtensa               randconfig-002-20241214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


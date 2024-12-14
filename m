Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC50E77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KSMpT2JnTQDV80YzP6AyJhTbL5jGal4RBg0V1yTlHnY=; b=nyjVhnleZE0goLnq/+EBlIICH9
	WXskLZ/cyrw0SFnuec6auEsiZ6h/k5qRmt8zr4S+EhTEMz0muNMaxfT+z4ldEs1QLvaOc/HKSjau0
	r21CcYxdAgfK65YbSKskUd0ZHsYlPNy6GBpeckO/5p3uPMC9XvYZrsEOb8cVwp84EvDh85z9Gs28G
	f/J1DEEwNhkBh0uH1TisPPQ+G5Y9/OGdfqmg0Jx7/jjZcgrQhZcUzxW7uFg8jFw7FziAbMYiK065X
	1aHpDY18a041ETWebdBHs23R+hqZkC8bss/9PjxHMgHKZokWcmqZO0BJuNDdW1UmXhxTSXqYiNC5N
	oCx6sEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTz2-00000006Y8y-1HJc;
	Sat, 14 Dec 2024 15:23:08 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTxu-00000006Y4y-0dbn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 15:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734189719; x=1765725719;
  h=date:from:to:cc:subject:message-id;
  bh=FRVQt0pX6uDlWgd/hJora0WZcoa/nyIZlhwpMjihalU=;
  b=JAtehWS2YYE5R6oQoXALE2B7u0oldOSrr2XvgMZFaY3gjlER0YxKUXgu
   vy76YYCOBkHDOMv/2VoAdpFNLcRNFW6A6PH17B0rhGrhQyDnMTNnUXjEq
   6yf8rn7wA2AN2hOmB9hAvImcMgdKQqoqYGKulpgVTmcjwHY4mU3eyH+1C
   qLJgbf+83V5/3r/XPTFW9fkUTbO7UAA1cy9l7/Eb9vRoi7+O1UmZpJBfG
   LcGlYZWRpN076WsoKwopd/Ij1W6FKGP0HlblVu676EeKbQUAy8bHcFJ8g
   EGe7QWblxuj4o9oYBVKX1OWXTXk33bzVPIoZfLxHD5Bz7XbDuWnJW54zP
   g==;
X-CSE-ConnectionGUID: PE8QBeKQT0q3/Vp+zPb40A==
X-CSE-MsgGUID: z1MupTHHRQKILDyy0KHntQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34358564"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34358564"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 07:21:58 -0800
X-CSE-ConnectionGUID: 5xVFWMiVT2iHu4l11aBr3w==
X-CSE-MsgGUID: FBh8hg6+TRKhsYDLOrwA9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100948961"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Dec 2024 07:21:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMTxp-000D09-0y;
	Sat, 14 Dec 2024 15:21:53 +0000
Date: Sat, 14 Dec 2024 23:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 f578281000c50cae991c40e1f68b2fc0b1b9e60e
Message-ID: <202412142302.4BOR5CWl-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_072158_337741_B0FF7781 
X-CRM114-Status: UNSURE (   4.59  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: f578281000c50cae991c40e1f68b2fc0b1b9e60e  Merge tag 'ffa-fix-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes

elapsed time: 1457m

configs tested: 71
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
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-001-20241214    gcc-12
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-002-20241214    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-003-20241214    clang-19
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-004-20241214    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-005-20241214    gcc-11
i386       buildonly-randconfig-006-20241213    gcc-12
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


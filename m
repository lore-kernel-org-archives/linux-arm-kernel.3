Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DE5E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WaaFnCwzwD4u8iaJEQfNHWVehqDaw9zlU9Czyf1joy8=; b=0uXTPB3qi3sjDOSlbuQdiYMlX3
	ZxsI1saVmnHfxOcIxhtZiE+745kDUJ1jM0PSJT8V7FIfrwBTvvneiDmktMuNPgRC2GiUUB4CFPyvT
	m2MNHKp525I3Lho839mQSNxKXv1DCRJreYaFAcVsiwHG408wa+/CyEfgoavtiRfMkAa0Zgpac6J11
	+N5pUjSjm/t5/rF3JxVJIAc9/j8y3dnYUl3XypAnKQnSAO4ADLXEyGwj2TFMulBVeohjFYupPYAZz
	+9YLzilo/F9AGgvES7yFGqnBJ+aY6z4e5aNf47NplakED+xU58OsORm9Bv8syja1DJrg0LQmrDnWX
	SKanNaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMWCj-00000006je3-1g73;
	Sat, 14 Dec 2024 17:45:25 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMWBK-00000006jWk-3gtc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734198239; x=1765734239;
  h=date:from:to:cc:subject:message-id;
  bh=EZk6apayQx2e94mJhZUxIar9cwuWA2KDqGRcSCACNhk=;
  b=Rz6Pu9v/wUB2whq7Uu5jCMvHe/WuS+FXMjfiAg3Ygjp63nZRzn3SS1Ea
   1Vpp5FIqPa8uLOF1svQ1fAOIjjqYL5t2mQTydlEGSFM8PIOr+k/fmEKnd
   Q6qn5fEcbaCkw3cU0SwjVyT7NuF56YfP9S9A8wy+s/OMASqV6u7bzHtvX
   7EiAheL7gBnwsYE3woXGAnrbbuP0lHPmKEBGAMyXOqzHjskzPorRc4J4M
   DQcSrGzNs81+hT7hQaF73YJ0MvciBDNhLPGn/AAVNXGCOZ0nT3ZBz0XtA
   OByO7jC34okMn/tKrJq9OgBh27DFoY5YN+6Ey4OVeSlaLpmkgr3EnVkQ6
   g==;
X-CSE-ConnectionGUID: mqoOE/5vRgqoId7773OkEg==
X-CSE-MsgGUID: N3bt0TliQ9+6FBBFqZfkmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45237867"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="45237867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 09:43:58 -0800
X-CSE-ConnectionGUID: WuJ87AlvRfuQsxBQ+KLEZQ==
X-CSE-MsgGUID: rRTblxGmTDG6po2STYzpWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="96685696"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Dec 2024 09:43:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMWBH-000D7L-0B;
	Sat, 14 Dec 2024 17:43:55 +0000
Date: Sun, 15 Dec 2024 01:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 6c2bb9f225bc1cbe7275c0dbb21254f41dd0d1e0
Message-ID: <202412150119.arfwweBH-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_094358_932757_E9F3513F 
X-CRM114-Status: UNSURE (   4.38  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: 6c2bb9f225bc1cbe7275c0dbb21254f41dd0d1e0  Merge branch 'soc/defconfig' into for-next

elapsed time: 1450m

configs tested: 56
configs skipped: 2

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
parisc               randconfig-001-20241214    gcc-14.2.0
parisc               randconfig-002-20241214    gcc-14.2.0
powerpc              randconfig-001-20241214    clang-20
powerpc              randconfig-002-20241214    clang-15
powerpc              randconfig-003-20241214    clang-20
powerpc64            randconfig-001-20241214    gcc-14.2.0
powerpc64            randconfig-003-20241214    clang-20
riscv                randconfig-001-20241214    clang-20
riscv                randconfig-002-20241214    clang-20
s390                            allmodconfig    clang-19
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
um                   randconfig-001-20241214    clang-20
um                   randconfig-002-20241214    clang-17
x86_64     buildonly-randconfig-001-20241214    gcc-11
x86_64     buildonly-randconfig-002-20241214    clang-19
x86_64     buildonly-randconfig-003-20241214    gcc-12
x86_64     buildonly-randconfig-004-20241214    gcc-12
x86_64     buildonly-randconfig-005-20241214    gcc-12
x86_64     buildonly-randconfig-006-20241214    clang-19
xtensa               randconfig-001-20241214    gcc-14.2.0
xtensa               randconfig-002-20241214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


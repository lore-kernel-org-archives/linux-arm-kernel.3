Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005B2E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 23:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CzEaJ8duZzUOXTNn7AuOYSjikqzCgYM5xU5Mdn0KLl0=; b=Ku/TmsjkLYZvfq8thamv5WLjvQ
	EKU/5azQWp1O1nDILyYtSyDpJzsBdPaXcxpiqtK/zgUywoWBRZqEsqrFAgP1or1VoGISgtvkSNkP5
	l95KZaIGYXRsIeLNX/qeFC72tXe3aiq9l/zolj1QbQmbEGQ3oTT6wAmSXmBMeBDhve/6IdXBXnRpK
	rzG3gm5OulPUKIvCgfc3E4I8+J6W4FLWYXASJKi1qWAE+CHPGqJJQ+AXxqGl5YuLXfNzjs5QkJgDk
	krcyvs4XEVdd3TL6HBeIRFBRt7IvQWlMWNc2/XjeHn+Yx/hauiwnszdeXddsfwyT+QgS70VK3OCLY
	5IAZInLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWkoA-00000001eRq-2nQN;
	Sat, 11 Jan 2025 23:22:22 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWkmw-00000001eLY-3uLR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 23:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736637667; x=1768173667;
  h=date:from:to:cc:subject:message-id;
  bh=sldMcXhjKFaabNKZS34K5jwvxTaoE/fnc9h1bHeEX9s=;
  b=elzl83hWbrXtaNwG2FgidI51iTO9RcwBHmy/QnWzK6MibvKE1L/N2erv
   HAI4fAqR6RLPZUnBnfs2YdK3kX9OoSgI1RXKc4r3aK8xyDuyjPkYfuVD6
   FTt9+d0J3sacy99kcrLxz9S4BeZGiOuk72w3mCy51Mc+DbadnMIjPCRF6
   pEaiTu2gjzGYX6gVNJP/aMuG41KG167xgcncsuWh/IXaMjQKvi77w+a4K
   DUnwtp9hyW7Bu6TpFjTf3Sk4tpohYlBb/PXvTR1Xivbc+wk+A8E1jrGhn
   /jCKMle9GdbouiVE1sneJAQ9xYXKadOeK2FMo1+92PnE3kdyZC2vKpq6t
   w==;
X-CSE-ConnectionGUID: lf81N5f1TOiB8NoaxJufwA==
X-CSE-MsgGUID: SE1bDCj+QhCGHooIiSXLWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36789999"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36789999"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 15:21:01 -0800
X-CSE-ConnectionGUID: eywvrkkEQB6spRb4UHBByg==
X-CSE-MsgGUID: omH8auDoQ4Kr2RCRw3punA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="108967534"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jan 2025 15:21:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWkmn-000LJp-17;
	Sat, 11 Jan 2025 23:20:57 +0000
Date: Sun, 12 Jan 2025 07:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 5391c5d8e60610bf914f767a6a749004e2d223f0
Message-ID: <202501120704.5d7avRa5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_152107_104833_5FDDC28C 
X-CRM114-Status: UNSURE (   5.73  )
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
branch HEAD: 5391c5d8e60610bf914f767a6a749004e2d223f0  Merge tag 'v6.13-rockchip-dtsfixes1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes

elapsed time: 1449m

configs tested: 54
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250111    gcc-13.2.0
arc                  randconfig-002-20250111    gcc-13.2.0
arm                  randconfig-001-20250111    clang-16
arm                  randconfig-002-20250111    gcc-14.2.0
arm                  randconfig-003-20250111    clang-20
arm                  randconfig-004-20250111    clang-20
arm64                randconfig-001-20250111    gcc-14.2.0
arm64                randconfig-002-20250111    clang-20
arm64                randconfig-003-20250111    clang-18
arm64                randconfig-004-20250111    clang-16
csky                 randconfig-001-20250111    gcc-14.2.0
csky                 randconfig-002-20250111    gcc-14.2.0
hexagon              randconfig-001-20250111    clang-20
hexagon              randconfig-002-20250111    clang-15
i386       buildonly-randconfig-001-20250111    gcc-12
i386       buildonly-randconfig-002-20250111    gcc-11
i386       buildonly-randconfig-003-20250111    gcc-12
i386       buildonly-randconfig-004-20250111    gcc-12
i386       buildonly-randconfig-005-20250111    gcc-12
i386       buildonly-randconfig-006-20250111    clang-19
loongarch            randconfig-001-20250111    gcc-14.2.0
loongarch            randconfig-002-20250111    gcc-14.2.0
nios2                randconfig-001-20250111    gcc-14.2.0
nios2                randconfig-002-20250111    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250111    gcc-14.2.0
parisc               randconfig-002-20250111    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250111    gcc-14.2.0
powerpc              randconfig-002-20250111    gcc-14.2.0
powerpc              randconfig-003-20250111    gcc-14.2.0
powerpc64            randconfig-001-20250111    gcc-14.2.0
powerpc64            randconfig-002-20250111    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250112    clang-20
riscv                randconfig-002-20250112    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250112    clang-16
s390                 randconfig-002-20250112    clang-18
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250112    gcc-14.2.0
sh                   randconfig-002-20250112    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
um                               allnoconfig    clang-18
x86_64     buildonly-randconfig-001-20250111    clang-19
x86_64     buildonly-randconfig-002-20250111    gcc-12
x86_64     buildonly-randconfig-003-20250111    gcc-12
x86_64     buildonly-randconfig-004-20250111    clang-19
x86_64     buildonly-randconfig-005-20250111    gcc-12
x86_64     buildonly-randconfig-006-20250111    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


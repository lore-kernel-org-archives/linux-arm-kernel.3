Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2A4C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 03:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nZVGePhw0Ste30OAHaLguFOkX1N7mHDi0+DUgEilgWI=; b=rXu2OoaMU94cZWFABO+05fT3wN
	Vz25X5lIXyZQhHihSfZmh1i+HDyLwl5SU4+RlVik2p3UNUm4SFOEm5Pz5Dl+8vFU9uTu6VG9IbrhR
	4FgjcJrkGI30+97MYESpSXnAUelERoolAKVDtTds5Acvyes7HnBuPPa626v4QF3vly5HXy7C3K12M
	YvIND2DPXGtgdX1EDVFtdsNCsPm7vVLnClGuVNpvuSUTG4lz7dADJwAq++onhw5xBnv3+Snh/VKml
	8t7Paz1cPS1GBgDdErMrOjUy0dEaaCHaXHvqJkPRkbxruKfac0hQEielkm+wKxE1Kr5NWxelJUmG2
	eq38+4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZLf-000000013Vw-2Ks3;
	Fri, 17 Jul 2026 03:34:51 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZLc-000000013VW-3hCt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 03:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784259289; x=1815795289;
  h=date:from:to:cc:subject:message-id;
  bh=dBadnRXblANRSzQWQ6UpcsqHp/xR95nKkoVVINXWMQ0=;
  b=n3W/pBwo42Zt5483fnFTzW8Gw8kIwDife+8TBQuOIy6wxiJ6DxeN1RZ6
   jxwOeVgO6jKIeU3xYvfL9UIIIImnMX1ipB+dnOTXsT7GMT8vvPGBK8zwc
   inX8UC/HZR2oWT4gn44b7sk7c2vJgcpvAlJ9xhVIGI/JIvgBsdiEohKtN
   zfb68qtDX3ihFcS85DSwV5iuQUmNJKXklWZWvbSagKY+6aX/DxO+ke+Y9
   mshTtFLGwIGYoGZI0KNf9ST36pIfDND2ECwjGE8JFWnCYCjqJumeibu+m
   1HgobeGIlCJkJFgRZIbqz4P4wTDSu5Iu0OfMHb/lRZxuROQgZPfzBu8xa
   Q==;
X-CSE-ConnectionGUID: k5razrWQTF25Q7lB7nSHyg==
X-CSE-MsgGUID: KgA+Ni4XS6Ghzq2xa1t/Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96441708"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="96441708"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 20:34:49 -0700
X-CSE-ConnectionGUID: yoRUaRmZQHSj9tm06Tf/OQ==
X-CSE-MsgGUID: HcaY/ebVQsGyBnmTFTGhZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="260255141"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Jul 2026 20:34:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkZLR-00000000SOt-1WTE;
	Fri, 17 Jul 2026 03:34:39 +0000
Date: Fri, 17 Jul 2026 11:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 add11ea55f2d26d798c058fe4d67fb2941e77523
Message-ID: <202607171137.J8Q5pw3j-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_203449_011026_1D35715B 
X-CRM114-Status: UNSURE (   4.98  )
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
branch HEAD: add11ea55f2d26d798c058fe4d67fb2941e77523  Merge tag 'scmi-ffa-fixes-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes

elapsed time: 1827m

configs tested: 57
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260717    gcc-11.5.0
arc                  randconfig-002-20260717    gcc-11.5.0
arm                  randconfig-001-20260717    gcc-11.5.0
arm                  randconfig-002-20260717    gcc-11.5.0
arm                  randconfig-003-20260717    gcc-11.5.0
arm                  randconfig-004-20260717    gcc-11.5.0
arm64                randconfig-001-20260717    gcc-13.4.0
arm64                randconfig-002-20260717    gcc-13.4.0
arm64                randconfig-003-20260717    gcc-13.4.0
arm64                randconfig-004-20260717    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260717    gcc-13.4.0
csky                 randconfig-002-20260717    gcc-13.4.0
i386                            allmodconfig    gcc-14
loongarch                          defconfig    clang-24
m68k                       mvme147_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260717    gcc-11.5.0
parisc               randconfig-002-20260717    gcc-11.5.0
powerpc              randconfig-001-20260717    gcc-11.5.0
powerpc              randconfig-002-20260717    gcc-11.5.0
powerpc64            randconfig-001-20260717    gcc-11.5.0
powerpc64            randconfig-002-20260717    gcc-11.5.0
sh                                 defconfig    gcc-16.1.0
sparc                randconfig-001-20260717    gcc-8.5.0
sparc                randconfig-002-20260717    gcc-8.5.0
sparc64              randconfig-001-20260717    gcc-8.5.0
sparc64              randconfig-002-20260717    gcc-8.5.0
um                   randconfig-001-20260717    gcc-8.5.0
um                   randconfig-002-20260717    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260717    gcc-14
x86_64     buildonly-randconfig-002-20260717    gcc-14
x86_64     buildonly-randconfig-003-20260717    gcc-14
x86_64     buildonly-randconfig-004-20260717    gcc-14
x86_64               randconfig-001-20260717    gcc-14
x86_64               randconfig-002-20260717    gcc-14
x86_64               randconfig-003-20260717    gcc-14
x86_64               randconfig-004-20260717    gcc-14
x86_64               randconfig-005-20260717    gcc-14
x86_64               randconfig-006-20260717    gcc-14
x86_64               randconfig-071-20260717    clang-22
x86_64               randconfig-072-20260717    clang-22
x86_64               randconfig-073-20260717    clang-22
x86_64               randconfig-074-20260717    clang-22
x86_64               randconfig-075-20260717    clang-22
x86_64               randconfig-076-20260717    clang-22
xtensa               randconfig-001-20260717    gcc-8.5.0
xtensa               randconfig-002-20260717    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


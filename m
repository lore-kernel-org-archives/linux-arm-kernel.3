Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543D2D68B16
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UUMmmc2rtpU3nLkTMTTbJzpaolkWX5d9pYon10z9cOc=; b=Wj/PvU8tixLgAMrWV9GgZYRpnI
	o7zpkQA9NF8O+6ZJ3rVfLVEfsvHeC7aDLHDgUC1AJ5gEBXSPZCcVNi1wDA39tHowziy+/MpRpozc9
	Io7zTq18C1zinTxVnLFzirkDRzqfAsHnZORmNSxkmh+e3Ug7Q7GDjYiu6Kcl2W/IOJ479RyJFmz9e
	TIZzLcdqs86/LgCS5d+ZpiLkzA7lZF+Ig4WpwZI5FU6sPRLI7EX9h2ASB9HYfmFXMJBDFeoe8UKDF
	sK9k4EwWS+o+6Y/kMy7PNQb3zOpM4kVJ8+IrnrlGBB4nl67nYYQWge3u1mmdcN22CYYf7HoOg/H5s
	fEelzG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZys-0000000A4Ez-3wPL;
	Thu, 14 Nov 2024 13:33:54 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZx0-0000000A3ze-1Zg7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731591118; x=1763127118;
  h=date:from:to:cc:subject:message-id;
  bh=gKtEPV96K32I6pv0MMRZcWKNN1fuoy22zzDi8SPmrCU=;
  b=ZuE1vKr5JQshr7/dq7I8gEKje6aS/a0A9imfBiWqiB9laMnuh6eH0vW7
   E5VsA9uqQVZsADhomI4GhbD4VajwqDFvEI3gGF0W1T5uijBUFE9Q9Ekkz
   pAjHjfMZBFi413mHx6ng7ORP8UwFk2gWsZfWUK+jjaHNtRylBAeYJ/zA/
   dMe3MTrYCndY9N6EXdRTXZkxJM0/3QYlNREDKX4aTwBP/G3545JBHg7Yr
   9RFGLsgk1tBLQx3VMpWKqe6iOqVOC2naz/nHKZKnCxD8hrx0gfHm2LLEq
   rVyxcus1WAENlUPgeP5W44G5PLeQiXBhBlqO3hbhwtCM4Sdk4jaNso1Fn
   w==;
X-CSE-ConnectionGUID: UcphvjyjQlyvEPK5Djz0hg==
X-CSE-MsgGUID: xqnPvhhcSjilvLU3JKVx7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="56925474"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="56925474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 05:31:57 -0800
X-CSE-ConnectionGUID: 1Rs2y8iOS46ZpG8upj6n4w==
X-CSE-MsgGUID: wsLX2fk6Q8WO5+68P2ENtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="93153309"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2024 05:31:55 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBZwv-000049-0D;
	Thu, 14 Nov 2024 13:31:53 +0000
Date: Thu, 14 Nov 2024 21:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 a1cc63408f72f038e7aa4b5c735270261daf9691
Message-ID: <202411142115.q3VZPG94-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_053158_464876_25A9240F 
X-CRM114-Status: UNSURE (   5.34  )
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
branch HEAD: a1cc63408f72f038e7aa4b5c735270261daf9691  Merge tag 'at91-soc-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/dt

elapsed time: 805m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241114    gcc-13.2.0
arc         randconfig-002-20241114    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20241114    gcc-14.2.0
arm         randconfig-002-20241114    gcc-14.2.0
arm         randconfig-003-20241114    gcc-14.2.0
arm         randconfig-004-20241114    clang-14
arm64                  allmodconfig    clang-20
arm64       randconfig-001-20241114    clang-20
arm64       randconfig-002-20241114    gcc-14.2.0
arm64       randconfig-003-20241114    gcc-14.2.0
arm64       randconfig-004-20241114    gcc-14.2.0
csky        randconfig-001-20241114    gcc-14.2.0
csky        randconfig-002-20241114    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241114    clang-20
hexagon     randconfig-002-20241114    clang-20
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-19
loongarch              allmodconfig    gcc-14.2.0
loongarch   randconfig-001-20241114    gcc-14.2.0
loongarch   randconfig-002-20241114    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
nios2       randconfig-001-20241114    gcc-14.2.0
nios2       randconfig-002-20241114    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc      randconfig-001-20241114    gcc-14.2.0
parisc      randconfig-002-20241114    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-001-20241114    gcc-14.2.0
powerpc     randconfig-002-20241114    clang-14
powerpc     randconfig-003-20241114    gcc-14.2.0
powerpc64   randconfig-001-20241114    gcc-14.2.0
powerpc64   randconfig-002-20241114    clang-20
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    clang-20
riscv       randconfig-001-20241114    gcc-14.2.0
riscv       randconfig-002-20241114    clang-14
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.2.0
s390        randconfig-001-20241114    gcc-14.2.0
s390        randconfig-002-20241114    clang-20
sh                     allmodconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh          randconfig-001-20241114    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
x86_64                  allnoconfig    clang-19
x86_64                 allyesconfig    clang-19
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-19
x86_64                     rhel-8.3    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


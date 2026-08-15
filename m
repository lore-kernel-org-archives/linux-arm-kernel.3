Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497FFC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 21:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AodoDyOYJjQHgQiALFFCZyJu6BeGzXaNVsxAR0fblWM=; b=aWyuDorYswJ0ZA/r9lfTp1wt/7
	EQ0pDDG5cstvcKsB0rq3bkAVJQkcgDRVR3Kj1nUEmqUhkIoFu9FflJg9ErXC2gGnDnuYsNvwLMu6P
	Dq8yQ7FMRKnn4u/Dh2rbxyv3j+Vz1mtM5pUlENfn9mAOoM9pBDYQ3eS6g42IQ7ofE8ZwMGmCKAhLr
	LpY4+tbdjhTS1toD0U932Gng/ph8CkG34WVKkXz6/1592lGksS78WzpmkJ9VPXAnaLnEJAqNehV9f
	Cpv9hj8mQZR6PL0n5ElK3K4jFG157QTRYdHMzEPGPdB24yRf+0pd72351INv/td8f4/J5lhxu4b2E
	zFBSq9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvLeG-00000004C38-3jP9;
	Sat, 15 Aug 2026 21:10:36 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvLeC-00000004C2Z-10Sc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 21:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786828232; x=1818364232;
  h=date:from:to:cc:subject:message-id;
  bh=q/NH2kcqOVjARhPUyFshnYbT24Ye3Z0dzOFrbQVMGSw=;
  b=UP6s8kvsi4qzl5LNFPT6B67ZirApTQWuJHhwjuioXA4gKeA1oCod7+q3
   aKj5B2+nW4WQx6VAqjCP+slMU+6/+UgSOqAzg9n7dwfDz+51CIEGWKdsr
   gxiggeJKpS9jK+bwsTix50k0X8B4/0ualGsZJThH8E5vvwLXnLsbnvl9z
   2yi8/eRv/mJyY+hf+cr8J0o6vMDFmZ7jmqvZZGKOGUcNCTLmxxqV8UnzW
   /hsvPu5mtUI6xw/1CqpE6Yhw484G4aA0x0r3cIQJkj0UjYFiYXFjR+C6V
   I5cAD22Fjmc5PMOmusNcoETr9CgPTIlkxBGeRiYpvXH2gepJbl7MDl94i
   A==;
X-CSE-ConnectionGUID: cZQ1nfuZRgS3TsTW5cRSSQ==
X-CSE-MsgGUID: rBE1kKG8SrKt4Uv68nO1sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="104898564"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="104898564"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 14:10:30 -0700
X-CSE-ConnectionGUID: UFbQObKFSgmW7KprTfdbEw==
X-CSE-MsgGUID: avTLc3UKQuCtp/S6vLmVKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="260756595"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Aug 2026 14:10:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvLe5-00000000cUe-1AHP;
	Sat, 15 Aug 2026 21:10:25 +0000
Date: Sun, 16 Aug 2026 05:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 24/217]
 arch/arm/mach-orion5x/common.c:18:10: fatal error: 'plat/time.h' file not
 found
Message-ID: <202608160508.L84PCmp5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_141034_512746_71E93F72 
X-CRM114-Status: UNSURE (   7.70  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 061991b5690f233fb8a0248fa1ccb1172443e5c5 [24/217] ARM: orion/dove/mv78xx0: remove all board files
config: arm-orion5x_defconfig (https://download.01.org/0day-ci/archive/20260816/202608160508.L84PCmp5-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160508.L84PCmp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160508.L84PCmp5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-orion5x/common.c:18:10: fatal error: 'plat/time.h' file not found
      18 | #include <plat/time.h>
         |          ^~~~~~~~~~~~~
   1 error generated.
--
>> arch/arm/mach-orion5x/board-dt.c:21:10: fatal error: 'plat/time.h' file not found
      21 | #include <plat/time.h>
         |          ^~~~~~~~~~~~~
   1 error generated.
--
>> arch/arm/plat-orion/pcie.c:16:10: fatal error: 'plat/addr-map.h' file not found
      16 | #include <plat/addr-map.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +18 arch/arm/mach-orion5x/common.c

6f088f1d215be5 Lennert Buytenhek 2008-08-09 @18  #include <plat/time.h>
28a2b45054f2e3 Andrew Lunn       2011-05-15  19  #include <plat/common.h>
c22c2c6008d69f Arnd Bergmann     2015-12-02  20  

:::::: The code at line 18 was first introduced by commit
:::::: 6f088f1d215be5250582b974f83f0e3aa6ad3a28 [ARM] Move include/asm-arm/plat-orion to arch/arm/plat-orion/include/plat

:::::: TO: Lennert Buytenhek <buytenh@wantstofly.org>
:::::: CC: Lennert Buytenhek <buytenh@marvell.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


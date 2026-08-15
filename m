Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74935C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 00:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPFidCDj/XvYJmKkmQ+rJEH3eF+KUfYkwK2Gg64n+GA=; b=BO2A+++FVfRiWJIoe0HHkzU318
	Wo7DbwuZUS1FQBBKy+0ib/vVWP8/noUtIadH3U18NHfHk6fJjcT7EP2NLeyppTS803xvOwEeApvs1
	1Wmp0SZdH/ZGx3jGR3DVUCl3kP414jO9mLER+2PvP/TIMOlghmJNFqISqIxNcWmD5uUrY+lfEIQAd
	QU2iFjsGfmQs/gINZY4ZtcEY7IgWLh0Z1/Lb1NofX/A1dGAqI9qvoEYcA2XDPPx002Tndz3jRw+UX
	yPfLrqMqZp6pKNWZ9eo8BQ3IK4dL0PUCHAP1/SlAEsENsZ9rCjNmgN/6cyVz6ftTvoq47b6M4KHJ9
	Fd/J0Cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvOIX-00000004K0a-00Wz;
	Sun, 16 Aug 2026 00:00:21 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvOIT-00000004K0I-48IO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 00:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786838418; x=1818374418;
  h=date:from:to:cc:subject:message-id;
  bh=Txv7INtlIyaza7go7CmOUqj+oZVCIZJmqguMV9ygOHQ=;
  b=mufXLTPPktzldxLxA8eI5fl/7iZzBhmQDNlD70bCyP1DVd/KlbXDQ1Ns
   eIiB5QrA7m3rjEpWFdZl0cnb4QBmrqNLA2fg6uEoESTQE57FCNHHTI0wV
   bW+k5kiGdKd7mDatwKKOR1aU2fz9fYCh7836k3X/qCnJ8TpUt045Lltb2
   0UvbGMhJUr5vzl+zkM52WzC9IPQpLOXQFSYz378irue1Ajg0y8EHmTDtx
   QryQzQpSmImAy6qy+0buy/iHhcABL8zmSRJJfgKpM6AZAjovCxMmv7Spc
   nQq+xZdu9589rGg3c5Vap+Sk5M6EVP4Unn1WhuQ1WfTlSujdx3J7+OhzO
   w==;
X-CSE-ConnectionGUID: OycIj8PqSNGi0Q5R0307gw==
X-CSE-MsgGUID: YvwYzaytSB6OG343/aSfpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87126206"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87126206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 17:00:16 -0700
X-CSE-ConnectionGUID: 3njNY5sRRvqeg0btURSsqg==
X-CSE-MsgGUID: 6EtZWuytQfq2k+X1N+Xc7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="269747519"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Aug 2026 17:00:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvOIO-00000000cXQ-1ROJ;
	Sun, 16 Aug 2026 00:00:12 +0000
Date: Sun, 16 Aug 2026 07:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove] BUILD REGRESSION
 057394422bc04420585b2790b230d8a1f350ace8
Message-ID: <202608160733.FTxHnHNz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_170018_090636_6FB20881 
X-CRM114-Status: UNSURE (   4.41  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
branch HEAD: 057394422bc04420585b2790b230d8a1f350ace8  remaining pdata removal

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202608160341.2pHIQyJL-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202608160430.mij1LduH-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202608160508.L84PCmp5-lkp@intel.com

    arch/arm/kernel/process.c:379:5: warning: no previous prototype for function 'arch_setup_additional_pages' [-Wmissing-prototypes]
    arch/arm/mach-orion5x/board-dt.c:21:10: fatal error: 'plat/time.h' file not found
    arch/arm/mach-orion5x/common.c:18:10: fatal error: 'plat/time.h' file not found
    arch/arm/plat-orion/pcie.c:16:10: fatal error: 'plat/addr-map.h' file not found
    drivers/regulator/da9055-regulator.c:287:1: warning: control reaches end of non-void function [-Wreturn-type]
    drivers/regulator/da9055-regulator.c:417:33: warning: parameter 'id' set but not used [-Wunused-but-set-parameter=]
    drivers/regulator/da9055-regulator.c:417:33: warning: parameter 'id' set but not used [-Wunused-but-set-parameter]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-regulator-da9055-regulator.c:warning:control-reaches-end-of-non-void-function
|   `-- drivers-regulator-da9055-regulator.c:warning:parameter-id-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-regulator-da9055-regulator.c:warning:control-reaches-end-of-non-void-function
|   `-- drivers-regulator-da9055-regulator.c:warning:parameter-id-set-but-not-used
|-- arm-orion5x_defconfig
|   |-- arch-arm-kernel-process.c:warning:no-previous-prototype-for-function-arch_setup_additional_pages
|   |-- arch-arm-mach-orion5x-board-dt.c:fatal-error:plat-time.h-file-not-found
|   |-- arch-arm-mach-orion5x-common.c:fatal-error:plat-time.h-file-not-found
|   `-- arch-arm-plat-orion-pcie.c:fatal-error:plat-addr-map.h-file-not-found
|-- i386-allmodconfig
|   |-- drivers-regulator-da9055-regulator.c:warning:control-reaches-end-of-non-void-function
|   `-- drivers-regulator-da9055-regulator.c:warning:parameter-id-set-but-not-used
`-- parisc-allyesconfig
    |-- drivers-regulator-da9055-regulator.c:warning:control-reaches-end-of-non-void-function
    `-- drivers-regulator-da9055-regulator.c:warning:parameter-id-set-but-not-used

elapsed time: 770m

configs tested: 15
configs skipped: 1

tested configs:
alpha            allnoconfig    gcc-16.1.0
alpha           allyesconfig    gcc-16.1.0
alpha              defconfig    gcc-16.1.0
arc             allmodconfig    gcc-16.1.0
arc             allyesconfig    gcc-16.1.0
arm        orion5x_defconfig    clang-21
csky            allmodconfig    gcc-16.1.0
i386            allmodconfig    gcc-14
loongarch          defconfig    clang-24
nios2           allmodconfig    gcc-11.5.0
nios2            allnoconfig    gcc-11.5.0
parisc          allmodconfig    gcc-16.1.0
parisc          allyesconfig    gcc-16.1.0
parisc             defconfig    gcc-16.1.0
sh                 defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4E7C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DhqvekgjbhVZ8nLk1C3R2taKKJ5thbkxwCuDbXpLTFE=; b=OsZH4QzT+2TKwk5WM+NOG/+fML
	Lyfmmx9s6+cv+K3oioMb7GBZdb0t8GI+JtDxi5dF5w9T++vC62YD+/SgPvAB/qbFWdX20QqOkyCvv
	OktGAb511OoCYdGjOkw3/B+3s1uJ9G3YpCdNz5znkoXJTK0re5L+yx1FMxsO/REoACJyNYuCKx6SG
	WmIpGL02yZL/CiMGUWgIlCoOfYBXp06OpeUahl9OZWrGYwItNUqdcE/4ERxb25B/FAmUtqCj9nTKl
	biuhjkpA/7L0MAdpbeXKR93x2nUHd9X92hKEUvl6Gvr4X8LUSKn6bWiu4P7TsB4e6AkJgcFVOYUIp
	fnxqEyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gw5-0000000EqcY-1j86;
	Thu, 10 Sep 2026 15:43:37 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gw2-0000000EqbE-0dRQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055014; x=1820591014;
  h=date:from:to:cc:subject:message-id;
  bh=E3hbqsU4ye4Ilq8a2BTuZkyUuhbQp+b7TCuQX94A82Y=;
  b=FUazicUJtROsrG6AqEPunt/qvZeAWGhMgndKGBupx5/f9BM86M1FKmAh
   Q6eesl0HIE0kg9A9lrwb4yU+phQHEdTiSwZsk0yogeb7DceTnpXEq/Qan
   4S2HdKxB0n2ZRYmLcP/RuroyriGoaTTJldVWwJtVtqLUGC1W8/ftICBK9
   50heUA/8mDD4XJoDmja8Zc3LWGlOs3iIUQevXRQlfH8QVCPJ2hL0x7faG
   KcKBXMtWRtFrd3kcDZffWfIX3KD32qcaiNEvR9g3xlR5NUxlawwtEM5WT
   b66ZfuWl5XYkuYiYNbMdda4ejHtZFiPw0YuXOXMl0iJQeaR0EIBYJ5Yep
   A==;
X-CSE-ConnectionGUID: l9pY/tn6QuOTw18PbZnjfw==
X-CSE-MsgGUID: RSjUOiXKQd6N51MJrx+J2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112280559"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="112280559"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:33 -0700
X-CSE-ConnectionGUID: p+dvJ2HmSjm01BrGto5Z2w==
X-CSE-MsgGUID: b0xz9glmR3CybWNXw8GMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295152008"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 08:43:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvy-000000000RP-04sl;
	Thu, 10 Sep 2026 15:43:30 +0000
Date: Thu, 10 Sep 2026 17:42:33 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 216/294]
 drivers/media/i2c/ds90ub913.c:23:10: fatal error: 'media/i2c/ds90ub9xx.h'
 file not found
Message-ID: <202609100829.dZoZmxp2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_084334_236670_15DFC1A9 
X-CRM114-Status: UNSURE (   8.38  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: c473be37547a95e20e5f6cc7c01968ab474a58a4 [216/294] media: i2c: ds90ub9xx: remove global platform_data definition
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100829.dZoZmxp2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100829.dZoZmxp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100829.dZoZmxp2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ds90ub913.c:23:10: fatal error: 'media/i2c/ds90ub9xx.h' file not found
      23 | #include <media/i2c/ds90ub9xx.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +23 drivers/media/i2c/ds90ub913.c

c158d0d4ff1530 Tomi Valkeinen 2023-06-19  22  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19 @23  #include <media/i2c/ds90ub9xx.h>
be1e71b1db5779 Tomi Valkeinen 2023-07-31  24  #include <media/v4l2-fwnode.h>
be1e71b1db5779 Tomi Valkeinen 2023-07-31  25  #include <media/v4l2-mediabus.h>
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  26  #include <media/v4l2-subdev.h>
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  27  

:::::: The code at line 23 was first introduced by commit
:::::: c158d0d4ff15309fd63b7d7cf50a5153bead894a media: i2c: add DS90UB913 driver

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


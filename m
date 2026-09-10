Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF77C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iEjX/vq7tw79nNzJ/crHxzY6rJC9CBMUCQTctzF/Y8Y=; b=r+0YVUO5KLDjfGhKMD4NflhBKl
	oEzDL78hGjlR/ipP/P5NrPvEVm2s9CWEvbjpkp2+d8v0kiG+MzUZyqdDbDVLbX+ZHelXCiPG57sLc
	1X58ENam9g6uyCu8vYtMzeieZRXnfvyi4l8z+PLrvLtCR1Tq6zwlF6Rmv8AGZaJxKjfuEQyRrKR74
	dED+Ofod4OYeHqWf3AJQ8u+SDA0FujiGhkOllrv0g19VZF8y3Ud7UX6ipoYJhkMVh1TT44ZeVJX7H
	baLtW6a8i8pt6KnGmHD5k8tM/TO4iU3z2ll19ry9wD18r/jqtJN/rlCBI0byVJlexBU44Wvjm4bCs
	pc+OMFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ciU-0000000EB9P-0ew1;
	Thu, 10 Sep 2026 11:13:18 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ciQ-0000000EB92-48aH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789038795; x=1820574795;
  h=date:from:to:cc:subject:message-id;
  bh=yZs71CMQhqevRuZTXnX0jGlCGZ/xa65nIuxKinzqNTI=;
  b=BhdBO9akGLDBXj02taCdIC1aTqlQyZ5k54zw/3RnYticRHlIGFgSMtSS
   N03RXT7lVPu7MJJZek8hloMVJg05dBXeuaLJQOWTgRdmXuxzuwB0EgclK
   QNHPV7NNrdD5omZW/mOSiXVwMfTpTXtbDxbZQOPLYMuTUTaClTt4GqhGO
   /NrsOPnv0i3g7VRC8Ye6KIMfTq8FIVYyxcmym87vV60DmnUTfUWgf1d7r
   O3dWOYo2xU7ASfdIxVPiTpnqu1bDuUDffxygPBN1LoVoRaxlYLzNbKFsd
   EUhLZWOXcwimLbbZvyGN5D2CUWJ5OLk4jm9F6VFnIR0V5ucX91mw3cqX7
   w==;
X-CSE-ConnectionGUID: QNfDES13TKiBQrrHEP3+ew==
X-CSE-MsgGUID: Sq4cyU6eRESBiM40mm/yWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89249385"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89249385"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:13:15 -0700
X-CSE-ConnectionGUID: gTz64nbSTp2zHmmpQCpdCA==
X-CSE-MsgGUID: /taoEb0FR/2K6KGVvHhU9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269035092"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 04:13:13 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ciM-000000001jo-1D3w;
	Thu, 10 Sep 2026 11:13:10 +0000
Date: Thu, 10 Sep 2026 19:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 216/294]
 drivers/media/i2c/ds90ub913.c:23:10: fatal error: media/i2c/ds90ub9xx.h: No
 such file or directory
Message-ID: <202609101958.K8XqOq04-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_041315_270412_12848820 
X-CRM114-Status: UNSURE (   9.00  )
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
config: powerpc-randconfig-r122-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101958.K8XqOq04-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101958.K8XqOq04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101958.K8XqOq04-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ds90ub913.c:23:10: fatal error: media/i2c/ds90ub9xx.h: No such file or directory
      23 | #include <media/i2c/ds90ub9xx.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


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


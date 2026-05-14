Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35155CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u74D6rvd+rsftPbO8gaDYilFpO6S33XrDEp3qyPRL2c=; b=o0uiuXP4DWCn1YKRNTDwUVxOV+
	gxaX+qvCdAVaANItE9IZwrhavDoFKsDMQmkYzDcvJ98xDJMHwPWcpaKBY/7zLs9KJf6isofXFIG3Z
	RE36f84GIA3y2iaXLFmSC2m4yANgFc9YNWfBkflttVLPr+O58vRa9gWMmL+B+2e+0sv1Nbz4fj+tH
	rRbRhkU1pux5hc3hz/ZBIEWZPb+iCPDood5DZTrGNNhXo2G1AbdJ4jMt9sIRShE7UI0cbjny0SMgG
	aueroIZvzffhhtFs2ZLfn1pvPWVy2Fz7VYFy5kAEyIaM1dUlPuOz+lTYJA54VjVioZGV4uFwIxz9J
	oog61qHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaSg-00000006H5I-3bD4;
	Thu, 14 May 2026 18:07:06 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaSd-00000006H4o-3ULS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778782024; x=1810318024;
  h=date:from:to:cc:subject:message-id;
  bh=EmaFkslMR/YNXIie1TgA5eYCd7YlbeRWaFyGJcn8bsc=;
  b=nHk35STzRrqRzZMkzQBaFvFJ2DqZ5WclYg7HrYPWQYEsXvjj5leOYVBO
   8xbdgl50CNR8Vp1Z7JXZK2EffqCYaFqmBanz3stAA0JuBaA4oUnDCDzaO
   cBopSa4R/whupMnqdQuslICEAlWFc9Q9nQQeLczqnAz3vmPSa1SCJi+mD
   s94EORR+rQNAMFJ2Ab3DWn/BxD/gcFd9nub9iNAQnTiAYSic2ZBrF30uv
   9G0P4treH1/L8fYIBt/eFxommHCGFbMcFj+kyZj9xYJDhPfuYtqJ879bL
   nS9M4DFY63/SZx6Xkd0lVyPtnwVuPC3iHPEu6HU3OJxM2ecbi1OcciGJd
   w==;
X-CSE-ConnectionGUID: d3i2hBl5Szevf+hTSODTJA==
X-CSE-MsgGUID: 1eww5LreQQO6sMAO2mWohw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105191655"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="105191655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 11:07:02 -0700
X-CSE-ConnectionGUID: fcQ58vcwS3WDbZ/FiuXQww==
X-CSE-MsgGUID: t3hY3rlMQ+KiE617R7jJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242456830"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 11:07:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNaSY-000000008qr-1EeC;
	Thu, 14 May 2026 18:06:58 +0000
Date: Thu, 14 May 2026 20:06:26 +0200
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:timers/el2-vtimer 1/17] Warning:
 drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in
 'acpi_gtdt_descriptor'
Message-ID: <202605141925.PkUUh1mk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_110703_920119_BD4A5DCD 
X-CRM114-Status: UNSURE (   8.58  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git timers/el2-vtimer
head:   e793e78f4ead18e3dfe5a3a1be912a7ec5bc55d8
commit: c58180850debdd9b2306a86238860769137f40cd [1/17] ACPI: GTDT: Account for GTDTv3 size when walking the platform timer descriptors
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260514/202605141925.PkUUh1mk-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141925.PkUUh1mk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141925.PkUUh1mk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in 'acpi_gtdt_descriptor'
>> Warning: drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in 'acpi_gtdt_descriptor'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


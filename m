Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0E8C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 06:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vUfnPMjh3ORlMC99kXhouUlL3mdR5KwSI8789NU/fZU=; b=g4eOCYpWyMwKDIK7xINccA5q9K
	orAWpABllu/zCYYnVJay+xTsA6qQ5p3PhsAYvd1TMcuXWm+uJ9Wd0w/8bAWVQSnzVCboK5e89gLOb
	qyR17mcndQFL4pdOdP99UOPCZ88K+RnhYmpu/Vbkg7zj/exLoQCC6bwxampri81oeRjDSIxQqx9rR
	fiKU41ETFsR+zr5MieH2XcnDJpGByV1mxGMhW0CyRxaKrROkNlP/TXNLvuNxqowgFz+h7sKv++ao2
	Y+5euiHETUNK9A37xrLIWVPvaT1eYnRB3C1+9EVcEmbwz3Xa8bMLQWQ3YY6TW7iCpZIpqtEl+98kP
	ANZYOhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuAw-0000000HNTs-2Zrp;
	Thu, 07 Aug 2025 06:32:30 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uju8Q-0000000HNJy-1pI2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 06:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754548195; x=1786084195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y34S+d8WZvm8Zu/5uu6eGoIVsdJ8ZWOUIyg7hIYg0Oc=;
  b=mgrb8SpzG5ckjXFjY/BnjiEr5I/HFMTqMBKjdQP3Q+WcZyyctoJ/O9Gr
   RlBPpyHJneOlQ/d9ptYIly5KkTrzyfmrTm4wgjxxmZCTwWFYIoCHiPN/S
   bGWn/7NPmL75VQgbd/u+hnbSyw6XqNci6hemiGcLOoLIFJsT0Vj++ctnM
   Uqd8PoJHG0Jz3Id5babf7KpPGyAx2jNc31wihT2PQIfrPwLsBxo6BR9PF
   Y0GzifTN78ZYAb3FlKbL8G9EkCFyywx6JKaBidXrHP8uSr6NEQJBxbaNC
   WrNsAEeJo2u80wEgAlwpld6DbuToDQg1HID0xnr1LunHJiSqfzGX69Z5h
   w==;
X-CSE-ConnectionGUID: e2ZISS+1SSCO4Z3c5jgjXQ==
X-CSE-MsgGUID: TzjBL8zORHGtiLa0MAXW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82319863"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="82319863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:29:51 -0700
X-CSE-ConnectionGUID: ae0tlmdAS4mx/bpdpuY/HA==
X-CSE-MsgGUID: 6FS3vc4qThSbwOi4C3rrYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165391496"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2025 23:29:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uju8J-0002Sg-0a;
	Thu, 07 Aug 2025 06:29:47 +0000
Date: Thu, 7 Aug 2025 14:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/arch_timer_mmio 4/5]
 drivers/clocksource/arm_arch_timer.c:1083:34: warning: 'arch_timer_of_match'
 defined but not used
Message-ID: <202508071417.nnMhOekL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_232954_485407_A317BD96 
X-CRM114-Status: GOOD (  10.58  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/arch_timer_mmio
head:   4b341bbc18d791b6c5a6bc373d303c4d3b35434a
commit: d094e2d0772b8f22c47c9d3e7ab908c82ade83bf [4/5] clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone driver
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250807/202508071417.nnMhOekL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071417.nnMhOekL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071417.nnMhOekL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/arm_arch_timer.c:1083:34: warning: 'arch_timer_of_match' defined but not used [-Wunused-const-variable=]
    1083 | static const struct of_device_id arch_timer_of_match[] __initconst = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/arch_timer_of_match +1083 drivers/clocksource/arm_arch_timer.c

8a4da6e36c582f Mark Rutland 2012-11-12  1082  
220069945b298d Stephen Boyd 2013-07-18 @1083  static const struct of_device_id arch_timer_of_match[] __initconst = {
220069945b298d Stephen Boyd 2013-07-18  1084  	{ .compatible   = "arm,armv7-timer",    },
220069945b298d Stephen Boyd 2013-07-18  1085  	{ .compatible   = "arm,armv8-timer",    },
220069945b298d Stephen Boyd 2013-07-18  1086  	{},
220069945b298d Stephen Boyd 2013-07-18  1087  };
220069945b298d Stephen Boyd 2013-07-18  1088  

:::::: The code at line 1083 was first introduced by commit
:::::: 220069945b298d3998c6598b081c466dca259929 clocksource: arch_timer: Add support for memory mapped timers

:::::: TO: Stephen Boyd <sboyd@codeaurora.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E585EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/eZUBkk1T00iC+9KmZeAgMUJ03Mz0SzGEaMCdRgDvZM=; b=HV9fBPJCizXSHRtYpmIY5Ury7h
	NwiaWshYjo2sWGlJV7G4ylZnB8GFP3C3doXGsRnhmWhRYPPJ79hYqjzG8hUo1IXYSMoAXEq0FpH6F
	olJACRPa7gQpneCCYs2Vendz4D2XnAYg22d1daNK1EeqXFd3zlIJb9Z0/kURqV04kgMZuq5/J6Xwm
	peXmfVQzcQ58Jj7HB8imi6Lytlz6/YbhBVDp97qNY4uJfvhLKC3F4zA6tyQrond1w9wjgXXl28OOE
	iwtnpaZ/wi3W8paeMBDyrgTNrtiPANUqL4ijrixAF/MElfEpvk7mfF5mQpQmyHvs3Sz0OHR+kNsJi
	s/SFDWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnqv-0000000Gao7-3EHh;
	Mon, 03 Aug 2026 08:16:53 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnqt-0000000Gano-03vV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 08:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785745011; x=1817281011;
  h=date:from:to:cc:subject:message-id;
  bh=CdrM/fN6t9hFnIsPNs/T8LrSyXZChHteYj4d5HOG+68=;
  b=eAtJkKyZ4gDyR5Jjmnii8AhM34V71ZHPX/C7MvcGLylFYUbT4ipfhWFL
   ytBWGW3p0UNOqbGqq/OpducPXWQNOY9KhrWwEaKoKYKJIkF4gUYGalODi
   F3q1yS32bZ2fHv7O77ZMESX8qaORxaJmfHUGPV65RFxPzXyLbb/EgqA5U
   d+AG0kF0TnjAvTXg7ezLrnIBLxmrNT5GB2CP6W8ybqgivGvBt8IlSS/pT
   FCEfRlBa85kkDakKbZ65upo977vcBtdhvU93USSpW7EdTnAquKwxQIpsJ
   JA0KVz0eBV/nazHoYZXCh/RGZu7rkApzrDGEDDTHKi1xXpONyjXNDJgag
   w==;
X-CSE-ConnectionGUID: KNBS27brT92mV1LZRzF/4Q==
X-CSE-MsgGUID: Xt6l/NHKTz2uwieblCpQag==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86045785"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86045785"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 01:16:50 -0700
X-CSE-ConnectionGUID: rYsE6+8ISfWCluA6jTn0AA==
X-CSE-MsgGUID: fidOHhkHSYiGgMJ7TuwE8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="264987247"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2026 01:16:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqnqo-000000006VB-0ynG;
	Mon, 03 Aug 2026 08:16:46 +0000
Date: Mon, 03 Aug 2026 16:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:timers/arm64-arch-timer-errata-sk 1/8]
 include/clocksource/arm_arch_timer.h:113:13: warning:
 'read_sched_clock_is_arch_counter' defined but not used
Message-ID: <202608031502.QbZfDhXn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_011651_148572_58E3C178 
X-CRM114-Status: UNSURE (   8.91  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git timers/arm64-arch-timer-errata-sk
head:   93953a96f1d16c9f07597b46642d3e61581a6c85
commit: 0e8b09c97ac7de82054327e5d29eae6dedc6002e [1/8] clocksource/drivers/arm_arch_timer: Add read_sched_clock_is_arch_counter() predicate
config: xtensa-randconfig-002-20260803 (https://download.01.org/0day-ci/archive/20260803/202608031502.QbZfDhXn-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031502.QbZfDhXn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031502.QbZfDhXn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/qcom/rpmh-rsc.c:30:
>> include/clocksource/arm_arch_timer.h:113:13: warning: 'read_sched_clock_is_arch_counter' defined but not used [-Wunused-function]
    static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/read_sched_clock_is_arch_counter +113 include/clocksource/arm_arch_timer.h

   112	
 > 113	static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
   114	{
   115		return false;
   116	}
   117	#endif
   118	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


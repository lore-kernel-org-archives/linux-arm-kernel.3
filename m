Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F027D70DE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSa+Y8rjlAlP76se4ofvWK9v7XQmEW2ShTo/4F0dNTU=; b=VgiR20UY/0a8EyWBisqhyzbUj1
	qhKXPXxik4wtT8dsgLekc7Gb5kXJpkZSg22hNKsfjcb7CHFyhKOf3/iYB4ie3Dv6O7gIH5z3mXcNG
	UGBQSZjUi3w8B5+0K6F3ZkIa7mo4JGB60YvgmjK+qhQZD0kOvlPTMhQD5iONsFs5Zh/lVMqRQ5ykP
	8MPd2T3wragGF7xKetEZm5m535HqEVR+hnvAPq3g2uU8WDx6P+ueuM9VrgMcKgzJjRYv8Y17dIfFv
	3LF7uxHl7i4XChr5TsgLLdSYdhcyM7P6DEIA01WlMMCS8Ef9HphUm1VnWM+LJIG2CMUIrNfoTVYKh
	6tJXZW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiXT-0000000G6Ae-1Wzw;
	Thu, 28 Nov 2024 17:42:51 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiWU-0000000G66Q-3njB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 17:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732815711; x=1764351711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qj9VfeOHaFCPwamFvMv/eh2TZVc/qqibMMoP4/QMa1M=;
  b=WhSKt9lTAbppiKT973RxhqET3QLNT0rqMpVn36yrNlkY7LuSDANffw5/
   x3YEni8Qgi31TouQzs4fCDXmWTjTkoT/Iu2XBa87KS+hcetX396ub0fYx
   ygnbsL07t8WR3j08SLQn0+Aay/qbYXziOJdo5BuWq9CSjauFgi745waWT
   NeS2Apa+WjiFCjMcbarRCfFDqtoT2V9a7L7N/LYs4cfQWQENY2u4AbcLR
   /AlQQo/itHA318s7LoDdG8Ar85KZd2U3gdApIAHZGR+fi6sFF1LXr/i6J
   ACnV1xmoX28LLXUpOLUddISnuqkwsnF3m6kkSywbE7MWd4xHQ/oTxjwsW
   Q==;
X-CSE-ConnectionGUID: ttU2gsVLS8u+N5KXtCdVeA==
X-CSE-MsgGUID: WSkmxiCoSm+8HaJ1lNByQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36842480"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="36842480"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:41:50 -0800
X-CSE-ConnectionGUID: 4NXsIYw5TZKqzQIvC6KCuw==
X-CSE-MsgGUID: UqyG4ZomTxuizoNLcr20Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="115571789"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2024 09:41:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGiWQ-0009sZ-2f;
	Thu, 28 Nov 2024 17:41:46 +0000
Date: Fri, 29 Nov 2024 01:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-gic 12/12]
 arch/arm64/kvm/vgic/vgic-v3-nested.c:116:1: warning: no return statement in
 function returning non-void
Message-ID: <202411290111.GeyA5VWD-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_094150_991296_C596DACE 
X-CRM114-Status: UNSURE (   9.60  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-gic
head:   cd3fedf7137034ee2858afe5fabf24784d0b3919
commit: cd3fedf7137034ee2858afe5fabf24784d0b3919 [12/12] WIP
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241129/202411290111.GeyA5VWD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290111.GeyA5VWD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290111.GeyA5VWD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-v3-nested.c: In function 'vgic_v3_get_mi_level':
>> arch/arm64/kvm/vgic/vgic-v3-nested.c:116:1: warning: no return statement in function returning non-void [-Wreturn-type]
     116 | }
         | ^
   arch/arm64/kvm/vgic/vgic-v3-nested.c: At top level:
>> arch/arm64/kvm/vgic/vgic-v3-nested.c:114:13: warning: 'vgic_v3_get_mi_level' defined but not used [-Wunused-function]
     114 | static bool vgic_v3_get_mi_level(int intid)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +116 arch/arm64/kvm/vgic/vgic-v3-nested.c

   113	
 > 114	static bool vgic_v3_get_mi_level(int intid)
   115	{
 > 116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


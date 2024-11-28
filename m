Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74D8D70DE5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OfcOocjz9POjdYVjG1kLCTto2PiekHJZD+yo1plCg9M=; b=4nzDSpUiCxAUECfOEpuQMzChHO
	FBZxAqhusBULlaMxH3nr4lF5fzLMNGhJtf8KE/3c2gYgUmhoWZnVyxvrjBc4IP6x/3Xlc95XqEwhy
	RBdiwiv4A0YlfPihiPoihJaJp+gYDlaqNRy+pbWiLklEtLMx2ERShycnpNZVXvfqVgsQ4+9VvIZUG
	4S+yCXGggN8K/MusVU+LTDzjeBoUjXrOBmeQ96sdugbqmUKtQLbWqJXPJD25XkEbs6ZclGIVjDVZ2
	nM7cibJ9S0YVf4VGURx7SarT0bO8D9ULHOk9KbZduXypAI9sNA0vly0ZDsSfaM3ioengKJ1AkMpFd
	kVxl1Qpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhF9-0000000FzLW-22su;
	Thu, 28 Nov 2024 16:19:51 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhE9-0000000Fz8S-3lxb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 16:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732810730; x=1764346730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RrDnV3vV6J5CgcJY7vFvaCv/CB426hHEGuCAiVmSFLw=;
  b=bbspO48VIu0c/6WlprTnEtaxvpL9D3q0TzMb+pVNG1NKsq4Tz4KpRlQh
   B1CC22WxNRja0PUwpjEi3Kvl78BQFyXqf2SON/M6epK65YURrygonp0Dj
   Ms98twcffb5avW9KfOgOpGwbZflf0Jcp9WMM7OzSobfeX9eNwiqu9Wprd
   lF4YoY8zDfIzX0DKLoW1q/EeovmMfG7ihv832YztElN4DReRemnOVO6/I
   f9zHEia2QIf73BGtssklKD2Cxj6v4xJSz9pBz+R1MXIip2h9PIYOzyDtF
   Fi50hoL1AWOmHGspPkHdJ05hXzzjTEubdZaxQImPxfUzeRsQn0oKFBUJy
   g==;
X-CSE-ConnectionGUID: R0MqIhcbQKWyHdbvCFBLew==
X-CSE-MsgGUID: dih2Y0p5QAi0SEQHVUtTFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36716351"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="36716351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 08:18:46 -0800
X-CSE-ConnectionGUID: 4MacMwUhS5ie5WxGMuunAw==
X-CSE-MsgGUID: O1CVKdb5Qju91U4BNq1nzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="93118724"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 08:18:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGhE2-0009n5-2J;
	Thu, 28 Nov 2024 16:18:42 +0000
Date: Fri, 29 Nov 2024 00:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-gic 12/12]
 arch/arm64/kvm/vgic/vgic-v3-nested.c:116:1: warning: non-void function does
 not return a value
Message-ID: <202411290026.Q8iUaHa3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_081850_017378_7F5E11C0 
X-CRM114-Status: GOOD (  10.61  )
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241129/202411290026.Q8iUaHa3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290026.Q8iUaHa3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290026.Q8iUaHa3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/vgic/vgic-v3-nested.c:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/vgic/vgic-v3-nested.c:116:1: warning: non-void function does not return a value [-Wreturn-type]
     116 | }
         | ^
   arch/arm64/kvm/vgic/vgic-v3-nested.c:114:13: warning: unused function 'vgic_v3_get_mi_level' [-Wunused-function]
     114 | static bool vgic_v3_get_mi_level(int intid)
         |             ^~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +116 arch/arm64/kvm/vgic/vgic-v3-nested.c

   113	
   114	static bool vgic_v3_get_mi_level(int intid)
   115	{
 > 116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


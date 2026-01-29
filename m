Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F7D46C0F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W91QHIsxxQeS969zd0jjBBqKBnW+kgodv4PtgIozavs=; b=MEZSbILJztYn+2+ToAfhP8vZrl
	itKg46++oy84/RSWz2julT/nM/qRfCKnTeT5WRw0FpshfKyWBCWRQOEL+DaowTa5rBtzhNlejNfwh
	KcFdZ88GoCp9XQEvhwCQVjOIyRCAV5kBXLXRhzk7fGUQ3Ga/lyK9FWJGENYVL3zUl+bZIJmp6F9Qk
	BG+af2sj/aHF9ZRpWsevP7DRFGc+//rdVWEJi5F2JQAlgz1iitlZD24XKdKc/D7c/f83JpW6XP9Sp
	cGQ72ap/pRCgX9YqsOeSyFLbXy8p4MB6K2xw5nhwbUW/4sV6cgLCJnU4iMGJvDSoyyBC+/q+BoyQ0
	vIsJwBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFjU-0000000Gxno-45pw;
	Thu, 29 Jan 2026 00:18:00 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFjR-0000000GxnT-3gRJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769645878; x=1801181878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u6ZFlDnr5QffliZJ4+NcgSsnxfCxlXumwZX7ISG0CuI=;
  b=HNGsRZdyf6kLoFUvHaNrM7d8TiEdiArLRv7+Bw4rWqaF7CeZZDM/Za55
   z9+fAiXWltmfL3C1CI3A7sqdh/QoD0dpixMXT01J+WWe601h6TFKS0bk6
   9x1MPepLpDAlyrpaZkY75IQxPkkmesyZHcOVW2vBy9nymZQ/izYlYquZN
   sRHtwyz8c1iWExnrXRbmInGKVlY3s8BUgh2ylEXjACg/O/cfIqFQOnq0z
   9ddt0c75LR3t/1bXOESOHjX5URPG5zYc5/5XXYf6KNzZ6bbpgqMhYz8Py
   +LGsIh/gfGiJ+xSwahcPyfcQwoID0SLLI4xAMrKdYW66PgIryqKyu0XDl
   Q==;
X-CSE-ConnectionGUID: DQOqAKF7QPO+pl3i3hYYAA==
X-CSE-MsgGUID: J5C1HlXYS4KUxVP9OOFazg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74734807"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74734807"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 16:17:55 -0800
X-CSE-ConnectionGUID: 75EeafUkSVip99HGl/nUrQ==
X-CSE-MsgGUID: 1J7tqHpIQxeYBSfmZ8K85A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208649241"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jan 2026 16:17:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlFjJ-00000000avY-3l9E;
	Thu, 29 Jan 2026 00:17:49 +0000
Date: Thu, 29 Jan 2026 08:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
Message-ID: <202601290838.4jtWi90B-lkp@intel.com>
References: <20260128093611.1932770-3-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128093611.1932770-3-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_161757_963656_DFCFEF2F 
X-CRM114-Status: GOOD (  12.79  )
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

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.19-rc7 next-20260128]
[cannot apply to pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-reset-add-sky1-reset-controller/20260128-174335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260128093611.1932770-3-gary.yang%40cixtech.com
patch subject: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260129/202601290838.4jtWi90B-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290838.4jtWi90B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290838.4jtWi90B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-sky1.c:322:35: warning: unused variable 'sky1_src_config' [-Wunused-const-variable]
     322 | static const struct regmap_config sky1_src_config[] = {
         |                                   ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/sky1_src_config +322 drivers/reset/reset-sky1.c

   321	
 > 322	static const struct regmap_config sky1_src_config[] = {
   323		{
   324			.reg_bits = 32,
   325			.val_bits = 32,
   326			.reg_stride = 4,
   327			.name = "src",
   328		},
   329	};
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


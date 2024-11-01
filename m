Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5A5E6F077
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbK3OR6MkbhQkAxcD1MAm2CLr9n3cQ9009meDBFXwss=; b=I7/jGx8KM5U8eYOKF1J6vsaoMQ
	P3haT5EQ6I57paYnPulY3rejGwda0LEn+L3XBaJFY+mPiY+GB0ZVuLDPa6mD+6ksv9ysitI0hWtG8
	kyyaTgdIcxZre3000N3WOmKR3ToJo0KVh6b0EJ64HAJOo2NMdikz86c8LAeEBLPmR1GmRZTsW3BMO
	SdcFPOxT0LPOB/kNP/VxcbY8dFp2Wfy1nJsr8nDsnHXKfXB2x23+kXQHT+Tvdcclykqa1qxmmuUql
	D7D7ZpZdT4u/CvW42duro4lJXhj+mdr/DTwmfvriIHqCu+j+ykoQzOxBGEGnQjjjrIVMMUZ0qYVxa
	aHIptdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vzp-00000007vgX-45t3;
	Fri, 01 Nov 2024 18:03:41 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vy8-00000007vLM-1A8v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 18:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730484116; x=1762020116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L6URiYCoXpopiknFDUGt7k++aqPsAhuBO3pNbeASb0g=;
  b=TZkm1hA3hCVYpt+UVxmH9WktR/xd7colTomKUrT7K7hzIwUGAncPlxTK
   lYQgpCcvr0Li3OCHjnrCQkf6AS0p6K3pFGIFIbXPkne5BjwCNhgswtKiO
   snf6u5abkO0/8M8g0slJS8Ac6MA8t1FwxJDat76EX+QXBI+zXb5q3XPt9
   q0EdN+gllxRnUUvf0I37BiPwQffF14RSEobM0++BRFK1TEN+uobpZ4LOz
   V/rG6Ynv60j1zWUD9gWm8NLxtzFsX57NgHvb59VwV2yp/Sk81vPHg4hDF
   VCBCsxEq9Jo+OITKsTTPcAC2U5AmPx0yDkVPTNYEhQhrtXvzzNCqB2K1k
   Q==;
X-CSE-ConnectionGUID: o79IwbrKR2mZQ6mjBsGdWw==
X-CSE-MsgGUID: gqeYrUn2TkygbQ5sECrczA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="17886441"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="17886441"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 11:01:56 -0700
X-CSE-ConnectionGUID: cci1yP8SQi2+tg5zQFYffw==
X-CSE-MsgGUID: SvnGqoF9T9290lHTWh9Erw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="87852661"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2024 11:01:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6vy2-000hrH-1J;
	Fri, 01 Nov 2024 18:01:50 +0000
Date: Sat, 2 Nov 2024 02:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Linton <jeremy.linton@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	steven.price@arm.com, suzuki.poulose@arm.com,
	catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
	sami.mujawar@arm.com, linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: Re: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
Message-ID: <202411020102.mnsnqAiD-lkp@intel.com>
References: <20241029141114.7207-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029141114.7207-1-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_110156_348382_B006B062 
X-CRM114-Status: GOOD (  12.80  )
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

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on next-20241101]
[cannot apply to kvmarm/next soc/for-next linus/master arm/for-next arm/fixes v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241029-221213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241029141114.7207-1-jeremy.linton%40arm.com
patch subject: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
config: arm64-randconfig-002-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020102.mnsnqAiD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020102.mnsnqAiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020102.mnsnqAiD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:223:40: warning: unused variable 'arm_cca_match' [-Wunused-const-variable]
     223 | static const struct platform_device_id arm_cca_match[] = {
         |                                        ^~~~~~~~~~~~~
   1 warning generated.


vim +/arm_cca_match +223 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c

   222	
 > 223	static const struct platform_device_id arm_cca_match[] = {
   224		{ ARMV9_RSI_PDEV_NAME, 0},
   225		{ }
   226	};
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


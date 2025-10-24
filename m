Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C45CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 19:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EnUCkv62qPwSMgb1KD2wO6R62/uHFt+x7zIjrYIocjs=; b=dvOs+styi11t/lc3TfSQYmNjUc
	M7PXGE9bfNAZYdZXSizli5HsAqrL4YBZD0uMAoaWXzQsIIkGCO4Nod58JVcuI1xr1oOAaUmwBGHsk
	VtwZmTepksuTGXv8V/vip2k4gQ9uJ3+zMZZr86M2mEZGR3ALgc7BeTMaB72MixYa5XBdPEVt81a6T
	jRCmFBKGjzjrjs8Fr3Fptwf9q/7cMzpNyNWBTobFrM1Yx3cf/H7qd8rx+TWpTHKZxtcNdbK1VExsq
	ZgdpotDG9ro/yByjTczeKAw0GJgTHNB4YUN8e1fyN2hQJyx7wQn1QZDMDifNdQT492kNvQdAapNPj
	cH8TmUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNCB-0000000AKcN-1wyd;
	Fri, 24 Oct 2025 19:11:27 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNC9-0000000AKc3-005Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 19:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761333085; x=1792869085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=huTDz8f81rALXhF6I8LCkj0hTPSr9oc3eKFwWicKBEw=;
  b=MI3f7HiyZKdzZ6EJOTixKpyz9JQkzr8fTipmyQwvW6vg1s8AKn/HzaC1
   X37dt8f1+IDCorXhedmtKCGOt6dsYZ9y7tjtaXggNqmH6Fbon5axV4zub
   Z+lW5yGsu8uNy1grZxXYx1oc2tWai6eMGQIoH7jWnsg3ZC2cKSggwIeSV
   i5/jgZra3Lt7OVl3js/rlfw5ugNVUcUjT1acjRcaOfl3DWb0hop1Guqv8
   JkgBCeFzTm1MbybsYUlvC9r6AKdgenyRo3aXmwniyF6i9tK30W+bXNF7L
   ZeiVcp6/xu0ZH083pcGmwgwogv+Cs4ckUFVLhy7e0T2Cw97xJymtE4m+P
   Q==;
X-CSE-ConnectionGUID: zivPwFY1TJWkybtHbbvmWQ==
X-CSE-MsgGUID: Gc92KweaTjO4jab+xV9uhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63613603"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63613603"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 12:11:23 -0700
X-CSE-ConnectionGUID: ULWw6uP7Q6OENcghUUggQQ==
X-CSE-MsgGUID: 512bIhasTR6Wyqiuwp2MJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184403689"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Oct 2025 12:11:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCNBy-000Enx-1X;
	Fri, 24 Oct 2025 19:11:16 +0000
Date: Sat, 25 Oct 2025 03:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-janice-v6.18-rc1 9/11]
 drivers/input/misc/isa1200.c:423:3: error: field designator 'probe_new' does
 not refer to any field in type 'struct i2c_driver'
Message-ID: <202510250319.9WqUFHAz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121125_096548_10DFD8B4 
X-CRM114-Status: GOOD (  11.00  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-janice-v6.18-rc1
head:   ccd3929e54f44ccae885d803cc472204f661c886
commit: 5e4f8e741997d1d027479597bf5265607888bcb1 [9/11] Input: isa1200 - new driver for Immersion ISA1200
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251025/202510250319.9WqUFHAz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250319.9WqUFHAz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250319.9WqUFHAz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/isa1200.c:423:3: error: field designator 'probe_new' does not refer to any field in type 'struct i2c_driver'
     423 |         .probe_new = isa1200_probe,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +423 drivers/input/misc/isa1200.c

   416	
   417	static struct i2c_driver isa1200_i2c_driver = {
   418		.driver = {
   419			.name = "isa1200",
   420			.of_match_table = isa1200_of_match,
   421			.pm = &isa1200_pm,
   422		},
 > 423		.probe_new = isa1200_probe,
   424	};
   425	module_i2c_driver(isa1200_i2c_driver);
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


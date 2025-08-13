Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B93CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 03:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkXGgV2V8FTOlUSpxpDlTRV07cpZAsnRqDF+487j0Z8=; b=Tfzb2cFSVu9/zsXy4pLcViZecv
	wzlc53kgIGXSRPTpyZ0zqv7KUmfZKHk5sCzOmJGtIzGUY9IxoKBgFOc3GUhWWxg1JtNwRNnmVf16v
	sfRM0iikshG+4+l4yLDRt3xkQU/8Tk7j5iPyGkSEB2zn69/K1k3mQF0b7iQp+vO/Csi4Pq0twD1rt
	qUB9PNw3XpugFgY14hN1zGNKcpcd5D6axN8vm7eZ9huJMevG5eznMKnFJQHDdZwiZSXMP6R9OP7Ha
	7BNUTqaQQtEdnwTTGs9fFsuenPciXj4PrdR3bBBDwkqJ8AqPSUww1i5eSrO1C7uqLw3BMtCeKAscx
	dRK4Cipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um268-0000000CVke-2h9M;
	Wed, 13 Aug 2025 03:24:20 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um23a-0000000CVRI-22Dd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 03:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755055302; x=1786591302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FJ3uPrxwG00g76QIbGSTYDKnWQuCo1IHVqFcVwiujF0=;
  b=RwijmR8rQSza60KMbn3UCk3IKtdVBgUnobl6OAVah9czcLBgGmEPXlrb
   f8sjLLQDD4fQEhWy7prVEmg3/NuHbSxLJuRYOX2yjwlDNlB8YcAYgNQFK
   vBuo3DHhN8LFgMjy+JfnmjFEREFxLOLePgPEof6ANWDs6MnWCD50ZXwXW
   s2DzysBKa+pOyz5/hJL9neHctgEPMDnYVx4WesLbZx54MnpmuShhkU+mI
   QVUsxowWK7Q8imDrnpZsK4JpL2Rdc42eTHZtKAqhfBA82aPqgLiKwX3KQ
   JqdF5gflzVn4mx7zBAvNIHTFaxEKpoFvhvNxEWVzGwoQ3lqXL80pmtAxM
   w==;
X-CSE-ConnectionGUID: NINkUvCCSIO8U3Sq2iPvYA==
X-CSE-MsgGUID: 9gEHJsVbQBS1ZwCpvjdLtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74789383"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="74789383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 20:21:42 -0700
X-CSE-ConnectionGUID: 84Cqx6gLT7a+m83CS2tacA==
X-CSE-MsgGUID: AYDpHQp6RoyvGKKPg8xa/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170565614"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2025 20:21:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um23E-0009Ui-38;
	Wed, 13 Aug 2025 03:21:26 +0000
Date: Wed, 13 Aug 2025 11:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: Use hashtable for global clk lookups
Message-ID: <202508131125.ohtCwp4k-lkp@intel.com>
References: <20250812085328.3306705-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812085328.3306705-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_202142_592695_1CD0729E 
X-CRM114-Status: GOOD (  11.17  )
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

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/clk-Use-hashtable-for-global-clk-lookups/20250812-171958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250812085328.3306705-2-wenst%40chromium.org
patch subject: [PATCH 2/2] clk: Use hashtable for global clk lookups
config: microblaze-randconfig-r131-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131125.ohtCwp4k-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250813/202508131125.ohtCwp4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131125.ohtCwp4k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk.c:40:1: sparse: sparse: symbol 'clk_hashtable' was not declared. Should it be static?

vim +/clk_hashtable +40 drivers/clk/clk.c

    38	
    39	#define CLK_HASH_BITS 9
  > 40	DEFINE_HASHTABLE(clk_hashtable, CLK_HASH_BITS);
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


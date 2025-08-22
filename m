Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F98CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afw0CK4KJ3KzgAVAgFQike0f4GOKZzvrS/KOdkZz5sA=; b=WGK9PbN/7N9rPuG/D+N/D/jkH6
	FIxO/XLjc3skNiCHF11PfTkGsc921ibt8QFGGGyPkE0VNJAH9W+A4Tp6XO8Amar/0xKbexJ9TG5GN
	nGEaL0oUTUwHHdGeGKHpDSE5+T2+4PJv8l/aLDqq8qcHLplnBZ3SNrtk8xdNxE/2y7mg3Yfym13UT
	FdWdUV7BsBPKXRtWlHReD3t8W7fFun+81ubtJBZAQSMIaUPbTBK6EduQHSAvjxrckqUJkmbf9z8Ko
	JYUovFpa0fyfaGkPdyAxbnstitCnz3H8mkq4slWhZiI68LNRQEZKiAWVTtLZzYomGkbnro8b51cMU
	F/OaGJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfs-00000004VVC-3nwO;
	Sat, 23 Aug 2025 09:36:36 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upYhc-00000003SIj-28qO;
	Fri, 22 Aug 2025 20:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755895776; x=1787431776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6qRJEDHnq+mnjsWtsK8R7/Xtst4O7SL4dK318Mo5qM=;
  b=V6gHkbuYKlBfmVWft7eq7rR8verMlUfplihtuuwd9LbsxsilQHo9jGwU
   m38Nybia5/9guS8yd/kdQeg+3tKoFJsv/3I0xu4X3PM8g4CBLrDkqRWRB
   /fKb16fH4xFkwaP8KTlms/dE2LmqVJYYG87DAj8YfZfF5BhxVNWXTuSsT
   J/qlI5OeCDX1bhJ26gKMMVMlaIFrme2U38iaSf0uxSy/B1R1+BVS/Uv/5
   IYk6/mF3S2fMOn5M7bTsLqM7utVChmC3rKy65wdzLYwvop8x3f6j4NvDC
   jKDSe+FBq18RMBwcq/DqIBetq9HhdOoHSSfiAU8v6qKBjm4iqiK/Pkh24
   w==;
X-CSE-ConnectionGUID: xB2Mer13SeOEJfW+xmJH0Q==
X-CSE-MsgGUID: dxCYtpGsRr2jd21875wHrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58356633"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58356633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 13:49:30 -0700
X-CSE-ConnectionGUID: n/+zYlt0RPqPyOa2rQ36qA==
X-CSE-MsgGUID: m+IUK9QUTnelV4MFBQJK3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168399112"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Aug 2025 13:49:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upYhR-000Lp5-2X;
	Fri, 22 Aug 2025 20:49:25 +0000
Date: Sat, 23 Aug 2025 04:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: clk-mux: Do not pass flags to
 clk_mux_determine_rate_flags()
Message-ID: <202508230416.OIwROhOT-lkp@intel.com>
References: <20250822062854.2633133-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822062854.2633133-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_134936_614124_8436D2C6 
X-CRM114-Status: GOOD (  11.89  )
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
[also build test WARNING on linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/clk-mediatek-clk-mux-Do-not-pass-flags-to-clk_mux_determine_rate_flags/20250822-143106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250822062854.2633133-1-wenst%40chromium.org
patch subject: [PATCH] clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
config: x86_64-buildonly-randconfig-004-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230416.OIwROhOT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230416.OIwROhOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230416.OIwROhOT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/mediatek/clk-mux.c:149:22: warning: unused variable 'mux' [-Wunused-variable]
     149 |         struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
         |                             ^~~
   1 warning generated.


vim +/mux +149 drivers/clk/mediatek/clk-mux.c

a3ae549917f163 Owen Chen                  2019-03-05  145  
b05ea3314390e9 AngeloGioacchino Del Regno 2022-10-11  146  static int mtk_clk_mux_determine_rate(struct clk_hw *hw,
b05ea3314390e9 AngeloGioacchino Del Regno 2022-10-11  147  				      struct clk_rate_request *req)
b05ea3314390e9 AngeloGioacchino Del Regno 2022-10-11  148  {
b05ea3314390e9 AngeloGioacchino Del Regno 2022-10-11 @149  	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
b05ea3314390e9 AngeloGioacchino Del Regno 2022-10-11  150  
6c66f834fd3bf9 Chen-Yu Tsai               2025-08-22  151  	return clk_mux_determine_rate_flags(hw, req, 0);
b05ea3314390e9 AngeloGioacchino Del Regno 2022-10-11  152  }
b05ea3314390e9 AngeloGioacchino Del Regno 2022-10-11  153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


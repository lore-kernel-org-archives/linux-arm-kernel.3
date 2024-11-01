Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9121E6F06F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoqHTrs4L0Tl9sglRYPfqBYzYKUDtBUZyylQ8F7pHN4=; b=ZWdo4jGhx3oJVv0C3gIkqzVE1p
	/NipB65rqAN8L1Xia6/leVQSE4tkx5l7t3isSme4OC8ikTMKrcublWP3kc0R3A7yAD2dqkxuPr0R/
	x4Er8AnEqbm1lMYtjY3jUUP/1V+YQcOFZBbtweW8IxipAcHi8fUEGuVu7dSrObDD437EDgnT/GCtY
	zFk8HhbEsUi+LQf+GPE13X5Jsq2qec6YLBLspVVoR1U9ZfMdx8WxEaJvOPGdmvtc+m4G+gQgGaic5
	ccF0Bo7BRd95jwFOgi/zQYoPMS0qqTBAQjfiZEWAvKt+p+e96SvrQFm8UONiwhk1ZcMY0Q/n1K4ZP
	8kEAnNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vii-00000007sXA-1wXm;
	Fri, 01 Nov 2024 17:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vcy-00000007ruZ-0RBX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 17:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EoqHTrs4L0Tl9sglRYPfqBYzYKUDtBUZyylQ8F7pHN4=; b=CX+Ew4rVyrd9xHkcvQyg5vpfxL
	kGEBSe2DCk5KqJGrV95tkxgmnKi5e/nsRnMExAGUNpw9NsUakdbiTPnoqfk0WcH10Xn1ZEmlp3lAB
	ApiWVP2ukQ27qastfk3kHbFPRPqnSK90dTEuUvPhzspySZa7ssdeMUA62xTFgwwLn69Mv7FN+B4wk
	IYnwdBEmPQWeBch2FaI14pRQnvXpf5W+p2rBtR8Lkz0XQ/2DNYOZ4mX2F2ACKgw8hYXCNg0SbA7PI
	fttTu6LN4m/p1o7k3o7Z+r3rjYcqzBozdpW63lhEoxb5vb56+dz/5i1p4f0/D5gF6Yoj0FXZ9eWag
	4OjsNinA==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vcr-0000000Amhb-1qqH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730482798; x=1762018798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v89+g/DTQWGhLe4cuYjs1XO0sK/w/oIh3Cy6SzSuvQI=;
  b=TrJ0iUbvxYqHblRvYuER9lLfncntqRqbSGXkQ3DjlSoT0x3v+185CFhv
   NyFSIonFYEtFZYpwsCk75G7JBgEvO5TuM7HNhhjOELJ49ccGCOHE3BwnE
   E7CAeavnGbkYC78LrLzslKe4UbzMNaK1zYVTQ3nWUX5HvqeNHt9yeksAb
   wqBrV2hbfxCeC2AmWIlKVYvNe07cfWXSa22Ock9jBYs753wq39Y0rC4WK
   upCv3uDoHVNOii/ZkRDlgIjMNXLuZQ9ebD3OJpzuUthBp+iZagmzAuRTY
   0LntxPbiNLdAcuUBrTQORWfAS0CFexper8YjSMu9U6paAC0s3BCMp3JFZ
   g==;
X-CSE-ConnectionGUID: eeHSNkKbRnebM07U+vxzkg==
X-CSE-MsgGUID: 8fhP6YqTQeWkgvLksvms0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33946102"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33946102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 10:39:54 -0700
X-CSE-ConnectionGUID: ZtWAP1PfRSWO5BFUYHZlbg==
X-CSE-MsgGUID: lL6wqBWATWWj/rbYsPrCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="88155105"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Nov 2024 10:39:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6vcj-000how-0i;
	Fri, 01 Nov 2024 17:39:49 +0000
Date: Sat, 2 Nov 2024 01:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Linton <jeremy.linton@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, steven.price@arm.com,
	suzuki.poulose@arm.com, catalin.marinas@arm.com, will@kernel.org,
	gshan@redhat.com, sami.mujawar@arm.com,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>
Subject: Re: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
Message-ID: <202411020124.OBmJyKCY-lkp@intel.com>
References: <20241029141114.7207-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029141114.7207-1-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_173958_051700_63163113 
X-CRM114-Status: GOOD (  13.10  )
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
config: arm64-randconfig-001-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020124.OBmJyKCY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020124.OBmJyKCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020124.OBmJyKCY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:223:40: warning: 'arm_cca_match' defined but not used [-Wunused-const-variable=]
     223 | static const struct platform_device_id arm_cca_match[] = {
         |                                        ^~~~~~~~~~~~~


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


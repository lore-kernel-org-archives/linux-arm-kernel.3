Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A2FCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSpn+4WRuRwwudYVmTek66HaE4RbnCydNGtY/Y6hVWI=; b=HI3rH2URSow/ikGnX4E8GPsc9k
	vcZgUWr5LTx8Mb/+0MChtg7ThjKTKiBTDWV4GII77bsAm9DYPFBxD4CBmMj1eE32W1D93XaZlzDWy
	XIt5mvPx1FPPDq0Dlfo3RibHf+wiyzPxBlyRQ0ZhmHmGURXYkLqGkFvT6o7w8vFakZB+wuX+ztHuG
	2daKcklHnrZ1gQ6kGBI8uisodkLR6dh68Xi9RTK0WJmZSnccl4ORtJb0cRx8+PnTQ3cXDS41ifpse
	UEQ34PNTghOJ9nG+qsvMs7LDHnTJpI/RYABhPOTJzLYunreGUeXem46owRmWV7ldauHPlI2fFNd79
	h8IsGbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxI1-0000000CDfQ-3Xsw;
	Sun, 26 Oct 2025 09:43:53 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxHy-0000000CDf0-2RPg;
	Sun, 26 Oct 2025 09:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761471830; x=1793007830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MyRDkkeM1WniRrNwIECJAWX6rR/HsGtbFOS5K7hsaLo=;
  b=S2cpkLtxga2aoYQoSAUYGHefRaoCxfxZfMin1a8umubTHTf/0hDF+Q25
   BXsdBl0aV6bGpue3F5/cBGLGWBaj5lqW3GfxFOxHqq3QlC7cVRRHPIgLp
   bG+yxv4ZAVZradH76PSAKr/JF7TXtBWylsPcXovNbuEI5x8ah99fI3JnL
   Aws82GDsUgBJ2DM8jhfB1fLTljEzpB8RollMViVKRSqtf8qOVCeVfk2FB
   84vHk+tGfjObm3WkXaO4gz2eQlwU/bSGyGe47gWMoVHwx4UH9mDB6xP8U
   vpXRIlU1QQtZGzXNRAZww2PapvCCbycKiW3YAi76SyEgbaEy/mcdeg8Uv
   g==;
X-CSE-ConnectionGUID: 4UPHdfkKQUO9zyv66GW7OA==
X-CSE-MsgGUID: RUF8/xZ0Sh+un3tSAOxjeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89052155"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="89052155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 02:43:49 -0700
X-CSE-ConnectionGUID: RJXJrLBXRruANBTCQE/mPQ==
X-CSE-MsgGUID: sgB1CLxGQzyoEeuxq8N8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184877434"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2025 02:43:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCxHr-000G1x-2v;
	Sun, 26 Oct 2025 09:43:43 +0000
Date: Sun, 26 Oct 2025 17:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Coia Prant <coiaprant@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the X3568 v4
Message-ID: <202510261750.glZ5VRca-lkp@intel.com>
References: <20251025203711.3859240-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025203711.3859240-1-coiaprant@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_024350_654324_DBF22E7C 
X-CRM114-Status: GOOD (  12.69  )
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

Hi Coia,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on krzk-dt/for-next linus/master v6.18-rc2]
[cannot apply to rockchip/for-next next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Coia-Prant/arm64-dts-rockchip-Add-devicetree-for-the-X3568-v4/20251026-043855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20251025203711.3859240-1-coiaprant%40gmail.com
patch subject: [PATCH] arm64: dts: rockchip: Add devicetree for the X3568 v4
config: arm64-randconfig-002-20251026 (https://download.01.org/0day-ci/archive/20251026/202510261750.glZ5VRca-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261750.glZ5VRca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261750.glZ5VRca-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: missing overlay file(s)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ED1CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 15:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IYVSFqj7+ovw1gRDYCjVHdtwnJnx8HXVrEmihXPxCU=; b=mXLTdLkd6Y5+z/MsRZ2xjzOx05
	gC3sy8yXfNZll5htrOXpa77l2p8NOUlvrVQEeFPvJR5BmPhOc5JD3RQAotXaMTt6b/TGYSJcXbKf1
	NB569WZYPC1cg3TJFyAW8H71Kvv0iGB4/TCh5VfY5OzDfL1xM8gaLfr4FYAOb0lnEuHjjBUCs77li
	cLlbbVCjDnrLoXq5YYgw1yNV92UNPYmHgMT/0HfLVajgRTl/A4qNnlYIQQzlsCgvgaQ4VYbdNsx8v
	AJQJ1KcXYUSUyHxFwQ8PAi8ZNNXiMuFjY1XO0EQyb+YfoHm01sc26KWaCa/k2RUi8vOqnim7lOGUv
	Ew7lG8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usNnX-000000084DM-1F7L;
	Sat, 30 Aug 2025 15:47:23 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usNjv-000000083rq-1ynv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 15:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756568619; x=1788104619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dUdc3YD3kkYcCh+ebcNpEl3q2xqMySVNEI2xbGKknoc=;
  b=TWRL7YFGoBUBXjcT0a7wyXbedXVrl71hp59y2DZrPqSTG3yWNMuR16lQ
   zHW+z1OQBy0HU7R0xgPOxGePWWFJ/wsV6JSUj2JhH0q7ULDovBG1SxqtN
   b2iICmF9zrRiQZRbw7fRcWFWBdldpaQ1olp6/yW1tgX0S/iKCiQnaRT81
   Y0ufOar5ETpF3m6Gs/+cjbX125PiW5R6MxM/qh/sot40cMFpdWvQS0MuY
   GJWHLzM8wRW8hUkqHGjEEbeYZyrMlgOUpBqqFuPtGdIUkkRIy2rZCiFBT
   NgySW7+jIsz+n7zaf11j5/YqcWWaVVJkAiy1ogRZkl7EqG+D4610KLIRg
   A==;
X-CSE-ConnectionGUID: CenOOZxQRWq7KF9TBWIB0Q==
X-CSE-MsgGUID: vogbi7XtQWig/+cMQ8K/dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69933115"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69933115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 08:43:33 -0700
X-CSE-ConnectionGUID: IoIRMJ2SS8OOZoP1hwg7zQ==
X-CSE-MsgGUID: EXq+p+TvR+6RSo0YfCui+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171406704"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2025 08:43:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usNjQ-000VTL-0R;
	Sat, 30 Aug 2025 15:43:16 +0000
Date: Sat, 30 Aug 2025 23:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next 2/5] ARM: dts: ls1021a: switch to new fixed-link
 binding
Message-ID: <202508302318.rMGYiqni-lkp@intel.com>
References: <7427825b-7d2f-4edb-a357-fa5eabb6d7d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7427825b-7d2f-4edb-a357-fa5eabb6d7d7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_084339_548178_18E61C22 
X-CRM114-Status: GOOD (  11.27  )
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

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/arm64-dts-ls1043a-qds-switch-to-new-fixed-link-binding/20250830-183341
base:   net-next/main
patch link:    https://lore.kernel.org/r/7427825b-7d2f-4edb-a357-fa5eabb6d7d7%40gmail.com
patch subject: [PATCH net-next 2/5] ARM: dts: ls1021a: switch to new fixed-link binding
config: arm-randconfig-003-20250830 (https://download.01.org/0day-ci/archive/20250830/202508302318.rMGYiqni-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508302318.rMGYiqni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508302318.rMGYiqni-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts:127.2-35 Properties must precede subnodes
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4898FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pKway99g0rgVricxWhxADlMeQYcPvfax8Ult5O56Bo=; b=33DEZMUNrR2Ko0GS7gcvViJO2A
	FphvQCCFmw9kQJohSF/UzzNf90p1fwAkAWDR1Flg8HnzphJzke8EDNiWb8SIiS4h/dFwSxM6LeW7+
	UD4Qv0YnSEgQai/eCdDlrQtTuai3po7oQq4WD+71x35l3WM/ndRaYkYMg6xQDPuaA/xZvlbUt1/58
	Sw1YzTwoJ+LGOUswUW8cjHtXep1GPsIgjFZOTQOypnHcijYES0V10Lbv3irS5TmecUBVn81nMMGtf
	CQBCdoMHuA66H6yqvDhl6FeSpCi9yxxYanFrwFJplrQyLF/qawGn89dFp8j219EsNEDO+00jChaw6
	2ESnSw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvly-00000006uGT-129J;
	Wed, 16 Jul 2025 06:37:46 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvRZ-00000006rh0-14bO;
	Wed, 16 Jul 2025 06:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752646601; x=1784182601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s5h2aOonMUy25QFmLEMp//o9oNn9ckWWreXS2dSrzoU=;
  b=BGgFZ80nUVXuJ1zyGa++zNn/sh17vWTEXGRiCkEG22vJHS+O/0BHLk8O
   aQunR22DgODwFlJ9AHn+91ZWcSfU2UF7RYGNZpw2shNJmTAic6W0MSH1B
   V0Bf9tGw1b3Jb9iO43St+meDPCciauH6z7RnrUeXB4CfHeDK0tzI6MK7j
   Kb2p6j4SBMXV79GKzyX1MA2VYn63xtaCqw/UJv55ZDE/mTQlSa0+T/8jQ
   bxW/P411hgi9eYOf1mr8roZfh1eMuBFJ4C4tC4dVxySxElpEojf2Gn2R/
   BbSKWub7Huj78riPLDGeHEQ1GwKTJKq/R7eu8RnBWifjMpEbVRHCqMoAt
   A==;
X-CSE-ConnectionGUID: /pzdvqQhSLywVkQ6870C1g==
X-CSE-MsgGUID: UVoqtmWZR06nJqOA6tKQUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55030107"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="55030107"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 23:16:40 -0700
X-CSE-ConnectionGUID: +nsgvEutRfqUlUtiZui4ng==
X-CSE-MsgGUID: Njm01TfuQPya5kUqf5hyOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="157767216"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2025 23:16:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubvRP-000Bzf-2t;
	Wed, 16 Jul 2025 06:16:31 +0000
Date: Wed, 16 Jul 2025 14:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add support for
 Type-C TCPM
Message-ID: <202507161301.ZhlTOik9-lkp@intel.com>
References: <20250715112456.101-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112456.101-4-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_231641_314832_DAFD6FBC 
X-CRM114-Status: GOOD (  12.36  )
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

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250714]
[also build test ERROR on linus/master v6.16-rc6]
[cannot apply to robh/for-next rockchip/for-next krzk/for-next krzk-dt/for-next v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-connector-Add-displayport-connector-for-hotplug-notify/20250715-192802
base:   next-20250714
patch link:    https://lore.kernel.org/r/20250715112456.101-4-kernel%40airkyi.com
patch subject: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add support for Type-C TCPM
config: arm-randconfig-004-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161301.ZhlTOik9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161301.ZhlTOik9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161301.ZhlTOik9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/phy/rockchip/phy-rockchip-typec.o: in function `udphy_orien_switch_unregister':
>> phy-rockchip-typec.c:(.text.udphy_orien_switch_unregister+0x2): undefined reference to `typec_switch_unregister'
   arm-linux-gnueabi-ld: drivers/phy/rockchip/phy-rockchip-typec.o: in function `tcphy_orien_sw_set':
>> phy-rockchip-typec.c:(.text.tcphy_orien_sw_set+0x4): undefined reference to `typec_switch_get_drvdata'
   arm-linux-gnueabi-ld: drivers/phy/rockchip/phy-rockchip-typec.o: in function `rockchip_typec_phy_probe':
>> phy-rockchip-typec.c:(.text.rockchip_typec_phy_probe+0x15c): undefined reference to `typec_switch_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


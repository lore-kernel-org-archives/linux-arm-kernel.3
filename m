Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D9B1098782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+us6j/l/jJ0VjRv4TymMNqntuUlcC60hoeuke3P71YA=; b=CEnNJPpQsLtyEcDJpn7AP8LklW
	vyUPwelaa/rjUWqISduSwe3SOuBz4KelCXbjwvkEoq8KhR17WAsTwX+XHPeEkd81ss4xvc/yO8MNE
	qZ5VBrFiYZldfO/1DJMo5/BKaPQbsu0VW2wjWlwR1PgLp4ZI3RWsVLB4JyLAoTNvhZd7zguJpMvv1
	khxnt7L1wbKNxyg1CwPc/OGnAhDKunmi/l17NtOA960h24qCkcMxt+DomRjeIJSoY8e0cOxAEkhBw
	MfPCX6EhIOme8q97NFx+wfmny6KX91NzWRzpN8/m0P0S5jSQs4G3EDyfMipRrpplw+sOuyDBstazX
	HvR1DUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aoK-0000000CwCQ-4Ak8;
	Fri, 20 Mar 2026 14:26:48 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aoH-0000000CwBt-1KTf;
	Fri, 20 Mar 2026 14:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774016806; x=1805552806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y1KAz+Qo2KIAojrgIrwzWp+iq0iub9vjOkzH9qUQnOM=;
  b=WmRGpYMbMstTFdcA+yhGvvIxilivrtr/AnegBdQI7eCnXJXvujKkdIZu
   TQurrUTIfWkuRWfeS0RZPnUA9rvVaP+X10goEZdYItXXCfWfQZmYChgBx
   TwJzD9vHlCMKTZOqxrQvEvWg0T9WdV7S6ZgeAAN/mZEQ5tLknE3FFwL7u
   TxywCGnNuRHaiBm2x0Kmjn6PwPwVZvaTZw1QsLSlMsbsa3qvs1MNZ+ozz
   fcHKCioTPihpYbPZwkfi1mz7cqcgavSCn9lxRtVmFREEMMX4dntbC3vRp
   c2VZNRo9THdrmN6mWymD8c2MrTIa9y7ne56MfVseNofzM/2PdS9yiQV2u
   Q==;
X-CSE-ConnectionGUID: 1iIxEOyYR/OVQoiSvgUWlQ==
X-CSE-MsgGUID: m0NWECRySYWBnenAOoWRaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74994307"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74994307"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 07:26:45 -0700
X-CSE-ConnectionGUID: DJ9w2MqSQ0SB7oNoKNuhOg==
X-CSE-MsgGUID: nldR9LigRtu7fAmhfFsyXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222392533"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2026 07:26:39 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3ank-000000002Sz-0eKM;
	Fri, 20 Mar 2026 14:26:14 +0000
Date: Fri, 20 Mar 2026 22:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 6/7] net: ethernet: ti: am65-cpsw: add support for J722S
 SoC family
Message-ID: <202603202224.XkGRjqgx-lkp@intel.com>
References: <4cc3dd9fab460d35215c8f97496b9ae16c5bcb22.1773751309.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc3dd9fab460d35215c8f97496b9ae16c5bcb22.1773751309.git.nora.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_072645_435058_3E4F4E50 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Nora,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on net-next/main net/main linus/master v7.0-rc4 next-20260319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nora-Schiffer/dt-bindings-phy-ti-phy-j721e-wiz-Add-ti-j722s-wiz-10g-compatible/20260320-033344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/4cc3dd9fab460d35215c8f97496b9ae16c5bcb22.1773751309.git.nora.schiffer%40ew.tq-group.com
patch subject: [PATCH 6/7] net: ethernet: ti: am65-cpsw: add support for J722S SoC family
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260320/202603202224.XkGRjqgx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603202224.XkGRjqgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202224.XkGRjqgx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/ti/am65-cpsw-nuss.c:3470:54: error: 'AM64_CPSW_QUIRK_CUT_THRU' undeclared here (not in a function)
    3470 |         .quirks = AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ | AM64_CPSW_QUIRK_CUT_THRU,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/AM64_CPSW_QUIRK_CUT_THRU +3470 drivers/net/ethernet/ti/am65-cpsw-nuss.c

  3468	
  3469	static const struct am65_cpsw_pdata j722s_cpswxg_pdata = {
> 3470		.quirks = AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ | AM64_CPSW_QUIRK_CUT_THRU,
  3471		.ale_dev_id = "am64-cpswxg",
  3472		.fdqring_mode = K3_RINGACC_RING_MODE_RING,
  3473		.extra_modes = BIT(PHY_INTERFACE_MODE_SGMII),
  3474	};
  3475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


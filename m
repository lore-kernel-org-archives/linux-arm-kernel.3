Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34463C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 22:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnoZ+gg5YhXP63fEUN49h3jP7xjCbiTAiJYodgeoMZE=; b=rc5JmBbYndszOECOWIMCg9TWf1
	AujD5INL4PwLs8M8YFPVtnxZhkP+/esGTKom0UEk6GXfmW+jmzRXcZ+mW1OfiELziffIUW11IiiIg
	ux487Rb1AjeOGFEhP59VUAbgucS7TthzJAQzQM12FYcis6IWPYhpnVUY5Xg7XxEO+L0iIEZ2FLyMF
	McwsaXaGLLVcRuvTItstAEoW5DN1gk0eFbGqQEUdHxHHkwW/FoaJn1fDXTJ9/GRN1a2LTv+og3FAD
	t6sTF5EnVtQyigM0WbqA/Vwp3WbN82fW2yh0NqueBm0i6N1a+vgk5UHXUdz4kMPlfHFA2cabQj4bQ
	Ih3Z/daQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thyfT-00000005Sqf-1v1o;
	Tue, 11 Feb 2025 22:23:47 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thyd8-00000005SOX-10h8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739312482; x=1770848482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KmQ+tXg/m4ZK8Xhj8IZwShtRHzkqTHlubFqibbJilzM=;
  b=jWEWtsBSAySVLM6NB9X3NZVci/SuVOQMUAU3lqL9xznv7tAFLODYgzlJ
   5AU91MRm66ymrdE51ChkxZJj4CHfzZDt5pbxdCHf3n57O5O3zIAnmhnlQ
   vKA4cFmYym0y6BIL8muCUO7JCRt8wBcwnAVbiiwiOIHuG9Og9tCNPIWI9
   OhR+58GChDVqt6GmlGq/dHnBm3tCK13MuAQ0Zbruc+ALAKgMbutTYS/Po
   Mti5HahYF2jdb2lRgx4mrJbZtSKU/KT6B6FgBih9aG1D3whUzAKi2nDPo
   jSX0Ln6qBg07AXFK2AsxhOs27K4RG6vhhbfzK6tCyjKpbi+VUK73MQg+L
   w==;
X-CSE-ConnectionGUID: qpnxHqRaTXyecsLn5zk3vA==
X-CSE-MsgGUID: HyEdwliPRmu0E6gDDVBiow==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50938312"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50938312"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 14:21:19 -0800
X-CSE-ConnectionGUID: Mnc4Nd50QAuuH5O4SxIE9A==
X-CSE-MsgGUID: 2ZhjGQPqQMavXeVcEpA1iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113529562"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Feb 2025 14:21:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thycv-0014lb-2H;
	Tue, 11 Feb 2025 22:21:09 +0000
Date: Wed, 12 Feb 2025 06:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Meghana Malladi <m-malladi@ti.com>, rogerq@kernel.org,
	danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, u.kleine-koenig@baylibre.com,
	krzysztof.kozlowski@linaro.org, dan.carpenter@linaro.org,
	m-malladi@ti.com, schnelle@linux.ibm.com, glaroque@baylibre.com,
	rdunlap@infradead.org, diogo.ivo@siemens.com,
	jan.kiszka@siemens.com, john.fastabend@gmail.com, hawk@kernel.org,
	daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next v2 3/3] net: ti: icssg-prueth: Add XDP support
Message-ID: <202502120546.Y6ri4qi6-lkp@intel.com>
References: <20250210103352.541052-4-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210103352.541052-4-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_142122_318353_744B2B57 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Hi Meghana,

kernel test robot noticed the following build errors:

[auto build test ERROR on acdefab0dcbc3833b5a734ab80d792bb778517a0]

url:    https://github.com/intel-lab-lkp/linux/commits/Meghana-Malladi/net-ti-icssg-prueth-Use-page_pool-API-for-RX-buffer-allocation/20250210-183805
base:   acdefab0dcbc3833b5a734ab80d792bb778517a0
patch link:    https://lore.kernel.org/r/20250210103352.541052-4-m-malladi%40ti.com
patch subject: [PATCH net-next v2 3/3] net: ti: icssg-prueth: Add XDP support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250212/202502120546.Y6ri4qi6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120546.Y6ri4qi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120546.Y6ri4qi6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/ti/icssg/icssg_prueth.c: In function 'prueth_create_xdp_rxqs':
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:568:55: error: 'struct xdp_rxq_info' has no member named 'napi_id'
     568 |         ret = xdp_rxq_info_reg(rxq, emac->ndev, 0, rxq->napi_id);
         |                                                       ^~


vim +568 drivers/net/ethernet/ti/icssg/icssg_prueth.c

   561	
   562	static int prueth_create_xdp_rxqs(struct prueth_emac *emac)
   563	{
   564		struct xdp_rxq_info *rxq = &emac->rx_chns.xdp_rxq;
   565		struct page_pool *pool = emac->rx_chns.pg_pool;
   566		int ret;
   567	
 > 568		ret = xdp_rxq_info_reg(rxq, emac->ndev, 0, rxq->napi_id);
   569		if (ret)
   570			return ret;
   571	
   572		ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_POOL, pool);
   573		if (ret)
   574			xdp_rxq_info_unreg(rxq);
   575	
   576		return ret;
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


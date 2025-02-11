Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AEEC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAiWZme8HqODQQUpo75264e3vZcVglNuIhOZ2kVV7J4=; b=WUynadn3FU1PqyOG3iifvHbOuG
	w6zseSp0F2T14gjO79nrSIlbU5d7c4MiN3QYzZ6IPyXcq1aulXyAMMz/g0LTUEwEEFW2PwhdF5r6g
	0A3e0siTM4wSikKDAOANsqwmfNNnxeIfSPZtRYvsB9nthKD0rcNnlHXSp6f8QnRrssZSzowV5hStD
	2m6u9erxUmNNQdRpRIs4rC6VLGrlLiI7iOVU5jKFpnp/OuKWyNpQiKF2a/tNWFT6WA2sITRNzXago
	eMVRniljLJsIvl0upZDJB3/1yYThD8A6TkhltFZpX04QFZQ+uGEF+I3SPxPQpsgz49ZGuOcW3s3A+
	X/S4XnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvLN-00000004uMt-2IEP;
	Tue, 11 Feb 2025 18:50:49 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvAn-00000004sJx-3BQd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299194; x=1770835194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2X0p8yfjjhftBFMiKokboj/5SlYdERseeftmcHZfhnk=;
  b=NXvKR3iFIMQMBLhFyYagCBz3futuL0t9YBIe3k1E/m1eIJp7F/HieT8S
   08N60nfFgdtAadous2W/ZioMJtO9sCQiVeR1poM9sU3mFX7GyOO7gijXn
   YYNXQ58QAmoMVA+7GVaIUp4dzr/Yv/DgBwWt0Eq8+p97VV7MjpxWP7yaX
   FPyA9VkdW+efiPE30PfvUJKSavZK/YmfUriT4wMhN1kYHLc+BlBtc4b6i
   Y7VWhFZ3Y38JJCvmrKSCNsQkYxJE3wlVjs3BXtEZwQvWGaSO69dT2VLfU
   CaWJemjOnpWH5fR8gdDHEGOquK3ijiJv91RzuhYM14eViEPph0KLuyKjw
   Q==;
X-CSE-ConnectionGUID: AzM1QCDJRquuxkh1quLfwQ==
X-CSE-MsgGUID: 1anZJuSMTx+FunmHLRKBvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57467854"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57467854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:39:53 -0800
X-CSE-ConnectionGUID: aIjXXl5KRTeTSWn44N5JOA==
X-CSE-MsgGUID: pwysVRBqS3K55qtxvr71SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117213225"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 10:39:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thvAf-0014Zb-0f;
	Tue, 11 Feb 2025 18:39:45 +0000
Date: Wed, 12 Feb 2025 02:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: Meghana Malladi <m-malladi@ti.com>, rogerq@kernel.org,
	danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	u.kleine-koenig@baylibre.com, krzysztof.kozlowski@linaro.org,
	dan.carpenter@linaro.org, m-malladi@ti.com, schnelle@linux.ibm.com,
	glaroque@baylibre.com, rdunlap@infradead.org, diogo.ivo@siemens.com,
	jan.kiszka@siemens.com, john.fastabend@gmail.com, hawk@kernel.org,
	daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next v2 3/3] net: ti: icssg-prueth: Add XDP support
Message-ID: <202502120205.w04H4d0q-lkp@intel.com>
References: <20250210103352.541052-4-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210103352.541052-4-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_103953_809595_39B0F31F 
X-CRM114-Status: GOOD (  10.44  )
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250212/202502120205.w04H4d0q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120205.w04H4d0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120205.w04H4d0q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:568:50: error: no member named 'napi_id' in 'struct xdp_rxq_info'
     568 |         ret = xdp_rxq_info_reg(rxq, emac->ndev, 0, rxq->napi_id);
         |                                                    ~~~  ^
   1 error generated.


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


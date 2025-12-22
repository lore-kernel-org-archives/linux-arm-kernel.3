Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70E7E674B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9cQk54XBj+qBOSLMUdg5N+A/DwtI23gj0GF+js0jeY=; b=KmSElEQsDEZ4pDUNOg+C3Ez+It
	gtFGAfBJz0zN62N+aa/aJimd9rjaOjMlhy8+kglcriZrce89HuKkEeR+6ueO9q4aBip9hZuNgiCDJ
	mLcZqrzbsMQyZOetQRutRDp3Z088fYNgpTThInzIbrAmvOopy+Zcg2R1MkK+8C3BQq6wxr0ywOsIs
	qYYikB6qH5UfEIK782/TeVEi6lbHE+AIh0OPcMvWlFLQMWXqj69WIEQ16K+LRhnHzJoHxyaH0wIS1
	kICf4jaUZdfiNSP5YEvkLva/vYyxV/lbkOm3euzE+nyX2MjIN4ZyaiZm87qoEQK0rdlYBgrrRaPkx
	A6ND3ung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgTi-0000000DqpW-3sWz;
	Mon, 22 Dec 2025 14:01:38 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgTf-0000000Dqp8-3T6m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 14:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766412096; x=1797948096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wp17uf/NJabCfUCLc1IpO5wTok9bWrA7bqCVHm4elRk=;
  b=aQmiWOTzk9QI94Io7UIxUSNWSwKdpWFgP02CPJgdNKBrv4mX7+VF/Ab1
   DVSE/50TCDloDwxZlLFvWknt66ziI2gyw/TkS/z9g0HVQpcee+/KQYwDc
   DIugga2fZ0n6dLoku3JWujjeT3ylv+UvzAjLlX1rIpmgYT09veburt1DK
   /jqLgpQ67E7i5PrSus/BMh7txX4A/5Km/66Wana23f1+MzztJWSOGfjXU
   JzQjdNjl1f5VOcyPCDmz2Otx81Qz3rS+V13pa8kZYPQabPg5jcpQKqY5M
   X2f+iMAdcO8jRnnMUiWHzcrpnacah46sqPmFVcdy4yXca9IwkMhtjtvne
   A==;
X-CSE-ConnectionGUID: DlGE00M4QoetcC+P6EZEOQ==
X-CSE-MsgGUID: LHjMeOwDSgSILmOk+qBrSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90925830"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="90925830"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:01:34 -0800
X-CSE-ConnectionGUID: TgGs18ijTVOcAHCpEOwJZw==
X-CSE-MsgGUID: EmaKGdW/SW2cz0rq7A1G/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204054521"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2025 06:01:29 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgTX-000000000er-0Umd;
	Mon, 22 Dec 2025 14:01:27 +0000
Date: Mon, 22 Dec 2025 22:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
Message-ID: <202512222137.rpXOEE5p-lkp@intel.com>
References: <20251219053658.84978-6-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219053658.84978-6-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_060135_936681_C8D99ED4 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, oe-kbuild-all@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Barry,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc2 next-20251219]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/arm64-Provide-dcache_by_myline_op_nosync-helper/20251219-195810
base:   linus/master
patch link:    https://lore.kernel.org/r/20251219053658.84978-6-21cnbao%40gmail.com
patch subject: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if supported by the arch
config: x86_64-randconfig-161-20251222 (https://download.01.org/0day-ci/archive/20251222/202512222137.rpXOEE5p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222137.rpXOEE5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222137.rpXOEE5p-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/dma/direct.c: In function 'dma_direct_unmap_sg':
>> kernel/dma/direct.c:456:25: error: implicit declaration of function 'dma_direct_unmap_phys_batch_add'; did you mean 'dma_direct_unmap_phys'? [-Wimplicit-function-declaration]
     456 |                         dma_direct_unmap_phys_batch_add(dev, sg->dma_address,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         dma_direct_unmap_phys
   kernel/dma/direct.c: In function 'dma_direct_map_sg':
>> kernel/dma/direct.c:484:43: error: implicit declaration of function 'dma_direct_map_phys_batch_add'; did you mean 'dma_direct_map_phys'? [-Wimplicit-function-declaration]
     484 |                         sg->dma_address = dma_direct_map_phys_batch_add(dev, sg_phys(sg),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           dma_direct_map_phys


vim +456 kernel/dma/direct.c

   439	
   440	/*
   441	 * Unmaps segments, except for ones marked as pci_p2pdma which do not
   442	 * require any further action as they contain a bus address.
   443	 */
   444	void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
   445			int nents, enum dma_data_direction dir, unsigned long attrs)
   446	{
   447		struct scatterlist *sg;
   448		int i;
   449		bool need_sync = false;
   450	
   451		for_each_sg(sgl,  sg, nents, i) {
   452			if (sg_dma_is_bus_address(sg)) {
   453				sg_dma_unmark_bus_address(sg);
   454			} else {
   455				need_sync = true;
 > 456				dma_direct_unmap_phys_batch_add(dev, sg->dma_address,
   457						      sg_dma_len(sg), dir, attrs);
   458			}
   459		}
   460		if (need_sync && !dev_is_dma_coherent(dev))
   461			arch_sync_dma_batch_flush();
   462	}
   463	#endif
   464	
   465	int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
   466			enum dma_data_direction dir, unsigned long attrs)
   467	{
   468		struct pci_p2pdma_map_state p2pdma_state = {};
   469		struct scatterlist *sg;
   470		int i, ret;
   471		bool need_sync = false;
   472	
   473		for_each_sg(sgl, sg, nents, i) {
   474			switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(sg))) {
   475			case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
   476				/*
   477				 * Any P2P mapping that traverses the PCI host bridge
   478				 * must be mapped with CPU physical address and not PCI
   479				 * bus addresses.
   480				 */
   481				break;
   482			case PCI_P2PDMA_MAP_NONE:
   483				need_sync = true;
 > 484				sg->dma_address = dma_direct_map_phys_batch_add(dev, sg_phys(sg),
   485						sg->length, dir, attrs);
   486				if (sg->dma_address == DMA_MAPPING_ERROR) {
   487					ret = -EIO;
   488					goto out_unmap;
   489				}
   490				break;
   491			case PCI_P2PDMA_MAP_BUS_ADDR:
   492				sg->dma_address = pci_p2pdma_bus_addr_map(
   493					p2pdma_state.mem, sg_phys(sg));
   494				sg_dma_len(sg) = sg->length;
   495				sg_dma_mark_bus_address(sg);
   496				continue;
   497			default:
   498				ret = -EREMOTEIO;
   499				goto out_unmap;
   500			}
   501			sg_dma_len(sg) = sg->length;
   502		}
   503	
   504		if (need_sync && !dev_is_dma_coherent(dev))
   505			arch_sync_dma_batch_flush();
   506		return nents;
   507	
   508	out_unmap:
   509		dma_direct_unmap_sg(dev, sgl, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
   510		return ret;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37A1E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCn42v+2jOe26hy16k7HLSxZj7Eu3YxLgxdP6tcbbYc=; b=PQouoBZP+2j1qHH3UydfoNHCts
	/mpxfF1woNW2CLFXz5WvVsJJ9Q/Iw4fL5f12k6leDnaY2aSfBBdFhGmy+a3bQrvxtvMBSGSVsKwmU
	0DwSt/MH2poJ0oUUes8/+taC7beqqeQ4zEx7suQeCD90vLKO+4yzMikc25z3/1ddIT88f9qs/8NE8
	PMfKE9YTYEOSVXSAg0mOEwlB1GUmjOY+QymwYwB3l4FgDpGsKBYsrhgElYYv1xLT+OrAzkMJLzpGL
	tWfTsFx+41YtrJU1ETnNyOfwlF9yBt/in409GGtsc3AhVdmLttgDRcIDmYvlmpVco3ocm2PCKqmz2
	+2rQOazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXIgO-0000000CRAF-3me3;
	Sun, 21 Dec 2025 12:37:08 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXIgM-0000000CR9u-1Zup
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 12:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766320626; x=1797856626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iNUfmfk98vLZL6nr6qLf0jwKDEdudVCE8M1mCWujMMM=;
  b=j7A+f7Kz1nWfrwGoiEpVRJR4Njcb9pbnBVpVAau2AHeAfyNmGAgCbzTm
   FdkDCDPxE0O7vYyQYGNqfZCXCwQAfd3lSlrByhKEVN4BGoDJ8q3fLmo89
   f71B+H7rdLAI9qV0rpcS1Dd3G8GzFAKylwT/MgClFibTxRDzSLTwkMQt2
   4oMBEUxHGyOpI3ZY32EretggKkDoXKIzktDzK+QPBIlcYWBvY2rrOQreF
   BYdgl1LlWyVkVBWVYCoLBXMBcMf1sXPNdl5/FEgIZ9s6UuCIJMtBDowtl
   QYWTSAgwxTb0u/CGPlSD/T5TVDklr58f5AuA2gAyMCvpWEnExwIH1Ug+6
   g==;
X-CSE-ConnectionGUID: TxbzP7UzQ8CaUX3FzQRN4g==
X-CSE-MsgGUID: bbwOSVJfR0GRllNTz3agxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78842816"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78842816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:37:03 -0800
X-CSE-ConnectionGUID: aJuz4+Q5S6alXnVWm1dHbA==
X-CSE-MsgGUID: Og8hOjH2RgOk5R83AY9a6A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 04:37:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXIgD-0000000053I-2pUu;
	Sun, 21 Dec 2025 12:36:57 +0000
Date: Sun, 21 Dec 2025 13:36:16 +0100
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
Message-ID: <202512211320.LaiSSLAc-lkp@intel.com>
References: <20251219053658.84978-6-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219053658.84978-6-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_043706_454171_F8D9DD1D 
X-CRM114-Status: GOOD (  11.35  )
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
[also build test ERROR on v6.19-rc1 next-20251219]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/arm64-Provide-dcache_by_myline_op_nosync-helper/20251219-195810
base:   linus/master
patch link:    https://lore.kernel.org/r/20251219053658.84978-6-21cnbao%40gmail.com
patch subject: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if supported by the arch
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512211320.LaiSSLAc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211320.LaiSSLAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211320.LaiSSLAc-lkp@intel.com/

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


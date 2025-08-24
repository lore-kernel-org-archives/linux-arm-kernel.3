Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAE0CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 07:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eF/lhKqEm8daT1VClrtbn1EvO7+vencC4AH629osHRg=; b=0YBr6WQihDPXo5uWkAgs7pIcIX
	yeDhz4udEKzZB/2K5kucxXl74qsFQ243HoGVvYHlORo3flNIY2kl43mD9uRTwbWmkIRhxTVNETBpr
	B4++MlrjyTyEOlv0rf2prBrZAN/lYhZ4UwTG7i+gqV120X9d2QjItS5G+PU3AtE7puseCNaOYkx/G
	YhSDX+JGaw9gkJNvfpphPNr1gM6/OelkrBJSODvSoDVVZaxpZHcYg7LlA0EzDwr/4yB7NLJb7yYX2
	E309bA7Z9AnmlVknBneq10dtYbGcLRKHiOV1agOm42b++6FASAhL66BiU+Ve0uSfG+do4X5M6PwdO
	ecYRG94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4ma-00000005o4w-0VR9;
	Sun, 24 Aug 2025 07:04:52 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4jw-00000005nzd-3vg8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 07:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756018929; x=1787554929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yL0lGPAOO93gDrZ7xJMIvQXzfdJ9VVCP89jSwd6gbDw=;
  b=WeV+ktTWrOn/G/YrZQOlJmg31AVOfhpRqTohcjd9wifknRfWuqqBSxEz
   yTv+eBQqsBQ2Siu4S770u6ywKT67aXt4whDSaOfRabPkb23EZwOkaWr3u
   RvIslGrzjTZ4P4s5wYvGvaCruvtxCyfclkGq4aPGDZqoE+cqmQFuPMXyE
   dYfEkfO72US8zNd808QwKTlSv23OsWvW8PFC2DYidw+8HfGLKL10Qqn/a
   Ykz+kwyiN/NPI+gFEXWtkznutGtfF3AdfVIUD5lUnohKufp07gRBT2tBy
   ZkiQ4ZVxvOccJiQK/kaxOYQkj1YFeGXbmMlGOa9CU0aXXr9BtsJXBTTsq
   g==;
X-CSE-ConnectionGUID: um7erHvVTl+mKnmSwlSE/Q==
X-CSE-MsgGUID: x6hesidjS22vfiVAk7ATzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68531097"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68531097"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 00:02:05 -0700
X-CSE-ConnectionGUID: ib3gjzHqQGKXPhM7YT4g6g==
X-CSE-MsgGUID: 0Lahs1t0TuaDcAFWmlTz8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168952862"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Aug 2025 00:02:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq4jm-000MqZ-0Q;
	Sun, 24 Aug 2025 07:01:58 +0000
Date: Sun, 24 Aug 2025 15:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/14] dmaengine: dma350: Support dma-channel-mask
Message-ID: <202508241415.b7kiTLel-lkp@intel.com>
References: <20250823154009.25992-10-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823154009.25992-10-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_000209_043492_9CCFF448 
X-CRM114-Status: GOOD (  17.34  )
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

Hi Jisheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dmaengine-dma350-Fix-CH_CTRL_USESRCTRIGIN-definition/20250824-000425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250823154009.25992-10-jszhang%40kernel.org
patch subject: [PATCH 09/14] dmaengine: dma350: Support dma-channel-mask
config: arm64-randconfig-002-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241415.b7kiTLel-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241415.b7kiTLel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241415.b7kiTLel-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/arm-dma350.c: In function 'd350_probe':
>> drivers/dma/arm-dma350.c:620:61: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
     620 |                 snprintf(ch_irqname, sizeof(ch_irqname), "ch%d", i);
         |                                                             ^~
   drivers/dma/arm-dma350.c:620:58: note: directive argument in the range [0, 2147483646]
     620 |                 snprintf(ch_irqname, sizeof(ch_irqname), "ch%d", i);
         |                                                          ^~~~~~
   drivers/dma/arm-dma350.c:620:17: note: 'snprintf' output between 4 and 13 bytes into a destination of size 8
     620 |                 snprintf(ch_irqname, sizeof(ch_irqname), "ch%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +620 drivers/dma/arm-dma350.c

   531	
   532	static int d350_probe(struct platform_device *pdev)
   533	{
   534		struct device *dev = &pdev->dev;
   535		struct d350 *dmac;
   536		void __iomem *base;
   537		u32 reg, dma_chan_mask;
   538		int ret, nchan, dw, aw, r, p;
   539		bool coherent, memset;
   540	
   541		base = devm_platform_ioremap_resource(pdev, 0);
   542		if (IS_ERR(base))
   543			return PTR_ERR(base);
   544	
   545		reg = readl_relaxed(base + DMAINFO + IIDR);
   546		r = FIELD_GET(IIDR_VARIANT, reg);
   547		p = FIELD_GET(IIDR_REVISION, reg);
   548		if (FIELD_GET(IIDR_IMPLEMENTER, reg) != IMPLEMENTER_ARM ||
   549		    FIELD_GET(IIDR_PRODUCTID, reg) != PRODUCTID_DMA350)
   550			return dev_err_probe(dev, -ENODEV, "Not a DMA-350!");
   551	
   552		reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG0);
   553		nchan = FIELD_GET(DMA_CFG_NUM_CHANNELS, reg) + 1;
   554		dw = 1 << FIELD_GET(DMA_CFG_DATA_WIDTH, reg);
   555		aw = FIELD_GET(DMA_CFG_ADDR_WIDTH, reg) + 1;
   556	
   557		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
   558		coherent = device_get_dma_attr(dev) == DEV_DMA_COHERENT;
   559	
   560		dmac = devm_kzalloc(dev, struct_size(dmac, channels, nchan), GFP_KERNEL);
   561		if (!dmac)
   562			return -ENOMEM;
   563	
   564		dmac->nchan = nchan;
   565	
   566		/* Enable all channels by default */
   567		dma_chan_mask = nchan - 1;
   568	
   569		ret = of_property_read_u32(dev->of_node, "dma-channel-mask", &dma_chan_mask);
   570		if (ret < 0 && (ret != -EINVAL)) {
   571			dev_err(&pdev->dev, "dma-channel-mask is not complete.\n");
   572			return ret;
   573		}
   574	
   575		reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
   576		dmac->nreq = FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
   577	
   578		dev_dbg(dev, "DMA-350 r%dp%d with %d channels, %d requests\n", r, p, dmac->nchan, dmac->nreq);
   579	
   580		dmac->dma.dev = dev;
   581		for (int i = min(dw, 16); i > 0; i /= 2) {
   582			dmac->dma.src_addr_widths |= BIT(i);
   583			dmac->dma.dst_addr_widths |= BIT(i);
   584		}
   585		dmac->dma.directions = BIT(DMA_MEM_TO_MEM);
   586		dmac->dma.descriptor_reuse = true;
   587		dmac->dma.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
   588		dmac->dma.device_alloc_chan_resources = d350_alloc_chan_resources;
   589		dmac->dma.device_free_chan_resources = d350_free_chan_resources;
   590		dma_cap_set(DMA_MEMCPY, dmac->dma.cap_mask);
   591		dmac->dma.device_prep_dma_memcpy = d350_prep_memcpy;
   592		dmac->dma.device_pause = d350_pause;
   593		dmac->dma.device_resume = d350_resume;
   594		dmac->dma.device_terminate_all = d350_terminate_all;
   595		dmac->dma.device_synchronize = d350_synchronize;
   596		dmac->dma.device_tx_status = d350_tx_status;
   597		dmac->dma.device_issue_pending = d350_issue_pending;
   598		INIT_LIST_HEAD(&dmac->dma.channels);
   599	
   600		/* Would be nice to have per-channel caps for this... */
   601		memset = true;
   602		for (int i = 0; i < nchan; i++) {
   603			struct d350_chan *dch = &dmac->channels[i];
   604			char ch_irqname[8];
   605	
   606			/* skip for reserved channels */
   607			if (!test_bit(i, (unsigned long *)&dma_chan_mask))
   608				continue;
   609	
   610			dch->coherent = coherent;
   611			dch->base = base + DMACH(i);
   612			writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
   613	
   614			reg = readl_relaxed(dch->base + CH_BUILDCFG1);
   615			if (!(FIELD_GET(CH_CFG_HAS_CMDLINK, reg))) {
   616				dev_warn(dev, "No command link support on channel %d\n", i);
   617				continue;
   618			}
   619	
 > 620			snprintf(ch_irqname, sizeof(ch_irqname), "ch%d", i);
   621			dch->irq = platform_get_irq_byname(pdev, ch_irqname);
   622			if (dch->irq < 0)
   623				return dch->irq;
   624	
   625			dch->has_wrap = FIELD_GET(CH_CFG_HAS_WRAP, reg);
   626			dch->has_trig = FIELD_GET(CH_CFG_HAS_TRIGIN, reg) &
   627					FIELD_GET(CH_CFG_HAS_TRIGSEL, reg);
   628	
   629			/* Fill is a special case of Wrap */
   630			memset &= dch->has_wrap;
   631	
   632			reg = readl_relaxed(dch->base + CH_BUILDCFG0);
   633			dch->tsz = FIELD_GET(CH_CFG_DATA_WIDTH, reg);
   634	
   635			reg = FIELD_PREP(CH_LINK_SHAREATTR, coherent ? SHAREATTR_ISH : SHAREATTR_OSH);
   636			reg |= FIELD_PREP(CH_LINK_MEMATTR, coherent ? MEMATTR_WB : MEMATTR_NC);
   637			writel_relaxed(reg, dch->base + CH_LINKATTR);
   638	
   639			dch->vc.desc_free = d350_desc_free;
   640			vchan_init(&dch->vc, &dmac->dma);
   641		}
   642	
   643		if (memset) {
   644			dma_cap_set(DMA_MEMSET, dmac->dma.cap_mask);
   645			dmac->dma.device_prep_dma_memset = d350_prep_memset;
   646		}
   647	
   648		platform_set_drvdata(pdev, dmac);
   649	
   650		ret = dmaenginem_async_device_register(&dmac->dma);
   651		if (ret)
   652			return dev_err_probe(dev, ret, "Failed to register DMA device\n");
   653	
   654		return of_dma_controller_register(dev->of_node, of_dma_xlate_by_chan_id, &dmac->dma);
   655	}
   656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


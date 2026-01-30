Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5AEE6BF35
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9nH+Xqhr4iOoMC9wV5qutISo0uDGMocr4lJrpzNlto=; b=d197Z0hDg0Nz+jQAbAWEAMiP5f
	mIngN3V0zNYhgJaQv1E56qVdaLLelc9dUlIxPsu+eayeTCosDdJkjC1Jp2Ni0sPEOV9kfwMjHSZJv
	qYym6FSNGX5hOTi4rZRu1/EeaOd1MRc13vAJ3WgjEMJgDbZZ+IstvMaCBZ42uPYkQNKXXzeAiSUkC
	HKJkaOF73tstSZkx1hhyLLAuPygPkpdxkQE0lIAfZ5LOAKFeFDM0m72uzxhbKinLY+koTdF6t9cVn
	WJ1A2IpKZBDyEyfEVy8TmrPWcp+uDsckJ9osU9tjuBd9fCyTBVFj2fHxFoHDCLfBqV/IFfDCjQo/O
	IEKcGK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vltQ2-00000001qmr-27eV;
	Fri, 30 Jan 2026 18:40:34 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vltPz-00000001qmW-1RlW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 18:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769798431; x=1801334431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tdYUurL5ykgqzwtJvM1Vb/0AXGJhvoo4rsvBT1P9Wfs=;
  b=c5SJmIJGn7d8rSzXkM70rByU4E196hqKmzL2TeEnf51JsTPmAtRVLUSd
   l9r41icctYOcwhzKDfuU+XYuL2JIhUHzRP+2A7gW6sai+BAY7ibTLeXOI
   yMizKchi0ESnxtOZdtIbm344NaxdDQe2t+6WPsxc9UpuiGLJVT8U8kXb1
   k13uGeQRQoEC2YvFFKiSbFSeyYcT77ty/qQTD+yMfMS+6XoyVq68jogvJ
   tHDYqdrxgPsv+nZCUbebSavGWuqmlLZ6CSEFVQ+xcbiskY22HyIIbjA21
   1zQoPFckzeCZdhf8j2PvNbgdJ0gOHeabPBn6x4FM3C0xLgA5tSmxcWitO
   A==;
X-CSE-ConnectionGUID: FRGpQRy5RHauN3iNQ67CXQ==
X-CSE-MsgGUID: qrc8Xo79QGqBPXqpPK8vYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70255714"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="70255714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 10:40:28 -0800
X-CSE-ConnectionGUID: Ph0KVDZSTo2PUpRjqqCdLA==
X-CSE-MsgGUID: j46FwpDzTFO/aiIoMrR87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213421699"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jan 2026 10:40:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vltPq-00000000dEI-015O;
	Fri, 30 Jan 2026 18:40:22 +0000
Date: Sat, 31 Jan 2026 02:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	vigneshr@ti.com
Cc: oe-kbuild-all@lists.linux.dev, r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v4 11/19] drivers: soc: ti: k3-ringacc: handle absence of
 tisci
Message-ID: <202601310246.hIZd2WuJ-lkp@intel.com>
References: <20260130110159.359501-12-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130110159.359501-12-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_104031_424008_1259B165 
X-CRM114-Status: GOOD (  15.52  )
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

Hi Sai,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on next-20260129]
[cannot apply to linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Sree-Kartheek-Adivi/dmaengine-ti-k3-udma-move-macros-to-header-file/20260130-191306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260130110159.359501-12-s-adivi%40ti.com
patch subject: [PATCH v4 11/19] drivers: soc: ti: k3-ringacc: handle absence of tisci
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260131/202601310246.hIZd2WuJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310246.hIZd2WuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310246.hIZd2WuJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/soc/ti/k3-ringacc.c:17:
>> include/linux/soc/ti/ti_sci_inta_msi.h:17:43: warning: 'struct msi_domain_info' declared inside parameter list will not be visible outside of this definition or declaration
      17 |                                    struct msi_domain_info *info,
         |                                           ^~~~~~~~~~~~~~~
   drivers/soc/ti/k3-ringacc.c: In function 'k3_ringacc_init':
>> drivers/soc/ti/k3-ringacc.c:1506:17: error: 'struct dev_msi_info' has no member named 'domain'
    1506 |         dev->msi.domain = of_msi_get_domain(dev, dev->of_node,
         |                 ^
   drivers/soc/ti/k3-ringacc.c:1508:22: error: 'struct dev_msi_info' has no member named 'domain'
    1508 |         if (!dev->msi.domain)
         |                      ^
--
   In file included from k3-ringacc.c:17:
>> include/linux/soc/ti/ti_sci_inta_msi.h:17:43: warning: 'struct msi_domain_info' declared inside parameter list will not be visible outside of this definition or declaration
      17 |                                    struct msi_domain_info *info,
         |                                           ^~~~~~~~~~~~~~~
   k3-ringacc.c: In function 'k3_ringacc_init':
   k3-ringacc.c:1506:17: error: 'struct dev_msi_info' has no member named 'domain'
    1506 |         dev->msi.domain = of_msi_get_domain(dev, dev->of_node,
         |                 ^
   k3-ringacc.c:1508:22: error: 'struct dev_msi_info' has no member named 'domain'
    1508 |         if (!dev->msi.domain)
         |                      ^


vim +1506 drivers/soc/ti/k3-ringacc.c

95e7be062aea6d Grygorii Strashko  2020-09-11  1497  
40a2a7c395cf5d Grygorii Strashko  2020-07-24  1498  static int k3_ringacc_init(struct platform_device *pdev,
40a2a7c395cf5d Grygorii Strashko  2020-07-24  1499  			   struct k3_ringacc *ringacc)
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1500  {
95e7be062aea6d Grygorii Strashko  2020-09-11  1501  	const struct soc_device_attribute *soc;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1502  	void __iomem *base_fifo, *base_rt;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1503  	struct device *dev = &pdev->dev;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1504  	int ret, i;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1505  
34fff62827b254 Thomas Gleixner    2021-12-10 @1506  	dev->msi.domain = of_msi_get_domain(dev, dev->of_node,
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1507  					    DOMAIN_BUS_TI_SCI_INTA_MSI);
e50a76355c1d85 Jayesh Choudhary   2023-07-28  1508  	if (!dev->msi.domain)
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1509  		return -EPROBE_DEFER;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1510  
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1511  	ret = k3_ringacc_probe_dt(ringacc);
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1512  	if (ret)
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1513  		return ret;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1514  
95e7be062aea6d Grygorii Strashko  2020-09-11  1515  	soc = soc_device_match(k3_ringacc_socinfo);
95e7be062aea6d Grygorii Strashko  2020-09-11  1516  	if (soc && soc->data) {
95e7be062aea6d Grygorii Strashko  2020-09-11  1517  		const struct k3_ringacc_soc_data *soc_data = soc->data;
95e7be062aea6d Grygorii Strashko  2020-09-11  1518  
95e7be062aea6d Grygorii Strashko  2020-09-11  1519  		ringacc->dma_ring_reset_quirk = soc_data->dma_ring_reset_quirk;
95e7be062aea6d Grygorii Strashko  2020-09-11  1520  	}
95e7be062aea6d Grygorii Strashko  2020-09-11  1521  
f9dbb99748bab0 Zhang Zekun        2023-08-09  1522  	base_rt = devm_platform_ioremap_resource_byname(pdev, "rt");
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1523  	if (IS_ERR(base_rt))
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1524  		return PTR_ERR(base_rt);
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1525  
f9dbb99748bab0 Zhang Zekun        2023-08-09  1526  	base_fifo = devm_platform_ioremap_resource_byname(pdev, "fifos");
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1527  	if (IS_ERR(base_fifo))
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1528  		return PTR_ERR(base_fifo);
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1529  
f9dbb99748bab0 Zhang Zekun        2023-08-09  1530  	ringacc->proxy_gcfg = devm_platform_ioremap_resource_byname(pdev, "proxy_gcfg");
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1531  	if (IS_ERR(ringacc->proxy_gcfg))
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1532  		return PTR_ERR(ringacc->proxy_gcfg);
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1533  
f9dbb99748bab0 Zhang Zekun        2023-08-09  1534  	ringacc->proxy_target_base = devm_platform_ioremap_resource_byname(pdev,
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1535  									   "proxy_target");
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1536  	if (IS_ERR(ringacc->proxy_target_base))
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1537  		return PTR_ERR(ringacc->proxy_target_base);
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1538  
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1539  	ringacc->num_proxies = readl(&ringacc->proxy_gcfg->config) &
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1540  				     K3_RINGACC_PROXY_CFG_THREADS_MASK;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1541  
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1542  	ringacc->rings = devm_kzalloc(dev,
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1543  				      sizeof(*ringacc->rings) *
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1544  				      ringacc->num_rings,
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1545  				      GFP_KERNEL);
a8eba8dde5fbf0 Christophe JAILLET 2021-12-23  1546  	ringacc->rings_inuse = devm_bitmap_zalloc(dev, ringacc->num_rings,
a8eba8dde5fbf0 Christophe JAILLET 2021-12-23  1547  						  GFP_KERNEL);
a8eba8dde5fbf0 Christophe JAILLET 2021-12-23  1548  	ringacc->proxy_inuse = devm_bitmap_zalloc(dev, ringacc->num_proxies,
a8eba8dde5fbf0 Christophe JAILLET 2021-12-23  1549  						  GFP_KERNEL);
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1550  
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1551  	if (!ringacc->rings || !ringacc->rings_inuse || !ringacc->proxy_inuse)
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1552  		return -ENOMEM;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1553  
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1554  	for (i = 0; i < ringacc->num_rings; i++) {
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1555  		ringacc->rings[i].rt = base_rt +
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1556  				       K3_RINGACC_RT_REGS_STEP * i;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1557  		ringacc->rings[i].fifos = base_fifo +
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1558  					  K3_RINGACC_FIFO_REGS_STEP * i;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1559  		ringacc->rings[i].parent = ringacc;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1560  		ringacc->rings[i].ring_id = i;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1561  		ringacc->rings[i].proxy_id = K3_RINGACC_PROXY_NOT_USED;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1562  	}
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1563  
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1564  	ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1565  
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1566  	dev_info(dev, "Ring Accelerator probed rings:%u, gp-rings[%u,%u] sci-dev-id:%u\n",
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1567  		 ringacc->num_rings,
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1568  		 ringacc->rm_gp_range->desc[0].start,
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1569  		 ringacc->rm_gp_range->desc[0].num,
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1570  		 ringacc->tisci_dev_id);
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1571  	dev_info(dev, "dma-ring-reset-quirk: %s\n",
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1572  		 ringacc->dma_ring_reset_quirk ? "enabled" : "disabled");
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1573  	dev_info(dev, "RA Proxy rev. %08x, num_proxies:%u\n",
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1574  		 readl(&ringacc->proxy_gcfg->revision), ringacc->num_proxies);
40a2a7c395cf5d Grygorii Strashko  2020-07-24  1575  
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1576  	return 0;
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1577  }
3277e8aa2504d9 Grygorii Strashko  2020-01-15  1578  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A86C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 03:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lvy/dP/dYUGfjnu2QCfMUtLvYzUpcN/CIXYL8YpDYrI=; b=xvUGJBvQKY8x/p0LoWEhDFujvw
	iaRL6lv0Ex8HQbvnfP8m3NbFuav2plrRaErQroTOYIeQpKBKdtZgkvmGFdLXd4mf06Oaw4uKHmFTx
	m2G+GpkbVwrIEJeVz7UatX1hYyZyZ/bi3dlbrdCUeiEWitimOTKcFB5M9d5ba3O3cil3bX6/IS2Zz
	JX0oP6/fWo+fF9Nzk5FVsrZPzCAphtd+YtXiRc7Qs08+ICKArSSeRS5vHfDJGOxToNwRbwc6kfHAY
	AMLwZhr/DvC4OjsgWPm8lHOAFTkyIysVV7NSxUA6X+Sl+8kW3JIgJ0sNASvMqCrDZZdidyO326rxs
	glDpiMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvpnt-0000000Gmkn-3HVI;
	Sat, 22 Mar 2025 03:45:45 +0000
Received: from [198.175.65.9] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvpmD-0000000GmgC-2P8G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 03:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742615042; x=1774151042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Xm4tlSMtMO60gV3x8fi5XUT7H975ov/B5iwJWBR6wo=;
  b=XUnqshnNKrEuT4dVm/XCQdYlr8ERKRGTas3o8I/HUVwEQheJqF/l7XUt
   +7PldxsNwvA4gNc4veQYQaUM8+loCnGQboB50pNIffioJYPO8yfApmq4d
   XVB4MB5NvEFwUHmIq5CgTpDZCQX/OwDh1kTpUqLhGlrXIQr5x2hdTuQoE
   8hTwN8teKVJKgHd5KR5k9uA5+F8emBavvOlRdSayUoP4YDxi2bGjOFj5a
   YhOHa+P7U1Rwt5AoWhKN5i5TNOUOMyCx5IrKjrifZg37/S0NhFTwR2W8B
   NagUpJ8/ZZ0z2D3r/ubbFbR7sgfJzx5WRz5QkNhOKclVMlsyuzIbrBEo7
   Q==;
X-CSE-ConnectionGUID: NGGd8IXqSjiQ3q07GZ0lkQ==
X-CSE-MsgGUID: z3Xz/iPFSjmfthnztYCgeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66352145"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="66352145"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 20:43:56 -0700
X-CSE-ConnectionGUID: zrb3K/ueTo6o1R4CxBZKgQ==
X-CSE-MsgGUID: voPuKtqzQ4eQEFf0TYHb/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123275185"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2025 20:43:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvpm4-0001uZ-12;
	Sat, 22 Mar 2025 03:43:52 +0000
Date: Sat, 22 Mar 2025 11:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [arm-platforms:arm64/tlbi-range-hacks 12/17]
 drivers/pci/controller/pcie-apple.c:460:40: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202503221117.9esJe5iq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_204401_681269_244997D5 
X-CRM114-Status: GOOD (  10.36  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git arm64/tlbi-range-hacks
head:   89a08aa9682594d44c11df1b6e168e38bdb7f0c3
commit: b2817638e680079b58e1bf67c6d9fa1d5f48b636 [12/17] PCI: apple: Add T602x PCIe support
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20250322/202503221117.9esJe5iq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221117.9esJe5iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221117.9esJe5iq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-apple.c: In function 'apple_pcie_port_setup_irq':
>> drivers/pci/controller/pcie-apple.c:460:40: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     460 |                         writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
         |                                        ^~~~~~~~~~


vim +/FIELD_PREP +460 drivers/pci/controller/pcie-apple.c

   423	
   424	static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
   425	{
   426		struct fwnode_handle *fwnode = &port->np->fwnode;
   427		struct apple_pcie *pcie = port->pcie;
   428		unsigned int irq;
   429		u32 val = 0;
   430	
   431		/* FIXME: consider moving each interrupt under each port */
   432		irq = irq_of_parse_and_map(to_of_node(dev_fwnode(port->pcie->dev)),
   433					   port->idx);
   434		if (!irq)
   435			return -ENXIO;
   436	
   437		port->domain = irq_domain_create_linear(fwnode, 32,
   438							&apple_port_irq_domain_ops,
   439							port);
   440		if (!port->domain)
   441			return -ENOMEM;
   442	
   443		/* Disable all interrupts */
   444		writel_relaxed(~0, port->base + PORT_INTMSK);
   445		writel_relaxed(~0, port->base + PORT_INTSTAT);
   446		writel_relaxed(~0, port->base + PORT_LINKCMDSTS);
   447	
   448		irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
   449	
   450		/* Configure MSI base address */
   451		BUILD_BUG_ON(upper_32_bits(DOORBELL_ADDR));
   452		writel_relaxed(lower_32_bits(DOORBELL_ADDR),
   453			       port->base + pcie->hw->port_msiaddr);
   454		if (pcie->hw->port_msiaddr_hi)
   455			writel_relaxed(0, port->base + pcie->hw->port_msiaddr_hi);
   456	
   457		/* Enable MSIs, shared between all ports */
   458		if (pcie->hw->port_msimap) {
   459			for (int i = 0; i < pcie->nvecs; i++)
 > 460				writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
   461					       PORT_MSIMAP_ENABLE,
   462					       port->base + pcie->hw->port_msimap + 4 * i);
   463		} else {
   464			writel_relaxed(0, port->base + PORT_MSIBASE);
   465			val = ilog2(pcie->nvecs) << PORT_MSICFG_L2MSINUM_SHIFT;
   466		}
   467	
   468		writel_relaxed(val | PORT_MSICFG_EN, port->base + PORT_MSICFG);
   469		return 0;
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


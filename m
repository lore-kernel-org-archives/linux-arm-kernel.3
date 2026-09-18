Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA83FC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaMGt9BFpu489rQc8/jzH7aYQ1sxPEyAGw07jBPtujE=; b=HI81ncHDhFyl2Nw0CWHFPpm+fb
	ESpDD1mjhkbFfEZZZV4DzkjsaIN4UVEAwRlMuNdHYSqTPFgknn4CROtfNWBEpiSC/HUYP6c+Ffvtr
	KWW4KlMzKqD3h17OKdZvEw0J931D0NX5U+QjFM0D1s0+Ag9/l1Dljzvzj4BAyUOhoYGd8iwyT8OGZ
	LnSBOPSJo+5stwczbTWz9UwyR6/T9F4czwllcu+kYCUzXJQdLTiwYpow6dXDmZOl9wZ1LfMoJkZ8j
	HDlGy6vQUPNdKWKIMpuGdEonR7ZCuo1m4/pmdLut2KKMqXgu5nzvN9bsmborT18Na6YjIPuURU01X
	ywzG1m0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X6z-0000000EIRc-1kmI;
	Fri, 18 Sep 2026 11:50:37 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X6v-0000000EIR8-28nx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789732233; x=1821268233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M3PKuP+ZuLN2R57TyQdFDTeRL/N6gNhBhoZkvXSsgEw=;
  b=J+vMRqqyk3CFnbRZ0XhbQpVI9QuEmA6AxqCeFvi2LvgaFiAPllbJF0bC
   GUGmXQRCz4gDOGS8kXjJd0dxeo7Ss46xxrDKn27pcqoPiGY+5L9UQYrIM
   r0i2F2xUmYBcnHqG0JQJRjlSOPNnlr/wHRIFNjRczAPNeYNY8l9YnLIdp
   3tyWL33oKDAKxZDhJ3zuIiEW+vo1aUPbxrk54GSa7sYhAaNVQr5TlNzJk
   fTt6F5ptlAo1kSSyWCHjGDAs5w3xJss2zDx/aazLYDnQ/uOrF0nCJZEsB
   3X+fZJk/qdnCTpVQVqjUn23Q0KbqPGyJg7gmFKHiQTA+tGagA+eXq+SwX
   Q==;
X-CSE-ConnectionGUID: x9RW+wx0Q+GUaclEkPfvcw==
X-CSE-MsgGUID: FJ8jSedFQtK4KHpZloOmIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="90364727"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="90364727"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:50:32 -0700
X-CSE-ConnectionGUID: YjCwekh+Rg6Oe3AG//pnvw==
X-CSE-MsgGUID: E+S0OuYLSQ2n+eTUm+aEnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2597426"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 18 Sep 2026 04:50:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7X6o-000000009jx-2ZaJ;
	Fri, 18 Sep 2026 11:50:26 +0000
Date: Fri, 18 Sep 2026 19:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, Liviu.Dudau@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bhelgaas@google.com, kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lpieralisi@kernel.org, mani@kernel.org,
	robh@kernel.org, tinamdar@apm.com, toan@os.amperecomputing.com,
	Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: xgene: Fix device node reference leak in
 xgene_pcie_probe()
Message-ID: <202609181924.6ZUpd4Ww-lkp@intel.com>
References: <20260917132235.2153154-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917132235.2153154-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_045033_562730_C9188F80 
X-CRM114-Status: GOOD (  12.75  )
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

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.3-rc3 next-20260916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/PCI-xgene-Fix-device-node-reference-leak-in-xgene_pcie_probe/20260917-132235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260917132235.2153154-1-vulab%40iscas.ac.cn
patch subject: [PATCH] PCI: xgene: Fix device node reference leak in xgene_pcie_probe()
config: riscv-randconfig-1001-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181924.6ZUpd4Ww-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181924.6ZUpd4Ww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181924.6ZUpd4Ww-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pci-xgene.c:646:20: error: no member named 'node' in 'struct xgene_pcie'
     646 |         of_node_put(port->node);
         |                     ~~~~  ^
   1 error generated.


vim +646 drivers/pci/controller/pci-xgene.c

   603	
   604	static int xgene_pcie_probe(struct platform_device *pdev)
   605	{
   606		struct device *dev = &pdev->dev;
   607		struct xgene_pcie *port;
   608		struct pci_host_bridge *bridge;
   609		int ret;
   610	
   611		if (!xgene_check_pcie_msi_ready())
   612			return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
   613					     "MSI driver not ready\n");
   614	
   615		bridge = devm_pci_alloc_host_bridge(dev, sizeof(*port));
   616		if (!bridge)
   617			return -ENOMEM;
   618	
   619		port = pci_host_bridge_priv(bridge);
   620	
   621		port->dev = dev;
   622		port->version = XGENE_PCIE_IP_VER_1;
   623	
   624		ret = xgene_pcie_map_reg(port, pdev);
   625		if (ret)
   626			goto err_put_node;
   627	
   628		ret = xgene_pcie_init_port(port);
   629		if (ret)
   630			goto err_put_node;
   631	
   632		ret = xgene_pcie_setup(port);
   633		if (ret)
   634			goto err_put_node;
   635	
   636		bridge->sysdata = port;
   637		bridge->ops = &xgene_pcie_ops;
   638	
   639		ret = pci_host_probe(bridge);
   640		if (ret)
   641			goto err_put_node;
   642	
   643		return 0;
   644	
   645	err_put_node:
 > 646		of_node_put(port->node);
   647		return ret;
   648	}
   649	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


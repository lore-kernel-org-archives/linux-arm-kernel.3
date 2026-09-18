Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2830FC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXQEE8318vjjNu041xr6WT9AxYPOlmK+me5FXm66n+Y=; b=YVn4oHj1YzagvNyrPZcgQEdcc9
	SU7lUzUKcW7famPOkbhTdRPW/zo6EKkIUH7OKMGgspiON1MQPf35tzqWNZ4mcFEGOEvZY1L0xO6HQ
	htb+QvO1TMKlTdUxhPGDKyH6huQ9yRWKHtrDalzU0lbmwJzicJYBfNVvONkejE64pLm3kTwGIBRZj
	qC1gOswgvnjwL1zgNZIbPQ02YDObUHH1CGMKmXxzTIrb56vV5MbSuYcFgtxr9Wn/d0lMa/lU1hWrG
	qmcNwDwINCTgImm+1HY8hqpHA5XHejaLuiH+rtOFHKK09MSYlU1zCrQ3m0hdyp6P3FWml1IoUcBxj
	D4p9or3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Xre-0000000EO8p-0KUT;
	Fri, 18 Sep 2026 12:38:50 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Xrb-0000000EO8B-07nj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789735127; x=1821271127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v0D30XdnWAvAbeRE19PhPRcH4pTMxxvHgKyrSnCkpXg=;
  b=DP929awrBjWZete7t/W5V2AQ/DHUDlx+sGfi3WTuPV88V4BWvPQqZ4k7
   Wxq9h+eRyOlrqq8QdRItHzPaysJcQoxOujGtDr9TcUlWMwKKDP2uDTd2P
   sohbps+vJRwrOAw1SHOR5aocVkQsvGSrUUIcnMRon8jx0xNcEtg7VdRrZ
   K3Y7K7tLtr/mO/T3g3dkSZ+3Mrt6F3QpeqEwX4s591I7ZWD3YKD4nNDX4
   W8aEyJq9+f6uhgsw3HIh6JLERj7WoyYhs7qnQw025z1nk6zWNw1nNy01n
   F7L5xAVo7ee9a7QuH0Ajp/jHJy64bpC5iycV2u8uCicxWFeWF+jRvvlDG
   A==;
X-CSE-ConnectionGUID: Q6XaAAxbQg+W0YTnF19PTg==
X-CSE-MsgGUID: 4coV2EfETQeO5YkmDhzFHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="107739673"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="107739673"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 05:38:46 -0700
X-CSE-ConnectionGUID: 5tt/Sdj0Q+OaHZQR6fQV3A==
X-CSE-MsgGUID: cpPK04BwS6qDYCxotWmOmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271061162"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 05:38:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7XrK-000000009mn-2qP8;
	Fri, 18 Sep 2026 12:38:30 +0000
Date: Fri, 18 Sep 2026 20:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, Liviu.Dudau@arm.com
Cc: oe-kbuild-all@lists.linux.dev, bhelgaas@google.com,
	kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org,
	tinamdar@apm.com, toan@os.amperecomputing.com,
	Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: xgene: Fix device node reference leak in
 xgene_pcie_probe()
Message-ID: <202609182039.WWGUVgS7-lkp@intel.com>
References: <20260917132235.2153154-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917132235.2153154-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_053847_107622_1BB94F79 
X-CRM114-Status: GOOD (  12.21  )
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260918/202609182039.WWGUVgS7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609182039.WWGUVgS7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609182039.WWGUVgS7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pci-xgene.c: In function 'xgene_pcie_probe':
>> drivers/pci/controller/pci-xgene.c:646:25: error: 'struct xgene_pcie' has no member named 'node'
     646 |         of_node_put(port->node);
         |                         ^~


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


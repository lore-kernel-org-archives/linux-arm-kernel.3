Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEB5FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIbjCE0idFNBR5tGNRNYR/3Jjpca3sCK/SdaxOg55ds=; b=C8iAXpTWLsGJODKZeuk82qvyGd
	KpZ8fzR/ICbVyLkFAI9+M75vsBMsHL56bgd43xjyk42S99SYBrWI7q+pV1PAYsz6HZdodhyL29oiz
	PY/WMSFxXFmrxkoVRgU/Yb2JtiiMgOeT6rMl3IWCt8wKy33fE8aeVjVWXnvuqw+r+F7+1QTtnMC+A
	a2bmjW7J3VODcv/pfHP5DxjBJdf9wyrknmAarewZsvLhPKlkZ8+I+G+wTheJoln219bYq5chRv4zP
	YJk5MwVg/1yLw4hSrw/HhhZYeRYwhSDY4uib180X5R0/7asrMeYf88TrJidckRxXO6qG8crLOYqwZ
	mqD7yYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH0Kp-0000000Fbgi-19TM;
	Sun, 26 Apr 2026 14:19:47 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH0Km-0000000FbgJ-0mCi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 14:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777213184; x=1808749184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=URvyEJiznvxr1mg7MT1vmtVH/KoUn/kPWKJIrV3eitw=;
  b=JgtanguwmrJHv8obF0M+1ni4TcBckMitrZiN31ASi3fyGvylITVG6wwh
   4+Rv/3PvfCHvL+SHgsbjuTqtrkzZO/0/BdJ5pb/fjEfBrLueJLvzOOBY5
   GNIyRdBcczMH6gDvRrk3QV3+A9Nb3X19LsOds2ib1zooANPeFdSJJjhax
   QoaRf9aga0tD3GDFoNv7pQhFQ8BnN2YXSH4+PKbuj8Tgp6kyoOVRSABoi
   li4ByALFjs2N0xoYCXe8omKnc9d1uKUNpXtWr5xaVsmpA4Qi9SOZiU7i5
   xuTxNvW4szV7ZgIPr+uuJYU6UJ+vAFNFtejdVIn0e8jLiRhxOmStRpgdG
   w==;
X-CSE-ConnectionGUID: QqxfRqtyQWqeHnPrQO1DRQ==
X-CSE-MsgGUID: wgWnZY3ASJCj/3PQ0v+kpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78308282"
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="78308282"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 07:19:41 -0700
X-CSE-ConnectionGUID: ziOmEDTvSCe9EljfjscO9A==
X-CSE-MsgGUID: UdPkb92JS5m4WCwW7FbKag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="233683673"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Apr 2026 07:19:37 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wH0Kd-000000007wL-0HYX;
	Sun, 26 Apr 2026 14:19:35 +0000
Date: Sun, 26 Apr 2026 22:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] interconnect: imx: fix use-after-free in
 imx_icc_node_init_qos()
Message-ID: <202604262216.MLuzg6nl-lkp@intel.com>
References: <20260408153022.401123-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408153022.401123-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_071944_309669_29FEB8D6 
X-CRM114-Status: GOOD (  14.44  )
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

[auto build test ERROR on amd-pstate/linux-next]
[also build test ERROR on amd-pstate/bleeding-edge linus/master shawnguo/for-next v7.0 next-20260424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/interconnect-imx-fix-use-after-free-in-imx_icc_node_init_qos/20260424-225513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20260408153022.401123-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] interconnect: imx: fix use-after-free in imx_icc_node_init_qos()
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260426/202604262216.MLuzg6nl-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604262216.MLuzg6nl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604262216.MLuzg6nl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/interconnect/imx/imx.c:123:22: error: use of undeclared identifier '__free_device_nod'; did you mean '__free_device_node'?
     123 |         struct device_node *__free(device_nod) dn = of_parse_phandle(dev->of_node,
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^~~~~~~~~~~~~~
   <scratch space>:42:1: note: expanded from here
      42 | __free_device_nod
         | ^~~~~~~~~~~~~~~~~
   include/linux/of.h:138:1: note: '__free_device_node' declared here
     138 | DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
         | ^
   include/linux/cleanup.h:211:30: note: expanded from macro 'DEFINE_FREE'
     211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                     ^
   <scratch space>:227:1: note: expanded from here
     227 | __free_device_node
         | ^
   1 error generated.


vim +123 drivers/interconnect/imx/imx.c

   116	
   117	static int imx_icc_node_init_qos(struct icc_provider *provider,
   118					 struct icc_node *node)
   119	{
   120		struct imx_icc_node *node_data = node->data;
   121		const struct imx_icc_node_adj_desc *adj = node_data->desc->adj;
   122		struct device *dev = provider->dev;
 > 123		struct device_node *__free(device_nod) dn = of_parse_phandle(dev->of_node,
   124				adj->phandle_name, 0);
   125		struct platform_device *pdev;
   126	
   127		if (adj->main_noc) {
   128			node_data->qos_dev = dev;
   129			dev_dbg(dev, "icc node %s[%d] is main noc itself\n",
   130				node->name, node->id);
   131		} else {
   132			if (!dn) {
   133				dev_warn(dev, "Failed to parse %s\n",
   134					 adj->phandle_name);
   135				return -ENODEV;
   136			}
   137			/* Allow scaling to be disabled on a per-node basis */
   138			if (!of_device_is_available(dn)) {
   139				dev_warn(dev, "Missing property %s, skip scaling %s\n",
   140					 adj->phandle_name, node->name);
   141				return 0;
   142			}
   143	
   144			pdev = of_find_device_by_node(dn);
   145			if (!pdev) {
   146				dev_warn(dev, "node %s[%d] missing device for %pOF\n",
   147					 node->name, node->id, dn);
   148				return -EPROBE_DEFER;
   149			}
   150			node_data->qos_dev = &pdev->dev;
   151			dev_dbg(dev, "node %s[%d] has device node %pOF\n",
   152				node->name, node->id, dn);
   153		}
   154	
   155		return dev_pm_qos_add_request(node_data->qos_dev,
   156					      &node_data->qos_req,
   157					      DEV_PM_QOS_MIN_FREQUENCY, 0);
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


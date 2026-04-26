Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D906FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 05:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rPfFa1B1GbjH5KTkfI6ezIH4vvvFqQ/l+mQ1YCLh/A=; b=k+YEuyO0JYlNbaNYQWvYE/zY6F
	9OWAw3GtYjhD4nU7MbTRU2qKZAhnRfElaCX+Kh5maivWjbu37P123K3jkJl5h41ZDYWUo75L/Cwu6
	8DIzEPglOAEA4Nku5XFvmVttFJaf9+RSW4+fkgCXQH/CAYDhwDXWDSGmnAnrZii+9vMFyS/sSgOvd
	+4qHX+YYmi2PUVfPU4dCUfgdgajg/aA+Fdi3jpvA4PFBLoYUIJlPu7xF7ad+T/gAdGakWfCnOcY8B
	x7BFwGC8u+MHWfhBJdUAqot2roD1Je//nxBZtCBO+S9/h7J0rvYvx/XAzHejxfWol+j/W7Eg2eFIw
	bOdnUfSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGs6N-0000000FHP3-18CR;
	Sun, 26 Apr 2026 05:32:19 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGs6I-0000000FHOC-2gkU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 05:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777181534; x=1808717534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FZxW/0xc3tlPxseOGzaG8aEguh7TK5Jw7ofxFY9FK88=;
  b=XY0l489CfOyAu5+VMAtedeoNgUznohhrG7DLqU2rIMbWaC3TMIXcrStp
   0F7UN0/aD5q17ZzVfD0MRT6A8J2/KJTdj/IRvAhzOI8iPnR+vV69Zx2yu
   2FjgzxR0pXUO3u16D/ysQhuozkUYRcdvTRQ2pG3i5t77NFPPZEX7iV31W
   KXjFKhnzUIVznMPKC29spWXzJGSn+Uj6UresyhPFFM1eaawbcDxehzR8X
   OBMYx1QbqKHW2lslGTZynOPzDVumAgZwF3g/lLSNSRgv6PeRvfdz+QEmA
   v4xtUA/a2ecvPyX2rnzYQI1sAwtdPDGWLOOhJoPosiPiBC+dsnSaz71ax
   Q==;
X-CSE-ConnectionGUID: r3wyxG9+RjeYb1qtXUEUsA==
X-CSE-MsgGUID: FeW74CJhRwO8mRB7kAZzHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="65636109"
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="65636109"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 22:32:10 -0700
X-CSE-ConnectionGUID: uvJyIYwRSLK2wagYQHwDAg==
X-CSE-MsgGUID: Z8sWPRqgQIK9RunmgA3kRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="238323720"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2026 22:32:07 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGs69-000000007W5-04Xp;
	Sun, 26 Apr 2026 05:32:05 +0000
Date: Sun, 26 Apr 2026 13:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] interconnect: imx: fix use-after-free in
 imx_icc_node_init_qos()
Message-ID: <202604261347.QzG9r7Ym-lkp@intel.com>
References: <20260408153022.401123-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408153022.401123-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_223214_714521_3E22813F 
X-CRM114-Status: GOOD (  13.34  )
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
[also build test ERROR on amd-pstate/bleeding-edge linus/master v7.0 next-20260424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/interconnect-imx-fix-use-after-free-in-imx_icc_node_init_qos/20260424-225513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20260408153022.401123-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] interconnect: imx: fix use-after-free in imx_icc_node_init_qos()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260426/202604261347.QzG9r7Ym-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604261347.QzG9r7Ym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604261347.QzG9r7Ym-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/interconnect/imx/imx.c: In function 'imx_icc_node_init_qos':
>> drivers/interconnect/imx/imx.c:123:16: error: cleanup argument not a function
     123 |         struct device_node *__free(device_nod) dn = of_parse_phandle(dev->of_node,
         |                ^~~~~~~~~~~


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


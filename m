Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883E8D3C525
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 03:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iu78wGHteboqpTZeNCtdMLIRr+Kl3oBwlH06uoltjA=; b=g9yqlvf89z1BrSr6VvI0Zkf85a
	zP30c7mZjyCP15prlMuJJKpvl9sQo6Pf+yNP9hA4GbDmOO8QX54geXEBchvMcCTTGtTAUaHl0uPJC
	i40SBmsY9rB7HoxbxXUeTLK/CRhT8C1aolyPNVz/Y3Yc6TtQHrShNhftBFEOWpykbovvRMs65BzGT
	7YrqKN2kys4sZCWdIhAEVIMOupYoFEZstY0syxDB1xC8GchWqfb0597y5ya3ayIIr/Ucp0mwgkNo8
	3y3G96htVJc4FHtqYRt3ZdBMsO6qYAG+Mf/5UbjsRUuRsZ0hJxzs0vF0cmZdhJjKs+wxBhaWAZb/h
	jVJW19wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTAmq-0000000F3HM-3NBy;
	Wed, 10 Dec 2025 03:22:44 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTAmn-0000000F3H1-3Hgn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 03:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765336962; x=1796872962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sbK6QaAAL/wmX/O+pHRM7+O7HDJ2oB98YPlC02WA7ZY=;
  b=Wgu3Q87RMUciUKQaqHPzH2dihhvNHhFS/QyB7I8iUEsadkd5haQabcN0
   MXoGoMh8HfP9MREBtf0NWYJ8SihsngHQp42lcVijQ9+WVDpWkDwvwdEA8
   9tgh/e/g2GrDJjLs0i+jM0HtDulPaupPYASyfSESPtWfwQP1eq298Ry5e
   kIG9L/Xj/xLQZzhJa92/zjHFeHlP5fusbNzxl2n/qrUiD5WUIbpKXs0I6
   paT2zc74yUCd4GiSBgOX4624CeQ4Dg/3/zoONipZqH4eZOfUJbx/NhTBQ
   wlFt/vjP6n49Jg6EDxkmJnXqj+2gRAqal4YJ2RS4NmMiVdzo6yiYGgNsd
   A==;
X-CSE-ConnectionGUID: 29wG4u9ST0O7nWxAfwQpag==
X-CSE-MsgGUID: edfVGKr8ShGFupP9yw//Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70924156"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="70924156"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 19:22:40 -0800
X-CSE-ConnectionGUID: WYKkJPvESyiVYjKEhqmbCg==
X-CSE-MsgGUID: fLPQvF/0QWWiF2ZdVeX+ig==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Dec 2025 19:22:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTAmg-000000002bh-3uju;
	Wed, 10 Dec 2025 03:22:34 +0000
Date: Wed, 10 Dec 2025 11:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, ulf.hansson@linaro.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] pmdomain: imx: Fix reference count leak in
 imx_gpc_probe()
Message-ID: <202512101101.zAlerEtu-lkp@intel.com>
References: <20251209081909.24982-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209081909.24982-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_192241_917416_0FE63BD5 
X-CRM114-Status: GOOD (  14.69  )
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

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on linus/master v6.18 next-20251209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/pmdomain-imx-Fix-reference-count-leak-in-imx_gpc_probe/20251209-162152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20251209081909.24982-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] pmdomain: imx: Fix reference count leak in imx_gpc_probe()
config: arm-randconfig-003-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101101.zAlerEtu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101101.zAlerEtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101101.zAlerEtu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_probe':
>> drivers/pmdomain/imx/gpc.c:405:9: error: cleanup argument not a function
     struct device_node *pgc_node __free(pgc_node);
            ^~~~~~~~~~~


vim +405 drivers/pmdomain/imx/gpc.c

   401	
   402	static int imx_gpc_probe(struct platform_device *pdev)
   403	{
   404		const struct imx_gpc_dt_data *of_id_data = device_get_match_data(&pdev->dev);
 > 405		struct device_node *pgc_node __free(pgc_node);
   406		struct regmap *regmap;
   407		void __iomem *base;
   408		int ret;
   409	
   410		pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
   411	
   412		/* bail out if DT too old and doesn't provide the necessary info */
   413		if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
   414		    !pgc_node)
   415			return 0;
   416	
   417		base = devm_platform_ioremap_resource(pdev, 0);
   418		if (IS_ERR(base))
   419			return PTR_ERR(base);
   420	
   421		regmap = devm_regmap_init_mmio_clk(&pdev->dev, NULL, base,
   422						   &imx_gpc_regmap_config);
   423		if (IS_ERR(regmap)) {
   424			ret = PTR_ERR(regmap);
   425			dev_err(&pdev->dev, "failed to init regmap: %d\n",
   426				ret);
   427			return ret;
   428		}
   429	
   430		/*
   431		 * Disable PU power down by runtime PM if ERR009619 is present.
   432		 *
   433		 * The PRE clock will be paused for several cycles when turning on the
   434		 * PU domain LDO from power down state. If PRE is in use at that time,
   435		 * the IPU/PRG cannot get the correct display data from the PRE.
   436		 *
   437		 * This is not a concern when the whole system enters suspend state, so
   438		 * it's safe to power down PU in this case.
   439		 */
   440		if (of_id_data->err009619_present)
   441			imx_gpc_domains[GPC_PGC_DOMAIN_PU].base.flags |=
   442					GENPD_FLAG_RPM_ALWAYS_ON;
   443	
   444		/* Keep DISP always on if ERR006287 is present */
   445		if (of_id_data->err006287_present)
   446			imx_gpc_domains[GPC_PGC_DOMAIN_DISPLAY].base.flags |=
   447					GENPD_FLAG_ALWAYS_ON;
   448	
   449		if (!pgc_node) {
   450			ret = imx_gpc_old_dt_init(&pdev->dev, regmap,
   451						  of_id_data->num_domains);
   452			if (ret)
   453				return ret;
   454		} else {
   455			struct imx_pm_domain *domain;
   456			struct platform_device *pd_pdev;
   457			struct clk *ipg_clk;
   458			unsigned int ipg_rate_mhz;
   459			int domain_index;
   460	
   461			ipg_clk = devm_clk_get(&pdev->dev, "ipg");
   462			if (IS_ERR(ipg_clk))
   463				return PTR_ERR(ipg_clk);
   464			ipg_rate_mhz = clk_get_rate(ipg_clk) / 1000000;
   465	
   466			for_each_child_of_node_scoped(pgc_node, np) {
   467				ret = of_property_read_u32(np, "reg", &domain_index);
   468				if (ret)
   469					return ret;
   470	
   471				if (domain_index >= of_id_data->num_domains)
   472					continue;
   473	
   474				pd_pdev = platform_device_alloc("imx-pgc-power-domain",
   475								domain_index);
   476				if (!pd_pdev)
   477					return -ENOMEM;
   478	
   479				ret = platform_device_add_data(pd_pdev,
   480							       &imx_gpc_domains[domain_index],
   481							       sizeof(imx_gpc_domains[domain_index]));
   482				if (ret) {
   483					platform_device_put(pd_pdev);
   484					return ret;
   485				}
   486				domain = pd_pdev->dev.platform_data;
   487				domain->regmap = regmap;
   488				domain->ipg_rate_mhz = ipg_rate_mhz;
   489	
   490				pd_pdev->dev.parent = &pdev->dev;
   491				pd_pdev->dev.of_node = np;
   492				pd_pdev->dev.fwnode = of_fwnode_handle(np);
   493	
   494				ret = platform_device_add(pd_pdev);
   495				if (ret) {
   496					platform_device_put(pd_pdev);
   497					return ret;
   498				}
   499			}
   500		}
   501	
   502		return 0;
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


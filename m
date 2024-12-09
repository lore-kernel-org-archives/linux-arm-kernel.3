Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EBAE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGglwFIv01b8wGrl0iBK6pvsY5fvPF3nf4uI4mkWKWE=; b=Sk+4WC8VPB9ko4ClIe8NRXqSYA
	rjMJvdTcixfvWuUY5XcUi+kkmfUZMYoPMJ5HRVvPcDVt2HZ1fYPZoKA6Ih2ZsNECZBNSFURIj3Bgz
	9kRRNwBJ7I51Wu6e562VyjGbYJ9tyVbVKzi3d8Ft8DUuzE54H2IC8tQVAD334OF/1THYCWEYbS1m8
	J+zVOfZofqpTDP9k6u0rpWSYGGsGLsB+5Eygkk37qVCpsTyTOp451gjKTqWM3+SYtXNeeCMibIOAc
	+rnyEO0XXG5wsmYNT5XoHeQiHY+ZVCFSj+k17eSbcX1EOr8ooA5kMCC6SkQqjvGMaabuiF9sLcQJU
	2AtjNDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVZS-00000006QtE-2e8C;
	Mon, 09 Dec 2024 04:40:34 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVYP-00000006Qj3-2qKh;
	Mon, 09 Dec 2024 04:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719169; x=1765255169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WxSdxf8pLdMWv4fY9QRvr5Gkcta72PxtTHjRQUY08Xo=;
  b=W/PXr8M2yNW+LVxMDNLe//0FjvTQdsZi0/O+kJRk74qNLYcxiwbHrVS9
   u83W+qt3yqq+eaJH2tBfTTwIMEmUdFj3WFR9Gxu19Bp3RazTls1I39/SZ
   C4kvW5+RTo9ffh4n3a7HwDE1EqFdmyHmyKby/1P3SjTrB9PSd3uj/EE4i
   m6xu8EWdeanqMKh2BVqV308bZz/O7tkt9PggyQwxTjTxMitLuPjU5ldOV
   9ns+wsLCpSPttXcrwNUus+asc+yr6z/kc4qWWJ+mLjFEAdLtezPD5aa3X
   4ivIISbn+b84H+RcYfdMYxeL37qPhYzk/VIYUiDY57W0+Ug3Ies223rZK
   Q==;
X-CSE-ConnectionGUID: g2+KFTQ2QOK+SryBlFslAg==
X-CSE-MsgGUID: 2d4rEO1dRgGTzR9iaXOeDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37931437"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37931437"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:39:29 -0800
X-CSE-ConnectionGUID: eBVdfRJ/Qwq0407wVB29Vg==
X-CSE-MsgGUID: wjhdMOM7T+Ctp8wtjgcWgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95751895"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:39:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVYH-0003tF-0M;
	Mon, 09 Dec 2024 04:39:21 +0000
Date: Mon, 9 Dec 2024 12:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@airoha.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [net-next PATCH v10 8/9] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <202412081038.lJvmpuB2-lkp@intel.com>
References: <20241208002105.18074-9-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208002105.18074-9-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_203929_740862_4E3AC68D 
X-CRM114-Status: GOOD (  16.81  )
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-nvmem-Document-support-for-Airoha-AN8855-Switch-EFUSE/20241208-082533
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241208002105.18074-9-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v10 8/9] net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241208/202412081038.lJvmpuB2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412081038.lJvmpuB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081038.lJvmpuB2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/dsa/an8855.c: In function 'an8855_switch_probe':
>> drivers/net/dsa/an8855.c:2227:34: error: invalid use of undefined type 'struct platform_device'
    2227 |         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
         |                                  ^~
   drivers/net/dsa/an8855.c:2231:26: error: invalid use of undefined type 'struct platform_device'
    2231 |         priv->dev = &pdev->dev;
         |                          ^~
   drivers/net/dsa/an8855.c: In function 'an8855_switch_remove':
   drivers/net/dsa/an8855.c:2282:57: error: invalid use of undefined type 'struct platform_device'
    2282 |         struct an8855_priv *priv = dev_get_drvdata(&pdev->dev);
         |                                                         ^~
   drivers/net/dsa/an8855.c: At top level:
>> drivers/net/dsa/an8855.c:2295:15: error: variable 'an8855_switch_driver' has initializer but incomplete type
    2295 | static struct platform_driver an8855_switch_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/net/dsa/an8855.c:2296:10: error: 'struct platform_driver' has no member named 'probe'
    2296 |         .probe = an8855_switch_probe,
         |          ^~~~~
>> drivers/net/dsa/an8855.c:2296:18: warning: excess elements in struct initializer
    2296 |         .probe = an8855_switch_probe,
         |                  ^~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/an8855.c:2296:18: note: (near initialization for 'an8855_switch_driver')
>> drivers/net/dsa/an8855.c:2297:10: error: 'struct platform_driver' has no member named 'remove'
    2297 |         .remove = an8855_switch_remove,
         |          ^~~~~~
   drivers/net/dsa/an8855.c:2297:19: warning: excess elements in struct initializer
    2297 |         .remove = an8855_switch_remove,
         |                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/an8855.c:2297:19: note: (near initialization for 'an8855_switch_driver')
>> drivers/net/dsa/an8855.c:2298:10: error: 'struct platform_driver' has no member named 'driver'
    2298 |         .driver = {
         |          ^~~~~~
>> drivers/net/dsa/an8855.c:2298:19: error: extra brace group at end of initializer
    2298 |         .driver = {
         |                   ^
   drivers/net/dsa/an8855.c:2298:19: note: (near initialization for 'an8855_switch_driver')
   drivers/net/dsa/an8855.c:2298:19: warning: excess elements in struct initializer
   drivers/net/dsa/an8855.c:2298:19: note: (near initialization for 'an8855_switch_driver')
>> drivers/net/dsa/an8855.c:2303:1: warning: data definition has no type or storage class
    2303 | module_platform_driver(an8855_switch_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/an8855.c:2303:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Wimplicit-int]
>> drivers/net/dsa/an8855.c:2303:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/net/dsa/an8855.c:2295:31: error: storage size of 'an8855_switch_driver' isn't known
    2295 | static struct platform_driver an8855_switch_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/an8855.c:2295:31: warning: 'an8855_switch_driver' defined but not used [-Wunused-variable]


vim +2227 drivers/net/dsa/an8855.c

  2220	
  2221	static int an8855_switch_probe(struct platform_device *pdev)
  2222	{
  2223		struct an8855_priv *priv;
  2224		u32 val;
  2225		int ret;
  2226	
> 2227		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
  2228		if (!priv)
  2229			return -ENOMEM;
  2230	
> 2231		priv->dev = &pdev->dev;
  2232		priv->phy_require_calib = of_property_read_bool(priv->dev->of_node,
  2233								"airoha,ext-surge");
  2234	
  2235		priv->reset_gpio = devm_gpiod_get_optional(priv->dev, "reset",
  2236							   GPIOD_OUT_LOW);
  2237		if (IS_ERR(priv->reset_gpio))
  2238			return PTR_ERR(priv->reset_gpio);
  2239	
  2240		/* Get regmap from MFD */
  2241		priv->regmap = dev_get_regmap(priv->dev->parent, NULL);
  2242	
  2243		if (priv->reset_gpio) {
  2244			usleep_range(100000, 150000);
  2245			gpiod_set_value_cansleep(priv->reset_gpio, 0);
  2246			usleep_range(100000, 150000);
  2247			gpiod_set_value_cansleep(priv->reset_gpio, 1);
  2248	
  2249			/* Poll HWTRAP reg to wait for Switch to fully Init */
  2250			ret = regmap_read_poll_timeout(priv->regmap, AN8855_HWTRAP, val,
  2251						       val, 20, 200000);
  2252			if (ret)
  2253				return ret;
  2254		}
  2255	
  2256		ret = an8855_read_switch_id(priv);
  2257		if (ret)
  2258			return ret;
  2259	
  2260		priv->ds = devm_kzalloc(priv->dev, sizeof(*priv->ds), GFP_KERNEL);
  2261		if (!priv->ds)
  2262			return -ENOMEM;
  2263	
  2264		priv->ds->dev = priv->dev;
  2265		priv->ds->num_ports = AN8855_NUM_PORTS;
  2266		priv->ds->priv = priv;
  2267		priv->ds->ops = &an8855_switch_ops;
  2268		devm_mutex_init(priv->dev, &priv->reg_mutex);
  2269		priv->ds->phylink_mac_ops = &an8855_phylink_mac_ops;
  2270	
  2271		priv->pcs.ops = &an8855_pcs_ops;
  2272		priv->pcs.neg_mode = true;
  2273		priv->pcs.poll = true;
  2274	
  2275		dev_set_drvdata(priv->dev, priv);
  2276	
  2277		return dsa_register_switch(priv->ds);
  2278	}
  2279	
  2280	static void an8855_switch_remove(struct platform_device *pdev)
  2281	{
> 2282		struct an8855_priv *priv = dev_get_drvdata(&pdev->dev);
  2283	
  2284		if (!priv)
  2285			return;
  2286	
  2287		dsa_unregister_switch(priv->ds);
  2288	}
  2289	
  2290	static const struct of_device_id an8855_switch_of_match[] = {
  2291		{ .compatible = "airoha,an8855-switch" },
  2292		{ /* sentinel */ }
  2293	};
  2294	
> 2295	static struct platform_driver an8855_switch_driver = {
> 2296		.probe = an8855_switch_probe,
> 2297		.remove = an8855_switch_remove,
> 2298		.driver = {
  2299			.name = "an8855-switch",
  2300			.of_match_table = an8855_switch_of_match,
  2301		},
  2302	};
> 2303	module_platform_driver(an8855_switch_driver);
  2304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


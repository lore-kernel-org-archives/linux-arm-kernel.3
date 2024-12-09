Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286CBE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/7YTBWWchufCln6WcdXo3s/jp9GBOGUEywKWM8gCII=; b=mcRjwyri/lq9TkXOi1TN7B6kCI
	FCFHlMD39Lp0ESCOl/RYYQAjKQl8mx7jWxBe4W1imHUHcn9UrkYJFlGOXF8CdVTPwtfbPC7jiNhQk
	rT4D7Ej/mN3GiAvm+Demrb2jFuOeSyeVF9WoDWOZPGKfgHaxBFe+kv+mYzwAfWfs+hlbUdzeSiC7v
	8f05DKOzUzzD8oR1iUdpLpGm86EIA6SRfXp8Xp6EvUKbfeIEPmNqo1vNvNm2CCGhQ7Hy30ouIz/gj
	1YcZg4w9Ed7MFPRfvtRNgp+hY/3jSA81KZqxEOzgF5U6qRo37wUFbT9AbxUG4zPnFvXNPfdIMTwwK
	ZzR+2Okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVdX-00000006RQK-38Ek;
	Mon, 09 Dec 2024 04:44:47 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVcV-00000006RF5-0ZJM;
	Mon, 09 Dec 2024 04:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719423; x=1765255423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CnZh5PzuBjSJ5i81gB2eROtQAtISkclOyWpu/tX4BSo=;
  b=N8zixdPSgzhXlBjoJWfsFKWyaeBfdnLr1RGY1GBrOaMpyH6izAZTDDf6
   yh0sYCUHmViRR/lnG6R7/CxiiqnpuqptbYXE5w9LLHRLPprINUgdO8n/c
   7xJpayptcTlM1L3FVksU0AINFewlAigSY1Ujr0OVocAwNYBGza6Ny9Xax
   sfQBOYM8DXkueKOXsm1vP+obUMri1saWghRKwuuv6uYXUt/Q/nx67J9lW
   DYgjeVhsEyPYf4nWy+xA9IiFAOVURBjldaDYD6hFtFFVopfyh+TxLBgNi
   fbENRmzC+nxP5heX+qGfswzIkdztIF3DpHNcglK3g+37fm4+9YVfcwh/W
   w==;
X-CSE-ConnectionGUID: XhtbLf2cTViVt1M3WZeY/g==
X-CSE-MsgGUID: As80V2tnSmerPyTwb3f90A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33348889"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33348889"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:43:39 -0800
X-CSE-ConnectionGUID: Flp2HtyeTY66gH19/gozDg==
X-CSE-MsgGUID: brSxjW+KShqcUGtJAxw2Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99995074"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2024 20:43:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVcJ-0003u3-18;
	Mon, 09 Dec 2024 04:43:31 +0000
Date: Mon, 9 Dec 2024 12:42:57 +0800
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
Message-ID: <202412081353.I0203taL-lkp@intel.com>
References: <20241208002105.18074-9-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208002105.18074-9-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_204343_189232_7D556EA8 
X-CRM114-Status: GOOD (  15.43  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-nvmem-Document-support-for-Airoha-AN8855-Switch-EFUSE/20241208-082533
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241208002105.18074-9-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v10 8/9] net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241208/202412081353.I0203taL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412081353.I0203taL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081353.I0203taL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/dsa/an8855.c: In function 'an8855_switch_probe':
   drivers/net/dsa/an8855.c:2227:34: error: invalid use of undefined type 'struct platform_device'
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
   drivers/net/dsa/an8855.c:2295:15: error: variable 'an8855_switch_driver' has initializer but incomplete type
    2295 | static struct platform_driver an8855_switch_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/net/dsa/an8855.c:2296:10: error: 'struct platform_driver' has no member named 'probe'
    2296 |         .probe = an8855_switch_probe,
         |          ^~~~~
   drivers/net/dsa/an8855.c:2296:18: warning: excess elements in struct initializer
    2296 |         .probe = an8855_switch_probe,
         |                  ^~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/an8855.c:2296:18: note: (near initialization for 'an8855_switch_driver')
   drivers/net/dsa/an8855.c:2297:10: error: 'struct platform_driver' has no member named 'remove'
    2297 |         .remove = an8855_switch_remove,
         |          ^~~~~~
   drivers/net/dsa/an8855.c:2297:19: warning: excess elements in struct initializer
    2297 |         .remove = an8855_switch_remove,
         |                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/an8855.c:2297:19: note: (near initialization for 'an8855_switch_driver')
   drivers/net/dsa/an8855.c:2298:10: error: 'struct platform_driver' has no member named 'driver'
    2298 |         .driver = {
         |          ^~~~~~
   drivers/net/dsa/an8855.c:2298:19: error: extra brace group at end of initializer
    2298 |         .driver = {
         |                   ^
   drivers/net/dsa/an8855.c:2298:19: note: (near initialization for 'an8855_switch_driver')
   drivers/net/dsa/an8855.c:2298:19: warning: excess elements in struct initializer
   drivers/net/dsa/an8855.c:2298:19: note: (near initialization for 'an8855_switch_driver')
   drivers/net/dsa/an8855.c:2303:1: warning: data definition has no type or storage class
    2303 | module_platform_driver(an8855_switch_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/an8855.c:2303:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/net/dsa/an8855.c:2303:1: warning: parameter names (without types) in function declaration
   drivers/net/dsa/an8855.c:2295:31: error: storage size of 'an8855_switch_driver' isn't known
    2295 | static struct platform_driver an8855_switch_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/an8855.c:2295:31: warning: 'an8855_switch_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +2303 drivers/net/dsa/an8855.c

  2294	
  2295	static struct platform_driver an8855_switch_driver = {
  2296		.probe = an8855_switch_probe,
  2297		.remove = an8855_switch_remove,
  2298		.driver = {
  2299			.name = "an8855-switch",
  2300			.of_match_table = an8855_switch_of_match,
  2301		},
  2302	};
> 2303	module_platform_driver(an8855_switch_driver);
  2304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


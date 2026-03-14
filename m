Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAA110854A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 20:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qqp8I8J7zCnhDRW64bOPtwztlJzc65B4nZ/a1CzOFAg=; b=NY8pc4DqiLrVSo8sVUj5S6tzXF
	97OFAaiuaoPZ3ofnwYGcvW5WCj10dEnWWxF9XjluFpmlvWDXkEwCgep6Q1Eappz0o7RismngPaPZ0
	6Fy1Awdstm+V07paAiBlFiofWSvxJWod5bUMv6Y2P6EXhVGveEnhodi46KNJ04ZL2mLswTpijgOxp
	Urs/5pIXtepb+Lt0Wh/LrfOg0mZaOIddctz5W2zNw6WCpKXHX31pgm/H2X9CBulmZWhiqNrdgWbH5
	O1Pd6BxUaHgvX/LjJSNyXo1IChKZlFX17SARZFE1u+Sf72rRQ3Lzq2dhybVsPeERnPxQEvHsxP9NW
	wLHzLukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Vlf-000000029Ly-3XhH;
	Sat, 14 Mar 2026 20:39:27 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Vlc-000000029Ld-2qTh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 20:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773520765; x=1805056765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AukoqsMcYsnDKt5+d2e638BLLQ4ybjY4dyDeaqoO5S4=;
  b=Hhr6AR+dlE9sjuREaE/BgHuPmLYkcbD+NEAoVpXRyyEZZablwPqCNgms
   McrcJ7ZRtgkrKGbBxEhu0oaXaaVyfLNWjjYO3IdyaJbZSvTpCglraMBmK
   c3jIhFEn0jvJAV7jfhR8VcEbTctCfw8Vnc4nfEUIL/Bmzk2WAEhFDsY3c
   zKHxhFDtBcHrm0DXHCX+FKOGA6OlBBQoBbUHpJnm7srKZdGeXSPWkxfzb
   piehfBWbcCFRHyAElmPFgQJS/3N6UAzP3Lqd2DI6lRe2YI2JJ16sY3O4N
   aN4icyHBq+su4xBnncEbyUh7hsLo1x6rylq9PjtQCt9jNAYGdzyHLv6qJ
   A==;
X-CSE-ConnectionGUID: dPpvOp4sQxy3nV22JBZzMA==
X-CSE-MsgGUID: BQQs+BAVTxeozC0dPYopCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="85214889"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="85214889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 13:39:22 -0700
X-CSE-ConnectionGUID: /Zma5jHUTamC/jFSOEsqDQ==
X-CSE-MsgGUID: jgQOkDZJRUW7aIRqQu3piw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="217835982"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Mar 2026 13:39:18 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1VlS-000000005ip-3yYv;
	Sat, 14 Mar 2026 20:39:14 +0000
Date: Sun, 15 Mar 2026 04:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Ryan Chen <ryanchen.aspeed@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Add ast2700 support
Message-ID: <202603150439.FM8mt7EG-lkp@intel.com>
References: <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_133924_760122_2C91A2A8 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-mmc-sdhci-of-aspeed-Add-ast2700-support/20260314-132323
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260313-sdhci-v1-2-91cea19c8a67%40aspeedtech.com
patch subject: [PATCH 2/2] mmc: sdhci-of-aspeed: Add ast2700 support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260315/202603150439.FM8mt7EG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603150439.FM8mt7EG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603150439.FM8mt7EG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/sdhci-of-aspeed.c: In function 'aspeed_sdc_probe':
>> drivers/mmc/host/sdhci-of-aspeed.c:533:17: error: implicit declaration of function 'reset_control_get_optional_exclusive' [-Wimplicit-function-declaration]
     533 |         reset = reset_control_get_optional_exclusive(&pdev->dev, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-of-aspeed.c:533:15: error: assignment to 'struct reset_control *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     533 |         reset = reset_control_get_optional_exclusive(&pdev->dev, NULL);
         |               ^
>> drivers/mmc/host/sdhci-of-aspeed.c:537:15: error: implicit declaration of function 'reset_control_deassert' [-Wimplicit-function-declaration]
     537 |         ret = reset_control_deassert(sdc->rst);
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-of-aspeed.c:537:41: error: 'struct aspeed_sdc' has no member named 'rst'
     537 |         ret = reset_control_deassert(sdc->rst);
         |                                         ^~


vim +/reset_control_get_optional_exclusive +533 drivers/mmc/host/sdhci-of-aspeed.c

   520	
   521	{
   522		struct device_node *parent, *child;
   523		struct reset_control *reset;
   524		struct aspeed_sdc *sdc;
   525		int ret;
   526	
   527		sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
   528		if (!sdc)
   529			return -ENOMEM;
   530	
   531		spin_lock_init(&sdc->lock);
   532	
 > 533		reset = reset_control_get_optional_exclusive(&pdev->dev, NULL);
   534		if (IS_ERR(reset))
   535			return dev_err_probe(&pdev->dev, PTR_ERR(reset),
   536					     "unable to acquire reset\n");
 > 537		ret = reset_control_deassert(sdc->rst);
   538		if (ret)
   539			return dev_err_probe(&pdev->dev, ret,
   540					     "reset deassert failed\n");
   541	
   542		sdc->clk = devm_clk_get(&pdev->dev, NULL);
   543		if (IS_ERR(sdc->clk))
   544			return PTR_ERR(sdc->clk);
   545	
   546		ret = clk_prepare_enable(sdc->clk);
   547		if (ret) {
   548			dev_err(&pdev->dev, "Unable to enable SDCLK\n");
   549			return ret;
   550		}
   551	
   552		sdc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &sdc->res);
   553		if (IS_ERR(sdc->regs)) {
   554			ret = PTR_ERR(sdc->regs);
   555			goto err_clk;
   556		}
   557	
   558		dev_set_drvdata(&pdev->dev, sdc);
   559	
   560		parent = pdev->dev.of_node;
   561		for_each_available_child_of_node(parent, child) {
   562			struct platform_device *cpdev;
   563	
   564			cpdev = of_platform_device_create(child, NULL, &pdev->dev);
   565			if (!cpdev) {
   566				of_node_put(child);
   567				ret = -ENODEV;
   568				goto err_clk;
   569			}
   570		}
   571	
   572		return 0;
   573	
   574	err_clk:
   575		clk_disable_unprepare(sdc->clk);
   576		return ret;
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


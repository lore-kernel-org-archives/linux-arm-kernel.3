Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D79109B493
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6smz/tVlVP2xa4k25TAtdUHzHsfk0EudBM++sE/hz60=; b=XOGqjE75Ya4teRUhtUXIf66+aa
	6r95hn+zGdywLxlAUwiybjN723EKXCOaP/qBtYYdsqKJBVT6/xTspjBnTgGuJoRkcAlNValVUtya2
	Y5wQzpNtfdgYKbHT1Hqw3MARP/4f64KuxRW8TL2bNRVKZzu9ZBiaKLD39SnkvblFa3kzAqmb1Tiz6
	qpTatmp/ZRg9NZi0MCWwvE9U+wRa3000bjr23/XM+e6emV8o62wd2YxqRA8mue6jOHPVNZ8q3bo2v
	OT0rXaZyKw90rPmoQs8VczaEYQOKbNd7mV1jujIjrT/erZ/LJOOLFtC9OBdcWDZNh9r2kdCMmu+ou
	vYx0mUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bXU-0000000DDvS-0j9s;
	Tue, 31 Mar 2026 16:02:00 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bXP-0000000DDuk-38Zn;
	Tue, 31 Mar 2026 16:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774972916; x=1806508916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eI8SQ8hlmfnTvWkv7QAhjjIQ17PWVbfzQx5ojZvnNo4=;
  b=YmoKJvYMScr+U6C6++if/njXNNOPiDZ84pyDRo7Bl2HhG/TTW47LStwQ
   1758d2xd3C6ZjB9ga8WbzIHdDpF58kPxZea0SAm72NM3TA1ehbw7albRh
   5acu/2++hzxgY3SQJ92Gfym6IxYrFTYuqK7DL2mactW3f48lHsB710AQt
   9HeX05rsi4Jrc4nCbB+wnuKjqjrNdGw27Dz86O2y87S4M3ifHQzWZZz3D
   d8kdyu+dem8+upZq/sCh8k7c0IQddieiWmSfBSHOjkZFwXiupDm7SYubW
   h4MH+6cymmo9vcmfFRqwTVN7/2/XxHg33EZeZZnrgQvF2Cp5ru0v0UC4Y
   w==;
X-CSE-ConnectionGUID: TC3QqX2zTx60HD1DcedPrg==
X-CSE-MsgGUID: s6vtS9/iSJ2hU2SUj3EwIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75954403"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75954403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 09:01:53 -0700
X-CSE-ConnectionGUID: W+2NdeozTVSmfTQd4l/CIQ==
X-CSE-MsgGUID: IGnx9ev2S/KHj+cLPQVwFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226270636"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 09:01:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7bXD-000000002qT-3p6k;
	Tue, 31 Mar 2026 16:01:43 +0000
Date: Wed, 1 Apr 2026 00:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 5/9] mfd: mt6397: Add support for MT6392 PMIC
Message-ID: <202603312339.CMJpqhEq-lkp@intel.com>
References: <20260330083429.359819-6-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330083429.359819-6-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_090157_534152_9CF2889D 
X-CRM114-Status: GOOD (  15.06  )
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

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on broonie-regulator/for-next linusw-pinctrl/devel linusw-pinctrl/for-next lee-mfd/for-mfd-fixes linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/dt-bindings-mfd-mt6397-Add-MT6392-PMIC/20260331-081127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260330083429.359819-6-l.scorcia%40gmail.com
patch subject: [PATCH v4 5/9] mfd: mt6397: Add support for MT6392 PMIC
config: s390-randconfig-002-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312339.CMJpqhEq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312339.CMJpqhEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312339.CMJpqhEq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/mt6397-core.c:421:16: warning: cast to smaller integer type 'enum mfd_match_data' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     421 |         device_data = (enum mfd_match_data)of_device_get_match_data(&pdev->dev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +421 drivers/mfd/mt6397-core.c

   398	
   399	static int mt6397_probe(struct platform_device *pdev)
   400	{
   401		int ret;
   402		unsigned int id = 0;
   403		struct mt6397_chip *pmic;
   404		const struct chip_data *pmic_core;
   405		enum mfd_match_data device_data;
   406	
   407		pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
   408		if (!pmic)
   409			return -ENOMEM;
   410	
   411		pmic->dev = &pdev->dev;
   412	
   413		/*
   414		 * mt6397 MFD is child device of soc pmic wrapper.
   415		 * Regmap is set from its parent.
   416		 */
   417		pmic->regmap = dev_get_regmap(pdev->dev.parent, NULL);
   418		if (!pmic->regmap)
   419			return -ENODEV;
   420	
 > 421		device_data = (enum mfd_match_data)of_device_get_match_data(&pdev->dev);
   422		switch (device_data) {
   423		case MATCH_DATA_MT6323:
   424			pmic_core = &mt6323_core;
   425			break;
   426		case MATCH_DATA_MT6328:
   427			pmic_core = &mt6328_core;
   428			break;
   429		case MATCH_DATA_MT6331:
   430			pmic_core = &mt6331_mt6332_core;
   431			break;
   432		case MATCH_DATA_MT6357:
   433			pmic_core = &mt6357_core;
   434			break;
   435		case MATCH_DATA_MT6358:
   436			pmic_core = &mt6358_core;
   437			break;
   438		case MATCH_DATA_MT6359:
   439			pmic_core = &mt6359_core;
   440			break;
   441		case MATCH_DATA_MT6392:
   442			pmic_core = &mt6392_core;
   443			break;
   444		case MATCH_DATA_MT6397:
   445			pmic_core = &mt6397_core;
   446			break;
   447		default:
   448			dev_err(&pdev->dev, "Unknown device match data %u\n", device_data);
   449			return -ENODEV;
   450		}
   451	
   452		ret = regmap_read(pmic->regmap, pmic_core->cid_addr, &id);
   453		if (ret) {
   454			dev_err(&pdev->dev, "Failed to read chip id: %d\n", ret);
   455			return ret;
   456		}
   457	
   458		pmic->chip_id = (id >> pmic_core->cid_shift) & 0xff;
   459	
   460		platform_set_drvdata(pdev, pmic);
   461	
   462		pmic->irq = platform_get_irq(pdev, 0);
   463		if (pmic->irq <= 0)
   464			return pmic->irq;
   465	
   466		ret = pmic_core->irq_init(pmic);
   467		if (ret)
   468			return ret;
   469	
   470		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
   471					   pmic_core->cells, pmic_core->cell_size,
   472					   NULL, 0, pmic->irq_domain);
   473		if (ret) {
   474			irq_domain_remove(pmic->irq_domain);
   475			dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
   476		}
   477	
   478		return ret;
   479	}
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB59CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEeIudPcAWznDAVs4/7KcTXrP9oQxIuxqDG8IVTe/9A=; b=epfEaNgco/hZjwe1cXtm6obpN1
	qCegTf5FKxInaismdpMlrmU+GsMnbhesUJeoeuh2wY2lN4b6kHIIo2BXoKX64PyDzQ7E7qVqBKfLd
	jTcziigcVaSX7D1efcqwffFJW1LRqjZVzTV4AV29flt1jwUCA8hNFO+4oGaPYpghwNulnV15P9qY3
	IaCoA4APafBn3FlOiwTdpC6I3wgaxB3AMoEtlWuWZcNFTBuwMCwDKY9pghk6SspfrY4Rbm5NidyJI
	c1Imn6IpSMJjrECNUMMy55CT7AD1XUB6aEk3+xT/3IVT8th46dHp2vctU/DLDBFbIQiMkKLJkuzYY
	woy+M7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTO3n-00000008zVt-0NtW;
	Sat, 30 May 2026 18:05:25 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTO3j-00000008zVO-2K0b;
	Sat, 30 May 2026 18:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780164320; x=1811700320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CmIOsDhzmaoHfGl24Cswm9/46h1EqKgKFEAM5HlR5l8=;
  b=hBo4JH33Ge79SrsNdBn2aJes2LEOcri5GiR1k7UcorOGvKecOFXdoXnq
   i1OlcQEQpy/0mLQdg/kROt9KvWo1NWW6xHfMgZpx2zWpbDXZEuDvAEoa8
   lBCNtg+05xr11EVvFBrXe1dyKSnQ3o3aKkMguPq7EXOe/7jjKcYQJuJx9
   4JDWO5RuZY1GGbTYIjwTc1aG5lSgHw5C49khkIejCjE4AJQJTZZT3AXvg
   F1x8iLjf7la/bXHz1XTPK0lbukehyLAaRz7rS+ABH72fWo2Ry5xc1hxBh
   TkkLDaAfzUHiQMn2AHQxyOJ/f1ImWth6I2fQF/hq3iv4spKA7uzSiCo87
   g==;
X-CSE-ConnectionGUID: 5xMu6DZKSfGf75nVPRecgg==
X-CSE-MsgGUID: HzFXs6dNQ0qIPymGs8c68A==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="103655847"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="103655847"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 11:05:19 -0700
X-CSE-ConnectionGUID: VCmEDFrQTAinCjDCAOl9rw==
X-CSE-MsgGUID: 1EOOZkKNQ1u+i7ncO+8olQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="281261019"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 May 2026 11:05:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTO3b-000000008m2-1KnD;
	Sat, 30 May 2026 18:05:11 +0000
Date: Sun, 31 May 2026 02:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Guillaume La Roque <glaroque@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
Message-ID: <202605310154.bmdMBZHJ-lkp@intel.com>
References: <20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_110519_699620_AF12BC1F 
X-CRM114-Status: GOOD (  10.96  )
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

Hi Ronald,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3929405c64376a8a54c794e8a4485023b108a97e]

url:    https://github.com/intel-lab-lkp/linux/commits/Ronald-Claveau-via-B4-Relay/firmware-meson-sm-add-stub-functions-when-CONFIG_MESON_SM-is-disabled/20260530-150837
base:   3929405c64376a8a54c794e8a4485023b108a97e
patch link:    https://lore.kernel.org/r/20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4%40aliel.fr
patch subject: [PATCH] firmware: meson: sm: add stub functions when CONFIG_MESON_SM is disabled
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260531/202605310154.bmdMBZHJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310154.bmdMBZHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605310154.bmdMBZHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/meson/meson_sm.c:233:27: error: redefinition of 'meson_sm_get'
     233 | struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
         |                           ^
   include/linux/firmware/meson/meson_sm.h:39:41: note: previous definition is here
      39 | static inline struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node)
         |                                         ^
>> drivers/firmware/meson/meson_sm.c:258:5: error: redefinition of 'meson_sm_get_thermal_calib'
     258 | int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
         |     ^
   include/linux/firmware/meson/meson_sm.h:43:19: note: previous definition is here
      43 | static inline int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw,
         |                   ^
   2 errors generated.


vim +/meson_sm_get +233 drivers/firmware/meson/meson_sm.c

2c4ddb215521d5 Carlo Caione   2016-08-27  225  
8cde3c2153e8f5 Carlo Caione   2019-07-31  226  /**
8cde3c2153e8f5 Carlo Caione   2019-07-31  227   * meson_sm_get - get pointer to meson_sm_firmware structure.
8cde3c2153e8f5 Carlo Caione   2019-07-31  228   *
8cde3c2153e8f5 Carlo Caione   2019-07-31  229   * @sm_node:		Pointer to the secure-monitor Device Tree node.
8cde3c2153e8f5 Carlo Caione   2019-07-31  230   *
8cde3c2153e8f5 Carlo Caione   2019-07-31  231   * Return:		NULL is the secure-monitor device is not ready.
8cde3c2153e8f5 Carlo Caione   2019-07-31  232   */
8cde3c2153e8f5 Carlo Caione   2019-07-31 @233  struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
8cde3c2153e8f5 Carlo Caione   2019-07-31  234  {
8cde3c2153e8f5 Carlo Caione   2019-07-31  235  	struct platform_device *pdev = of_find_device_by_node(sm_node);
8ece3173f87df0 Johan Hovold   2025-07-25  236  	struct meson_sm_firmware *fw;
8cde3c2153e8f5 Carlo Caione   2019-07-31  237  
8cde3c2153e8f5 Carlo Caione   2019-07-31  238  	if (!pdev)
8cde3c2153e8f5 Carlo Caione   2019-07-31  239  		return NULL;
8cde3c2153e8f5 Carlo Caione   2019-07-31  240  
8ece3173f87df0 Johan Hovold   2025-07-25  241  	fw = platform_get_drvdata(pdev);
8ece3173f87df0 Johan Hovold   2025-07-25  242  
8ece3173f87df0 Johan Hovold   2025-07-25  243  	put_device(&pdev->dev);
8ece3173f87df0 Johan Hovold   2025-07-25  244  
8ece3173f87df0 Johan Hovold   2025-07-25  245  	return fw;
8cde3c2153e8f5 Carlo Caione   2019-07-31  246  }
8cde3c2153e8f5 Carlo Caione   2019-07-31  247  EXPORT_SYMBOL_GPL(meson_sm_get);
8cde3c2153e8f5 Carlo Caione   2019-07-31  248  
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  249  /**
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  250   * meson_sm_get_thermal_calib - Read thermal sensor calibration data.
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  251   * @fw:		Pointer to secure-monitor firmware.
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  252   * @trim_info:	Pointer to store the returned calibration data.
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  253   * @tsensor_id:	Sensor index to identify which sensor's calibration data
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  254   *		to retrieve
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  255   *
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  256   * Return: 0 on success, negative error code on failure.
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  257   */
1c5cb7391ef5f8 Ronald Claveau 2026-04-24 @258  int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  259  			       u32 tsensor_id)
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  260  {
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  261  	return meson_sm_call(fw, SM_THERMAL_CALIB_READ, trim_info, tsensor_id,
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  262  			     0, 0, 0, 0);
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  263  }
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  264  EXPORT_SYMBOL_GPL(meson_sm_get_thermal_calib);
1c5cb7391ef5f8 Ronald Claveau 2026-04-24  265  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


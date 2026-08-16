Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BB9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 05:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M82D34oiwV0L0zCDg+OkJBW0cHsmS0isVdxCKtN2KqI=; b=EyiJM2U/35l9ve4pabU6bL4zYE
	kuObHdyIC897AYBi0B9k35RIU0dq1Clqwpugz4LITb6M/3QOp+BKaOJ+sOdwKyeRB1O547pQger1P
	oRtrc3CaRovlHg96G6iC5zg3Y2eXB/cr/H3uKeToGBHSvvl1LGBDFvyOyj5ISFtKDvr7bmFawGJtS
	ojy+KnUQKTDW3va7TLKonXgonZRGpVW2r4avvUaCRnKzcBttMjtlK+pPvbI6FUW81ySDsmi9Ljrb5
	efx+VbBdh9GgNXveL60DnMwF/zctWAJ6S1AQLrhaqfS4Z3wMLLENEpv8VI8Ia2k3Ruf58tR5Itj3/
	bblvg8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvTCQ-00000004TWn-3cy0;
	Sun, 16 Aug 2026 05:14:22 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvTCN-00000004TWT-3mKo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 05:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786857260; x=1818393260;
  h=date:from:to:cc:subject:message-id;
  bh=inbctEE0XMBWG3f8oPtrwPXoYHg69K3P0uxeGVhQA74=;
  b=Cr71rfM9aiXfF2+EkJGH3md9H38t/k9Y9is4EbwvVjgvb6CSE1mIazhg
   YItEn3Wd5e8o/cE6WTAdrntqhmutrzocMLbbAzh/YtXBqMrTc5crIs0iR
   ozDVvyKbZqo8tn0x8Sekq9D9GNZlO/2WmkTQKpYoT3JG4/rTzYEpIShHH
   2d9/FjQOUsCzAtGqHErRJJs62oxBlabvzKT+mQZ3XsEE1fFKaRQmLYb7C
   3ydV1E9EAxgQCFSUbKCgWV8nNU3mFFTU/BYek0B6tnXkvwZgjXw4VFPdP
   /HnwTQhgIAqAuK3d+eO2aqde1EtAX3P5Xu3jxyb40p8IFrs7Zo54gOZYc
   w==;
X-CSE-ConnectionGUID: DoppmuBlRVKojYNqYThWfg==
X-CSE-MsgGUID: Ep9WXTi9TriAGqbDGrU6HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87582419"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87582419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:14:18 -0700
X-CSE-ConnectionGUID: f7TzvS00TSGqSEJL49PqHg==
X-CSE-MsgGUID: WIA6ymUWR8WKcvjCzZoiEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268449292"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2026 22:14:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvTCI-00000000ckI-0YjN;
	Sun, 16 Aug 2026 05:14:14 +0000
Date: Sun, 16 Aug 2026 13:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 138/217]
 sound/soc/ti/omap-twl4030.c:138:38: warning: unused variable 'dapm'
Message-ID: <202608161230.gHZiOn8j-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_221420_032303_F3AFC73E 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: f6d934b99b4df95800d72522490f3d30d4c16ef1 [138/217] ASoC: omap-twl4030: remove platform_data based probe
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608161230.gHZiOn8j-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161230.gHZiOn8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161230.gHZiOn8j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/ti/omap-twl4030.c: In function 'omap_twl4030_init':
>> sound/soc/ti/omap-twl4030.c:138:38: warning: unused variable 'dapm' [-Wunused-variable]
     138 |         struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
         |                                      ^~~~


vim +/dapm +138 sound/soc/ti/omap-twl4030.c

bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  134  
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  135  static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  136  {
0596f70069bb5a sound/soc/omap/omap-twl4030.c Lars-Peter Clausen 2014-05-19  137  	struct snd_soc_card *card = rtd->card;
42e142c842cb9c sound/soc/ti/omap-twl4030.c   Kuninori Morimoto  2025-11-11 @138  	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  139  	struct omap_twl4030 *priv = snd_soc_card_get_drvdata(card);
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  140  	int ret = 0;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  141  
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  142  	/*
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  143  	 * This is a bit of a hack, but the GPIO is optional so we
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  144  	 * only want to add the jack detection if the GPIO is there.
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  145  	 */
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  146  	if (of_property_present(card->dev->of_node, "ti,jack-det-gpio")) {
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  147  		hs_jack_gpios[0].gpiod_dev = card->dev;
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  148  		hs_jack_gpios[0].idx = 0;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  149  
19aed2d6cdb72a sound/soc/ti/omap-twl4030.c   Akihiko Odaki      2022-04-08  150  		ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
19aed2d6cdb72a sound/soc/ti/omap-twl4030.c   Akihiko Odaki      2022-04-08  151  						 SND_JACK_HEADSET,
19aed2d6cdb72a sound/soc/ti/omap-twl4030.c   Akihiko Odaki      2022-04-08  152  						 &priv->hs_jack, hs_jack_pins,
da21cf6d652836 sound/soc/omap/omap-twl4030.c Lars-Peter Clausen 2015-03-04  153  						 ARRAY_SIZE(hs_jack_pins));
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  154  		if (ret)
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  155  			return ret;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  156  
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  157  		ret = snd_soc_jack_add_gpios(&priv->hs_jack,
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  158  					     ARRAY_SIZE(hs_jack_gpios),
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  159  					     hs_jack_gpios);
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  160  		if (ret)
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  161  			return ret;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  162  	}
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  163  
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  164  	return ret;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  165  }
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  166  

:::::: The code at line 138 was first introduced by commit
:::::: 42e142c842cb9c7dbde569ff137974e76d1a0e67 ASoC: ti: omap-twl4030: convert to snd_soc_dapm_xxx()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


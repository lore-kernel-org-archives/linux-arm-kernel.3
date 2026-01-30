Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3259D73EB7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 06:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=go7mXKjZSgnJwEhApunceahSdc/Dd/ZPf6Qru/poLQM=; b=S1Nh36Ojc96eJLXSBuqWflL0Du
	SwgQaslvYvKvr8dfhArc/pwGMqBOvPkt0Tn3lrsO/VGmGkVGVQrpiHwcU2cXHyMHXbccL9qnkMhfQ
	IWuxk3ridwiCzyoqPem71KqAFS925xvRfz3bq5t19LgAFa529MkbrZB2lySTcuZhKf7CBsGsVteye
	qDizxy6qizNJPw75a2Zopvy9JdzAaGAJbzYJUh4uybbmY1twHDBsSIkLiJrn9wfhjvQPin1jyVU6P
	ytORz9YjHYF2ZrktRN0D87UkLLJYPJlVwhLUrnDeQ1TKkIvavn6nnibq2amXgn8EhHOOEXcbwIsu8
	ODhkhexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vli6Y-000000016KJ-3ss3;
	Fri, 30 Jan 2026 06:35:42 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vli6V-000000016Jw-2A1D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 06:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769754940; x=1801290940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sb2WU//u4SF4h5cOKPWNwwJrlAs7F8kiap7N72HjsJo=;
  b=ViV9WJwCZaEuR9NtqB6M4J5HZRjxSYWjsupA8QK7jabB+jsv/zDaIC20
   XdFpiM4Y7xawkvtkSxCIlSKfpaPPsFLF8sNp4BYHNLFjSTHLJlaXtjToB
   t7pi1w9UydhFt/RkQ2uRgBDYewkTBCOOo7RYso53nnElt689atNl+NxFp
   Db8Z39RxXefpaY+oQKAsLKBVfSVmCIHqUAkMQZBXCSHug8Y4G7E5wOTn1
   Vw5iyMkuDA07pARARiScT+2PTroNRPKUyhg6izUFUKVJJS//w8XOjuDsA
   xf0dsaffSS0tj0wXKf7kACYvrzUJ3Hrr0tZDd3QcxECFfVeKLW/4MKdFs
   w==;
X-CSE-ConnectionGUID: TwelLr57SbmqFt/weGKKkQ==
X-CSE-MsgGUID: z5xBuCRMQA29uxFWZio0Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74629550"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="74629550"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 22:35:39 -0800
X-CSE-ConnectionGUID: wjQWB7pyTy+QAcYvlvDfNg==
X-CSE-MsgGUID: tL1/o47kQBCLajUCKYUnsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="213682333"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jan 2026 22:35:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vli6P-00000000cHE-2CuX;
	Fri, 30 Jan 2026 06:35:33 +0000
Date: Fri, 30 Jan 2026 14:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Takashi Iwai <tiwai@suse.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <202601301436.qPUffKmd-lkp@intel.com>
References: <20260129172315.3871602-3-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129172315.3871602-3-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_223539_623721_E69CB9FE 
X-CRM114-Status: GOOD (  13.83  )
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

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on broonie-spi/for-next linus/master v6.19-rc7 next-20260129]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-sound-xlnx-i2s-Make-discoverable-parameters-optional/20260130-012955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260129172315.3871602-3-sean.anderson%40linux.dev
patch subject: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from registers
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260130/202601301436.qPUffKmd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301436.qPUffKmd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301436.qPUffKmd-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/xilinx/xlnx_i2s.c: In function 'xlnx_i2s_probe':
>> sound/soc/xilinx/xlnx_i2s.c:191:30: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     191 |         drv_data->channels = FIELD_GET(I2S_CORE_CFG_CHANNELS, cfg);
         |                              ^~~~~~~~~


vim +/FIELD_GET +191 sound/soc/xilinx/xlnx_i2s.c

   173	
   174	static int xlnx_i2s_probe(struct platform_device *pdev)
   175	{
   176		struct xlnx_i2s_drv_data *drv_data;
   177		int ret;
   178		u32 format, cfg;
   179		struct device *dev = &pdev->dev;
   180		struct device_node *node = dev->of_node;
   181	
   182		drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
   183		if (!drv_data)
   184			return -ENOMEM;
   185	
   186		drv_data->base = devm_platform_ioremap_resource(pdev, 0);
   187		if (IS_ERR(drv_data->base))
   188			return PTR_ERR(drv_data->base);
   189	
   190		cfg = readl(drv_data->base + I2S_CORE_CFG);
 > 191		drv_data->channels = FIELD_GET(I2S_CORE_CFG_CHANNELS, cfg);
   192		if (cfg & I2S_CORE_CFG_DATA_24BIT) {
   193			drv_data->data_width = 24;
   194			format = SNDRV_PCM_FMTBIT_S24_LE;
   195		} else {
   196			drv_data->data_width = 16;
   197			format = SNDRV_PCM_FMTBIT_S16_LE;
   198		}
   199	
   200		if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
   201			drv_data->dai_drv.name = "xlnx_i2s_playback";
   202			drv_data->dai_drv.playback.stream_name = "Playback";
   203			drv_data->dai_drv.playback.formats = format;
   204			drv_data->dai_drv.playback.channels_min = drv_data->channels;
   205			drv_data->dai_drv.playback.channels_max = drv_data->channels;
   206			drv_data->dai_drv.playback.rates	= SNDRV_PCM_RATE_8000_192000;
   207			drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
   208		} else if (of_device_is_compatible(node, "xlnx,i2s-receiver-1.0")) {
   209			drv_data->dai_drv.name = "xlnx_i2s_capture";
   210			drv_data->dai_drv.capture.stream_name = "Capture";
   211			drv_data->dai_drv.capture.formats = format;
   212			drv_data->dai_drv.capture.channels_min = drv_data->channels;
   213			drv_data->dai_drv.capture.channels_max = drv_data->channels;
   214			drv_data->dai_drv.capture.rates = SNDRV_PCM_RATE_8000_192000;
   215			drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
   216		} else {
   217			return -ENODEV;
   218		}
   219		drv_data->is_32bit_lrclk = readl(drv_data->base + I2S_CORE_CTRL_OFFSET) &
   220					   I2S_CORE_CTRL_32BIT_LRCLK;
   221	
   222		dev_set_drvdata(&pdev->dev, drv_data);
   223	
   224		ret = devm_snd_soc_register_component(&pdev->dev, &xlnx_i2s_component,
   225						      &drv_data->dai_drv, 1);
   226		if (ret) {
   227			dev_err(&pdev->dev, "i2s component registration failed\n");
   228			return ret;
   229		}
   230	
   231		dev_info(&pdev->dev, "%s DAI registered\n", drv_data->dai_drv.name);
   232	
   233		return ret;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


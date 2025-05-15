Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B58C54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSlAR0CibOa2K7rquS1Nxxgjj3nKTg+R6kXKpeR8yeg=; b=giNRpKioWrUUJYNd9qYmvbOWO4
	b/2jFOR7yqRueb5GOpCdisjQKBwM6ZttYcriLTpMfWj4/pAv5emHxOi8RTTy5ryPO6A7odWj1DncE
	bNLmP14Rps8FipE4JBbUyeltlgzRHdI6UkGdkEkfKKAMFSTIdMzQOBljUpYa5xbK7i5iOxfvlkE2Y
	l+NMpnKGw+BspghlHp+ebYl3Rt7GGCXLwp+O13ylxT0RPzYvfLYOl3YT8SD3mrchV1esDiHRIX9QK
	shNxB7Pz4JW1OOBLqebAC7FaamBU33HBp9Z4sgjD9jDjOlsFPmHyDK1V0eWcDK9XOIu3uNrc383Fd
	JREPO01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFT3Q-0000000HMIW-3yQP;
	Thu, 15 May 2025 07:30:56 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFT0p-0000000HLsk-3337;
	Thu, 15 May 2025 07:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747294095; x=1778830095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BrbhlZMAbRwWVb+rJM0+CbCBkLoIEnrmBwVee7Dhod0=;
  b=DOHozRjy5YwFJEQdVn1Y6E5klFEul5SqiPHrmaZORKFXVjitVWuJocPk
   /E9XLlBIeAF6oU6AREMsxhJPCIriOdPTR4oTossLhKX6u91sOve1zLiQK
   SSgLZf97nfYT/RtDcBUAACiUtQjRafGyJaVvygNMcIc+GM0yNOGU4UaTT
   DAU96w1c4Tc4JPvMu+RstJMercxLGUOoA2oveytMDuVhcHdzMyfz+ekKQ
   GQNJ/Sj7sUgbBtZ2mJl84Ul7+gRw0g6V4SYOF4INTbssic32E+Um7vd47
   b8CXR0fYI8OnLOGWM+HLimogPqyGZYGtyJl8ADeHxjJVZXOuZoWOoHvnd
   g==;
X-CSE-ConnectionGUID: 6RtPMX6aQjKHPnvxaWRubA==
X-CSE-MsgGUID: kUhd7ng7TIyaXHGyCS8w+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48333772"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="48333772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 00:28:15 -0700
X-CSE-ConnectionGUID: BgVJ0W6zSKCNBo/IHQckHg==
X-CSE-MsgGUID: hHubUriKQcmZDZBp9m3Cdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="143387119"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 00:28:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFT0i-000I4B-07;
	Thu, 15 May 2025 07:28:08 +0000
Date: Thu, 15 May 2025 15:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Darren.Ye" <darren.ye@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH v3 09/10] ASoC: mediatek: mt8196: add machine driver with
 nau8825
Message-ID: <202505151544.DAAAOmfW-lkp@intel.com>
References: <20250514081125.24475-10-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514081125.24475-10-darren.ye@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_002815_811278_6B8E3CC6 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Darren.Ye,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on broonie-spi/for-next robh/for-next linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250514-161921
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250514081125.24475-10-darren.ye%40mediatek.com
patch subject: [PATCH v3 09/10] ASoC: mediatek: mt8196: add machine driver with nau8825
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250515/202505151544.DAAAOmfW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151544.DAAAOmfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151544.DAAAOmfW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8196/mt8196-nau8825.c:451:49: error: 'SND_SOC_DAIFMT_CBS_CFS' undeclared here (not in a function); did you mean 'SND_SOC_DAIFMT_CBP_CFC'?
     451 |                 .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                                 SND_SOC_DAIFMT_CBP_CFC


vim +451 sound/soc/mediatek/mt8196/mt8196-nau8825.c

   245	
   246	/* FE */
   247	SND_SOC_DAILINK_DEFS(playback1,
   248			     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
   249			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   250			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   251	SND_SOC_DAILINK_DEFS(playback_24ch,
   252			     DAILINK_COMP_ARRAY(COMP_CPU("DL_24CH")),
   253			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   254			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   255	SND_SOC_DAILINK_DEFS(capture0,
   256			     DAILINK_COMP_ARRAY(COMP_CPU("UL0")),
   257			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   258			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   259	SND_SOC_DAILINK_DEFS(capture1,
   260			     DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
   261			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   262			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   263	SND_SOC_DAILINK_DEFS(capture2,
   264			     DAILINK_COMP_ARRAY(COMP_CPU("UL2")),
   265			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   266			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   267	SND_SOC_DAILINK_DEFS(playback_hdmi,
   268			     DAILINK_COMP_ARRAY(COMP_CPU("HDMI")),
   269			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   270			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   271	SND_SOC_DAILINK_DEFS(playback2,
   272			     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
   273			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   274			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   275	SND_SOC_DAILINK_DEFS(capture_cm0,
   276			     DAILINK_COMP_ARRAY(COMP_CPU("UL_CM0")),
   277			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   278			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   279	/* BE */
   280	SND_SOC_DAILINK_DEFS(ap_dmic,
   281			     DAILINK_COMP_ARRAY(COMP_CPU("AP_DMIC")),
   282			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   283			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   284	SND_SOC_DAILINK_DEFS(ap_dmic_ch34,
   285			     DAILINK_COMP_ARRAY(COMP_CPU("AP_DMIC_CH34")),
   286			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   287			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   288	SND_SOC_DAILINK_DEFS(ap_dmic_multich,
   289			     DAILINK_COMP_ARRAY(COMP_CPU("AP_DMIC_MULTICH")),
   290			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   291			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   292	SND_SOC_DAILINK_DEFS(i2sin6,
   293			     DAILINK_COMP_ARRAY(COMP_CPU("I2SIN6")),
   294			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   295			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   296	SND_SOC_DAILINK_DEFS(i2sout3,
   297			     DAILINK_COMP_ARRAY(COMP_CPU("I2SOUT3")),
   298			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   299			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   300	SND_SOC_DAILINK_DEFS(i2sout4,
   301			     DAILINK_COMP_ARRAY(COMP_CPU("I2SOUT4")),
   302			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   303			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   304	SND_SOC_DAILINK_DEFS(i2sout6,
   305			     DAILINK_COMP_ARRAY(COMP_CPU("I2SOUT6")),
   306			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   307			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   308	SND_SOC_DAILINK_DEFS(tdm_dptx,
   309			     DAILINK_COMP_ARRAY(COMP_CPU("TDM_DPTX")),
   310			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   311			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   312	SND_SOC_DAILINK_DEFS(AFE_SOF_DL_24CH,
   313			     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL_24CH")),
   314			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   315			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   316	SND_SOC_DAILINK_DEFS(AFE_SOF_DL1,
   317			     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL1")),
   318			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   319			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   320	SND_SOC_DAILINK_DEFS(AFE_SOF_UL0,
   321			     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL0")),
   322			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   323			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   324	SND_SOC_DAILINK_DEFS(AFE_SOF_UL1,
   325			     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL1")),
   326			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   327			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   328	SND_SOC_DAILINK_DEFS(AFE_SOF_UL2,
   329			     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL2")),
   330			     DAILINK_COMP_ARRAY(COMP_DUMMY()),
   331			     DAILINK_COMP_ARRAY(COMP_EMPTY()));
   332	
   333	static struct snd_soc_dai_link mt8196_nau8825_dai_links[] = {
   334		/*
   335		 * The SOF topology expects PCM streams 0~4 to be available
   336		 * for the SOF PCM streams. Put the SOF BE definitions here
   337		 * so that the PCM device numbers are skipped over.
   338		 * (BE dailinks do not have PCM devices created.)
   339		 */
   340		{
   341			.name = "AFE_SOF_DL_24CH",
   342			.no_pcm = 1,
   343			.playback_only = 1,
   344			.ops = &mt8196_sof_be_ops,
   345			SND_SOC_DAILINK_REG(AFE_SOF_DL_24CH),
   346		},
   347		{
   348			.name = "AFE_SOF_DL1",
   349			.no_pcm = 1,
   350			.playback_only = 1,
   351			.ops = &mt8196_sof_be_ops,
   352			SND_SOC_DAILINK_REG(AFE_SOF_DL1),
   353		},
   354		{
   355			.name = "AFE_SOF_UL0",
   356			.no_pcm = 1,
   357			.capture_only = 1,
   358			.ops = &mt8196_sof_be_ops,
   359			SND_SOC_DAILINK_REG(AFE_SOF_UL0),
   360		},
   361		{
   362			.name = "AFE_SOF_UL1",
   363			.no_pcm = 1,
   364			.capture_only = 1,
   365			.ops = &mt8196_sof_be_ops,
   366			SND_SOC_DAILINK_REG(AFE_SOF_UL1),
   367		},
   368		{
   369			.name = "AFE_SOF_UL2",
   370			.no_pcm = 1,
   371			.capture_only = 1,
   372			.ops = &mt8196_sof_be_ops,
   373			SND_SOC_DAILINK_REG(AFE_SOF_UL2),
   374		},
   375		/* Front End DAI links */
   376		{
   377			.name = "HDMI_FE",
   378			.stream_name = "HDMI Playback",
   379			.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
   380				    SND_SOC_DPCM_TRIGGER_PRE},
   381			.dynamic = 1,
   382			.playback_only = 1,
   383			SND_SOC_DAILINK_REG(playback_hdmi),
   384		},
   385		{
   386			.name = "DL2_FE",
   387			.stream_name = "DL2 Playback",
   388			.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
   389				    SND_SOC_DPCM_TRIGGER_PRE},
   390			.dynamic = 1,
   391			.playback_only = 1,
   392			SND_SOC_DAILINK_REG(playback2),
   393		},
   394		{
   395			.name = "UL_CM0_FE",
   396			.stream_name = "UL_CM0 Capture",
   397			.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
   398				    SND_SOC_DPCM_TRIGGER_PRE},
   399			.dynamic = 1,
   400			.capture_only = 1,
   401			SND_SOC_DAILINK_REG(capture_cm0),
   402		},
   403		{
   404			.name = "DL_24CH_FE",
   405			.stream_name = "DL_24CH Playback",
   406			.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
   407					SND_SOC_DPCM_TRIGGER_PRE},
   408			.dynamic = 1,
   409			.playback_only = 1,
   410			SND_SOC_DAILINK_REG(playback_24ch),
   411		},
   412		{
   413			.name = "DL1_FE",
   414			.stream_name = "DL1 Playback",
   415			.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
   416					SND_SOC_DPCM_TRIGGER_PRE},
   417			.dynamic = 1,
   418			.playback_only = 1,
   419			SND_SOC_DAILINK_REG(playback1),
   420		},
   421		{
   422			.name = "UL0_FE",
   423			.stream_name = "UL0 Capture",
   424			.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
   425					SND_SOC_DPCM_TRIGGER_PRE},
   426			.dynamic = 1,
   427			.capture_only = 1,
   428			SND_SOC_DAILINK_REG(capture0),
   429		},
   430		{
   431			.name = "UL1_FE",
   432			.stream_name = "UL1 Capture",
   433			.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
   434					SND_SOC_DPCM_TRIGGER_PRE},
   435			.dynamic = 1,
   436			.capture_only = 1,
   437			SND_SOC_DAILINK_REG(capture1),
   438		},
   439		{
   440			.name = "UL2_FE",
   441			.stream_name = "UL2 Capture",
   442			.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
   443					SND_SOC_DPCM_TRIGGER_PRE},
   444			.dynamic = 1,
   445			.capture_only = 1,
   446			SND_SOC_DAILINK_REG(capture2),
   447		},
   448		/* Back End DAI links */
   449		{
   450			.name = "I2SIN6_BE",
 > 451			.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
   452				| SND_SOC_DAIFMT_GATED,
   453			.ops = &mt8196_nau8825_i2s_ops,
   454			.no_pcm = 1,
   455			.capture_only = 1,
   456			.ignore_suspend = 1,
   457			.be_hw_params_fixup = mt8196_i2s_hw_params_fixup,
   458			SND_SOC_DAILINK_REG(i2sin6),
   459		},
   460		{
   461			.name = "I2SOUT4_BE",
   462			.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
   463				| SND_SOC_DAIFMT_GATED,
   464			.ops = &mt8196_nau8825_i2s_ops,
   465			.no_pcm = 1,
   466			.playback_only = 1,
   467			.ignore_suspend = 1,
   468			.ignore_pmdown_time = 1,
   469			.be_hw_params_fixup = mt8196_i2s_hw_params_fixup,
   470			SND_SOC_DAILINK_REG(i2sout4),
   471		},
   472		{
   473			.name = "I2SOUT6_BE",
   474			.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
   475				| SND_SOC_DAIFMT_GATED,
   476			.ops = &mt8196_nau8825_i2s_ops,
   477			.no_pcm = 1,
   478			.playback_only = 1,
   479			.ignore_suspend = 1,
   480			.be_hw_params_fixup = mt8196_i2s_hw_params_fixup,
   481			SND_SOC_DAILINK_REG(i2sout6),
   482		},
   483		{
   484			.name = "AP_DMIC_BE",
   485			.no_pcm = 1,
   486			.capture_only = 1,
   487			.ignore_suspend = 1,
   488			SND_SOC_DAILINK_REG(ap_dmic),
   489		},
   490		{
   491			.name = "AP_DMIC_CH34_BE",
   492			.no_pcm = 1,
   493			.capture_only = 1,
   494			.ignore_suspend = 1,
   495			SND_SOC_DAILINK_REG(ap_dmic_ch34),
   496		},
   497		{
   498			.name = "AP_DMIC_MULTICH_BE",
   499			.no_pcm = 1,
   500			.capture_only = 1,
   501			.ignore_suspend = 1,
   502			SND_SOC_DAILINK_REG(ap_dmic_multich),
   503		},
   504		{
   505			.name = "TDM_DPTX_BE",
   506			.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
   507				| SND_SOC_DAIFMT_GATED,
   508			.ops = &mt8196_dptx_ops,
   509			.be_hw_params_fixup = mt8196_dptx_hw_params_fixup,
   510			.no_pcm = 1,
   511			.playback_only = 1,
   512			.ignore_suspend = 1,
   513			SND_SOC_DAILINK_REG(tdm_dptx),
   514		},
   515		{
   516			.name = "I2SOUT3_BE",
   517			.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
   518				| SND_SOC_DAIFMT_GATED,
   519			.ops = &mt8196_nau8825_i2s_ops,
   520			.no_pcm = 1,
   521			.playback_only = 1,
   522			.ignore_suspend = 1,
   523			SND_SOC_DAILINK_REG(i2sout3),
   524		},
   525	};
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


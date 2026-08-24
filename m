Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC852C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWDg2XEA4poCXeeXekpvxzrwX0YOnWk4tZzyElyznvY=; b=dOlrl2mo6B8DRcKN7v7YOBIPqI
	P1HcM7oBs95Lu+wYRFYwWlL2JgkPr0ZdJsQtlgQE0BTUtfTGzK+vtLtO1h1d9uswCfEp2B6lK6RoQ
	TQ0uiM5vGn/IpYdYqxbtubr3MpRVqJN4N3cDl91TqhuOyJDK96CPhnnH4pFvAAp3C/Lmx6zAJ30Ji
	F3TXkb2jQDt4aXP013XeM74fV8BQsLXzR0gfGHaXHOHB5PCnAvZAYHL10a0h51QHG1fvqyoEHlFia
	bBtykqJn3SdtS3NSek4U5llw80WrHO4FuImDB9AFqSKgDZKBfC1zBTA/NEZybbyoQOdhfmkgJt4+Y
	rpCaJk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZkm-0000000HHYh-0777;
	Mon, 24 Aug 2026 18:50:40 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZki-0000000HHYM-3p35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 18:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787597437; x=1819133437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vwsIkq3vGwtCk1Yi+102hhzLj4F624CUHBps8Z9LWeo=;
  b=hgQ6ZUqa9KdkY0WhVtGOd/vHeNU+0zNKds05IZOhKjY9WcFRvsIOQpvC
   o8U6EYkRyLjdcWbvKrJAiz8tjZ7HFwi2tMjcaF6CGpDNeb/9s32BYj+4L
   UK0hyOd/H4AFJ7ZlJnxqDADGczgwXWZUK19xEN1BnuZPkHW+b2AO3e6zX
   r2CoyW0Hs5rHWtzDPwEDpAl7qGMBoOWSNEghRSBCBYsRXnJm9BvGOzAjc
   nBjNf01ivlVxqwfgl0xctubG+xuQ+cUGGn/BzDBdmbb797hUiN5Q4khed
   B5Rhw+bMlf8QH5/9Hmk7NK1hK3W+4G0sRtnBWklsl1GLzo5MMaNKcK16N
   g==;
X-CSE-ConnectionGUID: yBdPpU4yRweTSOBZRlCE+Q==
X-CSE-MsgGUID: Yt6bDgqJQXOJRR527c5bYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87931493"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="87931493"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:50:36 -0700
X-CSE-ConnectionGUID: ZaMwmeuaTQyvIhm+6uASJA==
X-CSE-MsgGUID: ixMfBGXHSPaLCnIE9XMeQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="260930454"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Aug 2026 11:50:32 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyZkV-000000003nH-1Jc8;
	Mon, 24 Aug 2026 18:50:25 +0000
Date: Tue, 25 Aug 2026 02:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Michal Simek <monstr@monstr.eu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <202608250212.z7M3tz5i-lkp@intel.com>
References: <20260823050012.17067-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823050012.17067-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_115037_021248_0A8F03CC 
X-CRM114-Status: GOOD (  16.14  )
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

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.2]
[also build test ERROR on linus/master next-20260821]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ASoC-xilinx-formatter_pcm-use-more-devm-in-probe/20260822-220012
base:   v7.2
patch link:    https://lore.kernel.org/r/20260823050012.17067-1-rosenp%40gmail.com
patch subject: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260825/202608250212.z7M3tz5i-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250212.z7M3tz5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250212.z7M3tz5i-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/xilinx/xlnx_formatter_pcm.c: In function 'xlnx_formatter_pcm_probe':
>> sound/soc/xilinx/xlnx_formatter_pcm.c:632:51: error: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
     632 |                         return dev_err_probe(dev, "audio formatter reset failed\n");
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   char *
   In file included from include/linux/device.h:15,
                    from include/sound/soc.h:15,
                    from sound/soc/xilinx/xlnx_formatter_pcm.c:17:
   include/linux/dev_printk.h:278:64: note: expected 'int' but argument is of type 'char *'
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~
>> sound/soc/xilinx/xlnx_formatter_pcm.c:632:32: error: too few arguments to function 'dev_err_probe'; expected at least 3, have 2
     632 |                         return dev_err_probe(dev, "audio formatter reset failed\n");
         |                                ^~~~~~~~~~~~~
   include/linux/dev_printk.h:278:20: note: declared here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^~~~~~~~~~~~~


vim +/dev_err_probe +632 sound/soc/xilinx/xlnx_formatter_pcm.c

   584	
   585	static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
   586	{
   587		int ret;
   588		u32 val;
   589		struct xlnx_pcm_drv_data *aud_drv_data;
   590		struct device *dev = &pdev->dev;
   591		struct clk *axi_clk;
   592	
   593		axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
   594		if (IS_ERR(axi_clk))
   595			return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
   596	
   597		aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
   598		if (!aud_drv_data)
   599			return -ENOMEM;
   600	
   601		aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
   602		if (IS_ERR(aud_drv_data->mmio))
   603			return PTR_ERR(aud_drv_data->mmio);
   604	
   605		val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
   606		if (val & AUD_CFG_MM2S_MASK) {
   607			aud_drv_data->mm2s_presence = true;
   608			ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
   609						       XLNX_MM2S_OFFSET);
   610			if (ret)
   611				return dev_err_probe(dev, ret, "audio formatter reset failed\n");
   612			xlnx_formatter_disable_irqs(aud_drv_data->mmio +
   613						    XLNX_MM2S_OFFSET,
   614						    SNDRV_PCM_STREAM_PLAYBACK);
   615	
   616			aud_drv_data->mm2s_irq = platform_get_irq_byname(pdev,
   617									 "irq_mm2s");
   618			if (aud_drv_data->mm2s_irq < 0)
   619				return aud_drv_data->mm2s_irq;
   620	
   621			ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
   622					       xlnx_mm2s_irq_handler, 0,
   623					       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
   624			if (ret)
   625				return ret;
   626		}
   627		if (val & AUD_CFG_S2MM_MASK) {
   628			aud_drv_data->s2mm_presence = true;
   629			ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
   630						       XLNX_S2MM_OFFSET);
   631			if (ret)
 > 632				return dev_err_probe(dev, "audio formatter reset failed\n");
   633			xlnx_formatter_disable_irqs(aud_drv_data->mmio +
   634						    XLNX_S2MM_OFFSET,
   635						    SNDRV_PCM_STREAM_CAPTURE);
   636	
   637			aud_drv_data->s2mm_irq = platform_get_irq_byname(pdev,
   638									 "irq_s2mm");
   639			if (aud_drv_data->s2mm_irq < 0)
   640				return aud_drv_data->s2mm_irq;
   641	
   642			ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
   643					       xlnx_s2mm_irq_handler, 0,
   644					       "xlnx_formatter_pcm_s2mm_irq",
   645					       aud_drv_data);
   646			if (ret)
   647				return ret;
   648		}
   649	
   650		dev_set_drvdata(dev, aud_drv_data);
   651	
   652		return devm_snd_soc_register_component(dev, &xlnx_asoc_component, NULL, 0);
   653	}
   654	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


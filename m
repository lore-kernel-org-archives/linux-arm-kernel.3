Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0BDCFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHZPgmgANkV6E6swQ9urF4pJHBkKYgjjSdZl2Q3QnEY=; b=pVzEOZNbmfWHRtKWJN1FzMaAm9
	m/wGpjXvNNzf14ogwCHrXeAesi6fnMmwFiQZ9Dql11X5sFESX81mpK+BXmWgAe/V4o8Gg8I++T5qp
	aezYpfxjp4T1xekLfaFUZLqrWMuv0r0dDVBRjUBrk2pitT64sWDzTC/f7bJvhRnEXsQQuqr4dPXb1
	eauzZ4mDYynYcUkA9R169mjltP2K7FG3BfC+NWPngRaFg65mqJvKlr18xOfawwysDrwfjpsD1Z3rh
	iVSBQoO03IcNSKt3wg8tVHMPnC/qQi2wkfzZzdKxW3XdrAM+httAJCfczKmkcykIolW5EM6V0xswG
	RRLVajUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNag0-0000000C84x-2Faa;
	Mon, 24 Nov 2025 17:48:36 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNafy-0000000C84X-3IDi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764006514; x=1795542514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZMfp9MU43gbbsHJVljv1nrWxCaYgeHGHk75SKAtcBEI=;
  b=FOHae+qGyjZak79NvA3WQNSE8rB/ipzKJ9QNVk+AIhHnf0XJzMDJRcZ6
   yrkz90ZKbAW/n3ds9AUjhVuAwo8GNs+5Llx4SebV2YADi/A1fSTfPZk6F
   t5tZTU2Hwzooa9ySvQPNIuL4D1F3WWnQHDyA9L9w1D3sBkvl3cJrrNhdJ
   xr9ogkji1TJBYo/e2exFyztnLR7r3RVFoUmB3xdGTsdwszA+9RVEZU5rQ
   8K7NxFbHpBHd36TJld6DbwwasMguX9BwnlE9eYRe3Txho62XGV+fTcaeq
   bS2aB2MBZj3KQZzQhAlPpVvU/YYtAFgnd0IfWOy2NVGs/99W8rRYuGWiu
   Q==;
X-CSE-ConnectionGUID: 8z9LiGlfSyKDwKcD4j8Eaw==
X-CSE-MsgGUID: o+ETKxmlRIC/BzVgJrMbrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66050728"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="66050728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 09:48:33 -0800
X-CSE-ConnectionGUID: 7wgYsk0wQyGLB6sMISS2RA==
X-CSE-MsgGUID: Ce6J77WjRE2IkJQjB3NoxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="215736574"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2025 09:48:30 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNafr-000000000z7-2axH;
	Mon, 24 Nov 2025 17:48:27 +0000
Date: Tue, 25 Nov 2025 01:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource
 arrays as const
Message-ID: <202511250103.RMNoU3xH-lkp@intel.com>
References: <20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_094834_848760_5B9CCD8B 
X-CRM114-Status: GOOD (  11.89  )
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

Hi Jean-Michel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Michel-Hautbois/m68k-coldfire-Mark-platform-device-resource-arrays-as-const/20251124-210737
base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
patch link:    https://lore.kernel.org/r/20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27%40yoseli.org
patch subject: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource arrays as const
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250103.RMNoU3xH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/m68k/coldfire/device.c:141:35: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     141 |         .resource               = mcf_fec0_resources,
         |                                   ^~~~~~~~~~~~~~~~~~


vim +/const +141 arch/m68k/coldfire/device.c

b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  136  
b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  137  static struct platform_device mcf_fec0 = {
bea8bcb12da09b arch/m68k/platform/coldfire/device.c Steven King       2012-06-06  138  	.name			= FEC_NAME,
b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  139  	.id			= 0,
b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  140  	.num_resources		= ARRAY_SIZE(mcf_fec0_resources),
b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24 @141  	.resource		= mcf_fec0_resources,
f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  142  	.dev = {
f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  143  		.dma_mask		= &mcf_fec0.dev.coherent_dma_mask,
f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  144  		.coherent_dma_mask	= DMA_BIT_MASK(32),
f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  145  		.platform_data		= FEC_PDATA,
f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  146  	}
b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  147  };
63a24cf8cc330e arch/m68k/coldfire/device.c          Antonio Quartulli 2024-10-29  148  #endif /* MCFFEC_BASE0 */
b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


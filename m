Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2815ECA1014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 04:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnIP2eiP2bXj3ji5lBbHOQAA8SlpLPVuxDVu6ezN2VQ=; b=AQwwdWwvEir+mF57lr+aUrbSAy
	Skphjijst/u3gp+Ug8HAuomYUIs24RNj/JsrYJ8+Pm4eOHheV4Avh3Qf90ZaQ0nFz9LXFASqI1AZ0
	XFOEqQCoifXB0Ex3FUzmlCe4bBWnTuRp5rU/uTdMvWI2/VB30OcgAyB3xqjV2XjkVtMqPc+zE/Lpm
	zNS4GADtiJaLw1R9YbRVd28MdedJ+do8krBgNHLzyuBmq2/JbFpkt+bK39l6nRkjqhc29+UGCPwh5
	MWZ1Q7HpaeMeO7D8JA3Sf0HOy+UkQuAOlepke9p3Y5exMw9NDnlrID/HJ7KIwB/nQwZPzzI+ebiME
	ONa/wgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1h3-000000090KR-388T;
	Thu, 04 Sep 2025 04:35:29 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1eI-00000008zN8-3K3q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 04:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756960359; x=1788496359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M5TwpNr55usP9Sz8MApwPf1Fs9RyfM3185mpZDbrJyc=;
  b=mBXQxevE1L2suVyP6kzrrLmv1Nii+4ZNIXcoTDpmXjJtsG8r9qNO0RoV
   tH5kKepbcYEqLTcvJzHoO8Dh7qpeBTt7aZpAIoZc2W+WzlEQpSgM8voiD
   zC0DJrMbPtGPArBiuyVVYhD5FmHWxkPeN4PKy/39U9fRuvWMxQ3wkn9cZ
   npN/P8YRoeRjPETXO1vji+giJZnji+Iu+Ahirozvn2ACX2ZneqaphHhn1
   FH7U99u+YML5SyG4IqhMpSBnKb3xTZVCoDb9Ipbrr7p6+bijqm4NL9enR
   b6PmVd+mrMpoAnzzHgIcOdK1hC5stzVjMSXstjSp7bYZQcFocUOFbjW4c
   g==;
X-CSE-ConnectionGUID: KMqi8LmHRj+SHXxiDd4j4g==
X-CSE-MsgGUID: 00hBUjklTyeWZ3l1jeSHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59204242"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59204242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 21:32:36 -0700
X-CSE-ConnectionGUID: AbAUldJwTX65zWZ58P+kng==
X-CSE-MsgGUID: asiFdFQmTLGNLDtAmDZW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="202625452"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Sep 2025 21:32:34 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu1eA-0004kZ-2S;
	Thu, 04 Sep 2025 04:32:30 +0000
Date: Thu, 4 Sep 2025 12:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>
Cc: oe-kbuild-all@lists.linux.dev, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 11/11] dmaengine: imx-sdma: fix spba-bus handling for
 i.MX8M
Message-ID: <202509041238.qCKW7MeD-lkp@intel.com>
References: <20250903-v6-16-topic-sdma-v1-11-ac7bab629e8b@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-v6-16-topic-sdma-v1-11-ac7bab629e8b@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_213238_865697_61A3646B 
X-CRM114-Status: GOOD (  10.60  )
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

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/dmaengine-imx-sdma-drop-legacy-device_node-np-check/20250903-212133
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250903-v6-16-topic-sdma-v1-11-ac7bab629e8b%40pengutronix.de
patch subject: [PATCH 11/11] dmaengine: imx-sdma: fix spba-bus handling for i.MX8M
config: arm-randconfig-002-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041238.qCKW7MeD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041238.qCKW7MeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041238.qCKW7MeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma/imx-sdma.c:477 struct member 'spba_start_addr' not described in 'sdma_channel'
>> Warning: drivers/dma/imx-sdma.c:477 struct member 'spba_end_addr' not described in 'sdma_channel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


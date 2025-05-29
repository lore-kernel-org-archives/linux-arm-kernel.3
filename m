Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF97CC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vb6WBFoivshC9+Yzx2xONn+OQ3UuWc93E6/iR71zSN0=; b=EHSJkLRL0mKN+2EnVkgQSXgOMi
	dkmou86CvRryrouKMupU+T0WGRnIATXb73yan0XV5aatr1SZe1f6ITp4sKV7uAc1L+GpDx7KBsKqc
	CpDwEjYg3jGVf/2fvk2LEvBeec8hiPKOwD5oyaKHon5NlP0H/U+cdPP/CPnHd1mKOJB3fScZarFIx
	6USEvOU3lxPbr0qTOAX4Wjo6kVshg3lBrHRLE4s6H+tTnETjvW28eQbOG8UVhjot+i8ttHqDoIJbi
	40kGxmgf4U/SWOT2NEKEm7Ip7aZOwQgwxP02PBelrZOwXdzXEwmQ2g+PwWOx+1o5r5m2UAGrQhF2x
	HCPC1I7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZcC-0000000FPuf-2Iis;
	Thu, 29 May 2025 09:31:56 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZTV-0000000FOs1-2Fpm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748510577; x=1780046577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i3CAwiCoEjbFznMoQgq/hG6fd2mUML8gqX6vftdQ8DM=;
  b=RRRkbhBxo25WNu3Whvgzym25tZ2hTrCaJeT+wXN3E4Kn+vDRg0OK1Nrh
   5teWZWqEqvpyhnpLsDmHkwV2IIFwUEKH1KD7PPtpWaoiggdzdJpKkN6vC
   WiRBX3ny5KJmk548URCnz5Q2g7GhZvPOaiO0Z7xiFo3K8NlEPd/JRDHjE
   gUnWaowGZEcz8E2XMHD6f5GXgHQ3aoeJm46URqrIOo5ilu76DErDnPwvX
   QwF7Iy2XRXg3CrjCAinpRRWebtWePA4kEult0wOKBJDfTi3x4UyTGMCRl
   pcPSC96alnIwO5Hn/KsxR+8nYCeoasg3oci9ARM9Om/W7DNlvlF2m7kNC
   Q==;
X-CSE-ConnectionGUID: tP6+L8ReSca6e7FHJdlV4A==
X-CSE-MsgGUID: uIMVrvXeSr6oYkDslPxErA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54361429"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="54361429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 02:22:55 -0700
X-CSE-ConnectionGUID: 7upNn49tQPG7cPBFS1RClw==
X-CSE-MsgGUID: dtQC3ucUR0CdobThUdO6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="143475369"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 May 2025 02:22:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKZTO-000WWm-2F;
	Thu, 29 May 2025 09:22:50 +0000
Date: Thu, 29 May 2025 17:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH 2/2] counter: microchip-tcb-capture: Add DMA support for
 TC_RAB register reads
Message-ID: <202505291723.WYIWqmvP-lkp@intel.com>
References: <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_022257_592974_4A42B6B0 
X-CRM114-Status: GOOD (  11.42  )
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

Hi Dharma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fefff2755f2aa4125dce2a1edfe7e545c7c621f2]

url:    https://github.com/intel-lab-lkp/linux/commits/Dharma-Balasubiramani/counter-microchip-tcb-capture-Retrieve-and-map-parent-base-address/20250528-141627
base:   fefff2755f2aa4125dce2a1edfe7e545c7c621f2
patch link:    https://lore.kernel.org/r/20250528-mchp-tcb-dma-v1-2-083a41fb7b51%40microchip.com
patch subject: [PATCH 2/2] counter: microchip-tcb-capture: Add DMA support for TC_RAB register reads
config: arm-randconfig-r121-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291723.WYIWqmvP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250529/202505291723.WYIWqmvP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291723.WYIWqmvP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/counter/microchip-tcb-capture.c:140:16: sparse: sparse: cast to restricted __le32

vim +140 drivers/counter/microchip-tcb-capture.c

   101	
   102	static int mchp_tc_dma_transfer(struct mchp_tc_data *priv, u32 *val)
   103	{
   104		struct dma_async_tx_descriptor *desc;
   105		struct device *dev = &priv->pdev->dev;
   106		dma_cookie_t cookie;
   107		int ret;
   108	
   109		ret = dmaengine_slave_config(priv->dma.chan, &priv->dma.slave_cfg);
   110		if (ret) {
   111			dev_err(dev, "DMA slave_config failed (%d)\n", ret);
   112			return ret;
   113		}
   114	
   115		desc = dmaengine_prep_dma_memcpy(priv->dma.chan,
   116						 priv->dma.addr,
   117						 priv->dma.slave_cfg.src_addr,
   118						 sizeof(u32),
   119						 DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
   120		if (!desc) {
   121			dev_err(dev, "DMA prep descriptor failed\n");
   122			return -ENOMEM;
   123		}
   124	
   125		cookie = dmaengine_submit(desc);
   126		if (dma_submit_error(cookie)) {
   127			dev_err(dev, "DMA submit error (%d)\n", cookie);
   128			return cookie ?: -EIO;
   129		}
   130	
   131		dma_async_issue_pending(priv->dma.chan);
   132	
   133		ret = dma_sync_wait(priv->dma.chan, cookie);
   134		if (ret) {
   135			dev_err(dev, "DMA transfer timed out (%d)\n", ret);
   136			return ret;
   137		}
   138	
   139		/* Retrieve the 32-bit value the engine just copied */
 > 140		*val = le32_to_cpu(*(u32 *)priv->dma.buf);
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


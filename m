Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845BFD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 07:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kblzKUU7ZnyBgKMRLKqxbH2vPYhclVDnd+JYT7c76hU=; b=01MlbeU170HTCLV7NUpWWSOQ4v
	+0Ck1OwFGjTGpAT20FWgJjObIw8V3BxEbRlvVBMAtQ/LaCO6cyQds7ThYm8fs1HTsZNYWq5GeU6B9
	H5AVvn4YN0qBStqNsXnN1S6D+fPpH/k49hdvKOeG1LDv/te7/KXUeQmEabeKYUurNYXSxFTcfwra2
	B/x/3whDRYK0CkkJ/T7PVAgFSHkF0FWjs8NEAoplMjalQbM8zYCRtEqfATIMFwWjQ/+M0ngwmJZo0
	7Ur+i8j3H8bV14zoW0/be0e3/r9rXxjiLem5XWYxEb1xUjkziAOMVyfClRYioHBz+IU1qLjS6aHg9
	D3tjBp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgqh-00000006EHi-2SL0;
	Wed, 03 Dec 2025 07:00:27 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgqe-00000006EHJ-1gyy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 07:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764745224; x=1796281224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BbpnT+nHAKfc3yROfFOj29+WeIOEVrl1j2gKJu3ZWdA=;
  b=FiMwlDkUwhkBoQt34Zabt4xvJYpI10lgZfipJ6xLAEqsVZtFD95f0Jae
   d4uH8fpdNlIgq0+0nN8dk920Il/rUspmCQfV6T3aHC79iln7lSg7pvTbS
   blEAlogItBdm894ZhQjNbYn+2MC5rfq/SdYs0imjSQK82y2tNJfMTDkEs
   VfH34gmT2yCMV1fociq9MSJcNsJzIiMrQ4GmvTGxaHAPhU6sOpwar1q+T
   CNZwdwkXnofnStHOO9fPo3EjuB1p+ad6n9huBLsSUOMJa1E6IXaFZZfir
   5Jm5aLkZZMATeAFpqk4PS72qc9nrKXbKIbfP+GcX/LbYnV4sFbKanJqD6
   Q==;
X-CSE-ConnectionGUID: mNRNH50/SweJCymJZ72NLQ==
X-CSE-MsgGUID: x9ukb/teSRWv89sxbzpk3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54280048"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="54280048"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 23:00:23 -0800
X-CSE-ConnectionGUID: vttOtOV4SHi8K8SNjtneyg==
X-CSE-MsgGUID: 8k+m/DnYQPiasvfEOKvb7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="225271918"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2025 23:00:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQgqX-00000000AgD-22Pq;
	Wed, 03 Dec 2025 07:00:17 +0000
Date: Wed, 3 Dec 2025 14:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Song <carlos.song@nxp.com>, frank.li@nxp.com, mkl@pengutronix.de,
	broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, kees@kernel.org,
	gustavoars@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v2 5/6] spi: imx: support dynamic burst length for ECSPI
 DMA mode
Message-ID: <202512031425.cmBJXuXy-lkp@intel.com>
References: <20251202075503.2448339-6-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202075503.2448339-6-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_230024_459979_D2C32626 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Carlos,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.18]
[also build test ERROR on linus/master next-20251202]
[cannot apply to shawnguo/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Song/spi-imx-group-spi_imx_dma_configure-with-spi_imx_dma_transfer/20251202-160030
base:   v6.18
patch link:    https://lore.kernel.org/r/20251202075503.2448339-6-carlos.song%40nxp.com
patch subject: [PATCH v2 5/6] spi: imx: support dynamic burst length for ECSPI DMA mode
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512031425.cmBJXuXy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031425.cmBJXuXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031425.cmBJXuXy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-imx.c:144:34: error: 'counted_by' attribute is not allowed for a non-array field
     144 |         struct dma_data_package *dma_data __counted_by(dma_package_num);
         |                                  ^~~~~~~~


vim +/counted_by +144 drivers/spi/spi-imx.c

   107	
   108	struct spi_imx_data {
   109		struct spi_controller *controller;
   110		struct device *dev;
   111	
   112		struct completion xfer_done;
   113		void __iomem *base;
   114		unsigned long base_phys;
   115	
   116		struct clk *clk_per;
   117		struct clk *clk_ipg;
   118		unsigned long spi_clk;
   119		unsigned int spi_bus_clk;
   120	
   121		unsigned int bits_per_word;
   122		unsigned int spi_drctl;
   123	
   124		unsigned int count, remainder;
   125		void (*tx)(struct spi_imx_data *spi_imx);
   126		void (*rx)(struct spi_imx_data *spi_imx);
   127		void *rx_buf;
   128		const void *tx_buf;
   129		unsigned int txfifo; /* number of words pushed in tx FIFO */
   130		unsigned int dynamic_burst;
   131		bool rx_only;
   132	
   133		/* Target mode */
   134		bool target_mode;
   135		bool target_aborted;
   136		unsigned int target_burst;
   137	
   138		/* DMA */
   139		bool usedma;
   140		u32 wml;
   141		struct completion dma_rx_completion;
   142		struct completion dma_tx_completion;
   143		size_t dma_package_num;
 > 144		struct dma_data_package *dma_data __counted_by(dma_package_num);
   145		int rx_offset;
   146	
   147		const struct spi_imx_devtype_data *devtype_data;
   148	};
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


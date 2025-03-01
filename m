Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BBFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrfJbIpvNNDzFrmrARf6eWvWkH3oUKiyG0kOMshkNsY=; b=TssjqZZ+xcxRgtpgWE609l51GA
	v2MTsqPKacHsrqcTnvFf1g1DTtq8b0enespzLctYSu/KJQGInKiLXP0wf9slxrmWcd11PMXKMk+dZ
	hbKI/20381brg8gMV7Q8RdJ06OYUHa3bmsWi3ggkZ1p6G01OA2QuwMWtPBDGBoDKnfW7QebNlfC6w
	hfPQ/2JZ91VMmyb1Q6ALixmVsNdDyibFP9vcvwWHG4fOrFxHbfOglrKy5q8I+RR4HLSwiQap+Hyln
	wr/Nc5T8y7+Y7jbcLHoGCx/IXz3DInnOjeWxyDSudPH81Hs24fykvgnz+Z1P1a7LnrkoEBG9/hfnR
	tfLapAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toRvx-0000000EnGZ-3WIH;
	Sat, 01 Mar 2025 18:51:33 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toRuO-0000000En7t-2Nhv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 18:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740854997; x=1772390997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=spCrMjTY6Hpbwf+1cmyrHlATFQqZasSJYz/+jT86L9s=;
  b=P4Va6VwS+PUAdx9DKL1rwkXUS9RgBZBkVFDvnjqnK1717uw/MctUindX
   uoeMg2RSLQTGvkPQ0E6nGK+h5AvncpUtW3MW6Gjh3ajDrVY7C3Lg1Rf6D
   XShXD6mysZUP7wethPvkpLwwew7OqzjoMHxohqmvhq1n+75lNNMBgJjMQ
   p7cyP6SFWVlUsJYUKPsIZuTucLyRrfIorjKECXm9lUz406L+1aNrp7rCz
   A5wXu3/aMp200dKaCuZUtklmcK6Ml6yJDB+8CFWWlyn1QeXwWOdhiGAJO
   J1DqOVd2flLHEt6JU/OV7a+FtjjzTQTcA96+MyHI44/lO023opVQZIHqf
   w==;
X-CSE-ConnectionGUID: eN6yP43ZRlmu84iLZtVxGw==
X-CSE-MsgGUID: i4M/4MLJTfCLrQgPz6zUkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="45416185"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="45416185"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 10:49:53 -0800
X-CSE-ConnectionGUID: FIUMgNttTQCCdvZJ9MVmMg==
X-CSE-MsgGUID: rsFOSBnNRnSmClZcvBfr/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="122762858"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2025 10:49:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toRuG-000GaE-16;
	Sat, 01 Mar 2025 18:49:48 +0000
Date: Sun, 2 Mar 2025 02:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, vkoul@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dmaengine: Add Arm DMA-350 driver
Message-ID: <202503020214.QiJLAEK2-lkp@intel.com>
References: <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_104956_675330_B02C937A 
X-CRM114-Status: GOOD (  16.02  )
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

Hi Robin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/dt-bindings-dma-Add-Arm-DMA-350/20250301-012733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy%40arm.com
patch subject: [PATCH 2/2] dmaengine: Add Arm DMA-350 driver
config: hexagon-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020214.QiJLAEK2-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020214.QiJLAEK2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020214.QiJLAEK2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/arm-dma350.c:485:13: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
     485 |         } else if (!ch_status & CH_STAT_INTR_DONE) {
         |                    ^          ~
   drivers/dma/arm-dma350.c:485:13: note: add parentheses after the '!' to evaluate the bitwise operator first
     485 |         } else if (!ch_status & CH_STAT_INTR_DONE) {
         |                    ^                             
         |                     (                            )
   drivers/dma/arm-dma350.c:485:13: note: add parentheses around left hand side expression to silence this warning
     485 |         } else if (!ch_status & CH_STAT_INTR_DONE) {
         |                    ^
         |                    (         )
   1 warning generated.


vim +485 drivers/dma/arm-dma350.c

   462	
   463	static irqreturn_t d350_irq(int irq, void *data)
   464	{
   465		struct d350_chan *dch = data;
   466		struct device *dev = dch->vc.chan.device->dev;
   467		struct virt_dma_desc *vd = &dch->desc->vd;
   468		u32 ch_status;
   469	
   470		ch_status = readl(dch->base + CH_STATUS);
   471		if (!ch_status)
   472			return IRQ_NONE;
   473	
   474		if (ch_status & CH_STAT_INTR_ERR) {
   475			u32 errinfo = readl_relaxed(dch->base + CH_ERRINFO);
   476	
   477			if (errinfo & (CH_ERRINFO_AXIRDPOISERR | CH_ERRINFO_AXIRDRESPERR))
   478				vd->tx_result.result = DMA_TRANS_READ_FAILED;
   479			else if (errinfo & CH_ERRINFO_AXIWRRESPERR)
   480				vd->tx_result.result = DMA_TRANS_WRITE_FAILED;
   481			else
   482				vd->tx_result.result = DMA_TRANS_ABORTED;
   483	
   484			vd->tx_result.residue = d350_get_residue(dch);
 > 485		} else if (!ch_status & CH_STAT_INTR_DONE) {
   486			dev_warn(dev, "Unexpected IRQ source? 0x%08x\n", ch_status);
   487		}
   488		writel_relaxed(ch_status, dch->base + CH_STATUS);
   489	
   490		spin_lock(&dch->vc.lock);
   491		vchan_cookie_complete(vd);
   492		if (ch_status & CH_STAT_INTR_DONE) {
   493			dch->status = DMA_COMPLETE;
   494			dch->residue = 0;
   495			d350_start_next(dch);
   496		} else {
   497			dch->status = DMA_ERROR;
   498			dch->residue = vd->tx_result.residue;
   499		}
   500		spin_unlock(&dch->vc.lock);
   501	
   502		return IRQ_HANDLED;
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE12CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSj1C9yFpOlVHlNAi/SSxHqbpb4YSZ3mNkSnP4A2WLE=; b=Qxe7sK5rNk5kPDa9oap74H4513
	nsGQghPz24H0fTH3goITJwN652czfkpVO5A74u238wOcMvFNy8L/9G449tcSfB2xVwaUS3Hpv4Ptb
	9OIq1igjx4homv4iKzIcmD8Xe37kv5bu/tCWVyrIYsuS68ItxhOYaEvWEfiCTR+WmIhbDqcAYuRTT
	wILhiWrqBg+yVSTsaqp1GUBVrX7RmuMS2TxzlnSUMBoI0yQqTlC0ltoflLOFYRzJozykOWGQXmhT3
	pN5tB8fFMLypx9wMc5LkELyQYcAKzVPx2SC8jaaaNcD5fhHTbScwSkl/s1Du+gfcYPreZ+dmlVZ26
	mKRPHU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqACj-0000000Atph-0t81;
	Thu, 06 Mar 2025 12:19:57 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9U5-0000000AnHk-0Oyc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741260829; x=1772796829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0RkHv2NVUIjDTMRzp3ZLW9jex5M/ZIevpBWyXbznxKs=;
  b=GaHMeaxfxIgR3PCBUrmb3wFabOW0Rxo66uk+znuSkpqSHkZJhfIdOhHD
   04Rb2BX5qu3dSWWprhxvr676rQShXBmsk97eRX2ZCiTHQfTLwaem5A/iq
   deBQprpDW33041M3Jzqt+iKmAD2ni0rRbFx5QYfG10SabQeumtn0iI62q
   BMlQKgydlittr8563lIg5wy8mVgOMx2z8x7IWB/BzP+iDNMzc7TU2Gtx8
   gp7zGXgz03gLnKO5jbN8gGHlIC/L/xxtsie1h5Jn2A82mPN4Yl8Wui+8R
   9Enar5okKU/QCWQfzxfZrpHPFlTfx084jVvHK1sbaveo9oEzRHMxl8MvF
   A==;
X-CSE-ConnectionGUID: GmbUlYyvRkGZfX7d3eHPxQ==
X-CSE-MsgGUID: ZzG8KyXdQZuvGYlVN5M9+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59673237"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="59673237"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 03:33:45 -0800
X-CSE-ConnectionGUID: iKI6AAlYRAmEUJI/bGQSYA==
X-CSE-MsgGUID: wyJvtgh2SWSibKMKNc9NZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="124093820"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Mar 2025 03:33:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq9Tw-000Mz8-1P;
	Thu, 06 Mar 2025 11:33:40 +0000
Date: Thu, 6 Mar 2025 19:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, vkoul@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dmaengine: Add Arm DMA-350 driver
Message-ID: <202503061910.eJW7M2H3-lkp@intel.com>
References: <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033349_219979_F41F8447 
X-CRM114-Status: GOOD (  13.11  )
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
[also build test WARNING on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/dt-bindings-dma-Add-Arm-DMA-350/20250301-012733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy%40arm.com
patch subject: [PATCH 2/2] dmaengine: Add Arm DMA-350 driver
config: nios2-randconfig-r111-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061910.eJW7M2H3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250306/202503061910.eJW7M2H3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061910.eJW7M2H3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/arm-dma350.c:485:31: sparse: sparse: dubious: !x & y
   drivers/dma/arm-dma350.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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


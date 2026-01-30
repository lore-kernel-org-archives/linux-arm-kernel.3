Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7B4E6BF39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGu5pb48mB51nZ5NdwColSSIHX8+6iDhoDz5HpmqAEM=; b=TASa+p0VLtquLFePbexozfusgk
	B9sUwUvpb8Td5GbHqHHAX216dunLS5Zsx9ZLdz1e6301aHcTdTk52Cmhwgd/nUciUeOLrfOViqolh
	QJaQNKUtM0F5JFt6mg9230pSl+hRsI7h2/3GjsUFYzLnVqSmDv7IHl5XpDRjlQfsjkbWaensiFHNB
	rg6eMTCdQpJhYKOTVyxUVKXjPlTWgmixKnXE0Nb2Uq/Z4JfCECmoXSBGxntEAcox2Tg7ribRFYJtI
	dXEk3y9mFDyncXtGW51MeY1AJjdZm/3R6F4QewR4LC5nSQ0kDyT8JWjaWXvQ/l/f8p4BTo7XwI/9g
	dmhWXDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvFJ-00000001wvr-14X8;
	Fri, 30 Jan 2026 20:37:37 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvFG-00000001wvV-1rrB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769805454; x=1801341454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oyYyl/3tzRz6bgIlUzjXdXzpWFXNTALSND9eRqESxCg=;
  b=MjrpvNVdbMfvxuyCveemzOWUb75s9yZs23YIKauc715SUIVGuBIvOXMd
   v50yR/tr1WoMS+d3bWi9fkOGUX+h1H20iFxGmLJuZx7D2VNY/Rgwsti6m
   8tRXx6NijULAPgNRGUNEIb+iTw1SecII2HPyasXFXR0Nw0AHy8yq8FLB0
   gdAd4wpD6ouYtOK/qeOTkrZpwJi9H15prd1yzRC4oyma6kULRU26E2eMJ
   oEs0JuaJhxtru7L8bN50STAfhwkGog3e4MMgIGkVmPEpJB0UeFrsekL39
   ELzs22s65VmR6YtweXhXIr10Dmtt98k/vDMOeic8rucW7u6xyMy86cOsP
   w==;
X-CSE-ConnectionGUID: cZPm9EsUSDyXVcqVs1DSJw==
X-CSE-MsgGUID: OhRiTqduTga+a6OwmyIVlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71098023"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71098023"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 12:37:33 -0800
X-CSE-ConnectionGUID: H+oLySCaRWKJOz7BqmUbuQ==
X-CSE-MsgGUID: jFCgHKmpRKiD9ohcblL71g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 12:37:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlvF9-00000000dKy-33wx;
	Fri, 30 Jan 2026 20:37:27 +0000
Date: Sat, 31 Jan 2026 04:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	vigneshr@ti.com
Cc: oe-kbuild-all@lists.linux.dev, r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v4 19/19] dmaengine: ti: k3-udma: switch to synchronous
 descriptor freeing
Message-ID: <202601310444.S9H39g4c-lkp@intel.com>
References: <20260130110159.359501-20-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130110159.359501-20-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_123734_560468_EF035CD0 
X-CRM114-Status: GOOD (  12.17  )
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

Hi Sai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on next-20260130]
[cannot apply to linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Sree-Kartheek-Adivi/dmaengine-ti-k3-udma-move-macros-to-header-file/20260130-191306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260130110159.359501-20-s-adivi%40ti.com
patch subject: [PATCH v4 19/19] dmaengine: ti: k3-udma: switch to synchronous descriptor freeing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260131/202601310444.S9H39g4c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310444.S9H39g4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310444.S9H39g4c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/ti/k3-udma-common.c: In function 'udma_desc_free':
>> drivers/dma/ti/k3-udma-common.c:103:23: warning: unused variable 'flags' [-Wunused-variable]
     103 |         unsigned long flags;
         |                       ^~~~~
>> drivers/dma/ti/k3-udma-common.c:100:26: warning: unused variable 'ud' [-Wunused-variable]
     100 |         struct udma_dev *ud = to_udma_dev(vd->tx.chan->device);
         |                          ^~


vim +/flags +103 drivers/dma/ti/k3-udma-common.c

f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30   97  
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30   98  void udma_desc_free(struct virt_dma_desc *vd)
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30   99  {
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30 @100  	struct udma_dev *ud = to_udma_dev(vd->tx.chan->device);
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  101  	struct udma_chan *uc = to_udma_chan(vd->tx.chan);
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  102  	struct udma_desc *d = to_udma_desc(&vd->tx);
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30 @103  	unsigned long flags;
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  104  
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  105  	if (uc->terminated_desc == d)
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  106  		uc->terminated_desc = NULL;
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  107  
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  108  	udma_free_hwdesc(uc, d);
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  109  	kfree(d);
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  110  	return;
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  111  }
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  112  EXPORT_SYMBOL_GPL(udma_desc_free);
f30a784b467d1f Sai Sree Kartheek Adivi 2026-01-30  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


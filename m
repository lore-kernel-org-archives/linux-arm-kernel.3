Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B93C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 20:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCWmbhpdi3N9n7kLCJZHiuuworse9qQjVBPV79Kb4ps=; b=GXGvDIgJnqcQl2QAO3dL2Z4cmC
	oKMWNoGBXR6Wltlsy7URo0t2wQ5/hFou5SEjaJzknN8wRqdfdvN/prjvSLNyhpWSBjQQZxaz52QRQ
	tJcsZSl1epCywfijNWgrfUwWIc0rppTKBrPRTHbbwgVaFJBBC3xUvrvbB0GZtEv4yMbgQ4x9DkSr/
	3XcRgYVq5qbBfJCGx1Givx0dzWSpmA6KvyCFV0+l3zJNrUZUvcszZhZxlqh4txT2scNTmQONuxNIu
	RbLMWjwlBMOMEUFEFFX2q7tKZolp6wDCptUevvE3UYjvsMEQfC9xf5OWNGDvqYzAEtprVr4t/lBRi
	0ld2Ui9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toTBY-0000000Etov-0ROb;
	Sat, 01 Mar 2025 20:11:44 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toTA0-0000000EtcI-0R3A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 20:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740859808; x=1772395808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZfGj1VvKOCNm7vTywX/xNLIbng1hIS9ksg3oRkOji3M=;
  b=FYMlTxg6RLfVSHJ95yMlNhLd183NzOz1V7k97Ov6twBx7wuMFXPzlm5J
   n4pJ7nSlqXXQ50FALFEk4S1k7msylZ5lrres96oi6oRQ0Rem/ZttsbVUq
   /PNLg3GNyYAWhXAzM4krXGZl5XXa+86x8CZpZdnEb6xXm7bo1den5NgZ9
   6T9MtrhAacEmqrYa5U4S4X/i5vo5gnskHcmgKrJS0W71W8CDLjTxJ9Bvu
   Ja3N91PtwWZ9S55mKKTY0jKdvXplHnAk+PZB49UyosLDU12Rx1L7IGHl9
   xk8pI4yK32ntvDlLy9AcwGV7LSo5cCPskNUOknVA4YcDcp91rEfrf9Kco
   w==;
X-CSE-ConnectionGUID: OyH0/dWyRMC1Jr/kMt4OBw==
X-CSE-MsgGUID: xBUC4Rt/Sbq3gsLZjjmprw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41959945"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41959945"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 12:10:06 -0800
X-CSE-ConnectionGUID: n9ipID95TjqGXZ0wuii2jQ==
X-CSE-MsgGUID: c981CLrzROeKm6mC/sKYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117626585"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2025 12:10:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toT9u-000Gek-19;
	Sat, 01 Mar 2025 20:10:02 +0000
Date: Sun, 2 Mar 2025 04:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, vkoul@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dmaengine: Add Arm DMA-350 driver
Message-ID: <202503020324.hFtOv6c7-lkp@intel.com>
References: <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_121008_216213_85FD10B7 
X-CRM114-Status: GOOD (  12.89  )
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
config: parisc-randconfig-002-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020324.hFtOv6c7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020324.hFtOv6c7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020324.hFtOv6c7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/arm-dma350.c:641:34: warning: 'd350_of_match' defined but not used [-Wunused-const-variable=]
     641 | static const struct of_device_id d350_of_match[] = {
         |                                  ^~~~~~~~~~~~~


vim +/d350_of_match +641 drivers/dma/arm-dma350.c

   640	
 > 641	static const struct of_device_id d350_of_match[] = {
   642		{ .compatible = "arm,dma-350" },
   643		{}
   644	};
   645	MODULE_DEVICE_TABLE(of, d350_of_match);
   646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0607ACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 22:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLy5JEG+MEjCYTAVQWciJIIB58SaPqhXvPxApYilWxo=; b=Cz6w/2H2SmEABRJSeagPXgSwxM
	bZYaYX9xlzUwyy8Fk/a4fWnBuXQgSl/603e4/1lVlFuLMdRxsqDjBdNMbanuCHYYur1dn6QfO7+9t
	k/nf3a4/4sa8cl/QCxUE0SAIGKg2PMKaVWyq64QYPL/qoAZmCkptEDUAk4iuLSO3BOAWvtQID755k
	0aYEBatbopwfpGcVtCGdId2e8fCCzsSGyX0Qb8leVdJeGgftBUXpiZwrgKe/jpKYf83s1djtXNmMT
	Xros7hxG1rcgvlS73vr9CDoNIxoGCN82NkqA1j6m7C9q5i6SXjl9Iv2kL9uqeLXoL3Ih8/37GNywD
	bRpAzGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0Bg-0000000316H-33DH;
	Tue, 26 May 2026 22:23:48 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0Bc-0000000315c-49Ee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 22:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779834225; x=1811370225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PeWkXtVByZaI1HB4gRMRQ14IUpZcVF886iBQEGNYfvg=;
  b=QyqMsHl2y2YhxGpSv0q1m9DmiiEwyXVfAiVKRFAa5J5wirb4CcD2yeLw
   YtE5S52kCjOqrTAVTrGybI5U3fuDnnWEm+HKykeBLtb2ap7Q4H5RyIYV4
   yIuYaCqzSxg9pkCYtjX6n5McvQ5i5y2dH/3r7NtJqlSGkG/Azwfnx358R
   jy5Sbw4hZUAzYUGTexkAnMuk7lO2cHw7UPUpl0BOL4nEpcKwn3z7FssIZ
   EKdiCUEo2Gi5uBpeR2v7f8ceSVqbGx7j6nzcIJzSrwg0DpQUdIv3SNb5O
   3IAp8iWVp0VdmpJC0RloAsxAweKLtjdIMQcn6lw3/w2QK3EWHxKHvtOZC
   A==;
X-CSE-ConnectionGUID: pDEg2zRJRZyaHnmw28VLuA==
X-CSE-MsgGUID: 36fvyCMzQ2mLpKeADEODJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80848045"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80848045"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 15:23:41 -0700
X-CSE-ConnectionGUID: jXp1pGdtQVWRxKGMFXbOoQ==
X-CSE-MsgGUID: XwU4YZPvT6+rsx2PIp014g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241890275"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 May 2026 15:23:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS0BS-00000000CUr-2yTH;
	Tue, 26 May 2026 22:23:34 +0000
Date: Wed, 27 May 2026 00:22:41 +0200
From: kernel test robot <lkp@intel.com>
To: Frank.Li@oss.nxp.com, Vinod Koul <vkoul@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/2] i2c: imx-lpi2c: use dmaengine_prep_submit() to
 simple code
Message-ID: <202605270007.xFkhAWbC-lkp@intel.com>
References: <20260522-dma_prep_submit-v2-2-7a87a5a29525@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-dma_prep_submit-v2-2-7a87a5a29525@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_152345_080924_FEB2E0B7 
X-CRM114-Status: GOOD (  10.78  )
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

Hi Frank,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li-oss-nxp-com/dmaengine-Add-helper-dmaengine_prep_submit_slave_single/20260523-041812
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260522-dma_prep_submit-v2-2-7a87a5a29525%40nxp.com
patch subject: [PATCH v2 2/2] i2c: imx-lpi2c: use dmaengine_prep_submit() to simple code
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260527/202605270007.xFkhAWbC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270007.xFkhAWbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270007.xFkhAWbC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/dev.c:124:
>> include/linux/dmaengine.h:1588:48: error: expected ')'
    1588 |                                    dma_async_tx_callback cb, void *cb_param;
         |                                                                            ^
   include/linux/dmaengine.h:1587:35: note: to match this '('
    1587 | dmaengine_prep_submit_slave_single(struct dma_chan *chan,
         |                                   ^
>> include/linux/dmaengine.h:1587:1: error: conflicting types for 'dmaengine_prep_submit_slave_single'
    1587 | dmaengine_prep_submit_slave_single(struct dma_chan *chan,
         | ^
   include/linux/dmaengine.h:994:1: note: previous declaration is here
     994 | dmaengine_prep_submit_slave_single(struct dma_chan *chan,
         | ^
>> include/linux/dmaengine.h:1589:24: error: redefinition of 'size_t' as different kind of symbol
    1589 |                                    dma_addr_t buf, size_t len,
         |                                                    ^
   include/linux/types.h:62:26: note: previous definition is here
      62 | typedef __kernel_size_t         size_t;
         |                                 ^
   In file included from net/core/dev.c:124:
>> include/linux/dmaengine.h:1589:30: error: expected ';' after top level declarator
    1589 |                                    dma_addr_t buf, size_t len,
         |                                                          ^
         |                                                          ;
>> include/linux/dmaengine.h:1592:1: error: expected identifier or '('
    1592 | {
         | ^
   5 errors generated.


vim +1588 include/linux/dmaengine.h

  1585	
  1586	static inline dma_cookie_t
> 1587	dmaengine_prep_submit_slave_single(struct dma_chan *chan,
> 1588					   dma_async_tx_callback cb, void *cb_param;
> 1589					   dma_addr_t buf, size_t len,
  1590					   enum dma_transfer_direction dir,
  1591					   unsigned long flags);
> 1592	{
  1593		return -ENODEV;
  1594	}
  1595	#endif
  1596	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


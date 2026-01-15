Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE7D41169
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4gBkdN2dLGVRIG8cT80uESxv9VOE6pQBgjhnIpqUyo=; b=iQb2SbLWyKtKHF7jMKqleUaPY4
	AERxeDsdwvdSDCi3Pew1yPNxguOQ+4atfFft7N72fb4nT2kRfY7pSvV/NJA1i6d5M6VJhI6KzLxPu
	TBMh6bS2XX4rtWLSogG0E9cze8lH4G5ppCZYUY0ABToN8qYwv0mvMhqatQmdzUzU1OkM6hRR0HMLN
	tPb9GQvRmMUKg17wEf05rETijZBdz+H3nhEes4jXJZtzbVXdcSes+kGziNg/M2xJddYXOdlQN9uds
	8SDe16+jCDlZUpNMYueyYSs0Hg+FB81VkjQWv0YHj8+EtB6pmY690/c/zWLoQm7y7caRame4VtHXF
	J8v2mfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKre-0000000CAxv-2gjn;
	Thu, 15 Jan 2026 10:46:06 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKrc-0000000CAxZ-10vW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768473964; x=1800009964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AYhbb/ilK8QiUl3qPi2RlveC6/IIr877+41kLSNmhVc=;
  b=b01em/wq6o1uR4QhkfoVFWSGuuYbs48ELTnGmDda8SeifsbeL2DVKJZE
   lYNM5VbaVmgF5iaFOI/ER/DIBVGHYnPPHO/1NthqjJ4siTmiqRWqk/sRw
   LbOCIPWv0m7uKPj1k7zaXeX7UKUyxRZ1JDHe90evbMz2QHkZPQsQlwBjl
   PXBIavgOoJfAay3JwOCA9VvBZsPK3N5UGs6vA86xENV7Ol0tS5M1OamTS
   OorOEHzcsE9jQU+rO9ac1KSDLjnkZ7X37fp6Q/2iIv6IxXQquLVGPAX5E
   ND7fpjeB22mK6jT3H8ZbIa2zaIbAJEKuXJmkXho/j9wAIxquvftLMakCR
   A==;
X-CSE-ConnectionGUID: ICvBH5YKTLmOU9kfog0xDg==
X-CSE-MsgGUID: Q6NAVlnuTDCCbQ+RFHJGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80499598"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80499598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:46:02 -0800
X-CSE-ConnectionGUID: cA0Rcv7TT72BfFOxDGNZAQ==
X-CSE-MsgGUID: Z/vQEeZqQIa3gYUaCCFDmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204956903"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jan 2026 02:45:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKrU-00000000HrI-0DgH;
	Thu, 15 Jan 2026 10:45:56 +0000
Date: Thu, 15 Jan 2026 18:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 01/13] dmaengine: of_dma: Add
 devm_of_dma_controller_register()
Message-ID: <202601151857.D1ikP7GO-lkp@intel.com>
References: <20260114-mxsdma-module-v1-1-9b2a9eaa4226@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-mxsdma-module-v1-1-9b2a9eaa4226@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_024604_292682_DE161DEF 
X-CRM114-Status: GOOD (  10.18  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dmaengine-of_dma-Add-devm_of_dma_controller_register/20260115-063955
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260114-mxsdma-module-v1-1-9b2a9eaa4226%40nxp.com
patch subject: [PATCH 01/13] dmaengine: of_dma: Add devm_of_dma_controller_register()
config: x86_64-randconfig-161-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151857.D1ikP7GO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151857.D1ikP7GO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151857.D1ikP7GO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dma/dmaengine.c:54:
>> include/linux/of_dma.h:88:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      87 | static inline
         | ~~~~~~~~~~~~~
         | int
      88 | devm_of_dma_controller_register(struct device *dev, struct device_node *np,
         | ^
   1 error generated.


vim +/int +88 include/linux/of_dma.h

    86	
    87	static inline
  > 88	devm_of_dma_controller_register(struct device *dev, struct device_node *np,
    89					struct dma_chan *(*of_dma_xlate)
    90					(struct of_phandle_args *, struct of_dma *),
    91					void *data)
    92	{
    93		return -ENODEV;
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F1DD41171
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi7D4YXu7EUgXjV736V9eU724sbQ2xTksDlaUry8yuQ=; b=tm1U2yog3i8JsocmQMdQhI8Ils
	sIEZO7iwKbU4vSyMMDhczH4jt/mcuwBPmQ5OYdJnqAw0JsiGOSKhJvSY1rJmhzqrXO01HFYMeFd8v
	KAizvwyyNnIRIECtXBaw1XtR5Z3v6xRI1jVILUTfAICoyfLHP1ws5HBuF+MjdlgQr9zimt9h1oZy6
	agLnKfWhygGEMB8Ns2Wj9yPxa//T7PgF7UukRY4brkEJ3iZYe5NBPVeaXF/5Zdtf66DJbcEpnfJzf
	HN7WrjNtkHbK2k07YY+bbnCUc54jnYW/77aKH5t8tG52lmRniy5FotvMKzIn/W4Vlhqv/McVO1DkD
	5op/uYHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLYG-0000000CE3H-1qz8;
	Thu, 15 Jan 2026 11:30:08 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLYC-0000000CE2l-40aI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768476605; x=1800012605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPpPbvhryAMe1NmcPn+z0LM6XHiUVy15HOBXB0+Othg=;
  b=QuS7t6XSFUNZVTyrjEGyBS43jCb/q+ZZqRUha4q1+k0u+uKL0bqKvvrM
   K1YFw36DZ2v0yKHHzi9u/uxL4qije3q+wQ9d3US/dqU13UVEv6utPVKT4
   gk9IfZ9QVRXj5kJhBfYuxepmW9Izfg8mfkErOCN08o4W9IzycvXgbmkjT
   gd0xj7qONYlP+Xx1bkt5K9RdhFY72vLELdoJcKoi94ZyrDQHA2qDzW2Ll
   ax4+hsrB9qh4Hv8al4MZZWQnIp7G5tJMWtE4MJesI4lsoNzwu9hyFez3n
   rH6aE8mtvfUqGbUTIFLU9d/ifE5ZCv8xZz11MA+3sA4FyE6nZzoLBaXK+
   g==;
X-CSE-ConnectionGUID: RknPocVuRFW6sE9//RxBIQ==
X-CSE-MsgGUID: MyZEYDOzRNu+cuNkbhxc7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72365566"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="72365566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 03:30:04 -0800
X-CSE-ConnectionGUID: wowK3yctQJ6kdZmJLCRrOg==
X-CSE-MsgGUID: I0F7nP7lR+Wm+3bfXfMI7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="235643729"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 03:30:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgLY6-00000000Hsy-0Utw;
	Thu, 15 Jan 2026 11:29:58 +0000
Date: Thu, 15 Jan 2026 19:29:47 +0800
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
Message-ID: <202601151942.cEs9s8Tj-lkp@intel.com>
References: <20260114-mxsdma-module-v1-1-9b2a9eaa4226@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-mxsdma-module-v1-1-9b2a9eaa4226@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_033005_043558_ED1A061D 
X-CRM114-Status: GOOD (  10.72  )
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
config: x86_64-randconfig-r071-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151942.cEs9s8Tj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151942.cEs9s8Tj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151942.cEs9s8Tj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/fsl_lpuart.c:22:
>> include/linux/of_dma.h:88:1: error: return type defaults to 'int' [-Werror=implicit-int]
      88 | devm_of_dma_controller_register(struct device *dev, struct device_node *np,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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


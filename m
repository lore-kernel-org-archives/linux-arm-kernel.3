Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660BEE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk1oTS4OPn0m63wNBiYx4XAxJD/PSEIZkLlqhDLtzNU=; b=xjUhNrivP27N/yePlly6L0hbmK
	wdJbZULhpikABelnsVnC+8kYpAck6riOq3W22HB7FgROfcseMbVMBerr6xFEAuRCdqNRPCY2fkN6K
	0BedZLkwJ0sA0+U4CTYIOjCsetSiezLq6EhnMsSz/i7H1kUdBf1BmmUdNdq4rkxpNs1ZbO3L5qM8R
	p7+HdAyRQnt8bHrV2DcRcFp6ycx+Ek2vIt/hXM0hgsapP//Q6Nz7U2ieOmgRCoUQStxnJSDtDLBj8
	GQiG3SimCY/AInnRmxkWHHsgYaDjT9E/9LEtVWHzIpe2Yo67JU1DVJEZPu6muIUiSDwLntbVO5uEP
	qyvqFpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDcd-0000000GVEg-3nKL;
	Thu, 05 Dec 2024 15:18:31 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDap-0000000GUy9-2LxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733411800; x=1764947800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HMHcEDj1u4GqWG3hL1RI/WKaNLDp5HE83xY8eaa6M1k=;
  b=Odw6A6I9KyDl4gHdf88pBoFxVwkjaJsunlcFA/PPLYCQira2HTOeHpTH
   wrljz12I7LmsybkNLM06rcjwI498uLmEA7To+8npZlXJXwBtHhTQc8hae
   SLoTl5llLqUpIdsBYnpr7ie2xPkXFZdcsCW3I/vhT8xWz8TtAg5hc+waY
   7Hdo0ViH7mCgTkPhDh36xudfADS3sTVXs/MWCXysCd8xD/mFKsojWdkwB
   axAauEZAFlI2SWBAIdfZdGaSR2CKRuaI9LlHJxTJGzElGlyc9KUcUNfQP
   ly0DNV/JqvISRi4qgtJVbLckRlOppo0JAcS8Kbmw5A89R0B2cJkQBvjpl
   g==;
X-CSE-ConnectionGUID: tjYNXVI5Sd2q6SxcKRyfhQ==
X-CSE-MsgGUID: EjPOQYhsRp6apiYjx9PQgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44204035"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="44204035"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 07:16:39 -0800
X-CSE-ConnectionGUID: qM0wgrqgS0m4GFVf3rwMDw==
X-CSE-MsgGUID: n8kyKvbxR1SYEXvK1hJoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="94201590"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Dec 2024 07:16:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJDah-00006p-2h;
	Thu, 05 Dec 2024 15:16:31 +0000
Date: Thu, 5 Dec 2024 23:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Vabhav Sharma <vabhav.sharma@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, frank.li@nxp.com,
	pankaj.gupta@nxp.com, daniel.baluta@nxp.com,
	silvano.dininno@nxp.com, V.Sethi@nxp.com,
	meenakshi.aggarwal@nxp.com, Vabhav Sharma <vabhav.sharma@nxp.com>,
	Franck LENORMAND <franck.lenormand@nxp.com>
Subject: Re: [PATCH v4 4/4] firmware: imx: secvio: Add support for SNVS
 secvio and tamper via SCFW
Message-ID: <202412052340.ub9tlWcC-lkp@intel.com>
References: <20241205-secvio-v4-4-5c37cdc39573@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-secvio-v4-4-5c37cdc39573@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_071639_637126_20E84333 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

Hi Vabhav,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Vabhav-Sharma/dt-bindings-firmware-imx-add-nvmem-phandle/20241205-125909
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241205-secvio-v4-4-5c37cdc39573%40nxp.com
patch subject: [PATCH v4 4/4] firmware: imx: secvio: Add support for SNVS secvio and tamper via SCFW
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241205/202412052340.ub9tlWcC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052340.ub9tlWcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052340.ub9tlWcC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/firmware/imx/imx-scu-secvio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/imx/imx-scu-secvio.o
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "imx_secvio_sc_debugfs" [drivers/firmware/imx/imx-scu-secvio.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


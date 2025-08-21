Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8816FCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6vqJGtJx+J0AFTpg4Fh1JW5lbiMGXuuzSpaFP7qQFs=; b=sWls/VQwbbDWPJGP5fMQjiD9Oc
	ANmgDvD9l+10ppDnO39Ghm83OGhXYRHbaYFPoPO2BkeS7QIspYR27MHDSIDQlvyAWVK2boJb4Xc/G
	DbxwN/Y0tdurhLZSB/jPU8W6/S2otr8VcfS9L7v7mWxt7gDFkN1qN8WubOaFueXPV4S75u4e8xmsj
	thKJzObLbnSo9wgvc4jgN1vxFzgSjda3fxaFt97KL7wZDg7IOClJeoLHLLSOh5IhKQtCV2iTXRyuy
	feGZ/GQlhRmzUe36RsbPXfdvXnmiVsLhiMVI72huvU99Pu9upbGa5Tn9LHRfnFicXqkE5l3DPvthd
	uSYk4IHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAii-00000000Fq9-3DSV;
	Thu, 21 Aug 2025 19:13:08 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up63b-0000000HBZo-1TZ4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 14:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755785664; x=1787321664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ixalp0w2CUYHQ5NQlNHwr+bj0kQmtH2DORccmekLrgk=;
  b=AfjvOPoajuAv8uyjqCh9KCDJrLJoaUObJXqMtDGChw7bhBfaJB5nHZnF
   pSIaA+2WVoEceHBjkrN+7Ap7T9FvmFpaK24QC3Byiv+hl3r7tg2N+WmGZ
   GnWo+YsSdl+ppRglcL6y8Kd0n6mG76mWlm1r7o8wtA+t2pz736TzoBxU8
   DZHwKMxx74TohIRH01Pejc6DN1HTPLhnIYyaasxQeJl/qF4tZHw5T0UTr
   0ZbEdMlgLiVNQWg5GM/WU6qOjOGuyU2Kt74mi/O5V6tUIRKcMpvXMAZ5d
   NPcWHewswFhuuIFMMyHhu4Z5YzeCfyEeqDRSYrQmP15CLBKtDFNH+WRZi
   Q==;
X-CSE-ConnectionGUID: 8B1f/oxdTyaXUHZuYkHdeA==
X-CSE-MsgGUID: bPq8ND47QJeWFb+UoFpNJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69513880"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="69513880"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 07:14:20 -0700
X-CSE-ConnectionGUID: J5U2KbXiQ22QVCBBSZm3ww==
X-CSE-MsgGUID: nNNaBNWlSaSC0tsi88AAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199401653"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2025 07:14:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up620-000KLP-2Z;
	Thu, 21 Aug 2025 14:13:31 +0000
Date: Thu, 21 Aug 2025 22:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <202508212119.gamkDcXG-lkp@intel.com>
References: <20250818204420.794554-4-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818204420.794554-4-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_071423_442262_DF3FD804 
X-CRM114-Status: GOOD (  14.82  )
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

Hi Shenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on brgl/gpio/for-next shawnguo/for-next linus/master v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/dt-bindings-remoteproc-imx_rproc-Add-rpmsg-subnode-support/20250819-044803
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20250818204420.794554-4-shenwei.wang%40nxp.com
patch subject: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250821/202508212119.gamkDcXG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212119.gamkDcXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212119.gamkDcXG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-imx-rpmsg.c:419:6: warning: variable 'port' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     419 |         if (msg)
         |             ^~~
   drivers/gpio/gpio-imx-rpmsg.c:421:7: note: uninitialized use occurs here
     421 |         if (!port)
         |              ^~~~
   drivers/gpio/gpio-imx-rpmsg.c:419:2: note: remove the 'if' if its condition is always true
     419 |         if (msg)
         |         ^~~~~~~~
     420 |                 port = drvdata->channel_devices[msg->port_idx];
   drivers/gpio/gpio-imx-rpmsg.c:415:34: note: initialize the variable 'port' to silence this warning
     415 |         struct imx_rpmsg_gpio_port *port;
         |                                         ^
         |                                          = NULL
   drivers/gpio/gpio-imx-rpmsg.c:503:10: error: incompatible function pointer types assigning to 'void (*)(struct gpio_chip *, unsigned int, int)' from 'int (struct gpio_chip *, unsigned int, int)' [-Wincompatible-function-pointer-types]
     503 |         gc->set = imx_rpmsg_gpio_set;
         |                 ^ ~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +419 drivers/gpio/gpio-imx-rpmsg.c

   409	
   410	static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
   411		void *data, int len, void *priv, u32 src)
   412	{
   413		struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
   414		unsigned long flags;
   415		struct imx_rpmsg_gpio_port *port;
   416		struct imx_rpmsg_driver_data *drvdata;
   417	
   418		drvdata = dev_get_drvdata(&rpdev->dev);
 > 419		if (msg)
   420			port = drvdata->channel_devices[msg->port_idx];
   421		if (!port)
   422			return -ENODEV;
   423	
   424		if (msg->header.type == GPIO_RPMSG_REPLY) {
   425			port->info.reply_msg = msg;
   426			complete(&port->info.cmd_complete);
   427		} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
   428			port->info.notify_msg = msg;
   429			local_irq_save(flags);
   430			generic_handle_domain_irq(port->domain, msg->pin_idx);
   431			local_irq_restore(flags);
   432		} else
   433			dev_err(&rpdev->dev, "wrong command type!\n");
   434	
   435		return 0;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


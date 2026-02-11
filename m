Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E59EB5961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyriNzmnvP4x40dvecSlAiy7TMRMrGedxIqh3u3rjNs=; b=kKTPnBy0MbJcjozIXGq5aQ2t5j
	Y/xC4NohZ8u4rh+nC2BArtgLVMk9kcyzPAfeGZiS4dLwLmCxodjdMu+y94Ie8Z9pWMp5ne6iq0u9a
	X20TRDHqWaarsYZ6+X/9p7gPkPoCnpY3TFp+f0gBomZbn/8kL7ie8bgUAPQuKhFlvYRuko2OQ6XkC
	vxJmws9x9P1FqrP8xzJ4WXRqr+MKsno4eLo/IiCcEPRWO7ch2Y5qhplJdxnkgEcr/RNw6BuKUQZDF
	eKIODmN9TaYM3+qDfECh9vo+EhOZv3xwcLpOsuu6yOtcmYDk3YPZXRHbUF6p/cjcBBpuX4SNvyrQk
	6K1IoThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq3E6-00000000Gwb-2xXe;
	Wed, 11 Feb 2026 05:57:26 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq3E3-00000000Gw3-3vjR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 05:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770789444; x=1802325444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WnpB/MHUvOu0MxaG9qXi+XunVyvMIMGcsZJjH30GK1s=;
  b=hnl/ClR1nMMtjHQwrfc6367FH+n73M0zas8BjGUA6kRHBBgtx98HQFBI
   I3IoMhe9rQ+ls+iXwZCSZPCkDzv34MuJoCxGJ0k9qBNnz7XphlINwcKYs
   JhbnVFdhC+OBVRC38wES+o5j1fwwGSE0R1OZyK2EShiACj8ldcTypKIcK
   5TCZLy4OvImOr5MMiBtZpnnsCw/YgwRLiw+aZLCM2ZhtKdW6onGjmUKDM
   QWATL5TdAxs58ozNDNSq2y8hoKftktn50lVntDzbm/IW8SbfjHEg8Bi3U
   ivPVZyIrwIuI+EX+jshs4TGUEHXL1RC8bsmu5QDs6F3rRb20lTcpPfukV
   g==;
X-CSE-ConnectionGUID: TZeOokoeSI6h8ybaps1nFQ==
X-CSE-MsgGUID: gZzj4dWLS3WgOuncypilEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94569684"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94569684"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 21:57:21 -0800
X-CSE-ConnectionGUID: Cp3x9V8wSLW7rubOh6WZ5A==
X-CSE-MsgGUID: H3wgMnd3QcCarV66oRkcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212176563"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 21:57:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq3Ds-00000000piq-4C4o;
	Wed, 11 Feb 2026 05:57:13 +0000
Date: Wed, 11 Feb 2026 13:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <202602111320.C3eHRtNV-lkp@intel.com>
References: <20260210170814.406883-4-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210170814.406883-4-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_215724_017992_E2BCEFBD 
X-CRM114-Status: GOOD (  11.82  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on robh/for-next remoteproc/rproc-next linus/master v6.19 next-20260210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/dt-bindings-remoteproc-imx_rproc-Add-rpmsg-subnode-support/20260211-011505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260210170814.406883-4-shenwei.wang%40nxp.com
patch subject: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
config: nios2-randconfig-r054-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111320.C3eHRtNV-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111320.C3eHRtNV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111320.C3eHRtNV-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/gpio/gpio-rpmsg.o: in function `rpmsg_get_channel_ofnode':
>> drivers/gpio/gpio-rpmsg.c:473: undefined reference to `rproc_get_by_child'
>> drivers/gpio/gpio-rpmsg.c:473:(.text+0x454): relocation truncated to fit: R_NIOS2_CALL26 against `rproc_get_by_child'
   nios2-linux-ld: drivers/gpio/gpio-rpmsg.o: in function `rpmsg_get_rproc_node_name':
   drivers/gpio/gpio-rpmsg.c:450: undefined reference to `rproc_get_by_child'
   drivers/gpio/gpio-rpmsg.c:450:(.text+0x4e0): relocation truncated to fit: R_NIOS2_CALL26 against `rproc_get_by_child'


vim +473 drivers/gpio/gpio-rpmsg.c

   466	
   467	static struct device_node *
   468	rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
   469	{
   470		struct device_node *np_chan = NULL, *np;
   471		struct rproc *rproc;
   472	
 > 473		rproc = rproc_get_by_child(&rpdev->dev);
   474		if (!rproc)
   475			return NULL;
   476	
   477		np = of_node_get(rproc->dev.of_node);
   478		if (!np && rproc->dev.parent)
   479			np = of_node_get(rproc->dev.parent->of_node);
   480	
   481		if (np) {
   482			/* Balance the of_node_put() performed by of_find_node_by_name(). */
   483			of_node_get(np);
   484			np_chan = of_find_node_by_name(np, chan_name);
   485			of_node_put(np);
   486		}
   487	
   488		return np_chan;
   489	}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


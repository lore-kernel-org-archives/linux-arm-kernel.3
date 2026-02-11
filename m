Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0916FE9E315
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bVWd0Jv44kl2wpkmuGZREDEAz0wrVkxyZwkUzpiiuU=; b=Nx9dZwtx/ewVSKv+7RAY8aKujg
	B++5nNjBp/GYhn1upHnpitMWVmAfVgkWpLkx2RV8sRlIJqbPE/Ezy2ZIGzoukWQquaSbrIqW5sgQw
	TQUZPKjSWolQmlYNhiP50Bx+W+9G7S5Up2kMENevfE4mrF5AeFRN7Cgxo32u9jB+YaEPtOtyGUzyA
	IHM65FqRs+KgBqQuFs/yFXQ08iu9XkGd5SMvFVtubXlrl2OtWYIzOG9lQLRme2jgi/Sm7vKzIwNDv
	NShmPsmGdW6Ibj1TUJI59K9O8461L+B/LvIjtt/rK2XO2+bI7CA0s41BM3D1atQpDPDaoMTScDT/S
	oaAVyIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBLe-00000000jop-1Auv;
	Wed, 11 Feb 2026 14:37:46 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBLb-00000000joQ-2Lt2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 14:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770820663; x=1802356663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6a6C1Oo2VXTtwxfCgh52YB7e/Bvv2ZnnllQSS7+LNqk=;
  b=eY5lJ2qtamJtJNVrwH3HYNbvcYw5I+j6yaJEXPoZWyb/uUtJupHE5liL
   2jxAAqqsiLpSXKsOVxElUmEySjwXHIfXPds1tTG3TRzJ3eIAEG7N+Z94n
   Xdk146AWjgRilPqVOomQyc1yLAoTkZA1aiV81F3hf1aIUADu6Cjb1onGp
   kJzSYzZM2oryQlat372nMR7uHhMGtUF3s0O1Kqco2NsV9Y3Huc9rDA8FI
   FTh6u1vT9BEu9roudofFkSnfIrFuzkIRPwoDT53iMcPV26S874rCNG6BE
   GAavgU7sNbeo+wamID2I+9hglJHcW9IG6fbQpHV/4IJpmQrnF8t90UXn/
   g==;
X-CSE-ConnectionGUID: Yy7mPQkMTDuF72S4NCsfCQ==
X-CSE-MsgGUID: qn7vr6+QQlCGN9NxwGK4aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83410597"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83410597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 06:37:40 -0800
X-CSE-ConnectionGUID: 1olVpYRZQImHZO61gK3Adw==
X-CSE-MsgGUID: WJelymD/S8WHbDyy+MdGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212094960"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2026 06:37:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqBLQ-00000000q4e-2HC3;
	Wed, 11 Feb 2026 14:37:32 +0000
Date: Wed, 11 Feb 2026 22:37:05 +0800
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
Message-ID: <202602112252.gWFirLCA-lkp@intel.com>
References: <20260210170814.406883-4-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210170814.406883-4-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_063743_687392_3BDCABCE 
X-CRM114-Status: GOOD (  11.42  )
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
config: sparc-randconfig-r133-20260211 (https://download.01.org/0day-ci/archive/20260211/202602112252.gWFirLCA-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112252.gWFirLCA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602112252.gWFirLCA-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/gpio/gpio-rpmsg.o: in function `rpmsg_gpio_channel_probe':
>> gpio-rpmsg.c:(.text+0x788): undefined reference to `rproc_get_by_child'
>> sparc-linux-ld: gpio-rpmsg.c:(.text+0x834): undefined reference to `rproc_get_by_child'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


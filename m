Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F7CCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWi/OQEr2IQODA4jCmFezRNAMXNmH2ny6JC55gj/Z5Q=; b=W2+I1aOSMJLMHW4NGVpWbd9b50
	8OamW3Pz7kevZBg4s/nsSuV42WxAXiRPJncxC5e+/+HsNbk5zWCHq0pxdYTbGFMqKfMLgAv85mX4k
	AExKyCTsOr6mUsQysvcCJ4MO7XUCGKfAfP1G3+KiW6eWdpsdljgHf/7gRWYg0nkPnZdw6EWo3flU3
	k4DmKtMSCIZ2AwVWyuh+aMpZZOkasG8i2MxZT9uEpXJvCjnFeoixQSW0UgnJFRgHWqHKibGjbMMXs
	HKclkz7EoJ6172Xt+bG7p5RQ3+CJQfgc70Xem7yi3XrHRddXSdX5rcM5HlTkgWfatByOhdpf4TCUZ
	cTmFsqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsCz-00000009gKx-0f7g;
	Mon, 03 Nov 2025 10:54:45 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsCv-00000009gIB-3lza
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762167282; x=1793703282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eAO6uuVvRpX5kBZXZELX/CH9fZ5qwDFj2NrOEEcA+3Q=;
  b=POs3i364/xL1mmDFUSXNO20wXvnjzQzPF0T8YxxlgGH/n8I6/0mFHktd
   vWtEtrmOjfQPZd575krNoE5usXFbrqgcRpR0jyhWWCID2ftnRSbyJX/O6
   FDxB78brIMTqo6A1Rmgk2yBaMS4OtbL/BH70nb93RVMhI0Mxmi6VC07hz
   S1bWdCJQSi9J2IppOk0/q7AkQ5c9Aibx6gpgI8dFKJHyhyKyJY/gYlebx
   4maWW2FMgb5K4PcjzCBza2IHTOJvSpgtynmH+MHiCnrPWJCcRNWQPHV67
   2UKXteBDsbErQ8Xxs4mp6pWtU9+8va0LpgRFyBXPPlu8uSbeBw3fTboP2
   w==;
X-CSE-ConnectionGUID: OAX8bSnpSZ2tYYs9n4piUw==
X-CSE-MsgGUID: shnoz0DQTqubWFJSSQuCfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64142967"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64142967"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 02:54:41 -0800
X-CSE-ConnectionGUID: UQnYsNNPS/uLYv5iauyKBg==
X-CSE-MsgGUID: Sv09t+vDRviq/kcdagPr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186710667"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2025 02:54:35 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFsCn-000Q30-2G;
	Mon, 03 Nov 2025 10:54:33 +0000
Date: Mon, 3 Nov 2025 18:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 3/8] clk: imx: add driver for imx8ulp's sim lpav
Message-ID: <202511031829.Ju1yYI9x-lkp@intel.com>
References: <20251029135229.890-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029135229.890-4-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_025441_996270_305752B7 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Laurentiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelvesa/clk/imx]
[also build test ERROR on abelvesa/for-next linus/master pza/reset/next v6.18-rc4 next-20251103]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurentiu-Mihalcea/reset-imx8mp-audiomix-Fix-bad-mask-values/20251029-225054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git clk/imx
patch link:    https://lore.kernel.org/r/20251029135229.890-4-laurentiumihalcea111%40gmail.com
patch subject: [PATCH v3 3/8] clk: imx: add driver for imx8ulp's sim lpav
config: arm-randconfig-001-20251103 (https://download.01.org/0day-ci/archive/20251103/202511031829.Ju1yYI9x-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031829.Ju1yYI9x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031829.Ju1yYI9x-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__devm_auxiliary_device_create" [drivers/clk/imx/clk-imx8ulp-sim-lpav.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


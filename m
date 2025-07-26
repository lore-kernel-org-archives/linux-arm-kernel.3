Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D711C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 21:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vDRpf83Xlhsi3aKZyAzQYYjME+ytVK8EgjXOAcISP8=; b=kceZ7W/RXGOXdpMB7OIWV6kF08
	rRgpKUuQK30urV4EAn8aOoMvphvwAx6fnJz+UXf2x/cUzkAKsDzSHaEY1GT3I2tCYiJkTaJ/QEX5Q
	CGIiyEJyvAWpGrrpfjKcfUmhrokifCG5273FXbkIgugwqfZ9Rqnf8gIKLXyR6QwbRILSdNDdJ2WXa
	caXlPgGmadmI4na5KZ0u0ITLXeVhOmmhtMhgSb9axHXv102OwNWbcMA/cf7Dl4n6lxIbOkz6k3xbM
	J0gdhHgcmLQgs6OPRFu/N+8A4xJT8T9u76CbSXnLx8kyrHhaybTnAxt6led+hkzEJkGZx+k24GNKM
	lpXqkVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmpN-0000000By35-1ZHy;
	Sat, 26 Jul 2025 21:53:13 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmmq-0000000Bxst-0HRq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 21:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753566637; x=1785102637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hSbqujNyJtfgoVzH7Vax+KT9pmAhM1E22Hv7yYf+bQ0=;
  b=PpyA2QooPrGCTFCJd/WY6TU1tD1SG4C+qhpc+T8z0tY0cX3NNmpigMme
   j3x9P1uAZY6M9R3k4eXA8sRBEfpmMUo91SEMTkD8huIbw0AaFJ1DtOAt8
   FAMyX0wtUDn6SSPKvgYlyALDMIh8GIE3e7W3YzPLBu74kIW/1BDOX+qik
   m//GsKhBDYoWFSg3Z/e8/uDczR8Czpd5/2fzy54fLTfmN4LjXky/r9oPG
   haZsmbOjcB5Vjt1ztEWcP0+o0FibDyAKo+9tGy/bkOpDAdPVwlj1Mr3vd
   /ms7MNSVzblMeoi0sjPJuCNkL09LDhsSbp2bC32e/HsVNsVa2bzVPy0vo
   g==;
X-CSE-ConnectionGUID: we5RCQ7UQQGhom8mGzlLMw==
X-CSE-MsgGUID: hTB2aHwLSv21xJTp2gk3Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55721670"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55721670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 14:50:34 -0700
X-CSE-ConnectionGUID: YUbCUJRlSDSYtBKh9alZxQ==
X-CSE-MsgGUID: msO8MjvYQuO0CppyXIzicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192644434"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 14:50:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufmmg-000MJH-2B;
	Sat, 26 Jul 2025 21:50:26 +0000
Date: Sun, 27 Jul 2025 05:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>,
	Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Maud Spierings <maudspierings@gocontroll.com>,
	MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH 2/4] backlight: add max25014atg backlight
Message-ID: <202507270543.G0TT6f25-lkp@intel.com>
References: <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_145036_146693_81FCD79D 
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

Hi Maud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]

url:    https://github.com/intel-lab-lkp/linux/commits/Maud-Spierings-via-B4-Relay/dt-bindings-backlight-Add-max25014-bindings/20250725-191221
base:   d7af19298454ed155f5cf67201a70f5cf836c842
patch link:    https://lore.kernel.org/r/20250725-max25014-v1-2-0e8cce92078e%40gocontroll.com
patch subject: [PATCH 2/4] backlight: add max25014atg backlight
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250727/202507270543.G0TT6f25-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270543.G0TT6f25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270543.G0TT6f25-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/backlight/max25014.c:86:4: warning: variable 'res' is uninitialized when used here [-Wuninitialized]
      86 |                         res |= 1 << i;
         |                         ^~~
   drivers/video/backlight/max25014.c:82:13: note: initialize the variable 'res' to silence this warning
      82 |         uint8_t res, i;
         |                    ^
         |                     = '\0'
   1 warning generated.


vim +/res +86 drivers/video/backlight/max25014.c

    73	
    74	/**
    75	 * @brief get the bit mask for the DISABLE register.
    76	 *
    77	 * @param strings the led string configuration array.
    78	 * @return uint8_t bits to set in the register.
    79	 */
    80	static uint8_t strings_mask(struct max25014 *maxim)
    81	{
    82		uint8_t res, i;
    83	
    84		for (i = 0; i < 4; i++) {
    85			if (maxim->pdata->strings[i] == 0)
  > 86				res |= 1 << i;
    87		}
    88		return res;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


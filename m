Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70601E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 05:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DJA47BG2pGysb0Tyq9sawulCuM1ROK4RRAPz1kYKmA=; b=uMcYqWqJ492AW8TewMYk/gS3P9
	1KD+36rQLxNRrLBDf7gp/fUetFbNEE25qUQxnGkGuRCUThGBGGLvgEF513dd4xG5cHcah31AyFPD1
	YD8i+Yc2VT8hyvGbt19JJY1wv0Q7FtqE+HE+YZVWdMkdHGah+VttewRXh4coqMSLqNxDfvhGvZTCx
	kc5ZasOn0daoapDl4fSijdQKqkPAf6L9i4HO7/9qTMU24EXzWZ6biqQAd6S1NJZLH03FnKCcjwwni
	k8Uxjpz4zaD1vn+euTxXdPZ0Qt2e/W9jRTvTfBzMFk3q1OFFvVOydJZEkAIxHQJHaQmHRmHT36CSI
	C1j7DDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS822-00000004ZAL-1e9o;
	Mon, 30 Dec 2024 05:09:34 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS80p-00000004Z5C-16gf;
	Mon, 30 Dec 2024 05:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735535299; x=1767071299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QEr9m/kpwoAKcOTXFZdpA4TR0Ejlf9x+n93FmmoNoTo=;
  b=Cq7IMIgalTG1B1N2cZjNlYKYtJ+QM2wTlagjAus9qERPaW5LXbZDGZbs
   NksOe8QPC4Or0GX2FeptFiwx+yeXTsti1b0caVqlbVm1ULHchZp5wgxlI
   z0u24PKTSHs+y8W9xie2lQZOqqqoYcPQhEXIi9HAInI0cAxgHqfSsalQN
   bNs5aaJzu/kRIXMqWQkONdT/6Fxnf8RWKGNWidotxV+bYoFoSd+/Oz3nv
   yVVlN+JsshfJMa1V0l4hbFdUashbuOlW3kEBIhHb0189cx8SbQPxUxbiB
   vYLQO6rr08rohWiJM2m18kO4p4XP/4DPM5zdso8o5xQC+L4da1HRwBDW1
   A==;
X-CSE-ConnectionGUID: f0dF8qg1TxKrQKxpv98rMw==
X-CSE-MsgGUID: SFNihSvKRFy1V4nnReJzHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46405690"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="46405690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 21:08:18 -0800
X-CSE-ConnectionGUID: V6tjbp4pQ1ymisDzV8sSGg==
X-CSE-MsgGUID: ikn8ysUhSIKMtYZzU4aohg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101542016"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Dec 2024 21:08:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS80j-0005NA-1d;
	Mon, 30 Dec 2024 05:08:13 +0000
Date: Mon, 30 Dec 2024 13:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jimmy Hon <honyuenkwun@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH UNTESTED 7/7] arm64: dts: rockchip: Enable HDMI1 on
 Orange Pi 5 Plus
Message-ID: <202412301233.GT87d39d-lkp@intel.com>
References: <20241229184256.1870-13-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229184256.1870-13-honyuenkwun@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_210819_342535_BBEC83FD 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Jimmy,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jimmy-Hon/arm64-dts-rockchip-refactor-common-rk3588-orangepi-5-dtsi/20241230-064740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241229184256.1870-13-honyuenkwun%40gmail.com
patch subject: [PATCH UNTESTED 7/7] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Plus
config: arm64-randconfig-001-20241230 (https://download.01.org/0day-ci/archive/20241230/202412301233.GT87d39d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412301233.GT87d39d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412301233.GT87d39d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts:127.1-7 Label or path hdmi1 not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts:131.1-10 Label or path hdmi1_in not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts:137.1-11 Label or path hdmi1_out not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts:147.1-11 Label or path hdptxphy1 not found
   FATAL ERROR: Syntax error parsing input tree

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


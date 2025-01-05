Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DDCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 00:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JysNc8TRRI63seMT2EXK88p9Bo23vYEplVtU5I7vng8=; b=tKTyPXimoRBDC8pxwKD4qTFlf+
	Rj+40G2CEfiQwOzEMQfO+veCo57W251OIbVsqX5TEnlsj8K71BNPnkJRTM2uwKyp3t4lC4ih9LFDK
	4iut4xRjHzcfG5Zml/9pLjRKUsTBhtyOl1OcTSHEEGj6FZubcKKKBC/ke5/GLBJT0ktKzRkq7ywUd
	xLpNG27UEhVXyeG8GPwN/sZOsC81nNqmVjKoU6/mpgAfobfwoyTqEL4VmcsFDXJQcaP6A58ik9zDq
	wOJFmRIi/orKuZpAYpiuY+IEhTJsH+1RfDlUD5z1EiBE1gRz6b00P5YVDaCxs5/ZHCrvm2+VF8f5Y
	/Vy+sRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUEWq-0000000FtzM-3ZDp;
	Sun, 05 Jan 2025 00:30:04 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUEVf-0000000Ftmg-3TRh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 00:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736036932; x=1767572932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ha0luu9hiAK5+1mfWX1KsAJ1kNx3anO7Gu4A8rsUsNo=;
  b=T03vOvK/E7lnzjW7fHC764Sl1BU7uKpdQQb4pPj64MuYwommMDWRhKi+
   HAYPSENE+8jds/MfZ6vZYf3RFJ1tHoGfZVqD1b+olBEeH9qmzfqLTMD3w
   aUmVwmZacYnlstva1zYc3GYVG0ELfMCodMdA/Wlnv+IyOsfh3dheEl9Oq
   dw2nWbZqpY1hzRn0Xd3lbxVed4K/hoFtcnFU0HwSqjqxnP/pDBVn/ArZe
   z1MOBHxuj8DHC4NzByBnzQXIzNIBGQlpeL+kOoDVLxcRazn/zH63cCF6a
   +VKH3yRgYwzD0E0LLv1A1hxxkhHxiioY9abek0wVr5ptiB4b7lJV3GFeL
   g==;
X-CSE-ConnectionGUID: lYUEy5oWSV6D3QymIX1//A==
X-CSE-MsgGUID: NPOsyiknQRmkDt5YL8lL3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="35531003"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="35531003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 16:28:45 -0800
X-CSE-ConnectionGUID: 5YZTBN2JRYGsUB+DQR1fwA==
X-CSE-MsgGUID: t5VFkvDQTMyR1CKV4A4zyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133019800"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2025 16:28:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUEVS-000BKp-1D;
	Sun, 05 Jan 2025 00:28:38 +0000
Date: Sun, 5 Jan 2025 08:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: exynos: exynos8895-dreamlte: enable
 support for the touchscreen
Message-ID: <202501050840.JpoautB7-lkp@intel.com>
References: <20250104164321.333669-7-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104164321.333669-7-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_162851_908396_22371E6C 
X-CRM114-Status: GOOD (  12.33  )
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

Hi Ivaylo,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on next-20241220]
[cannot apply to robh/for-next ulf-hansson-mmc-mirror/next linus/master v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-mmc-samsung-exynos-dw-mshc-add-specific-compatible-for-exynos8895/20250105-004605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250104164321.333669-7-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 6/6] arm64: dts: exynos: exynos8895-dreamlte: enable support for the touchscreen
config: arm64-randconfig-003-20250105 (https://download.01.org/0day-ci/archive/20250105/202501050840.JpoautB7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050840.JpoautB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050840.JpoautB7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts:196.18-19 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


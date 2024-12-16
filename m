Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37ACE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYytabqxt3kkHiUQhCkfX3bSV7UbCfUEVtARO+URuMo=; b=Qo05L5RfnBFmiSTLyYvuRoO3mT
	djWKTcvgvHS2rk3BUleLXtsQL5Nc/pFWz3gMGNl2/8gvwcXtsbL7auZf6Jv1mFbiXmtumR6T0UArz
	m2nk9tK7F6ark8rozvfyrruwWzuKNoUhP+psc3ScZ4KeR4voWXG2CyZ3Ge8iTLgLXXpUI2DA31t4x
	YwmLDT7a4GtRT2q1Oqr+HNsqB2aJvinBu/vPVDBd4Jvq58bKHBcU7d0gCNNiYJY5kGXF3de+4d3EW
	GIhonldKVPNJUQzJg+QGrXsFpE4SbOsfkaC9IJ1czXFt3Y/uvhNPbOb8MZuPchWSzNZ39ho9YRcE7
	vgO2SJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEwe-0000000AmQE-1wAP;
	Mon, 16 Dec 2024 17:31:48 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEvX-0000000AmKF-1oHY;
	Mon, 16 Dec 2024 17:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734370240; x=1765906240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0GHTmDW24yDL/L87YNar8k/bzXJLqW1qzxXU3jUJqm8=;
  b=Yv080nwb8BRO3R523aqIz9fyHdnQ6D9nAQ5dfV9w6pwjiTP+t2CVVAKG
   cAFjnjjrZ12X9qWK3HhGC4dBZQHsZ0BL8u/VENoRxzQ9G1r8AY8ntfnac
   RHI1CID5fMQmsmKnY8Gd2bqIoXAAbFujDmg8/6ESrow13iNYeXPKwyqV6
   r7/xi9w29exUSihqSlk+bA9OWE3G95cTv85xQQO3bu+NVmqeAa0pBg4Y/
   vItsmLrcP9vHyTROCH0Lu3YvfLTsCT863psToxZvVPJj1Ko0VnyMZ7vWw
   JfJaw1K26XcCh08bfI+pkMDx2i0KzVnFcg6EWWpvSzcR+w/Id+NsULUwy
   w==;
X-CSE-ConnectionGUID: bya4A6ajQ6KwIWURPV1bSQ==
X-CSE-MsgGUID: 2gTH/YOHTWa8FkFn/e2TAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38445522"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="38445522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 09:30:37 -0800
X-CSE-ConnectionGUID: svyeDUJLS5e0ZfTRRRv9iw==
X-CSE-MsgGUID: EWI4KAF3S7CLXQ763EqQ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134602748"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 09:30:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNEvP-000EMq-2r;
	Mon, 16 Dec 2024 17:30:31 +0000
Date: Tue, 17 Dec 2024 01:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	herbert1_wu@pegatron.corp-partner.google.com,
	Thomas_Hsieh@pegatron.corp-partner.google.com,
	Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Subject: Re: [PATCH] arm64: dts: mt8186: Add mt8186-skitty
Message-ID: <202412170154.QsBtjHdl-lkp@intel.com>
References: <20241216-skitty_kernel-v1-1-bc75dcdfeb57@pegatron.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-skitty_kernel-v1-1-bc75dcdfeb57@pegatron.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_093039_513049_70525763 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Geoffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8]

url:    https://github.com/intel-lab-lkp/linux/commits/Geoffrey-Chien/arm64-dts-mt8186-Add-mt8186-skitty/20241216-153651
base:   78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
patch link:    https://lore.kernel.org/r/20241216-skitty_kernel-v1-1-bc75dcdfeb57%40pegatron.corp-partner.google.com
patch subject: [PATCH] arm64: dts: mt8186: Add mt8186-skitty
config: arm64-randconfig-003-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170154.QsBtjHdl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170154.QsBtjHdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170154.QsBtjHdl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtsi:42.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


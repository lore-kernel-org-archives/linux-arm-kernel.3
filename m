Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2E1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNaYCOH6q8B2sMZ4yn9nh0qmdCTyQhUKfDdeAVmc7Uk=; b=4vf212ywiM++MxwEO6ePunU8uu
	3+nFBAQLnuw+AJxrApDv5zUnC5YJXfkItG+LYDUb2rUaGx4KTPPrzrzAvbI4s+169/hJ/FlYBqsWz
	H00xENZ1X09tFL9vcX6px1wWp3AUDQlME9S+T69UrCTlT3YZ1hZCxC8cW+KBHzdPKlKCIRCSxVXtx
	X5nieRz9jgPiRMH1B/MOMgresKqmFM9TqPevbaQLYBCip4umfEZQcz2At7+PK3KKMicqbBH+GxuO/
	CoCEWxqMcxKKoeFm+9W4hcvn9/L0r48Cv+6lwn2KYqglZF2IFspaixNCBPcLXWiloN4t5IwuvjjRZ
	m9j0ZGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavDL-0000000CImX-2t3q;
	Thu, 23 Jan 2025 11:17:35 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavC2-0000000CIVw-2gFj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737630975; x=1769166975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Cz3JuNDr+ExBTbgwX6Lb6uNnmnKpu0gWkh0CTOb8Y8=;
  b=RH2yU6nPLN65+TiuXXsXtjfbLaEluAJ0IGTRP/A1tZJUHaa4Sv2V99m6
   nOaMurd3LRTu249FD3QSnR9lCqWVW451ezQyg+KhmrwpLeI1831MEeHQk
   GMoTVDonN0q51xVRVNZu2WlCt66OhLWYi/aKhEwSDZoqyK0tru6lSRgdt
   5KSimUMEmvejd7nFlERpUxmhd/RjVexfRcRgpmMxyIp9mCJV3uaPk9sgG
   GlEKvDh+hu2QEHR/4MRc73mfU2wCiNzw2xDSQPLdOstBWoGnI8MmUb4D/
   MvyKDQex+iGomgYYMD2dPHin6h04R9h9rZSF4C041qa6P7hvr3XuOP4qp
   g==;
X-CSE-ConnectionGUID: 0I7HJm3WRNG0QucsdxWt7g==
X-CSE-MsgGUID: xtBHVCmUTHWGQoemfHDvsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38039970"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="38039970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 03:16:07 -0800
X-CSE-ConnectionGUID: CsXKwGQ6Rs20KwpQzkTghQ==
X-CSE-MsgGUID: s6lMtdZhSTKdNdPQ97sWHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107350853"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jan 2025 03:16:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tavBo-000b6d-2j;
	Thu, 23 Jan 2025 11:16:00 +0000
Date: Thu, 23 Jan 2025 19:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: Charan Pedumuru <charan.pedumuru@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Durai Manickam KR <durai.manickamkr@microchip.com>,
	Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH v2] dt-bindings: dma: convert atmel-dma.txt to YAML
Message-ID: <202501231832.JO111vnL-lkp@intel.com>
References: <20250123-dma-v1-1-054f1a77e733@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-dma-v1-1-054f1a77e733@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_031614_709390_F0A9FBE9 
X-CRM114-Status: GOOD (  10.41  )
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

Hi Charan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 232f121837ad8b1c21cc80f2c8842a4090c5a2a0]

url:    https://github.com/intel-lab-lkp/linux/commits/Charan-Pedumuru/dt-bindings-dma-convert-atmel-dma-txt-to-YAML/20250123-173101
base:   232f121837ad8b1c21cc80f2c8842a4090c5a2a0
patch link:    https://lore.kernel.org/r/20250123-dma-v1-1-054f1a77e733%40microchip.com
patch subject: [PATCH v2] dt-bindings: dma: convert atmel-dma.txt to YAML
reproduce: (https://download.01.org/0day-ci/archive/20250123/202501231832.JO111vnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231832.JO111vnL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
>> Warning: Documentation/devicetree/bindings/misc/atmel-ssc.txt references a file that doesn't exist: Documentation/devicetree/bindings/dma/atmel-dma.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/dma/atmel-dma.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


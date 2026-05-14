Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32B7CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daz4LMEo8nCEydnFK0zjrq9qJylLQxczPgtQdJUJrrA=; b=rzSuRPCCFnaYl/UjCb3vaApk2R
	gnInPvdJESJhh5UFbgG5ctmGUaMW3r2lXCJtiQQLI6eD551n73WnRTnsDLd91L4h+Hz8KoSTMbBH6
	AH5xPKuaQBTLdJQiZVtxv3xYiCP8DgxxvPZiaXx4CsIIs5DEh34VzJTe7oYLgp4tyHyyiBIFPnP79
	JeXKls3YU342zF0iYDoxMfb4bNZhnNFSd4ARuZqv0z9RHdBV/tnaRTVpi4ydjMgvdkCZVnYb2bZqq
	aYZ+CaD8LbAis5UHY/4lZ6oenZ6nems1DjSa9oUu1PBXvs3eSzLs0bsisYqG4gUsVZ/i490dIPOR8
	uremnJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNV2s-00000005RL0-29WK;
	Thu, 14 May 2026 12:20:06 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNV2p-00000005RKQ-3epQ;
	Thu, 14 May 2026 12:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778761204; x=1810297204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3d8DUSA04YEeeaSJDsq0tBuKoX/EgDy6elaulwtaoYI=;
  b=EdMdUiaDZfUGiTIdB60cT8rkUYm/RKnxd8VCnb59IFrQc91jv+lPoza4
   FHWD24cUhZvFK5x7EiBmLfgNJhf9MFfX3yJV9p0qyV/Uw9/UIdIg4S9tt
   e0YYbpv2HG8fhoS8G4WnYgvLopJzNbX7ozU8YrqqHtO2WSXfGpPojIMgS
   6ogYTRioHMyZj2d7puHCgomIX1af0rFnsU9eI9MIGDU/11lNjBwzihO1m
   L0JlYq/FvxpPRnHX9Zw4ZOQLutFLmOq9eZzoudQi3tHZdVOg/DuV9ew5f
   7eYDLpW2ykE3bfKPjn7yRvvqUVZ7VMVaR/L4OiRnFQXgF2b67il6PkvKP
   w==;
X-CSE-ConnectionGUID: EqlS5TwsTWGVnRkNI2PE6w==
X-CSE-MsgGUID: fR2hGJnuSLGdQAXfzLqqeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91087132"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91087132"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:20:02 -0700
X-CSE-ConnectionGUID: SgABm03mTjmMHc+nrGJewg==
X-CSE-MsgGUID: EJUbuaw/RnyDNWwkMBfBxQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2026 05:19:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNV2i-000000008oV-0F3n;
	Thu, 14 May 2026 12:19:56 +0000
Date: Thu, 14 May 2026 14:19:35 +0200
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	s-vadapalli@ti.com, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
Message-ID: <202605141426.2RPW8nvf-lkp@intel.com>
References: <20260506152346.166056-9-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506152346.166056-9-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_052003_954179_2C71E970 
X-CRM114-Status: GOOD (  10.60  )
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

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on a293ec25d59dd96309058c70df5a4dd0f889a1e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/PCI-Add-pcie_wait_after_link_train-helper/20260514-132815
base:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
patch link:    https://lore.kernel.org/r/20260506152346.166056-9-18255117159%40163.com
patch subject: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link training
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260514/202605141426.2RPW8nvf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141426.2RPW8nvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141426.2RPW8nvf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pci/access.c:8:
>> drivers/pci/pci.h:73:3: error: call to undeclared function 'msleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^
   1 error generated.
--
   In file included from drivers/pci/rebar.c:17:
>> drivers/pci/pci.h:73:3: error: call to undeclared function 'msleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^
>> drivers/pci/rebar.c:142:31: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 140737488355328 to 0 [-Wconstant-conversion]
     142 |         if (size < 0 || size > ilog2(SZ_128T) - ilog2(PCI_REBAR_MIN_SIZE))
         |                                ~~~~~~^~~~~~~~
   include/linux/sizes.h:70:20: note: expanded from macro 'SZ_128T'
      70 | #define SZ_128T                         _AC(0x800000000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:37:1: note: expanded from here
      37 | 0x800000000000ULL
         | ^~~~~~~~~~~~~~~~~
   include/linux/log2.h:162:14: note: expanded from macro 'ilog2'
     162 |         __ilog2_u32(n) :                \
         |         ~~~~~~~~~~~ ^
   1 warning and 1 error generated.
--
   In file included from drivers/pci/msi/pcidev_msi.c:5:
>> drivers/pci/msi/../pci.h:73:3: error: call to undeclared function 'msleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^
   1 error generated.
--
   In file included from drivers/pci/pcie/portdrv.c:22:
>> drivers/pci/pcie/../pci.h:73:3: error: call to undeclared function 'msleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^
   1 error generated.


vim +/msleep +73 drivers/pci/pci.h

    62	
    63	/**
    64	 * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
    65	 * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
    66	 *
    67	 * Must be called after Link training completes and before the first
    68	 * Configuration Request is sent.
    69	 */
    70	static inline void pcie_wait_after_link_train(int max_link_speed)
    71	{
    72		if (max_link_speed > 2)
  > 73			msleep(PCIE_RESET_CONFIG_WAIT_MS);
    74	}
    75	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


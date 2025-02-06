Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64B8C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 23:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smQJl3ePCs8jGnt2Sj26A0AseZjXwWnj+sjvgFlY7DA=; b=wvD4Q2VRGjW5y5wtUtLJo/PXB4
	0AvACU7RuYHQECP62G9QoNo/YgnQarU7cH7zAXmbKhUm8GL77m3/VHG62lBch3qjcEMhLnBdD5Lc3
	4FH9EVNuHhleLwWW9cao7KNYa/p4hQRlz2Kx3AdFPWQmPNW5Gc1CBmi0IfHMHLcQRVM/a0Ez/HCew
	9cdPWc9Qz2Er1oKONeE55hpRwsSZTfiUWrbAhKfZU7FOm/TJQ5HDjDMEWpNM+BZ+bsopx8GCMJcfD
	Zy9kH3x1TbRTdq+4U8Lao35B9/Ee1VSjx1YbRLB8T/4yOmUTgjqmBiLePRv5WyyKufWSxGgKYRX9V
	D0DAsZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAzT-00000007lbh-1Rth;
	Thu, 06 Feb 2025 23:08:59 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAy5-00000007lVZ-3yCA;
	Thu, 06 Feb 2025 23:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738883253; x=1770419253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=boGdQ7S8b0YyNfxIm4I50jD6mtmzak8c74/jeqYssO4=;
  b=k1xniVivBAiawgDg65TlbBya4MT+frFcK3aywFGPcR9vJZ6h4wdlOZqZ
   5ec6nGNZfmTL/6UFgT+mYW9TJL9qLjiTeE2hrlSXq0ql3IiVfTzVQVwlj
   94hxokEO2W589mfYkWM7dLDgTRaVi76cVkdaNNb24RRU1TukOiHAPSC9a
   M1IhFryblXcqoPXd9lMSW4cgjfIa9p/+6ha8u0e0Lda/oJSpOgzDOYij/
   xgfIrMhKsREMO+slB6zA1xEsUavSFXDdFJ91fqVYZy2hc7yQBTQ+W/qPs
   snX/KVh4qQyR/rmQ+Vg1VbpVF9yhjsHaABnAcre9y/C6XADkStrn5zYPQ
   Q==;
X-CSE-ConnectionGUID: S58PUdRgRAKBJoWUJSOn+w==
X-CSE-MsgGUID: tL1AE8syRsCmclwuapAJZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50946262"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50946262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 15:07:32 -0800
X-CSE-ConnectionGUID: EQwYRrGCRW2DHPzG7W2gkg==
X-CSE-MsgGUID: q85618KpRbu5Bb86PHmPeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111132680"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2025 15:07:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgAxw-000xUd-1j;
	Thu, 06 Feb 2025 23:07:24 +0000
Date: Fri, 7 Feb 2025 07:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 10/13] net: airoha: Introduce PPE initialization
 via NPU
Message-ID: <202502070610.tbfoIwkS-lkp@intel.com>
References: <20250205-airoha-en7581-flowtable-offload-v1-10-d362cfa97b01@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-airoha-en7581-flowtable-offload-v1-10-d362cfa97b01@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_150733_996860_715D7584 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 135c3c86a7cef4ba3d368da15b16c275b74582d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/net-airoha-Move-airoha_eth-driver-in-a-dedicated-folder/20250206-022555
base:   135c3c86a7cef4ba3d368da15b16c275b74582d3
patch link:    https://lore.kernel.org/r/20250205-airoha-en7581-flowtable-offload-v1-10-d362cfa97b01%40kernel.org
patch subject: [PATCH net-next 10/13] net: airoha: Introduce PPE initialization via NPU
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250207/202502070610.tbfoIwkS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070610.tbfoIwkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070610.tbfoIwkS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/devcoredump.h:8,
                    from drivers/net/ethernet/airoha/airoha_npu.c:7:
   drivers/net/ethernet/airoha/airoha_npu.c: In function 'airoha_npu_run_firmware':
>> drivers/net/ethernet/airoha/airoha_npu.c:200:30: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     200 |                 dev_err(dev, "%s: fw size too overlimit (%ld)\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/net/ethernet/airoha/airoha_npu.c:200:17: note: in expansion of macro 'dev_err'
     200 |                 dev_err(dev, "%s: fw size too overlimit (%ld)\n",
         |                 ^~~~~~~
   drivers/net/ethernet/airoha/airoha_npu.c:200:60: note: format string is defined here
     200 |                 dev_err(dev, "%s: fw size too overlimit (%ld)\n",
         |                                                          ~~^
         |                                                            |
         |                                                            long int
         |                                                          %d
   drivers/net/ethernet/airoha/airoha_npu.c:220:30: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     220 |                 dev_err(dev, "%s: fw size too overlimit (%ld)\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/net/ethernet/airoha/airoha_npu.c:220:17: note: in expansion of macro 'dev_err'
     220 |                 dev_err(dev, "%s: fw size too overlimit (%ld)\n",
         |                 ^~~~~~~
   drivers/net/ethernet/airoha/airoha_npu.c:220:60: note: format string is defined here
     220 |                 dev_err(dev, "%s: fw size too overlimit (%ld)\n",
         |                                                          ~~^
         |                                                            |
         |                                                            long int
         |                                                          %d


vim +200 drivers/net/ethernet/airoha/airoha_npu.c

   187	
   188	static int airoha_npu_run_firmware(struct airoha_npu *npu, struct reserved_mem *rmem)
   189	{
   190		struct device *dev = &npu->pdev->dev;
   191		const struct firmware *fw;
   192		void __iomem *addr;
   193		int ret;
   194	
   195		ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_RV32, dev);
   196		if (ret)
   197			return ret;
   198	
   199		if (fw->size > NPU_EN7581_FIRMWARE_RV32_MAX_SIZE) {
 > 200			dev_err(dev, "%s: fw size too overlimit (%ld)\n",
   201				NPU_EN7581_FIRMWARE_RV32, fw->size);
   202			ret = -E2BIG;
   203			goto out;
   204		}
   205	
   206		addr = devm_ioremap(dev, rmem->base, rmem->size);
   207		if (!addr) {
   208			ret = -ENOMEM;
   209			goto out;
   210		}
   211	
   212		memcpy_toio(addr, fw->data, fw->size);
   213		release_firmware(fw);
   214	
   215		ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
   216		if (ret)
   217			return ret;
   218	
   219		if (fw->size > NPU_EN7581_FIRMWARE_DATA_MAX_SIZE) {
   220			dev_err(dev, "%s: fw size too overlimit (%ld)\n",
   221				NPU_EN7581_FIRMWARE_DATA, fw->size);
   222			ret = -E2BIG;
   223			goto out;
   224		}
   225	
   226		memcpy_toio(npu->base + REG_NPU_LOCAL_SRAM, fw->data, fw->size);
   227	out:
   228		release_firmware(fw);
   229	
   230		return ret;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


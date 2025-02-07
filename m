Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6915BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 01:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqZZpWBZ668dwRr9RbM0eCZzUJ3gWQaP5QU0O8HjZzQ=; b=m8e7447bGbPblglxN9iHWpdKND
	Omx8NCroOb0ZQthJWrD4Gr40FXmJmkaV+DymfUfH7QT3n5CsuqN+WMGF/kXFlONxwpeK+Ir1rgIGC
	7XcTBHyhOEvHXrs2mQOwsLuoxG+v3tS4AVNAUwI2IRnpmQQ9KEuhtHsf4FbFQOrFhCR+2iEA8a3rS
	klB2LhKmlASg7KFyY+g61UN1lurnrBP8oAIiv0QfwrQbVNiBoJC9dhzWir/u/woTuv8y5DiKTrL+1
	WTTJ4XbqWzt9IoTxVD7ECK3L84EiNXdtVHvi8ClMMCoiWzMLM9Rhj7iMuwaRh212cEwkNdcS0lJZP
	GwHNZk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgD6J-00000007wJA-0ZQy;
	Fri, 07 Feb 2025 01:24:11 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgD4u-00000007wF0-3qHU;
	Fri, 07 Feb 2025 01:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738891365; x=1770427365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ut+Ydpor1ahOdNF19/psEAjOTq+kvpzRyrgKmmrAj0=;
  b=BrVaz5iUlC7yYoUYPWs35bzOm5/0IbeNK2pmEF/2lF2NdYroSlBIVUkT
   ovpAl68h/2VpAKE/qtAWLPLMQIZW226RLHdLPWJ2tIkr9ODmcxeH0q+/z
   rV7r+emhAlMPstqC6o3d6i49KyRYNm0SaQ2YdyBi8Y9evg+VM4Z/Abh1f
   YeOCMZFJ7jwxLdjxXFzd/CwIW2w4d8MpmdKdDFlQplnfqfaikLX38PLW1
   0VWr+yL+ZQwwhngA1bgJOz0CCv3/1eG7LYDF+Ro/dgwVHvFTIp2RBooNZ
   BZCXcrdx2gu8P5T/VUiPYUZssHNcGp8Eu4U6z9O0vyqAWiiHRCTchPYrj
   Q==;
X-CSE-ConnectionGUID: H7AiynxKSceW07/rsCqdSg==
X-CSE-MsgGUID: ypC5MAmeS4O6JDXQS8K51w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50163527"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="50163527"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 17:22:44 -0800
X-CSE-ConnectionGUID: 3BgyQzXhS+O8cXOSB2i9Dg==
X-CSE-MsgGUID: TVAGk+wRSrKWwYeco9ojng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="112002202"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Feb 2025 17:22:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgD4n-000xbb-2Y;
	Fri, 07 Feb 2025 01:22:37 +0000
Date: Fri, 7 Feb 2025 09:21:37 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 10/13] net: airoha: Introduce PPE initialization
 via NPU
Message-ID: <202502070935.LuHfHz3M-lkp@intel.com>
References: <20250205-airoha-en7581-flowtable-offload-v1-10-d362cfa97b01@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-airoha-en7581-flowtable-offload-v1-10-d362cfa97b01@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_172244_967491_945D8DE7 
X-CRM114-Status: GOOD (  11.44  )
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
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250207/202502070935.LuHfHz3M-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070935.LuHfHz3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070935.LuHfHz3M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/airoha/airoha_npu.c:201:30: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     200 |                 dev_err(dev, "%s: fw size too overlimit (%ld)\n",
         |                                                          ~~~
         |                                                          %zu
     201 |                         NPU_EN7581_FIRMWARE_RV32, fw->size);
         |                                                   ^~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/net/ethernet/airoha/airoha_npu.c:221:30: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     220 |                 dev_err(dev, "%s: fw size too overlimit (%ld)\n",
         |                                                          ~~~
         |                                                          %zu
     221 |                         NPU_EN7581_FIRMWARE_DATA, fw->size);
         |                                                   ^~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +201 drivers/net/ethernet/airoha/airoha_npu.c

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
   200			dev_err(dev, "%s: fw size too overlimit (%ld)\n",
 > 201				NPU_EN7581_FIRMWARE_RV32, fw->size);
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


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029B4C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Mjv0Fv9u3TZrEyl5AH9cikD+LqgdLhmD6eGorACPAU=; b=0Itaia4+xdPc4HYVObFwhzO1r+
	gNd87MSIeUyWp2BseveGATDsaAPNFuRZOwQw5qGearR1iqTWakfNH4DL5OIgT3ZuuiQYfRWCi8BWj
	t/+yhHl5xHKQtrywUfoYaVKFXcoEelO7Fck0Iho7uBv7k0zi65X83Q1SKshYiuWHS1t9Jt4VAD9Mn
	5amja+Hi42+ehAKi316lwF9jjjUddbCD7vpNrXlT+Lw2MfKu+mjQjyyl8/Wy7R5YpfTO/uT2e5bRt
	59zUIgJOcL3jjNuK9l06sxEcamomhOrNgFnDcd9BsKEBRizYgeOyELRdYbRHjGZIhGcIhbs+B1m63
	JeTC0TKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVcEx-0000000HI91-0gre;
	Sat, 28 Jun 2025 20:33:35 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVcCd-0000000HI3z-2dvP;
	Sat, 28 Jun 2025 20:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751142671; x=1782678671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jj3Wf8/p/EcjaNqLJXtMs6VmzdJXUP1vBHIwniCxulE=;
  b=kMCHXuPkb53ACm4YvyUS3JTk2yGcnJEFkoBxWcmlKgczosGIvst9R9IQ
   x0ujPR1uu5tecEf9J/dMh8REVEPFrFvvRwnnoYZ6ZVCbdXvs6fs4fV8AH
   8rd3SOCHDbfhCfNBeCyzRQn3jLuY1D6IFdKRvllE2OSfvJbm0vKlvzP62
   tFRDVUUW4CLhPNPXYXFwZIn96GIOtAT2ZYKV8U8MNgIK7zsJZ4OkNn9Bz
   JMOyU/+vFCA0ZkwNajbhKTMssCc7DQDBr+THCK83jEVXeiit1Anj4zqoT
   EztX5+8eprtemMKfrKyJCfDdZqmNsFQD6+V+l22VXrXOFlGHRZ08FbuHQ
   g==;
X-CSE-ConnectionGUID: MhyOkZIPQu21RMmi1110/A==
X-CSE-MsgGUID: 8SfFTqxIQLOkNICyVR+0uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64110349"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="64110349"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:31:09 -0700
X-CSE-ConnectionGUID: 74A3WXuHTc+lcVO1G28YbQ==
X-CSE-MsgGUID: rxJqBR8CQH2Fhq95SW+GlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153265867"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jun 2025 13:31:03 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVcCT-000XMc-1c;
	Sat, 28 Jun 2025 20:31:01 +0000
Date: Sun, 29 Jun 2025 04:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpool
 allocator for SRAM
Message-ID: <202506290403.FwUOUzZq-lkp@intel.com>
References: <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_133111_688924_FD54CFFF 
X-CRM114-Status: GOOD (  13.10  )
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

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on next-20250627]
[cannot apply to net/main linus/master v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-improve-support-for-named-interrupts/20250628-093324
base:   net-next/main
patch link:    https://lore.kernel.org/r/566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel%40makrotopia.org
patch subject: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpool allocator for SRAM
config: arm-randconfig-003-20250629 (https://download.01.org/0day-ci/archive/20250629/202506290403.FwUOUzZq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290403.FwUOUzZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290403.FwUOUzZq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_dma_ring_alloc':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1282:10: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
      return -ENOMEM;
             ^


vim +1282 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1275	
  1276	static void *mtk_dma_ring_alloc(struct mtk_eth *eth, size_t size,
  1277					dma_addr_t *dma_handle)
  1278	{
  1279		void *dma_ring;
  1280	
  1281		if (WARN_ON(mtk_use_legacy_sram(eth)))
> 1282			return -ENOMEM;
  1283	
  1284		if (eth->sram_pool) {
  1285			dma_ring = (void *)gen_pool_alloc(eth->sram_pool, size);
  1286			if (!dma_ring)
  1287				return dma_ring;
  1288			*dma_handle = gen_pool_virt_to_phys(eth->sram_pool, (unsigned long)dma_ring);
  1289		} else {
  1290			dma_ring = dma_alloc_coherent(eth->dma_dev, size, dma_handle,
  1291						      GFP_KERNEL);
  1292		}
  1293	
  1294		return dma_ring;
  1295	}
  1296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


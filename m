Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67166C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 22:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UQtUEDTJSDEeLkJsq1ZrHW9YY3v+PbBh/DVd24iZ1Y=; b=Zpw4svY4NOutxrYZWtx+o+MKmf
	Qr3wO5dNKTtkFRuNWfI42bJP9fM4kihG30wYk4vCW45Q98XBqbvkK3J2cJrBZUEkx5VrSqObq10CE
	FcF+Tw5xp+EP8CVLAvgH12y/Ky186sLRx72GJnQD9RMfOsqYWKFNCyDQxLdkrVg9GC6ARBEUq/uy0
	YP78p22NLmd5WLYoxzbNLn3XaATeLdo1n93EVg7orT+EFQ7d5L2CcqgJ07NDhfByl8TGpmfV9Mown
	1w6Jdjy8nGQe5OFbpYfSz/iabFDyhGjsj7fquAIAar5fpY4LVEmJtG8oDa3JsRakDJD3QDZmii1rY
	rnXgev1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVe1S-0000000HLrb-2Ix9;
	Sat, 28 Jun 2025 22:27:46 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVdz9-0000000HLmx-2G6A;
	Sat, 28 Jun 2025 22:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751149523; x=1782685523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NlE2HCBxhFmElmkcJijAmIgQDwbR3P7Sc58DdxZL8NQ=;
  b=mBmYA0hauCHJEo+0rAmGkkHSWfWy+xztwqTd+Hq1UuJXzDSxLOo/qEa2
   DeEnkWP4QIyMgTR5Th0aSGNRLm+UkXoJlY93UJ8EZQY3iMfQdujL8uoS/
   yb89STp9t3NV0+WNL1FchHNcV8SgmAv/wTmGJxQ8SkmnsUVYn1eTD28wO
   rF83eQMfvSvmrFHjRzIsEA0emOaqHf1VDVIP5tevd77MRt5vdSU8c8pRa
   z9iLb5/qyfXb1tcSHIvsatAcYT4f7R8dSlOeCNJvRas9dThxDKhYwYT8Q
   JlvX5ddScTbFsY6PTjICkNdhVLbZfIko1wEIpN2+iS4HFWQZjdFgM+sJ9
   w==;
X-CSE-ConnectionGUID: UPMISyfoTli6lO03rGaoQg==
X-CSE-MsgGUID: e8YtXm5ISU6XfH+wm0N0UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52650292"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52650292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 15:25:18 -0700
X-CSE-ConnectionGUID: /EELPRmGSAWN3g5MCHDQvw==
X-CSE-MsgGUID: NvdqI8dOQNC2hVqoWqivTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153647705"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jun 2025 15:25:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVdyx-000XRO-1J;
	Sat, 28 Jun 2025 22:25:11 +0000
Date: Sun, 29 Jun 2025 06:24:53 +0800
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
Message-ID: <202506290627.8dPD2PJ1-lkp@intel.com>
References: <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_152523_592209_EF5D6505 
X-CRM114-Status: GOOD (  12.67  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on next-20250627]
[cannot apply to net/main linus/master v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-improve-support-for-named-interrupts/20250628-093324
base:   net-next/main
patch link:    https://lore.kernel.org/r/566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel%40makrotopia.org
patch subject: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpool allocator for SRAM
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250629/202506290627.8dPD2PJ1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290627.8dPD2PJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290627.8dPD2PJ1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_dma_ring_alloc':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1282:24: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
    1282 |                 return -ENOMEM;
         |                        ^


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


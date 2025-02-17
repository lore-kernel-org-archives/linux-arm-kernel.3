Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933CCC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjsIsvmnLS1gTZnVfwq8tH0JiljRdZuj6wslXMFN4DM=; b=akPMEYyrEwGjO6oXiMenHaePsb
	Toig6phhJBD2uNrOJ7nc+SctgjXI2BXM8vMh1CbjVxHchxZKggem+bJkDpawO/ERhjcunFwJdcY7w
	10Xk08lZ+0MSD6B7NMhYS6M3blKAf4wDt6i34GS/SpuWPZkTQC/zqX5b/47TQQgw7P6n3+J8cFFyq
	9bjMASr1dfraH3FqmZj7fOtNqLwhi19zS0IvEahg+n012oZ7MIccBG6lgbfGfiVnZcrAA42jUWsml
	sh1xIf45A2+wZgpifwyjOXvrg0RGcqlVKhgNyOgdKH5y/5/Id9AqXpP+Hu8dpuJAwgpAjtZR671rA
	//Ev0k3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwNo-00000003kIt-0RaO;
	Mon, 17 Feb 2025 08:21:40 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwMK-00000003k3u-3Hvq;
	Mon, 17 Feb 2025 08:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739780409; x=1771316409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=296+RJzSIj7ZM99TK5QAkMFf+imrSJaM4hleXCth3cU=;
  b=EQJZlp5id6zZhY223ZoneCGMARKs1gU+d60K7myRJnXRc+HZA0Ak93ZB
   065hh2sDWyNOkXl3AdSCCzrqbJwz29GvRKaFRBfxEeeGUZaH4XQAiWRHi
   iR53O/EaPmbjmjQNPfWTx5WxGdGw+5KmLFKS9HeMc1rrZWoRk5zrn3JaD
   SarrsflNsV0zsDUVAcROqP9FQO1W3x0yIRhLTlcyJqhvxAJdDoP9Ao+WS
   GXZuT5GaGIm9Sg3C1DccCx6XYAj7yga1m4d0ASiuEWL0ch5YkKXUGIj1Y
   WGzkjRQxe5okObL8Q4YvmpICbjys2YQ98cAnIKiRW1fKgrQcmqkEGik0S
   Q==;
X-CSE-ConnectionGUID: aSgZ88gpS7+ecKoifM/2BQ==
X-CSE-MsgGUID: tWXQNvrbQR6pTQfhbtQO5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40313110"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="40313110"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 00:20:08 -0800
X-CSE-ConnectionGUID: CL/3n90kQX6+wKvBXtU0Rg==
X-CSE-MsgGUID: /kdCjNekRlGWEbfLJ1BbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113915468"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2025 00:20:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjwMD-001Cma-1E;
	Mon, 17 Feb 2025 08:20:01 +0000
Date: Mon, 17 Feb 2025 16:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Qingfang Deng <dqfext@gmail.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: ethernet: mediatek: add EEE support
Message-ID: <202502171639.wrPFfdvn-lkp@intel.com>
References: <20250217033954.3698772-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217033954.3698772-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_002008_860203_4EC6A5EF 
X-CRM114-Status: GOOD (  14.21  )
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

Hi Qingfang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Qingfang-Deng/net-ethernet-mediatek-add-EEE-support/20250217-114148
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250217033954.3698772-1-dqfext%40gmail.com
patch subject: [PATCH net-next v3] net: ethernet: mediatek: add EEE support
config: arm64-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171639.wrPFfdvn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171639.wrPFfdvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171639.wrPFfdvn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:860:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     860 | }
         | ^
   4 warnings generated.


vim +860 drivers/net/ethernet/mediatek/mtk_eth_soc.c

   826	
   827	static int mtk_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
   828					 bool tx_clk_stop)
   829	{
   830		struct mtk_mac *mac = container_of(config, struct mtk_mac,
   831						   phylink_config);
   832		struct mtk_eth *eth = mac->hw;
   833		u32 val;
   834	
   835		/* Tx idle timer in ms */
   836		timer = DIV_ROUND_UP(timer, 1000);
   837	
   838		/* If the timer is zero, then set LPI_MODE, which allows the
   839		 * system to enter LPI mode immediately rather than waiting for
   840		 * the LPI threshold.
   841		 */
   842		if (!timer)
   843			val = MAC_EEE_LPI_MODE;
   844		else if (FIELD_FIT(MAC_EEE_LPI_TXIDLE_THD, timer))
   845			val = FIELD_PREP(MAC_EEE_LPI_TXIDLE_THD, timer);
   846		else
   847			val = MAC_EEE_LPI_TXIDLE_THD;
   848	
   849		if (tx_clk_stop)
   850			val |= MAC_EEE_CKG_TXIDLE;
   851	
   852		/* PHY Wake-up time, this field does not have a reset value, so use the
   853		 * reset value from MT7531 (36us for 100M and 17us for 1000M).
   854		 */
   855		val |= FIELD_PREP(MAC_EEE_WAKEUP_TIME_1000, 17) |
   856		       FIELD_PREP(MAC_EEE_WAKEUP_TIME_100, 36);
   857	
   858		mtk_w32(eth, val, MTK_MAC_EEECR(mac->id));
   859		mtk_m32(eth, 0, MAC_MCR_EEE100M | MAC_MCR_EEE1G, MTK_MAC_MCR(mac->id));
 > 860	}
   861	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


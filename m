Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43109C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa9FjOC+0NkttZ/C72me1JnGrEV9KjFWVVh8kZ1wp0Q=; b=PMphkCLdTE1Y8FRVpR9S7q/Qi4
	8YfD9kNIg5TuvJwvqRNlwq+wh8ppSHEkh/pm4yi5pCCOjgVjIU5hNWU/U+o8OEmlnKkKPlG/nv3It
	n5yG43/1ALAm2XcqLH9cYyHMza/EjMRjFMe57EIUx3BX/p01eHkK89IWQcr+qAISG1xNow/vB0X0D
	IztEThGYI2WWW+dc17AxMZ0Syb4y2gfgjSzcWTjLclWQpYYsGqwbfMl4k4S6v7ZfPd1BOAu703EG8
	tbkgizgdalbdOqb5WcWQuP6QybulhExGZtZxUFsVauKcQ2/S0eFhoHm8Ldq5d6Ja4G7lSislvxw2G
	McVcY6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwPD-00000003kXM-36zH;
	Mon, 17 Feb 2025 08:23:07 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwMK-00000003k3t-3IZC;
	Mon, 17 Feb 2025 08:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739780408; x=1771316408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oPkuHL9Dy3/UxnFwaQibKWWo5ejIr+ylnjV+e/PO7Mc=;
  b=QqUJMTiz+ztUKgqipZU9B1H/oNnixNoD6fmVFRhxFv3NosbXSibU7hg3
   1ANbLpj9By2kKWR+Pp1Fd7YM+uinY5Q3IHGd3QWlWkGNcqn4tEaUsv5Kb
   8wszyQQ9YRLr30wwPmZRcDJbfVDIDmEhfZoeOf6HfjwvS2iMtuzZ85eb7
   X4/eKM3g1Z/NRZyQ8sOef3cGTzfEftwWo5vycphh67eNCqwvJajbf202O
   JsvnXfxI1Wll/M3MZQaEUSNWaBGu7XH5rZCY70WtqksnyDCfjTcs3VN9b
   /xFdooevdeO6/Y2/JXZOzQLHLLN4WX+qZiS1DieDGMruhoo4QI2hodGja
   w==;
X-CSE-ConnectionGUID: pfMZhKHLSPCa5B3keIPniA==
X-CSE-MsgGUID: ZZuKFYcOT5qdZN1hSiCWXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40377400"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="40377400"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 00:20:07 -0800
X-CSE-ConnectionGUID: psU11MIcQB+yvaheySR5bA==
X-CSE-MsgGUID: OMcPVd88Qeai6K8lHCZInQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118977219"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2025 00:20:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjwMD-001CmY-1A;
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
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: ethernet: mediatek: add EEE support
Message-ID: <202502171610.TU1Cuzq5-lkp@intel.com>
References: <20250217033954.3698772-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217033954.3698772-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_002008_866691_6C6F70BC 
X-CRM114-Status: GOOD (  12.76  )
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
config: arm64-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171610.TU1Cuzq5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171610.TU1Cuzq5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171610.TU1Cuzq5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_mac_enable_tx_lpi':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:860:1: warning: control reaches end of non-void function [-Wreturn-type]
     860 | }
         | ^


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


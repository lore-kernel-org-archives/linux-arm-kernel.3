Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C7CD5AE46
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 02:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlaRlsbWa9QBV1x6rBKVkn8hsbr939+cyL9yhztPz9Q=; b=J14dy3i0VXgDbbqj5pFrAhldj7
	aAEzHqN15n2n2lksZVbW/aErzuSg6M99iQ2KOHDmaIxN/xbJkq3H/lh06qbTeN6DlQvV5qg7/h5Q/
	MxzkQCXxqwM+gTOHQa/SZeXwy7yt3GaxNQptxsStkTA5fEtTzYQQWHJDA5UtYwJpWvs0ShjPGl4Ap
	3UmmYWLocH8rC+tMImBHI8mJhpkyX5a+T9FOWOyZUSJuJ53JxKuM0HhgfiTtOFjnXhvB/SStv4KQF
	2vmHUC38iJ0BLqGCdLFdwkUNwnkqMMr5uayr+v+Tx6lwarh9/rWgRSP4VjVJX/8Pwh+7R9U+DqC2v
	nu3Gp7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8sR2-00000005TO6-49xY;
	Thu, 07 Nov 2024 02:39:48 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8sPI-00000005TAy-2ydb;
	Thu, 07 Nov 2024 02:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730947080; x=1762483080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Rbco+fVVE+WKrntisQUqv4Xf3VKHufAddMWQTy1UOo=;
  b=b88BPL1OXAeFkHx3vGH/GJplaYf2ZPQQ1iYMqCDbGRY0tYqgNlWdSYhf
   rQbPCDEzc0D7QgNDozjWzag8WOHNgWHRSUSUCSkglacue5j0Y2qypY79+
   jZUjP9Zi8pIeBxp19Ve4KRghExdYwcVGhD9E5RwJ6FOwiJvsXupyxgfr2
   jxWC68ta3nPd8gldcUSsnDgWZYoIw/MRrLTiXhwAADxKnXBdmI9cNRGMi
   ZO4tfuQBWEvGYXX93t7D+ZaW9fjuvVftnHmM9x8RsvwmIbIK4shSt+NQ8
   bd05FtZunSSQP6Nl5JJF+v9/XPgDHsFdMWBSChUBy+IxyC+h884Hw2rRW
   Q==;
X-CSE-ConnectionGUID: gL/pVVwiQpOPS8QFoz7g+A==
X-CSE-MsgGUID: 9PaJPAAMSBqcHKLnGVEkUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34695259"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="34695259"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 18:37:54 -0800
X-CSE-ConnectionGUID: H0tfHc/KTCOBcpT2EROUpg==
X-CSE-MsgGUID: Y25ZMZNcQteAno0NZmlSgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="90004633"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2024 18:37:49 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8sP4-000phm-2P;
	Thu, 07 Nov 2024 02:37:46 +0000
Date: Thu, 7 Nov 2024 10:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@airoha.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [net-next PATCH v3 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <202411071000.uL10bu3r-lkp@intel.com>
References: <20241106122254.13228-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106122254.13228-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_183800_788741_B2B9C82D 
X-CRM114-Status: GOOD (  14.13  )
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-net-dsa-Add-Airoha-AN8855-Gigabit-Switch-documentation/20241106-203624
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241106122254.13228-4-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v3 3/3] net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241107/202411071000.uL10bu3r-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071000.uL10bu3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071000.uL10bu3r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/phy/air_an8855.c:6:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/air_an8855.c:137:6: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     137 |         if (saved_page >= 0)
         |             ^~~~~~~~~~~~~~~
   drivers/net/phy/air_an8855.c:139:45: note: uninitialized use occurs here
     139 |         ret = phy_restore_page(phydev, saved_page, val);
         |                                                    ^~~
   drivers/net/phy/air_an8855.c:137:2: note: remove the 'if' if its condition is always true
     137 |         if (saved_page >= 0)
         |         ^~~~~~~~~~~~~~~~~~~~
     138 |                 val = __phy_read(phydev, AN8855_PHY_EXT_REG_14);
   drivers/net/phy/air_an8855.c:133:9: note: initialize the variable 'val' to silence this warning
     133 |         int val;
         |                ^
         |                 = 0
>> drivers/net/phy/air_an8855.c:155:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     155 |         if (saved_page >= 0) {
         |             ^~~~~~~~~~~~~~~
   drivers/net/phy/air_an8855.c:164:46: note: uninitialized use occurs here
     164 |         return phy_restore_page(phydev, saved_page, ret);
         |                                                     ^~~
   drivers/net/phy/air_an8855.c:155:2: note: remove the 'if' if its condition is always true
     155 |         if (saved_page >= 0) {
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/air_an8855.c:152:9: note: initialize the variable 'ret' to silence this warning
     152 |         int ret;
         |                ^
         |                 = 0
   6 warnings generated.


vim +137 drivers/net/phy/air_an8855.c

   129	
   130	static int an8855_get_downshift(struct phy_device *phydev, u8 *data)
   131	{
   132		int saved_page;
   133		int val;
   134		int ret;
   135	
   136		saved_page = phy_select_page(phydev, AN8855_PHY_PAGE_EXTENDED_1);
 > 137		if (saved_page >= 0)
   138			val = __phy_read(phydev, AN8855_PHY_EXT_REG_14);
   139		ret = phy_restore_page(phydev, saved_page, val);
   140		if (ret)
   141			return ret;
   142	
   143		*data = val & AN8855_PHY_EXT_REG_14 ? DOWNSHIFT_DEV_DEFAULT_COUNT :
   144						      DOWNSHIFT_DEV_DISABLE;
   145	
   146		return 0;
   147	}
   148	
   149	static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
   150	{
   151		int saved_page;
   152		int ret;
   153	
   154		saved_page = phy_select_page(phydev, AN8855_PHY_PAGE_EXTENDED_1);
 > 155		if (saved_page >= 0) {
   156			if (cnt != DOWNSHIFT_DEV_DISABLE)
   157				ret = __phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
   158						     AN8855_PHY_EN_DOWN_SHFIT);
   159			else
   160				ret = __phy_clear_bits(phydev, AN8855_PHY_EXT_REG_14,
   161						       AN8855_PHY_EN_DOWN_SHFIT);
   162		}
   163	
   164		return phy_restore_page(phydev, saved_page, ret);
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


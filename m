Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E34CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 17:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCkb5+ybyLL0MMc5cBqviSbrBCStnH4rtqG86uh5xyA=; b=1uNaSdhH5zXEHvByHWc3jpi/P9
	Rdbjv6XAYpPvzRKTX9JXzzFAKMODx45DxLQQTQMlmLAw1XuGl6oHUMnLawCvbjLGsAds/1pMC7KQh
	bIRGOTb1C8m1iLeLcthOcxBRk7+5/7M932w8G57CGhUF5RS2ZULLhva8hSpLXbo6PlaNu5spq7bER
	lRUBXxZ1IUXhguuy8bQS/DaHupo4jRNzH5/u5Q9Qp5HC5/gmIa+/bRN44LkPD5c1vexqTGlOHuCzX
	EevJXPJ59piR/dwS5HkpsV+ZxSOCqx9wODh8UeMM+/SCYJt4YZRzIvlNXSteeHWJ/3/h0LayO1uVN
	PDbtqoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAXTZ-0000000BGjt-1g5u;
	Sun, 19 Oct 2025 17:45:49 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAXTW-0000000BGjR-3zDy;
	Sun, 19 Oct 2025 17:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760895947; x=1792431947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PT5edAvGs2FKCeBZ2dl7OCjjziNGJmQxLTxQAcMOLvs=;
  b=Z6W7ql7n6BYJaHwl3vhCxiQM/orCIbUguoQ9o1MhSaNLrtgM5V9dPWq3
   dVzIbdgZrJJFHhL4+5yLNSyjRrXcHJZPGsiURuDRVlsYvth5laVNmS4+s
   sEh8W54yBorFph/QWMxrG1cFJH3GO8MindVjvTXr+U0xKnHvjMtAKPHUX
   J6P71tdfpaPymD80nUCW/VM8nz8CAepGB+kiaOXUyR//Juq28y/9XC5/N
   D7M9M3OYmTabD5410B6oZYssOq+319i+I6mTuRxLQHTIi21jCTyhBJ0/X
   2SL6y1eGAdtH/xveoJdUlhZWFJ27zD0X6JmdeGlyAzEnUgcX7LDQlKEvj
   Q==;
X-CSE-ConnectionGUID: +Zz+SV20RcC6SK9qrB7OiA==
X-CSE-MsgGUID: UTv5Vi6BTYm87yS1jjB0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="50603805"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="50603805"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 10:45:39 -0700
X-CSE-ConnectionGUID: 0JZCniWVT4KAkMJjgpid2Q==
X-CSE-MsgGUID: /WMS/oibQKCeZobeH9y1bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="183177175"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Oct 2025 10:45:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAXSx-0009F7-0G;
	Sun, 19 Oct 2025 17:45:32 +0000
Date: Mon, 20 Oct 2025 01:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>, nbd@nbd.name,
	lorenzo@kernel.org, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	howard-yh.hsu@mediatek.com, StanleyYP.Wang@mediatek.com,
	rosenp@gmail.com, luoxueqin@kylinos.cn, chad@monroe.io,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921,
 mt7981 and mt7986
Message-ID: <202510200105.T000lujD-lkp@intel.com>
References: <20251019155316.3537185-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251019155316.3537185-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_104547_036513_BF939615 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Aleksander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksander-Jan-Bajkowski/wifi-mt76-add-tx-checksum-offload-for-mt7915-mt7921-mt7981-and-mt7986/20251019-235515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20251019155316.3537185-1-olek2%40wp.pl
patch subject: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921, mt7981 and mt7986
config: i386-buildonly-randconfig-003-20251019 (https://download.01.org/0day-ci/archive/20251020/202510200105.T000lujD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200105.T000lujD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200105.T000lujD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/skbuff.h:29,
                    from drivers/net/wireless/mediatek/mt76/mt76.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt76_connac.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt792x.h:10,
                    from drivers/net/wireless/mediatek/mt76/mt792x_core.c:7:
   drivers/net/wireless/mediatek/mt76/mt792x_core.c: In function 'mt792x_init_wiphy':
>> include/linux/netdev_features.h:104:33: warning: statement with no effect [-Wunused-value]
     104 | #define __NETIF_F_BIT(bit)      ((netdev_features_t)1 << (bit))
         |                                 ^
   include/linux/netdev_features.h:105:33: note: in expansion of macro '__NETIF_F_BIT'
     105 | #define __NETIF_F(name)         __NETIF_F_BIT(NETIF_F_##name##_BIT)
         |                                 ^~~~~~~~~~~~~
   include/linux/netdev_features.h:119:33: note: in expansion of macro '__NETIF_F'
     119 | #define NETIF_F_IP_CSUM         __NETIF_F(IP_CSUM)
         |                                 ^~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:636:17: note: in expansion of macro 'NETIF_F_IP_CSUM'
     636 |                 NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
         |                 ^~~~~~~~~~~~~~~


vim +104 include/linux/netdev_features.h

a19f2a6df28e0c Michał Mirosław 2011-11-15  102  
a19f2a6df28e0c Michał Mirosław 2011-11-15  103  /* copy'n'paste compression ;) */
a19f2a6df28e0c Michał Mirosław 2011-11-15 @104  #define __NETIF_F_BIT(bit)	((netdev_features_t)1 << (bit))
a19f2a6df28e0c Michał Mirosław 2011-11-15  105  #define __NETIF_F(name)		__NETIF_F_BIT(NETIF_F_##name##_BIT)
a19f2a6df28e0c Michał Mirosław 2011-11-15  106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


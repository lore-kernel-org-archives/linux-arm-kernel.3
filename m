Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24ABC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbTACyiduj6rLScQKJpGrwQF6qrowKJKlboVikeKunk=; b=EyNuC7OoZ3Mdf2zgyFvlXPSwQk
	UJPfaR0sRnpUfqSyw4LZbW8uAbn8RUHUHk9PBzKi9etuVfmGgJyuuLNG/BKzysHMiKUxZ66UoEnlB
	MEy2EwKoF1P4zram0FfXqZejZWPvXhxkLIvYxErXvB8eborXwUt+qiSwkkWyLTxvkt+J2HPL9Hggs
	NwbRyu3VK7Rim1APAngC3UqkMoFMrcIqoYGPwiv1T7BUMh2y7TUiGuAR9tPBLLBFPN/HHQDAe+hba
	PXcZ+G/KnB85uP8RB1TTFjxVyKapQ3e5JMVgfwfcyNi7tNlhFI6fUAs40nGQOGtEdzYLuWyeFZjUf
	QYjdExwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZtu-0000000HBFm-2VaS;
	Sat, 28 Jun 2025 18:03:42 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZak-0000000H9Aa-1pAW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751132635; x=1782668635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJAICa0SpONfxMWg8HAFuYCuf5lAPXPGhxYxcfrSeAE=;
  b=WyffUNm9m8QATslnHjUMGneHNxOvcZa8LKX0jF2RRq8W05+QF4fN+iPH
   Y3izlP8yxggDSTWbmxIsqttUDTXqpF9xMMQAXlF9+JwPROycnHbSOxvqr
   ocSSweGutBQzc2NI2i0ZIUoY+Y1X5Zdy1+mi0X4Suld7SUq0PG/JxDOAN
   wgu5aa+BNNCzpfyKBgRoDzpJ3M1LdsPp3PXfT2XjdKA8NwYQGdebwSChU
   gqrdMlxCY+uLQcqpALyHdnqALlPZ2XKqWdJqGaKeyGe8ofzgGA5TLoyQZ
   gJAqFzD1K+R9CA/82r6nkXs9rl163vQYpaLM10iAzrk9Fk505yhGdNWMy
   Q==;
X-CSE-ConnectionGUID: Un1ncNi7QnSNsYAAruoBVA==
X-CSE-MsgGUID: sxfCy4j6TmiZTWVits7g3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52533113"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52533113"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 10:43:52 -0700
X-CSE-ConnectionGUID: Y7B53AP4RP2en1ZOhu5XUw==
X-CSE-MsgGUID: jCKBeIUeQUOo9m98bK3rHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152458874"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Jun 2025 10:43:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVZac-000XFm-2e;
	Sat, 28 Jun 2025 17:43:46 +0000
Date: Sun, 29 Jun 2025 01:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, sgoutham@marvell.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, alok.a.tiwari@oracle.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: thunderx: avoid direct MTU assignment after
 WRITE_ONCE()
Message-ID: <202506290114.0EPFmc8U-lkp@intel.com>
References: <20250628095221.461991-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628095221.461991-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_104354_514103_365C3A92 
X-CRM114-Status: GOOD (  12.29  )
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

Hi Alok,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alok-Tiwari/net-thunderx-avoid-direct-MTU-assignment-after-WRITE_ONCE/20250628-175420
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250628095221.461991-1-alok.a.tiwari%40oracle.com
patch subject: [PATCH] net: thunderx: avoid direct MTU assignment after WRITE_ONCE()
config: x86_64-buildonly-randconfig-006-20250628 (https://download.01.org/0day-ci/archive/20250629/202506290114.0EPFmc8U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290114.0EPFmc8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290114.0EPFmc8U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/cavium/thunder/nicvf_main.c: In function 'nicvf_change_mtu':
>> drivers/net/ethernet/cavium/thunder/nicvf_main.c:1581:13: warning: unused variable 'orig_mtu' [-Wunused-variable]
    1581 |         int orig_mtu = netdev->mtu;
         |             ^~~~~~~~


vim +/orig_mtu +1581 drivers/net/ethernet/cavium/thunder/nicvf_main.c

4863dea3fab0173 Sunil Goutham   2015-05-26  1577  
4863dea3fab0173 Sunil Goutham   2015-05-26  1578  static int nicvf_change_mtu(struct net_device *netdev, int new_mtu)
4863dea3fab0173 Sunil Goutham   2015-05-26  1579  {
4863dea3fab0173 Sunil Goutham   2015-05-26  1580  	struct nicvf *nic = netdev_priv(netdev);
f9aa9dc7d2d00e6 David S. Miller 2016-11-22 @1581  	int orig_mtu = netdev->mtu;
4863dea3fab0173 Sunil Goutham   2015-05-26  1582  
1f227d16083b2e2 Matteo Croce    2019-04-11  1583  	/* For now just support only the usual MTU sized frames,
1f227d16083b2e2 Matteo Croce    2019-04-11  1584  	 * plus some headroom for VLAN, QinQ.
1f227d16083b2e2 Matteo Croce    2019-04-11  1585  	 */
1f227d16083b2e2 Matteo Croce    2019-04-11  1586  	if (nic->xdp_prog && new_mtu > MAX_XDP_MTU) {
1f227d16083b2e2 Matteo Croce    2019-04-11  1587  		netdev_warn(netdev, "Jumbo frames not yet supported with XDP, current MTU %d.\n",
1f227d16083b2e2 Matteo Croce    2019-04-11  1588  			    netdev->mtu);
1f227d16083b2e2 Matteo Croce    2019-04-11  1589  		return -EINVAL;
1f227d16083b2e2 Matteo Croce    2019-04-11  1590  	}
1f227d16083b2e2 Matteo Croce    2019-04-11  1591  
712c3185344050c Sunil Goutham   2016-11-15  1592  
8be8a2ba18f34d5 Alok Tiwari     2025-06-28  1593  	if (!netif_running(netdev)) {
8be8a2ba18f34d5 Alok Tiwari     2025-06-28  1594  		WRITE_ONCE(netdev->mtu, new_mtu);
712c3185344050c Sunil Goutham   2016-11-15  1595  		return 0;
8be8a2ba18f34d5 Alok Tiwari     2025-06-28  1596  	}
712c3185344050c Sunil Goutham   2016-11-15  1597  
f9aa9dc7d2d00e6 David S. Miller 2016-11-22  1598  	if (nicvf_update_hw_max_frs(nic, new_mtu)) {
4863dea3fab0173 Sunil Goutham   2015-05-26  1599  		return -EINVAL;
f9aa9dc7d2d00e6 David S. Miller 2016-11-22  1600  	}
4863dea3fab0173 Sunil Goutham   2015-05-26  1601  
8be8a2ba18f34d5 Alok Tiwari     2025-06-28  1602  	WRITE_ONCE(netdev->mtu, new_mtu);
8be8a2ba18f34d5 Alok Tiwari     2025-06-28  1603  
4863dea3fab0173 Sunil Goutham   2015-05-26  1604  	return 0;
4863dea3fab0173 Sunil Goutham   2015-05-26  1605  }
4863dea3fab0173 Sunil Goutham   2015-05-26  1606  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


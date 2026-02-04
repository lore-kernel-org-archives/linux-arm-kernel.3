Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C19EA794A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 23:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaWiECPU4BKQYc79do/lWWbfggCJBf09zRAj93n6vAo=; b=Ahl3YEc0jRRVrZc6U2z6iKsdE+
	NrWo0WA8Kw+pnuzv2s0nhkcG9TH0nO9+aQzd67A+N1vbXzyZSOFDmgUqTU4dIEaa6rjtfkJZcPqVH
	rIo4AFaJH+vH9y51z1sImBBbwbtGGMYR8t0Jo2ZFc5uBArlvpCkSb/t96wySLnAQeHdUgobUbJN0U
	/N8XfzFSu7TnDfzNdkCzPlO0aIljJ7mcWQNshvP3EHovds0lGBLeT3GpvKdSHKa+UQ7UMjYrsCrHn
	ZZu9bGprEgPO9uBnexWIIYsV3MUxdDdpVDRPcBjaaWSbgdZpN/OjK2i6JQlcNKEbEnHZRsWevTT2v
	oWT/0aOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnmLc-00000009BhZ-0eGP;
	Wed, 04 Feb 2026 23:31:48 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnmLZ-00000009Bh2-14QV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 23:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770247905; x=1801783905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A/mvAOGLp0G4x6EUjGVks/0dtJp82veA/rORZI0S8Wg=;
  b=GSnkKvbEES2fpUd30PUr2nSXFqhisrJxzjKtTkVOdEXtoPnPm5LdCalh
   PVvDcvkSH30kwVSu3rTEoIwBOZEsyNakCfMqiP1LtAoVOxrKu/tg6a5m/
   NbranFlIy4mCVOBHs3X3Ez3kGzGfDxYoCMfwujgOgHxGqzysKHKiGTVlU
   kBfWlvWZq5GeVmsb2QwkB67wlAtUdqHVojdaSoT4EPY+8OtdRRg2hhBvr
   l/tCzQpHF8TXrNVnjuJh1QH6NRRn8s99MZBw53ZnH4DRO2W3vg/KhDdbL
   VLRS5wYpGKmII1oLpCd0P2kBN+7uYVk2rIePHXtR3HzoQiukKHMgoB3y7
   A==;
X-CSE-ConnectionGUID: juWm8ExuSGesDugKzm9Rvw==
X-CSE-MsgGUID: 2qKgKsw+R2+NLCqOgjG3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70639518"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="70639518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 15:31:44 -0800
X-CSE-ConnectionGUID: iEEz9+dLScWuQn2rczeETA==
X-CSE-MsgGUID: X4qQQThbRaKum4g/bOa/uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="210340839"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2026 15:31:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnmLR-00000000jEu-1zGT;
	Wed, 04 Feb 2026 23:31:37 +0000
Date: Thu, 5 Feb 2026 07:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Meghana Malladi <m-malladi@ti.com>, vadim.fedorenko@linux.dev,
	jacob.e.keller@intel.com, horms@kernel.org, parvathi@couthit.com,
	afd@ti.com, vladimir.oltean@nxp.com, rogerq@kernel.org,
	danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg-prueth: Add ethtool ops
 for Frame Preemption MAC Merge
Message-ID: <202602050744.pYAnjG71-lkp@intel.com>
References: <20260204140044.4086725-3-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204140044.4086725-3-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_153145_360592_845C4669 
X-CRM114-Status: GOOD (  10.80  )
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

Hi Meghana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9a9424c756feee9ee6e717405a9d6fa7bacdef08]

url:    https://github.com/intel-lab-lkp/linux/commits/Meghana-Malladi/net-ti-icssg-prueth-Add-Frame-Preemption-MAC-Merge-support/20260204-220543
base:   9a9424c756feee9ee6e717405a9d6fa7bacdef08
patch link:    https://lore.kernel.org/r/20260204140044.4086725-3-m-malladi%40ti.com
patch subject: [PATCH net-next v2 2/2] net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260205/202602050744.pYAnjG71-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050744.pYAnjG71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050744.pYAnjG71-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/icssg/icssg_prueth.h:48,
                    from drivers/net/ethernet/ti/icssg/icssg_prueth.c:34:
>> drivers/net/ethernet/ti/icssg/icssg_stats.h:93:38: warning: 'icssg_all_miig_stats' defined but not used [-Wunused-const-variable=]
      93 | static const struct icssg_miig_stats icssg_all_miig_stats[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~


vim +/icssg_all_miig_stats +93 drivers/net/ethernet/ti/icssg/icssg_stats.h

c1e10d5dc7a1be MD Danish Anwar 2023-08-01   92  
550ee90ac61c1f MD Danish Anwar 2024-08-22  @93  static const struct icssg_miig_stats icssg_all_miig_stats[] = {
c1e10d5dc7a1be MD Danish Anwar 2023-08-01   94  	/* Rx */
550ee90ac61c1f MD Danish Anwar 2024-08-22   95  	ICSSG_MIIG_STATS(rx_packets, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22   96  	ICSSG_MIIG_STATS(rx_broadcast_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22   97  	ICSSG_MIIG_STATS(rx_multicast_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22   98  	ICSSG_MIIG_STATS(rx_crc_errors, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22   99  	ICSSG_MIIG_STATS(rx_mii_error_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  100  	ICSSG_MIIG_STATS(rx_odd_nibble_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  101  	ICSSG_MIIG_STATS(rx_frame_max_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  102  	ICSSG_MIIG_STATS(rx_max_size_error_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  103  	ICSSG_MIIG_STATS(rx_frame_min_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  104  	ICSSG_MIIG_STATS(rx_min_size_error_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  105  	ICSSG_MIIG_STATS(rx_over_errors, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  106  	ICSSG_MIIG_STATS(rx_class0_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  107  	ICSSG_MIIG_STATS(rx_class1_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  108  	ICSSG_MIIG_STATS(rx_class2_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  109  	ICSSG_MIIG_STATS(rx_class3_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  110  	ICSSG_MIIG_STATS(rx_class4_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  111  	ICSSG_MIIG_STATS(rx_class5_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  112  	ICSSG_MIIG_STATS(rx_class6_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  113  	ICSSG_MIIG_STATS(rx_class7_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  114  	ICSSG_MIIG_STATS(rx_class8_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  115  	ICSSG_MIIG_STATS(rx_class9_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  116  	ICSSG_MIIG_STATS(rx_class10_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  117  	ICSSG_MIIG_STATS(rx_class11_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  118  	ICSSG_MIIG_STATS(rx_class12_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  119  	ICSSG_MIIG_STATS(rx_class13_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  120  	ICSSG_MIIG_STATS(rx_class14_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  121  	ICSSG_MIIG_STATS(rx_class15_hits, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  122  	ICSSG_MIIG_STATS(rx_smd_frags, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  123  	ICSSG_MIIG_STATS(rx_bucket1_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  124  	ICSSG_MIIG_STATS(rx_bucket2_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  125  	ICSSG_MIIG_STATS(rx_bucket3_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  126  	ICSSG_MIIG_STATS(rx_bucket4_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  127  	ICSSG_MIIG_STATS(rx_64B_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  128  	ICSSG_MIIG_STATS(rx_bucket1_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  129  	ICSSG_MIIG_STATS(rx_bucket2_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  130  	ICSSG_MIIG_STATS(rx_bucket3_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  131  	ICSSG_MIIG_STATS(rx_bucket4_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  132  	ICSSG_MIIG_STATS(rx_bucket5_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  133  	ICSSG_MIIG_STATS(rx_bytes, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  134  	ICSSG_MIIG_STATS(rx_tx_total_bytes, false),
c1e10d5dc7a1be MD Danish Anwar 2023-08-01  135  	/* Tx */
550ee90ac61c1f MD Danish Anwar 2024-08-22  136  	ICSSG_MIIG_STATS(tx_packets, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  137  	ICSSG_MIIG_STATS(tx_broadcast_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  138  	ICSSG_MIIG_STATS(tx_multicast_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  139  	ICSSG_MIIG_STATS(tx_odd_nibble_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  140  	ICSSG_MIIG_STATS(tx_underflow_errors, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  141  	ICSSG_MIIG_STATS(tx_frame_max_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  142  	ICSSG_MIIG_STATS(tx_max_size_error_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  143  	ICSSG_MIIG_STATS(tx_frame_min_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  144  	ICSSG_MIIG_STATS(tx_min_size_error_frames, false),
550ee90ac61c1f MD Danish Anwar 2024-08-22  145  	ICSSG_MIIG_STATS(tx_bucket1_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  146  	ICSSG_MIIG_STATS(tx_bucket2_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  147  	ICSSG_MIIG_STATS(tx_bucket3_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  148  	ICSSG_MIIG_STATS(tx_bucket4_size, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  149  	ICSSG_MIIG_STATS(tx_64B_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  150  	ICSSG_MIIG_STATS(tx_bucket1_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  151  	ICSSG_MIIG_STATS(tx_bucket2_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  152  	ICSSG_MIIG_STATS(tx_bucket3_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  153  	ICSSG_MIIG_STATS(tx_bucket4_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  154  	ICSSG_MIIG_STATS(tx_bucket5_frames, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  155  	ICSSG_MIIG_STATS(tx_bytes, true),
550ee90ac61c1f MD Danish Anwar 2024-08-22  156  };
550ee90ac61c1f MD Danish Anwar 2024-08-22  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


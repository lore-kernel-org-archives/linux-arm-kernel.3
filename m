Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127FBC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 04:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT9ZmWcNjsByWM4NKCa01tRV+Ynb0XOy/pgCXZGVIa0=; b=1qCSnmt1igBgl1gH77fje99h3d
	cGwulgvEPx7+HN/WlZnhVOuiF3D7+XSAUnZNab0sPNgYy88q9kQW/BFpx5oH2O+udvxpFceV62gn7
	2TZTRenedDF0BicCYAOozMOYXWVGcX/X5AhgGbCEMI24GXcIiOmPJoJU5gn+Ffmtdg+MVR8iy3/W0
	eeFzXgd2msNSxJvN5G+jM0LHPaeWKHcEG7BYvEZu13jOvyI6ga4CSVnufldN8VTUmPYn1XsWpRMda
	HCF150XKkgdFp884Qx02I6a6gzXw6r6uyJN3rhTBVEfPsghq+tFnQzcK/ucuq81lYvp7JNECjQ6YY
	g3oO7t+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHElr-0000000BVQg-43LB;
	Tue, 20 May 2025 04:40:07 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEjl-0000000BVGJ-1VQp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 04:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747715878; x=1779251878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/HWugewSwF3nvEChZSyWKJu4IdZ646uM+bCDPZacNpw=;
  b=JgCFVIIy0/doQac0EJf3QukBgb9Q4ktT9plteGrRPD8PWogJi537MIao
   LI4/G02fyKJnzCXtzs/upp/WliBTzv0Du+p4R6c9Ocb07rZpLnkjNRi9v
   Vafp3eQTvevKuq4TrCWAumOfE/F+CfNEE7iWIEaWi2viQnmmxGgfiZ4qj
   7gu86kHRHWc7eoCYuX/Mtm0K8dBAidNKcgv3pvl3fWK783lDeG5JRidpH
   O+jLvn7XH6n9otZWkS5zA/kSXGs9KneYlsDgANJKRZ4loMnkergoiAR4x
   tFfuZS488ihj1R4Y27R0TyYiHfJEvMyQUZc9kCtePkJOFgHm7xpuqXvvY
   Q==;
X-CSE-ConnectionGUID: qZh4CtGlQymLtLSMOnt6nA==
X-CSE-MsgGUID: bPL9HeGZSwCoiQsk3GpqCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49615548"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49615548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 21:37:52 -0700
X-CSE-ConnectionGUID: /shfJDbpQOOib6SfJMhTpw==
X-CSE-MsgGUID: CdGruJYmTL2xxLLcWAqHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144324829"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2025 21:37:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHEja-000MA4-1X;
	Tue, 20 May 2025 04:37:46 +0000
Date: Tue, 20 May 2025 12:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, sgoutham@marvell.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] net: cavium: thunder: Add log for verification fail in
 bgx_poll_for_link()
Message-ID: <202505201239.5YN7PGlt-lkp@intel.com>
References: <20250519152348.2839-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519152348.2839-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_213757_450970_9B5B93EA 
X-CRM114-Status: GOOD (  14.91  )
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

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/net-cavium-thunder-Add-log-for-verification-fail-in-bgx_poll_for_link/20250519-232542
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250519152348.2839-1-vulab%40iscas.ac.cn
patch subject: [PATCH] net: cavium: thunder: Add log for verification fail in bgx_poll_for_link()
config: sparc-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201239.5YN7PGlt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201239.5YN7PGlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201239.5YN7PGlt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/net/ethernet/cavium/thunder/thunder_bgx.c:6:
   drivers/net/ethernet/cavium/thunder/thunder_bgx.c: In function 'bgx_poll_for_link':
>> drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1012:40: error: incompatible type for argument 1 of '_dev_err'
    1012 |                 dev_err(lmac->bgx->pdev->dev, "BXG verification fail with time out.\n");
         |                         ~~~~~~~~~~~~~~~^~~~~
         |                                        |
         |                                        struct device
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1012:17: note: in expansion of macro 'dev_err'
    1012 |                 dev_err(lmac->bgx->pdev->dev, "BXG verification fail with time out.\n");
         |                 ^~~~~~~
   include/linux/dev_printk.h:50:36: note: expected 'const struct device *' but argument is of type 'struct device'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |               ~~~~~~~~~~~~~~~~~~~~~^~~


vim +/_dev_err +1012 drivers/net/ethernet/cavium/thunder/thunder_bgx.c

   995	
   996	static void bgx_poll_for_link(struct work_struct *work)
   997	{
   998		struct lmac *lmac;
   999		u64 spu_link, smu_link;
  1000	
  1001		lmac = container_of(work, struct lmac, dwork.work);
  1002		if (lmac->is_sgmii) {
  1003			bgx_poll_for_sgmii_link(lmac);
  1004			return;
  1005		}
  1006	
  1007		/* Receive link is latching low. Force it high and verify it */
  1008		bgx_reg_modify(lmac->bgx, lmac->lmacid,
  1009			       BGX_SPUX_STATUS1, SPU_STATUS1_RCV_LNK);
  1010		if (bgx_poll_reg(lmac->bgx, lmac->lmacid, BGX_SPUX_STATUS1,
  1011				 SPU_STATUS1_RCV_LNK, false))
> 1012			dev_err(lmac->bgx->pdev->dev, "BXG verification fail with time out.\n");
  1013	
  1014		spu_link = bgx_reg_read(lmac->bgx, lmac->lmacid, BGX_SPUX_STATUS1);
  1015		smu_link = bgx_reg_read(lmac->bgx, lmac->lmacid, BGX_SMUX_RX_CTL);
  1016	
  1017		if ((spu_link & SPU_STATUS1_RCV_LNK) &&
  1018		    !(smu_link & SMU_RX_CTL_STATUS)) {
  1019			lmac->link_up = true;
  1020			if (lmac->lmac_type == BGX_MODE_XLAUI)
  1021				lmac->last_speed = SPEED_40000;
  1022			else
  1023				lmac->last_speed = SPEED_10000;
  1024			lmac->last_duplex = DUPLEX_FULL;
  1025		} else {
  1026			lmac->link_up = false;
  1027			lmac->last_speed = SPEED_UNKNOWN;
  1028			lmac->last_duplex = DUPLEX_UNKNOWN;
  1029		}
  1030	
  1031		if (lmac->last_link != lmac->link_up) {
  1032			if (lmac->link_up) {
  1033				if (bgx_xaui_check_link(lmac)) {
  1034					/* Errors, clear link_up state */
  1035					lmac->link_up = false;
  1036					lmac->last_speed = SPEED_UNKNOWN;
  1037					lmac->last_duplex = DUPLEX_UNKNOWN;
  1038				}
  1039			}
  1040			lmac->last_link = lmac->link_up;
  1041		}
  1042	
  1043		queue_delayed_work(lmac->check_link, &lmac->dwork, HZ * 2);
  1044	}
  1045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


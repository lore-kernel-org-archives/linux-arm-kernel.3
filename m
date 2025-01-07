Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55B8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRiXdBd+EWI/KRuB2IvZKBcC/9wCijHztnT0Q/B/bW4=; b=ksos4T2gdj9JqQfPK3kFQ4S7gf
	7ZAswxVPxTAq5poV5sg5OBquI2FsQS1NrVno5lJjwWjcvLggMPqSXcb4S58zqDKTBigqorRF73WSZ
	O53G6egUuGj/HC1edLyNxr6wMLxRHs1BZGEF3t/ZNzkjLR5BRE5iBnjnHPkeCOfjHiOUBFr5bkWwC
	oqXQ+TYdABusBGSSGWJ5++NtOH0kOgVeyjsacQgFy85g5DbjWBDlI3TPw4k7FVCRysQybG6HvzblM
	gQPR97zbq95b7rrAM9HfqmaYVQtM3sMc1FKrnqN0B3IF01sD1FdtmTvNS7i9fMryFHqznh6usOGLj
	PGoYQdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV444-00000003lSs-30rx;
	Tue, 07 Jan 2025 07:31:48 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV41d-00000003l7B-0pGF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 07:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736234957; x=1767770957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uat2YMlEc7Xp6j7gAomimDsLGJKKKHa/p6RKV8tc0a8=;
  b=LBJfvWWOAoFuw/1eEc1OwoHgnmE0hShiFgzqNkEpsVsegsdhvZ/f2uur
   CNGeu/j4XfJceZuzET10PXQfOgUJcmtQrhntvZP0+d9F7sfd8Df5dkCFX
   PT2SHOGL8wN3d39gVKAph/V8oQw8HTl3odgitXzoST9FeKJi5uZSKhQYv
   V8OmxLBx1wb9yGN4H2tJcUToIAHJ2nz0l6EGex4wQx0KsgxdbSMVy4gWd
   nLDs8dUrYFHsiHiikU8cH7m1muWhAFz90FpelkEUXghDSUyrH/xSYLHy4
   YgNpuJlvqBNRJw9m+dolsth1tKCbWBclNKTi9o3eVtbGlRR/V9NJ84nuf
   A==;
X-CSE-ConnectionGUID: ENLrM06TR8OC9ncmiS3sLA==
X-CSE-MsgGUID: ToaEHgAyThCyF2dUqSLBVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40174515"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="40174515"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 23:29:16 -0800
X-CSE-ConnectionGUID: 1FALSZDjTGunzAkFKziNaQ==
X-CSE-MsgGUID: v8zTB9WhTaWnmmAkffTGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102573726"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 23:29:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV41W-000EMZ-31;
	Tue, 07 Jan 2025 07:29:10 +0000
Date: Tue, 7 Jan 2025 15:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 12/17] net: stmmac: move priv->eee_active
 into stmmac_eee_init()
Message-ID: <202501071547.L5CjLObQ-lkp@intel.com>
References: <E1tUmAz-007VXn-0o@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAz-007VXn-0o@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_232917_322891_3BF6B5C2 
X-CRM114-Status: GOOD (  12.58  )
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

Hi Russell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-move-tx_lpi_timer-tracking-to-phylib/20250107-002808
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tUmAz-007VXn-0o%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next v2 12/17] net: stmmac: move priv->eee_active into stmmac_eee_init()
config: i386-buildonly-randconfig-005-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071547.L5CjLObQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071547.L5CjLObQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071547.L5CjLObQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:468: warning: Function parameter or struct member 'active' not described in 'stmmac_eee_init'


vim +468 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  458  
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  459  /**
732fdf0e5253e9 Giuseppe CAVALLARO       2014-11-18  460   * stmmac_eee_init - init EEE
32ceabcad3c8ab Giuseppe CAVALLARO       2013-04-08  461   * @priv: driver private structure
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  462   * Description:
732fdf0e5253e9 Giuseppe CAVALLARO       2014-11-18  463   *  if the GMAC supports the EEE (from the HW cap reg) and the phy device
732fdf0e5253e9 Giuseppe CAVALLARO       2014-11-18  464   *  can also manage EEE, this function enable the LPI state and start related
732fdf0e5253e9 Giuseppe CAVALLARO       2014-11-18  465   *  timer.
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  466   */
5ad24fd233fa83 Russell King (Oracle     2025-01-06  467) static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27 @468  {
5ad24fd233fa83 Russell King (Oracle     2025-01-06  469) 	priv->eee_active = active;
5ad24fd233fa83 Russell King (Oracle     2025-01-06  470) 
74371272f97fd1 Jose Abreu               2019-06-11  471  	/* Check if MAC core supports the EEE feature. */
418ee895284762 Russell King (Oracle     2025-01-06  472) 	if (!priv->dma_cap.eee) {
418ee895284762 Russell King (Oracle     2025-01-06  473) 		priv->eee_enabled = false;
418ee895284762 Russell King (Oracle     2025-01-06  474) 		return;
418ee895284762 Russell King (Oracle     2025-01-06  475) 	}
83bf79b6bb64e6 Giuseppe CAVALLARO       2014-03-10  476  
29555fa3de8656 Thierry Reding           2018-05-24  477  	mutex_lock(&priv->lock);
74371272f97fd1 Jose Abreu               2019-06-11  478  
74371272f97fd1 Jose Abreu               2019-06-11  479  	/* Check if it needs to be deactivated */
177d935a13703e Jon Hunter               2019-06-26  480  	if (!priv->eee_active) {
177d935a13703e Jon Hunter               2019-06-26  481  		if (priv->eee_enabled) {
38ddc59d65b6d9 LABBE Corentin           2016-11-16  482  			netdev_dbg(priv->dev, "disable EEE\n");
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  483  			stmmac_lpi_entry_timer_config(priv, 0);
83bf79b6bb64e6 Giuseppe CAVALLARO       2014-03-10  484  			del_timer_sync(&priv->eee_ctrl_timer);
26dbf37afd5d4b Russell King (Oracle     2025-01-06  485) 			stmmac_set_eee_timer(priv, priv->hw, 0,
26dbf37afd5d4b Russell King (Oracle     2025-01-06  486) 					     STMMAC_DEFAULT_TWT_LS);
d4aeaed80b0ebb Wong Vee Khee            2021-10-05  487  			if (priv->hw->xpcs)
d4aeaed80b0ebb Wong Vee Khee            2021-10-05  488  				xpcs_config_eee(priv->hw->xpcs,
d4aeaed80b0ebb Wong Vee Khee            2021-10-05  489  						priv->plat->mult_fact_100ns,
d4aeaed80b0ebb Wong Vee Khee            2021-10-05  490  						false);
177d935a13703e Jon Hunter               2019-06-26  491  		}
418ee895284762 Russell King (Oracle     2025-01-06  492) 		priv->eee_enabled = false;
0867bb9768deda Jon Hunter               2019-06-26  493  		mutex_unlock(&priv->lock);
418ee895284762 Russell King (Oracle     2025-01-06  494) 		return;
83bf79b6bb64e6 Giuseppe CAVALLARO       2014-03-10  495  	}
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  496  
74371272f97fd1 Jose Abreu               2019-06-11  497  	if (priv->eee_active && !priv->eee_enabled) {
74371272f97fd1 Jose Abreu               2019-06-11  498  		timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
74371272f97fd1 Jose Abreu               2019-06-11  499  		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
26dbf37afd5d4b Russell King (Oracle     2025-01-06  500) 				     STMMAC_DEFAULT_TWT_LS);
656ed8b015f19b Wong Vee Khee            2021-09-30  501  		if (priv->hw->xpcs)
656ed8b015f19b Wong Vee Khee            2021-09-30  502  			xpcs_config_eee(priv->hw->xpcs,
656ed8b015f19b Wong Vee Khee            2021-09-30  503  					priv->plat->mult_fact_100ns,
656ed8b015f19b Wong Vee Khee            2021-09-30  504  					true);
71965352eedd0c Giuseppe CAVALLARO       2014-08-28  505  	}
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  506  
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  507  	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  508  		del_timer_sync(&priv->eee_ctrl_timer);
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  509  		priv->tx_path_in_lpi_mode = false;
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  510  		stmmac_lpi_entry_timer_config(priv, 1);
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  511  	} else {
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  512  		stmmac_lpi_entry_timer_config(priv, 0);
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  513  		mod_timer(&priv->eee_ctrl_timer,
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  514  			  STMMAC_LPI_T(priv->tx_lpi_timer));
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  515  	}
388e201d41fa1e Vineetha G. Jaya Kumaran 2020-10-01  516  
418ee895284762 Russell King (Oracle     2025-01-06  517) 	priv->eee_enabled = true;
418ee895284762 Russell King (Oracle     2025-01-06  518) 
29555fa3de8656 Thierry Reding           2018-05-24  519  	mutex_unlock(&priv->lock);
38ddc59d65b6d9 LABBE Corentin           2016-11-16  520  	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  521  }
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  522  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


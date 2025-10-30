Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B15CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+qcSAnrH5UcFIvfSqrPya00d3psmqIdtSYaw8FiOjk=; b=h+D2dpwC1r3ZyJ/vcDfoybbp3S
	i2m6RISpo3Ol9ubOC/Gr0PyGXr4yn0nhsJxTEIWsre8pG+gxttNGigoWxcvwLc5ct4ryT89K7NfEe
	5NX+ABAuzcgvcNVXHw1ru9oJNBrD8ew+6dlaZDtrCjwcjOQieq21Y4N0Sp7WNMHY9Kue7qlL08VQf
	SXCa10jbE8YQpVMaSh9yJ1n1pyxLsgaGzhphy5mcVDLCB2KdKsDvgg6SMwtglUN47E9YuAXcztCy7
	bPsNFVcHSi+ogRDzolHyo1ih4k50B7KdHYZIxoEjHrvOfT7lqwJwhgS3N660GBGgqv4ZktLLoFjma
	9wnCHBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELQ5-00000003WFk-1l72;
	Thu, 30 Oct 2025 05:41:57 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELQ2-00000003WFN-2lYS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 05:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761802915; x=1793338915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nU18lsAq/OyPRT69o4sqp39RtOZX0AOAyhYhm0ktUQg=;
  b=FhNTmkAVx4A+xlFQcdbQ7EcILgvHpHQncZDQDTOavyWWPIa0phkKp+eG
   pVePfM3Y+xkjtGzS3U8mx4gEbAK6r6pg2GmIi3D6gg5OLsaBSOoEUCKVG
   CVaR1qFbCC49CanOmT59lALNDqMje2DRSsQDUZXjj7Afj6lk1wCDCVE3F
   adoVtpijvLeygfltRBTOHu0J+I+lOrMWTQc4LQPT7ZFEHYwT9rQ/wv1UA
   +CN+iNQoWbloT0mzgqTXrBNdLCH6U1ytjoJRv2Cx7zy2sp4hxcuRhq8F4
   DPhhRoizGvtWinO21wBelHGJM6dVgv01QwYzIUmbedXchAlNV83GNu4eZ
   A==;
X-CSE-ConnectionGUID: sBbeTnlST2Wbbhj14VttcQ==
X-CSE-MsgGUID: GaK5OojFRc+GhhdVBFfB0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67796620"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="67796620"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 22:41:53 -0700
X-CSE-ConnectionGUID: gBwJdAhDSdSXnuXl5d1Qjg==
X-CSE-MsgGUID: C4N+2GgQRb6xQS3KdzVsmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189934326"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 22:41:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vELPu-000LVA-0J;
	Thu, 30 Oct 2025 05:41:46 +0000
Date: Thu, 30 Oct 2025 13:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rohan G Thomas <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next 4/4] net: stmmac: socfpga: Add hardware
 supported cross-timestamp
Message-ID: <202510301322.f0J41mwI-lkp@intel.com>
References: <20251029-agilex5_ext-v1-4-1931132d77d6@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-agilex5_ext-v1-4-1931132d77d6@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_224154_715209_AE8B1044 
X-CRM114-Status: GOOD (  14.28  )
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

Hi Rohan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a8abe8e210c175b1d5a7e53df069e107b65c13cb]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-G-Thomas-via-B4-Relay/net-stmmac-socfpga-Agilex5-EMAC-platform-configuration/20251029-162502
base:   a8abe8e210c175b1d5a7e53df069e107b65c13cb
patch link:    https://lore.kernel.org/r/20251029-agilex5_ext-v1-4-1931132d77d6%40altera.com
patch subject: [PATCH net-next 4/4] net: stmmac: socfpga: Add hardware supported cross-timestamp
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251030/202510301322.f0J41mwI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301322.f0J41mwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301322.f0J41mwI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:390:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     390 |         return ret;
         |                ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:312:12: note: initialize the variable 'ret' to silence this warning
     312 |         int i, ret;
         |                   ^
         |                    = 0
   1 warning generated.


vim +/ret +390 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c

   301	
   302	static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
   303				    void *ctx)
   304	{
   305		struct stmmac_priv *priv = (struct stmmac_priv *)ctx;
   306		u32 num_snapshot, gpio_value, acr_value;
   307		void __iomem *ptpaddr = priv->ptpaddr;
   308		void __iomem *ioaddr = priv->hw->pcsr;
   309		unsigned long flags;
   310		u64 smtg_time = 0;
   311		u64 ptp_time = 0;
   312		int i, ret;
   313	
   314		/* Both internal crosstimestamping and external triggered event
   315		 * timestamping cannot be run concurrently.
   316		 */
   317		if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
   318			return -EBUSY;
   319	
   320		mutex_lock(&priv->aux_ts_lock);
   321		/* Enable Internal snapshot trigger */
   322		acr_value = readl(ptpaddr + PTP_ACR);
   323		acr_value &= ~PTP_ACR_MASK;
   324		switch (priv->plat->int_snapshot_num) {
   325		case AUX_SNAPSHOT0:
   326			acr_value |= PTP_ACR_ATSEN0;
   327			break;
   328		case AUX_SNAPSHOT1:
   329			acr_value |= PTP_ACR_ATSEN1;
   330			break;
   331		case AUX_SNAPSHOT2:
   332			acr_value |= PTP_ACR_ATSEN2;
   333			break;
   334		case AUX_SNAPSHOT3:
   335			acr_value |= PTP_ACR_ATSEN3;
   336			break;
   337		default:
   338			mutex_unlock(&priv->aux_ts_lock);
   339			return -EINVAL;
   340		}
   341		writel(acr_value, ptpaddr + PTP_ACR);
   342	
   343		/* Clear FIFO */
   344		acr_value = readl(ptpaddr + PTP_ACR);
   345		acr_value |= PTP_ACR_ATSFC;
   346		writel(acr_value, ptpaddr + PTP_ACR);
   347		/* Release the mutex */
   348		mutex_unlock(&priv->aux_ts_lock);
   349	
   350		/* Trigger Internal snapshot signal. Create a rising edge by just toggle
   351		 * the GPO0 to low and back to high.
   352		 */
   353		gpio_value = readl(ioaddr + XGMAC_GPIO_STATUS);
   354		gpio_value &= ~XGMAC_GPIO_GPO0;
   355		writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
   356		gpio_value |= XGMAC_GPIO_GPO0;
   357		writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
   358	
   359		/* Time sync done Indication - Interrupt method */
   360		if (!wait_event_interruptible_timeout(priv->tstamp_busy_wait,
   361						      dwxgmac_cross_ts_isr(priv),
   362						      HZ / 100)) {
   363			priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
   364			return -ETIMEDOUT;
   365		}
   366	
   367		*system = (struct system_counterval_t) {
   368			.cycles = 0,
   369			.cs_id = CSID_ARM_ARCH_COUNTER,
   370			.use_nsecs = true,
   371		};
   372	
   373		num_snapshot = (readl(ioaddr + XGMAC_TIMESTAMP_STATUS) &
   374				XGMAC_TIMESTAMP_ATSNS_MASK) >>
   375				XGMAC_TIMESTAMP_ATSNS_SHIFT;
   376	
   377		/* Repeat until the timestamps are from the FIFO last segment */
   378		for (i = 0; i < num_snapshot; i++) {
   379			read_lock_irqsave(&priv->ptp_lock, flags);
   380			stmmac_get_ptptime(priv, ptpaddr, &ptp_time);
   381			*device = ns_to_ktime(ptp_time);
   382			read_unlock_irqrestore(&priv->ptp_lock, flags);
   383		}
   384	
   385		get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
   386		system->cycles = smtg_time;
   387	
   388		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
   389	
 > 390		return ret;
   391	}
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


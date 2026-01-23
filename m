Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34D4D72343
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKskeoEuphC7+muWFEg7kL5+hoJlciIgk7eQsK9NVUc=; b=aUUQ+i9DyPf15rjyNN6opYvCxP
	62tiYW0c12BhIHvQI/4AFCPrqBaCdWSoVz/WjsmxIqn4lEPxlZ2gm1tZhmqsbYUyQYIzTuc+s5XAl
	SNUQCRJocqpLP+26nFpQqQKh6HniytHt/2Kf25VXNl8WPG3vAQ6w45M+PVQuP8BB4dqvLcnYSX688
	lyei61ZqIhZFPC05MILSTL1TX5MVABjDcMJODLdxN0g3H0S7G03B6rfaNoevfxH+GtN+qriX1mBFi
	PN9SJw44s59kmouwiP54WUEGXniLUlgkzcf6LDucBKpxLts+jHhor3YZMnbgrCvxIAcd+h7FObdIc
	xgqbW5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC55-00000008PDS-41fi;
	Fri, 23 Jan 2026 07:59:47 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC53-00000008PCw-39Zj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 07:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769155186; x=1800691186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c0K9UaO3St0IE2YkmiOL1BniYmWEc2RHIdZofm+Lw0I=;
  b=TkcIJRDdERM2s3Jh/dWoLf/Gk8Hc/KIwMPwj5Yg1nipXmttiaj40Fvp1
   lpjFU4R8ITgkDqq/8O2avWZjEG8eq6QfkStKhZxslxKAVefjC1ie/3S8O
   oEw/IZyR8YpkUe+/4lISGBY8y26mxCisdpur2tmAXu55wpQZxVDqU884l
   A1ptMjeFsta6++UCMJZKbQPt/uGxagAN2s0sC0wAML0yyiXz0ETtBfZUb
   WIy2weF/ivwB1C0kgQ/yMmOcn28nydWG/s/9JEMihGqhgZbh8h8SraBxP
   z/POX6A6F6n7FRBjtCF5ZWBxIJzWD9TTe6RRM6d0Kr/Dhx1zU5Ag9ybOE
   Q==;
X-CSE-ConnectionGUID: gZNUyOmpR4O55CGJpurIKQ==
X-CSE-MsgGUID: ALLc18IVRSO2tK7D5a/5ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="57977624"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="57977624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 23:59:42 -0800
X-CSE-ConnectionGUID: seuhiDOlRdWkicNj+8cXKQ==
X-CSE-MsgGUID: 7/rxyr7iTmS51C3Yh0T0mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="238219086"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jan 2026 23:59:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjC4v-00000000TfC-1Lpd;
	Fri, 23 Jan 2026 07:59:37 +0000
Date: Fri, 23 Jan 2026 15:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH 1/3] mmc: dw_mmc-k3: Remove mshc alias support
Message-ID: <202601231543.IzsYNOzJ-lkp@intel.com>
References: <1769132482-177365-2-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1769132482-177365-2-git-send-email-shawn.lin@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_235945_806886_13453223 
X-CRM114-Status: GOOD (  13.57  )
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

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master ulf-hansson-mmc-mirror/next v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/mmc-dw_mmc-k3-Remove-mshc-alias-support/20260123-095950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1769132482-177365-2-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH 1/3] mmc: dw_mmc-k3: Remove mshc alias support
config: arc-randconfig-002-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231543.IzsYNOzJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231543.IzsYNOzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231543.IzsYNOzJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/dw_mmc-k3.c: In function 'dw_mci_hs_set_timing':
   drivers/mmc/host/dw_mmc-k3.c:220:16: error: 'struct dw_mci' has no member named 'mmc'
     ctrl_id = host->mmc->index;
                   ^~
>> drivers/mmc/host/dw_mmc-k3.c:217:18: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
     struct k3_priv *priv;
                     ^~~~


vim +/priv +217 drivers/mmc/host/dw_mmc-k3.c

0293efddaddfcb Zhangfei Gao        2015-05-14  207  
d53e39b1131c08 Shawn Lin           2026-01-23  208  static int dw_mci_hs_set_timing(struct dw_mci *host, int timing,
361c7fe9b02eee liwei               2017-08-11  209  				     int smpl_phase)
361c7fe9b02eee liwei               2017-08-11  210  {
361c7fe9b02eee liwei               2017-08-11  211  	u32 drv_phase;
361c7fe9b02eee liwei               2017-08-11  212  	u32 smpl_dly;
361c7fe9b02eee liwei               2017-08-11  213  	u32 use_smpl_dly = 0;
361c7fe9b02eee liwei               2017-08-11  214  	u32 enable_shift = 0;
361c7fe9b02eee liwei               2017-08-11  215  	u32 reg_value;
361c7fe9b02eee liwei               2017-08-11  216  	int ctrl_id;
361c7fe9b02eee liwei               2017-08-11 @217  	struct k3_priv *priv;
361c7fe9b02eee liwei               2017-08-11  218  
361c7fe9b02eee liwei               2017-08-11  219  	priv = host->priv;
d53e39b1131c08 Shawn Lin           2026-01-23 @220  	ctrl_id = host->mmc->index;
d53e39b1131c08 Shawn Lin           2026-01-23  221  
d53e39b1131c08 Shawn Lin           2026-01-23  222  	if (ctrl_id >= TIMING_MODE)
d53e39b1131c08 Shawn Lin           2026-01-23  223  		return -EINVAL;
361c7fe9b02eee liwei               2017-08-11  224  
361c7fe9b02eee liwei               2017-08-11  225  	drv_phase = hs_timing_cfg[ctrl_id][timing].drv_phase;
361c7fe9b02eee liwei               2017-08-11  226  	smpl_dly   = hs_timing_cfg[ctrl_id][timing].smpl_dly;
361c7fe9b02eee liwei               2017-08-11  227  	if (smpl_phase == -1)
361c7fe9b02eee liwei               2017-08-11  228  		smpl_phase = (hs_timing_cfg[ctrl_id][timing].smpl_phase_max +
361c7fe9b02eee liwei               2017-08-11  229  			     hs_timing_cfg[ctrl_id][timing].smpl_phase_min) / 2;
361c7fe9b02eee liwei               2017-08-11  230  
361c7fe9b02eee liwei               2017-08-11  231  	switch (timing) {
361c7fe9b02eee liwei               2017-08-11  232  	case MMC_TIMING_UHS_SDR104:
361c7fe9b02eee liwei               2017-08-11  233  		if (smpl_phase >= USE_DLY_MIN_SMPL &&
361c7fe9b02eee liwei               2017-08-11  234  				smpl_phase <= USE_DLY_MAX_SMPL)
361c7fe9b02eee liwei               2017-08-11  235  			use_smpl_dly = 1;
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  236  		fallthrough;
361c7fe9b02eee liwei               2017-08-11  237  	case MMC_TIMING_UHS_SDR50:
361c7fe9b02eee liwei               2017-08-11  238  		if (smpl_phase >= ENABLE_SHIFT_MIN_SMPL &&
361c7fe9b02eee liwei               2017-08-11  239  				smpl_phase <= ENABLE_SHIFT_MAX_SMPL)
361c7fe9b02eee liwei               2017-08-11  240  			enable_shift = 1;
361c7fe9b02eee liwei               2017-08-11  241  		break;
361c7fe9b02eee liwei               2017-08-11  242  	}
361c7fe9b02eee liwei               2017-08-11  243  
361c7fe9b02eee liwei               2017-08-11  244  	mci_writel(host, GPIO, 0x0);
361c7fe9b02eee liwei               2017-08-11  245  	usleep_range(5, 10);
361c7fe9b02eee liwei               2017-08-11  246  
361c7fe9b02eee liwei               2017-08-11  247  	reg_value = FIELD_PREP(UHS_REG_EXT_SAMPLE_PHASE_MASK, smpl_phase) |
361c7fe9b02eee liwei               2017-08-11  248  		    FIELD_PREP(UHS_REG_EXT_SAMPLE_DLY_MASK, smpl_dly) |
361c7fe9b02eee liwei               2017-08-11  249  		    FIELD_PREP(UHS_REG_EXT_SAMPLE_DRVPHASE_MASK, drv_phase);
361c7fe9b02eee liwei               2017-08-11  250  	mci_writel(host, UHS_REG_EXT, reg_value);
361c7fe9b02eee liwei               2017-08-11  251  
361c7fe9b02eee liwei               2017-08-11  252  	mci_writel(host, ENABLE_SHIFT, enable_shift);
361c7fe9b02eee liwei               2017-08-11  253  
361c7fe9b02eee liwei               2017-08-11  254  	reg_value = FIELD_PREP(GPIO_CLK_DIV_MASK, GENCLK_DIV) |
361c7fe9b02eee liwei               2017-08-11  255  			     FIELD_PREP(GPIO_USE_SAMPLE_DLY_MASK, use_smpl_dly);
361c7fe9b02eee liwei               2017-08-11  256  	mci_writel(host, GPIO, (unsigned int)reg_value | GPIO_CLK_ENABLE);
361c7fe9b02eee liwei               2017-08-11  257  
361c7fe9b02eee liwei               2017-08-11  258  	/* We should delay 1ms wait for timing setting finished. */
361c7fe9b02eee liwei               2017-08-11  259  	usleep_range(1000, 2000);
d53e39b1131c08 Shawn Lin           2026-01-23  260  
d53e39b1131c08 Shawn Lin           2026-01-23  261  	return 0;
361c7fe9b02eee liwei               2017-08-11  262  }
361c7fe9b02eee liwei               2017-08-11  263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


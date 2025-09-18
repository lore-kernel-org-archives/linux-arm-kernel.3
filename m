Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCFECAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6ZNh2CldpFkggR//+kh0/H5v/IH6zkdIqrXr1GpPBg=; b=DKlOmBsgEW27l+IPC99N9C5QFE
	EBcwGa4JD/i4cBfqmF157+lsitfG2JfvOfQCAv8iKCiQ33WKsLQbUeZPyWc61Q3cTp0d/cPQv2KtT
	OvxVbXU/Pp343bTeyAzHsBwRBUfzsD3Joi/kzSjSKAPbOqmYPp1X5LSS8k9Yru9vSD4a1kpugbqm+
	gQLY6PEzZkKoX44Yyn74rX2+pRVeGoRMmISqfJGrFdOTM+iYcMEQRenUJvBmNUm5uEwpFp+sIPYxg
	ZLjwP4YJdKkoBs9o5QN7G3o0PKo06L6Sn9TKS6Lbyfvcl5JMdV2kkaAJIBZ4wxWQw+c3NsBLpXpnu
	43AkPGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDBL-0000000HH81-3zEX;
	Thu, 18 Sep 2025 11:52:11 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDBF-0000000HH2z-0qS3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758196325; x=1789732325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gRM5ebAAEf4TRIWQFHbcl8pLy8N7ldQhFRmgB1sHmKg=;
  b=MQB+MfmvNoBEYl1Dyy5LRttRalj0lXZBxYXb2fvj5NiSVCwrqb+QrC5+
   xXHY4Hw7UqHl96wpjD2HXLuii7pAgtb8pCX/3z+F1eF943ZfRPD5iZWsr
   3pbFo2G3Av11omRiPxU7txIdQdO72qbxd4zza9bjFtWGYr5nd1UhMY/xM
   qEjMKQpFJcufeBO5sFJ5S/atAGcTf+Zfx9mmtVnjqMLdD8yxd5pJE7y3N
   U3AJ0pA+nKkd3wm5xCv5/080ptU9t5mwG0FTwvaH4qnO/G4f9lBmv+URi
   r+BBjwmkRltzTwDgDROEDXQ9iskdQ96FitIPneNCZkxdNrLgGrs9YjqWe
   g==;
X-CSE-ConnectionGUID: SRb3HDIsTjmowrzUUmMc/Q==
X-CSE-MsgGUID: AOvBqGd1QF+pNJw0JKt6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60454920"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="60454920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 04:52:03 -0700
X-CSE-ConnectionGUID: xpACrP6fTbC4WJ9LOd4WfQ==
X-CSE-MsgGUID: RkJTVKFVTm6UUBTnBekyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="206471603"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2025 04:51:56 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzDB4-0003D5-14;
	Thu, 18 Sep 2025 11:51:54 +0000
Date: Thu, 18 Sep 2025 19:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ravi Patel <ravi.patel@samsung.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jesper.nilsson@axis.com,
	lars.persson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: oe-kbuild-all@lists.linux.dev, ravi.patel@samsung.com,
	ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com,
	krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com
Subject: Re: [PATCH 2/7] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
Message-ID: <202509181955.NgLJ2aBv-lkp@intel.com>
References: <20250917085005.89819-3-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917085005.89819-3-ravi.patel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_045205_283938_8C7EA744 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Ravi,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on clk/clk-next next-20250917]
[cannot apply to robh/for-next linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ravi-Patel/dt-bindings-clock-Add-ARTPEC-9-clock-controller/20250917-165346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250917085005.89819-3-ravi.patel%40samsung.com
patch subject: [PATCH 2/7] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20250918/202509181955.NgLJ2aBv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181955.NgLJ2aBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181955.NgLJ2aBv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/samsung/clk-pll.o: in function `samsung_a9fraco_recalc_rate':
>> drivers/clk/samsung/clk-pll.c:1508:(.text+0xcc): undefined reference to `__aeabi_uldivmod'


vim +1508 drivers/clk/samsung/clk-pll.c

  1490	
  1491	static unsigned long samsung_a9fraco_recalc_rate(struct clk_hw *hw,
  1492							 unsigned long parent_rate)
  1493	{
  1494		struct samsung_clk_pll *pll = to_clk_pll(hw);
  1495		u32 pll_con0, pll_con5;
  1496		u64 mdiv, pdiv, sdiv, kdiv;
  1497		u64 fvco = parent_rate;
  1498	
  1499		pll_con0 = readl_relaxed(pll->con_reg);
  1500		pll_con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
  1501		mdiv = (pll_con0 >> PLLA9FRACO_MDIV_SHIFT) & PLLA9FRACO_MDIV_MASK;
  1502		pdiv = (pll_con0 >> PLLA9FRACO_PDIV_SHIFT) & PLLA9FRACO_PDIV_MASK;
  1503		sdiv = (pll_con0 >> PLLA9FRACO_SDIV_SHIFT) & PLLA9FRACO_SDIV_MASK;
  1504		kdiv = (pll_con5 & PLLA9FRACO_KDIV_MASK);
  1505	
  1506		/* fvco = fref * (M + K/2^24) / p * (S+1) */
  1507		fvco *= mdiv;
> 1508		fvco = ((fvco << 24) + kdiv) / ((pdiv * (sdiv + 1)) << 24);
  1509	
  1510		return (unsigned long)fvco;
  1511	}
  1512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


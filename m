Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08641CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JigES+QS4kiaymioDzH3gcZ4orKlhBjvX19fbmESVWs=; b=yyPamAIltdNlocP7dYMt9uwzvP
	s3Az/hktZvTQhAkOOuJUbx08PNSgC21K/60hC+fGO0/dz7j9C4MseIlRE/j8euYGjieNtN034UT+A
	f7v3weXxQC59UMeCbFipHoG4/vQFTCVx/g5lfMmpjrpwItjccAUtScOw/cFVL6wbIb+tYzBI8tqNA
	Vfqkct4QELkwgcv7WHlu653VFN6NkH48pV0gp47/baAP9k1ca2/Rv9bBC5XuGIPzeqbUAMowYfbq5
	4rEq7kDwa9azu5waCLgNFrsXWnFK1WzJv5pqJw3T7E9rXBKvs9eLvCo6uGoNIDTrZjCSPhO+3pGaC
	rLQoHoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GQR-00000003UMk-2Quf;
	Thu, 16 Oct 2025 05:21:19 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GQO-00000003UM1-2He5;
	Thu, 16 Oct 2025 05:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760592077; x=1792128077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A5/NfebLVy4IGMGuPkdkDW55FyxpvHYdJJaOthRXXoc=;
  b=k0n68I8xK4ihNFZYIgd2v+4vHfFAfiWL7GD3t/XDkUBa+wDRpxtAI5j5
   zFmZVI3IgWe2HqiSsl5k9ESLR/4jhgk39PAtzHG7fTfAZtdWpTM0/bW9L
   eDj1tA87+pf/X1pMWzkXlQrqP0881AYA5HbB9qqg1N4gyfc7DMkbQeMxh
   k0/walMhSYgMlj5Bhw/K9eT8+fGCMmCuuS4lfM9FMMQ9RCfkMBnL4Etns
   p3F/TJWgBCQOXqY1UR5fx8hTZiYn0WRLyu9Zxh8W8wSKZaxtuVhcZ5Q29
   rdGYAIk0MRC6ArhVCp8znBlYjJ4QW3ltdG90vXf8iu/g4Q1oemrdivtgL
   g==;
X-CSE-ConnectionGUID: ExDJdwU9RXiVj1a+oDKWmw==
X-CSE-MsgGUID: onu52EW3S1Ww+Q3OHvawHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62924849"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62924849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 22:21:14 -0700
X-CSE-ConnectionGUID: IP3cuvibS+CCJccqMBQeCg==
X-CSE-MsgGUID: p/7nVWqaTMGmK0NbxwP28Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="206062697"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Oct 2025 22:21:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9GQD-0004TT-0E;
	Thu, 16 Oct 2025 05:21:05 +0000
Date: Thu, 16 Oct 2025 13:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
	sboyd@kernel.org, sugar.zhang@rock-chips.com, heiko@sntech.de,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, huangtao@rock-chips.com
Subject: Re: [PATCH v1 3/5] clk: rockchip: Add clock controller for the
 RV1126B
Message-ID: <202510161254.tQekPr3V-lkp@intel.com>
References: <20251015091325.71333-4-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015091325.71333-4-zhangqing@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_222116_646697_79DAFCBC 
X-CRM114-Status: GOOD (  11.64  )
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

Hi Elaine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on clk/clk-next pza/reset/next linus/master v6.18-rc1 next-20251015]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elaine-Zhang/clk-rockchip-Implement-rockchip_clk_register_armclk_v2/20251015-175108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20251015091325.71333-4-zhangqing%40rock-chips.com
patch subject: [PATCH v1 3/5] clk: rockchip: Add clock controller for the RV1126B
config: arm-defconfig (https://download.01.org/0day-ci/archive/20251016/202510161254.tQekPr3V-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161254.tQekPr3V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161254.tQekPr3V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-rv1126b.c:146:7: warning: unused variable 'mux_ddrphy_p' [-Wunused-const-variable]
     146 | PNAME(mux_ddrphy_p)                     = { "dpll", "aclk_sysmem" };
         |       ^~~~~~~~~~~~
   1 warning generated.


vim +/mux_ddrphy_p +146 drivers/clk/rockchip/clk-rv1126b.c

    86	
    87	PNAME(mux_pll_p)			= { "xin24m" };
    88	PNAME(mux_gpll_cpll_p)			= { "gpll", "cpll" };
    89	PNAME(mux_gpll_aupll_p)			= { "gpll", "aupll" };
    90	PNAME(mux_gpll_aupll_cpll_p)		= { "gpll", "aupll", "cpll" };
    91	PNAME(mux_gpll_cpll_24m_p)		= { "gpll", "cpll", "xin24m" };
    92	PNAME(mux_cpll_24m_p)			= { "cpll", "xin24m" };
    93	PNAME(mux_24m_gpll_aupll_cpll_p)	= { "xin24m", "gpll", "aupll", "cpll" };
    94	PNAME(mux_24m_gpll_cpll_p)		= { "xin24m", "gpll", "cpll" };
    95	PNAME(mux_24m_gpll_aupll_p)		= { "xin24m", "gpll", "aupll" };
    96	PNAME(mux_sclk_uart_src_p)		= { "xin24m", "clk_cm_frac0", "clk_cm_frac1", "clk_cm_frac2",
    97						    "clk_uart_frac0", "clk_uart_frac1" };
    98	PNAME(mclk_sai0_src_p)			= { "xin24m", "clk_cm_frac0", "clk_cm_frac1", "clk_cm_frac2",
    99						    "clk_audio_frac0", "clk_audio_frac1", "clk_audio_int0", "clk_audio_int1", "mclk_sai0_from_io" };
   100	PNAME(mclk_sai1_src_p)			= { "xin24m", "clk_cm_frac0", "clk_cm_frac1", "clk_cm_frac2", "clk_audio_frac0",
   101						    "clk_audio_frac1", "clk_audio_int0", "clk_audio_int1", "mclk_sai1_from_io" };
   102	PNAME(mclk_sai2_src_p)			= { "xin24m", "clk_cm_frac0", "clk_cm_frac1", "clk_cm_frac2", "clk_audio_frac0",
   103						    "clk_audio_frac1", "clk_audio_int0", "clk_audio_int1", "mclk_sai2_from_io" };
   104	PNAME(mux_sai_src_p)			= { "xin24m", "clk_cm_frac0", "clk_cm_frac1", "clk_cm_frac2", "clk_audio_frac0",
   105						    "clk_audio_frac1", "clk_audio_int0", "clk_audio_int1", "mclk_sai0_from_io",
   106						    "mclk_sai1_from_io", "mclk_sai2_from_io"};
   107	PNAME(mux_100m_24m_p)			= { "clk_cpll_div10", "xin24m" };
   108	PNAME(mux_200m_24m_p)			= { "clk_gpll_div6", "xin24m" };
   109	PNAME(mux_500m_400m_200m_p)		= { "clk_cpll_div2", "clk_gpll_div3", "clk_gpll_div6" };
   110	PNAME(mux_300m_200m_p)			= { "clk_gpll_div4", "clk_gpll_div6" };
   111	PNAME(mux_500m_400m_300m_p)		= { "clk_cpll_div2", "clk_gpll_div3", "clk_gpll_div4" };
   112	PNAME(mux_333m_200m_p)			= { "clk_cpll_div3", "clk_gpll_div6" };
   113	PNAME(mux_600m_400m_200m_p)		= { "clk_gpll_div2", "clk_gpll_div3", "clk_gpll_div6" };
   114	PNAME(mux_400m_300m_200m_p)		= { "clk_gpll_div3", "clk_gpll_div4", "clk_gpll_div6" };
   115	PNAME(mux_200m_100m_p)			= { "clk_gpll_div6", "clk_cpll_div10" };
   116	PNAME(mux_200m_100m_50m_24m_p)		= { "clk_gpll_div6", "clk_cpll_div10", "clk_cpll_div20", "xin24m" };
   117	PNAME(mux_600m_24m_p)			= { "clk_gpll_div2", "xin24m" };
   118	PNAME(mux_armclk_p)			= { "clk_core_pll", "clk_core_pvtpll" };
   119	PNAME(aclk_npu_root_p)			= { "clk_npu_pll", "clk_npu_pvtpll" };
   120	PNAME(clk_saradc0_p)			= { "clk_saradc0_src", "clk_saradc0_rcosc_io" };
   121	PNAME(clk_core_vepu_p)			= { "clk_vepu_pll", "clk_vepu_pvtpll" };
   122	PNAME(clk_core_fec_p)			= { "clk_core_fec_src", "clk_vcp_pvtpll" };
   123	PNAME(clk_core_aisp_p)			= { "clk_aisp_pll", "clk_vcp_pvtpll" };
   124	PNAME(clk_core_isp_root_p)		= { "clk_isp_pll", "clk_isp_pvtpll" };
   125	PNAME(clk_gmac_ptp_ref_p)		= { "clk_gmac_ptp_ref_src", "clk_gmac_ptp_from_io" };
   126	PNAME(clk_saradc1_p)			= { "clk_saradc1_src", "clk_saradc1_rcosc_io" };
   127	PNAME(clk_saradc2_p)			= { "clk_saradc2_src", "clk_saradc2_rcosc_io" };
   128	PNAME(clk_rcosc_src_p)			= { "xin24m", "clk_rcosc", "clk_rcosc_div2", "clk_rcosc_div3", "clk_rcosc_div4" };
   129	PNAME(busclk_pmu_mux_p)			= { "clk_cpll_div10", "clk_rcosc_src" };
   130	PNAME(clk_xin_rc_div_p)			= { "xin24m", "clk_rcosc_src" };
   131	PNAME(clk_32k_p)			= { "clk_xin_rc_div", "clk_32k_rtc", "clk_32k_io" };
   132	PNAME(mux_24m_32k_p)			= { "xin24m", "clk_32k" };
   133	PNAME(mux_24m_rcosc_buspmu_p)		= { "xin24m", "clk_rcosc_src", "busclk_pmu_src" };
   134	PNAME(mux_24m_rcosc_buspmu_32k_p)	= { "xin24m", "clk_rcosc_src", "busclk_pmu_src", "clk_32k" };
   135	PNAME(sclk_uart0_p)			= { "sclk_uart0_src", "xin24m", "clk_rcosc_src" };
   136	PNAME(clk_osc_rcosc_ctrl_p)		= { "clk_rcosc_src", "clk_testout_out" };
   137	PNAME(lrck_src_asrc_p)			= { "mclk_asrc0", "mclk_asrc1", "mclk_asrc2", "mclk_asrc3",
   138						    "fs_inter_from_sai0", "fs_inter_from_sai1", "fs_inter_from_sai2", "clkout_pdm"};
   139	PNAME(clk_ref_pipephy_p)		= { "clk_ref_pipephy_cpll_src", "xin24m" };
   140	PNAME(clk_timer0_parents_p)		= { "clk_timer_root", "mclk_sai0_from_io", "sclk_sai0_from_io" };
   141	PNAME(clk_timer1_parents_p)		= { "clk_timer_root", "mclk_sai1_from_io", "sclk_sai1_from_io" };
   142	PNAME(clk_timer2_parents_p)		= { "clk_timer_root", "mclk_sai2_from_io", "sclk_sai2_from_io" };
   143	PNAME(clk_timer3_parents_p)		= { "clk_timer_root", "mclk_asrc0", "mclk_asrc1" };
   144	PNAME(clk_timer4_parents_p)		= { "clk_timer_root", "mclk_asrc2", "mclk_asrc3" };
   145	PNAME(clk_macphy_p)			= { "xin24m", "clk_cpll_div20" };
 > 146	PNAME(mux_ddrphy_p)			= { "dpll", "aclk_sysmem" };
   147	PNAME(clk_cpll_div10_p)			= { "gpll", "clk_aisp_pll_src" };
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


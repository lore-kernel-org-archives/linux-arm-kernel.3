Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A709DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIHrgdtc4oC/R4pWnFgtEGCVANIfrpCmBiRl/x6wgOc=; b=Z7/T+vOmTqcof7zHumhsegKTT+
	Rv9Sf8bJUfg/rms8vZoMn6zw4QW0sP63IBTesPfR4r71+6IDW9xQy8UKQa6FgeDDEk4eNe3ngJ3uh
	3HnI1/e3p7je658V+199q+NHYQOB56vQXPAL5P8/jsrE2vX3RdRBwXSo6QkbxY6cTmYOi7jsBALQZ
	Pdu/FBiNlsx6gngBOp+WoXaO9yNP5W2m/AdgN2u6N+81rFG09YKLTVmQRmmYQVR05ExpyNkEHJQS7
	N7T1iLdpRdrTFhw+20jcIvuauwQoarb61GELQ8rMu0j2lrd/huwPqlgf/qyuLnK4GICEjwtrgQpUb
	o6soPJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAhn-0000000DpqB-35u4;
	Fri, 24 Jan 2025 03:50:03 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAgT-0000000Dpie-3mpF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 03:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737690522; x=1769226522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ESESZlbmbscGyg08fJZIcgd/7xsDYidU9KIpFT/rdAY=;
  b=iYSjCxE5Q8+ua1qyg5uhDzzxqqbg/nlL1dC5nA9os9Y9qHfgAEC7HKwq
   O2miXbUzyynPiILb2BMOkYrMCqI5VI9oP/R6vDxeCkZ1zPCTlQ2QtAX9n
   qks55q/KoPer+p+c8BSVoez/kG4estTrD7FwdNmWRPVayNYYk/P7PhgJa
   w9Gv6BQSzI8GUrQlx4Lww30JN3Yms029shROYMuQE2vQG/K+cDvKWsC+M
   2oylZ66gQN4iGS2LxTDkfkBybk9yFoBAbNRbGkP7QNb2bSo/WujGlncFp
   Z8nYe6JDVLaecvNhN5CcMa4j0myar8sx4fnzNNSQITwEvyKA/njp4cUZ9
   g==;
X-CSE-ConnectionGUID: 3eFNEbnwRhWn8A1vNKQZng==
X-CSE-MsgGUID: wZRfVKdgRpe28B0G9JLCjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41883728"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="41883728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 19:48:41 -0800
X-CSE-ConnectionGUID: FcaMMzkpTRiK0gGgdkLT9w==
X-CSE-MsgGUID: SIwu+aytSZuzIOueLOhRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="138528984"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2025 19:48:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbAgM-000c63-2F;
	Fri, 24 Jan 2025 03:48:34 +0000
Date: Fri, 24 Jan 2025 11:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
Message-ID: <202501241339.AZK5Ob8e-lkp@intel.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-7-5d1bdb5a140c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-7-5d1bdb5a140c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_194842_023357_51FA7480 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Hi Taniya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0907e7fb35756464aa34c35d6abb02998418164b]

url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-clk-alpha-pll-Add-support-for-dynamic-update-for-slewing-PLLs/20250119-182754
base:   0907e7fb35756464aa34c35d6abb02998418164b
patch link:    https://lore.kernel.org/r/20250119-qcs615-mm-v4-clockcontroller-v4-7-5d1bdb5a140c%40quicinc.com
patch subject: [PATCH v4 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
config: nios2-randconfig-r111-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241339.AZK5Ob8e-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241339.AZK5Ob8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241339.AZK5Ob8e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gpucc-qcs615.c:394:15: sparse: sparse: symbol 'gpu_cc_sm6150_hws' was not declared. Should it be static?

vim +/gpu_cc_sm6150_hws +394 drivers/clk/qcom/gpucc-qcs615.c

   393	
 > 394	struct clk_hw *gpu_cc_sm6150_hws[] = {
   395		[CRC_DIV_PLL0] = &crc_div_pll0.hw,
   396		[CRC_DIV_PLL1] = &crc_div_pll1.hw,
   397	};
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


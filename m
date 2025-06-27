Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C422C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vN5KtyccyQR8NIxSTnswzlHl+ktrS9Gv+Tl8vpykvlc=; b=vcGjAd4p4HdU1smRyggZ4oYtGg
	N0nveKUn8t8g6FacbVRj4wipOjzN9zG1QinmrBsmket2njZ+gRhC3A2RmJExIzwr24EKw+AIicaUE
	cUNMUqPVEQyVxd7EKrBBWP/2EWECpSiPqkSrc2RCwNYWjon2hm4aY7zWtzhAAM7E4t485OED2zjBO
	Z/4nqD+QbVvagcjsIk8i2XPEaqXXYLS1e5HvELdCYcACeY4IFKzMV2i699GiZU5TdCo79LvBKkuVH
	m5j4CwqJK64EjvHuQ5IOS+Y0ctkc5GXlWkXdmeBtyz3O7dL5rvjd5l8lEA8Tu61l2ZRQdBuM1/ouu
	ui3MGAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3vE-0000000DtMH-2P2J;
	Fri, 27 Jun 2025 07:54:56 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3dP-0000000DqBG-1Usj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751009792; x=1782545792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R7MFiZ9r/m2icBqFE8z942btjxdQ3uI5L9jjyYNHCUk=;
  b=SngtEmegXuBEkY4VT25y9JMPKFNUeFsyWKqyTTaR7xAQeL3MwEzl73Ex
   /mRfA6D7TQM5LeOsW/bbRNyZXEVSeICxyh/HV0ZiO6I2A+V0wsBac8Efy
   ojSbWS8NFIS80sYih0a5tizG4PoN26Gx7kgKosFrBmAgwx8okEzy+lelv
   eCB6GwYS8dOnfkZ9u22ALzxfw0yv0sbJC98PPYRFjWnziyo4W/VrVofbm
   mrF/RJAJ4jOzfCO2KqZ3JF0wLN1J6QwAoGrESVkxAzLJMoxAgJRorEQMG
   UCfIaFGPiEwcHnzKmBEofJAlRFoYxS6d/d4s8ICU1RnHKQHoo/5OS3wlL
   w==;
X-CSE-ConnectionGUID: 4o3ILNCIQYqNoOjPa5wY3g==
X-CSE-MsgGUID: lJU5akCDT9CVqSZbxNwZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53190637"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53190637"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:36:31 -0700
X-CSE-ConnectionGUID: Kh5t6bgAQ1+j0Xkx9PE3SA==
X-CSE-MsgGUID: j0Uw8pEZQUqEGpTzy5l4rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="153256700"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jun 2025 00:36:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV3dI-000VvV-0Y;
	Fri, 27 Jun 2025 07:36:24 +0000
Date: Fri, 27 Jun 2025 15:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v10 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
Message-ID: <202506271519.GYlfvTOB-lkp@intel.com>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-7-ec48255f90d8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-7-ec48255f90d8@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_003631_442332_C2DF5D6D 
X-CRM114-Status: UNSURE (   9.65  )
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

[auto build test WARNING on 2ae2aaafb21454f4781c30734959cf223ab486ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-clk-alpha-pll-Add-support-for-dynamic-update-for-slewing-PLLs/20250625-184903
base:   2ae2aaafb21454f4781c30734959cf223ab486ef
patch link:    https://lore.kernel.org/r/20250625-qcs615-mm-v10-clock-controllers-v10-7-ec48255f90d8%40quicinc.com
patch subject: [PATCH v10 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
config: arc-randconfig-r121-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271519.GYlfvTOB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271519.GYlfvTOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271519.GYlfvTOB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gpucc-qcs615.c:396:15: sparse: sparse: symbol 'gpu_cc_qcs615_hws' was not declared. Should it be static?

vim +/gpu_cc_qcs615_hws +396 drivers/clk/qcom/gpucc-qcs615.c

   395	
 > 396	struct clk_hw *gpu_cc_qcs615_hws[] = {
   397		[CRC_DIV_PLL0] = &crc_div_pll0.hw,
   398		[CRC_DIV_PLL1] = &crc_div_pll1.hw,
   399	};
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D76FD149F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXWsYi8bGYheWlLvzzSja8YQDlmxSRT7Q8dneFWcjp4=; b=txAMiIeVqbQLjGbXanjJRclvQM
	OYF/PQtRkza+b+JtiiJ12rWymodnYoTb1iBlngMBcEW3JZk+nHBvvQKM10N4mu3eZ3btMjBLqaOOS
	mpwxFZTb7+4bCh37EVTgQQLJOZnsIyDrH79M37uTJ/ZRbWMbX08Xy4LrSIQqy1o905ZEUJ5bb+xBi
	CXcGmucGAXr8FMn28bxkPpA4pH3HYtYIY4gCu8mEsaAOELGXE6S87/1n995Oo+zDrRLeUJyBUvgw3
	bUg1xTSgkYvGK2NQlkhET3bA0Lsbro9nMBwF+iGbSC1WhVShHBL1b3okeWWNn48eWY7bGHdz6AKQh
	V0y5vN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4To4-00000005XK5-0IcF;
	Fri, 25 Oct 2024 23:33:24 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4TmR-00000005WxR-2k2o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 23:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729899104; x=1761435104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WdGE8rRJ8ooRbPNbKNU3Hoy1T8K2+Fph3zMZRkda4SE=;
  b=LSmZF4/Fdue9q9YWb0UGFRLc6PXxi+1WPJhEBVoV+AmOMSe6IQLv2tIX
   A5JznJ35ZeAtcnn5U8igvo0Sg+IAQp1/rvAQtcmD/U9R5lbp+K8Mtzfr1
   Va6oMzJC0ewHRlMNKTj7d2hRQNhDiiMEA+yS0AZmde7BEdOwsAsNcmC1J
   7ur8t6/ZuJ2NDrwm0UL9ex96NxwZINJsAnw5honhukMkVzt4UX/jwG2qx
   w190YhVUnaB6Xn+qPJeXwP0uIy8X+dRIeZwjZEWdKSdYfNYovnqYaA3D+
   lCZRaZzi4JR7JKnfs2wf+Ky5mytAxcV/iG757YEmdomLeFZWk9wDA49O4
   A==;
X-CSE-ConnectionGUID: uAbuGzFCR2GOUgJV2AkjOA==
X-CSE-MsgGUID: 9r9uwlGRRBa4so11UaIzMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33278326"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33278326"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 16:31:42 -0700
X-CSE-ConnectionGUID: OLMACmv+TaOtuhdFaVR3Rw==
X-CSE-MsgGUID: v4s9Hx64SkGsJKoNY5ASbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="111871703"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2024 16:31:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4TmI-000Z1g-0k;
	Fri, 25 Oct 2024 23:31:34 +0000
Date: Sat, 26 Oct 2024 07:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
	richardcochran@gmail.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
	arnd@arndb.de, nfraprado@collabora.com, quic_anusha@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
Message-ID: <202410260742.a9vvkaEz-lkp@intel.com>
References: <20241025035520.1841792-7-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025035520.1841792-7-quic_mmanikan@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_163143_774176_0454CB06 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Manikanta,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next arm64/for-next/core linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/clk-qcom-clk-alpha-pll-Add-NSS-HUAYRA-ALPHA-PLL-support-for-ipq9574/20241025-121244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241025035520.1841792-7-quic_mmanikan%40quicinc.com
patch subject: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260742.a9vvkaEz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/ipq9574.dtsi:766.16-17 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


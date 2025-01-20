Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA45FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24G3HmhuGF+bL/WMZN6Z2N1jUjn2AlgpuZFUICtclZk=; b=fMANFoWXAXiqUgBvWpyEanMnvH
	w2MpoPMCvD0H0V8FCGjAMAxnvq9EcUFx20DS15SY5SIVGf+nVz1fkwSxV1eveysJwrCzKzcxMuW50
	aR0jAmFgnTbNo2OfneSGKULhBImEZCFvTUIjyu0BvVABf9MdZ4zgO5dGztC1sqnbdygKz9H8sLruV
	NVFM7twNwCXm25POWJFY8SDWvfuYy45RssG7VEYNYB7tqxGyjNljwcK+0k3gNwEco3JXWWDvUdHt8
	c+VMf46RXyTVF3ssAjmKmU/k0GCMQcEHLXZ1HQR0V3N6aCTG3vqFJICpipz5erGxeE5dQBrd9c/Gg
	RfT6dCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsRR-00000005koE-2Tum;
	Mon, 20 Jan 2025 14:07:49 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsQA-00000005kh0-1xmA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 14:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737381991; x=1768917991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1uS4z3qSW4B3HL0w5ziOk7BdN1z2O3FF9kgKHr+m/4k=;
  b=nYD/BWhjs0Zv1V7/jhR0aRvdsqz1zZxpoXW2OxOw72kdJJgxIvea7RaX
   bAqekDwrgGBij6fuxav6lzuziDYhWe6ZzNZf6VzqtHE60KI3DdpinGkdE
   sDmvOkTR+kqE6TXPUoj6JSn/aqzcFuXn9O8KsQwQxMJdYLyc51CAPHMZy
   AcbzxWNSSx1EXNWhSaQ52sJne1EJGM7h0Gb56cNnRt3WdaZWytdiMdzJz
   9OQfgIsFKtGn1hZiDNq4X25+TjPBWrNx4XcvHWRjqs0Vje7kymH+8ZnKk
   AYoEIIY+5L9OtT7nrygtM9SN9CcFToup81FCA5PV3Ck6ToStBDYa2ekpE
   w==;
X-CSE-ConnectionGUID: 3qRrBX1CSHS1uNtlxfFLIQ==
X-CSE-MsgGUID: gCPPX3X0QoSovp06NgTBEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37890060"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37890060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 06:06:30 -0800
X-CSE-ConnectionGUID: BltcJRoiQXyKctIw3LJ4Dg==
X-CSE-MsgGUID: /biOkYpVQ+iV2JxF+iZWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111154052"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2025 06:06:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZsQ2-000WcZ-1a;
	Mon, 20 Jan 2025 14:06:22 +0000
Date: Mon, 20 Jan 2025 22:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 09/10] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
Message-ID: <202501202157.Aasnvf5L-lkp@intel.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-9-5d1bdb5a140c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-9-5d1bdb5a140c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_060630_589285_F22AB45C 
X-CRM114-Status: GOOD (  10.03  )
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
patch link:    https://lore.kernel.org/r/20250119-qcs615-mm-v4-clockcontroller-v4-9-5d1bdb5a140c%40quicinc.com
patch subject: [PATCH v4 09/10] clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_VIDEOCC_615-0-0 (https://download.01.org/0day-ci/archive/20250120/202501202157.Aasnvf5L-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250120/202501202157.Aasnvf5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501202157.Aasnvf5L-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_VIDEOCC_615
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_VIDEOCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


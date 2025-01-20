Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2617C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwW0v6OwhE/4U4zs5i7Z3emeDixcEJchbFgUQo3pUpc=; b=g/OiJ32Q5xpDyUOLO6z0ov5RZi
	eIIo1AALhAcsNhwRRljmdiMFRQVeD2zmT19tFe42kailHau7pu+Qw9+yH6XEb3R7dY0qcoXPm4RyO
	+meWHCiWTa5f/ks7VM7GvHEyNyQxr0XPAWFky9gmmjlEgPPEGHPSPzu0Fh+DcKkMhuNsfgJtz03Rs
	C8tiGwfWH5LD8w6NqQV8RLs1TQW+HR3LTaNAhs7qZaC3KaZUhSW6S5Rs7bu1gXhuXsli/1OHZrl9B
	qCV9k9Hly7ALnsU0kqXcwMyMBrOg2J+HMlI+B7ezErNUBBtJ5O9VqETMCu3E31ulozIZcNNrud+KE
	CvJictEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqSl-00000005Uhg-3GGT;
	Mon, 20 Jan 2025 12:01:03 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqQQ-00000005UDS-33sG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 11:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737374319; x=1768910319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ud8mjZa0Vr1kKKXuf/VAUY7cuf1qu22Xddl85PI8jtU=;
  b=Jv0KP3BBYgjAhCW66iw2DVYkaqGvVrBw8nngHRP1u4g2ej/jVUcAdEyT
   +NjEyfTcN0aB8/l81cUbbrlKK9+ws/Ze7sIT8wtGdnXzO63MKIyD7m+jJ
   lIvZxwKsqXZ3YOdRcIcoxP8OKh2IyzmI0llAcTty8o21qCtv/qGJhfrjB
   AXNNj6GNYw9pn8XFLePyDnTOIdZ5BKszXzl+TVoRyh4wUtwupTV7j8FTZ
   MjuPn6N7Ps7OD94s9dGX9WfreY8No4JNQqNP1btvuRRc8UOTK2OjGpfN3
   b/ymr3ZBMvMTbEtL3xYbQrwKL4dPQk2M3rOj4GPHM/bdGl5WaiyPdpVnI
   Q==;
X-CSE-ConnectionGUID: d6Cvzse+R4mPU2QMCnjA5Q==
X-CSE-MsgGUID: 3dCiDpi0TSORy0Gqpn+lNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48254403"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="48254403"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:58:33 -0800
X-CSE-ConnectionGUID: IoA75u+HT/Cl169pA8qaCQ==
X-CSE-MsgGUID: PE1bLa0GSDKvSWyIDztPNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111580540"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2025 03:58:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZqQD-000WVn-1E;
	Mon, 20 Jan 2025 11:58:25 +0000
Date: Mon, 20 Jan 2025 19:57:22 +0800
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
Message-ID: <202501201928.ZrWmF3Kl-lkp@intel.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-7-5d1bdb5a140c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-7-5d1bdb5a140c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_035838_810472_C339C879 
X-CRM114-Status: GOOD (  10.32  )
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
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_GPUCC_615-0-0 (https://download.01.org/0day-ci/archive/20250120/202501201928.ZrWmF3Kl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250120/202501201928.ZrWmF3Kl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201928.ZrWmF3Kl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_GPUCC_615
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_GPUCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


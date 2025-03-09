Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 03:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pxvqozo1PzHA92rmrCMj0oKJIeCNmjRVYKCHzIUN60=; b=zap4AApF2auByOzbkx6alXjNlC
	mTUMitGkuTLvpDQkFKVjGNsoJ3tsejAQv5XGbwShkKHOXzSQl1D02ToiDQuHZYo7DlujJ8l6qmwst
	tjHDxZkuOgTYXuqUKZYzi4tfOQsatgSP0AmhkFWqQ981IcGpa8V+p27qeOQtFNFSe7ZojNVR50Ok/
	xDBNjD61vlE4DINAz0HBRX1AsxwBsD2Rxsq08nCjWkvrFf9aqBLoPr+kg4U2ybo7CrX95a35tx1P/
	g9h831x++rVYa62bgRHpZWcOIH6yk7BPWb+RNXK+vL/ryZD+czX71VAYEV6eL4cWvRJAPKFhA4Jgq
	KMmVfTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr6wl-0000000HRaP-0o69;
	Sun, 09 Mar 2025 03:03:23 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr6v6-0000000HRU9-41G5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 03:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741489300; x=1773025300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IVS3L5J251tbHNugEZ3AM4WfhMC0Zjdnd3Dl1hMO1o4=;
  b=TsfScvfLHjTxx10rjlOZ+w1b210AuX01NEjRWOL2Xgw/ev/r436THEiu
   aAW5Bj50Xav/6BC21IplmThQ5qw1F/2GmJ4P+4E4Zirn6shv24xLqzMLT
   r1qsN/9r5/S8cXOpT926T3lKllmXP5V5QYG1KbrSDfaHCrWoLjKXPHD9k
   3YqQDNXe2dl/PM81Jfgh43TM8U0EmrbJwwZDKohLNEi6BMGUjkCHdO6VX
   aafw8XN4TAje6sKm9k9EYduy39avQI8ULNAjWvBWaOogZaha+/NlGv194
   9n7X/cG1Qejj2QOC4vxEKcqBS9TA34CWE/SvO0LT8lwzrz8A5nOw3qpKz
   w==;
X-CSE-ConnectionGUID: pLG05oVBSqG2n1g8zLHkCA==
X-CSE-MsgGUID: KKgThGDKTMucT/ykjlPWjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46422279"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="46422279"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 19:01:34 -0800
X-CSE-ConnectionGUID: 7SGGoZ+fS2+Az4L8zuyXfw==
X-CSE-MsgGUID: fcPirFXBQJGdbTUBxsPpng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="119408689"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2025 19:01:28 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr6ur-0002b0-1Z;
	Sun, 09 Mar 2025 03:01:25 +0000
Date: Sun, 9 Mar 2025 11:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
Message-ID: <202503091011.Kwbj8DQz-lkp@intel.com>
References: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_190141_016159_9B67D08A 
X-CRM114-Status: GOOD (  11.91  )
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

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0a2f889128969dab41861b6e40111aa03dc57014]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/dt-bindings-display-msm-dp-controller-describe-SAR2130P/20250308-094544
base:   0a2f889128969dab41861b6e40111aa03dc57014
patch link:    https://lore.kernel.org/r/20250308-sar2130p-display-v1-6-1d4c30f43822%40linaro.org
patch subject: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
config: arm64-randconfig-001-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091011.Kwbj8DQz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091011.Kwbj8DQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091011.Kwbj8DQz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_mdss.c:599:3: error: field designator 'ubwc_static' does not refer to any field in type 'const struct msm_mdss_data'
           .ubwc_static = 1,
            ^
   1 error generated.


vim +599 drivers/gpu/drm/msm/msm_mdss.c

   594	
   595	static const struct msm_mdss_data sar2130p_data = {
   596		.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
   597		.ubwc_dec_version = UBWC_4_3,
   598		.ubwc_swizzle = 6,
 > 599		.ubwc_static = 1,
   600		.highest_bank_bit = 0,
   601		.macrotile_mode = 1,
   602		.reg_bus_bw = 74000,
   603	};
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


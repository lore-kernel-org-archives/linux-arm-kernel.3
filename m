Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DD9D5AE41
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kl4Py/AlZ27lPpZcAttqdENHJeAIK0qBe+Cj4N/n364=; b=BkHWtwNpnPbwYLvWU+5H0jdwgX
	LRDhSJPa41MSymH7iRfLwLez8yhCsjz7VFYMir5gwXQNxfFlgHCiVKTz90GIkX1cCG8mRIkaSYieO
	JJKkKxZ/zBC6Ghvtr1+LuYgWMz52HqZRUnPnVLJvPreVTRDYAyMJcwTKbPioIrvh5ioJwYDHwhe/M
	nEJk42LiLVU+bX8f6mS9dfTWf486eVdu2eQNrLHsAWaMj6WGl2CvcBhaEecUkuxKhi98EfnBB+Dgj
	vu8meSWKdrBhORsBTaM3mE779n3POSHMtLyHXuoYoBIqgT0XTbLvW8wGz0wxZh/14IvhZ7KL8dtm0
	sR2XYXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUOtc-00000001eMt-2WNu;
	Sat, 13 Dec 2025 12:38:48 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUOta-00000001eMS-0DTI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 12:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765629526; x=1797165526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G27+91EwFmRmbX5tFcElcFokL9SyhLTKle8C2wMwatA=;
  b=FHcu8XhL7bVqtqjdbDNhPxwBzU/aVC3wRgsBN6B6F6cCYUvzmJVbA8mC
   kyZhTumJrvqW1D6qbrdsVxSP3V7Wfj7rCObYAdT0gHx1ZqveJzpb1PcMw
   LuULOwyGAQt9JdMp6XmgnJdI4XsN4oF0f2R6J9Yq1RO2i5Fyz9WCONG/o
   SqO3ikGK8fyJs8fubPINeAStKYU/fPF6I5dfxjsB8UlOhoJIT/LGLo8Qv
   e1az9VCPAYNuqSFzY62OY5qCtWnj26iED8NzEb++BmfxzK8l7N03A6mFy
   4ZDpGf9GsHKCSAWUwsmsO21aWBLMO69uFXidF38zW7iaGW+K06LHeOuwP
   w==;
X-CSE-ConnectionGUID: zhDLTDh1Tz6fA35lYwNoFg==
X-CSE-MsgGUID: I1EefxpeRT6szRmtM4IXQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85018035"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85018035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:38:44 -0800
X-CSE-ConnectionGUID: lCT32xwXSb+SwuspvsqIbw==
X-CSE-MsgGUID: 1zp9xd16S5KiNKF0NrC5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196591578"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 04:38:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOtQ-000000007cL-3DKn;
	Sat, 13 Dec 2025 12:38:36 +0000
Date: Sat, 13 Dec 2025 20:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/8] coresight: core: add a new API to retrieve the
 helper device
Message-ID: <202512132024.rsZaNtbp-lkp@intel.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_043846_183638_93893412 
X-CRM114-Status: GOOD (  10.75  )
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

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 47b7b5e32bb7264b51b89186043e1ada4090b558]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251211-142430
base:   47b7b5e32bb7264b51b89186043e1ada4090b558
patch link:    https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191%40oss.qualcomm.com
patch subject: [PATCH v8 2/8] coresight: core: add a new API to retrieve the helper device
config: arm64-randconfig-001-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132024.rsZaNtbp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132024.rsZaNtbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132024.rsZaNtbp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hwtracing/coresight/coresight-core.c:600 function parameter 'subtype' not described in 'coresight_get_helper'
>> Warning: drivers/hwtracing/coresight/coresight-core.c:600 function parameter 'subtype' not described in 'coresight_get_helper'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB73C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 05:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5ek1WWqd5gt+zV5eG3lAuzA7lrGqK8zkVzDtUkmuOQ=; b=XoudFztbnzCl0knNLmGOUiuWN3
	0jgpl5wgl9M7+VeBMrDDa2LLCfzSiHBGfKcydBmf9SF3znRLSnaKHOEzhJWNNh/BHOFvH/kxXP8hG
	p90k5WFNpKo5Cig7abl2FdxHeEDD2fguhg18QIGvfYqrbqEWzurUElV373v6t72GgZLTbNF+6U2ys
	bIObUL+SyMGCun7LZ3ruVG9/yKzeOMFqa2z5klyO3ePLOFT1cD6Yz8JtDnyaCPjh3dGxin0Vbqvk0
	5QpQ6wXwQPXCqQ9IWl1dm1DPkfVhpt1zkIbvoQ8oU9tbYU36RPZF5ag3guYh7/Hv6DTdUXOLQEls6
	KoYtcs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Xyu-00000001RjP-08ov;
	Sat, 26 Apr 2025 05:21:40 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Xx1-00000001Rbs-2bT6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 05:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745644784; x=1777180784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Tk4kop98w2lSr6Z5mOouvA3XaaXVtHJfJpOm6sjYs4=;
  b=ZYrG4hZu8L6M9EipJwSdUbbFmjLewqfCgfS+gv9yIDvMvEElST7oLxpn
   RgZ1ih5m1lbh576RIHO7BysM0jJ4LWimMBO0iNQWCunSEM0bShTWHt1ER
   GSJQ7/Y7H7QH7YxeRuCD87cXY43onNlWOe9W2lkWKRhH7+ROqjn33bODs
   BnwSyapzYMRDUAd8vuUX2eehwFTvoHLmK0hDjsfMe42+sP6sVx4OiXvz5
   pY32vixqH8UxOWEP6F1S84iJ1GgICM6AqDY5o4Bnb8fepXWgACVy2tGAI
   1v+3p6rQ28kQkW9RdPdmtVAlcPYrohxEQcJfL5q4RgqMMLG3VSO3pfKPS
   A==;
X-CSE-ConnectionGUID: pqKVjRcJRoSPviJFUieWYg==
X-CSE-MsgGUID: kteBDfCCT/O9vN70S9SE5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="64725232"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="64725232"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 22:19:37 -0700
X-CSE-ConnectionGUID: 0Frs03buSWG25IAdY7GLsA==
X-CSE-MsgGUID: /FaLD0w3R86Tlt1ZOcgp1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="137884504"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2025 22:19:33 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Xwp-0005i5-0u;
	Sat, 26 Apr 2025 05:19:31 +0000
Date: Sat, 26 Apr 2025 13:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] coresight: Add coresight QMI driver
Message-ID: <202504261305.WCDIwfd5-lkp@intel.com>
References: <20250424115854.2328190-3-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424115854.2328190-3-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_221943_696541_C8CE42BC 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Mao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-CoreSight-QMI-component-description/20250424-200202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250424115854.2328190-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v5 2/5] coresight: Add coresight QMI driver
config: arm64-kismet-CONFIG_QCOM_QMI_HELPERS-CONFIG_CORESIGHT_QMI-0-0 (https://download.01.org/0day-ci/archive/20250426/202504261305.WCDIwfd5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250426/202504261305.WCDIwfd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261305.WCDIwfd5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS when selected by CORESIGHT_QMI
   WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
     Depends on [n]: NET [=n]
     Selected by [y]:
     - CORESIGHT_QMI [=y] && CORESIGHT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


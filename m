Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D567EEF304
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4YL72Ts8cHY1RRu2FR/pypZgXbZ1z9X/NIthHRxO3o=; b=V7Ho24zrpHPzh90INH+n7rPMo7
	J5F+8A2ApY6bTR7TRop3lWeIUMDr3OuvVaCgQ9HXeVJb5862sFSKaoyoyWEw36rtPTrc/U47wfUUb
	VdV09/cvbo2PCWt+iflvDAHsPV1M1uh33ALZ78a8DaIGZMQznGtVAQV0bphCASc7w+4ojwMhFAiVk
	+lw6E9lS+FqBs7l2qEzcVhvHxEMpbe4Lax+V7Er7L3v6KxA3/TgTCHlerbcAviKy0pgG8AU/liN3P
	oEEnu8Dc+muSsBHSfM0AFGcRVddEFRpoWY1kSyR4ZSv/h80oukoUOWP9PYRSlT5DRM8EvTobv86Am
	lvjJH16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy90s-00000001tlD-3aRV;
	Thu, 05 Mar 2026 13:45:14 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy90o-00000001tk8-0wae;
	Thu, 05 Mar 2026 13:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772718310; x=1804254310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Gh2NcoJDAdmYkWLxN8oOm0bK5ef8GB8TLuWTWL3eXE=;
  b=AVyDzngxkJ0JamGxeCt8e1vhQmiSLMbXR53C2+U754UZhp7Hh1lRuDss
   0ZteD0kHWCCn8scy1rEm2otfuBCR0DpJYTsz72lCo112qbb/UYeGD5Vg1
   Rcdx51OnSHqDcfIp8t/OMigI3QgPBsSLKDgyZ4WJ3+1AdbYPSUN+sneok
   XswsOYGp6cuqLrwpw9sMW49CbHhZZG4ehLeZcoqw69obvyZWGhOo5S0BC
   zt4n9qZpGCJuObLChILKMSAz0789YCuBbqX/rcIg5uUeYSmfjqZF7bUXM
   edyxhlJe47Upl7+bT5DFockjTUJS6eJZGFyZBKBnFRuOz+NIzRqPB6tVM
   Q==;
X-CSE-ConnectionGUID: W+0DNft6T8ypKud6iLbLHg==
X-CSE-MsgGUID: AEkfpUM4SdyG7y8Sx72Xhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99271040"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="99271040"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:45:06 -0800
X-CSE-ConnectionGUID: WlNWW7IaR2iERV9Yw03yIA==
X-CSE-MsgGUID: Jb3UhAIkTTKgczClbrXASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="216956271"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 05:45:01 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy90c-000000000g2-24iQ;
	Thu, 05 Mar 2026 13:44:58 +0000
Date: Thu, 5 Mar 2026 21:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>, daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com, jstultz@google.com,
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: Re: [PATCH v4 4/4] clocksource/drivers/imx-tpm: Support building
 imx-tpm driver as module
Message-ID: <202603052149.00j5uebB-lkp@intel.com>
References: <20260304081207.4030882-5-zhipeng.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304081207.4030882-5-zhipeng.wang_1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_054510_604045_C69E1220 
X-CRM114-Status: GOOD (  10.77  )
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

Hi Zhipeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on soc/for-next linus/master v7.0-rc2 next-20260304]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhipeng-Wang/clocksource-drivers-mmio-Export-clocksource_mmio_init/20260304-162226
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20260304081207.4030882-5-zhipeng.wang_1%40nxp.com
patch subject: [PATCH v4 4/4] clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
config: arm-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052149.00j5uebB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052149.00j5uebB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052149.00j5uebB-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tpm_timer_init+0x111 (section: .text) -> register_current_timer_delay (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


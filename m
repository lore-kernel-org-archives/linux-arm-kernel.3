Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3932EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NY6M0pHpOs66HH+o0BygipveSkDOaOzYRmFGJJFR2CM=; b=aJEZpJGFqq4P1JacG8uJjOxsaA
	M8K9yBky8jRw6jY8gYwEozw2u2iLs8/m1pneoD54pnTkDc3w9/V7MLm7TZ6RgIvqXeXiwssgDWGE6
	T5b2xKzCWZmvKzhUmrepazvdOfIK2eQA46AjkdJqPALX5Gfkr6impN8Rr8CiOcA0BWk4yvMLhCGs+
	p2vjVUoz5ZjNHztbqwUxGFKQg6UZN0+eoBBD4IiZYyzY4AGw9hQA8pmTQI0mhz+b7W3V7q9j5QS/e
	ZPzpe5x7fyuvKYGpVUuKk1UJP6IZxjeT7w0SmPRMfm6Dr3LSo6SjuFPY5yLSkuUV8wTX5sxd47odL
	aGQUoHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9g1n-00000008rtf-3u9i;
	Tue, 29 Apr 2025 08:09:20 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fyc-00000008rFn-3L3q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745913963; x=1777449963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XJbOu8oe6MHnFoBGQc7cHTHtXhGx4hB36GKy8vSOICk=;
  b=ALrIyn2XgBnISQqTbCKffwnG+qvRrvwjVTo+onQViivTVSoH7hmf4HpT
   laXvH8WvMspTtnCgGEUXe0OVYgogukp69ZOr6H/AsPex0ZKZNsHiSJIs6
   ydq8gmCs6KLIlhRpRPqZqFekhJTad4074zCnLk+tFg0qL49K33SD5czVp
   PoO10fXsHm1l1XkcxvaMvMyaK8HC5+TKV3tkzkG6M1mPVI6PurqLtT0gJ
   jXlfnb28i8P+5dM+MwpIpM9BnNhz/3TuTB5SB5GxsobCnU/Snvh9vdGRk
   GBHt+A/3xygPLlMXrYMUhmHOJxDAgxNN+1cXQ5fiv6pv8OmztTKg18bry
   Q==;
X-CSE-ConnectionGUID: qd+ZSEOjTCyRSN739DosuA==
X-CSE-MsgGUID: aQ7QHT2HReuzHmOT61DyQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47537530"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47537530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:05:48 -0700
X-CSE-ConnectionGUID: 98GuK9QCRYSrVo/7tNEo5g==
X-CSE-MsgGUID: WIUxjBp3S2eSXWSWqrFQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="164699249"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2025 01:05:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9fyI-0000ZP-08;
	Tue, 29 Apr 2025 08:05:42 +0000
Date: Tue, 29 Apr 2025 16:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, a-chavda@ti.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/8] dmaengine: ti: New driver for K3 BCDMA_V2
Message-ID: <202504291527.tCMC8UGh-lkp@intel.com>
References: <20250428072032.946008-7-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428072032.946008-7-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_010602_870077_82C5E96E 
X-CRM114-Status: GOOD (  10.30  )
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

Hi Sai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.15-rc4]
[cannot apply to next-20250428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Sree-Kartheek-Adivi/dt-bindings-dma-ti-Add-document-for-K3-BCDMA-V2/20250428-152616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250428072032.946008-7-s-adivi%40ti.com
patch subject: [PATCH 6/8] dmaengine: ti: New driver for K3 BCDMA_V2
config: arm64-kismet-CONFIG_TI_K3_RINGACC-CONFIG_TI_K3_UDMA_V2-0-0 (https://download.01.org/0day-ci/archive/20250429/202504291527.tCMC8UGh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250429/202504291527.tCMC8UGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291527.tCMC8UGh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TI_K3_RINGACC when selected by TI_K3_UDMA_V2
   WARNING: unmet direct dependencies detected for TI_K3_RINGACC
     Depends on [n]: SOC_TI [=y] && (ARCH_K3 [=y] || COMPILE_TEST [=y]) && TI_SCI_INTA_IRQCHIP [=n]
     Selected by [y]:
     - TI_K3_UDMA_V2 [=y] && DMADEVICES [=y] && ARCH_K3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


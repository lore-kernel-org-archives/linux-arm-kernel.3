Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEC8CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 06:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BceyP132cCaj7UKIuavDpoanqHmQZGtxldRMNL/w/Q=; b=j82bfDrI4M3859Xgtj2lOmNjJ8
	gvFbO5iMiNPagRfxUmgYKkDkhPnr9/a2ge0cWXy46rYTuEUFSB3EX0UFDGltVpJ/JaOcDcD9nib3a
	yNrgA1DHM1W+3GU7m2BghliF+7Rb4gKjzJ8jCRoAR/cXg/WGoE7HuXvLbVF2vWnckGkHoBIZCvR9Q
	fDum9IwXsc1E1jYCVPY2biJo3RVTBf2m595fHg1L2XxUWoxB7EI0Efou5NGE4vLou2K30JiCKNBqV
	iXPpx3FU0XEUs8ZVBSZWkx418jFnBvBmXjIhBt4ZBsuugrltT3fXiykHhHjRTdURN2N2wp90nNmTs
	2YIzA6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ZSB-0000000BkPa-3o4m;
	Fri, 03 Oct 2025 06:39:43 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ZS9-0000000BkOj-13aw;
	Fri, 03 Oct 2025 06:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759473581; x=1791009581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1udu7BCVdf/1HJxKb7sLZXkalgIJcCkVINf8u8yM/dI=;
  b=kIB5dfxPeELhgX9MLA7QkiwTvVEJZ+ouHZ8otC4KFydWLwoSXzAGyn09
   ombNTCEBDDspvacb6zebxEMgELoSqhj89NKLoXQqWe86R8OIbsIkYTxJk
   H24lCftRfXscVmJ6hWTILHNclNG3vdIrdIx+qJ4upeKXH9hhu7qBx3WRt
   PKLpMwYpIhJJL7j3W/2jRM5SPcIoOpu7alGr4tBT/tIkGz8ujpJhYvEmX
   v8qqBSttMjZW5T85exD9xfebkdZ5mOYnGqmRFn0AMoUm2ZPbXE7jcK6G3
   Km7BlNwDq46zElNH4D5vZ7B0qI3dlaUDSaHt4u0EK7GARC/VnjoMQk0ZR
   Q==;
X-CSE-ConnectionGUID: kV8vMPLDQWmNezRlHvhE5A==
X-CSE-MsgGUID: 1hlCBRUlT8aKPnuLMTZYXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72860286"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="72860286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 23:39:39 -0700
X-CSE-ConnectionGUID: gZ4GhqDhS+aj3/CLaF9nhQ==
X-CSE-MsgGUID: FI2EvZm+S42jGXxwG/Rx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="179167487"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2025 23:39:36 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4ZS1-0004NP-13;
	Fri, 03 Oct 2025 06:39:33 +0000
Date: Fri, 3 Oct 2025 14:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v7 4/9] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <202510031435.HCIv3oqu-lkp@intel.com>
References: <20251002090028.1796462-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002090028.1796462-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_233941_333833_3A89C5C8 
X-CRM114-Status: GOOD (  10.47  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on lee-mfd/for-mfd-next jic23-iio/togreg lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.17 next-20251002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20251002-170532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20251002090028.1796462-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v7 4/9] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
config: x86_64-randconfig-001-20251003 (https://download.01.org/0day-ci/archive/20251003/202510031435.HCIv3oqu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510031435.HCIv3oqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510031435.HCIv3oqu-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__devm_regmap_init_spmi_ext" [drivers/regulator/mt6363-regulator.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


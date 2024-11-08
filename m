Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE022D64097
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 22:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQGCwSrHlOxTy693X1OhkXJXtWo5tbVECb80WZ+Q+pg=; b=vT+Tq5/+tnoSdmRoIyPEX/CBjP
	2P3kBPKwbPKSX67drr1IBm+hpHru5MPSp/hApCtt+H4UYwrsA+NhOlY3YvGNJW3alLTlOK1Ialmva
	xHjhs1WMZGkMWlM0Sb7mQagxOYNV/9dFSlTl6FbpNdhincb0s+wD+T+oDQGNgxRmv8V0zlP0lqd2c
	PO/hCmqZCkU+hB60MalwbtuUi1WrxSFW5lF019blNNq6ZyhpVIll9Qs12L04DjeNwl4dKWiE5zZ/Y
	dFCLEemrNZRfiS3KI1cC1DrKO+eyx70NBPUlHcmqKlyppk1SA1e0UbMWfZeP1eS2F9z1IfkNQ1O+G
	cZfObF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Xc7-0000000C9QE-2M1h;
	Fri, 08 Nov 2024 22:37:59 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9XXi-0000000C8wX-0EOh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 22:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731105206; x=1762641206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+LF7CsJ7/io270zqeQKsXvXgBShIfl+NXbOKX6jVzM4=;
  b=DgqwLv0T9pPicR6S1TQsJkz/8RW9iWhzNzdz3abrEN7af1r7MYjUFKlA
   LXKwKK0Ox/kbg0EqnMufscSbAPNkaotm9UHqL5Ig62ZawXg82SVHwRWof
   bXxBip7/udTm11VpO9UQDoYo0eWdOXSLX5VTChA/RSfs/01dsGX4HNOKc
   hQ/qIBZEHGNHV8Gk5Ajh4cTZpT1t/V4dezcCsFxWvseu86QNRd1EawnJh
   2W6Q7XhuWKv7G4AUOp8aNvQJclqEufxAzp7GFy5nrXgortBJ4d0p4Z2+D
   Qb4U34jazjI431m4xuny3XjbpQQYQpk3uhMTwFKIFYkeftQ+9y7UDxGXu
   g==;
X-CSE-ConnectionGUID: O1i8g78nRY2FjWFy7FItqg==
X-CSE-MsgGUID: V6Fg5XKuRXSTWzPl37QCyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30417937"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="30417937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 14:33:25 -0800
X-CSE-ConnectionGUID: sJHMUEGrSS6OVqSv/oK2bw==
X-CSE-MsgGUID: MBjI+FrtT1iEbSuKCrdJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="90867165"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2024 14:33:21 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9XXb-000rqk-0O;
	Fri, 08 Nov 2024 22:33:19 +0000
Date: Sat, 9 Nov 2024 06:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <202411090610.oPYJJG00-lkp@intel.com>
References: <20241108054006.2550856-3-fj5100bi@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108054006.2550856-3-fj5100bi@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_143326_131114_168BF69E 
X-CRM114-Status: GOOD (  14.09  )
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

Hi Yoshihiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/smp/core]
[also build test WARNING on linus/master v6.12-rc6]
[cannot apply to arm64/for-next/core arm-perf/for-next/perf next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Furudera/perf-Fujitsu-Add-the-Uncore-MAC-PMU-driver/20241108-134245
base:   tip/smp/core
patch link:    https://lore.kernel.org/r/20241108054006.2550856-3-fj5100bi%40fujitsu.com
patch subject: [PATCH 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241109/202411090610.oPYJJG00-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090610.oPYJJG00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090610.oPYJJG00-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/fujitsu_pci_pmu.c:584:36: warning: 'fujitsu_pci_pmu_acpi_match' defined but not used [-Wunused-const-variable=]
     584 | static const struct acpi_device_id fujitsu_pci_pmu_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fujitsu_pci_pmu_acpi_match +584 drivers/perf/fujitsu_pci_pmu.c

   583	
 > 584	static const struct acpi_device_id fujitsu_pci_pmu_acpi_match[] = {
   585		{ "FUJI200D", },
   586		{ }
   587	};
   588	MODULE_DEVICE_TABLE(acpi, fujitsu_pci_pmu_acpi_match);
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


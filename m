Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B77AE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFH9LVJEiVfrB9Hke09gbIpS8d9SeIK6VWYRConmvlk=; b=VisKAbAwd3fd9tvtT5bH2hISx6
	myuxixiJQlzpuVu1RU0aNe4E75z9qJnf6d4mU8PEBzIY/F84GKOthlc0wERmFlfonJe3QwkbwBhG9
	xxWsrzwQaW+NfyvERXMA+6BeKj037nsY/yB5i+U9UoFjeN5rpeASU8JZqDy6LRP75lPw05cW7I1uo
	ETNMbAYO51/2huBNYZ6e49LzbIvk1BCR3mkoIiNFzTPdnYQHT/YQrlawH2kBHhmlxhJdXDb+b87fm
	mi6+UyTChVB9nULU1wLeEO1BSOyZwxXxfY67+R5CHeJFw3ILj9POD3BMdWI99qTAU0xY1SUT651kN
	jaKvC7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKV2E-00000006NFm-3jgg;
	Mon, 09 Dec 2024 04:06:14 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKV1C-00000006N8t-2rwU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 04:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717111; x=1765253111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3ZvC3O2eZ9A0yzuZHGVlm2/05VOaS+KPtoBU2Cfenc=;
  b=RbpIFSjaIJ9YisjMAVzHIN+une8pmARY/trZ8srxqekSUDYwczKbaaVO
   zYaG7FQkS/oyRr0TLJjzuVmYfMFSxirmt6rnEhh9euRzZzlXsMajV2WFQ
   3B0bM2qiBYMAtQrpp70BVw2/UrX5qQjaSW0rvyiZbHsZ8+5Vk+WfhxrHh
   FkB84MOpQB4UKgbJ+xG9ocxmpCTM1IjMQUifaycSdJrp3qSe3NcQvew3f
   oK3kHWhESe+57clzmfccaubBTpx3qAS6n3h7ImuI3xlmv7ZT/Qex4Lseb
   1VoiH8BrTaaXE23HI/QWkL49eUGCttaCwhqgRaxwK2PzcOsWRNLcqq90/
   w==;
X-CSE-ConnectionGUID: r2shIoc1Sxayn1LQl4zRMA==
X-CSE-MsgGUID: Cu1DDbqNR/SkL00QGEAF5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33923811"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33923811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:05:08 -0800
X-CSE-ConnectionGUID: w3nAQ+5PSquIWdMR3H5efw==
X-CSE-MsgGUID: u3V0gI3gTH+lD4g+PwNdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125793224"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 20:05:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV14-0003mk-0d;
	Mon, 09 Dec 2024 04:05:02 +0000
Date: Mon, 9 Dec 2024 12:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 (x1slte)
Message-ID: <202412071131.v9GOab0D-lkp@intel.com>
References: <20241206184609.2437-5-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206184609.2437-5-umer.uddin@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_200510_866562_B16C2B42 
X-CRM114-Status: GOOD (  12.40  )
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

Hi Umer,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on next-20241206]
[cannot apply to krzk-dt/for-next pinctrl-samsung/for-next krzk-mem-ctrl/for-next linus/master v6.13-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umer-Uddin/dt-bindings-arm-samsung-samsung-boards-Add-bindings-for-SM-G981B-and-SM-G980F-board/20241207-024917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241206184609.2437-5-umer.uddin%40mentallysanemainliners.org
patch subject: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
config: arm64-randconfig-002-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071131.v9GOab0D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071131.v9GOab0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071131.v9GOab0D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dts:9:10: fatal error: exynos990-hubble-common.dtsi: No such file or directory
       9 | #include "exynos990-hubble-common.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

   > 9	#include "exynos990-hubble-common.dtsi"
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


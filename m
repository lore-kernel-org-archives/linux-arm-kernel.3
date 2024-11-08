Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776F9D64087
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KYZQ83UWEOjuVWkChA3xhdJvj0EhVxVY7JKWlTgnnA=; b=A4pGsg3zQc0cwbWs8cTrSGo/gT
	J2K0eJF2Um+JwUEqINbWNf4ZcEnMjLK11uKQSqFltkqfBSGu5UoYVrIY8bBg2RtmltWsVqdYeP6R8
	JpIFj+yvmXkFyAG/uKLTI7+eg4+hGaS8kbFEaaCbPP2Sq0yoQFrnOn4GD1aG6JktoqhEqGuq9Bzb1
	4YW2lh/6BHbY1anuhXMw+uR+dW9G0odgzlzDFvx8s/dI/R8IT8tlIoUaDteLBl3DIyG8XxRUsiqWl
	6irfyUnduYge3eQbVAgnwVo0/HtkUS/zisug0aTTcePcsHdfebIeYN+AvkdXtfmWPkb511RhmOorA
	Ah6jjBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VUh-0000000BsH7-3A8H;
	Fri, 08 Nov 2024 20:22:11 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VSw-0000000Bs4E-0ihB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 20:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731097222; x=1762633222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cex5OFKLdepISNlr/zMsoMKZr4c1wz925xujO/RtmjM=;
  b=YIfSu7OZlO0S5pIz0+o6DcB5cBXet2ETi1kIEf6ZEaMeHuhHrPG4fZ3u
   EWicq8pafqNLZZSJCqKuCKKcRVIHQXOwa7mmlkf+yWWkCJWF2q/gij2Hd
   qP8bzGJ/qEBX+piki0impNfyyp6SHpd3xawE/TgYfOG9q//mnOQ1sUYGn
   wF3+Jn+qSjyhfVRRqDeZauPPEU71cXKmMjfYQYIy5WjN4RFBIkK3TLNeM
   uyxd94ayyJO+dQ7UcyTgeVZYw99tIMOY7j7DZaOgma6405KZw38ZHOeAX
   6Nz7sLq0pa8lzSuXWM/G/wvIzfPVvzBph2iEbfoysXSTlzQRDPO8A67Ac
   A==;
X-CSE-ConnectionGUID: b5fRPUfGRRmQESqUH6mqLQ==
X-CSE-MsgGUID: 9mMFKA2dRO+B6FNY8DWoWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34780329"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="34780329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 12:20:21 -0800
X-CSE-ConnectionGUID: z9jpa/nIQaS3xVbzK89FJg==
X-CSE-MsgGUID: RntjX9eYQR62U2yHDkNiXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="90835236"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2024 12:20:17 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9VSo-000rlS-2Y;
	Fri, 08 Nov 2024 20:20:14 +0000
Date: Sat, 9 Nov 2024 04:19:54 +0800
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
Subject: Re: [PATCH 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <202411090451.quuiocP9-lkp@intel.com>
References: <20241108054006.2550856-2-fj5100bi@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108054006.2550856-2-fj5100bi@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_122022_283792_3338809A 
X-CRM114-Status: GOOD (  14.30  )
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
patch link:    https://lore.kernel.org/r/20241108054006.2550856-2-fj5100bi%40fujitsu.com
patch subject: [PATCH 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241109/202411090451.quuiocP9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090451.quuiocP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090451.quuiocP9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/fujitsu_mac_pmu.c:604:36: warning: 'fujitsu_mac_pmu_acpi_match' defined but not used [-Wunused-const-variable=]
     604 | static const struct acpi_device_id fujitsu_mac_pmu_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fujitsu_mac_pmu_acpi_match +604 drivers/perf/fujitsu_mac_pmu.c

   603	
 > 604	static const struct acpi_device_id fujitsu_mac_pmu_acpi_match[] = {
   605		{ "FUJI200C", },
   606		{ }
   607	};
   608	MODULE_DEVICE_TABLE(acpi, fujitsu_mac_pmu_acpi_match);
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


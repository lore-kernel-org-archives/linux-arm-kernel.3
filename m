Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CE7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyOwpjpZKgQn6RpIltzJD1aESioMX/51u66JwLNI3t4=; b=ZZtx+rWeQu19AaAyN4TDZpqOCj
	woo7uwqN5qLt74nOz+tW0bY/vki4uDfxd93NYblj9juCDkoylxAPT3Ik0Wb2nRam8SzHjPJ4gAukh
	h1b57CpGzF5sD3NrOFnRqA8yH0VH2+Mc7sF9Ix+GgCXzEOmyd8LtIL+VWBZ84BGh37UwiqadQL4nb
	EHTXLS3Me2G/5nJTuzleefYonoCgijvuKNKjvEzByWlUjbGtG/uqFj+9c9BXnYhRpUj1RJpO6Pmmd
	4b/YV3n3O3VJlx6IbEl2X8B+VnUmwymNOyb15MCN9TZsEBLd3xZv5fJzfK2qkWx53giuKIv1iCKbF
	b2E2FNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKe6-0000000Gkqo-1z1U;
	Fri, 10 Jan 2025 19:26:14 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKcs-0000000Gkgv-1tN8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736537098; x=1768073098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=504AMZ+Vo4ZnssU/VHuo6RZPX5vtoGJsLAXuYnSARtk=;
  b=NUUkqarddR45vq20DcekRLfd4dpQwpn9RsHCYqsvRkQg/KiU3sBvjK4z
   XzhVn40PZSlTeoaTjufVz9RFK+HM/E+ZIentQ8LDAioxTTzgPMBIawYZZ
   a+mD9X32WucVZRGDfzhz9R6uHk0kA5AlaJ7Lf95zF4JMNC9l/0PZv1oqS
   cLlRKTo1V9vdBmazCIVPpnaHLbTGzommdHM9j1El8iZed5N/XqC9eIPFc
   Hnu7spfS5RxDYrFgo1iFlRcZmN0sJozzAyFNDaMEVCdo1S61QVapj/crI
   HFoZKQoEA97KpnNSNJwR0aOdHVrDvU+/oMPQ0xuw/OrXdeQxj1Vq5++7X
   g==;
X-CSE-ConnectionGUID: KefZollLSUmlQTy+A1mE1Q==
X-CSE-MsgGUID: x3068RliRm6vCELtC4ervQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47501770"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47501770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 11:24:57 -0800
X-CSE-ConnectionGUID: s1enOwdRQpCIui1IfmmQ5w==
X-CSE-MsgGUID: U7642DnUT1OswzWesCWv2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="108730413"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jan 2025 11:24:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWKck-000JfX-1Z;
	Fri, 10 Jan 2025 19:24:50 +0000
Date: Sat, 11 Jan 2025 03:24:34 +0800
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
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <202501110253.sgjIluLA-lkp@intel.com>
References: <20250109054544.2342442-3-fj5100bi@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109054544.2342442-3-fj5100bi@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_112458_529713_3BA52A6F 
X-CRM114-Status: GOOD (  13.84  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on arm-perf/for-next/perf]
[also build test ERROR on linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Furudera/perf-Fujitsu-Add-the-Uncore-MAC-PMU-driver/20250109-135249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20250109054544.2342442-3-fj5100bi%40fujitsu.com
patch subject: [PATCH v3 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110253.sgjIluLA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110253.sgjIluLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110253.sgjIluLA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/fujitsu_pci_pmu.c: In function 'fujitsu_pci_counter_start':
>> drivers/perf/fujitsu_pci_pmu.c:41:31: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      41 | #define EVSEL(__val)          FIELD_GET(PCI_EVTYPE_MASK, __val)
         |                               ^~~~~~~~~
   drivers/perf/fujitsu_pci_pmu.c:100:24: note: in expansion of macro 'EVSEL'
     100 |         writeq_relaxed(EVSEL(event->attr.config), pcipmu->regs + PCI_PM_EVTYPE(idx));
         |                        ^~~~~


vim +/FIELD_GET +41 drivers/perf/fujitsu_pci_pmu.c

    39	
    40	/* PCI_PM_EVTYPEx */
  > 41	#define EVSEL(__val)          FIELD_GET(PCI_EVTYPE_MASK, __val)
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


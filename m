Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C08310F2868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGiwCmeuEFnbOmiqg2btNDLuPHHl9LNwoJ7buaNbbrU=; b=24Kh/bXRhAWDHnEoqqaHVI1HxA
	KD8zwk+8+iNEEJLL5gzpKpXwWSTW6mKoOpoeJ1ipuS4Tt/fwOhhbbtAW7bzhBtVLplkQ8Wei+HfEN
	xM4IteRczADhlbTMLyNArXCWEDQetcWntZ0tUNE1Ibxs7FvVGTk5K+5diRF6WElqumvc+stOQTujl
	WW4iAERpIZiQF0fpmk40k5lTKQ5n564vFoh/fjxhk+1TqcRDDtOuNnhckVA81PkVcbCLuuvlSEh6K
	Hr3CnsboYRXNRtlv5s/9QsLM4yeQws4i/Aguv/F++lYyeELzzeP4TxpmQSibfPhF1ezXSED6XJxHp
	0i2UPY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6COm-000000083WL-427o;
	Fri, 27 Mar 2026 18:59:12 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6COj-000000083VW-3CwO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 18:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774637950; x=1806173950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q0dd9IOAI89ZSQkit8UCURS9a6et8dgdtMNLM9mGy0A=;
  b=RtFQEgmPDv2VmJrNH2fgMyXrAd1TFVwqqKzDtA588zJH7kg2SJnYs8DW
   qOZxZHP8UtRlLd/T8lOTMCmbHlsoDetkDE77Yd8vddUtiGTS1VohMHaaA
   1/MJdVI9eURHSJU/DLswT9DRAjohENmOw6djLcfIX5ngjyZ14/qP9poPf
   Z4/usRlya0hN6IwYTfRdoRKpkbsNaE62f86N7k7k6+O/Ih+AOjrFE7OnG
   E8is9HdOQgVSexqg43exmdBEFhib/NZY7TzomX4vcb93EdeAqSIoPC5bV
   P7rElb/pL+7q2zfeOvNImAhkflq8BssfAh45KaSdt9CBUPcoVd58KLKIa
   w==;
X-CSE-ConnectionGUID: b1MFgYLQRf2AsaZs7tu2fw==
X-CSE-MsgGUID: +QVAnq60QfO1oa8kz7x4Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75916594"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75916594"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:59:08 -0700
X-CSE-ConnectionGUID: BDEglK+nRymDseHdwIsjuQ==
X-CSE-MsgGUID: 9MdtC+zWQFmIzAJA3CCdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="221001658"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2026 11:59:04 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6COb-00000000AcL-1yVq;
	Fri, 27 Mar 2026 18:59:01 +0000
Date: Sat, 28 Mar 2026 02:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v2 1/4] iio: adc: xilinx-xadc: Split driver into core and
 platform files
Message-ID: <202603280238.N4wp7jaC-lkp@intel.com>
References: <20260323074505.3853353-2-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323074505.3853353-2-sai.krishna.potthuri@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_115909_882882_3E767945 
X-CRM114-Status: GOOD (  10.96  )
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

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v7.0-rc5 next-20260326]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Krishna-Potthuri/iio-adc-xilinx-xadc-Split-driver-into-core-and-platform-files/20260326-024045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260323074505.3853353-2-sai.krishna.potthuri%40amd.com
patch subject: [PATCH v2 1/4] iio: adc: xilinx-xadc: Split driver into core and platform files
config: hexagon-randconfig-r133-20260326 (https://download.01.org/0day-ci/archive/20260328/202603280238.N4wp7jaC-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280238.N4wp7jaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280238.N4wp7jaC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/xilinx-xadc-core.c:764:12: sparse: sparse: symbol 'xadc_type_names' was not declared. Should it be static?

vim +/xadc_type_names +764 drivers/iio/adc/xilinx-xadc-core.c

   763	
 > 764	const char * const xadc_type_names[] = {
   765		[XADC_TYPE_S7] = "xadc",
   766		[XADC_TYPE_US] = "xilinx-system-monitor",
   767	};
   768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


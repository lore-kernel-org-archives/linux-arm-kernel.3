Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EF0C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB/OYx2KTSdh9SYnxzmnEAhdg07fWohLHg6FuToUfnc=; b=feIgtNjZjedqE/+Rctno8CKyCL
	E537xfLgueAlCKY8Vvwc+5YMlOW5oiQ56cV/m7HHq8TO6gQ9UaLJgdpg0ewLyS98kwG4+r5Hif8gP
	DIInxZTSfi7NHRctkb0IOAby6q7sc7fdiIRf9xmwQsmmHoz5BCZ/wXlunfK60qqj5AQ3h/sATrMZD
	ZKIKOeskwQT63M2plkUQpJm/dlf5KsDLQ8HcTyiSabcFvqurKwxznN90sOENBrv+gtUUmVBFgQu39
	PTKD55mnypSxPwcoFLvdFG6e2INKyeqtjOu1Q37j68E004lEx1I/1yE4JuRPboKlNOMs1z4yfVrmv
	Em2Mx7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcw6-0000000FE3q-21i7;
	Wed, 07 May 2025 11:27:38 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCctV-0000000FDdU-39Tw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 11:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746617098; x=1778153098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eZJybZdxwASakpoaQMGcFN08228iOOZpqRIN+H3A/QE=;
  b=ZQcJ+BG6gdHnxxvaUUtA3Iqq2GJQJ1pbeonlEfUpBljisdTacGZsWdHn
   l2lV6Vrvpl0iO0JfGpnUajxwKUt46cU7tzLSR8/NJpI3Lebx1pyZnY4dS
   MHi2uIhLpmV4QMC2Y36ZrL3wRNGW/qZKRkRaSRTM89KIvJ0co6MWn9ESQ
   PU4ApBgOyCzkloFHxhJqafdLVJV45zQQW3fRfmxzNUVtTtSGuHSZybljP
   lRclaioyyH/C0UUJ9oXRq+rhMZ1Lotw5ksSOzgd5geOZ21iS3T0AnZHYK
   M99oZPUVQtWt02wZwnt0/Mu7OXqvuqdxl2fiw2OcmE0uqXkthyGykaqYd
   Q==;
X-CSE-ConnectionGUID: 3GtHlcwRQji+xou4/Q5IoQ==
X-CSE-MsgGUID: jHic1JuMRdehIkSvRO4q6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48241810"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48241810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:24:57 -0700
X-CSE-ConnectionGUID: pqp/Io6KTYeFgb6dTJ5ubw==
X-CSE-MsgGUID: QXROB2ZTRBKievyOhHhh1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166861156"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 04:24:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCctP-0007fZ-0v;
	Wed, 07 May 2025 11:24:51 +0000
Date: Wed, 7 May 2025 19:24:08 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] coresight: Add remote etm support
Message-ID: <202505071921.rDzEb2CH-lkp@intel.com>
References: <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_042457_800678_0E350D4C 
X-CRM114-Status: GOOD (  12.93  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc5]
[cannot apply to next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-CoreSight-QMI-component-description/20250424-200202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250424115854.2328190-5-quic_jinlmao%40quicinc.com
patch subject: [PATCH v5 4/5] coresight: Add remote etm support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071921.rDzEb2CH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071921.rDzEb2CH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071921.rDzEb2CH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-remote-etm.c:161:27: error: initialization of 'int (*)(struct coresight_device *, struct perf_event *, enum cs_mode,  struct coresight_path *)' from incompatible pointer type 'int (*)(struct coresight_device *, struct perf_event *, enum cs_mode,  struct coresight_trace_id_map *)' [-Wincompatible-pointer-types]
     161 |         .enable         = remote_etm_enable,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-remote-etm.c:161:27: note: (near initialization for 'remote_etm_source_ops.enable')


vim +161 drivers/hwtracing/coresight/coresight-remote-etm.c

   159	
   160	static const struct coresight_ops_source remote_etm_source_ops = {
 > 161		.enable		= remote_etm_enable,
   162		.disable	= remote_etm_disable,
   163	};
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


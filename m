Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE71CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 05:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdmJPcNBNJvIc4PyeLWxTJR3we8whuVPQjlpd2LneWk=; b=hyr1P927dXjAMhHB0/QgSyCCJP
	2LiFasW0iBEAGqGLLyzVSecXILVskhyfMIS9FmPXi7ffnS4DeYfzRlgu2R3g9+I7Flyrbaw2b4Qyz
	BIvnB3wFBidid5W7Deoxt5N4kGRyOr1maBeElQ2/3WXWi00aVIDdcUPG2lg/WJKdOHGMdSt73gio0
	6ZepLvPVI5TyjeL5Z0sl0nMZOvGpqWeQUC1OFIxj5n6EvvD2ubYIKazNXjEnFVHt7nUxoalAZG2Yn
	+MbinNH/7/7Re6AupkfzxI+o/N5vx5LPOvDnBEg6FF5Dkgo+hOIXde5nr279HKXTIcXgFJmvxWe8p
	zcHdDBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgdiq-0000000CFM9-0PHF;
	Sat, 08 Feb 2025 05:49:44 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgdhR-0000000CF8z-0ddp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 05:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738993698; x=1770529698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wA0BmDz21/8I4MOZeMPRdJ8DIn6Tlt/iSbPznwlMASM=;
  b=j/EE3fF4l98c3oCttPGNhT9rqgA1fj7kpy+fisEZgeW5guPqZD7wG+T5
   oqRC9TkEcMBRUTMGdsD+K5x9oemJPFBq2d+ryAbvvGd74w3vmU83Nwlq/
   1Zfqy9thFEgCedyOZjqA44Mo2OnzZ69FKsP1wmbiKoY0WNtJU14hHZinX
   Nl/9yBkqDbdY5CulmS3HUvJEztglkUEjiOMWhCxKEY1VRJwqfCigDLVLq
   i/NPVO/vn6atkQE+80Y7Nqsfd/S8m+aOOjq3jxhxgMOqUiHsvaBLhN5nj
   +xdg2ZH3lQ86ntxyvCAiPt7GpoBZ5sYFhuSWpuqqQfPTI/e2kkRXbzCSZ
   g==;
X-CSE-ConnectionGUID: bqvpEkbrQlqbnkptAKEexQ==
X-CSE-MsgGUID: wUIuxLw/TNm2f3QorIMjnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="51028435"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="51028435"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 21:48:13 -0800
X-CSE-ConnectionGUID: HWU+sQIMQp6QzNwU1gmo2w==
X-CSE-MsgGUID: IxhBp/1ZRTuYG0obpJ0Qcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134955066"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2025 21:48:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgdhF-000zbT-0b;
	Sat, 08 Feb 2025 05:48:05 +0000
Date: Sat, 8 Feb 2025 13:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <quic_jiegan@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
Message-ID: <202502081313.JqJlff9y-lkp@intel.com>
References: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_214817_279224_B3AB9C30 
X-CRM114-Status: GOOD (  13.51  )
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

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on atorgue-stm32/stm32-next linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/Coresight-Add-support-for-new-APB-clock-name/20250207-144657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250207064213.2314482-5-quic_jiegan%40quicinc.com
patch subject: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
config: arm-randconfig-002-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081313.JqJlff9y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081313.JqJlff9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081313.JqJlff9y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-core.c:659: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Links or sources will read their existing or alloc a trace ID, if their ID
   drivers/hwtracing/coresight/coresight-core.c:676: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Call this after creating the path and before enabling it. This leaves


vim +659 drivers/hwtracing/coresight/coresight-core.c

   657	
   658	/**
 > 659	 * Links or sources will read their existing or alloc a trace ID, if their ID
   660	 * callback is set.
   661	 */
   662	static int coresight_get_trace_id(struct coresight_device *csdev,
   663					  enum cs_mode mode,
   664					  struct coresight_device *sink)
   665	{
   666		if (csdev->type == CORESIGHT_DEV_TYPE_LINK && link_ops(csdev)->trace_id)
   667			return link_ops(csdev)->trace_id(csdev, mode, sink);
   668	
   669		if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE && source_ops(csdev)->trace_id)
   670			return source_ops(csdev)->trace_id(csdev, mode, sink);
   671	
   672		return 0;
   673	}
   674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


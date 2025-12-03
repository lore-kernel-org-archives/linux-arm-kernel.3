Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECD0D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJvmBMcNm2rEyVNFC7J0i+Cp5A5cZNwBFmeqKyrlDWE=; b=Inwr2Wbz9QQjz/CHJ9wEKonYqc
	/O9CZ7lfYcw+LTZAPhxvz1XPOCAx/1m+FvwVtNmrx8zz4N4ORgMcM7ip46YQUWdOXD4A7XsYRCk4Q
	JFNokac4Je1/2gsH0FGPsbFB5TEOSl4vcni51yVsoQBAMSKkQtkmTh1TZ7eIhbrV/PZPzr1pPHlOj
	JqV26DoWD4AwwFX++Zip6/4W1PAiXn8rcH5m7neGKJP1JNCJXsQf8wRE07kRxX155LhALqZDGxgC0
	TCbZVX0NVQzdrVmqc01qE2kpVEfyBxfWWXoN0En9Ua7B0oFla/tYcs+T3eZz9GJKqkZwJMq81G4Hi
	QfPRoK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiLh-00000006Jqu-2bVV;
	Wed, 03 Dec 2025 08:36:33 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiLe-00000006JqK-1YZ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764750991; x=1796286991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GEUohRqpfGWfGxxAeDp85DOIF/6IRcyN4akhZA/M6lI=;
  b=agqAau507DED1KixkIafW3jaWs9MibYMjPpKd3TcLKmdx0pC6a7MhK2I
   yldPXS3yPdncU/D6DDGXMFlDAVeYnEYMPhzdb2+P3JI9FAMhfcR1N2rLC
   sy36S7h+ELp0Xvl9bwwz9m/vP//f4gWe7FRPL7Ak0EtsSJz5gIFICaDVO
   AFx0P0f9Fi4Rfgsd43ogrpBngFBCU7u4KynIOTXgFP9zVg5/ajtSrnRon
   Whw/+0G6Z4oh0Z/zn5UcZf+Sa+wsrfzZ9it9uF2gDOysBb+4bgYeiaLTy
   yDxQCTVBrWLYCMlkApdyvQ7bvIiM7QRv/Zfn5Lb5fdMEh1OZI0Y2HNM5Y
   g==;
X-CSE-ConnectionGUID: AvA5eH35RQm/bDI3CGSC4Q==
X-CSE-MsgGUID: 7I/QQUwMQya+vHFpZjVS1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77056836"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77056836"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 00:36:30 -0800
X-CSE-ConnectionGUID: AZFrEOdTRSat84/xefRi/w==
X-CSE-MsgGUID: EtfrlZziTHCvXPaiXay1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194842233"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2025 00:36:25 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQiLW-00000000AlR-3fn0;
	Wed, 03 Dec 2025 08:36:22 +0000
Date: Wed, 3 Dec 2025 16:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolinc@nvidia.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
	jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Ashish Mhetre <amhetre@nvidia.com>
Subject: Re: [PATCH V3 1/3] iommu/arm-smmu-v3: Add device-tree support for
 CMDQV driver
Message-ID: <202512031601.IpliwbHW-lkp@intel.com>
References: <20251201163219.3237266-2-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201163219.3237266-2-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_003630_484637_9436D882 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Ashish,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251201]
[also build test ERROR on v6.18]
[cannot apply to robh/for-next linus/master v6.18 v6.18-rc7 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashish-Mhetre/iommu-arm-smmu-v3-Add-device-tree-support-for-CMDQV-driver/20251202-003517
base:   next-20251201
patch link:    https://lore.kernel.org/r/20251201163219.3237266-2-amhetre%40nvidia.com
patch subject: [PATCH V3 1/3] iommu/arm-smmu-v3: Add device-tree support for CMDQV driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512031601.IpliwbHW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031601.IpliwbHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031601.IpliwbHW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: init_module
   >>> defined at arm-smmu-v3.c
   >>>            drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.o:(init_module)
   >>> defined at tegra241-cmdqv.c
   >>>            drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.o:(.init.text+0x4)
--
>> ld.lld: error: duplicate symbol: cleanup_module
   >>> defined at arm-smmu-v3.c
   >>>            drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.o:(cleanup_module)
   >>> defined at tegra241-cmdqv.c
   >>>            drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.o:(.exit.text+0x4)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


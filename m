Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C114D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe7CNJyjHuP+ohiIEjz9nhTd6GFHHo0UZDth7/G0/hs=; b=B9zVrCu6F6MiKz5kaS0P7X85vz
	HQeHVJQkdLdjXzJ3OMMn+c7b9q44W/fuId4cQgN7oskmd08qQ2s/UirQb2vwaS8rxgj2+hM04ueo0
	SbwVbBLZdbQICB2r7PCsbxaOM1ZwMr3F4tz0xiPq+N6IlxYpDxgOFm6WRaDbBQ3poqiMrUHCz4zqu
	5tknjy5AnL3Po7DzRNa9GMhr5nW6gIbsmoBpoDZ/ZHYbrFhUqOKp+5ZP7b7aDKxto1qx+fylxkIn2
	VGtwy9yiLVmdzNbh4PFHC8bJ22p+y02FvUzE6GB6GwEIcXDfTaI8PVR4tulS58kAhuY3sSGhvG3x6
	th3lobUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7vI-0000000GKNh-1i1C;
	Wed, 28 Jan 2026 15:57:40 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7vF-0000000GKNI-3shf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769615858; x=1801151858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I9Di7H3MuUn01E+66sdDwN0NLusiqDryL3CP5MafZfw=;
  b=VSWihCx6h9U//WFsdGw7i1Z4OdJOm3TvrShUom1rUUxPHxvSjOA2bG43
   nq1uFz8SAgI16ngOwgj8ISudBBagJDwNEwE/rtCZ2fPUHPzRiStBKrWpC
   AsIzBnwWGk2hwLT1d6z3/48Ur5ilF6s99OFunlFzN7hJb0PYugMK+u7vW
   WqmOjimTulp1wm8Eau9Ph/dPrQ5zJqe+SRKlQYlxeHdqiCAyIKosHB7Uh
   626nq2quW9QbFV5dtGRB8pNnFM+BVkDxN+N5O9wDRWEO7zmQgstRzHIGB
   zDZHYwvQG2PbvYyTLKpeUM/AjvcvffWnyc5X+i1ANN38DFuBHG/GMQPRY
   Q==;
X-CSE-ConnectionGUID: sEykeh+EQ1ChiAEz3fZKMw==
X-CSE-MsgGUID: GxkdRpQOQtSFMDpXTF45Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81464557"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81464557"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:57:37 -0800
X-CSE-ConnectionGUID: mmONyVQtSiqMDeVB079yPw==
X-CSE-MsgGUID: DO7rhtghTFOyjp+X1uisYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207913499"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2026 07:57:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl7v8-00000000a9I-2oGg;
	Wed, 28 Jan 2026 15:57:30 +0000
Date: Wed, 28 Jan 2026 23:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
	suzuki.poulose@arm.com, robin.murphy@arm.com,
	ilkka@os.amperecomputing.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
	vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com,
	skelley@nvidia.com, ywan@nvidia.com, mochs@nvidia.com,
	nirmoyd@nvidia.com, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: [PATCH 4/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
Message-ID: <202601282328.gksG6ks9-lkp@intel.com>
References: <20260126181155.2776097-5-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126181155.2776097-5-bwicaksono@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_075738_023072_8F43DD9F 
X-CRM114-Status: GOOD (  10.22  )
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

Hi Besar,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Besar-Wicaksono/perf-arm_cspmu-nvidia-Rename-doc-to-Tegra241/20260127-021604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260126181155.2776097-5-bwicaksono%40nvidia.com
patch subject: [PATCH 4/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
config: loongarch-randconfig-r051-20260127 (https://download.01.org/0day-ci/archive/20260128/202601282328.gksG6ks9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282328.gksG6ks9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601282328.gksG6ks9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "arm_cspmu_acpi_dev_get" [drivers/perf/arm_cspmu/nvidia_cspmu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


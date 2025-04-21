Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46165C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SGGCkSsr9X3d8z6SPL0t/z3wZVPduvZS75PPoC/VFPs=; b=Rk1JG2kw1cbAXQVTvRqdCUsRYc
	GPsr1NysuPrlgPih/S2JkIqq66HuEKXr8xbObEP+LorjxOv9ZkwCT7wRYWJq2v+alM8O78G8eZkAX
	x904qwV/k47o51bKfRLJm3ubAJIhFGIBV94+qQ6buoSdvGXnWkGHdczmI8ImoWMiv4BTaSV2+ZtUc
	I8Hq5cxYXd/T3eRZc7ODZp8i11mDZt3LMC763JI7U0104zzeBu9KVdbPoSlamaXY1hqMIRsSRQcNb
	P5ukxDHsJlFCXz0jjTNeeCG6ukeFe6VY1nXzVBJS4aFOsmSWp4wyUYYEnfWiAOMfmNzejyc2WbmUR
	jewKCFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uxv-00000004phS-3juk;
	Mon, 21 Apr 2025 17:29:55 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uuv-00000004pAx-2qWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 17:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745256410; x=1776792410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTD948qUOewiqNdJKPUZq+DKcBYdSVmBcF46+D+WFKU=;
  b=kJUu/dxtQAfZvi9UDUKcKPZhovGqOT+ja7OK8aXRWHIQRoH7NjLCuM3d
   hgVSHdVx8ml09/5Ae/038BQOgVYybY+l2y+Fz0p7UK0yYSPBZhEbhTcUX
   Wo6QAR6+2vOxbk6Udwe90Vjhr6CkajVNsN0InQkuZJlFNO2QBQjXBMuch
   XqlrTU4Gr3cfgAgZuIZM04/NVFfZ5RGLxirLhDNaz7s7jOXS5U657lCns
   0F3/anOMeOEj5vKGjUr9pY7vqjsDYMNxR2dWhjy8cCydqxxXA81Zjh009
   vmK1f26lsZYXDy/tRYmywZ0foLBT/GlRkaLHVi/rhbBQtdWeh9dblh26s
   Q==;
X-CSE-ConnectionGUID: S78hIn1ASKa1gvWA+TKNuA==
X-CSE-MsgGUID: 81gH2TShR4aunlqmFmso4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46708691"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="46708691"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 10:26:49 -0700
X-CSE-ConnectionGUID: OcFjVfVIRnqvI6P9i3yZvg==
X-CSE-MsgGUID: QSdFfHk0T8umL0pY6bW6jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="136733766"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Apr 2025 10:26:48 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6uuq-0000Gp-2T;
	Mon, 21 Apr 2025 17:26:44 +0000
Date: Tue, 22 Apr 2025 01:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 9/24] drivers/perf/arm_spe_pmu.c:1225:6:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202504220122.xk8VGIkc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_102649_765931_87B169F2 
X-CRM114-Status: GOOD (  10.45  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   2017a5b657d38d470385b73ae1704eefe13bf2a5
commit: c4dc9ff02fe9b78fb6f5cead8defbb4e6d3b632c [9/24] perf: arm_spe_pmu: Convert to new IRQ affinity retrieval API
config: arm64-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220122.xk8VGIkc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220122.xk8VGIkc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220122.xk8VGIkc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm_spe_pmu.c:1225:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1225 |         if (ret) {
         |             ^~~
   drivers/perf/arm_spe_pmu.c:1211:9: note: initialize the variable 'ret' to silence this warning
    1211 |         int ret, irq;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1225 drivers/perf/arm_spe_pmu.c

  1205	
  1206	/* Driver and device probing */
  1207	static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
  1208	{
  1209		struct platform_device *pdev = spe_pmu->pdev;
  1210		const struct cpumask *affinity;
  1211		int ret, irq;
  1212	
  1213		irq = platform_get_irq_affinity(pdev, 0, &affinity);
  1214		if (irq < 0)
  1215			return -ENXIO;
  1216	
  1217		if (!irq_is_percpu(irq)) {
  1218			dev_err(&pdev->dev, "expected PPI but got SPI (%d)\n", irq);
  1219			return -EINVAL;
  1220		}
  1221	
  1222		if (!affinity)
  1223			affinity = cpu_possible_mask;
  1224	
> 1225		if (ret) {
  1226			dev_err(&pdev->dev, "failed to get PPI partition (%d)\n", irq);
  1227			return -EINVAL;
  1228		}
  1229	
  1230		cpumask_copy(&spe_pmu->supported_cpus, affinity);
  1231	
  1232		spe_pmu->irq = irq;
  1233		return 0;
  1234	}
  1235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


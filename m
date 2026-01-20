Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB8AD2629A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/ZLxHIKCARgKpbPHrG/V4PqcIi0TNYxUtflr6WOPnw=; b=HZM8V+GoIz27HKENsbVcnfPxlt
	+k4a1fN6OTXiTG0ukJmJlHfKquunT5qpNPW7xmmSpl8gH2TDVf4N1q0SPhe6kwhIgEc83dkpgIyzj
	8rw4aDPlyqkxyLbCcWD5PQgFbWe5mu/1atyscl+ipQMCME8wjSYmPAmWh1R2WMV28Xnlcse5qDNcH
	io6AL7DMD5gIMBeAnQEBoVFtR6f8fs/Xlt4mNWGOHdJLxutvOOl2CTPH3t9HfEWDjLMzWuhRQJuf7
	+7Fb7bRHe2Gj/QbEJaZpr2hU5sz7aG0C/FPLBU/k/o6U7q7YssE1Trdk9AWvCz22zdffmkEGrecMX
	yzanen6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHni-00000004P2H-0nmA;
	Tue, 20 Jan 2026 19:54:06 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHne-00000004P1p-48YU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 19:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768938843; x=1800474843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kfSaGevMQFowY+aKVSV83hPV0nA0s1ZbBBUZe878q3Q=;
  b=Mn91Y7l4yG6zXGNAf/h31hj+mTwEs3oR5Pz93/+BXWvkpks1exPYwizz
   hjjdNxZ/lLS2MHNuMoYYfmy6mEE1sbhK6W5ljkKdxFmM0BXc2KEG98oaK
   jf9Lbt4uhslIIUy3Y8kfyjT1UuGCnkyqiVSUfRaOztIBMZJ4DESlDiL+4
   lYKKyVzcbHG+/JuXD7YQR3XpoV4WWie0UnEFjtNwe6C5kQMN8SjmQOSyj
   Wj1ajjObcVctxQorUTxCYb4cpiXcJy6gyHU2kpRhXn/r5QchdMS+1ye/K
   Kprb7nwK7HSksV8QoEKoKlR/HyX9rhAN42FTEnO8nCQcWpzcViz2PwWkn
   g==;
X-CSE-ConnectionGUID: I3sP6yXxTXaCXAu3K1roNw==
X-CSE-MsgGUID: b2MO4XiCSnCNdQTkm/SJqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80881367"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="80881367"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 11:53:55 -0800
X-CSE-ConnectionGUID: ij5CQKEaTmqLtcKeWjAPfw==
X-CSE-MsgGUID: 3aSxQKx6TVefUIwROoJlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206130616"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2026 11:53:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viHnO-00000000PSX-1Fbu;
	Tue, 20 Jan 2026 19:53:46 +0000
Date: Wed, 21 Jan 2026 03:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh R <mrathor@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: Re: [PATCH v0 15/15] mshv: Populate mmio mappings for PCI passthru
Message-ID: <202601210255.2ZZOLtMV-lkp@intel.com>
References: <20260120064230.3602565-16-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064230.3602565-16-mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_115403_042008_226BFE97 
X-CRM114-Status: GOOD (  11.99  )
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

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on pci/next pci/for-linus arm64/for-next/core soc/for-next linus/master v6.19-rc6]
[cannot apply to clk/clk-next arnd-asm-generic/master next-20260119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-R/iommu-hyperv-rename-hyperv-iommu-c-to-hyperv-irq-c/20260120-145832
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260120064230.3602565-16-mrathor%40linux.microsoft.com
patch subject: [PATCH v0 15/15] mshv: Populate mmio mappings for PCI passthru
config: x86_64-randconfig-003-20260120 (https://download.01.org/0day-ci/archive/20260121/202601210255.2ZZOLtMV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210255.2ZZOLtMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210255.2ZZOLtMV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/mshv_root_main.c:60:19: warning: 'setup_hv_full_mmio' defined but not used [-Wunused-function]
      60 | static int __init setup_hv_full_mmio(char *str)
         |                   ^~~~~~~~~~~~~~~~~~


vim +/setup_hv_full_mmio +60 drivers/hv/mshv_root_main.c

    58	
    59	bool hv_nofull_mmio;   /* don't map entire mmio region upon fault */
  > 60	static int __init setup_hv_full_mmio(char *str)
    61	{
    62		hv_nofull_mmio = true;
    63		return 0;
    64	}
    65	__setup("hv_nofull_mmio", setup_hv_full_mmio);
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD58ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 00:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zm80/a3fsveGIPTcdj00SzazAiJ2sAC5k58gQ5q0M3I=; b=KJtVZFMFETNsm6F34/g7aXBm34
	7gwHx6DpA6ltbx6BcIkIxTFg133z196qfVYHBgSnAoRvHSGMFYMRjZJSXCZxeUagwaWo/xhNl/RHu
	pptf54KYlAfhFqaFPyaoywgpVVMaGnx+K0lgvXc1NTVwn0W5xyqXSO4z4eYVrO7KUbEp6iAgy7eDD
	i9zEsK7LC8iTnKRiyDfihy700vZBYbGtSVEVPECi2PDBO1RLL6w4Z59eKxm+Is+JUrmzo0a8U0wXD
	+TgT7RUP7O+w0TUc5o1Kn7mS3ose/uxo9/2AwKoltYkc2JquNYT4+MV339DzM+xvP0hlCV08mYfRs
	JUo/yY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE3h-0000000CIeL-0h2p;
	Sat, 13 Sep 2025 00:24:05 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE3e-0000000CIda-11ZQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 00:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757723042; x=1789259042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcYX22alJBWBcVaGqP0BLEghs+L/k9ZQqKP706ZqU8Q=;
  b=IKq+su/0RGtEf7fv0vI/12Gs1pE51YQHU3sgcGB/2DudkcYGAYOoyN1d
   uop67yXMGsq7Nl8E0QTXBMBjdRxycxhjQWiUJSD9QgdEyapMk96EC2ona
   KDVpIWlHOMepnYxjt/11MW3E8M0gPtmzAyCNPVNunMgyJHqwPLMy8i3V5
   ts+jFWHaKcKK7LIOCNIt16jGwlWGv6XI3QdSzbzm7jnJF4MqWw+44UDOg
   S2eCG73Wk7nToN/dj8DFUDYUzU2D2quOTR3SLgNzFlg13qMC88eY36s6c
   AHCxs5gr8iHqbgn75qyq73mPXErGEloKzfFCI1oT0gAksC+TM5gQntah7
   A==;
X-CSE-ConnectionGUID: maPX5BgSRzSF1qUMAaaj9g==
X-CSE-MsgGUID: dfTbrbLCT4+i9SwSIlhIlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77683422"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="77683422"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 17:24:01 -0700
X-CSE-ConnectionGUID: ROkWgZtmSS2R4fjBU22Qww==
X-CSE-MsgGUID: MAL35EIDS72UkFilz2BhNg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2025 17:23:57 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxE3W-0001H6-2F;
	Sat, 13 Sep 2025 00:23:54 +0000
Date: Sat, 13 Sep 2025 08:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>, thierry.reding@gmail.com,
	robin.murphy@arm.com, robh@kernel.org, joro@8bytes.org,
	jgg@ziepe.ca
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v4 4/4] drivers: iommu: refactor arm_smmu_get_resv_regions
Message-ID: <202509130836.idXoj3z8-lkp@intel.com>
References: <20250909154600.910110-5-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909154600.910110-5-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_172402_300901_8FDD8926 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc5 next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Saini/arm-smmu-move-MSI_IOVA-macro-definitions/20250909-235141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250909154600.910110-5-shyamsaini%40linux.microsoft.com
patch subject: [PATCH v4 4/4] drivers: iommu: refactor arm_smmu_get_resv_regions
config: arm64-randconfig-002-20250913 (https://download.01.org/0day-ci/archive/20250913/202509130836.idXoj3z8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509130836.idXoj3z8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509130836.idXoj3z8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "iommu_set_sw_msi" [drivers/iommu/arm/arm-smmu/arm_smmu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF01C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 05:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuVAgHx4AzjPy/kogV2t6BuhJQSrQde8nVEQKX/o+Xk=; b=LmbwnWadUx/JCpnYol0G+w3zDk
	yUMeU/F6/YXI9frPiXLmKkGaPZeIrlGRJEYGB0ABbDv4hOtkPruXQSZZDVMce19zv0iKiCVDf2I/j
	EyERsLcITT/Ck/sxdqQbHVqk8MO5RLiaQYcn+MIsHU8+C74X+g3fDZWwciVuSNzkMX4mY+RgsBU36
	4fj9/ouwB+kWzm+/wwAd0HGgL5QoSCsN2A31vJTz9ad+ti8H8KKkMZhCaEMHcxgK/twXWEHfIxkTW
	h+2EwADxmAcwDIrLTgkcVDDHBNygkQHlC8gdcO75NmqdwrUOrOkelhlJbA5drCghh6LIZmW01p2qq
	5GG6mrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkxp-000000094AC-42UF;
	Wed, 18 Jun 2025 05:03:57 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkoE-000000093Hl-1xc1;
	Wed, 18 Jun 2025 04:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750222442; x=1781758442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DEKlm+ejo/0mzszOUsL53ctVVQ1j4m3qewxhIFLcv0M=;
  b=MvRQD13m/2GjqaQ3PLufxQ//8XWD9ExvXLL4pOFXwZkQEcnyOK/cBiLW
   D+Ate2EILgRIlfcGYMMsceD7+tTlsyzdCMcqQ3/sSWcChNnNTd4VQ84g0
   ObkuG84q+EIBSINWgyR5j+Ty6pTEqcQTk77BBl17uF4jXBxkRTYQnYCYm
   7gN0bG4Lai45SBffVMh6BLamaSp074blXFhfmyKBzj5anSsx8eSRl9T1x
   5OOyYjLFA1bZl2ZtxmcsfH+dnaDuXnwk+gI1tkAtyn4SAa6YZZrCdH+t2
   m8FDncTP9f8+h6aHsP64LkKnNitNMA8zcdGffWb6jbBBVxdinvbUvDWv+
   g==;
X-CSE-ConnectionGUID: SRnprPrdTfKJgOCkU+rYMA==
X-CSE-MsgGUID: UaHuGxFtSE2JsOas2mT+pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63460460"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63460460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:54:01 -0700
X-CSE-ConnectionGUID: IlMBVbuZTBeIdVORDtt5FA==
X-CSE-MsgGUID: fyNBzSTZSCeodXZuqA5+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149026086"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jun 2025 21:53:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRko7-000JPW-1J;
	Wed, 18 Jun 2025 04:53:55 +0000
Date: Wed, 18 Jun 2025 12:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <202506181230.D53QwmdL-lkp@intel.com>
References: <20250616145607.116639-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_215402_545944_68F6C281 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next linus/master v6.16-rc2 next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20250616-225842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250616145607.116639-4-benjamin.gaignard%40collabora.com
patch subject: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
config: arm64-randconfig-r111-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181230.D53QwmdL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506181230.D53QwmdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181230.D53QwmdL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/vsi-iommu.c:890:24: sparse: sparse: symbol 'rockchip_vsi_iommu_driver' was not declared. Should it be static?

vim +/rockchip_vsi_iommu_driver +890 drivers/iommu/vsi-iommu.c

   889	
 > 890	struct platform_driver rockchip_vsi_iommu_driver = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F3AE67816
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 00:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eN9wFJdJ6zKDRUw/Kb6wlGLWCYQV1hfD+9k3Tru8zIQ=; b=oDUF4/OagwlMqnGdF6jHI/pYcH
	rATfJ+hAJUDeOyh2+HPlXRoVr/WewMAKMejZdK7eTH7PrDwml7uNmzDUkCDEESzXJ0s4qOzyobg/0
	CS37zWW71+O9d78wWTip2mpMT+/Qp05TWctQZ+EI2LEJWDSDLoDWsP6naUvwPq5PJE0oHMkKqDhQZ
	FT5R4X5O1TLnWap3kYMoVQhoYzeDFoAsCKab64orSrn4FIQf4oc9pA01uqtaQnEsGT4uYpkZVXBdN
	7ZRVDyT+uIN+I/ebx46PLTHJUvHiMDu6EdbBghVyYeMIQ9zCYlWr7a35Ljm2QeYrAhw5f8YEsXbbi
	g/mbPAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Oco-0000000Ah10-3VAX;
	Sun, 03 Nov 2024 00:37:50 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Ob7-0000000AgtD-243V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 00:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730594166; x=1762130166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbe2E/kuz23KVMB6pU+e7/bekltIcp6hB7K5xEPwvbs=;
  b=I+v1WD32V8fnUiSBozKwOwPs9KJykdGs8WAJbxK8bNFWYvTUi3pryZ4S
   0S24TWl5cXk3OSEainMBiO9+B9yQYZ+Jr2B5+aICyzOflilIcBtjVqkBe
   xTD0B6qA+vjsecxUNwJi/wZPGQdyjjpRLaEA25cfQzH59F32dajq97K2o
   dtVB2HNwMtkWn+/GRbEhYWF2mw0INiXEtWqW4jS2d0JwGyEps3yi+iKqX
   hYO8ALQ2+TJ1fvWd351jfhdw+2vdpmvvd3tVIaZ8MmbF+LuELUdt7Zpws
   yw7MuxrzSSpdm+xh/TAuaYFbPvvkMvJWHFEX6E0MytHTG08bEh0OJvaFl
   Q==;
X-CSE-ConnectionGUID: JLxtkVr/S6WDhQjBQB8sPg==
X-CSE-MsgGUID: EcbpkrNkTe+V/j54XxtgYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34013731"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34013731"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 17:36:05 -0700
X-CSE-ConnectionGUID: QBDG08ftRfSHNGKW6HeHtg==
X-CSE-MsgGUID: ra3//Z2eR8eA27zLBKYklw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="84116251"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2024 17:36:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Ob3-000jVl-0z;
	Sun, 03 Nov 2024 00:36:01 +0000
Date: Sun, 3 Nov 2024 08:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:pci/apple-host-bridge-hook 7/7] ld:
 drivers/pci/controller/pci-xgene-msi.o:undefined reference to
 `msi_lib_init_dev_msi_info'
Message-ID: <202411030800.ovh6XHbu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_173605_624673_95706AD5 
X-CRM114-Status: UNSURE (   8.85  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git pci/apple-host-bridge-hook
head:   4109e0e2e9d3fb7de4ae6f3bade444cdc07c9b9a
commit: 4109e0e2e9d3fb7de4ae6f3bade444cdc07c9b9a [7/7] PCI: xgene: Convert to MSI parent infrastructure
config: i386-buildonly-randconfig-003-20241103 (https://download.01.org/0day-ci/archive/20241103/202411030800.ovh6XHbu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030800.ovh6XHbu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030800.ovh6XHbu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/pci/controller/pci-xgene-msi.o:(.rodata+0x2fc): undefined reference to `msi_lib_init_dev_msi_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


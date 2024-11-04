Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6200D132D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=no1EfJK0lKZHXyZkZ9r5pUJOdWcNp6ZojraAFTp+xu8=; b=Mm40oF8dikKDaZDIEBxBh1cnWn
	SeZOjrMnYL+eV8AOOVwV8EX1aZQq0EUK/WGgeVmXlnnPQy/iKAgteA9nSXmvh6hfvlJkLdlJcBUoV
	d66zYHc2gfAtiVZdn0YjX9oENbH6Xh8kk0btq0UH6xrvLjxcC+U1jxkFH7vi3IwvEdrdN8YrPMnVA
	T4HTdfAo0gh660e4NiDMUep6yNHnpxrG1RyptNa5AkOTKEm52bY56CN+ig+ehtveP6HbK378bsNgl
	B2+fKSGFBx4VqaU7CJUK4LVt8IjOK7coKmf4fMg590zrOgtEb12Y5pQ0dVXRvMte6SkSyToxXkXhZ
	1bl+hfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yMS-0000000E6yI-0Mtj;
	Mon, 04 Nov 2024 14:47:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y1K-0000000E2ZU-1xoU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 04 Nov 2024 14:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=no1EfJK0lKZHXyZkZ9r5pUJOdWcNp6ZojraAFTp+xu8=; b=VS7MqUWnoIMeYtd9Fm+942KCMR
	QEdEQudUNpRBSPiXwXMBX2vQNqQoGPmCpFq1NSDDQdLb6QIgc5xGYney99CfgAQ6RWwdD39AJw0Tc
	ESU/Y+MA6jhFdkKWrJHHlxDrKOSHVqWARLbldDjm2ve8FORAmVKL7vmsI1b1S+AhhSMNjd1KwLq/1
	SeWUvkgMd96pC94uluU/e7DP7vIVBPK6afE97miXH4tWLugnlkzRRoVw+B399aWXx4267KmU7U6i8
	433LF+yxZqjboJUkTLdheJUpuoebn+LNqVKRPuEOoqeog0EUu/cWwxKG3kskHTy8CTxgPqDAqnlM5
	jtbANa8w==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y1G-0000000BLpD-3x2Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730730327; x=1762266327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CT7brXbn9NKpu0p4b2oRMcjvrtTgl29owzk4cIVFwAQ=;
  b=hQzehbI16/GgcwApPkfTVCWhBa5PKPnJYmWChWzg6t1/NoCDWD9w63ie
   tkQpXadgQQMByFrHVNp+FdkFkul5QkbFTV/hqvUTPAdZaP0hcUX+RJg/k
   5kFnFWymsOlwTHMVv+quUrD4MNxCy4hEyeVxlub3J0Nu8bXvnP+jW9tGo
   BiIHDnhiBrut8aVQz5K2jao3paXzi8enJ2FBVYkKf/z20EkFz65TPFhHK
   Faww/ODqbmVT4IIGpa80oIsAzFmOymlHzkx0VyNVg75rDaldYjfrcPSHp
   6QvypNj3gP7ULDQND5pQr5Z3w2Mq0rJpSL33+l5PGsQT+S6xboXkcu391
   Q==;
X-CSE-ConnectionGUID: 7EokaEX2T+OKZY0V7gfquw==
X-CSE-MsgGUID: TxESpERaQXCnNi6xaSjChg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33265766"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="33265766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:25:20 -0800
X-CSE-ConnectionGUID: vKIxw/FaRaSqqupeNOnP6A==
X-CSE-MsgGUID: hGrie7GzTXCqRPAazkBXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83778622"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2024 06:25:15 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7y13-000ktz-1V;
	Mon, 04 Nov 2024 14:25:13 +0000
Date: Mon, 4 Nov 2024 22:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de,
	bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v6 08/10] PCI: imx6: Use dwc common suspend resume method
Message-ID: <202411042110.bIIyBWlv-lkp@intel.com>
References: <20241101070610.1267391-9-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101070610.1267391-9-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_142527_419356_7F76926E 
X-CRM114-Status: GOOD (  11.66  )
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

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus shawnguo/for-next mani-mhi/mhi-next linus/master v6.12-rc6 next-20241104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Zhu/dt-bindings-imx6q-pcie-Add-ref-clock-for-i-MX95-PCIe-RC/20241101-150006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241101070610.1267391-9-hongxing.zhu%40nxp.com
patch subject: [PATCH v6 08/10] PCI: imx6: Use dwc common suspend resume method
config: i386-buildonly-randconfig-004-20241104 (https://download.01.org/0day-ci/archive/20241104/202411042110.bIIyBWlv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411042110.bIIyBWlv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411042110.bIIyBWlv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx_pcie_resume_noirq':
>> pci-imx6.c:(.text+0x88): undefined reference to `dw_pcie_resume_noirq'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx_pcie_suspend_noirq':
>> pci-imx6.c:(.text+0x111): undefined reference to `dw_pcie_suspend_noirq'
   ld: drivers/usb/misc/onboard_usb_dev.o: in function `onboard_dev_probe':
   onboard_usb_dev.c:(.text+0x6ae): undefined reference to `i2c_find_device_by_fwnode'
   ld: onboard_usb_dev.c:(.text+0x711): undefined reference to `i2c_smbus_write_block_data'
   ld: onboard_usb_dev.c:(.text+0x72f): undefined reference to `i2c_smbus_write_word_data'
   ld: onboard_usb_dev.c:(.text+0x74c): undefined reference to `i2c_smbus_write_word_data'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_PERFORMANCE [=y] && GCC_PLUGINS [=y] && MODULES [=y]
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD397C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJSgtdZFc5z3EOBBGSnnpdcKV7dxzdHX2bQpB0OTyIA=; b=LPkj/jbdH4ysleYVmts/Xi6izY
	3Ur7Zpm9jHmZSdGcAZK9YIUw5VHz2kK2MBvUKpW84/CX7XS93foj4MvtThQo9sSKg/lULp2VEvH9r
	MJVW1hfArkn9jcKrA6hNv4I0Z/0VDGYSi+/+7Bm+gxGIMnD16xAGQ4b4+9GsYz15Nz5t3zvQyItic
	GovHtrpiG3udsfm9OUlGzAiZjuoNo0KrWZ3Khobm6w1b7K57XprM79gEGN/rCdLnvkbdkH2+NXB2i
	Ps/PxXqmFLJCItu0KIvhQqFKz1c7cZSLVCwf22QGbWRCGQ5TjwBAmfXUXvOn5UQmhGwN/BbHBR+zi
	3qLW6eEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuiH-00000006EtK-1oQU;
	Tue, 10 Jun 2025 08:52:09 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOug7-00000006EW9-0xuN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749545395; x=1781081395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=05nKBPmhSDln95LoleZcXPT1DhzBlqzSDGZFX9Cc3iY=;
  b=TP8zcSq0Ahi5F6+1kvwVs0c94gf0sknm4207+SlGsVD2vc4sXKg77dmD
   5RcAivgM1iAAEtk471iF9c3n/biJphlpaclXzXMEegT7u9IXk8+xfokH2
   MVKbyRWHceLbznm+p8WIBxkPLuoCrl/UKldpC31YXAzO2zkPMnyq4+y+Z
   +3qvA2RkNBsMYpErmU+VCuylixKLMDBqN0LMC9+/Xu+kcfmPW+2xm3RnO
   AX+6fn2Roth0VkWb7IRAiIqrlyY70++vnUvG7uRbVZZPGsy8Aml7W0fGO
   dmZQ3X73cpAF317uqlWJSpZW/F6la/a188RWuczg5S51JbzfIMwWnsisl
   A==;
X-CSE-ConnectionGUID: IQFB78NiTlmu32fTIrwRfw==
X-CSE-MsgGUID: zqoAhbU7SOmTmDS32bDkNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74179044"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="74179044"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:49:55 -0700
X-CSE-ConnectionGUID: bNY5RX6WTIKGt2dW7mgFMg==
X-CSE-MsgGUID: 31Efn+kFQHqN/6fQtRQq2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147135255"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2025 01:49:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOufx-0007zx-1l;
	Tue, 10 Jun 2025 08:49:45 +0000
Date: Tue, 10 Jun 2025 16:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	dlemoal@kernel.org, jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v19 02/10] PCI: endpoint: Add RC-to-EP doorbell support
 using platform MSI controller
Message-ID: <202506101649.UpwblcVd-lkp@intel.com>
References: <20250609-ep-msi-v19-2-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-ep-msi-v19-2-77362eaa48fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_014955_372155_A3BA3687 
X-CRM114-Status: GOOD (  10.97  )
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

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/PCI-endpoint-Set-ID-and-of_node-for-function-driver/20250610-003848
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250609-ep-msi-v19-2-77362eaa48fa%40nxp.com
patch subject: [PATCH v19 02/10] PCI: endpoint: Add RC-to-EP doorbell support using platform MSI controller
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20250610/202506101649.UpwblcVd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101649.UpwblcVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101649.UpwblcVd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/st/cw1200/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/st/cw1200/pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wl1251/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wlcore/acx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wlcore/cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wlcore/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wlcore/event.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wlcore/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wlcore/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wlcore/scan.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wireless/ti/wlcore/tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/net/wwan/wwan_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/fdp/fdp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/mei_phy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/microread/microread.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/nfcmrvl/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/nxp-nci/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/nxp-nci/firmware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/pn533/pn533.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/pn544/pn544.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/s3fwrn5/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/s3fwrn5/phy_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st-nci/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st-nci/ndlc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st-nci/se.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st-nci/vendor_cmds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st21nfca/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st21nfca/dep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st21nfca/se.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st21nfca/vendor_cmds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st95hf/spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ntb/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ntb/msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nubus/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nubus/nubus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/btt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/btt_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/claim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/dax_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/dimm_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/namespace_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/nd_perf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/nd_virtio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/pfn_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/region_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/common/auth.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/common/keyring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/auth.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/constants.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/fabrics.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/fault_inject.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/fc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/multipath.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/target/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/target/fc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvmem/layouts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/address.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/dynamic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/fdt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/module.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/of_kunit_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/of_reserved_mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/overlay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/property.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/resolver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/eisa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/gsc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/iosapic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/sba_iommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/ieee1284.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/ieee1284_ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/parport_pc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/share.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/access.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence-ep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware-ep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-qcom-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pci-host-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pci-hyperv-intf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-iproc-msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-iproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-rockchip.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/plda/pcie-plda-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/doe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/ecam.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-ep-cfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/pci/endpoint/pci-ep-msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epc-mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epf-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/host-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/acpi_pcihp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/acpiphp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/cpci_hotplug_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/pci_hotplug_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/pnv_php.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/rpaphp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/rpaphp_slot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/msi/irqdomain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/p2pdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-bridge-emul.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/aer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/aspm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/portdrv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/ptm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/probe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/remove.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/search.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/setup-bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/slot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/switch/switchtec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/tph.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/vgaarb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/cistpl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/cs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/ds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/max1600.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pcmcia_cis.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pcmcia_resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pxa2xx_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_iodyn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_mgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_nonstatic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/sa11xx_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/soc_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/peci/cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/peci/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/arm_cspmu/arm_cspmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/hisilicon/hisi_uncore_pmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/riscv_pmu_sbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/allwinner/phy-sun4i-usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra124.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra186.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra210.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/ti/phy-omap-control.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/ti/phy-omap-usb2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/devicetree.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/freescale/pinctrl-imx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/freescale/pinctrl-scu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/intel/pinctrl-intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/mtk-eint.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/pinctrl-paris.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson8-pmx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pinconf-generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pinmux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pxa/pinctrl-pxa2xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/qcom/pinctrl-msm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/realtek/pinctrl-rtd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/sprd/pinctrl-sprd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/arm64/huawei-gaokun-ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/arm64/lenovo-yoga-c630.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_lpc_mec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_proto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_sensorhub_ring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_usbpd_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/wilco_ec/mailbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-omnia-mcu-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-signing-key.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/olpc/olpc-ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/controller.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/ssh_packet_layer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/surface_acpi_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hsmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hwmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/wbrf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/asus-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dcdbas.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-rbtn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-smbios-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-descriptor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-privacy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/firmware_attributes_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/ideapad-laptop.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


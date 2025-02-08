Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703ACC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TUzZkuxppHlOlikF/k2u1aPSnKPl3TptyrFs4GqVBc=; b=mRg3FSG5N/ED8csD1+STtUngDQ
	2+XSMFT4Lb3sOmNctVXOldV5ui+Rlbbpaftgyl17UAMdlMdyKi8qPnwjbo/CD9/PiDMIiBSX83uJU
	vCzlLqJsWwSnbmRjnP0jdXmJvtfddOThSzzEAc5Lhq5a7+t51RU1EVFOrwZ6tMTMryHuOlFIqWav5
	OXrYSAP5nw1uLABr2S6o0Vs6ElADSOd1NiJ8v4reYkIJdT6IN4aqEFoYDn2wWUIhWe9CbTPnNLqmf
	wyOFB4xqZDoEnMMSGei8cXhC1xhVjWCtrOFORVzAHgA3cP9V0UhykXW/rxBwI40LAn+UkNXUllKv5
	GVKA9+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tglgM-0000000D3Sn-1JFv;
	Sat, 08 Feb 2025 14:19:42 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tglex-0000000D3MM-0V2Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 14:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739024295; x=1770560295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VPpd2YYWjZluEJs9Qvp1Y2nnNlnf0rQUcWOQWnGi/4E=;
  b=jmE2MHdf9Laah0e4DgWy79OudiMQwtvVpQ/1F2vT5mhVHlRHOwfVyKiL
   WMChEHND8Yn3bKC2vmuPWoHtMhBEU5UlVEq1RS6CMtqWshFRnvRalJvYw
   WerCc1G/kuu+BElhPVO1W6I+poKvUXE5zOIQcb4n8gcAte3oQC/za7wjc
   LJvcvjqi+NFT1/+4ruTarNcd7Em/ypCH1JDq1e3QgE8UFd6VGJldXovyx
   5Sllcv9OuhIObtdRIAAYyDjhbIcdlAvB7XCqdipY+P08Rpr4/AvkjYLI4
   Sp7k62A5SsBV5PV51WJFkiAVnICltdq1sZfAlTPA1W3oXRRRyoLXFx9QZ
   g==;
X-CSE-ConnectionGUID: IEoPnp3EQo+LgNKzTjG47w==
X-CSE-MsgGUID: 9OOyyE3TTeuEpgBd63r4NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="51044188"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="51044188"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 06:18:10 -0800
X-CSE-ConnectionGUID: 5SCY/wYtTf2L5TycPuB0vA==
X-CSE-MsgGUID: 0P956+EpRVirLOVEYoefGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="116788686"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2025 06:18:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tglei-00103D-12;
	Sat, 08 Feb 2025 14:18:00 +0000
Date: Sat, 8 Feb 2025 22:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	dlemoal@kernel.org, jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v14 06/15] PCI: endpoint: Add RC-to-EP doorbell support
 using platform MSI controller
Message-ID: <202502082204.6PRR3cfG-lkp@intel.com>
References: <20250207-ep-msi-v14-6-9671b136f2b8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-ep-msi-v14-6-9671b136f2b8@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_061815_238134_7B23A791 
X-CRM114-Status: GOOD (  13.59  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 00f3246adeeacbda0bd0b303604e46eb59c32e6e]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/platform-msi-Add-msi_remove_device_irq_domain-in-platform_device_msi_free_irqs_all/20250208-034445
base:   00f3246adeeacbda0bd0b303604e46eb59c32e6e
patch link:    https://lore.kernel.org/r/20250207-ep-msi-v14-6-9671b136f2b8%40nxp.com
patch subject: [PATCH v14 06/15] PCI: endpoint: Add RC-to-EP doorbell support using platform MSI controller
config: i386-buildonly-randconfig-003-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082204.6PRR3cfG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082204.6PRR3cfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082204.6PRR3cfG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/endpoint/pci-ep-msi.c: In function 'pci_epf_alloc_doorbell':
>> drivers/pci/endpoint/pci-ep-msi.c:53:15: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs' [-Werror=implicit-function-declaration]
      53 |         ret = platform_device_msi_init_and_alloc_irqs(&epf->dev, num_db, pci_epf_write_msi_msg);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-ep-msi.c: In function 'pci_epf_free_doorbell':
>> drivers/pci/endpoint/pci-ep-msi.c:75:9: error: implicit declaration of function 'platform_device_msi_free_irqs_all' [-Werror=implicit-function-declaration]
      75 |         platform_device_msi_free_irqs_all(&epf->dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/platform_device_msi_init_and_alloc_irqs +53 drivers/pci/endpoint/pci-ep-msi.c

    26	
    27	int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 num_db)
    28	{
    29		struct pci_epc *epc = epf->epc;
    30		struct device *dev = &epf->dev;
    31		struct irq_domain *dom;
    32		void *msg;
    33		u32 rid;
    34		int ret;
    35		int i;
    36	
    37		rid = PCI_EPF_DEVID(epf->func_no, epf->vfunc_no);
    38		dom = of_msi_map_get_device_domain(epc->dev.parent, rid, DOMAIN_BUS_PLATFORM_MSI);
    39		if (!dom) {
    40			dev_err(dev, "Can't find msi domain\n");
    41			return -EINVAL;
    42		}
    43	
    44		dev_set_msi_domain(dev, dom);
    45	
    46		msg = kcalloc(num_db, sizeof(struct pci_epf_doorbell_msg), GFP_KERNEL);
    47		if (!msg)
    48			return -ENOMEM;
    49	
    50		epf->num_db = num_db;
    51		epf->db_msg = msg;
    52	
  > 53		ret = platform_device_msi_init_and_alloc_irqs(&epf->dev, num_db, pci_epf_write_msi_msg);
    54		if (ret) {
    55			/*
    56			 * The pcie_ep DT node has to specify 'msi-parent' for EP
    57			 * doorbell support to work. Right now only GIC ITS is
    58			 * supported. If you have GIC ITS and reached this print,
    59			 * perhaps you are missing 'msi-map' in DT.
    60			 */
    61			dev_err(dev, "Failed to allocate MSI\n");
    62			kfree(msg);
    63			return -ENOMEM;
    64		}
    65	
    66		for (i = 0; i < num_db; i++)
    67			epf->db_msg[i].virq = msi_get_virq(dev, i);
    68	
    69		return ret;
    70	}
    71	EXPORT_SYMBOL_GPL(pci_epf_alloc_doorbell);
    72	
    73	void pci_epf_free_doorbell(struct pci_epf *epf)
    74	{
  > 75		platform_device_msi_free_irqs_all(&epf->dev);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


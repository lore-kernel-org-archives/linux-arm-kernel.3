Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D92C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vdb5FUabYThp9Nm36YDzO29cq3GiE4U/1JarJhVu8E=; b=tpGmS76zFWwJWM5BmdbF0TL82i
	sjZmCUsZv5MNMSZVhKxs+NKu49ePcDKfvItb0+eexqqlRB9v4oFsMwiHpjV/f6lngH5d/YYfxNdq0
	hkSXgn5Tgzw305o7rptgwd6N+jboUzX3LIDC6Pu2lbJKB39Z8cUzzA0eU/7m+3QI5LNwhgFMIJV+F
	kYwRsxwumYLy5n2uGDsRATtKBWqRiuvwGJugbVw27sqay5jzPpST83MPD1v96TSXVuOLCyb+fTQel
	vEVgmTuCadyU7EXog8bMKq28VdT8jcgRJvkhRTjLgdiH15IbuaXQgoEa34fe+3/uX7LGYdrCTQ+X7
	WHCmmWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgmNO-0000000D6s7-33JJ;
	Sat, 08 Feb 2025 15:04:10 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgmKe-0000000D6XW-1WKU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 15:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739026881; x=1770562881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oE+gp+Gkz95T/V3xgiAIKokUUM1ToOZwtq4ssSOD7/I=;
  b=CPCief5wLiHXSe3VY4XzhvQvOa0TO6zayeSGHwZixmsP8lcInSAbt+7R
   RR1TvhTx7ylQBVtiGnEHYJu6ENq+zoIao5MfFVjPfDmKHjmdz0Y10linD
   DQ+86h1OpIzSgFJ5yMWB6B+FH1cmnohXsWmDamHxTsa9CHoEZO7AIFASO
   a5lExYT2ELOZbWsDNCMBVVAdqkJ40at+tNr9xK/fowF+SZ+w4ZR9Ed0KK
   3Vwaqv2BXVVyj3UH6EXlwUhUKEdbG8aEwYF1yzMVCuOFG2RhwGJJPXCoP
   W8ERtyXpOdCI6svIFyle9O4MJ8XNkVXj6+kG43BGJHmD9MWKPo7UASOA1
   g==;
X-CSE-ConnectionGUID: 1o28kN1SR3K083J6+AgqTg==
X-CSE-MsgGUID: g0fDmfjoQXulKXg4w9IjEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43420843"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43420843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:01:17 -0800
X-CSE-ConnectionGUID: ygCPJfQNTd2FTQwdEqLvbw==
X-CSE-MsgGUID: htZzMBuzSS+sXX7/Kz/DBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116726461"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2025 07:01:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmKQ-001099-1a;
	Sat, 08 Feb 2025 15:01:06 +0000
Date: Sat, 8 Feb 2025 23:00:56 +0800
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
Subject: Re: [PATCH v14 07/15] PCI: endpoint: pci-ep-msi: Add MSI
 address/data pair mutable check
Message-ID: <202502082242.pOq1hB1d-lkp@intel.com>
References: <20250207-ep-msi-v14-7-9671b136f2b8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-ep-msi-v14-7-9671b136f2b8@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_070120_443429_97BC9404 
X-CRM114-Status: GOOD (  13.65  )
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
patch link:    https://lore.kernel.org/r/20250207-ep-msi-v14-7-9671b136f2b8%40nxp.com
patch subject: [PATCH v14 07/15] PCI: endpoint: pci-ep-msi: Add MSI address/data pair mutable check
config: i386-buildonly-randconfig-003-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082242.pOq1hB1d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082242.pOq1hB1d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082242.pOq1hB1d-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/endpoint/pci-ep-msi.c: In function 'pci_epf_alloc_doorbell':
>> drivers/pci/endpoint/pci-ep-msi.c:49:14: error: implicit declaration of function 'irq_domain_is_msi_immutable'; did you mean 'irq_domain_is_msi_device'? [-Werror=implicit-function-declaration]
      49 |         if (!irq_domain_is_msi_immutable(dom)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              irq_domain_is_msi_device
   drivers/pci/endpoint/pci-ep-msi.c:61:15: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs' [-Werror=implicit-function-declaration]
      61 |         ret = platform_device_msi_init_and_alloc_irqs(&epf->dev, num_db, pci_epf_write_msi_msg);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-ep-msi.c: In function 'pci_epf_free_doorbell':
   drivers/pci/endpoint/pci-ep-msi.c:83:9: error: implicit declaration of function 'platform_device_msi_free_irqs_all' [-Werror=implicit-function-declaration]
      83 |         platform_device_msi_free_irqs_all(&epf->dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +49 drivers/pci/endpoint/pci-ep-msi.c

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
    46		if (!irq_domain_is_msi_parent(dom))
    47			return -EINVAL;
    48	
  > 49		if (!irq_domain_is_msi_immutable(dom)) {
    50			dev_err(dev, "Can't support mutable address/data pair MSI controller\n");
    51			return -EINVAL;
    52		}
    53	
    54		msg = kcalloc(num_db, sizeof(struct pci_epf_doorbell_msg), GFP_KERNEL);
    55		if (!msg)
    56			return -ENOMEM;
    57	
    58		epf->num_db = num_db;
    59		epf->db_msg = msg;
    60	
    61		ret = platform_device_msi_init_and_alloc_irqs(&epf->dev, num_db, pci_epf_write_msi_msg);
    62		if (ret) {
    63			/*
    64			 * The pcie_ep DT node has to specify 'msi-parent' for EP
    65			 * doorbell support to work. Right now only GIC ITS is
    66			 * supported. If you have GIC ITS and reached this print,
    67			 * perhaps you are missing 'msi-map' in DT.
    68			 */
    69			dev_err(dev, "Failed to allocate MSI\n");
    70			kfree(msg);
    71			return -ENOMEM;
    72		}
    73	
    74		for (i = 0; i < num_db; i++)
    75			epf->db_msg[i].virq = msi_get_virq(dev, i);
    76	
    77		return ret;
    78	}
    79	EXPORT_SYMBOL_GPL(pci_epf_alloc_doorbell);
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


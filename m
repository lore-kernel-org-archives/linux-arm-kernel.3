Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C282C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTi6/jLCV7Ksr90FHpUU6H4zYVRnjAdoD6m87iZTo5k=; b=MVdDm7DGw/k7jqUG6dk2EmlIZ1
	/2xyH/i233j0kw4/DF0RM0pCQ1Yi4Mv8nXAs/AxEil82hScAGp3Lp+2jumVzhXwTjWmpuaH7gVIS+
	2zR4SsHg/RQM4FKgrc0L6bPfQVyxiAnFiV8N0JhFvx5hiwj0zGyaAoZj3TdNeUGjV9IgJEMw9tvR/
	dEmCgdTNPvLvEXuyEPYTUba1FTuAGos4kXhohP3nmN5P8M/XqaUGXiYOfnN+rgo5dsGx9UKoyd6Qf
	VrzDpMUGyrevb+QJs/EmAeyfcOjASqd6IjI9S6+3zqZndpoCEfGPYHgcvuFeXnR2CX6IcarKvRRwG
	5Z6Z3t3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgn1k-0000000D9xb-2Wk2;
	Sat, 08 Feb 2025 15:45:52 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgn0L-0000000D9iX-3X98
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 15:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029466; x=1770565466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vedQ/xlv/QU000yE0skGWbHGRgwRxdG2Fa5jS6xm4JQ=;
  b=IBvGWgsypC4EfSphhsZ3fKiTHR0ioou8R3xb7FJaCPVqNTchmLWS16Ts
   /ZEiyDUxK0yIRVT+t5IwLIM/crymQqKVqwnu5+m6u7gZIUUV9s1KzZWe+
   Hs7JN1T2geKvTLd8uCSPfjSjuUDinkQbgdzeGOkTci0aRv8hH1cfd+/dD
   5ej/fnds9P1c52D+lXhQHv7EMvKYvDvYeBGZEeLOAO8BNB8fG+Nr60aAG
   l/GzeMaQxO7V9Ewuyn+OPOL3y0/zIR8V/T0B99DtiBGAlR4AYMboCTJP6
   to8tmJfxx165kw1OpVjmmOyftRLdFiw00B7WU+Xa0Fq8ODBO/eDuWGME6
   g==;
X-CSE-ConnectionGUID: P3o10XbsR6mt9X7EculcWQ==
X-CSE-MsgGUID: 3ZODu6HzQjOloiBwup7P0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50285400"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50285400"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:44:22 -0800
X-CSE-ConnectionGUID: klnNFTy8QHC7aXzvmp2Vfg==
X-CSE-MsgGUID: NYgnIkmqSGaduiX5X8UORA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112682427"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2025 07:44:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgn08-0010Dv-20;
	Sat, 08 Feb 2025 15:44:12 +0000
Date: Sat, 8 Feb 2025 23:43:26 +0800
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
Subject: Re: [PATCH v14 09/15] PCI: endpoint: pci-epf-test: Add doorbell test
 support
Message-ID: <202502082311.G1hWGggF-lkp@intel.com>
References: <20250207-ep-msi-v14-9-9671b136f2b8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-ep-msi-v14-9-9671b136f2b8@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_074425_897710_C75214C3 
X-CRM114-Status: GOOD (  13.62  )
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
patch link:    https://lore.kernel.org/r/20250207-ep-msi-v14-9-9671b136f2b8%40nxp.com
patch subject: [PATCH v14 09/15] PCI: endpoint: pci-epf-test: Add doorbell test support
config: i386-buildonly-randconfig-003-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082311.G1hWGggF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082311.G1hWGggF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082311.G1hWGggF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-test.c: In function 'pci_epf_test_enable_doorbell':
>> drivers/pci/endpoint/functions/pci-epf-test.c:726:42: error: passing argument 4 of 'pci_epf_align_inbound_addr' from incompatible pointer type [-Werror=incompatible-pointer-types]
     726 |                                          &epf_test->db_bar.phys_addr, &offset);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          dma_addr_t * {aka unsigned int *}
   In file included from include/linux/pci-epc.h:12,
                    from drivers/pci/endpoint/functions/pci-epf-test.c:19:
   include/linux/pci-epf.h:245:47: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'dma_addr_t *' {aka 'unsigned int *'}
     245 |                                u64 addr, u64 *base, size_t *off);
         |                                          ~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/pci_epf_align_inbound_addr +726 drivers/pci/endpoint/functions/pci-epf-test.c

   686	
   687	static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
   688						 struct pci_epf_test_reg *reg)
   689	{
   690		struct pci_epf *epf = epf_test->epf;
   691		struct pci_epc *epc = epf->epc;
   692		struct msi_msg *msg;
   693		enum pci_barno bar;
   694		size_t offset;
   695		int ret;
   696	
   697		ret = pci_epf_alloc_doorbell(epf, 1);
   698		if (ret) {
   699			reg->status |= STATUS_DOORBELL_ENABLE_FAIL;
   700			return;
   701		}
   702	
   703		msg = &epf->db_msg[0].msg;
   704		bar = pci_epc_get_next_free_bar(epf_test->epc_features, epf_test->test_reg_bar + 1);
   705		if (bar < BAR_0 || bar == epf_test->test_reg_bar || !epf->db_msg) {
   706			reg->status |= STATUS_DOORBELL_ENABLE_FAIL;
   707			return;
   708		}
   709	
   710		ret = request_irq(epf->db_msg[0].virq, pci_epf_test_doorbell_handler, 0,
   711				  "pci-test-doorbell", epf_test);
   712		if (ret) {
   713			dev_err(&epf->dev,
   714				"Failed to request irq %d, doorbell feature is not supported\n",
   715				epf->db_msg[0].virq);
   716			reg->status |= STATUS_DOORBELL_ENABLE_FAIL;
   717			pci_epf_test_doorbell_cleanup(epf_test);
   718			return;
   719		}
   720	
   721		reg->doorbell_data = msg->data;
   722		reg->doorbell_bar = bar;
   723	
   724		msg = &epf->db_msg[0].msg;
   725		ret = pci_epf_align_inbound_addr(epf, bar, ((u64)msg->address_hi << 32) | msg->address_lo,
 > 726						 &epf_test->db_bar.phys_addr, &offset);
   727	
   728		if (ret) {
   729			reg->status |= STATUS_DOORBELL_ENABLE_FAIL;
   730			pci_epf_test_doorbell_cleanup(epf_test);
   731			return;
   732		}
   733	
   734		reg->doorbell_offset = offset;
   735	
   736		epf_test->db_bar.barno = bar;
   737		epf_test->db_bar.size = epf->bar[bar].size;
   738		epf_test->db_bar.flags = epf->bar[bar].flags;
   739	
   740		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &epf_test->db_bar);
   741		if (ret) {
   742			reg->status |= STATUS_DOORBELL_ENABLE_FAIL;
   743			pci_epf_test_doorbell_cleanup(epf_test);
   744		} else {
   745			reg->status |= STATUS_DOORBELL_ENABLE_SUCCESS;
   746		}
   747	}
   748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


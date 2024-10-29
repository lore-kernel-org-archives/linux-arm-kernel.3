Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1964D3A67A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZZSj0sidP0doxQJ63u9wBiHBhXTLkCydj7TCioxbN0=; b=BORwV8+floRb9xeG2TjQewhvZv
	AmnoQeqOpCnewaAjNk/OFIqWkj/uN77MRWeJqYKIqIuhzV1otrzFJj6QQJUpRiAXtebzgG2ujfNJ3
	gcv5T1UZCeHoZruXsomerLEImEC6lzXGKbkdca83bNv0nz3jzZzSIVBrDFjFSf1FX8zf5CMMkR3rC
	BRtoTnfNajkUnucn/nsMVpeTVPj+zkBwKlUHBdYKiwCstcEwnr1jMuxMU9Ews4m4UtRR5UR+lIh99
	zVQ3cIM5WWNC24nVWgNax2yN5if+UJSG6ZJLQEgL37tJ5c3//E1vIVdgg/5djVh7Ja0NmK0jnKCPV
	YN0QMMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qrS-0000000FTSm-065x;
	Tue, 29 Oct 2024 18:22:34 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qU2-0000000FQeF-4AIb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730224703; x=1761760703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVw5VKSy48THoYBNFE7eeeSMqsWNoLuz0zk0O2YvdHA=;
  b=I1SVEy9ZO0Sl2R4Ut7hdyJwCl8e0oiD3UG/v1wu9JpjVqigM5H1MbV9J
   CFbpLCxqt0JyrhcwMJAE01hU3QOQPpnpQgvz3Jof37iym7Q+HR6ohpsIH
   N/jpzGif9N9qbXJxzh0RInet6tCB5VwIlgD8lKvixX8m70WeZdQYThaeQ
   3bxK3spryFiHEwfx7EXLEQEvdydFiJVHSF4pEcVIaOtQGVzWAnR/jDvUv
   una1bzGZoprupLlHNpeldOZU3Zv1beicH2kPBryXm9e6IgfAgqqjDwBK0
   JHG2HS4/Nh80F3M3r2Ejac3j0adG/HMBqGyY/+leE971pDHKsl6lWVh3Z
   g==;
X-CSE-ConnectionGUID: OZedST4GTEyTLdlvrmQ0KA==
X-CSE-MsgGUID: UMJMDPezS86oNazWAWnyDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17520528"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="17520528"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 10:58:22 -0700
X-CSE-ConnectionGUID: V5K9RZxpTKa1S1OMid/bhQ==
X-CSE-MsgGUID: H3WnrZOzRsOktKUWL/yrQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82466420"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2024 10:58:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5qTx-000dxi-0q;
	Tue, 29 Oct 2024 17:58:17 +0000
Date: Wed, 30 Oct 2024 01:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: alice.guo@oss.nxp.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v2] soc: imx: Add SoC device register for i.MX9
Message-ID: <202410300140.9q3lC7M2-lkp@intel.com>
References: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_105823_095236_E60D91E7 
X-CRM114-Status: GOOD (  13.00  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alice-guo-oss-nxp-com/soc-imx-Add-SoC-device-register-for-i-MX9/20241029-163718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241029083406.3888861-1-alice.guo%40oss.nxp.com
patch subject: [PATCH v2] soc: imx: Add SoC device register for i.MX9
config: i386-buildonly-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300140.9q3lC7M2-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300140.9q3lC7M2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300140.9q3lC7M2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:48:44: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
      48 |                 pr_err("%s: SMC failed: %d\n", __func__, res.a0);
         |                                         ~~               ^~~~~~
         |                                         %lu
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +48 drivers/soc/imx/soc-imx9.c

    17	
    18	static int imx9_soc_device_register(void)
    19	{
    20		struct soc_device_attribute *attr;
    21		struct arm_smccc_res res;
    22		struct soc_device *sdev;
    23		u32 soc_id, rev_major, rev_minor;
    24		u64 uid127_64, uid63_0;
    25		int err;
    26	
    27		attr = kzalloc(sizeof(*attr), GFP_KERNEL);
    28		if (!attr)
    29			return -ENOMEM;
    30	
    31		err = of_property_read_string(of_root, "model", &attr->machine);
    32		if (err) {
    33			pr_err("%s: missing model property: %d\n", __func__, err);
    34			goto attr;
    35		}
    36	
    37		attr->family = kasprintf(GFP_KERNEL, "Freescale i.MX");
    38	
    39		/*
    40		 * Retrieve the soc id, rev & uid info:
    41		 * res.a1[31:16]: soc revision;
    42		 * res.a1[15:0]: soc id;
    43		 * res.a2: uid[127:64];
    44		 * res.a3: uid[63:0];
    45		 */
    46		arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
    47		if (res.a0 != SMCCC_RET_SUCCESS) {
  > 48			pr_err("%s: SMC failed: %d\n", __func__, res.a0);
    49			err = res.a0;
    50			goto family;
    51		}
    52	
    53		soc_id = SOC_ID(res.a1);
    54		rev_major = SOC_REV_MAJOR(res.a1);
    55		rev_minor = SOC_REV_MINOR(res.a1);
    56	
    57		attr->soc_id = kasprintf(GFP_KERNEL, "i.MX%2x", soc_id);
    58		attr->revision = kasprintf(GFP_KERNEL, "%d.%d", rev_major, rev_minor);
    59	
    60		uid127_64 = res.a2;
    61		uid63_0 = res.a3;
    62		attr->serial_number = kasprintf(GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
    63	
    64		sdev = soc_device_register(attr);
    65		if (IS_ERR(sdev)) {
    66			err = PTR_ERR(sdev);
    67			goto soc_id;
    68		}
    69	
    70		return 0;
    71	
    72	soc_id:
    73		kfree(attr->soc_id);
    74		kfree(attr->serial_number);
    75		kfree(attr->revision);
    76	family:
    77		kfree(attr->family);
    78	attr:
    79		kfree(attr);
    80		return err;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


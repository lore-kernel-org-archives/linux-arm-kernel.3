Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F90E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sh5uOcrV5qXqRGHx9HhO+yy8BE7TzRkntx9irU8GVxM=; b=0qsVSfY2eI0O3wRKFNLIkY8Z2n
	SlZ8ftX3vFP9BI05lOwNdCa2WyttkyfEV0L5EITPEtWn7LxlVh70EnJJ3z7RPBiy0np4cmUdDOXMz
	aqZcM7ySMBt1jSA7lFpBEB4p4J1yE3dIzLw6DrBLdL37YzXcaufZWoVTrKgFTAvx7zv9nu1EshlL/
	/HfDX3FnFIqD7jBqRmNhJkbKaEW5YRnKOrd4I9cS+IeAwCkJ98ocWYOGbCEBE9x/bO6S4hSCPOcRN
	vYy06uJrA+5UahvAp8ve9fWlC7qvO4fT1j+Qvt4m/DlEJrpwD3ZGbrI+wW03VODvdvU1yzK0xrbwL
	v0WhnNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInUH-0000000CNAW-30le;
	Wed, 04 Dec 2024 11:24:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInTG-0000000CMvn-3Twr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 11:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733311387; x=1764847387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lm5PIHzRjou6UpwctHmF45CdibJIcEp58ZTJhFUoYJ8=;
  b=mecWWA2cvBK1jW3eDhZ3vvgZm/Y2HjfWgtquZuF7+uMKILtBYFjlktAW
   pc3Kp38hGY1EHGQj3IM6/oXhn0IcG+T9CZ4EcnOu7bJpDwum//0TINSzS
   n47xbxuXbJ12mlk1anFjqP7u+gkClXOtqm1ZpCumBWO/k/oj2120O2Z98
   CvCpo2WvBK7eDT5szNH/5h0UKHIlg2JyuZsB6UFPI5dkBITXZqO97yfuI
   qvQGTgjQ6JgjENqaIz93KYgr46anmlwIi9MozQeBJSUmocgVAUH6Iseu9
   +PxlE5aDoXHoK237hTLV0v6GVrEihNbvSWxpP8H95oLEjSLVNSDCxIQi9
   A==;
X-CSE-ConnectionGUID: 6O2q/N9xQaqrC5tCC9g/CQ==
X-CSE-MsgGUID: 1KmQilEPTM2vT97pHzp7fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="51104507"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="51104507"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 03:23:05 -0800
X-CSE-ConnectionGUID: hNc4TBZaQeKSTPMtboscnw==
X-CSE-MsgGUID: UJSjbqqeSUeL+IVFxnc6Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98726046"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 03:23:03 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tInTA-0002wT-1c;
	Wed, 04 Dec 2024 11:23:00 +0000
Date: Wed, 4 Dec 2024 19:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Benoit <paul@os.amperecomputing.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Paul Benoit <paul@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: smccc: Support optional Arm SMC SOC_ID name
Message-ID: <202412041926.d2p2hcQe-lkp@intel.com>
References: <20241203212854.5565-1-paul@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203212854.5565-1-paul@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_032306_878042_7C88C3D0 
X-CRM114-Status: GOOD (  14.14  )
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

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.13-rc1 next-20241203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Benoit/firmware-smccc-Support-optional-Arm-SMC-SOC_ID-name/20241204-124243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20241203212854.5565-1-paul%40os.amperecomputing.com
patch subject: [PATCH v2] firmware: smccc: Support optional Arm SMC SOC_ID name
config: arm-sp7021_defconfig (https://download.01.org/0day-ci/archive/20241204/202412041926.d2p2hcQe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041926.d2p2hcQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041926.d2p2hcQe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/smccc/soc_id.c: In function 'str_fragment_from_reg':
>> drivers/firmware/smccc/soc_id.c:109:23: warning: right shift count >= width of type [-Wshift-count-overflow]
     109 |         dst[4] = (reg >> 32) & 0xff;
         |                       ^~
   drivers/firmware/smccc/soc_id.c:110:23: warning: right shift count >= width of type [-Wshift-count-overflow]
     110 |         dst[5] = (reg >> 40) & 0xff;
         |                       ^~
   drivers/firmware/smccc/soc_id.c:111:23: warning: right shift count >= width of type [-Wshift-count-overflow]
     111 |         dst[6] = (reg >> 48) & 0xff;
         |                       ^~
   drivers/firmware/smccc/soc_id.c:112:23: warning: right shift count >= width of type [-Wshift-count-overflow]
     112 |         dst[7] = (reg >> 56) & 0xff;
         |                       ^~
   drivers/firmware/smccc/soc_id.c: At top level:
>> drivers/firmware/smccc/soc_id.c:37:29: warning: 'smccc_soc_id_name' defined but not used [-Wunused-variable]
      37 | static char __ro_after_init smccc_soc_id_name[136] = "";
         |                             ^~~~~~~~~~~~~~~~~


vim +109 drivers/firmware/smccc/soc_id.c

    36	
  > 37	static char __ro_after_init smccc_soc_id_name[136] = "";
    38	
    39	static int __init smccc_soc_init(void)
    40	{
    41		int soc_id_rev, soc_id_version;
    42		static char soc_id_str[20], soc_id_rev_str[12];
    43		static char soc_id_jep106_id_str[12];
    44	
    45		if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
    46			return 0;
    47	
    48		soc_id_version = arm_smccc_get_soc_id_version();
    49		if (soc_id_version == SMCCC_RET_NOT_SUPPORTED) {
    50			pr_info("ARCH_SOC_ID not implemented, skipping ....\n");
    51			return 0;
    52		}
    53	
    54		if (soc_id_version < 0) {
    55			pr_err("Invalid SoC Version: %x\n", soc_id_version);
    56			return -EINVAL;
    57		}
    58	
    59		soc_id_rev = arm_smccc_get_soc_id_revision();
    60		if (soc_id_rev < 0) {
    61			pr_err("Invalid SoC Revision: %x\n", soc_id_rev);
    62			return -EINVAL;
    63		}
    64	
    65		soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
    66		if (!soc_dev_attr)
    67			return -ENOMEM;
    68	
    69		sprintf(soc_id_rev_str, "0x%08x", soc_id_rev);
    70		sprintf(soc_id_jep106_id_str, "jep106:%02x%02x",
    71			JEP106_BANK_CONT_CODE(soc_id_version),
    72			JEP106_ID_CODE(soc_id_version));
    73		sprintf(soc_id_str, "%s:%04x", soc_id_jep106_id_str,
    74			IMP_DEF_SOC_ID(soc_id_version));
    75	
    76		soc_dev_attr->soc_id = soc_id_str;
    77		soc_dev_attr->revision = soc_id_rev_str;
    78		soc_dev_attr->family = soc_id_jep106_id_str;
    79		soc_dev_attr->machine = smccc_soc_name_init();
    80	
    81		soc_dev = soc_device_register(soc_dev_attr);
    82		if (IS_ERR(soc_dev)) {
    83			kfree(soc_dev_attr);
    84			return PTR_ERR(soc_dev);
    85		}
    86	
    87		pr_info("ID = %s Revision = %s\n", soc_dev_attr->soc_id,
    88			soc_dev_attr->revision);
    89	
    90		return 0;
    91	}
    92	module_init(smccc_soc_init);
    93	
    94	static void __exit smccc_soc_exit(void)
    95	{
    96		if (soc_dev)
    97			soc_device_unregister(soc_dev);
    98		kfree(soc_dev_attr);
    99	}
   100	module_exit(smccc_soc_exit);
   101	
   102	
   103	static inline void str_fragment_from_reg(char *dst, unsigned long reg)
   104	{
   105		dst[0] = (reg >> 0)  & 0xff;
   106		dst[1] = (reg >> 8)  & 0xff;
   107		dst[2] = (reg >> 16) & 0xff;
   108		dst[3] = (reg >> 24) & 0xff;
 > 109		dst[4] = (reg >> 32) & 0xff;
   110		dst[5] = (reg >> 40) & 0xff;
   111		dst[6] = (reg >> 48) & 0xff;
   112		dst[7] = (reg >> 56) & 0xff;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


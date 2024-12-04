Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8B1E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qziqqVngMjaY+9/zShu2onfvOfqpSizM9fK+JFGii+c=; b=PhCeU2j/LOSO2CX89J9VC6Ea5r
	NawTmSFqYJnN7mIZ0EwHDteGlf9MvLX0j7kkmOwpuw88EKRhjE75gJmWQ1gl4/PJ3YItQMo1fD9Sx
	5K0mKaMs7ARNDu0/obgnSNnaTVY5bi5xyCT5ihyMU9KXzIn2e7tLDTzJhE6j58Rnc4EjVEKz1XZre
	QEjKiq89Xfg0Zej3MsfYDJ/hoxrhvjysN/bcghiNKYyiIhT2KDCkJm8C2Q6k8+Jxgua8PGIZ5ARzi
	ylZLqLVTIPhZw6FicDX22Epi+qx6yY15nz0l0RAOH79SceKHOzP2zp9CD4W6YcXKTJQzDftoHbxrw
	1K/jCdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoUC-0000000CW3g-131U;
	Wed, 04 Dec 2024 12:28:08 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoTB-0000000CVqa-1FBn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 12:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733315226; x=1764851226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9U+1S5c6QBIEs2jEVkouqNjE862gZHRZMYIqjSXUYvA=;
  b=JF+RPbyHJIyOLhmSGAqrRwQPlXKsKvpqygLT22ofdGyCHuE5ar+S/3iK
   hZFozdxsiEmmrqGkpGUAz+TTvQFa/qTDGnK+pdSseKjtP2u8dqo66uNsx
   GhOlu3YFGGuYkqC6OLLCNdoAK0zNNku/UffMQpT6H3MweMWrSpV7iqFL+
   Rh57CFxrIyu8b0Du8V1wFb6Wd2MkNzT0hFFQ2xRfR4k26VI7Bs2GMnGuO
   kFFyDEZeWMnqe/snQ+6gphDGgcz1y25KwaX8WGfDsDsO25XJm+zMnDpZs
   /qhPuAIXH+qJ4rVEnneMW11PioLhUQfXvncj4n6hN7eajZxTMIatIX6zj
   A==;
X-CSE-ConnectionGUID: 6O2fjEd9Ro+LPwMMxw6CSg==
X-CSE-MsgGUID: Iy5yVAreRniWw6+RSCWA+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44954202"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44954202"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 04:27:03 -0800
X-CSE-ConnectionGUID: BQCuPqjHREGCWw4bnGZW4g==
X-CSE-MsgGUID: mll3T9a/QYe7tkeqDGCKDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93614814"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Dec 2024 04:27:00 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIoT3-00030p-35;
	Wed, 04 Dec 2024 12:26:57 +0000
Date: Wed, 4 Dec 2024 20:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Benoit <paul@os.amperecomputing.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paul Benoit <paul@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: smccc: Support optional Arm SMC SOC_ID name
Message-ID: <202412042020.U9EEV8mE-lkp@intel.com>
References: <20241203212854.5565-1-paul@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203212854.5565-1-paul@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_042705_386238_A2DF7140 
X-CRM114-Status: GOOD (  14.20  )
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
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20241204/202412042020.U9EEV8mE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042020.U9EEV8mE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042020.U9EEV8mE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/smccc/soc_id.c:109:16: warning: shift count >= width of type [-Wshift-count-overflow]
     109 |         dst[4] = (reg >> 32) & 0xff;
         |                       ^  ~~
   drivers/firmware/smccc/soc_id.c:110:16: warning: shift count >= width of type [-Wshift-count-overflow]
     110 |         dst[5] = (reg >> 40) & 0xff;
         |                       ^  ~~
   drivers/firmware/smccc/soc_id.c:111:16: warning: shift count >= width of type [-Wshift-count-overflow]
     111 |         dst[6] = (reg >> 48) & 0xff;
         |                       ^  ~~
   drivers/firmware/smccc/soc_id.c:112:16: warning: shift count >= width of type [-Wshift-count-overflow]
     112 |         dst[7] = (reg >> 56) & 0xff;
         |                       ^  ~~
>> drivers/firmware/smccc/soc_id.c:37:29: warning: unused variable 'smccc_soc_id_name' [-Wunused-variable]
      37 | static char __ro_after_init smccc_soc_id_name[136] = "";
         |                             ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/soc_id.c:103:20: warning: unused function 'str_fragment_from_reg' [-Wunused-function]
     103 | static inline void str_fragment_from_reg(char *dst, unsigned long reg)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


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
 > 110		dst[5] = (reg >> 40) & 0xff;
   111		dst[6] = (reg >> 48) & 0xff;
   112		dst[7] = (reg >> 56) & 0xff;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


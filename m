Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DBCD68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 00:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vUkYPQmGdWyhsHPeTV/m26qAF5KIBqBkU+1Jt8IQAk=; b=044Kd1B8o6Dy3SiJcNvzaFj53T
	dFq4DvoPL7hKfXE9pNcrcuAzzBYnVFrkfGGO5dP7gVCfz5ttt4GH8PbWAC5yNihtJC4ThuHAw+mq7
	jhPRv3pbTWKwxfXsapLQbX/UGyQetbOlLvFjih6JsBaRz3QZe5c/pH7BcXK7ptNJRnMBBJmTsDk8Z
	Utkq3KWMbHQQwWayWbS6pDmHTDCCJ4Md+7MbUm4wOIaCyoqM1R1ObJXcG/BXDdn7tfsVMM9XYgQY0
	C/whUg1D0ihFc0pYyOaFAomiwcGY1tqytDfa3ba6LkTdGJW21zWS1X51lCIV/+GRNnX2D4IFJxygc
	aUodsqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCTcQ-00000006doa-1xmI;
	Sun, 17 Nov 2024 00:58:26 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCTbV-00000006dkH-1VqE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 00:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731805050; x=1763341050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5wrsNBo8Hnbij2o1ETYHg7Xe+kl2cGv/S/QTsTULEcw=;
  b=mOO+4uAW3QiJaBNJONuXkKKb8LoMlyd4WQhctyGiMZL9ZCSLXI0l5qME
   o9cSR4SAeh0JLMyLhwmwSHtkfnbP0ljgLRaWURxY/O3xe9IBHcZK+yIV5
   0oFo9AXHSaR3bYyzDP8xdQIL9opabZON1CViTg6tThBf3Ge6Qul68aBap
   ztHwMaoSzxE90cs4J/rlMhLiRUuClpHo1Rhb0NL0hlu1zeJiXeHqpY/6N
   dp/OjvbbArl/ats7hpIsOddwsOg+3gVwbmxY7dCCadP7HWhYXJRVj8PLw
   cRvtd4X8efPuC2PYoXLMbzGrm1hFJ8Yv09nTovQsSSP3g6Nwbm0anMyMN
   g==;
X-CSE-ConnectionGUID: DIKM/RNoR+Wm1v4xJxsgPQ==
X-CSE-MsgGUID: wEyYOJRDSYaF6AIFke7/9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35554505"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="35554505"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 16:57:29 -0800
X-CSE-ConnectionGUID: oONgtneyR4SfW7tr4TIMmA==
X-CSE-MsgGUID: ehnUVlDnSlWqcJdGSl/ksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="119736636"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2024 16:57:26 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCTbP-0001CX-2I;
	Sun, 17 Nov 2024 00:57:23 +0000
Date: Sun, 17 Nov 2024 08:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Benoit <paul@os.amperecomputing.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Paul Benoit <paul@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: smccc: Support optional Arm SMC SOC_ID name
Message-ID: <202411171059.1mPeDZMS-lkp@intel.com>
References: <20241114030452.10149-1-paul@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114030452.10149-1-paul@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_165729_506258_DAC62BD6 
X-CRM114-Status: GOOD (  14.41  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Benoit/firmware-smccc-Support-optional-Arm-SMC-SOC_ID-name/20241114-113039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20241114030452.10149-1-paul%40os.amperecomputing.com
patch subject: [PATCH] firmware: smccc: Support optional Arm SMC SOC_ID name
config: arm-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171059.1mPeDZMS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171059.1mPeDZMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171059.1mPeDZMS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/smccc/smccc.c: In function 'arm_smccc_version_init':
>> drivers/firmware/smccc/smccc.c:26:35: error: storage size of 'regs_1_2' isn't known
      26 |         struct arm_smccc_1_2_regs regs_1_2;
         |                                   ^~~~~~~~
>> drivers/firmware/smccc/smccc.c:50:25: error: implicit declaration of function 'arm_smccc_1_2_smc'; did you mean 'arm_smccc_1_1_smc'? [-Wimplicit-function-declaration]
      50 |                         arm_smccc_1_2_smc(
         |                         ^~~~~~~~~~~~~~~~~
         |                         arm_smccc_1_1_smc
>> drivers/firmware/smccc/smccc.c:26:35: warning: unused variable 'regs_1_2' [-Wunused-variable]
      26 |         struct arm_smccc_1_2_regs regs_1_2;
         |                                   ^~~~~~~~


vim +26 drivers/firmware/smccc/smccc.c

    22	
    23	void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
    24	{
    25		struct arm_smccc_res res;
  > 26		struct arm_smccc_1_2_regs regs_1_2;
    27	
    28		smccc_version = version;
    29		smccc_conduit = conduit;
    30	
    31		smccc_trng_available = smccc_probe_trng();
    32	
    33		if ((smccc_version >= ARM_SMCCC_VERSION_1_2) &&
    34		    (smccc_conduit != SMCCC_CONDUIT_NONE)) {
    35			arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
    36					     ARM_SMCCC_ARCH_SOC_ID, &res);
    37			if ((s32)res.a0 >= 0) {
    38				arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_SOC_ID, 0, &res);
    39				smccc_soc_id_version = (s32)res.a0;
    40				arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_SOC_ID, 1, &res);
    41				smccc_soc_id_revision = (s32)res.a0;
    42	
    43				/* Issue Number 1.6 of the Arm SMC Calling Convention
    44				 * specification introduces an optional "name" string
    45				 * to the ARM_SMCCC_ARCH_SOC_ID function.  Fetch it if
    46				 * available.
    47				 */
    48				regs_1_2.a0 = ARM_SMCCC_ARCH_SOC_ID;
    49				regs_1_2.a1 = 2;	/* SOC_ID name */
  > 50				arm_smccc_1_2_smc(
    51					(const struct arm_smccc_1_2_regs *)&regs_1_2,
    52					(struct arm_smccc_1_2_regs *)&regs_1_2);
    53	
    54				if ((u32)regs_1_2.a0 == 0) {
    55					unsigned long *destination =
    56						(unsigned long *)smccc_soc_id_name;
    57	
    58					/*
    59					 * Copy regs_1_2.a1..regs_1_2.a17 to the
    60					 * smccc_soc_id_name string with consideration
    61					 * to the endianness of the values in a1..a17.
    62					 * As per Issue 1.6 of the Arm SMC Calling
    63					 * Convention, the string will be NUL terminated
    64					 * and padded, from the end of the string to
    65					 * the end of the 136 byte buffer, with NULs.
    66					 */
    67					*destination++ =
    68					    cpu_to_le64p((const __u64 *)&regs_1_2.a1);
    69					*destination++ =
    70					    cpu_to_le64p((const __u64 *)&regs_1_2.a2);
    71					*destination++ =
    72					    cpu_to_le64p((const __u64 *)&regs_1_2.a3);
    73					*destination++ =
    74					    cpu_to_le64p((const __u64 *)&regs_1_2.a4);
    75					*destination++ =
    76					    cpu_to_le64p((const __u64 *)&regs_1_2.a5);
    77					*destination++ =
    78					    cpu_to_le64p((const __u64 *)&regs_1_2.a6);
    79					*destination++ =
    80					    cpu_to_le64p((const __u64 *)&regs_1_2.a7);
    81					*destination++ =
    82					    cpu_to_le64p((const __u64 *)&regs_1_2.a8);
    83					*destination++ =
    84					    cpu_to_le64p((const __u64 *)&regs_1_2.a9);
    85					*destination++ =
    86					    cpu_to_le64p((const __u64 *)&regs_1_2.a10);
    87					*destination++ =
    88					    cpu_to_le64p((const __u64 *)&regs_1_2.a11);
    89					*destination++ =
    90					    cpu_to_le64p((const __u64 *)&regs_1_2.a12);
    91					*destination++ =
    92					    cpu_to_le64p((const __u64 *)&regs_1_2.a13);
    93					*destination++ =
    94					    cpu_to_le64p((const __u64 *)&regs_1_2.a14);
    95					*destination++ =
    96					    cpu_to_le64p((const __u64 *)&regs_1_2.a15);
    97					*destination++ =
    98					    cpu_to_le64p((const __u64 *)&regs_1_2.a16);
    99					*destination++ =
   100					    cpu_to_le64p((const __u64 *)&regs_1_2.a17);
   101				}
   102			}
   103		}
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


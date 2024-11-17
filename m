Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67063D68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 00:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPLKZerUg1ImSXG3BbY2BbW2JjcBtIKQpKRGLpRLADE=; b=cDO39oQxf0NTqwoMrYgdHAG3V9
	T3bHqjmGvWCiG98UMBY0uQVvONYI0zLBYh30p3SLUfoX1v5k8qMhyqKyUUvVf8LDgZI1HGZ0UjEe8
	QTu8orSwWpx8vU+/iYGBDxABat8/CTX6kL0jTQvTVbZagzAHcDY9EW7KT9TUYjkbRPViTpkmcCsV7
	Zk2cKWm9GbETY50OqiQyWWFRf1w68kk9CsGdF4W9FqaKjEuVaSd6A1n8udR5qZS9/SLXcpFE2/tzh
	Dw1uDmrLiRCYNghreYzueIffwRvHSPHuojueaZUDo/Bkh/oibc98viHdqfxykICFaQbnMzuw8nGoA
	aQ4iQRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCSvm-00000006ZK4-0FsL;
	Sun, 17 Nov 2024 00:14:22 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCSuq-00000006ZFw-3kkz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 00:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731802405; x=1763338405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QaDqJE1KqnRAzh9ujtSliP8VY0c2tSGZYyyu+1pMXgM=;
  b=b2Le3tgP1oYo+Aq7RAXKmNFLY/1jJ91bwy0YjsuV+KXiMX9oSzhhm7jY
   Vtz8w0M8+8LJj84K0kcLoWdbUTSiB752d80fdDWT1xJdG/+ZTkmSp7Ag8
   qg0KibqAm8vdvSRBtkLtxW75Sk1nl8OE2NvT6OfRod+l0A2yq69QSFD76
   v5xCJdD8pBKJ6yBe3PUIz14ZSW3fdBYHVmT9R1eEtQA1jVfjF0t6bQysF
   vaXhKX+hSnLNL6bMrLrZvsXMWTE1QBa03/4h06W78WHtKetKFAWTijauL
   UhHewpk2pL0K8QU0C/0aN9S6f/B27lgYJUx8m/phnLSPwVnrmiJ6b0DDG
   g==;
X-CSE-ConnectionGUID: T7L3NSs0S/WOMh/sHclnWw==
X-CSE-MsgGUID: QRl5KFb7ROCDxn3xlMkx7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="32027620"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="32027620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 16:13:25 -0800
X-CSE-ConnectionGUID: q5L/tajgQaGgG+3uVPn/Kg==
X-CSE-MsgGUID: 7WPYFC/bTE6fp0Tr+phwzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89290244"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2024 16:13:22 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCSum-0001BJ-0a;
	Sun, 17 Nov 2024 00:13:20 +0000
Date: Sun, 17 Nov 2024 08:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Benoit <paul@os.amperecomputing.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paul Benoit <paul@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: smccc: Support optional Arm SMC SOC_ID name
Message-ID: <202411170820.t1xuMJVL-lkp@intel.com>
References: <20241114030452.10149-1-paul@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114030452.10149-1-paul@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_161324_944758_34053E85 
X-CRM114-Status: GOOD (  14.33  )
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
config: arm-randconfig-002-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170820.t1xuMJVL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170820.t1xuMJVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170820.t1xuMJVL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:26:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
      26 |         struct arm_smccc_1_2_regs regs_1_2;
         |                                   ^
   drivers/firmware/smccc/smccc.c:26:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
      26 |         struct arm_smccc_1_2_regs regs_1_2;
         |                ^
>> drivers/firmware/smccc/smccc.c:50:4: error: call to undeclared function 'arm_smccc_1_2_smc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      50 |                         arm_smccc_1_2_smc(
         |                         ^
   2 errors generated.


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


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B09BD29C50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr5emfEcfEtizcmwc/bjF2HrmiNyr+RRERkigvrRZ4c=; b=nl7ytvOMgoJUDAkshwGhUW7Oke
	yf8QHBr1U6rdgxXeqnWh2RUrV1rRY06//H/BTySH5ZctBc62Huv1CsMRy5yW1T1jyctRpl1rWZq1D
	eyv0gNxwAHBOTpcBM6LgB7MjRy9eUACc+JN4/nC5Zb0rp7qJhs/147FMBQb7y+mgmIbjofQNizZRV
	A0GwT/nwhWEUXsgmKISUmmD4K8vsTbgrIZtkvW93anXoIe9FMSwiF79394pnxdF6xEaBg4vFzc0V+
	gPnb2o0COoYJFTPO5/1oVXWnmT7Xzk2tlozTfE6NteR5eOTW0WOafyCkiiTwfWUAP6CJeyf2qQWvf
	3TcWJn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuBq-00000002j4X-0ANk;
	Mon, 19 Jan 2026 18:41:26 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuBa-00000002j48-2qfY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768848071; x=1800384071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QcM11rkwgqR54cWMF4Ry5O/lkvAKnGedpOaB4gdmyds=;
  b=j02GKtycVye3eUGXZfc6f1gCQZRjeUWZp5KH9c4z+0GZcvYtNH8EvEB8
   9uQ84XmP1q01C0/wkUYuqHFx+V9dV2u9xtvKpG2yMa54vJ/m8GSZAMzSo
   mi0RnGNKrq8kzUrjoavTR8VlIe2GkeDnUdJ35/C+X2xMX7aZIwjncwS2M
   V7+adItzoSJX13TcnzlsneR/EaNuXLKjc4iMOcLpOZYmGbcfr1muIud3m
   Y/wq2G0RkonM6xVGsFayldiUi7Ba2ADS1LfvoIb85ogy3RDHKTh/5wvFs
   zzNaTF915NBpwG6SEqkFumIIieS5XgxbJkycl3ILizWBIAB0tXeXDqe3e
   w==;
X-CSE-ConnectionGUID: bztjidUoTfeUPyvPJOhLhQ==
X-CSE-MsgGUID: 9KMM277zSDmol/3uyPWRGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87478105"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87478105"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:41:09 -0800
X-CSE-ConnectionGUID: bFoh48EvQxacr/wGvQxdWg==
X-CSE-MsgGUID: n5lUR5CAQburQGzpBCfRqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206280975"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jan 2026 10:41:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhuBS-00000000OBN-3CRR;
	Mon, 19 Jan 2026 18:41:02 +0000
Date: Tue, 20 Jan 2026 02:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Salman Nabi <salman.nabi@arm.com>, vvidwans@nvidia.com,
	andre.przywara@arm.com, sudeep.holla@arm.com, mark.rutland@arm.com,
	lpieralisi@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ardb@kernel.org, chao.gao@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, sdonthineni@nvidia.com,
	vsethi@nvidia.com, vwadekar@nvidia.com
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
Message-ID: <202601200225.cTYuYwRI-lkp@intel.com>
References: <20260119122729.287522-2-salman.nabi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_104110_826356_2EA06BDC 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Salman,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.19-rc6 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Salman-Nabi/firmware-smccc-add-support-for-Live-Firmware-Activation-LFA/20260119-203221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260119122729.287522-2-salman.nabi%40arm.com
patch subject: [PATCH 1/1] firmware: smccc: add support for Live Firmware Activation (LFA)
config: arm-sp7021_defconfig (https://download.01.org/0day-ci/archive/20260120/202601200225.cTYuYwRI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200225.cTYuYwRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200225.cTYuYwRI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/smccc/lfa_fw.c: In function 'get_nr_lfa_components':
>> drivers/firmware/smccc/lfa_fw.c:179:16: error: variable 'reg' has initializer but incomplete type
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:179:43: warning: excess elements in struct initializer
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:179:43: note: (near initialization for 'reg')
>> drivers/firmware/smccc/lfa_fw.c:179:35: error: storage size of 'reg' isn't known
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
>> drivers/firmware/smccc/lfa_fw.c:184:9: error: implicit declaration of function 'arm_smccc_1_2_invoke'; did you mean 'arm_smccc_1_1_invoke'? [-Wimplicit-function-declaration]
     184 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         arm_smccc_1_1_invoke
   drivers/firmware/smccc/lfa_fw.c:179:35: warning: unused variable 'reg' [-Wunused-variable]
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_cancel':
   drivers/firmware/smccc/lfa_fw.c:194:16: error: variable 'reg' has initializer but incomplete type
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:194:43: warning: excess elements in struct initializer
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:194:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:194:35: error: storage size of 'reg' isn't known
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:194:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'call_lfa_activate':
   drivers/firmware/smccc/lfa_fw.c:220:16: error: variable 'reg' has initializer but incomplete type
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:220:43: warning: excess elements in struct initializer
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:220:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:220:35: error: storage size of 'reg' isn't known
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:220:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'prime_fw_image':
   drivers/firmware/smccc/lfa_fw.c:290:16: error: variable 'reg' has initializer but incomplete type
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:290:43: warning: excess elements in struct initializer
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:290:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:290:35: error: storage size of 'reg' isn't known
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:290:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'activation_pending_show':
   drivers/firmware/smccc/lfa_fw.c:360:16: error: variable 'reg' has initializer but incomplete type
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:360:43: warning: excess elements in struct initializer
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:360:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:360:35: error: storage size of 'reg' isn't known
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:360:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'pending_version_show':
   drivers/firmware/smccc/lfa_fw.c:434:16: error: variable 'reg' has initializer but incomplete type
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:434:43: warning: excess elements in struct initializer
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:434:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:434:35: error: storage size of 'reg' isn't known
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:434:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'update_fw_images_tree':
   drivers/firmware/smccc/lfa_fw.c:586:16: error: variable 'reg' has initializer but incomplete type
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:586:43: warning: excess elements in struct initializer
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:586:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:586:35: error: storage size of 'reg' isn't known
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:586:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_init':
   drivers/firmware/smccc/lfa_fw.c:619:16: error: variable 'reg' has initializer but incomplete type
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:619:43: warning: excess elements in struct initializer
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:619:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:619:35: error: storage size of 'reg' isn't known
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:619:35: warning: unused variable 'reg' [-Wunused-variable]


vim +/reg +179 drivers/firmware/smccc/lfa_fw.c

   176	
   177	static unsigned long get_nr_lfa_components(void)
   178	{
 > 179		struct arm_smccc_1_2_regs reg = { 0 };
   180	
   181		reg.a0 = LFA_1_0_FN_GET_INFO;
   182		reg.a1 = 0; /* lfa_info_selector = 0 */
   183	
 > 184		arm_smccc_1_2_invoke(&reg, &reg);
   185		if (reg.a0 != LFA_SUCCESS)
   186			return reg.a0;
   187	
   188		return reg.a1;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


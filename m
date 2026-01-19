Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF6DD29C40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEJs+kG8d7MjZxyP8mypHO1W2O8XDB9lUndZKDt7V1g=; b=RBDnKGEJtdZK7fpsAgaS3nAfc2
	Rk0Caqm3+qk19N6RYi0DOztK6xefJ7TYcTxorzDx7fVS8hF7BWCgfD5EUuNzeN39Ggl+PmJNa8wJX
	kQCqBpQf5BQwlJr4xvrw1M8jGV7afnmM4DxvjD/DmKHUe5gvpgWQIu3CBdp9k0H5ltFZDhkBWd8fU
	ARLtbrDoiJvIZVbMES727r/nHCGSj9jFG91VzW6VYH29YuM29AM9F6g5n3lCOCh5aw2X+mPOSz0b/
	F04IO0+rltXHNvctBpcmdKLpDmj87bNhXJq16LzNNX58OTAfbDedYmKNEl7XcBAcoc88Z77HaexBs
	3JhAPHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8l-00000002UZx-1aZc;
	Mon, 19 Jan 2026 16:30:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8j-00000002UXk-3NTh
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JEJs+kG8d7MjZxyP8mypHO1W2O8XDB9lUndZKDt7V1g=; b=oS2fsO5IjYQNxdqQNRvn1+4VzF
	KLutw1agYAU3hz3sLo6pFGqVOYJEGu9qC32OVKSmC46VTrd+bpGKX4ARKHX+FSpi5zJrPugwIQVA6
	dLUspXgBYg76yfydU6jlrjv8bMJRIcLUVbWRuYCI6flMNPypXMkU7VosK1Mfy4QFTz+GIWcOP3E91
	r2V24PzahUvx9DoV+o9z2hyJ5RyFdAPkFMq9DzTwx1UWl1P/KFmPU5vJTVWEpaCu4jVm7JrOwI/op
	hZQJ3SPX5Vuz3IS7KUqDDphonABJViy0gcnpJwScAJ5P1oD8Rn9KpLhPiW84yWuboims4DhXWvao1
	ozeel3Mg==;
Received: from mgamail.intel.com ([198.175.65.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8f-0000000CWRT-1rmM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768840202; x=1800376202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PQgX3xK9PxUWzI8W+Ln2fHiKBKt9LrU58IY+O/+5QZc=;
  b=Dnf56+Y1lSMVjnb48z1z7Gbg5W5WvXCt+i4eYb7MFR/HoZuVmOo0VZfk
   VqCcCTUnSEwXVzqhKttx7xrD5wEfV55vAlQKFFIR6PR9wkmcXhllJ1Z0N
   SWCaaeS8hM5ZDb3P9r5wX4XVGjvXpkZEu1srd3sOkH7kAq/ZoNrMJFXGk
   UYUlWTpmAAHhQAFnOxAe+u9O6yJomHkiTb43d7W4iYsEOXFV9q5P8i2Gw
   Q8ji6LWSDXVjEg+maxbLCnLjGGSR928mY+qoT55rQd+Q9KTpAzCGlO6Ib
   wsCZXTJKbAKHZUxsbA/5I80DpTYjMR3qvRH2SLHsPd7cMI6fg9nIgeElk
   Q==;
X-CSE-ConnectionGUID: 0aWQLDSmQxCXHQEQMIcHfQ==
X-CSE-MsgGUID: EZedGCg0T22MD+umFT/QTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70026127"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70026127"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:30:00 -0800
X-CSE-ConnectionGUID: DbpoI6/wS8Oar4gvnCOpvA==
X-CSE-MsgGUID: 0K+PNzA7TxGXhkJBCuaHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205809043"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jan 2026 08:29:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhs8X-00000000O2b-2jWL;
	Mon, 19 Jan 2026 16:29:53 +0000
Date: Tue, 20 Jan 2026 00:29:20 +0800
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
Message-ID: <202601200007.GVZIjoCx-lkp@intel.com>
References: <20260119122729.287522-2-salman.nabi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_163001_860660_E83F6619 
X-CRM114-Status: GOOD (  15.40  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Salman-Nabi/firmware-smccc-add-support-for-Live-Firmware-Activation-LFA/20260119-203221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260119122729.287522-2-salman.nabi%40arm.com
patch subject: [PATCH 1/1] firmware: smccc: add support for Live Firmware Activation (LFA)
config: arm-sp7021_defconfig (https://download.01.org/0day-ci/archive/20260120/202601200007.GVZIjoCx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200007.GVZIjoCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200007.GVZIjoCx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/smccc/lfa_fw.c: In function 'get_nr_lfa_components':
   drivers/firmware/smccc/lfa_fw.c:179:16: error: variable 'reg' has initializer but incomplete type
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
>> drivers/firmware/smccc/lfa_fw.c:179:43: warning: excess elements in struct initializer
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:179:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:179:35: error: storage size of 'reg' isn't known
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:184:9: error: implicit declaration of function 'arm_smccc_1_2_invoke'; did you mean 'arm_smccc_1_1_invoke'? [-Wimplicit-function-declaration]
     184 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         arm_smccc_1_1_invoke
>> drivers/firmware/smccc/lfa_fw.c:179:35: warning: unused variable 'reg' [-Wunused-variable]
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


vim +179 drivers/firmware/smccc/lfa_fw.c

   176	
   177	static unsigned long get_nr_lfa_components(void)
   178	{
 > 179		struct arm_smccc_1_2_regs reg = { 0 };
   180	
   181		reg.a0 = LFA_1_0_FN_GET_INFO;
   182		reg.a1 = 0; /* lfa_info_selector = 0 */
   183	
   184		arm_smccc_1_2_invoke(&reg, &reg);
   185		if (reg.a0 != LFA_SUCCESS)
   186			return reg.a0;
   187	
   188		return reg.a1;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


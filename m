Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C80D2ECEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 21:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHGPd6YJF7jj5mxAdaK7bHlwa6dZP2Ce2pKrDk9NAnE=; b=AUvAcph5N9tc3l4ql/rRI6Kon+
	9boOeuY/kvZ5r4zDmmGdAAkhJU9RIYjZah8Ar47MEuDx313QRn5jPjr4Q4r6i0qkWldmwvHjyUzDk
	wOePhbMx8IJKL7vw5B6nOPZVb4Edr2Wu522FN14tsX1ChU2rU2Bn9CJiMHP+W1+36+gt6DVQRqx8r
	5n6cmUS++GMeDmfWLoheJsX4PB90tHJz0KFCJ23JvOdhR0jCgQ3WLS/BH1SoowzaT3+5BKZyHzeoF
	tH18wniZJsj5yiTksWt1xKxaZrSbOPfMIgedLHKJvw0o3VolN/BW2+jfmwNZeIUH4fLv8Sx0hbfxQ
	toGBWFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwvD-00000002uKG-3Qb7;
	Mon, 19 Jan 2026 21:36:29 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwvA-00000002uJt-0Q7H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 21:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768858584; x=1800394584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S69053zsak1P+OIMtzj+DlKHfixButumiqXBgHvfCPc=;
  b=MffgRLvaPYCi0yWmZfcGq7e6cQsQwbx3/ra3w94vDkE3Zqx2ucnG72Du
   Y/EnwZt2JEev5eQHMRCHkvzun7aaOH7prH2ibo8qF2I27ySxNyFDM3QTz
   nCB7P/wUsE63dMDyEAJdZL5pAw3hFKtlJ1zrAvYVT22WhPB0qYf8zP+1t
   IYjJalJb5hFy2MMdVJ8Ntrmia0QQj1//yMElBtBNiS4f50AFn+lUVRTp3
   5DroV2s0ENwjpWqzbRIwIlX72DOn7u2GYAo/R28Qh9MBg+H8cHZK82Rx8
   1oz8WWO3J4FvEHgZjx5iHFlXXoj7nNJx9643vHPGEOAO90QYyPDdH0ciN
   Q==;
X-CSE-ConnectionGUID: 1zG11I/ET06eO9A/km4P/A==
X-CSE-MsgGUID: cXmxtkPRQHWh/Zv6D4JlhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73925434"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="73925434"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 13:36:21 -0800
X-CSE-ConnectionGUID: VUY++yKKRLK+o5q5BOsoQQ==
X-CSE-MsgGUID: TN9LgT8zTzewUbXVCru1mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="228885257"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 13:36:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhwv1-00000000OK5-04mS;
	Mon, 19 Jan 2026 21:36:15 +0000
Date: Tue, 20 Jan 2026 05:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Salman Nabi <salman.nabi@arm.com>, vvidwans@nvidia.com,
	andre.przywara@arm.com, sudeep.holla@arm.com, mark.rutland@arm.com,
	lpieralisi@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ardb@kernel.org,
	chao.gao@intel.com, linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	sdonthineni@nvidia.com, vsethi@nvidia.com, vwadekar@nvidia.com
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
Message-ID: <202601200543.EKFOBfnW-lkp@intel.com>
References: <20260119122729.287522-2-salman.nabi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_133624_238897_D920AFD4 
X-CRM114-Status: GOOD (  14.07  )
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260120/202601200543.EKFOBfnW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200543.EKFOBfnW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200543.EKFOBfnW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/lfa_fw.c:179:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:179:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
>> drivers/firmware/smccc/lfa_fw.c:184:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     184 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   drivers/firmware/smccc/lfa_fw.c:194:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:194:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:198:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     198 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   drivers/firmware/smccc/lfa_fw.c:220:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:220:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:234:3: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     234 |                 arm_smccc_1_2_invoke(&reg, &reg);
         |                 ^
   drivers/firmware/smccc/lfa_fw.c:290:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:290:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:318:3: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     318 |                 arm_smccc_1_2_invoke(&reg, &reg);
         |                 ^
   drivers/firmware/smccc/lfa_fw.c:360:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:360:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:368:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     368 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   drivers/firmware/smccc/lfa_fw.c:434:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:434:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:443:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     443 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   drivers/firmware/smccc/lfa_fw.c:586:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:586:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:600:3: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     600 |                 arm_smccc_1_2_invoke(&reg, &reg);
         |                 ^
   drivers/firmware/smccc/lfa_fw.c:619:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:619:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:623:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     623 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   16 errors generated.


vim +179 drivers/firmware/smccc/lfa_fw.c

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


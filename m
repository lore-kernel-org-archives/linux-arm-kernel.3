Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE97CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 12:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1ozDAuNZYErd9Zt2GCiz06TafVrVUPW7dJGIk/fLSQ=; b=LyloTdpoYf6/D9ER5FNV4zevS+
	KPbexyN+xVbkj3uc7qJdSFJGLKhgMDcUMU1goJzPah+SAW5cDojKs2qeeM1FZoj8fuNglDDQ4DWEZ
	lwhReiDjN1kXisxCCmqI2J7Eg86D5KotGT6MZtTwSTGTCl4fFMIdCmX/n3u4oIt4gAl7Wo/igS7Me
	+aGIpHjLtd860u23Sd1R8z/Jp6oxX+vWF2fhr51RL+PS8nACSLvTquwNOVBWhymXPYym7FOpQaV+b
	vzrPXbvKMSIQIRpth8/zbXlZ0hgj9dkoN33oaTxLP3bsKXWtTCUl3cp7aZP2x/tdZajyjlcHsEgFn
	GIfyO78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA5hu-00000009snR-2SFl;
	Sat, 18 Oct 2025 12:06:46 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA5hr-00000009sn5-2guP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 12:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760789204; x=1792325204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amcyDQ0ZSqfKRHQvB06Ill1m9TP4roTiAJ8m7kuDqWI=;
  b=JNWhNjFUOVWqGvyu6qS84MdvM2CnQk0TJEV5dfvkfOFQvARpDIaP5j35
   XKW7YlMgiTwi58+YYGNTktidqDSwV+fZZyGZMOfOb6aMkC62cgbF55Ya+
   n3LuKd5aoC+DSrtGPBJfYPwdZ2R2IBEFgVRvkxVlQC/LOp23tvM3EEdhg
   gV5C9ONrQC0E3u8e13Xri867SQj1OqcUUqFRCSQdeOdxJ6S4R6oNuENuQ
   fWRbFWt2ZorIud9ygIBtWejcQ3pkROpgPVxUH8JfEHDQvmQtn73ScS78k
   f90QRvnc+SCaue/efTJdJsfxVw7nSvC/ONcG+pXt8Xhp2Lgac1o/uTn4V
   w==;
X-CSE-ConnectionGUID: 7FzhPAuxRUycwDqrFbyjGQ==
X-CSE-MsgGUID: X8OcqQadTQ2gL7diGUaS1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66628837"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="66628837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 05:06:38 -0700
X-CSE-ConnectionGUID: nfs33RDKS5m+TSeTk1j45w==
X-CSE-MsgGUID: 2VrXg+YDTn6HK9yWeDUEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182957412"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2025 05:06:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA5hT-0008Gf-1J;
	Sat, 18 Oct 2025 12:06:25 +0000
Date: Sat, 18 Oct 2025 20:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v4 2/3] pinctrl: cix: Add pin-controller support for sky1
Message-ID: <202510181916.q32y7Jel-lkp@intel.com>
References: <20251017074646.3344924-3-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017074646.3344924-3-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_050643_760672_3B16F14F 
X-CRM114-Status: GOOD (  12.49  )
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

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next robh/for-next linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-pinctrl-Add-cix-sky1-pinctrl/20251017-155001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20251017074646.3344924-3-gary.yang%40cixtech.com
patch subject: [PATCH v4 2/3] pinctrl: cix: Add pin-controller support for sky1
config: nios2-randconfig-r121-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181916.q32y7Jel-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181916.q32y7Jel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181916.q32y7Jel-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse:     got void [noderef] __iomem *
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse:     got unsigned int [usertype] *pin_reg
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse:     got unsigned int [usertype] *pin_reg

vim +289 drivers/pinctrl/cix/pinctrl-sky1-base.c

   282	
   283	static int sky1_pmx_set_one_pin(struct sky1_pinctrl *spctl,
   284					    unsigned int pin, unsigned char muxval)
   285	{
   286		u32 reg_val;
   287		u32 *pin_reg;
   288	
 > 289		pin_reg = spctl->base + pin * SKY1_PIN_SIZE;
 > 290		reg_val = readl(pin_reg);
   291		reg_val &= ~SKY1_MUX_MASK;
   292		reg_val |= muxval << SKY1_MUX_SHIFT;
 > 293		writel(reg_val, pin_reg);
   294	
   295		dev_dbg(spctl->dev, "write: offset 0x%x val 0x%x\n",
   296			pin * SKY1_PIN_SIZE, reg_val);
   297		return 0;
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


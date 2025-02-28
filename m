Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEF1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 01:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RoHJsMyZhDsVatyt4MKbmEUoQtHz9C5xwaEcpfT8NE=; b=GtjoAj1J6g6TncOSgBJ6IqhICD
	hB6l9s+yRlmtMOmi1VB8HBGJkW6uRBURkylHmRWH9OYK0tCPqC+WO/DsjnS0ufn9TkqprWH7VTU/m
	0F9WVQExKmNibPAU93YJpYxOtk4n0y5iYKnJopkIZ1j9rGIhq1bAtZmQnBiVcoRllbIfPA3cDyZmn
	GsMraxD8G5N0xWkp8IeD8+rihGfFs1Qd0A+jz77lPjbUI7EnGmrb4w02w6Q3W52iLwu/Gab/gMUJc
	SA2dAKtNFrWptsABV9KI+DvDi/s6d//ax4+Gn96P5jSWbkIAueGjmEalttP07I3ozapRBj9jQG1Rq
	C1LFmVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpDl-00000009Omk-2jz8;
	Fri, 28 Feb 2025 01:31:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpCC-00000009Ob3-0Xuw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 01:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740706184; x=1772242184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Kaw4aySzXzJh8b//ALxlZ2RwWuBVvZuS4cYdwjBK+4=;
  b=a2O0NGNHBqkT/1w7YxTglt4gOiC1cSir7w8EQ1X5CTFTW1OzblTaVC00
   j5eVzFffEt4LYv1maEN5g1Fx02CJmyTAbfuuS7lTPeMKgtvmhLCEjOsyl
   kkRXbDB4S9JW9M3t8d0ENr2DJYdEfuob0YRSh8dPKPKFVoxolaOXPtBxP
   +fILVH2OpvqQEiJlVjUQWoECrbwjlZfNXWeNT2h10G2pDzOVjc55jPaOr
   wrBI+GThs7Y2mzGZpgE9xFrmSV8C8t1U0hTeQg98Cj9kIxSTMs4UYOaJ2
   rojkwBLRaqV+sex1BdVy/N8rkx5qRoAPtkGxnRGSlpouLaGHOkfaiwj4r
   Q==;
X-CSE-ConnectionGUID: 1YtDJrsRQ4+Vr/bblIluyA==
X-CSE-MsgGUID: cors/OyMQwKPNX/u8ARxzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45275646"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="45275646"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 17:29:41 -0800
X-CSE-ConnectionGUID: tQ2gpyfRQ9adco+P481y1g==
X-CSE-MsgGUID: EFDf9J9jSi+DvFy8QwsOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="148014413"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2025 17:29:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnpBh-000EH4-0H;
	Fri, 28 Feb 2025 01:29:25 +0000
Date: Fri, 28 Feb 2025 09:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org,
	joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <202502280902.U0gLDhve-lkp@intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_172944_208017_BCAE23B0 
X-CRM114-Status: GOOD (  13.43  )
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

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_recover_bus':
>> drivers/i2c/busses/i2c-ast2600.c:345:32: warning: unsigned conversion from 'int' to 'u8' {aka 'unsigned char'} changes value from '-145' to '111' [-Woverflow]
     345 |                         return -ETIMEDOUT;
         |                                ^


vim +345 drivers/i2c/busses/i2c-ast2600.c

   315	
   316	static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
   317	{
   318		u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   319		int ret = 0;
   320		u32 ctrl;
   321		int r;
   322	
   323		dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr, state);
   324	
   325		ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   326	
   327		/* Disable controller */
   328		writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
   329		       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   330	
   331		writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) | AST2600_I2CC_MASTER_EN,
   332		       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   333	
   334		reinit_completion(&i2c_bus->cmd_complete);
   335		i2c_bus->cmd_err = 0;
   336	
   337		/* Check 0x14's SDA and SCL status */
   338		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   339		if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
   340			writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   341			r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
   342			if (r == 0) {
   343				dev_dbg(i2c_bus->dev, "recovery timed out\n");
   344				writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
 > 345				return -ETIMEDOUT;
   346			} else if (i2c_bus->cmd_err) {
   347				dev_dbg(i2c_bus->dev, "recovery error\n");
   348				ret = -EPROTO;
   349			}
   350		}
   351	
   352		/* Recovery done */
   353		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   354		if (state & AST2600_I2CC_BUS_BUSY_STS) {
   355			dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
   356			ret = -EPROTO;
   357		}
   358	
   359		/* restore original controller setting */
   360		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


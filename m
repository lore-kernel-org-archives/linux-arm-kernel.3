Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2FED32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHIsjMmR19N9M3XTMSAa8RhRKtOC7WKnyUOzbsiTYyY=; b=g4vBV+CeXkm93UPvZHief6GduT
	ZfFfGYaj84FP2GgfJzzwvozcpC1GUFKPM5fOYVsCgzAjmKkKlOfILR4YMhtX0r5g1IU2Gb0kbcJ1d
	oo7U1LH8ZnAp34OH7CqTLMckcZCrzDZWt8FTbYQv3jf+G2IpMVELl73INtfZLyyj5zAlLe9O4OFej
	4jO1n3r3Yj2ODOMVP8TPw7EvIuda60j7lpuCgpbRoOsUdPSsUOgX3p9/35VNLZjRwttpzGyUGfxyH
	i9ZkmDH4oKEIb3GNuBJleo6gjHFUpp2DOOMwKf3SRwF5nAGGFb/kf2MRF/PpxO9/dLico8i883ZR6
	Hcx1UxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApkM-00000003LyF-3HFs;
	Tue, 12 Nov 2024 12:11:50 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAp8d-00000003Eml-37HA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731411171; x=1762947171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s1MMLAUMQokmBMbhHIrOW9+sDvlm3omQqaMlvypFfmk=;
  b=fbri2rXMJ35l0xksZIAGedM4jnEGZixO3qCSyz4UoZwPYGLSXXDkeceB
   oba5F+aj8qYNM+8zcothp2Y955xNbILxesQJl9U5yhCQaYM8DUpWyEqaq
   A8seL+HSCIWiHSWjpKfX0IbPAh1IembHCz8Xse9frLKpbTUPzEJHqbff6
   X4Pjb2TiwU+giSMaTH0SpsQYnG7fttCB9hS3Pw9AVyd1jM0Fz32fhSrIx
   UXTN4BsXg/LHm8qwfRj41LuM7I2KjXZtn/RykmLCPGDUT66VcLOr2791z
   tsZNDEEwIXdGKP3XCad2rT5PdG7AjKNPxtU6gGx+qtdhV7+qZJ6w+QYlM
   Q==;
X-CSE-ConnectionGUID: kzZQWS9HQ2uIJI8DIcpG1A==
X-CSE-MsgGUID: cw6QF7yhQ1GcfL/zlZhQCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48694726"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48694726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:32:46 -0800
X-CSE-ConnectionGUID: OJB+M98WTpi6RipGJ2YXRg==
X-CSE-MsgGUID: Lw+93KzATU+xQv14PnmTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87577105"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 03:32:42 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAp8S-0001Df-1p;
	Tue, 12 Nov 2024 11:32:40 +0000
Date: Tue, 12 Nov 2024 19:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: mjchen <mjchen0829@gmail.com>, dmitry.torokhov@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202411121938.AoeMusUF-lkp@intel.com>
References: <20241112053059.3361-3-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112053059.3361-3-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_033251_854571_C4D12E30 
X-CRM114-Status: GOOD (  15.02  )
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

Hi mjchen,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus robh/for-next soc/for-next linus/master v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mjchen/dt-bindings-input-Add-Nuvoton-MA35D1-keypad/20241112-133327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20241112053059.3361-3-mjchen0829%40gmail.com
patch subject: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411121938.AoeMusUF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121938.AoeMusUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121938.AoeMusUF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/keyboard/ma35d1_keypad.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/input/keyboard/ma35d1_keypad.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/input/keyboard/ma35d1_keypad.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/input/keyboard/ma35d1_keypad.c:83:46: warning: shift count >= width of type [-Wshift-count-overflow]
      83 |         pressed_keys  = key_event[0] | key_event[1] << 32;
         |                                                     ^  ~~
   drivers/input/keyboard/ma35d1_keypad.c:84:46: warning: shift count >= width of type [-Wshift-count-overflow]
      84 |         released_keys = key_event[2] | key_event[3] << 32;
         |                                                     ^  ~~
>> drivers/input/keyboard/ma35d1_keypad.c:130:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
         |                ^
   8 warnings and 1 error generated.


vim +/FIELD_PREP +130 drivers/input/keyboard/ma35d1_keypad.c

   123	
   124	static int ma35d1_keypad_open(struct input_dev *dev)
   125	{
   126		struct ma35d1_keypad *keypad = input_get_drvdata(dev);
   127		unsigned int val, config;
   128	
   129		val = RKINTEN | PKINTEN | INTEN | ENKP;
 > 130		val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
   131	
   132		if (keypad->debounce_val > 0)
   133			config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1)) |
   134				 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
   135		else
   136			config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1));
   137	
   138		val |= config;
   139	
   140		writel(val, keypad->mmio_base + KPI_CONF);
   141		writel((keypad->pre_scale_divider - 1),	keypad->mmio_base + KPI_PRESCALDIV);
   142	
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


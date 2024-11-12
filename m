Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53E0D42B9B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GoP7mpmir7zoRe4GvAX4upnckdMmn2VdiAfqd2UHP4=; b=JXJ3MUplIPlZr4d2rSMcFBNFzz
	yY4CIcR0MwHqj2f8EOlzeUhZFuBIUpnQNTNJ4TdV70TonOnXmoSB+5/ywYH3sv32LiDGDt5uAmi65
	PHFK3hJHc6b1kM5XgPHrCP0BY3W4eDBTK93I7RDP7XhS9xcpRAUAZlhoXJWABjVen7zilxXxj1NBp
	yXNiJIDPyBeS/fPOrYzmizYv18pdwwk37IdE47JDLcwzF8g0YxRMYzPZZYhxKMx6XIEL4tUWJ0bRL
	e5RvzRQUCZHrpdO1VNOHX8jevjaTyTaal7g0FFWBIpyfYMsyeXslfwmF1KS4SFo6Vntn0pRENTjRi
	iN3bantA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAslZ-00000003wsk-2RMO;
	Tue, 12 Nov 2024 15:25:17 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsjl-00000003wag-18Fw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731425005; x=1762961005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZmGj6kivjIzqiKqxOJZckDsly2u9MG2i7lK+kggaPuk=;
  b=OEZkoJIoFl3aRkjyZwt3K6H9PBsCTl57+oqySU/3jECFrYmFlU20BYhK
   OR8TC31YWWp6+RgkcIwqlCY9fo5QlXJjWzktprpF4N8qCuJEsL6JV7hFc
   qreBUp+Xno7gk398Hp9bNTUG9rQI20WkIA6eV4ImPBeiyKOeRYZbZ5LHb
   heR8oEjS9WLmCEBWkCKbTKAbRV5ymBKi56jwiNbsNyoS1WZcUH7VyFFof
   U7bV4DF4zX2XnPHpOUXInPBXrcg251wD3d86bXK2uHATkwPLlxdfZ3gN9
   /fzair6wfwvVfOxXzEawb7xiea5DdMCCywe7PqC6x9etUtvI8sXesomve
   Q==;
X-CSE-ConnectionGUID: HvjFpITxSoWj/NziE9avYA==
X-CSE-MsgGUID: HUe/vK4eRg+hYl5uPpChKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18875201"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="18875201"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:23:25 -0800
X-CSE-ConnectionGUID: 2TDWEbCQS8Wpe20GYEZoBw==
X-CSE-MsgGUID: L5YTJwh1R5W+IzvL53fAUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87477543"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2024 07:23:21 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAsje-0001Sv-2P;
	Tue, 12 Nov 2024 15:23:18 +0000
Date: Tue, 12 Nov 2024 23:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: mjchen <mjchen0829@gmail.com>, dmitry.torokhov@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202411122236.79vmA2JS-lkp@intel.com>
References: <20241112053059.3361-3-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112053059.3361-3-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_072325_351227_30667410 
X-CRM114-Status: GOOD (  15.39  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next soc/for-next linus/master v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mjchen/dt-bindings-input-Add-Nuvoton-MA35D1-keypad/20241112-133327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20241112053059.3361-3-mjchen0829%40gmail.com
patch subject: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241112/202411122236.79vmA2JS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122236.79vmA2JS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122236.79vmA2JS-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/input/keyboard/ma35d1_keypad.c:83:46: warning: shift count >= width of type [-Wshift-count-overflow]
      83 |         pressed_keys  = key_event[0] | key_event[1] << 32;
         |                                                     ^  ~~
   drivers/input/keyboard/ma35d1_keypad.c:84:46: warning: shift count >= width of type [-Wshift-count-overflow]
      84 |         released_keys = key_event[2] | key_event[3] << 32;
         |                                                     ^  ~~
   drivers/input/keyboard/ma35d1_keypad.c:130:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
         |                ^
   8 warnings and 1 error generated.


vim +83 drivers/input/keyboard/ma35d1_keypad.c

    59	
    60	static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad, unsigned int status)
    61	{
    62		struct input_dev *input_dev = keypad->input_dev;
    63		unsigned int code;
    64		unsigned int key;
    65		unsigned long pressed_keys = 0, released_keys = 0;
    66		unsigned int row_shift = get_count_order(keypad->kpi_col);
    67		unsigned short *keymap = input_dev->keycode;
    68		unsigned long key_event[4];
    69		unsigned int index;
    70	
    71		/* Read key event status */
    72		key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
    73		key_event[1] = readl(keypad->mmio_base + KPI_KPE1);
    74		key_event[2] = readl(keypad->mmio_base + KPI_KRE0);
    75		key_event[3] = readl(keypad->mmio_base + KPI_KRE1);
    76	
    77		/* Clear key event status */
    78		writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
    79		writel(key_event[1], (keypad->mmio_base + KPI_KPE1));
    80		writel(key_event[2], (keypad->mmio_base + KPI_KRE0));
    81		writel(key_event[3], (keypad->mmio_base + KPI_KRE1));
    82	
  > 83		pressed_keys  = key_event[0] | key_event[1] << 32;
    84		released_keys = key_event[2] | key_event[3] << 32;
    85	
    86		/* Process pressed keys */
    87		for_each_set_bit(index, &pressed_keys, KEY_EVENT_BITS) {
    88			code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
    89			key = keymap[code];
    90	
    91			input_event(input_dev, EV_MSC, MSC_SCAN, code);
    92			input_report_key(input_dev, key, 1);
    93		}
    94	
    95		/* Process released keys */
    96		for_each_set_bit(index, &released_keys, KEY_EVENT_BITS) {
    97			code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
    98			key = keymap[code];
    99	
   100			input_event(input_dev, EV_MSC, MSC_SCAN, code);
   101			input_report_key(input_dev, key, 0);
   102		}
   103	
   104		input_sync(input_dev);
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


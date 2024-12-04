Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109EEE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5z9RnChKryCrKZ5xt8L+fSwsom/wy73EmVF7Vz33ul8=; b=euEUPgTp0dRORf+dhDEH5ef3ex
	Y+iMvxJPXB3bZyzpagMLzPDm780dX3FYaK0/4+AQKVoheDDzmB3ncBovS/C5zDzAl8Ri+eODGBdgs
	m8BKTHvF2OPxMIJtR8g0A9q18vIi9uy2Me7jI1JqMG78NkWWNQaae6HbVKrFj2F6DED1JL8gBCT1B
	/x1CoMj4nmLVDDvwZcXH1xa6j2lkgVh+rNV+8Zlx8/B7dhHP/GclcKvyMuIKlKcTozFmFGzHf03u9
	R3lsvClIWrRcrkDE/G+KqpAkk1iodLc8BpdMUEoa726iSzZnHmIql1M36hh5E67UvTQoE2qbRjr3T
	M1HaGVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIt2j-0000000DL37-2mxt;
	Wed, 04 Dec 2024 17:20:05 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsx0-0000000DJW1-3wpq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 17:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733332450; x=1764868450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T11iJzjX9vhpO8MRlSolJbG6EMQMPdcnGxRx1r7tIio=;
  b=PSFkghPzHyByrPane0yfa2jDrYRkbqtIypI1RDtU0tNT2ptfzBkLOmms
   TVan89mx+7BjElqf273lpeNzTn53RjbapfrrCGzYABbOKknB/dLm5fRC1
   y1j8c5aMvNZ9TNK5zUz4Q69079vruqRdECGIR1blBIKtqegSC3h1CYSvp
   DXZB5HlQxCcqcoaThhnfB8dyYmB5Ke+nlYOM6LUARZlUyXcTuYkeKCJSW
   ZYbI7LLZoiUect/8NkK/6oauFJFsVW8SOEUMdn0SMCwtOUL+BazgZmIuz
   2riNYh59kcHrDhyTa/ZbEgMv676Wwjxb8g/j/2FoRyH41tNzdtFF+L2pN
   Q==;
X-CSE-ConnectionGUID: 7MyRB1wATLKab6uV88RyKw==
X-CSE-MsgGUID: BDUeDjq9TiiqW7sp3QoxWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33740158"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33740158"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 09:14:08 -0800
X-CSE-ConnectionGUID: x8sYC6H4Qi6SJ44mNX5BEw==
X-CSE-MsgGUID: QQmmU4T7T5e817uTO49iCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="94012859"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2024 09:14:04 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIsws-0003KL-2C;
	Wed, 04 Dec 2024 17:14:02 +0000
Date: Thu, 5 Dec 2024 01:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ming-Jen Chen <mjchen0829@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202412050142.nkbl6PnK-lkp@intel.com>
References: <20241204021014.5083-2-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204021014.5083-2-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_091411_039004_24FB16F6 
X-CRM114-Status: GOOD (  15.61  )
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

Hi Ming-Jen,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus hid/for-next soc/for-next linus/master v6.13-rc1 next-20241203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Jen-Chen/input-keypad-add-new-keypad-driver-for-MA35D1/20241204-123001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20241204021014.5083-2-mjchen0829%40gmail.com
patch subject: [PATCH v4 1/2] input: keypad: add new keypad driver for MA35D1
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241205/202412050142.nkbl6PnK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050142.nkbl6PnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050142.nkbl6PnK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/keyboard/ma35d1_keypad.c:9:
   In file included from include/linux/input.h:19:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/keyboard/ma35d1_keypad.c:83:17: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
         |                        ^
   drivers/input/keyboard/ma35d1_keypad.c:89:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      89 |         writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
         |         ^
   drivers/input/keyboard/ma35d1_keypad.c:123:12: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     123 |         kstatus = readl(keypad->mmio_base + KPI_STATUS);
         |                   ^
   drivers/input/keyboard/ma35d1_keypad.c:129:4: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |                         writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
         |                         ^
   drivers/input/keyboard/ma35d1_keypad.c:148:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     148 |         writel(val, keypad->mmio_base + KPI_CONF);
         |         ^
   drivers/input/keyboard/ma35d1_keypad.c:159:8: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     159 |         val = readl(keypad->mmio_base + KPI_KPE0) & ~ENKP;
         |               ^
   drivers/input/keyboard/ma35d1_keypad.c:160:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     160 |         writel(val, keypad->mmio_base + KPI_CONF);
         |         ^
   drivers/input/keyboard/ma35d1_keypad.c:166:17: warning: array index 12 is past the end of the array (that has type 'const unsigned int[12]') [-Warray-bounds]
     166 |         u32 min_diff = debounce_values[NUM_SETTINGS];
         |                        ^               ~~~~~~~~~~~~
   drivers/input/keyboard/ma35d1_keypad.c:53:1: note: array 'debounce_values' declared here
      53 | static const unsigned int debounce_values[NUM_SETTINGS] = {
         | ^
   drivers/input/keyboard/ma35d1_keypad.c:173:25: warning: array index 12 is past the end of the array (that has type 'const unsigned int[12]') [-Warray-bounds]
     173 |         keypad->debounce_val = debounce_register[NUM_SETTINGS];
         |                                ^                 ~~~~~~~~~~~~
   drivers/input/keyboard/ma35d1_keypad.c:57:1: note: array 'debounce_register' declared here
      57 | static const unsigned int debounce_register[NUM_SETTINGS] = {
         | ^
   drivers/input/keyboard/ma35d1_keypad.c:349:3: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     349 |                 writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
         |                 ^
   drivers/input/keyboard/ma35d1_keypad.c:349:10: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     349 |                 writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
         |                        ^
   drivers/input/keyboard/ma35d1_keypad.c:359:3: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |                 writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
         |                 ^
   drivers/input/keyboard/ma35d1_keypad.c:359:10: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |                 writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
         |                        ^
   6 warnings and 11 errors generated.


vim +/readl +83 drivers/input/keyboard/ma35d1_keypad.c

    72	
    73	static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad, unsigned int status)
    74	{
    75		struct input_dev *input_dev = keypad->input_dev;
    76		u32 row_shift = get_count_order(keypad->kpi_col);
    77		u32 *keymap = input_dev->keycode;
    78		u32 code, key, index;
    79		u32 key_event[4];
    80		u64 pressed_keys = 0, released_keys = 0;
    81	
    82		/* Read key event status */
  > 83		key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
    84		key_event[1] = readl(keypad->mmio_base + KPI_KPE1);
    85		key_event[2] = readl(keypad->mmio_base + KPI_KRE0);
    86		key_event[3] = readl(keypad->mmio_base + KPI_KRE1);
    87	
    88		/* Clear key event status */
    89		writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
    90		writel(key_event[1], (keypad->mmio_base + KPI_KPE1));
    91		writel(key_event[2], (keypad->mmio_base + KPI_KRE0));
    92		writel(key_event[3], (keypad->mmio_base + KPI_KRE1));
    93	
    94		pressed_keys  = key_event[0] | ((u64)key_event[1] << 32);
    95		released_keys = key_event[2] | ((u64)key_event[3] << 32);
    96	
    97		/* Process pressed keys */
    98		for_each_set_bit(index, (const unsigned long *)&pressed_keys, KEY_EVENT_BITS) {
    99			code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
   100			key = keymap[code];
   101	
   102			input_event(input_dev, EV_MSC, MSC_SCAN, code);
   103			input_report_key(input_dev, key, 1);
   104		}
   105	
   106		/* Process released keys */
   107		for_each_set_bit(index, (const unsigned long *)&released_keys, KEY_EVENT_BITS) {
   108			code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
   109			key = keymap[code];
   110	
   111			input_event(input_dev, EV_MSC, MSC_SCAN, code);
   112			input_report_key(input_dev, key, 0);
   113		}
   114	
   115		input_sync(input_dev);
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


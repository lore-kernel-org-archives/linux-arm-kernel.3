Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53165D32D82
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q3RGllgxxy/FNlxLuEgjDrcTwpSkX4/oyXR1Yk+Hc4=; b=bSDlqb+YIMkcinbeDg64LqZ6Xr
	dqz7Ob2wbJZXKnmWt9HDMyMNw/DTkhFXSjYBtBREApndoXEhW8+4esvdIQxH+UGh7vANjMURI/0kE
	EfhIjLz59Qm2JWttgeZOm0Va6dk15wQ2PSO7EjwhezkPj4kqQL5UlrueYPkT/YR91p3nC2B8ciqWc
	Gt/WMwWn5m/5IzYmS/s45GZTqdXyTjx7ko1LenQHbBQuPr7NAA5JizCxlYaZyP1HmZszFpsW7cLf4
	r4L6BQuAfU+w5CmRQRsrZlskc8pT1HxsJkFu5o1tGo9xgg1H3L3v2ROAdmvzhVrcyr8JVDomOw0Hx
	DHiVDYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAngx-00000002xPM-2jrt;
	Tue, 12 Nov 2024 10:00:11 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnf9-00000002x3u-0zSC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731405499; x=1762941499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T1svJdA2RSCktG62BP7iuMSDRBK2CKeXOkbU+hwo0uU=;
  b=MQ0tGBtXrccr0jWt2BJT667AIZvGEA+PMKuuLaKA+tmuGVbPBxsEEy8l
   esJKbX+I63g7F26ubAXJZ6kXh10TeaTuWt1g58DGn/nljfTUy05GGO6hF
   q3hAFGhBEAM/DXuxNBV4gbja+nv3gFcu1USgDigGzquVwoRGT+OGoSZn5
   t4gerUod/KximClTR4m4+ufMmNdmIsIuDmCBeDGGyoVDnjhaK1xevsGS0
   O0ZPBe1uvLTM4cAPKYuAaQusJqaDlVOG9tmN/TiCN0g2jLZS9cOSM+BRm
   TDvgYIcwXJ6T5aMesJhzUspAKHZ42p5sRiUuye3Cg0y3P2pPS3q9E9Xg1
   A==;
X-CSE-ConnectionGUID: 4F3E1avmQZS/w96tyBr3yQ==
X-CSE-MsgGUID: YxgsxCbWTyaQ4qAZHY4pmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31086984"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31086984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:58:17 -0800
X-CSE-ConnectionGUID: FaS6+EqdRNe8kc0FYh0DbA==
X-CSE-MsgGUID: iVSSNiulTDuEulpxbAozzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87788734"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2024 01:58:12 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnf0-0000gv-02;
	Tue, 12 Nov 2024 09:58:10 +0000
Date: Tue, 12 Nov 2024 17:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: mjchen <mjchen0829@gmail.com>, dmitry.torokhov@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202411121749.9xapQvza-lkp@intel.com>
References: <20241112053059.3361-3-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112053059.3361-3-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_015819_347700_B2A3283E 
X-CRM114-Status: GOOD (  16.50  )
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411121749.9xapQvza-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121749.9xapQvza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121749.9xapQvza-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/input/keyboard/ma35d1_keypad.c: In function 'ma35d1_keypad_scan_matrix':
>> drivers/input/keyboard/ma35d1_keypad.c:83:53: warning: left shift count >= width of type [-Wshift-count-overflow]
      83 |         pressed_keys  = key_event[0] | key_event[1] << 32;
         |                                                     ^~
   drivers/input/keyboard/ma35d1_keypad.c:84:53: warning: left shift count >= width of type [-Wshift-count-overflow]
      84 |         released_keys = key_event[2] | key_event[3] << 32;
         |                                                     ^~
   drivers/input/keyboard/ma35d1_keypad.c: In function 'ma35d1_keypad_open':
>> drivers/input/keyboard/ma35d1_keypad.c:130:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     130 |         val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
         |                ^~~~~~~~~~


vim +/FIELD_PREP +130 drivers/input/keyboard/ma35d1_keypad.c

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
   107	static irqreturn_t ma35d1_keypad_interrupt(int irq, void *dev_id)
   108	{
   109		struct ma35d1_keypad *keypad = dev_id;
   110		unsigned int  kstatus;
   111	
   112		kstatus = readl(keypad->mmio_base + KPI_STATUS);
   113	
   114		if (kstatus & (PKEY_INT | RKEY_INT)) {
   115			ma35d1_keypad_scan_matrix(keypad, kstatus);
   116		} else {
   117			if (kstatus & PDWAKE)
   118				writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
   119		}
   120	
   121		return IRQ_HANDLED;
   122	}
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


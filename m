Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96079E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1es0c/MSVgX9oVPQoWiRJAvPovnhoueN4tFdvc1EZnk=; b=rq+7lDmSFs9QCmrdYzba3FlQvO
	2b4yTrbSOntuAAkY5lGCloCA1m7/F8d3F5Y6WylQR6yZRzU7LgVl1A/LKSxtIw2WCdgelDC0rmCrW
	YBfJDKdnrUmvX2aW8xgF8RLt3qvD8lfrzTf6FGDkt7DZiZvknmczBbIJLi5epUErKP0EpbKx29HbX
	0p46+KQ4qqcqIR0ZymN9AwCVn1Q75PfPtchkQLqsynIgjTpXDWEdOaZU9ilnPpZmplPDEhYr9m1Cn
	ZBvYRnbnuX0M39Mfwyv9P+UYq1Dc5r790gxSlr3M2v0/KPMcf0zMvm7RAo7rG39tk1IjPGT5IcfTq
	08tIlvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqhZ-0000000CtMu-3Jt4;
	Wed, 04 Dec 2024 14:50:05 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqgY-0000000CtAd-3wKg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733323743; x=1764859743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f3vtN1u5WBFqe7Z+wdQv6YdkOLXhLcLZNvoW4Nv5FkI=;
  b=PrHQWO88vuvBIF0nTZlweFx9B9aNaKXXo+8dLqvMfsoJhSgPivVI7IOx
   M0vwSAqNvbt17SExdDI7bvA4axusPadXojtxtCp3J5ed8u15HWwxmD3H4
   f7hFYLKkaaUT7R1YrUIIZMVUAoA43cGznQLDNoDxydd6puYMgnshK37ec
   qMRv6UzSd9wXk79zwQp1woeewaMFlyer2jCNtNXLwG3eZx3ryRL8c+ZGy
   EXYZyEWfHaP6d8AwKqXXakxNAI1o7Hd/DPUU93bxuGV1SkBEt9KSrbjfG
   vE3a4yjT3LeGP4QLRYz4AdnJ/QBEjvV8RzBGLpliqlwsTKpnrvMmct/tK
   Q==;
X-CSE-ConnectionGUID: MDp5ptFJRhmWxDFFSBCXCQ==
X-CSE-MsgGUID: eRwZ6sVAQBW4wivf0G4N3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="36436396"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="36436396"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:49:02 -0800
X-CSE-ConnectionGUID: dcVWHyIOSUqKjoi5sxDWTA==
X-CSE-MsgGUID: 7l9lL/7nT7SoVdN1u8A6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94614100"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 06:48:58 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIqgR-00038r-32;
	Wed, 04 Dec 2024 14:48:55 +0000
Date: Wed, 4 Dec 2024 22:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ming-Jen Chen <mjchen0829@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <202412042245.5jwzbfGS-lkp@intel.com>
References: <20241204021014.5083-2-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204021014.5083-2-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_064902_986745_43A7ADEF 
X-CRM114-Status: GOOD (  13.91  )
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241204/202412042245.5jwzbfGS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042245.5jwzbfGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042245.5jwzbfGS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/keyboard/ma35d1_keypad.c: In function 'ma35d1_keypad_scan_matrix':
   drivers/input/keyboard/ma35d1_keypad.c:83:24: error: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
      83 |         key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
         |                        ^~~~~
>> drivers/input/keyboard/ma35d1_keypad.c:89:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
      89 |         writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
         |         ^~~~~~


vim +/writel +89 drivers/input/keyboard/ma35d1_keypad.c

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
    83		key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
    84		key_event[1] = readl(keypad->mmio_base + KPI_KPE1);
    85		key_event[2] = readl(keypad->mmio_base + KPI_KRE0);
    86		key_event[3] = readl(keypad->mmio_base + KPI_KRE1);
    87	
    88		/* Clear key event status */
  > 89		writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
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


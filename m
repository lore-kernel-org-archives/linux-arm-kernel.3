Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA72C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LoSsv7PGE0rE+TxVyvPWr0U8T8T62BQ4l9wwnaXPeWk=; b=b0siXGenCFwzIqRCZJTTidVxDm
	F1KnSLcnrGSk3rncZNoLxPSmZEdCWHZ/Nabm4EQtHAwYCP2R39TI+0Pa/pX9FNk6TAH78OzXjBzNm
	bWkQmAqlY4M0abiJncLODYI+LX2DPCTSa8ytwj8oCZ4UlxKf2aAapw9qFMLiDr0LrOkbXZO4UTUow
	0qrbe5IeYpIxf1/h9j9X5kZgr3IJXTDYj8XQlbRSrKpCPUzSjkW2tSV+D5cQz49yjHW2N8zFWOzT+
	6wrjySKqtX9xDwKJRCPvflCyUZsv16JFJ8WQMSJ/pPt4OHIAZP3AnU+M4EUvd/MfGMKG3pdX5fU+m
	S2uLtYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgsM-000000052ss-3BUC;
	Sun, 16 Aug 2026 19:50:34 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgsK-000000052sZ-31N2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 19:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786909833; x=1818445833;
  h=date:from:to:cc:subject:message-id;
  bh=cKALu4FejD7U5lvKIhp6rgstfPb27XhvCThRIOKSjJg=;
  b=kO91IyOTdmIXrH/4avnVVS+JZ/klmedqjps3v6tezG3YQ1nptjWo44N9
   Y82dRnBlzvB0IFoDYdwT1hGwsBXZyhf+6YlTiPTM2iIsuXdHHCEPcSXBv
   9vejOXJl+oVe01ga5LE/+uQ3RZsyhe0veX8dlUq8mH63iZqGUbivpVEsQ
   bs7PPpc06rC/QZA/JpfHXlNUIDbszk3K4oebHTaAM6tcclb+F8aLjB7Zi
   JYc265rtH1yamThFkVeuazJlzCasgKr/Lfxsac754uZNM3tK6gTznW2Zz
   kOrsgjnvEYHvvS6ADno7c7VE9Y5Foo/pIGEj0nGg4YFrY5YyRRDxJlAwU
   g==;
X-CSE-ConnectionGUID: freroB0hTUS4H76DJ9ZI4g==
X-CSE-MsgGUID: QvdDkPpaTkC3W9AL2vpFFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91209203"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91209203"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 12:50:32 -0700
X-CSE-ConnectionGUID: EI4BrI9zQcOer+yF3aqmVQ==
X-CSE-MsgGUID: xe1rRIm6T0qzuukgnp/Ueg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="264768241"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2026 12:50:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvgsF-00000000d53-3WiU;
	Sun, 16 Aug 2026 19:50:27 +0000
Date: Mon, 17 Aug 2026 03:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 155/217]
 drivers/regulator/max8925-regulator.c:22:9: error: redeclaration of
 enumerator 'MAX8925_ID_SD1'
Message-ID: <202608170317.qOuw4nsC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_125032_781860_E9CD820A 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 12b07cd9224f59fd9924a86b2504c9caa0045206 [155/217] mfd: max8925: remove pdata probe support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608170317.qOuw4nsC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170317.qOuw4nsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170317.qOuw4nsC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/max8925-regulator.c:22:9: error: redeclaration of enumerator 'MAX8925_ID_SD1'
      22 |         MAX8925_ID_SD1,
         |         ^~~~~~~~~~~~~~
   In file included from drivers/regulator/max8925-regulator.c:16:
   include/linux/mfd/max8925.h:17:9: note: previous definition of 'MAX8925_ID_SD1' with type 'enum <anonymous>'
      17 |         MAX8925_ID_SD1,
         |         ^~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:23:9: error: redeclaration of enumerator 'MAX8925_ID_SD2'
      23 |         MAX8925_ID_SD2,
         |         ^~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:18:9: note: previous definition of 'MAX8925_ID_SD2' with type 'enum <anonymous>'
      18 |         MAX8925_ID_SD2,
         |         ^~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:24:9: error: redeclaration of enumerator 'MAX8925_ID_SD3'
      24 |         MAX8925_ID_SD3,
         |         ^~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:19:9: note: previous definition of 'MAX8925_ID_SD3' with type 'enum <anonymous>'
      19 |         MAX8925_ID_SD3,
         |         ^~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:25:9: error: redeclaration of enumerator 'MAX8925_ID_LDO1'
      25 |         MAX8925_ID_LDO1,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:20:9: note: previous definition of 'MAX8925_ID_LDO1' with type 'enum <anonymous>'
      20 |         MAX8925_ID_LDO1,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:26:9: error: redeclaration of enumerator 'MAX8925_ID_LDO2'
      26 |         MAX8925_ID_LDO2,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:21:9: note: previous definition of 'MAX8925_ID_LDO2' with type 'enum <anonymous>'
      21 |         MAX8925_ID_LDO2,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:27:9: error: redeclaration of enumerator 'MAX8925_ID_LDO3'
      27 |         MAX8925_ID_LDO3,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:22:9: note: previous definition of 'MAX8925_ID_LDO3' with type 'enum <anonymous>'
      22 |         MAX8925_ID_LDO3,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:28:9: error: redeclaration of enumerator 'MAX8925_ID_LDO4'
      28 |         MAX8925_ID_LDO4,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:23:9: note: previous definition of 'MAX8925_ID_LDO4' with type 'enum <anonymous>'
      23 |         MAX8925_ID_LDO4,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:29:9: error: redeclaration of enumerator 'MAX8925_ID_LDO5'
      29 |         MAX8925_ID_LDO5,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:24:9: note: previous definition of 'MAX8925_ID_LDO5' with type 'enum <anonymous>'
      24 |         MAX8925_ID_LDO5,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:30:9: error: redeclaration of enumerator 'MAX8925_ID_LDO6'
      30 |         MAX8925_ID_LDO6,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:25:9: note: previous definition of 'MAX8925_ID_LDO6' with type 'enum <anonymous>'
      25 |         MAX8925_ID_LDO6,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:31:9: error: redeclaration of enumerator 'MAX8925_ID_LDO7'
      31 |         MAX8925_ID_LDO7,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:26:9: note: previous definition of 'MAX8925_ID_LDO7' with type 'enum <anonymous>'
      26 |         MAX8925_ID_LDO7,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:32:9: error: redeclaration of enumerator 'MAX8925_ID_LDO8'
      32 |         MAX8925_ID_LDO8,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:27:9: note: previous definition of 'MAX8925_ID_LDO8' with type 'enum <anonymous>'
      27 |         MAX8925_ID_LDO8,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:33:9: error: redeclaration of enumerator 'MAX8925_ID_LDO9'
      33 |         MAX8925_ID_LDO9,
         |         ^~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:28:9: note: previous definition of 'MAX8925_ID_LDO9' with type 'enum <anonymous>'
      28 |         MAX8925_ID_LDO9,
         |         ^~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:34:9: error: redeclaration of enumerator 'MAX8925_ID_LDO10'
      34 |         MAX8925_ID_LDO10,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:29:9: note: previous definition of 'MAX8925_ID_LDO10' with type 'enum <anonymous>'
      29 |         MAX8925_ID_LDO10,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:35:9: error: redeclaration of enumerator 'MAX8925_ID_LDO11'
      35 |         MAX8925_ID_LDO11,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:30:9: note: previous definition of 'MAX8925_ID_LDO11' with type 'enum <anonymous>'
      30 |         MAX8925_ID_LDO11,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:36:9: error: redeclaration of enumerator 'MAX8925_ID_LDO12'
      36 |         MAX8925_ID_LDO12,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:31:9: note: previous definition of 'MAX8925_ID_LDO12' with type 'enum <anonymous>'
      31 |         MAX8925_ID_LDO12,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:37:9: error: redeclaration of enumerator 'MAX8925_ID_LDO13'
      37 |         MAX8925_ID_LDO13,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:32:9: note: previous definition of 'MAX8925_ID_LDO13' with type 'enum <anonymous>'
      32 |         MAX8925_ID_LDO13,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:38:9: error: redeclaration of enumerator 'MAX8925_ID_LDO14'
      38 |         MAX8925_ID_LDO14,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:33:9: note: previous definition of 'MAX8925_ID_LDO14' with type 'enum <anonymous>'
      33 |         MAX8925_ID_LDO14,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:39:9: error: redeclaration of enumerator 'MAX8925_ID_LDO15'
      39 |         MAX8925_ID_LDO15,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:34:9: note: previous definition of 'MAX8925_ID_LDO15' with type 'enum <anonymous>'
      34 |         MAX8925_ID_LDO15,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:40:9: error: redeclaration of enumerator 'MAX8925_ID_LDO16'
      40 |         MAX8925_ID_LDO16,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:35:9: note: previous definition of 'MAX8925_ID_LDO16' with type 'enum <anonymous>'
      35 |         MAX8925_ID_LDO16,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/max8925-regulator.c:41:9: error: redeclaration of enumerator 'MAX8925_ID_LDO17'
      41 |         MAX8925_ID_LDO17,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:36:9: note: previous definition of 'MAX8925_ID_LDO17' with type 'enum <anonymous>'
      36 |         MAX8925_ID_LDO17,
         |         ^~~~~~~~~~~~~~~~
   drivers/regulator/max8925-regulator.c:42:9: error: redeclaration of enumerator 'MAX8925_ID_LDO18'
      42 |         MAX8925_ID_LDO18,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:37:9: note: previous definition of 'MAX8925_ID_LDO18' with type 'enum <anonymous>'
      37 |         MAX8925_ID_LDO18,
         |         ^~~~~~~~~~~~~~~~
   drivers/regulator/max8925-regulator.c:43:9: error: redeclaration of enumerator 'MAX8925_ID_LDO19'
      43 |         MAX8925_ID_LDO19,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:38:9: note: previous definition of 'MAX8925_ID_LDO19' with type 'enum <anonymous>'
      38 |         MAX8925_ID_LDO19,
         |         ^~~~~~~~~~~~~~~~
   drivers/regulator/max8925-regulator.c:44:9: error: redeclaration of enumerator 'MAX8925_ID_LDO20'
      44 |         MAX8925_ID_LDO20,
         |         ^~~~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:39:9: note: previous definition of 'MAX8925_ID_LDO20' with type 'enum <anonymous>'
      39 |         MAX8925_ID_LDO20,
         |         ^~~~~~~~~~~~~~~~
   drivers/regulator/max8925-regulator.c:45:9: error: redeclaration of enumerator 'MAX8925_ID_MAX'
      45 |         MAX8925_ID_MAX,
         |         ^~~~~~~~~~~~~~
   include/linux/mfd/max8925.h:40:9: note: previous definition of 'MAX8925_ID_MAX' with type 'enum <anonymous>'
      40 |         MAX8925_ID_MAX,
         |         ^~~~~~~~~~~~~~
--
   drivers/video/backlight/max8925_bl.c: In function 'max8925_backlight_set':
>> drivers/video/backlight/max8925_bl.c:42:15: error: implicit declaration of function 'max8925_reg_write' [-Wimplicit-function-declaration]
      42 |         ret = max8925_reg_write(chip->i2c, data->reg_cntl, value);
         |               ^~~~~~~~~~~~~~~~~
>> drivers/video/backlight/max8925_bl.c:42:37: error: invalid use of undefined type 'struct max8925_chip'
      42 |         ret = max8925_reg_write(chip->i2c, data->reg_cntl, value);
         |                                     ^~
>> drivers/video/backlight/max8925_bl.c:48:23: error: implicit declaration of function 'max8925_set_bits' [-Wimplicit-function-declaration]
      48 |                 ret = max8925_set_bits(chip->i2c, data->reg_mode_cntl, 1, 1);
         |                       ^~~~~~~~~~~~~~~~
   drivers/video/backlight/max8925_bl.c:48:44: error: invalid use of undefined type 'struct max8925_chip'
      48 |                 ret = max8925_set_bits(chip->i2c, data->reg_mode_cntl, 1, 1);
         |                                            ^~
   drivers/video/backlight/max8925_bl.c:51:44: error: invalid use of undefined type 'struct max8925_chip'
      51 |                 ret = max8925_set_bits(chip->i2c, data->reg_mode_cntl, 1, 0);
         |                                            ^~
   In file included from include/linux/printk.h:620,
                    from include/linux/kernel.h:30,
                    from drivers/video/backlight/max8925_bl.c:10:
   drivers/video/backlight/max8925_bl.c:54:21: error: invalid use of undefined type 'struct max8925_chip'
      54 |         dev_dbg(chip->dev, "set brightness %d\n", value);
         |                     ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/video/backlight/max8925_bl.c:54:9: note: in expansion of macro 'dev_dbg'
      54 |         dev_dbg(chip->dev, "set brightness %d\n", value);
         |         ^~~~~~~
   drivers/video/backlight/max8925_bl.c:58:21: error: invalid use of undefined type 'struct max8925_chip'
      58 |         dev_dbg(chip->dev, "set brightness %d failure with return value:%d\n",
         |                     ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/video/backlight/max8925_bl.c:58:9: note: in expansion of macro 'dev_dbg'
      58 |         dev_dbg(chip->dev, "set brightness %d failure with return value:%d\n",
         |         ^~~~~~~
   drivers/video/backlight/max8925_bl.c: In function 'max8925_backlight_get_brightness':
>> drivers/video/backlight/max8925_bl.c:74:15: error: implicit declaration of function 'max8925_reg_read' [-Wimplicit-function-declaration]
      74 |         ret = max8925_reg_read(chip->i2c, data->reg_cntl);
         |               ^~~~~~~~~~~~~~~~
   drivers/video/backlight/max8925_bl.c:74:36: error: invalid use of undefined type 'struct max8925_chip'
      74 |         ret = max8925_reg_read(chip->i2c, data->reg_cntl);
         |                                    ^~
   drivers/video/backlight/max8925_bl.c:78:21: error: invalid use of undefined type 'struct max8925_chip'
      78 |         dev_dbg(chip->dev, "get brightness %d\n", data->current_brightness);
         |                     ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/video/backlight/max8925_bl.c:78:9: note: in expansion of macro 'dev_dbg'
      78 |         dev_dbg(chip->dev, "get brightness %d\n", data->current_brightness);
         |         ^~~~~~~
   drivers/video/backlight/max8925_bl.c: In function 'max8925_backlight_dt_init':
>> drivers/video/backlight/max8925_bl.c:100:68: error: expected ';' before 'if'
     100 |         of_property_read_u32(np, "maxim,max8925-dual-string", &val)
         |                                                                    ^
         |                                                                    ;
     101 | 
     102 |         if (val)
         |         ~~                                                          
   drivers/video/backlight/max8925_bl.c: In function 'max8925_backlight_probe':
   drivers/video/backlight/max8925_bl.c:155:36: error: invalid use of undefined type 'struct max8925_chip'
     155 |         ret = max8925_set_bits(chip->i2c, data->reg_mode_cntl, 0xfe, value);
         |                                    ^~
--
   drivers/power/supply/max8925_power.c: In function 'max8925_power_probe':
>> drivers/power/supply/max8925_power.c:501:17: error: incompatible types when assigning to type 'struct max8925_power_pdata' from type 'struct max8925_power_pdata *'
     501 |         pdata = max8925_power_dt_init(pdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> drivers/power/supply/max8925_power.c:502:13: error: wrong type argument to unary exclamation mark
     502 |         if (!pdata)
         |             ^
>> drivers/power/supply/max8925_power.c:529:34: error: invalid type argument of '->' (have 'struct max8925_power_pdata')
     529 |         info->batt_detect = pdata->batt_detect;
         |                                  ^~
   drivers/power/supply/max8925_power.c:530:39: error: invalid type argument of '->' (have 'struct max8925_power_pdata')
     530 |         info->topoff_threshold = pdata->topoff_threshold;
         |                                       ^~
   drivers/power/supply/max8925_power.c:531:34: error: invalid type argument of '->' (have 'struct max8925_power_pdata')
     531 |         info->fast_charge = pdata->fast_charge;
         |                                  ^~
   drivers/power/supply/max8925_power.c:532:38: error: invalid type argument of '->' (have 'struct max8925_power_pdata')
     532 |         info->no_temp_support = pdata->no_temp_support;
         |                                      ^~
   drivers/power/supply/max8925_power.c:533:39: error: invalid type argument of '->' (have 'struct max8925_power_pdata')
     533 |         info->no_insert_detect = pdata->no_insert_detect;
         |                                       ^~


vim +/MAX8925_ID_SD1 +22 drivers/regulator/max8925-regulator.c

    19	
    20	/* Unified sub device IDs for MAX8925 */
    21	enum {
  > 22		MAX8925_ID_SD1,
  > 23		MAX8925_ID_SD2,
  > 24		MAX8925_ID_SD3,
  > 25		MAX8925_ID_LDO1,
  > 26		MAX8925_ID_LDO2,
  > 27		MAX8925_ID_LDO3,
  > 28		MAX8925_ID_LDO4,
  > 29		MAX8925_ID_LDO5,
  > 30		MAX8925_ID_LDO6,
  > 31		MAX8925_ID_LDO7,
  > 32		MAX8925_ID_LDO8,
  > 33		MAX8925_ID_LDO9,
  > 34		MAX8925_ID_LDO10,
  > 35		MAX8925_ID_LDO11,
  > 36		MAX8925_ID_LDO12,
  > 37		MAX8925_ID_LDO13,
  > 38		MAX8925_ID_LDO14,
  > 39		MAX8925_ID_LDO15,
  > 40		MAX8925_ID_LDO16,
  > 41		MAX8925_ID_LDO17,
  > 42		MAX8925_ID_LDO18,
  > 43		MAX8925_ID_LDO19,
  > 44		MAX8925_ID_LDO20,
  > 45		MAX8925_ID_MAX,
    46	};
    47	
    48	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


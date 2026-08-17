Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B1EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=te1z7GuVhseJYugKAtDD2RCu2nn1uAHfQBPcVhB9BZ4=; b=dx48towOerTmw2BD6hxOIhrI0H
	YKZcoIpTNpy3+FEa7YtuTz0cgCUssKHKYdos+qHMJmkj+Zi+e1ZuFMWLN9/BxHyMrdjKjK8rmvpTj
	rczPVgf+xAfDjLBdhZItDI/LWmKbNIL599yrbr4lRdU3/e645KCbfVqxbvqyeMIDj/thuHoPfgGh6
	nOGqfFs2fqVYxkO7KSqT9Ak1/UF8JVbLiGMpdtyUVkXxMjWw8pYlJS6PLoybcrjbx86Kf1D+62dM4
	/O4ex2zL0bJBhdR3mrp/FlX02pkrAJolVxsWW/yMzxZp+lfKwL++BXfHPlHqcgHpidfSb+AZDRhTb
	Ij9TFgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0c1-00000006Yea-0wMb;
	Mon, 17 Aug 2026 16:55:01 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0by-00000006Ydf-0f7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786985698; x=1818521698;
  h=date:from:to:cc:subject:message-id;
  bh=aoP3+++jhCgswqdF89+0vbsToZiwbK0wtHF7BZ08o08=;
  b=fjk1Gu48kSKKAoeYFDxQaWCE4pYhqLaSIqT3DZBKwkGExW9epp5d3iux
   ypgm+UV1IaJ4vPwaDwyyABOu87IaPgtsnDBkUGa46Mx7NB9C46cvS9oLr
   MBTbL/bRtjoL0I3UoEZFxHT9j8qq1xJRbC/iXiCwHfeO8tdISprr4T/5+
   vD11tvwBvzFhyJFfnMp4jA8g8+znw9YDHHUJghvlo08/7oJam0NvAcuCP
   g7L1y0b9btzLLeQKtv5J6gdu5dDHnT+YN24EpgvUynowOpscOpE8zP7YT
   GPYkCPd3Zt0F3T+bFIg0in1jBTXyHM9l+oHtgcEJmvEW1Jo2iRgAS7RwB
   g==;
X-CSE-ConnectionGUID: sP4HZ07gQ36fDaxu83X5FQ==
X-CSE-MsgGUID: fEM0bIHkTWWVXnVY4EfBug==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="74996389"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="74996389"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 09:54:57 -0700
X-CSE-ConnectionGUID: UBC/rzGWQ46bghatmdTPog==
X-CSE-MsgGUID: 18S67hlBRfC0E82lNjSARA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="269247676"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Aug 2026 09:54:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww0bt-00000000dfa-1bsE;
	Mon, 17 Aug 2026 16:54:53 +0000
Date: Tue, 18 Aug 2026 00:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 167/217] Warning:
 drivers/regulator/max8998.c:59 cannot understand function prototype: 'struct
 max8998_regulator_data'
Message-ID: <202608180027.jXWV7RZS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_095458_256103_7DF431A1 
X-CRM114-Status: UNSURE (   8.72  )
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
commit: 2a3be8c163ae1aac1daaa8a851aac755698ac63d [167/217] mfd: max8998: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260818/202608180027.jXWV7RZS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180027.jXWV7RZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180027.jXWV7RZS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/max8998.c:59 cannot understand function prototype: 'struct max8998_regulator_data'
--
   drivers/power/supply/max8998_charger.c: In function 'max8998_battery_probe':
>> drivers/power/supply/max8998_charger.c:95:28: warning: variable 'i2c' set but not used [-Wunused-but-set-variable=]
      95 |         struct i2c_client *i2c;
         |                            ^~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


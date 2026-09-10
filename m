Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FADC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2ycQDX2gEqieskRW5xniG1Yt3LKFeEHNkTSheSJaMDM=; b=iau99lOpsAHWKgnErTxHY2fUdl
	/yD7lgK8uEVmsvOYFDHWNLoYv/SItuqfDHnUpgABZf+Ok5FU1borofJU8RxaTnSdsvEEXqctUftEt
	I6E/AZnu56Fy5Fc9GkGGQvRGeirQxwOkHmbArYTTVWkO4Q3VHf6sMam4XKhyS6Xjco6Fgr691/D1z
	Rx3Sl2xzPpEMZBvynmuFnCtDjTQ2bJRsbkf9JWc4QMoNWRiPBDwh8+gKm2W7fjtRCXLN6sc2vTQrm
	nXH3EFW87LOJxbk6kNMp4YuTIuBhqWbrJEfZeq2kWjPdVkbcEktixezX8tRyYc/bT2x0DYO53SEw2
	NMJM32EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4geD-0000000Emig-0ndD;
	Thu, 10 Sep 2026 15:25:09 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4geB-0000000EmiF-0FF4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789053907; x=1820589907;
  h=date:from:to:cc:subject:message-id;
  bh=UURlGBa5UF35fCkmUbrt7fRp1XAUuZ9SNuDUvqdkETg=;
  b=DRs4Uc+fmyNWq+1tLYkL45IepavzjZcSv7rsrwiQsRZkCnQRFqvFXDyj
   HwSpV7KDi+tH1byr7vvP+u+xO3Dec8UuxYZFb+kAXy4zTnI0A5COvfy+2
   JY/G4/4/58/RBhhRk8QrrV2jfT9yWupCNkyH3Ck3c0kPqqxH3ro1NIgoZ
   pjfJS5h9wr4ibcQbYDCal5HLk41GTLQT/Bv5cnC3gMPugbP7ZTnggrd7K
   wYQ4FaDeWFIwu+B1b566NVejuMpV2u1j2X28ymLoEsF9GW4fEMDW+K4a/
   raVpbE4omlydvIUQ8C9+lVzcNvp+WtPNwbvyGF6Af/gXwh1HXjhh9Ky7a
   Q==;
X-CSE-ConnectionGUID: 3VReJ71nTEKFy77UASm1VA==
X-CSE-MsgGUID: OX9DBkobS8G5gBtwzaN4fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106875196"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="106875196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:25:06 -0700
X-CSE-ConnectionGUID: fP8oZH+uStOzDrwAnBU7xw==
X-CSE-MsgGUID: rEPQBZRmRFORKMfp6rS4eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271653785"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 10 Sep 2026 08:25:04 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gdP-000000000Dq-1JG5;
	Thu, 10 Sep 2026 15:24:26 +0000
Date: Thu, 10 Sep 2026 23:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove-7.3] BUILD REGRESSION
 3ac93c1e700558259ea604f7d4f37e26820fba15
Message-ID: <202609102347.YWrgKGon-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_082507_170666_568A7683 
X-CRM114-Status: UNSURE (   8.03  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
branch HEAD: 3ac93c1e700558259ea604f7d4f37e26820fba15  power: supply: sbs-battery: remove platform_data based probing

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202609100447.zZyMwFaw-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609100456.ZiTH0pix-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609100500.VDsB697w-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609100538.2YmRyN5u-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609100622.mKwcT8VH-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609100829.dZoZmxp2-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609101040.gBAHTWoN-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609101458.dCAUeSAA-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609101731.1CkBqWZb-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609101958.K8XqOq04-lkp@intel.com

    Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config' (did you mean one of: 'clkout_src')
    Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data' (did you mean one of: 'mphase')
    drivers/leds/leds-da9052.c:104:14: error: dereferencing pointer to incomplete type 'struct da9052_pdata'
    drivers/leds/leds-da9052.c:104:21: error: invalid use of undefined type 'struct da9052_pdata'
    drivers/media/i2c/ds90ub913.c:23:10: fatal error: 'media/i2c/ds90ub9xx.h' file not found
    drivers/media/i2c/ds90ub913.c:23:10: fatal error: media/i2c/ds90ub9xx.h: No such file or directory
    drivers/mtd/spi-nor/core.c:1178:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/mtd/spi-nor/core.c:1333:13: warning: unused variable 'i' [-Wunused-variable]
    drivers/mtd/spi-nor/core.c:1333:6: warning: unused variable 'i' [-Wunused-variable]
    drivers/mtd/spi-nor/core.c:2579:13: warning: unused variable 'ignored_mask' [-Wunused-variable]
    drivers/mtd/spi-nor/core.c:2579:6: warning: unused variable 'ignored_mask' [-Wunused-variable]
    drivers/mtd/spi-nor/core.c:3394:12: error: static declaration of 'spi_nor_scan' follows non-static declaration
    drivers/mtd/spi-nor/core.c:351:13: warning: unused variable 'ret' [-Wunused-variable]
    drivers/mtd/spi-nor/core.c:351:6: warning: unused variable 'ret' [-Wunused-variable]
    drivers/mtd/spi-nor/spansion.c:100:23: error: implicit declaration of function 'spi_nor_controller_ops_write_reg' [-Werror=implicit-function-declaration]
    drivers/mtd/spi-nor/spansion.c:100:23: error: implicit declaration of function 'spi_nor_controller_ops_write_reg' [-Wimplicit-function-declaration]
    drivers/mtd/spi-nor/spansion.c:100:9: error: call to undeclared function 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/mtd/spi-nor/winbond.c:122:23: error: implicit declaration of function 'spi_nor_controller_ops_write_reg' [-Werror=implicit-function-declaration]
    drivers/mtd/spi-nor/winbond.c:122:23: error: implicit declaration of function 'spi_nor_controller_ops_write_reg' [-Wimplicit-function-declaration]
    drivers/mtd/spi-nor/winbond.c:122:9: error: call to undeclared function 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/rtc/rtc-stm32.c:795:13: warning: 'stm32_rtc_clear_events' defined but not used [-Wunused-function]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-randconfig-r111-20260910
|   `-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|-- arc-allmodconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- arc-randconfig-r112-20260910
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   `-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|-- arm-allyesconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- arm64-randconfig-r131-20260910
|   `-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|-- hexagon-randconfig-r073-20260910
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   `-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|-- i386-randconfig-062-20260910
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|-- i386-randconfig-063-20260910
|   `-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|-- i386-randconfig-141-20260910
|   `-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|-- m68k-allyesconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- mips-allmodconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- mips-randconfig-r072-20260910
|   `-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|-- mips-randconfig-r113-20260910
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   `-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|-- mips-randconfig-r132-20260910
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|-- nios2-allmodconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- nios2-randconfig-r123-20260910
|   `-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|-- openrisc-allmodconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- parisc-allmodconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- parisc-allyesconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- parisc-randconfig-r134-20260910
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   `-- drivers-leds-leds-da9052.c:error:dereferencing-pointer-to-incomplete-type-struct-da9052_pdata
|-- powerpc-allmodconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   |-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-rtc-rtc-stm32.c:warning:stm32_rtc_clear_events-defined-but-not-used
|-- powerpc-randconfig-r122-20260910
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|-- s390-allmodconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h-file-not-found
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-core.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
|   |-- drivers-mtd-spi-nor-spansion.c:error:call-to-undeclared-function-spi_nor_controller_ops_write_reg-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-mtd-spi-nor-winbond.c:error:call-to-undeclared-function-spi_nor_controller_ops_write_reg-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- s390-allyesconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h:No-such-file-or-directory
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|-- sh-allmodconfig
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|-- sh-allyesconfig
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-leds-leds-da9052.c:error:invalid-use-of-undefined-type-struct-da9052_pdata
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|-- um-allmodconfig
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h-file-not-found
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-core.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
|   |-- drivers-mtd-spi-nor-spansion.c:error:call-to-undeclared-function-spi_nor_controller_ops_write_reg-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-mtd-spi-nor-winbond.c:error:call-to-undeclared-function-spi_nor_controller_ops_write_reg-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- um-randconfig-r071-20260910
|   `-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|-- um-randconfig-r121-20260910
|   `-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|-- x86_64-randconfig-121-20260910
|   `-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|-- x86_64-randconfig-122-20260910
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-mtd-spi-nor-core.c:error:static-declaration-of-spi_nor_scan-follows-non-static-declaration
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
|   |-- drivers-mtd-spi-nor-spansion.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|   `-- drivers-mtd-spi-nor-winbond.c:error:implicit-declaration-of-function-spi_nor_controller_ops_write_reg
|-- x86_64-randconfig-123-20260910
|   |-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(
|   |-- Warning:drivers-regulator-lp8755.c-Excess-struct-member-mphase_type-description-in-lp8755_platform_data-(
|   |-- drivers-media-i2c-ds90ub913.c:fatal-error:media-i2c-ds90ub9xx.h-file-not-found
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-i
|   |-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ignored_mask
|   `-- drivers-mtd-spi-nor-core.c:warning:unused-variable-ret
`-- x86_64-randconfig-161-20260910
    `-- Warning:drivers-clk-clk-si5351.c-Excess-struct-member-clkout-description-in-si5351_clkout_config-(

elapsed time: 1520m

configs tested: 43
configs skipped: 0

tested configs:
alpha        allnoconfig    gcc-16.1.0
alpha       allyesconfig    gcc-16.1.0
arc         allmodconfig    gcc-16.1.0
arc          allnoconfig    gcc-16.1.0
arc         allyesconfig    gcc-16.1.0
arm          allnoconfig    clang-17
arm         allyesconfig    gcc-16.1.0
arm64       allmodconfig    clang-24
arm64        allnoconfig    gcc-16.1.0
csky         allnoconfig    gcc-16.1.0
hexagon     allmodconfig    clang-24
hexagon      allnoconfig    clang-24
i386         allnoconfig    gcc-14
loongarch   allmodconfig    clang-19
loongarch    allnoconfig    clang-20
m68k         allnoconfig    gcc-16.1.0
m68k        allyesconfig    gcc-16.1.0
microblaze   allnoconfig    gcc-16.1.0
mips        allmodconfig    gcc-16.1.0
mips         allnoconfig    gcc-16.1.0
nios2       allmodconfig    gcc-11.5.0
nios2        allnoconfig    gcc-11.5.0
openrisc    allmodconfig    gcc-16.1.0
openrisc     allnoconfig    gcc-16.1.0
parisc      allmodconfig    gcc-16.1.0
parisc       allnoconfig    gcc-16.1.0
parisc      allyesconfig    gcc-16.1.0
powerpc     allmodconfig    gcc-16.1.0
powerpc      allnoconfig    gcc-16.1.0
riscv       allmodconfig    clang-24
riscv        allnoconfig    gcc-16.1.0
s390        allmodconfig    clang-24
s390         allnoconfig    clang-24
s390        allyesconfig    gcc-16.1.0
sh          allmodconfig    gcc-16.1.0
sh           allnoconfig    gcc-16.1.0
sh          allyesconfig    gcc-16.1.0
sparc        allnoconfig    gcc-16.1.0
um          allmodconfig    clang-17
um           allnoconfig    clang-17
um          allyesconfig    gcc-14
x86_64       allnoconfig    clang-22
xtensa       allnoconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385DAD262AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amfr8C1tbHuwr0NbBfboNCzbViOwtHbcW+qBL9cJYf0=; b=aQgoNxrKT0MGQDDztwScrMFWen
	Np1UI8ug6wAjxLOkxOXK71MFg30G1NYX4FJ7VMu2lyRMkux2EH0l5UKP0gGLtUnwkBaK52Zuz0A35
	rr4krGDY7MayT/4qkXiP8ApRCfEuj/MtJ7xLSb/aDIicrIOio9VGPpuu6JoNZ3nUefuDzAI7XoDdE
	M1dJbXCqbwDtImN3iQ+X67zIdjL3qggcJ/woZIKFPGp7mH6I+mlNe8l0HCqrXfUdhSFnZJFvwbWGU
	IdzrQHCZ4alnvUeJqbCkzjNM4wXtwWHzfCBkRWGGO5J0JZbKkB8NVCSCmHFdzqCh5mlmbiwPa5wuM
	aUA/v1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMyG-00000004htL-3XeV;
	Wed, 21 Jan 2026 01:25:20 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMyD-00000004hsp-3vNp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768958718; x=1800494718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jg5BpT5100sdtoSuwQ6SgHaMH0aIdKCiN/KiOpnG2m0=;
  b=oEXWy6o9Z2kunuy2mYCrSokyJq41txJTI9sZO1DmlHEykwt1x+kioIwQ
   JEpBkqaATp+4L28HsZdHU2+oop0eteW417zLjRGnDNPnzRyhjMjRIkQ33
   YWOMtfWPeYlqhq47Y/7JNFDGsXbgTkdFJfA5/f9wILmd8gpXegHK/6oYE
   F0SfVu4t80iZ/IJY/YZFVcvuM+KPJ1x/CX9NDpGgpBn9b4n1XDjtxiQNV
   11LqEhqYx9h+uMxa/CzH8iNKX0mGWH/KhhX5ekDFxEjUSkoEaAfoeSVvf
   A7Lzbkn1K5MmdsTDLO47hvdP5VaK6TdTmSZE2jOj8bo/zl4yGvPPK8fXP
   w==;
X-CSE-ConnectionGUID: ydl+8B6vQ/aniVDxTq78ow==
X-CSE-MsgGUID: FR4Ns/bAQ32GU7gsatjC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70347498"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70347498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 17:25:17 -0800
X-CSE-ConnectionGUID: S68r+NPxRpOmSaCNok0Zvw==
X-CSE-MsgGUID: fQ6N/Ny/ThibSnDZFdoCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206197445"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2026 17:25:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viMy8-00000000PoD-1826;
	Wed, 21 Jan 2026 01:25:12 +0000
Date: Wed, 21 Jan 2026 09:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Gu <gu_0233@qq.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Gu <gu_0233@qq.com>
Subject: Re: [PATCH] firmware: arm_scpi: Fix device_node reference leak in
 scpi_probe()
Message-ID: <202601210817.qdAqWG2J-lkp@intel.com>
References: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_172518_045235_ECD5806E 
X-CRM114-Status: GOOD (  10.83  )
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

Hi Felix,

kernel test robot noticed the following build errors:

[auto build test ERROR on d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Gu/firmware-arm_scpi-Fix-device_node-reference-leak-in-scpi_probe/20260120-203159
base:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
patch link:    https://lore.kernel.org/r/tencent_845B889AF1A932F1347EE0C09F350E491009%40qq.com
patch subject: [PATCH] firmware: arm_scpi: Fix device_node reference leak in scpi_probe()
config: riscv-randconfig-r064-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210817.qdAqWG2J-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210817.qdAqWG2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210817.qdAqWG2J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scpi.c:21:10: fatal error: linux/clean.h: No such file or directory
      21 | #include <linux/clean.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +21 drivers/firmware/arm_scpi.c

    18	
    19	#include <linux/bitmap.h>
    20	#include <linux/bitfield.h>
  > 21	#include <linux/clean.h>
    22	#include <linux/device.h>
    23	#include <linux/err.h>
    24	#include <linux/export.h>
    25	#include <linux/io.h>
    26	#include <linux/kernel.h>
    27	#include <linux/list.h>
    28	#include <linux/mailbox_client.h>
    29	#include <linux/module.h>
    30	#include <linux/of.h>
    31	#include <linux/of_address.h>
    32	#include <linux/of_platform.h>
    33	#include <linux/platform_device.h>
    34	#include <linux/printk.h>
    35	#include <linux/property.h>
    36	#include <linux/pm_opp.h>
    37	#include <linux/scpi_protocol.h>
    38	#include <linux/slab.h>
    39	#include <linux/sort.h>
    40	#include <linux/spinlock.h>
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


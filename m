Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF9FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 00:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5iR+nNQxhbLawkimlT1BIMdnZYenkTULSBylDSaYpDU=; b=yDOMSqCDpavskLlc0nXzQSOzpk
	XJh7bKHQ5xFN5FkifpsI3lRqRrgSmCkHTtjYrOVQQuz+xz6ahJ3/ao0hn4S7gHjgYdwAY8+QQkAHS
	5kGbf0E9Ozb1IhEMAEO4ccfjUeeuoFzKXhDwg5J9MKif5ZhXl9Sa0W3yDO07QXeY5kJEXRwTdKRvu
	hCaEozAwS/078BVW2TAiXwfr21XOydwJLever00FZzqQGDu/BNIpiFDkk8h7LXga+zXCiCoXhiR8k
	BVoP7AbQzthgoZFWbn4IJ3WXw7VZCFsYWXzLCRHk9lro6cN8YCYv3AinuAQr1KvDenK/5hOxwm8AQ
	CkMriqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEHTp-000000085Zu-1DU3;
	Mon, 12 May 2025 00:57:17 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEHRm-000000085TP-2AwS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 00:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747011310; x=1778547310;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yQ0oCgOE3Dm5ka7Kx2Ns7S7D+qbr/clFtJ5iA71kvi4=;
  b=lOHqoPGdqckvavRDMi1bkv9L7LAkYe1aKktjduSpKkCtNEMqIPsc2hmM
   sPy0NOiVtWespxM+8MSrkxELphWJPRYE65ANifnNA/NsfO4ubqXhPbMay
   CAGTm34O63SjzOhw2PS0PpH2z1Bb08IYS6JzPtBbk4Ww8Z6LrSLTVEg9b
   xBJn1Y6shug7r+Q4+FAD0c+n6QoiDKrt+3wVi0xHurHA3H3/M7UchzSXh
   FtbGm/YLPuBzz4+89iqE7AVYWfpkhgFIvr/PTZsO9xx2arRmiy6hc8LC/
   DuG8UD23zVbaVyIfW2PA/x1AALQZEI1S0TYXzQ11dYvReYkmc9KWKZiqU
   w==;
X-CSE-ConnectionGUID: EWVDgjR9RLOMWbOi1hX6hQ==
X-CSE-MsgGUID: u6auookpQT6Cmrdlkex8RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="47907968"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="47907968"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 17:55:04 -0700
X-CSE-ConnectionGUID: 4KbfH5tsTvSPdsqUzf7mdA==
X-CSE-MsgGUID: 84sLgkYaSXOUqPaaABKqwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="160470582"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2025 17:55:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEHRa-000E5f-1e;
	Mon, 12 May 2025 00:54:58 +0000
Date: Mon, 12 May 2025 08:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/msi-parent-arm64 5/11]
 drivers/irqchip/irq-bcm2712-mip.c:14:10: fatal error: irq-msi-lib.h: No such
 file or directory
Message-ID: <202505120801.EulKUbgx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_175510_608616_1C959026 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Marc,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/msi-parent-arm64
head:   ad9406b84a59ce51931ed2a57adca122498a1aff
commit: 10ecc3941341b39efc3ce403206045d873c3f978 [5/11] irqchip: Make irq-msi-lib.h globally available
config: arm-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505120801.EulKUbgx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505120801.EulKUbgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505120801.EulKUbgx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-bcm2712-mip.c:14:10: fatal error: irq-msi-lib.h: No such file or directory
    #include "irq-msi-lib.h"
             ^~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/irqchip/irq-bcm2712-mip.c

32c6c054661a9b Stanimir Varbanov 2025-02-24  13  
32c6c054661a9b Stanimir Varbanov 2025-02-24 @14  #include "irq-msi-lib.h"
32c6c054661a9b Stanimir Varbanov 2025-02-24  15  

:::::: The code at line 14 was first introduced by commit
:::::: 32c6c054661a9b454837e3df409e9bd8fe9ba5f9 irqchip: Add Broadcom BCM2712 MSI-X interrupt controller

:::::: TO: Stanimir Varbanov <svarbanov@suse.de>
:::::: CC: Krzysztof Wilczyński <kwilczynski@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


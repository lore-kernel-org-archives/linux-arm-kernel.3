Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BB2C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 21:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cbk3jQRpbWZBJhAvhNYsKKIrxJtVHyaYhoxicKJbhbI=; b=d76ycAFRFwN1zMtzWjrxxJVMRl
	lAvLy6SZ2vTxnfr3pk+a563Qk2AkUnVqe2ckul/A4fVtRhzC3Vpmfp39CWlMvCyfJcOMz0alj9Iz5
	VHGws1qzk0jOWWvq6ofpcxY+0VyrafOaWzahQzb7ik1NfyiblR0sxKvmMI/eTHpRHropwX2UurP+Y
	fmBEzvKHuh6MmVPkz86hnGoAF9RSGxKX3I9lL5Hv5gAtbRmwbuZpo57rOjotscOxI//IjRLm9ELD5
	PderHmZ2/PSIXT0ekJuprkZcKgDXKKjWqOpmf+vBcX18wDfFeVUpitzcfBHjWt6pR4mpYdwgzqKPm
	DI0X2H9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvN3z-0000000DDHW-3gvA;
	Thu, 20 Mar 2025 21:04:27 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvN2H-0000000DD8T-3mqZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 21:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742504562; x=1774040562;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9Yu/IcKZ+HW0miEpI8MazFPTTbzQQ642qRvaUz7Er3I=;
  b=JeZAPYi6J5W5z+LOqdAzS5TOgg+D1//eqhVq8LflC0jEFsyFFZZ1JXQV
   IccanzbbGmi+PL6FFjTp/U6oUqLEKX5QBXK2/rTnx4c6Z1hpNPgnhG46I
   9jJmRYmsZ5m7Xzqr+vwBdRakOGXmk4RYnEkAoVP9NbzJOGLTYlHkAt4ah
   Q5pYLGN/kmYMfVaN53aVXfigofusa9JiuGUUk89juFIZvl8UL51YhEP4f
   1kTmIgsSUQt2/Aq8Ic2lsQMWunB15RgWZQhRlrZvKxwA9ouZntCx+mA4H
   /bc+jyhVHfKKB8QsH5FbJ9Rn4iYbAovXzsqkI4uRkfqCay0i6FUFYZRP9
   g==;
X-CSE-ConnectionGUID: mh/K14DIT7m+qjpyD4idag==
X-CSE-MsgGUID: CA5SkhRxSpaYTYJk2iO8lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43491197"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43491197"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 14:02:40 -0700
X-CSE-ConnectionGUID: nXFITisySfCRV1iQdQ4WdQ==
X-CSE-MsgGUID: CbZlzwNgQJurit+a8DQtvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="154099904"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2025 14:02:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvN29-0000lP-2g;
	Thu, 20 Mar 2025 21:02:35 +0000
Date: Fri, 21 Mar 2025 05:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 22/24]
 drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the
 parameter name in a function definition is a C23 extension
Message-ID: <202503210450.AoOpbJXC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_140241_984408_978806E2 
X-CRM114-Status: UNSURE (   9.28  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   ba8755ab541fc629948233125db870d4dbf00a75
commit: df94a2f1eb455b57dd01f9b64419e3163d44df7f [22/24] platform: cznic: turris-omnia-mcu: Add support for digital message signing with HW private key
config: arm-randconfig-001-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210450.AoOpbJXC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210450.AoOpbJXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210450.AoOpbJXC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      25 | static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
         |                                                       ^
   drivers/platform/cznic/turris-signing-key.c:25:87: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      25 | static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
         |                                                                                       ^
   2 warnings generated.


vim +25 drivers/platform/cznic/turris-signing-key.c

0b28b7080ef5a3 Marek Behún 2025-02-04  24  
0b28b7080ef5a3 Marek Behún 2025-02-04 @25  static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
0b28b7080ef5a3 Marek Behún 2025-02-04  26  {
0b28b7080ef5a3 Marek Behún 2025-02-04  27  	return 0;
0b28b7080ef5a3 Marek Behún 2025-02-04  28  }
0b28b7080ef5a3 Marek Behún 2025-02-04  29  

:::::: The code at line 25 was first introduced by commit
:::::: 0b28b7080ef5a323c3afa3860c3d45d627629830 platform: cznic: Add keyctl helpers for Turris platform

:::::: TO: Marek Behún <kabel@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


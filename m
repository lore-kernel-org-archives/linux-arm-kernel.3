Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF38C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OIfwaxi/athy3MzisMBnpMxNQ5F5bitjX2/0kEt5AE8=; b=1qQMWilhoqgebQhI1Lkx3DsZjY
	7oa2x+AwWeSO3jsZr4baAPN/L/b/yR7BET8Mb162+epJDAK8pRPPGRR5rrVbZRh9MyP2LwmrV35DA
	xedTqIE1Ktsh0g/kokFhB2RK230IMnOPgqSYCL/z4utOC+YUK4AexpYCAjxOAh73OtKgiD9yeSlK6
	rMd1b9+jECuoYgzRFYt11KdOq5hWC4ZGNORykU18M8Jy0IRQmLuZEickwj2wbMvKQ5RUYIEtx0rQ/
	ZhK7XNeCJ6aQ/v1wFesGTChcWWHsENZgEe8Rwc7cjzCEESvDUXftIHrmdj8OhJM8tobEfK7BuQ6dv
	NOuxKrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvSPp-0000000DiYJ-45z9;
	Fri, 21 Mar 2025 02:47:22 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvSKy-0000000Di3x-2U5I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 02:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742524940; x=1774060940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iRzCCEjN74qme9k2+0cNrmsvBzSueF0KdDdEk7TCWOc=;
  b=MpDRSgeYFiiDwJF3Ih/dLOO960AMAIAYrouXoexdbiX1bn8goSRILSjF
   +l2FgyotLqlawwlx5mPa9Zikx2PGmbcIS26GYyuRvhfNlp+vhSpMGVZ8i
   LyPe1dtAjhwglP6yae0hlkBSrQ9o0aqa/jiL7nS+ae1rg9uO2u92L3TK2
   rYfago/ap7a0/O/cH6g2oS6vphywb13j2d6AW+D+r6U+GErVqmD3997gr
   jbCXbeDVtmink3EGu0uLn5fQeH1YBjXGvCb69qt3DsJYjUQnUrFYz0+ur
   R4pCxF8MutpMkFb4bX77/pIxEkuMVgafzXk6SAUwEeSUDVc8lwfV/k7rs
   w==;
X-CSE-ConnectionGUID: mK5G7KnOToyDP3f3vDc3Vw==
X-CSE-MsgGUID: zvD61g8zT9+fv77CtnCbjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54418812"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="54418812"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 19:42:13 -0700
X-CSE-ConnectionGUID: 7+s6t2UdSsihDe1CDCpqIA==
X-CSE-MsgGUID: SJovzMsPS96ZEY/ZtVF8MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="154171390"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2025 19:42:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvSKn-0000xd-1X;
	Fri, 21 Mar 2025 02:42:09 +0000
Date: Fri, 21 Mar 2025 10:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 22/24]
 drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the
 parameter name in a function definition is a C2x extension
Message-ID: <202503211042.Uf5Ln7hI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_194220_639579_6F3E2218 
X-CRM114-Status: UNSURE (   9.56  )
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

Hi Marek,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   ba8755ab541fc629948233125db870d4dbf00a75
commit: df94a2f1eb455b57dd01f9b64419e3163d44df7f [22/24] platform: cznic: turris-omnia-mcu: Add support for digital message signing with HW private key
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250321/202503211042.Uf5Ln7hI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211042.Uf5Ln7hI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211042.Uf5Ln7hI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
      25 | static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
         |                                                       ^
   drivers/platform/cznic/turris-signing-key.c:25:87: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
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


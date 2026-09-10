Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E22EC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PDw5YMED8hd8fRQe9Uyu7HbzUFhn8uMMjJJHsqUmGTU=; b=YDtbcsfD8Eom7HfnRepyYO+EVT
	XEYoKulArewqnRfctRVuHAarQ1MKz4O8UYBldgY/JpC9Dp7A7RW3TCcUjSIfMDJniyOPyFZOP35xb
	rV0rpfr18koW70TTdqExLGUziReSDxlssC2qWk+nP94QfGlmALTh2DEL+wN4tpS66SelGLi2x6S4C
	6gI7fVrKTZ9OWe488Ps6plE7FsVyvEWfbTHOBNYlkmRmLAebeLpLpHtIq88KnA2rZl/3N4LJrp6E3
	OSyi4/nQaZvOdx8RjlhAPfAnqE2rkHOcR+j6654OAHHBprXj/U6n60CcwRqEpSnN+RIlv+yMccMEd
	Dj8UpqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4guD-0000000Eppq-0LTb;
	Thu, 10 Sep 2026 15:41:41 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gu6-0000000Epkp-2tDg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054895; x=1820590895;
  h=date:from:to:cc:subject:message-id;
  bh=Y6d2CO7EnuJIobxY+n8MiZeRUMilrTZ3+MjTaHw6U5w=;
  b=GG0CtRNx8E0ymxHhn++a92MDOf+s72PI7oI0XDXsDbeNOLx8EBKeXslR
   mC9k+cdH5j36fu5bjrkDYv7H/mJbTGL6ndzNh2QEyYXbmjcnaddwOQAgf
   3LPEQF0dgtSl2SY5OzTRZXUQ8ilA3V1pnhJudRQvOvp0PFCQ1QGSBQkPZ
   X01519T+YOa7JGAeVFLK2mIEHOgc6CxNFtnxqZ3XF7l5+nEg/KaA7ZX6M
   iW27IlGutn4kObLAHJ5fE8bhuYIfPkAm5wIXduNZDV1bhxOcZFuDKOXyT
   iJwrniBQeyGQAFxGZHriuouSD1gWO17dPWSn4hdlTySjn+zvMM9T/mB5M
   w==;
X-CSE-ConnectionGUID: 2rX3dtkCQ2uOKywHLGeA2A==
X-CSE-MsgGUID: 3WOFmgboTr+vvzTj6y1wgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066958"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066958"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:33 -0700
X-CSE-ConnectionGUID: Sk6CMoSpRtqjVuz0ISuv6w==
X-CSE-MsgGUID: U4KNIzfSQD2pj1GKf9STHg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qg-1RHh;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:40:54 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 150/294] Warning:
 drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description
 in 'lp8755_platform_data' (did you mean one of: 'mphase')
Message-ID: <202609100447.zZyMwFaw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_084134_742694_A35D5C64 
X-CRM114-Status: UNSURE (   7.81  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 905b7c450d5e7fc2b71fcfe266151834717521eb [150/294] regulator: lp8755: remove platform data based probing
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609100447.zZyMwFaw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100447.zZyMwFaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100447.zZyMwFaw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/regulator/lp8755.c:72 struct member 'mphase' not described in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data' (did you mean one of: 'mphase')
   Warning: drivers/regulator/lp8755.c:72 struct member 'mphase' not described in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data' (did you mean one of: 'mphase')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


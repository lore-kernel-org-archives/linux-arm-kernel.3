Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE68DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+GQfwUj9BEWXcIl5CXK1WsS9OyQz10u/SNwLxz/D20=; b=yOCreNNoftmBkEP1rs5dl/EqPo
	Zlmk00Banbgh2Ga8BYZiCrvAQ+iMuHtnNde1jGEpx4I4HcNn8/MRdMZzsDDFSp8Pb1JVpdwDSQvEy
	xciAIyDcIHCD3r+fJeioC30Y2jqE8sj73fs8xvGLZLXV9nmEo/IRKKS+t3cae62sKErdt4QZDmWXr
	d4qrmbB75+CfkW0K+tXIS37WqSLsGd8CjDdnwefdg+XV4QqdU5i6wnmOPewNGyR9LDD9b9LI0GvpB
	kszkKqlVs2DZ8fWn4ccBvd6TBJEvyH47OMIZgUD+RConFl8/fedhxGBf1D6qtTCbs5WVGfn61mMJ4
	CUsVW3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwP6m-00000008YZr-3IS2;
	Tue, 18 Aug 2026 19:04:24 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwP6j-00000008YZR-3eas
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 19:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787079862; x=1818615862;
  h=date:from:to:cc:subject:message-id;
  bh=edryjETM1b9ALcicNgdttfhXdJLPD+ETEqFh9GdoD5Y=;
  b=KFP7Ce2j1chymKAyMPwBcqKj3QKQv9r4wby5s/0VqlUxQmyvroKDr60T
   PNwws2ELc1Caqplt1XdhEkyMcRyGtwamArGlT5bSdUvd0y64uHofa5ZjT
   s0YRsbvHCvv9GH/YrvKXqNXCaZ5NADlBfhJBl6ZinLSnUxsHHy+JYfcTk
   p/QfNw3OQj8oPGcm/iCUQnxk4owMFYj1hMZrJIR0iYL+upVhxzB1CFHMs
   ho6WKo7IEME14NGebyUdXBbUuUnoF64Q0m3nnJIV5YFUxmE8HbMOxDoUZ
   p+G/IVY5RpQydpsptvzoiUM0AYHEZCEaWpq1jF7ls9ZCMUX3BLnc8aLfR
   w==;
X-CSE-ConnectionGUID: htvpxgBnQKeULX1i6fjhLA==
X-CSE-MsgGUID: Hc4pzPfLT0SicEWXDg20KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99107158"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="99107158"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 12:04:20 -0700
X-CSE-ConnectionGUID: no7tIQtKRUuHj593XfqTxg==
X-CSE-MsgGUID: hYwHAO6USOe+jQQHJJNmSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267285589"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 12:04:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwP6d-00000000eW2-41bu;
	Tue, 18 Aug 2026 19:04:15 +0000
Date: Wed, 19 Aug 2026 03:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 186/217] Warning:
 drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in
 'si5351_clkout_config'
Message-ID: <202608190243.7GvNyBj4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_120422_045799_F1E6B9FA 
X-CRM114-Status: UNSURE (   9.12  )
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
commit: e7970ccf7d43de4fff1ece1a060514af6a9ffbb4 [186/217] clk: si5351: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260819/202608190243.7GvNyBj4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190243.7GvNyBj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190243.7GvNyBj4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_xtal' description in 'si5351_platform_data'
>> Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_clkin' description in 'si5351_platform_data'
>> Warning: drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_xtal' description in 'si5351_platform_data'
>> Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_clkin' description in 'si5351_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


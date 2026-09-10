Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B8FC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b7XZpcLjk1pDkUG0O0c+ZqQZwgw4kvwi5EoW2mx+obg=; b=BvQFJkK4pegiaMEvWorZSgOPur
	/eOneJkaKR5k62E2PsUqVkjZNfEq5yb9HBg6XutKvtuQdjg8eXwXmdEIN+81NVxTwhSWmgJSnpBSO
	KZl7+rcpGGrM+K0W4/mTjFtk7kFebl6hP0RSw/4KLNaFBs90fNI98jeZlTGuHijDyUtZ0OEd5IaVZ
	MWb0qCJdDVYq6cZCXpB0GolJWYlMMgwvOr/QWdPPdkfHH8JzsT9IZF26AAkSFxhsHjgsOLiZ8EK42
	jFatjVjfZ4+2Mv9fqLywv+otxNHgoE+usxqx3ePY8nj4G2+PTHmNU2nQMeN5YPecDa+2Cyx7qUEAz
	PSgDgLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gu6-0000000EpmA-493R;
	Thu, 10 Sep 2026 15:41:34 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gu5-0000000Epkp-0jqE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054893; x=1820590893;
  h=date:from:to:cc:subject:message-id;
  bh=wAH4YynYb/u7pODfX/919oy/mmKRjBFNXvdUAi+SIN0=;
  b=OkcRhFSYnvKUrIvl9kBkONvXw69W2yUilQj02E43Q+9ZXBQzKV3rHosU
   3AuiXULpzRaTxJoH0bQA2UPnwfiz3dJd7TJLQV0atZKTGhNGaWfnwDFDP
   iIlV1hXU7g/fywzhUw3a8qFypoXFTYuQ6WBkY4E8IC9DQ9ElPbXV2jt+D
   nAU/WA5nHzDyvjqYPqDx5GW7djK+dsaf42J+3uc2xWpVi96wfM+lpR8rS
   n6CNEBrlCspOqXA1UW1LRG7Tm3h98pNh5tXbIAfIjVQtlHC3K5/ibeMOc
   Guufmvy13+H5VmDdF6BuTWC1UUNRwZlffYZx8q1Gn/xiuBvTFznvJgJJl
   Q==;
X-CSE-ConnectionGUID: EOdtnZzpRCqVdYVJrJ/4Gg==
X-CSE-MsgGUID: EepjXUKSS3OePgD+myxT8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066955"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066955"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:33 -0700
X-CSE-ConnectionGUID: 5zdW+OM7Siy8VOTq5xn0BQ==
X-CSE-MsgGUID: bEY0HfOwSae3XYG7HAvhoQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qd-1Fjg;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:40:57 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 128/294] Warning:
 drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in
 'si5351_clkout_config' (did you mean one of: 'clkout_src')
Message-ID: <202609100456.ZiTH0pix-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_084133_228474_57FBAB4C 
X-CRM114-Status: UNSURE (   7.92  )
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
commit: 0ee82eed70149eda4e0d07f4f7d02b59d0728b32 [128/294] clk: si5351: remove pdata based probing
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100456.ZiTH0pix-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100456.ZiTH0pix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100456.ZiTH0pix-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config' (did you mean one of: 'clkout_src')
   Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_xtal' description in 'si5351_platform_data'
   Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_clkin' description in 'si5351_platform_data'
   Warning: drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config' (did you mean one of: 'clkout_src')
   Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_xtal' description in 'si5351_platform_data'
   Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_clkin' description in 'si5351_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


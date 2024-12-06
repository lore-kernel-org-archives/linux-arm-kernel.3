Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EE3E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4p25Q55LTLQH9UBehKvwUTxZDRXv2IUCTANWHxXDK10=; b=XUw1UUdoFTxRLdNLF1Jzw4Q7lr
	mWhAfpLCxlRke2mAwcIalhZAWtoyM9pkFDV7Eh17yQpI9WsY/ai9yM9alnUdXbArGb1rtNQhtg+j3
	OsOUQY2Zj8tleHER/wScqPl03tQfJxBYUtyiGQ06dabg6WA4mvtv/HLJZPGsI8I0l+AaeZ5u/gzez
	ytMeMfMNpK8MkDYU+iE3tqL7ezU4dWBtPFU7lobxXH8QgX8sKkg5OAlFLMz8VIkVPXTRwA0tdJ4yJ
	taHHeAff4VGNJ2Kmt4J3Jx52nMvL0AcpSoKwW7ICPh/0D3COSRKPsYuVAaBIgcsf1V+JTB1WNJrYJ
	Aor8jFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJO7A-00000000KbT-1wsu;
	Fri, 06 Dec 2024 02:30:44 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJO65-00000000KTl-14cV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 02:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733452177; x=1764988177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UWYkmQgJqsODlM0e3u/6lpT+QT8jC6RKy54hcLbglIU=;
  b=RCoVGAvw6yJrbnrmU1ycxuyRlHqOu7Q6q31nEhLurKnCZsmI5xL5nIF8
   VIuQsihpZeCbyn+I4x6XbYm9V/ecWvGJCwPpY2J6ooS3nsEtMYBQruyC2
   23J53gZY3WSpjM9uDh0dIFhp+Imezq73Ul4D3BnYs1JZ1PdLj8cvbNvd5
   fs02HWMJtrIjlP8OVX8iO4boN1TjHMUcH2F7G3mBR3XrWQgNP8OGQZzAw
   24gGebAXhmXvZL1Ih6VZQQ9dCZHxOW3rxLcy99NDqvcqVcar9i6mP9tt7
   uTspissJ7MvTLdQwGKyuMjTTFjvL4WRGGS7bC2aPqyBhdhEtM8XNimmf+
   w==;
X-CSE-ConnectionGUID: zquS4JaGTVCwhNPofcuYZg==
X-CSE-MsgGUID: p0pYi0U8RcS1GFtF197X1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33943019"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="33943019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 18:29:35 -0800
X-CSE-ConnectionGUID: lwXnpxdgQ6yYKcNCD6eNMA==
X-CSE-MsgGUID: znHyy5KWTeu/Yt7uR8mtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94749549"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2024 18:29:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJO5x-0000cl-24;
	Fri, 06 Dec 2024 02:29:29 +0000
Date: Fri, 6 Dec 2024 10:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] clk: samsung: Introduce Exynos990 clock
 controller driver
Message-ID: <202412061048.3gu75pLi-lkp@intel.com>
References: <20241205193423.783815-4-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205193423.783815-4-igor.belwon@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_182937_339788_DFF91C6D 
X-CRM114-Status: GOOD (  11.96  )
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

Hi Igor,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on krzk-dt/for-next clk/clk-next linus/master v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Belwon/clk-samsung-clk-pll-Add-support-for-pll_-0717x-0718x-0732x/20241206-043559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241205193423.783815-4-igor.belwon%40mentallysanemainliners.org
patch subject: [PATCH v1 3/3] clk: samsung: Introduce Exynos990 clock controller driver
config: arc-randconfig-001-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061048.3gu75pLi-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061048.3gu75pLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061048.3gu75pLi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/samsung/clk-exynos990.c:13:10: fatal error: dt-bindings/clock/exynos990.h: No such file or directory
      13 | #include <dt-bindings/clock/exynos990.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/clk/samsung/clk-exynos990.c

    12	
  > 13	#include <dt-bindings/clock/exynos990.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


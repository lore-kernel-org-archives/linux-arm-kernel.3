Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFA0CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+24megX2Ew8mouYg7ffKFfhJAlPa4GTjPRKCpZOtUQ=; b=5Eos3Ll1wQUX3R5lDqR/Jck6cH
	5I+3u0IgcCDw0u2kV0ZJj8R4JAWqf4pcHSzXe+AKlCxw9M3oazI5WTAVu1inSf8CSTjZdHZI+GLgo
	9Z33NIQml43A/CC9g+1vTfL4LqCfbeF6i+qpE+S7SC3muCQzD1l+ZDbYqBqy3ZzLiJgeCP+ONzE71
	I7fi6+kQuS8jY0394gCRU5ytKSn6SRSc3qJNxjLrkF64HofkVOf/MTxUffo/bD0MB5kFYJ44ArQyH
	Hh8D1TSwvUkSb0rGkEJLHHqOL3soe78Uppmwh+BH5iRtVd099nnVRwe5CT3SGkJO08hywRb5qLCXA
	Jf20ZL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnX2-00000001TGP-02Yr;
	Sun, 14 Sep 2025 14:16:44 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnX0-00000001TFe-0FuN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757859402; x=1789395402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LC3H0PVcyqKsgsnH8G6RjhY7nYzGXX6eP+wpc+zEEsM=;
  b=ej3/aRzshsMfaU6A2muS8jmsfDp5hOI3nkMuu66PLt4U9+wJrY24dSOF
   YRQnyX4CGLDLYXQN2OLhuEfG0f8XryQxfm0cc0KGDGnKxVCYVkrcQ/PZ8
   y4XXcRWZZEYiQHnWVeeuSwU99vrN9fk8d5QqTsaMk8HXMkEs0w5c3ibR5
   jN1Jm+4b3LnYoIubksCzsi0TM37xeaYI0qIS3RlIlfWaAlFTMN+ilTDUJ
   GvVr5dMmFU1rHcrJRNB5a9uI0URQglXwkuXNju8bG8Qpk/IdFSCVZKkTv
   uAqcoms36rlNAFDAslfns0r6sD/jN0Ief1K7r5xRcXp//K5LABNQFyuqW
   w==;
X-CSE-ConnectionGUID: vfZlp/+MRlaOASDcS/b4eg==
X-CSE-MsgGUID: z0YhzQ47SLq93Yn/BW71/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="71503323"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="71503323"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 07:16:33 -0700
X-CSE-ConnectionGUID: fKFq+2jnSAaSeZDt1z3VvQ==
X-CSE-MsgGUID: Zi1Q9B4xRvyVk5+bxvVdOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="174224891"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2025 07:16:30 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxnWi-0002Sy-0K;
	Sun, 14 Sep 2025 14:16:24 +0000
Date: Sun, 14 Sep 2025 22:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] clk: samsung: introduce exynos8890 clock driver
Message-ID: <202509142156.qb0htmwo-lkp@intel.com>
References: <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_071642_119713_8DB94BB6 
X-CRM114-Status: GOOD (  12.39  )
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

Hi Ivaylo,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-dt/for-next]
[also build test ERROR on linus/master v6.17-rc5]
[cannot apply to krzk/for-next clk/clk-next next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-clock-add-exynos8890-SoC/20250914-202302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git for-next
patch link:    https://lore.kernel.org/r/20250914122116.2616801-6-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v1 5/5] clk: samsung: introduce exynos8890 clock driver
config: csky-randconfig-001-20250914 (https://download.01.org/0day-ci/archive/20250914/202509142156.qb0htmwo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509142156.qb0htmwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509142156.qb0htmwo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/samsung/clk-exynos8890.c: In function 'exynos8890_init_clocks':
>> drivers/clk/samsung/clk-exynos8890.c:49:45: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      49 | #define QCH_DIS                 (QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))
         |                                             ^~~~~~~~~~
   drivers/clk/samsung/clk-exynos8890.c:88:31: note: in expansion of macro 'QCH_DIS'
      88 |                         val = QCH_DIS;
         |                               ^~~~~~~


vim +/FIELD_PREP +49 drivers/clk/samsung/clk-exynos8890.c

    39	
    40	/*
    41	 * As exynos8890 first introduced hwacg, cmu registers are mapped similarly
    42	 * to exynos7, with the exception of the new q-state and q-ch registers that
    43	 * can set the behavior of automatic gates.
    44	 */
    45	
    46	/* decoded magic number from downstream */
    47	#define QCH_EN_MASK		BIT(0)
    48	#define QCH_MASK		(GENMASK(19, 16) | BIT(12))
  > 49	#define QCH_DIS			(QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


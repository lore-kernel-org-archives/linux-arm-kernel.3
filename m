Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFEC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWwc2lIEFiOihP0DxoRqTphIa7q/rxg5pjpoYgax4io=; b=dbxlfQKC5ppl1wZbeq9PLkfHhJ
	dRLn5BVxes/5/1aXTUKg7VGXPJAVjD4/HFnOYXQB3laEcA6Resx8dRZJSS2S9FAeV//h3ZJYEHVQW
	Km7LkOKpplNi4vJrlxbwM1Wx8QvTy1i7mUNZRRLwcYjOjPb0P35Rqa/p+1ftkFD79YIS5l9rNh1Jw
	TIFDwso964w+YN1ooB5aGl6Wl/4zHfjQzMTfoWLeReGPrrHrioHqY1tJ9KGWHwlaCQNTS1+LO/sV2
	p3BfFh8d9SSsxIvVjiHHvYqIJ3BK+dIvOBRIyzemSoz0SWyJE4vlT+WD8UM1cjnfzd6+skoCcJTXs
	SlUih3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFQnJ-0000000H1OS-2t30;
	Thu, 15 May 2025 05:06:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFQlI-0000000H1JP-49EC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 05:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747285445; x=1778821445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1DT69l4hCTQvl+W6lgZGKWwC2Lyi1FbgKgW9qNW6d0=;
  b=EhiZrRggE1GxNdX8MEaa4+NBlVVQ3ceY/J0fc5QxP9DN9VK/a0RNjSyh
   yOWRfhTrbfx279pgagqUC2hFDmNmxgCVpgtXpvV+J/m1TxE+yJvyDmek5
   YeBra3x8Mj6A9d2kn2x+OuBT9MbZ9RPBaWOGwF9+APLtIGyFk+EnHnfbc
   OqG3cQ434kSGfwvkaO6fcLVb6G6WIFvZ4WDgr92glLiz9eF3KxnZml/pw
   fDUOGCImNeRxsj39wDEulLD0GkHJCLI5qb/5zqXdul1H+qf6ROlwtPlxJ
   67akkldR9oFJdkpGbHqY7XozdJ+HeikrKcEeCmRcFr2b02r7g9NRaij2B
   w==;
X-CSE-ConnectionGUID: hkrWgfnsSLucAo9BFKuFTw==
X-CSE-MsgGUID: ljcn8XS8ThGOhrwFHvWOsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66759274"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="66759274"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:04:02 -0700
X-CSE-ConnectionGUID: pHVw2Ts6Ta6UMMsXsSi9uQ==
X-CSE-MsgGUID: +zLoQS0sS7ia7mtfmnifEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138754815"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2025 22:03:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFQl9-000Hwd-1P;
	Thu, 15 May 2025 05:03:55 +0000
Date: Thu, 15 May 2025 13:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
Message-ID: <202505151255.rCHp8Bvu-lkp@intel.com>
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_220405_066681_B4BCBBF4 
X-CRM114-Status: GOOD (  12.93  )
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

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on robh/for-next linus/master v6.15-rc6 next-20250514]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable 'ostm_of_table' [-Wunused-const-variable]
     235 | static const struct of_device_id ostm_of_table[] = {
         |                                  ^~~~~~~~~~~~~
   1 warning generated.


vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c

3a3e9f23c2cae9 Biju Das 2021-11-12  234  
3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_id ostm_of_table[] = {
3a3e9f23c2cae9 Biju Das 2021-11-12  236  	{ .compatible = "renesas,ostm", },
3a3e9f23c2cae9 Biju Das 2021-11-12  237  	{ /* sentinel */ }
3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
3a3e9f23c2cae9 Biju Das 2021-11-12  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


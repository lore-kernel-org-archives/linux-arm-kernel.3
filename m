Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDA1D10384
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yl1EYo+dH7jDK00m7bNSAK3ZtAmbF0QnTKPkRFraQqw=; b=SsLhI8ILnVHeKITIO+rmnBatiJ
	tJPKBXmEB5+fL6vDPI75qnydwBPR152gBYtxaJmMzQwK0cSGHUty1DZ68biiuAzV8dw84RiNGfW8/
	rbtjZIY7pMfzIOzVDVo28qmKNZoYHlEjeQsD24zlFQ8Pc76kEyEHkH5ftqTjSVuTUYwrhuDfl4AoH
	7YJtTbASsYK3BrROjpCrw4UpwVl6cyDvJJbsXV/UdqFBf5gIVOreQ5CwJNjF1UdD7VBTHYpiXFJbK
	2NNi1ap4nKJLiLv+wpCRih7SCK1Bj8qRVtdCUAAx3WrImMx4Ti1PLX+LqiADfMMIGX+9t8v6orJVi
	4/91eSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOA7v-0000000EXA2-2yN2;
	Wed, 26 Nov 2025 07:39:47 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOA7s-0000000EX8U-1Agw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 07:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764142785; x=1795678785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EMct42WoiiGjcksMl7vwP//cvhacHtrR+zrVyuvWuGI=;
  b=bH2/l5Hj2cFnXbIG6TdgCUAma34mFxHlz8s0KTFpn35TFLu7BBflonP9
   QQ0d8RS20EMyS1Js1IcbYGQZMyxcTn4WHilkbSdSjQ+Vg+yS710izzJh5
   xvqQ4RjQyftRstzDfUAF0fqKLOAYvAncYKPmWJ878jDcOHoCNFROiQGIO
   Rd3Etf2n9vs+xaQSGkXuNuQCflYgQCWPBVwM5DHe7U0RLO0L9R0EgvTXj
   l/wUHnI2AHrxmQcn9MCtksTaZ3ssrFzezDIKWQw3hVWhmF1uITQ9PuSr1
   nneX3skvtiXoSZrJ0LvfYxizRWmJjVJLxtdv75Y/c8OVbNzVmiXZHfwrG
   A==;
X-CSE-ConnectionGUID: kVXiC3T3SdulexTMTczsJA==
X-CSE-MsgGUID: v5tObHr6RPm7slFhIvoBAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83563496"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="83563496"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 23:39:43 -0800
X-CSE-ConnectionGUID: U+ariKqbS4mjldTk3ROtsw==
X-CSE-MsgGUID: LJpZH5gTQ9ah/6mzKzzK6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="193297094"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2025 23:39:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOA7i-000000002bl-41Uh;
	Wed, 26 Nov 2025 07:39:34 +0000
Date: Wed, 26 Nov 2025 15:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH 5/6] power: supply: max77759: add charger driver
Message-ID: <202511261521.hSYp4ttf-lkp@intel.com>
References: <20251123-max77759-charger-v1-5-6b2e4b8f7f54@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123-max77759-charger-v1-5-6b2e4b8f7f54@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_233944_361411_0307F33C 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Amit,

kernel test robot noticed the following build errors:

[auto build test ERROR on 39f90c1967215375f7d87b81d14b0f3ed6b40c29]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-power-supply-Add-Maxim-MAX77759-charger/20251123-163840
base:   39f90c1967215375f7d87b81d14b0f3ed6b40c29
patch link:    https://lore.kernel.org/r/20251123-max77759-charger-v1-5-6b2e4b8f7f54%40google.com
patch subject: [PATCH 5/6] power: supply: max77759: add charger driver
config: um-randconfig-001-20251126 (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511261521.hSYp4ttf-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `max77759_charger_probe':
>> max77759_charger.c:(.ltext+0x27b): undefined reference to `devm_regulator_register'
   /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `enable_usb_otg':
>> max77759_charger.c:(.ltext+0x983): undefined reference to `rdev_get_drvdata'
   /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `disable_usb_otg':
   max77759_charger.c:(.ltext+0x9c3): undefined reference to `rdev_get_drvdata'
   /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `usb_otg_status':
   max77759_charger.c:(.ltext+0xa06): undefined reference to `rdev_get_drvdata'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


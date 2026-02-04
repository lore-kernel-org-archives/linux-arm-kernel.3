Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54828E8B39A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 05:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGKHAlxodENFmO6x03GOifdQ8ebYjOZeujW31LfqbS4=; b=QK8xOSekcMVStB+g5iOWKebNj4
	6sMFtCLC5scK/0MWUyIavs9hpFePOj8E0KNn1CxWAUv1T30wEqLhmc8hYspXepStx6uQEWEXQIZ4Y
	xb9e3MeenMV54qmzl/UCBd3hdMyp4VF10WoEOXdrlTdif1VjzihIpgQc7ShD0uNr0MNvQ3plu+ico
	MJiDkgj7yb0AbK1t9eO1YZJ47yYQyHVMP/+ZokCHVrqlrPPF4ElLd2pDvV1ZpUofNpvhfA5lZlhWT
	b0EIH/Ir3enCP88PNHQMvCfG3ldgxb0oQggjQqnTmnEwtztQ+3Lh30TLtGjdNXgj4KioArzVry0Zg
	VMDzXo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVXr-00000007wfa-2jgX;
	Wed, 04 Feb 2026 05:35:20 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVXo-00000007wf7-2oWc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 05:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770183317; x=1801719317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UiA+0nIlRA9eZg6V1t1vdhmUp7Yaj6ecIYLUK5A2F+U=;
  b=hfEnOfDq5LNiKJcdpRFl16MzrN/2KfpHazCUYUJ4eI/NgWj9Rh5y4j18
   HGWYBQduDALn+xlIZx7gzoC86cLJXj5P5niKxgtRQJ6hBNPFXGCMp3OJ9
   q+eJ9fyINAwLA4OOkvmmFg15ei86jbM00qauL/qYf8bNfbMmbXSl2zop7
   2Gw7Voj61vv1/ejykPDU0vRTfekmeIX7nXK40yTMXmAmn5lTde5suVTXI
   dWGmyKgrhuKcMZqpqspHs7fp1Fak9rxtKPotpIIrxQOmvQufit2rS07kU
   Bj7bk/s1eE1EscAy7ryFWEIDPYHUoB8fgEILyLFjM+F+wPY2uAz56ZIYH
   w==;
X-CSE-ConnectionGUID: r3ncDpryRpWai42Nvn/2mQ==
X-CSE-MsgGUID: 5bRjPuVDRYSREdc76ZFS3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82475013"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82475013"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 21:35:14 -0800
X-CSE-ConnectionGUID: GhG6b3VCQIeq3Y/x6PawtA==
X-CSE-MsgGUID: dquvDNJpRN6VUWvxIfdVGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209447946"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2026 21:35:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnVXc-00000000hTc-161f;
	Wed, 04 Feb 2026 05:35:04 +0000
Date: Wed, 4 Feb 2026 13:34:09 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH v5 4/5] power: supply: max77759: add charger driver
Message-ID: <202602041321.6ubHpkpR-lkp@intel.com>
References: <20260203-max77759-charger-v5-4-b50395376a5f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-max77759-charger-v5-4-b50395376a5f@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_213516_989616_8F4FB60D 
X-CRM114-Status: GOOD (  10.45  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-mfd-maxim-max77759-reference-power-supply-schema-and-add-regulator-property/20260204-065326
base:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
patch link:    https://lore.kernel.org/r/20260203-max77759-charger-v5-4-b50395376a5f%40google.com
patch subject: [PATCH v5 4/5] power: supply: max77759: add charger driver
config: sparc-randconfig-001-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041321.6ubHpkpR-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041321.6ubHpkpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041321.6ubHpkpR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/supply/max77759_charger.c: In function 'set_fast_charge_current_limit':
>> drivers/power/supply/max77759_charger.c:301:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/power/supply/max77759_charger.c: In function 'set_float_voltage_limit':
   drivers/power/supply/max77759_charger.c:343:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~


vim +/ret +301 drivers/power/supply/max77759_charger.c

   295	
   296	static int set_fast_charge_current_limit(struct max77759_charger *chg,
   297						 u32 cc_max_ua)
   298	{
   299		bool found;
   300		u32 regval;
 > 301		int ret;
   302	
   303		ret = linear_range_get_selector_high(&chg_ranges[MAX77759_CHGR_RANGE_CHGCC],
   304						     cc_max_ua, &regval, &found);
   305		if (!found)
   306			return -EINVAL;
   307	
   308		return regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_02,
   309					  MAX77759_CHGR_REG_CHG_CNFG_02_CHGCC, regval);
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA099C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 02:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pb11/mckuMZgJ7exsFhgBkvmI8sJ83SVYGIFta4LcXg=; b=v0Hdk1jL5ZnFfqwyYsX2cSV0es
	Db8AAspWZfuFzGkSslGr2L05Rta1USzF/jZjfH/DxNJnK5ex5fk6omd1gp6ZDmz2N9PIWqpKQpJSt
	n7AIpwMvHZw8sjA2Tdp1hg8stvufeQewOf6Qkzz4Tm7JPmit2BjD+WjQj5V2anQZZ+lSqRxWphhxo
	Jb54ic5RRQ+In3etEgQV5YIrVRxhn3hydWLOu/hxeR3+ZVxhy1OviZbBm5IgbUGDMIaPuyyASEm+2
	enr4bcfdvXOojkZtZ31ZJC/7tXC9lqIi0AlvOO0hjm7Zbx7+fn3uDiDvhZeK5tSnejEEO1flKVxTi
	fskLzbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trSWM-00000001PrE-2T6p;
	Mon, 10 Mar 2025 02:05:34 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trSUh-00000001Pgb-3p5k;
	Mon, 10 Mar 2025 02:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741572232; x=1773108232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6CykNk9cUToWOqSzi+0FSLKdtYh2ymFzaVs96PibQ6M=;
  b=bVOnBdhhHR3fLgAUAoxH2rDH8/4BS8UwCRvnhjaX5qMo1hL86QRktfKS
   FxIcl603aNrBvLmRPcB3xccrcRYkNp0QjHluYkM8KBQcPR3sCSGEPlEA0
   ZhGIKncuuDPoNIRRviehtnAp6iPqedMz3ZxgDu64raUJ0Of7+il+VG7oG
   Kwwhd530B/TVPhQ8bYiQvIpfU95+VWdafQfM+ytqHUgbx739FnF/hrL6x
   LZV1OiEC5kcaOxLtarOwY7RRj0C9Tkpy066L5hVuZTCyvw6fqsrULRgJP
   wW+iVXRSdLjTtIkaMt1WLG9xD7eK/bAn47VsFYiBtnqllucUyErHYVly0
   w==;
X-CSE-ConnectionGUID: SIChJAB0TpOAKda74Ayk/w==
X-CSE-MsgGUID: WXY5Yb58SBiqKLGWL5VhZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53193569"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53193569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:03:50 -0700
X-CSE-ConnectionGUID: BjxoIDHuSPq56c0P2KxA4Q==
X-CSE-MsgGUID: que1fRfzQBqTdfIlhlvZOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124456649"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2025 19:03:17 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trSU6-0003hE-2M;
	Mon, 10 Mar 2025 02:03:14 +0000
Date: Mon, 10 Mar 2025 10:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/4] ASoC: meson: g12a-toacodec: drop the definition
 of bits
Message-ID: <202503100909.xnqNYW9u-lkp@intel.com>
References: <20250309181600.1322701-3-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309181600.1322701-3-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_190352_011107_A31A48BF 
X-CRM114-Status: GOOD (  17.43  )
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

Hi Jan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Dakinevich/ASoC-meson-codec-glue-add-support-for-capture-stream/20250310-022013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250309181600.1322701-3-jan.dakinevich%40salutedevices.com
patch subject: [PATCH v2 2/4] ASoC: meson: g12a-toacodec: drop the definition of bits
config: i386-buildonly-randconfig-005-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100909.xnqNYW9u-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100909.xnqNYW9u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100909.xnqNYW9u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/meson/g12a-toacodec.c:83:11: warning: result of comparison of constant 18446744073709551615 with expression of type 'typeof (_Generic((mclk_sel), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigned short)0, short: (unsigned short)0, unsigned int: (unsigned int)0, int: (unsigned int)0, unsigned long: (unsigned long)0, long: (unsigned long)0, unsigned long long: (unsigned long long)0, long long: (unsigned long long)0, default: (mclk_sel)))' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      83 |                                       FIELD_PREP(mclk_sel, mux));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:53: note: expanded from macro '__BF_FIELD_CHECK'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      74 |                                  _pfx "type of reg too small for mask"); \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   1 warning generated.


vim +83 sound/soc/meson/g12a-toacodec.c

    42	
    43	static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
    44					      struct snd_ctl_elem_value *ucontrol)
    45	{
    46		struct snd_soc_component *component =
    47			snd_soc_dapm_kcontrol_component(kcontrol);
    48		struct g12a_toacodec *priv = snd_soc_component_get_drvdata(component);
    49		struct snd_soc_dapm_context *dapm =
    50			snd_soc_dapm_kcontrol_dapm(kcontrol);
    51		struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
    52		unsigned int mclk_sel = GENMASK(2, 0);
    53		unsigned int mux, reg;
    54	
    55		if (ucontrol->value.enumerated.item[0] >= e->items)
    56			return -EINVAL;
    57	
    58		mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
    59		regmap_field_read(priv->field_dat_sel, &reg);
    60	
    61		if (mux == reg)
    62			return 0;
    63	
    64		/* Force disconnect of the mux while updating */
    65		snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
    66	
    67		regmap_field_write(priv->field_dat_sel, mux);
    68		regmap_field_write(priv->field_lrclk_sel, mux);
    69		regmap_field_write(priv->field_bclk_sel, mux);
    70	
    71		/*
    72		 * FIXME:
    73		 * On this soc, the glue gets the MCLK directly from the clock
    74		 * controller instead of going the through the TDM interface.
    75		 *
    76		 * Here we assume interface A uses clock A, etc ... While it is
    77		 * true for now, it could be different. Instead the glue should
    78		 * find out the clock used by the interface and select the same
    79		 * source. For that, we will need regmap backed clock mux which
    80		 * is a work in progress
    81		 */
    82		snd_soc_component_update_bits(component, e->reg, mclk_sel,
  > 83					      FIELD_PREP(mclk_sel, mux));
    84	
    85		snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
    86	
    87		return 1;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E63CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsjXSVdUyGdfarJeUBCrM6oJavtlUrZQGnD1kvq4R+w=; b=Xpd/XIml+IcrAkMO+uem8h+dwe
	lEsEoN2Cd9a1wWMOAWI1433fzzamI3m7wF9WmjO36MM9qDiKBOzdSl4IVlxJV6MiGLytRzWC6CPUJ
	2lHFWats52itgiXJhRmzUFJhJmM/XGK2I5WJxzPzNwUdawpiL8BlsPe5s/GO+90lxcnc0CR5TtkbX
	8cAVwN1JGnyTLdUnHfSo7FsqC7xwZUxIXjAcucYtODHRcjvS6VHhw2Aib+FxFKVxtGUTisBUy1SJ1
	xg/GTdLY8uLE8RVol4XkwWuxsje/k+s44ReLhB20FHE86FpQ2UnRcKtvEe5oiAOkkZeb1EZ3WnFQd
	u/5s0p4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDn6-0000000EHwi-1Jzz;
	Mon, 01 Sep 2025 23:18:24 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8wd-0000000DWkl-0xAE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 18:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756750075; x=1788286075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qUHEx3K9Fy8B+KsZYMB+IIP81VsmjWAE994TUdk8HXo=;
  b=Z3rfbtkqSgYGToUCCSk8FGdLRlJZEl17WI4PBVaSSahMr+ROrR/qOwO5
   9hTy6oEc86tkXcNHKuGBQYDE4kqWTh5EQ9DEZxZTfPJKDqHGvEg0tyilO
   wIdd9R7AcxwL7MAOZQRwh+K83xlIVBNkznYu1Te9REN9vCAMnQjKl3d3g
   jCCjVeYIur1XanW/oPrekZSm6aXx9JpidMqMuZVciuMhoahPCBosph1MH
   x0UP+uZda+vekowvQqDpHWUBtl89+EK6D8VBAv00sIVHscbOPObZAaHyZ
   rUB2hdb9k/3Rb2OG3TarZpYdKxk7cMyzGYI2TCYDjG4OTzMD9LfpR7T46
   A==;
X-CSE-ConnectionGUID: NAbe5kD9SdSbuXOqNXPF2w==
X-CSE-MsgGUID: vNkLrniaTUCV7ejQfOJxhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="46591629"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="46591629"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 11:07:52 -0700
X-CSE-ConnectionGUID: GY/rp180RaOLchUaSJ/+NA==
X-CSE-MsgGUID: OsIOuWyIQnOfS6IZpzdaoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175426955"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Sep 2025 11:07:48 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut8wT-0000tP-2s;
	Mon, 01 Sep 2025 18:07:45 +0000
Date: Tue, 2 Sep 2025 02:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Akashdeep Kaur <a-kaur@ti.com>, praneeth@ti.com, nm@ti.com, afd@ti.com,
	vigneshr@ti.com, d-gole@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vishalm@ti.com, sebin.francis@ti.com
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
Message-ID: <202509020155.fcjWQKFc-lkp@intel.com>
References: <20250901122835.3022850-4-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901122835.3022850-4-a-kaur@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_110755_317830_8B0BEDDA 
X-CRM114-Status: GOOD (  12.31  )
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

Hi Akashdeep,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akashdeep-Kaur/arm64-dts-ti-k3-am62p5-sk-Remove-the-unused-config-from-USB1_DRVVBUS/20250901-203422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250901122835.3022850-4-a-kaur%40ti.com
patch subject: [PATCH v2 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining macros
config: arm64-randconfig-053-20250901 (https://download.01.org/0day-ci/archive/20250902/202509020155.fcjWQKFc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020155.fcjWQKFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020155.fcjWQKFc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts:14:
   In file included from arch/arm64/boot/dts/ti/k3-am625.dtsi:12:
   In file included from arch/arm64/boot/dts/ti/k3-am62.dtsi:13:
>> arch/arm64/boot/dts/ti/k3-pinctrl.h:18:34: error: invalid token in macro parameter list
      18 | #define DS_ISO_OVERRIDE_EN_SHIFT(22)
         |                                  ^
   1 error generated.


vim +18 arch/arm64/boot/dts/ti/k3-pinctrl.h

    10	
    11	#define WKUP_LVL_EN_SHIFT       (7)
    12	#define WKUP_LVL_POL_SHIFT      (8)
    13	#define ST_EN_SHIFT		(14)
    14	#define PULLUDEN_SHIFT		(16)
    15	#define PULLTYPESEL_SHIFT	(17)
    16	#define RXACTIVE_SHIFT		(18)
    17	#define DRV_STR_SHIFT           (19)
  > 18	#define DS_ISO_OVERRIDE_EN_SHIFT(22)
    19	#define DS_ISO_BYPASS_EN_SHIFT  (23)
    20	#define DEBOUNCE_SHIFT		(11)
    21	#define FORCE_DS_EN_SHIFT	(15)
    22	#define DS_EN_SHIFT		(24)
    23	#define DS_OUT_DIS_SHIFT	(25)
    24	#define DS_OUT_VAL_SHIFT	(26)
    25	#define DS_PULLUD_EN_SHIFT	(27)
    26	#define DS_PULLTYPE_SEL_SHIFT	(28)
    27	#define WKUP_EN_SHIFT           (29)
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


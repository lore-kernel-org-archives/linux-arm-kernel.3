Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD06CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 05:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbSIXMUL3JvOkb7FBZQFR2xWKI+jscaTOLpTgj3IL7o=; b=YG9pyp5klR+nQnRcB9u2eu1V4D
	uYYNbY8F8ZeuotATdQ4FbcT8K0zm8pLyg222eHNuJxqpe7e2aYH+zpP19ifd45lu9HeHnjHNdQvE5
	ICkT3OtuD7SEYSb6GokV2Pa09nUBeZcIitXZo+og1U66iSdJCjF8GXdnYQU1+LUn9q97Ms//IKoH5
	JrWKB45WzxIbDdpr0CdrVwW8+PiGijwgENw+TEVzW3LV66jlz7MEJJqraL8dgDloliEhA3Fsj/xla
	Atn0AYOHY6J/ujuGedAIOPGg6PSq69ya/cM5NCJZnlTZGik9EJaipimI9KMkeQmemlt4yGMv4m4+v
	yYQ1Emrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7SEV-00000009pNn-1n2H;
	Sat, 11 Oct 2025 05:33:31 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7SEQ-00000009pLT-1IJC;
	Sat, 11 Oct 2025 05:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760160806; x=1791696806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i9MQD2vi87alMgAlFMVJwNlAR7uWjr5N9wlOTw9xWUo=;
  b=UfU0pM4hh9DYNVO1g/OpOdRHZGEy10zmyOuEYH4kajCV/ctRAsXs+Bl2
   YVcGpl1PCYSLz83/yYHnCSp75xkZK6FYuENJkuFKmqhp1KhAEZQLxZLBF
   8LFIEIQLx9S3TEsEqppZYdahpZzy2tGPKhqchRiXbLS9oArhjf6mS+JTD
   mQPz03uOz47m0Q51VhbQqZml73UiFqHsj7ioOCMJbschT3Tm6mA61Qj7X
   tVbsqsWUwmKWgL//ifEOaRN1XbYRBsJKO5I8fCZUu7Fz8TuuXIvFgj2Vf
   tfIAVYoLMPtXHCc2uU3FmdFICAwC8F7bUsZzk0VAeyow2K9TohdyD97WB
   Q==;
X-CSE-ConnectionGUID: D1K0BT+ITdKecZeSciyV2A==
X-CSE-MsgGUID: klTRPeJmSZ6B61+DGgRwvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73060196"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73060196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 22:33:20 -0700
X-CSE-ConnectionGUID: hm20f+lUTteEogIs84GaQg==
X-CSE-MsgGUID: KQgz213TSu6dzQ/MgUIx8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180968712"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2025 22:33:16 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7SEE-0003Xl-08;
	Sat, 11 Oct 2025 05:33:14 +0000
Date: Sat, 11 Oct 2025 13:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v8 6/9] regulator: Add support for MediaTek MT6373 SPMI
 PMIC Regulators
Message-ID: <202510111324.JD1amFXO-lkp@intel.com>
References: <20251003091158.26748-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003091158.26748-7-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_223326_361030_1CDE663C 
X-CRM114-Status: GOOD (  11.11  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on lee-mfd/for-mfd-next jic23-iio/togreg lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20251003-171606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20251003091158.26748-7-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v8 6/9] regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators
config: alpha-randconfig-r073-20251009 (https://download.01.org/0day-ci/archive/20251011/202510111324.JD1amFXO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111324.JD1amFXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111324.JD1amFXO-lkp@intel.com/

All errors (new ones prefixed by >>):

   `xe_configfs_exit' referenced in section `.data.rel.ro' of drivers/gpu/drm/xe/xe_module.o: defined in discarded section `.exit.text' of drivers/gpu/drm/xe/xe_configfs.o
   alpha-linux-ld: drivers/regulator/mt6373-regulator.o: in function `mt6373_spmi_remove':
   drivers/regulator/mt6373-regulator.c:598:(.text+0x6b0): undefined reference to `spmi_device_remove'
>> alpha-linux-ld: drivers/regulator/mt6373-regulator.c:598:(.text+0x6b8): undefined reference to `spmi_device_remove'
   alpha-linux-ld: drivers/regulator/mt6373-regulator.o: in function `mt6373_spmi_register_regmap':
   drivers/regulator/mt6373-regulator.c:624:(.text+0x93c): undefined reference to `spmi_device_alloc'
>> alpha-linux-ld: drivers/regulator/mt6373-regulator.c:624:(.text+0x940): undefined reference to `spmi_device_alloc'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.o: in function `regmap_spmi_base_read':
   drivers/base/regmap/regmap-spmi.c:26:(.text+0x11c): undefined reference to `spmi_register_read'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:26:(.text+0x124): undefined reference to `spmi_register_read'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.o: in function `regmap_spmi_base_gather_write':
   drivers/base/regmap/regmap-spmi.c:46:(.text+0x1f0): undefined reference to `spmi_register_zero_write'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:46:(.text+0x1f4): undefined reference to `spmi_register_zero_write'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:56:(.text+0x220): undefined reference to `spmi_register_write'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:56:(.text+0x228): undefined reference to `spmi_register_write'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.o: in function `regmap_spmi_ext_read':
   drivers/base/regmap/regmap-spmi.c:124:(.text+0x3f0): undefined reference to `spmi_ext_register_read'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:124:(.text+0x404): undefined reference to `spmi_ext_register_read'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:136:(.text+0x444): undefined reference to `spmi_ext_register_readl'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:136:(.text+0x458): undefined reference to `spmi_ext_register_readl'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.o: in function `regmap_spmi_ext_gather_write':
   drivers/base/regmap/regmap-spmi.c:164:(.text+0x528): undefined reference to `spmi_ext_register_write'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:164:(.text+0x53c): undefined reference to `spmi_ext_register_write'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:176:(.text+0x57c): undefined reference to `spmi_ext_register_writel'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:176:(.text+0x590): undefined reference to `spmi_ext_register_writel'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPMI
   Depends on [n]: SPMI [=n]
   Selected by [y]:
   - REGULATOR_MT6316 [=y] && REGULATOR [=y] && (SPMI [=n] || COMPILE_TEST [=y])
   - REGULATOR_MT6373 [=y] && REGULATOR [=y] && (SPMI [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


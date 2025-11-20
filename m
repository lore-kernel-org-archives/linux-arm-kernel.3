Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B23CF256D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1t+Ndq+wb1M1nKBlD7o879uV1xKTH+o++nXBFLMNOg=; b=uZej3QodcSDhgMbwQgzEfsgKdH
	Fx9vDf8sZBu/m8ZdB7/CMsHkdpZc9ut2pyL/cjb2AChr9MrJi5H2NzgnDVuDGfTB9NnP4DX/MzO1j
	jAl67WlEx2Et+js3E6BZrmqBU6faJXtWO2xEUIoN6mNNJYt21cMBEKpmLZAjY6KBD2+XkegIgEdu6
	jZwjaiD/6AMiLFEzt8EFrelMVjqka/qbgfh9r13tpSxcPYtKMo3SXJyrVqK0pfhQBvgk3kjE3kYBe
	FBMPY+3/Z2PDbrRgxOIWaiil4APz0h99JhwpYX6wJgBRz8g+lwl9fiyjRU++vYx4dUiNX54uFl3Fx
	zajkwiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLwFV-000000068Jh-4AHx;
	Thu, 20 Nov 2025 04:26:26 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLwFT-000000068JM-143z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 04:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763612783; x=1795148783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AoBCatCcUTo8pQY7B3M+B7FHb9s+7p9nuNzOnOSP1Pg=;
  b=JYwqZrIHpNULMeu1GNAwZ5GFYNFHVUL7NkNY1Obx/PuSFOJqtWea/BeN
   motlVUpFGMz7zA4w6e0ZaUWMkw6Nrjk4OFFxRz5cRRuoRhOtPkvOmwA3x
   gW9wQwn3Ig0GEK1nFSehXL7N9X/O+2JBgWIncCYVyq5hFXqdHjvZMxLQb
   hBc+UbJ54TW/ut5uA5DQdM6z9IZjEp09ttqL3oN/JPqbesQ4t904hkcb6
   HjJ3ScgFJBjAycZ6bhjQetqHn7DkebRIYoRBcMDRiyYf+I2/MpZgjiKZE
   r6pfcnH+w2nX13RKAvj31//msGLHZebPY9Yat7EtztrHM3OGjGNgkXAXO
   w==;
X-CSE-ConnectionGUID: Xb7WCSofTUax5dQRWnOjmg==
X-CSE-MsgGUID: cM8/HEA4Qha0iN+sce0a7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65758472"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65758472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 20:26:22 -0800
X-CSE-ConnectionGUID: Af/weTQ1RIqEzViG3Qz70w==
X-CSE-MsgGUID: 0Jb0A23gS9Gn7dgzvYydzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191511784"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 20:26:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLwFN-0003bL-0O;
	Thu, 20 Nov 2025 04:26:17 +0000
Date: Thu, 20 Nov 2025 12:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Pascal Paillet <p.paillet@foss.st.com>
Subject: Re: [PATCH v2 05/15] pinctrl: stm32: add new package to stm32mp257
 pinctrl support
Message-ID: <202511200853.efuVxuoM-lkp@intel.com>
References: <20251118161936.1085477-6-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118161936.1085477-6-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_202623_358438_3A350E01 
X-CRM114-Status: GOOD (  10.61  )
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

Hi Antonio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 61cbe48d9d1ff277bc54051fbab8b733b2e64ccb]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonio-Borneo/pinctrl-stm32-accept-string-value-for-property-st-package/20251119-011734
base:   61cbe48d9d1ff277bc54051fbab8b733b2e64ccb
patch link:    https://lore.kernel.org/r/20251118161936.1085477-6-antonio.borneo%40foss.st.com
patch subject: [PATCH v2 05/15] pinctrl: stm32: add new package to stm32mp257 pinctrl support
config: microblaze-randconfig-r111-20251120 (https://download.01.org/0day-ci/archive/20251120/202511200853.efuVxuoM-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200853.efuVxuoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200853.efuVxuoM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/stm32/pinctrl-stm32.c:143:10: sparse: sparse: Initializer entry defined twice
   drivers/pinctrl/stm32/pinctrl-stm32.c:144:10: sparse:   also defined here

vim +143 drivers/pinctrl/stm32/pinctrl-stm32.c

f263343bb793fa Antonio Borneo    2025-11-18  130  
f263343bb793fa Antonio Borneo    2025-11-18  131  static const char * const stm32_pkgs[] = {
f263343bb793fa Antonio Borneo    2025-11-18  132  	/*
f263343bb793fa Antonio Borneo    2025-11-18  133  	 * Default dummy value, as match_string() doesn't accepts NULL.
f263343bb793fa Antonio Borneo    2025-11-18  134  	 * Also not an empty string because it will match the old numeric
f263343bb793fa Antonio Borneo    2025-11-18  135  	 * values <= 0x00ffffff.
f263343bb793fa Antonio Borneo    2025-11-18  136  	 */
f263343bb793fa Antonio Borneo    2025-11-18  137  	[0 ... (STM32_PKG_MAX - 1)] = "x",
f263343bb793fa Antonio Borneo    2025-11-18  138  
f263343bb793fa Antonio Borneo    2025-11-18  139  	[STM32_PKG_AA] = "AA",
f263343bb793fa Antonio Borneo    2025-11-18  140  	[STM32_PKG_AB] = "AB",
f263343bb793fa Antonio Borneo    2025-11-18  141  	[STM32_PKG_AC] = "AC",
f263343bb793fa Antonio Borneo    2025-11-18  142  	[STM32_PKG_AD] = "AD",
f263343bb793fa Antonio Borneo    2025-11-18 @143  	[STM32_PKG_AI] = "AI",
66cbedfcc7caae Clément Le Goffic 2025-11-18  144  	[STM32_PKG_AI] = "AJ",
f263343bb793fa Antonio Borneo    2025-11-18  145  	[STM32_PKG_AK] = "AK",
f263343bb793fa Antonio Borneo    2025-11-18  146  	[STM32_PKG_AL] = "AL",
f263343bb793fa Antonio Borneo    2025-11-18  147  };
f263343bb793fa Antonio Borneo    2025-11-18  148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


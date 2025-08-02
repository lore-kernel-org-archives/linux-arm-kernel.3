Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F898C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVmhYqNtei1eqQoZ6cWUUligQ95Gk5AjZthMc4r8q1E=; b=Y4vsrID/bOmw0sXPZkcWFmMsg9
	KKobMLLFuyrbncUA9SROSrfQkUz5RlD0ci6P5gp+OTlO5bG7RzpISqr6fe8DhzJJ4oqK/kKukRnqq
	PdKa5lrU9xTYNXGWur4ktme6cVf0fEoSEKrTGMGkcfIi3AKvUC/squYNtoR6hpUkiYhIasMxeal2o
	6rDStLKzEODhblBvUGfQVBbJCSsGD6F9152RQW5oDv8UTmSHRU0p/CqBq8U6zlf/cgyY1CIa7nGhQ
	4Dr6VQO7IqBdQQ/bIzolGHgoyvnIrt80PQxqsB689MM6HPnvgoPsZwlWnGzv5mypzdCNSy/WszeFd
	fuAUdSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui0hB-000000071bg-0w0w;
	Sat, 02 Aug 2025 01:05:57 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui0eb-000000071Uw-3EwG;
	Sat, 02 Aug 2025 01:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754096598; x=1785632598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AY7j+7mv2dE5hcJpd/tAvFtobFcD1mgqJgfqGiQynVE=;
  b=GrjFrVCfg07bgBXf243cSC1nfnch7uVHeICmSlXlX5JsDfT0nJF/n4IQ
   dVre7CIjsKVRcdNm7nl0J7sjynVVVRsN4KRZ9iya3X5/qWWgIk/rjLPjV
   f2RlPK/yo1loqKYnmFC+eZTLiJsbuHdltldNV1EKcIbhx0GG2+KaflW8W
   b2kGGGBHa7ZzlUc3l/sml2thmK8/a8HzSbEMmnd9h8zh0O44hlOXrLYk3
   NcDTb83MGZmY5qIqMXCa/dRWtYIKyn9KPfTHnuTQwqLMY2I3greUG84XP
   X/84kgM9kw8vc0LqX+o60ip4jEzES0G6lLS05eHBwK560WkZU2Vd8o2QK
   g==;
X-CSE-ConnectionGUID: lOJco3RYScKf7IPh/9J73g==
X-CSE-MsgGUID: A435o3AFSleKj9iXmu1wdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56586894"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56586894"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 18:03:12 -0700
X-CSE-ConnectionGUID: k31tPsVwSPa+bMhbp3/FQA==
X-CSE-MsgGUID: 5Bej1XubQpKWWuO99tKLyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168165493"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2025 18:03:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui0eQ-00053c-00;
	Sat, 02 Aug 2025 01:03:06 +0000
Date: Sat, 2 Aug 2025 09:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release
 irq
Message-ID: <202508020802.nZBo2mGV-lkp@intel.com>
References: <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_180317_858003_77AE77D7 
X-CRM114-Status: GOOD (  11.98  )
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

Hi Julien,

kernel test robot noticed the following build errors:

[auto build test ERROR on b9ddaa95fd283bce7041550ddbbe7e764c477110]

url:    https://github.com/intel-lab-lkp/linux/commits/Julien-Massot/Input-mtk-pmic-keys-MT6359-has-a-specific-release-irq/20250801-211817
base:   b9ddaa95fd283bce7041550ddbbe7e764c477110
patch link:    https://lore.kernel.org/r/20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8%40collabora.com
patch subject: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release irq
config: arc-randconfig-002-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020802.nZBo2mGV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020802.nZBo2mGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020802.nZBo2mGV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/input/keyboard/mtk-pmic-keys.c:132:10: error: 'const struct mtk_pmic_regs' has no member named 'key_release_irq'
     132 |         .key_release_irq = true,
         |          ^~~~~~~~~~~~~~~
>> drivers/input/keyboard/mtk-pmic-keys.c:132:28: warning: excess elements in struct initializer
     132 |         .key_release_irq = true,
         |                            ^~~~
   drivers/input/keyboard/mtk-pmic-keys.c:132:28: note: (near initialization for 'mt6359_regs')


vim +132 drivers/input/keyboard/mtk-pmic-keys.c

   120	
   121	static const struct mtk_pmic_regs mt6359_regs = {
   122		.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
   123			MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
   124					   0x2, MT6359_PSC_TOP_INT_CON0, 0x5,
   125					   MTK_PMIC_PWRKEY_RST),
   126		.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
   127			MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
   128					   0x8, MT6359_PSC_TOP_INT_CON0, 0xa,
   129					   MTK_PMIC_HOMEKEY_RST),
   130		.pmic_rst_reg = MT6359_TOP_RST_MISC,
   131		.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 > 132		.key_release_irq = true,
   133	};
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


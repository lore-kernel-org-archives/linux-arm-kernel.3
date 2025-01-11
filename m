Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8CDE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYMRaNX3dgJOFv3sQfEKS6IbIY09vbcFg/8voDyEyG0=; b=Q+8cPAaqCuCYM5q5/+CHyuuoNi
	m20ka8C7y5m7F2jk0bCx2TBnhub9zF654tw5QDvQrraZw4iQyXr3/VxZUes7HHE3817zPuRewev30
	uav5rWqVWibuSM97gLyt/4PNQl5a0iFXxG+agMKH7GqLavyvwo586XLcisa6mtQruCkusuyyFI8kv
	3EH5+ViLcq+8o8eWD9e5NaC+JMB0U5td7awx4kHTFgb2oYfpLQwCBvpRZWiLc+FH1R3DrmijZqsHV
	+Vp7LsInfJsApB4pwXiKoFISQ8gNVgtFYiy1XqF2gSd1645iG0mgcSwpG7/dRCR5+0Dpcqdkj3MBn
	27JJpK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWbG1-00000000p69-2a4e;
	Sat, 11 Jan 2025 13:10:29 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWbEn-00000000ozj-3ou8;
	Sat, 11 Jan 2025 13:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736600954; x=1768136954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=th1e+p23X+UdstG6BGZ9C9GnjYoYqz3mjlgM+5zrhSs=;
  b=kr7rSy1qSXoEUQMAVg6757BL7sjcJu7TL4ppghhkERpobhBLBMAB21EU
   21Llm4WttLlNUM8xrRgaYoe6SueX3r64EWpJttxyAvnLPCg3zmL1TWaAj
   7radt4iXyU55PbD3Z4j+JCXM+OvY5l/L4p4CS9tk5xIHfAZUO3os5pF/A
   ylasGhFdQbeJfAfjjUmWAVG8WFnJTRbsPXhyl0JDzroHstBWE0hYZ7JYI
   RT8rXMiPGrVfM3r9s78Nyk3s/YOn42dY0f2O1m7AH9qIlILOpMxRuWpiY
   HmTSEqOkKHeqDDCRUymUqRZrsmPF6wP9PgQqHb/LQiUHCfo/traOoZ8iB
   g==;
X-CSE-ConnectionGUID: uWWn93VMQBacfO97LhAAgg==
X-CSE-MsgGUID: w21eUc0LSBeyyQHWQAlwzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="24492513"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="24492513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:09:05 -0800
X-CSE-ConnectionGUID: 1WQ5tDhmQlmBHSfszG4lLw==
X-CSE-MsgGUID: lwElejONRY+RkC+Q317r1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108042240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jan 2025 05:09:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbEY-000KfX-2S;
	Sat, 11 Jan 2025 13:08:58 +0000
Date: Sat, 11 Jan 2025 21:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>,
	wenbin.mei@mediatek.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Guodong Liu <guodong.liu@mediatek.com>,
	Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH v2 2/2] pinctrl: mediatek: add mt8196 driver
Message-ID: <202501112005.DuwEi3Ig-lkp@intel.com>
References: <20250110104703.13625-3-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110104703.13625-3-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_050914_051630_C6AA3AB6 
X-CRM114-Status: GOOD (  14.66  )
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

Hi Cathy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cathy-Xu/dt-bindings-pinctrl-mediatek-add-support-for-mt8196/20250110-184846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250110104703.13625-3-ot_cathy.xu%40mediatek.com
patch subject: [PATCH v2 2/2] pinctrl: mediatek: add mt8196 driver
config: arm64-randconfig-003-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112005.DuwEi3Ig-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112005.DuwEi3Ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112005.DuwEi3Ig-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/pinctrl-mt8196.c:1753:23: error: use of undeclared identifier 'mtk_eint_pm_ops'
    1753 |                 .pm = pm_sleep_ptr(&mtk_eint_pm_ops),
         |                                     ^
   1 error generated.


vim +/mtk_eint_pm_ops +1753 drivers/pinctrl/mediatek/pinctrl-mt8196.c

  1748	
  1749	static struct platform_driver mt8196_pinctrl_driver = {
  1750		.driver = {
  1751			.name = "mt8196-pinctrl",
  1752			.of_match_table = mt8196_pinctrl_of_match,
> 1753			.pm = pm_sleep_ptr(&mtk_eint_pm_ops),
  1754		},
  1755		.probe = mtk_paris_pinctrl_probe,
  1756	};
  1757	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


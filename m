Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC89CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L9G3q8vCMQ9cticQ95k1bLTJnyChs3c7Vs1uz5R7oA=; b=v1uItfmflKnoUXzKAl1fcYdLx6
	i+M9zdG2201RXsKr1RR0Qrst8+Cf5wMAk0IH211ak19nQi6qL9mps0SwABScY153sqQAXhoXLnQlW
	PjczvZdBO14Y0tKSB9SLvU6AK5tcdiauVa6RKdnHPnPfbcV1JiInFiZLGvoDutuavJ87K/5QjkPlw
	LkbbsbHSFERIh08lOqCn1ZQ9myHadXjWKAYHxikdOimTcsPB5mJk+1V9riGtai9y7lb7VF01OaAIb
	trMfPR2awevtZtPPaBYxi8uruHxGJCM3rHCCtmLn7bXg69Ltv1x2VWq4/1H2ZJwDWixN51Op6Yu9t
	4dqVbWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvw-00000004CYU-0YdB;
	Sat, 23 Aug 2025 06:41:00 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVGb-00000003DlF-04PG;
	Fri, 22 Aug 2025 17:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755882569; x=1787418569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Edpu4iaigfyMUiRCVPJ8Q6j8sogTZ4BIgKymb2DFMw=;
  b=C4+wIUPbOdQDw1nkMdDvYgCMGdWe8VQw+N6EaM9/pcy5Dzkvheu99CW/
   Pdgxry7ogt9KfZhBQUB0uHDONzmVvcbvt2aotBlq2E3BVHAIHZEnBWjq0
   b364hUoRWjhnCvKgVieQbezTMHOo/jwETFxVeZoGfbIXBHQMKH8Fw1msB
   Ay9Cl/0ZOzpeRYAJqs7le3qB6jcd91Yhu9W/A+nePQ0We5c4w3v9PjLxe
   o9Fj1gS4/7OAhmH6vqFxBWXWcQLoRJRwohHdkHOZW4oVkD86+Jmio3k0L
   ztc3HJ8DaPnmP1m+H/8mTdvXKuSYRAXrj1CjYtbkuc47jbkxYp/0ZLLhN
   w==;
X-CSE-ConnectionGUID: k0QxEAwtSeySkV/rQKOShg==
X-CSE-MsgGUID: fa9lQaShRPmkyKVhnE9/fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58145622"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58145622"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 10:09:28 -0700
X-CSE-ConnectionGUID: bSznwY7qTReg8XKsoJX+Qw==
X-CSE-MsgGUID: 5jtGIIBhT2ugTPUQX6bJ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168947402"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Aug 2025 10:09:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upVG1-000LZR-1i;
	Fri, 22 Aug 2025 17:09:01 +0000
Date: Sat, 23 Aug 2025 01:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: Re: [PATCH v3 3/4] mailbox: mtk-cmdq: Add cmdq driver for mt8189
Message-ID: <202508230035.zCJcuz93-lkp@intel.com>
References: <20250819033746.16405-4-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819033746.16405-4-xiandong.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_100929_098116_B2D06112 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Xiandong,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiandong-Wang/dt-bindings-mailbox-add-cmdq-yaml-for-MT8189/20250819-113946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20250819033746.16405-4-xiandong.wang%40mediatek.com
patch subject: [PATCH v3 3/4] mailbox: mtk-cmdq: Add cmdq driver for mt8189
config: arm-randconfig-001-20250822 (https://download.01.org/0day-ci/archive/20250823/202508230035.zCJcuz93-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230035.zCJcuz93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230035.zCJcuz93-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/mtk-cmdq-mailbox.c:781:3: error: field designator 'mminfra_offset' does not refer to any field in type 'const struct gce_plat'
     781 |         .mminfra_offset = 0x40000000, /* 1GB */
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +781 drivers/mailbox/mtk-cmdq-mailbox.c

   777	
   778	static const struct gce_plat gce_plat_mt8189 = {
   779		.thread_nr = 32,
   780		.shift = 3,
 > 781		.mminfra_offset = 0x40000000, /* 1GB */
   782		.control_by_sw = false,
   783		.sw_ddr_en = true,
   784		.gce_num = 2
   785	};
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


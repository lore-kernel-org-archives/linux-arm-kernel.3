Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347D1CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 00:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roe29+fz++V63so2dZhZwHT7bS9jaeraGI0E5iRcbX8=; b=XT6eYsX6/ftWoLk5A+Vq9QSiIU
	aeBAp3ZTjdfP3qlBkc5LEbz8ICgeW1oWycX8ld/OHDStvpzDNsuhC8gN4kMA8l4qoJJ8UoCtKyiJY
	YztzvdFJ96gkJ6099Dk7e0K0kaDEChWryLeZzAXAFsdFDb8iHicrAb3FPdWbL0h7RGjyVgc9ZMc0u
	0yw8QbatBlUmNJIxr/Nb5flpPTmqchasNZCleuf/QdUgIX3SemrV3jU+l/BIUx3HJfjl/032Tt9UT
	G7Zmz5gjkbbO7PAwkFg2p+TJxTDJB0tP43os24D2LV/eaDgc9nUvTGApVRHeixYD7giLQ26UM3nbk
	CD26UkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoA7H-00000008ziu-0LSH;
	Tue, 19 Aug 2025 00:22:19 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo9k3-00000008xkh-3fDR;
	Mon, 18 Aug 2025 23:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755561500; x=1787097500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c76ffSU+z29EdjuvcwEaZdMVo1BGLglOk32LHUKT+8Q=;
  b=hOBQGF0jQtt5MsShE687WSvhVaMFaAaFtd0kwoOftpnL0eEm0SnN9hs4
   DAMPEbDf6o7PhJtKyTGBaJ4iW00h8/dIfqHeftK2p3BZpaamAxrJtlCHT
   mRhOMRvzFxhUEB8yKeC1MdaiZR6x7qQqj2CAsxSSgfxMPKtaCXVc5B7EC
   yLSvFMXcR/lV+JjB+gWk5WSTd2WWy+DpbRVJpBT8je9T0tHTFfBbH8AUW
   5Yf3wpkKWKs0tBaz+Oj/rODcTBec6hMy5LED/CB5jH3H828hS+PzivGnc
   9FpDvqjkGzpfOaoxgE6ARwHx0zkBnoL2SrHi+f1b2+ENqLmD72y3BDLy7
   A==;
X-CSE-ConnectionGUID: xz8nKihNTtSLIt6jAUvilw==
X-CSE-MsgGUID: v8iMwR87QMCNRjjtAZnycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61609889"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="61609889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 16:58:16 -0700
X-CSE-ConnectionGUID: 8bXpQ/8MRnerAdHif+U/Bw==
X-CSE-MsgGUID: /qIoloXhS5W34Jon6neR7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167934762"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Aug 2025 16:58:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo9js-000GJr-0M;
	Mon, 18 Aug 2025 23:58:08 +0000
Date: Tue, 19 Aug 2025 07:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Qiqi Wang <qiqi.wang@mediatek.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com, irving-ch.lin@mediatek.com
Subject: Re: [PATCH 6/6] pmdomain: mediatek: Add power domain driver for
 MT8189 SoC
Message-ID: <202508190709.36QIqpVt-lkp@intel.com>
References: <20250818115754.1067154-7-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818115754.1067154-7-irving-ch.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_165819_954949_D8D4AEFB 
X-CRM114-Status: GOOD (  13.51  )
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

Hi irving.ch.lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.17-rc2 next-20250818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/irving-ch-lin/dt-bindings-clock-mediatek-Add-new-MT8189-clock/20250818-200449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250818115754.1067154-7-irving-ch.lin%40mediatek.com
patch subject: [PATCH 6/6] pmdomain: mediatek: Add power domain driver for MT8189 SoC
config: arm-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250819/202508190709.36QIqpVt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190709.36QIqpVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190709.36QIqpVt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/mediatek/mtk-scpsys.c:219 struct member 'sram_slp_bits' not described in 'scp_domain_data'
>> Warning: drivers/pmdomain/mediatek/mtk-scpsys.c:219 struct member 'sram_slp_ack_bits' not described in 'scp_domain_data'
>> Warning: drivers/pmdomain/mediatek/mtk-scpsys.c:219 struct member 'subsys_clk_prefix' not described in 'scp_domain_data'
>> Warning: drivers/pmdomain/mediatek/mtk-scpsys.c:219 struct member 'bp_table' not described in 'scp_domain_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


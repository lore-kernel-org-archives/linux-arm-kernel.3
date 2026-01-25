Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA4EE63C85
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 04:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jh0gVDyiII8nSRC4De8xNqBKH2NKxMUYmyO/hI+zGYw=; b=PWOSiZf9+6F1/kDflAmAcXzvhx
	bV2fO6QwdA2ejhCo36OzC4n2ygpvJml8O4xJxbTOjtoy6cTNLB2CZijJwhv9qCSie1SoUhmEJVo8b
	d4h6KVKdUj1SSnPA+xVJ8kmb2kMas3YJ60mP/GtQHOwfLdEWjrXLHGhgLaDXSQN4BZi5pMSZXBX9n
	GLY1urLu+iwBc5kvDPkRPwg1obXC5EXX0iedxuvKF58tPgwhaX3Cc3BhDl9AhkINp+814ZxWN8u5A
	ZZoZPh6aSlZGZjBx88mG6aojplVS/eUsVVfz4N3+aW8yb2ANz+hi4/+Tkdt6X8TJ6SSSHV0Ci8n4+
	dZeD6v5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrPm-0000000ApHr-3DFY;
	Sun, 25 Jan 2026 04:07:54 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrPk-0000000ApH6-1OV2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 04:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769314072; x=1800850072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z/Q3Uki5iUeDrYudztHt8sojXXIhjVcCLpsmjGeWo9c=;
  b=Fb1ND8Ea94J+Y4nFNEdPnomrjWCL0q8j0fXJ3xKW6PyKUjmJUVTUstty
   oX5eB4iXrmc/uXFoMkArZDR3UZMTOwupPNyXqj1Pj0qqfh/l4naG0SJUZ
   oSj9goCW68oaa9SAZKKdvEyhr/vFm/0rBESgIuuOmoc6Olpwiq+aCj749
   9LTQ7xyl2EsGu0zkkZD2nOBB6CaDWNoUqIIfOUeZxJnopMB40jRa8Rvn7
   PlH3OzvuhasO3jI79eQbqYGEBo+hsC/18T0Y5viQcbgfIWATE0FrfJ8Tt
   RK+hKJEzsrqOoCwWX6TeXzMERDCA5FjufceoFqeXWyHupzePutRWEUzZS
   g==;
X-CSE-ConnectionGUID: MLCuBLeUR0y0CKTE1dJfxQ==
X-CSE-MsgGUID: FBUQ3LvzRDWWFpSOtmBkXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70419464"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70419464"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 20:07:51 -0800
X-CSE-ConnectionGUID: nM2A70SRQ/+OhsvZU2XmIQ==
X-CSE-MsgGUID: iJHVGoymRpu9ROwGyASi6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207798954"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jan 2026 20:07:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjrPc-00000000Vl4-2R1P;
	Sun, 25 Jan 2026 04:07:44 +0000
Date: Sun, 25 Jan 2026 12:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH 4/7] clk: sunxi-ng: Extract common RTC CCU clock logic
Message-ID: <202601251139.9CCmxdok-lkp@intel.com>
References: <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_200752_411488_0DC3E50F 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Junhui,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-rtc-sun6i-Add-Allwinner-A733-support/20260121-192151
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260121-a733-rtc-v1-4-d359437f23a7%40pigmoral.tech
patch subject: [PATCH 4/7] clk: sunxi-ng: Extract common RTC CCU clock logic
config: arm64-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251139.9CCmxdok-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251139.9CCmxdok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251139.9CCmxdok-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ccu_iosc_32k_ops" [drivers/clk/sunxi-ng/sun6i-rtc-ccu.ko] undefined!
>> ERROR: modpost: "ccu_iosc_ops" [drivers/clk/sunxi-ng/sun6i-rtc-ccu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


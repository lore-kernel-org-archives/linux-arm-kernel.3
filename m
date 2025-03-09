Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132A3C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uh5GU0P2wi1oioWvQ7FnP0vy3v0qcITwjoc9O2PP3bg=; b=Zn3vguwecY7yTckDn18jU+1GDu
	0ZR4bXVH648Bt359Y9qFb91WB6EOlkgQU9GjtBq8+iN/rLFr2hQEsUsMylShF91knIjPFNj+l/tW0
	UddJgkQ+sakuZk0STZ7TcZxnraD6IVy8EpzIq5T3zTR00+LVakHRgSWuFUWiB4J+i+gzDrYyhyOBp
	9laDaDK6CQKYkqQMBD42RNsFMpLGKvrQsg+a91b6RRifhZT26CxOGyXsIkAvcr+0tL3kQ+nlsAdhr
	IS6ApujCKeeym3vAiWYAU9P02LuWVMBLtw+6W7GfbG1gPp0R7gMf2omFtTh31kqfD1ZBcw6rnSg8+
	ugwxBgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trIxc-00000000lHW-39tu;
	Sun, 09 Mar 2025 15:53:04 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trIvz-00000000lD6-1vvT;
	Sun, 09 Mar 2025 15:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741535483; x=1773071483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z26VWBNMz80YyF/hRHm8Hl23tDMXIjOJUiY/5dcLl2Q=;
  b=PVL1Ey+U0tivLRBWJmj644tQn2z7YvuXfX4uS9nAwjLWhTxt1B851l4P
   ivizsG8ZFsRm4hoPlPjUVnPjZqm7m4/kgz0qD2m7wxVn8rRHkk60Ryu74
   N484Uf1Zq5hDhEgEl0uVBMqWN29xIPb2HyUp+fW1+Dvm3qqbqJOdJXGBB
   XrndAqdHzg7rUxEUhMTbaL+oQOn5mgfH2xAw18zIR6gBtkcrSlBAOBKg6
   lnpbd7XFEiOWLK+3dGyV0YtiOiiH6X1TSQqeuU05BNVOGlJawPigKgTNJ
   /4BBKDtqBcTxF0V1QPAVpk/Q9a7gX0t6COZsW7llKyEXjzuxg5JPYhwCd
   w==;
X-CSE-ConnectionGUID: URMPhSImTZa7TNrtV4fhEQ==
X-CSE-MsgGUID: AE9tsbSeQFuNCknKqIVKPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42670982"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42670982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 08:51:20 -0700
X-CSE-ConnectionGUID: aMKZlXlkRZmvTo3hOOJy6g==
X-CSE-MsgGUID: elAGiMi7SmG61Nx2Z1eQnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="124782869"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2025 08:51:13 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trIvi-0003Ey-22;
	Sun, 09 Mar 2025 15:51:07 +0000
Date: Sun, 9 Mar 2025 23:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <bwh@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org, upstream@airoha.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/13] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <202503092318.xReLDuUG-lkp@intel.com>
References: <20250309132959.19045-10-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309132959.19045-10-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_085123_551789_3CF1BC1B 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250307]
[also build test WARNING on v6.14-rc5]
[cannot apply to clk/clk-next robh/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.14-rc5 v6.14-rc4 v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/clk-en7523-convert-driver-to-regmap-API/20250309-213623
base:   next-20250307
patch link:    https://lore.kernel.org/r/20250309132959.19045-10-ansuelsmth%40gmail.com
patch subject: [PATCH 09/13] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
reproduce: (https://download.01.org/0day-ci/archive/20250309/202503092318.xReLDuUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503092318.xReLDuUG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yam
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1792: htmldocs] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A58E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hs/4bb4Yl2rTWJg1b2p+mosmGrS31iOL2TSgfj+wMT0=; b=KQ0KNXuhY/jSEmBnZ3wJOm8YKs
	TOoyMSK3OLDilYGtdACIOvSBCXCeT0lng1AiqL9RS5Zl3jeIbeqIp8ydpc2ksJUkbhzyhhcjWrCg/
	2HZF5HIoR9mYRBT3wEmQZLNUOQo+K+5QNzIwxGsICEgvLpSmu75Q3aXNAfdoMXxFc9X2GgGBHdwjH
	uObkNMAMy2aLcFqjIP7eLkdOnWxXMkJCAN3n2EdYLgQwXHdvaRl8/zwrRnhR6gxIL4AW9chnHJK1j
	mROvZvEh9VnEnpZyhFN7t32CzYVoRNLBr4LyMTPHzjNELIXsU3NHvBTazEoLbx3AZjLUjETBmFyLF
	JOGJCQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVqC-00000006Sou-1lhA;
	Mon, 09 Dec 2024 04:57:52 +0000
Received: from [198.175.65.9] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVp8-00000006SXC-2wUq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 04:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720207; x=1765256207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=smdcXM4XVtdVmpcZSTAjc1CdeXynkh1TZG7WKdPEg8s=;
  b=R5Mx8Ygnp33sHQe6oo0yazudauiohGO6JjFVKCHWXWMgtiP0WJzBA8/z
   8C1OFVVd7Xy3d4V4Uz0d4qGTv10Uj0xkqzBI4U+GiW2hS3hmqDSXyE4Vi
   r8zbTfUe83RMQJdM+VfapTJfunPmKeKDKnATCe2aitcl471PU3NAsfqHA
   QeEqq24l/mfekGS+JDUkzi5oaxYLZ1GtumO/AIPozIh+6RQzgj/MFtEtY
   62LKd+i2L6M9GL9xz/rYy6YvkZ6GEErciGgzyDJd+F9Yzt14OzgGjtKIl
   xSijeucW2K0W7kKAO/vJ0q0xTDoVzpSBNCt/vITBWXA5k763vMvffdDyr
   g==;
X-CSE-ConnectionGUID: Q/K6kccyQ7KEZHYk3KkW/Q==
X-CSE-MsgGUID: w5uO1Vk0ReKsggNsq0oe8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="56484909"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="56484909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:56:46 -0800
X-CSE-ConnectionGUID: xqrC+jWTR8WGbuYoi0Oumw==
X-CSE-MsgGUID: Qobg1aSASgK3QKz6Ym49nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100015159"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 20:56:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVp0-0003wb-0u;
	Mon, 09 Dec 2024 04:56:38 +0000
Date: Mon, 9 Dec 2024 12:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com, sboyd@kernel.org, arnd@arndb.de
Cc: oe-kbuild-all@lists.linux.dev, dharma.b@microchip.com,
	mihai.sain@microchip.com, romain.sioen@microchip.com,
	varshini.rajendran@microchip.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 11/13] ARM: dts: microchip: add support for
 sama7d65_curiosity board
Message-ID: <202412090708.BNX0mUZi-lkp@intel.com>
References: <e47d8c8cdaec834ce080ef8c34b9976228223c8f.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e47d8c8cdaec834ce080ef8c34b9976228223c8f.1733505542.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_205646_837906_B7C20B7C 
X-CRM114-Status: GOOD (  10.91  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next soc/for-next linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Wanner-microchip-com/dt-bindings-ARM-at91-Document-Microchip-SAMA7D65-Curiosity/20241207-040527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/e47d8c8cdaec834ce080ef8c34b9976228223c8f.1733505542.git.Ryan.Wanner%40microchip.com
patch subject: [PATCH v3 11/13] ARM: dts: microchip: add support for sama7d65_curiosity board
config: arm-randconfig-051-20241207 (https://download.01.org/0day-ci/archive/20241209/202412090708.BNX0mUZi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412090708.BNX0mUZi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412090708.BNX0mUZi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts:50.1-6 Label or path pioA not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


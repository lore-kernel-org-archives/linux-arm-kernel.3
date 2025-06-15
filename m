Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12185C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 02:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uetUJgwRNLZTSsAX7SMuc7Da5GIi6q46+rkSNkPFNCo=; b=LVu+lLh5RJgySl/KEJht6fA0SN
	nr5wcbaNJug5uH507RjCD3z2AMrS1U5mcFt4GdzHlTfcnBDDaUZasH05aMHtrd92gWk1NJcw1trsU
	fsNa9cWI0Pxu63a1+aRGOvs+TB6K89QxT3KsmMLoO9GQLWX/yy1Kaj5d5DgbOKZ40/knzrs4vNcmo
	xCLitzCCHDJUv1mqxec2yQTP9o09weDwk72p9e+ocolPZ/ha/+UrwtmQOxaF420EvAavNaFSbF1NZ
	V2lNQhnLE6Pc9NCbd6e7/A3zChXPlYlHrrpsvi07enyr6MD44iuGDBsOzG/JFkMAhW30NCHOBMyh5
	soj1Uv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQd6g-000000028OX-0mio;
	Sun, 15 Jun 2025 02:28:26 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQd4U-000000028Jl-1kn2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 02:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749954370; x=1781490370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iB4cIatf5tEhkaxazedaZKJ8PlFwYKX8Qrc7cvws45k=;
  b=FEe3EQgN09RcpyTfc2KP6H8KQP0G1VfULry7tdGA3qWLRBNdCvaeEENV
   Ek4aur3GMXi3XnRe8/JnsrftGmrvwwbkOLLMDO8p9RKrna5O38xvdcGJ4
   GL7GummU/zgaVvIoYVODAyHlazCtUded0QM7lKAsjmypbPzKX8bZQfmz+
   V4reMM9L/CiWfK4iJ1whN/BzQgNReJv6FsjXLza/f187ekhuJYnd1ddzo
   2wwzSfI9L+Ba1wrKgA/FLsXaQRjwfSK/N65gSN3fyCd81eKQfwmuXLc9y
   f9cPv4q/w9R7krXFIJFTqHV1cZZnV/CNe34weWylddgVs8kKd+n1dy1Co
   w==;
X-CSE-ConnectionGUID: DmBTpiJYTe6BSziY2d8LqA==
X-CSE-MsgGUID: VAiiHxtdQxe89fvw6arZXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="69706490"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="69706490"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 19:26:04 -0700
X-CSE-ConnectionGUID: zSZDeOGPREKgcK3eXK8pQA==
X-CSE-MsgGUID: jbqnQ90ZRt+wXFI4LRD4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="153045407"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jun 2025 19:26:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQd4I-000E3Y-2T;
	Sun, 15 Jun 2025 02:25:58 +0000
Date: Sun, 15 Jun 2025 10:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev,
	Harshit Shah <hshah@axiado.com>
Subject: Re: [PATCH 6/6] MAINTAINERS: Add entry for AXIADO
Message-ID: <202506151027.IduXJqR2-lkp@intel.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-6-327ab344c16d@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-6-327ab344c16d@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_192610_503000_170A289B 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Harshit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8c6bc74c7f8910ed4c969ccec52e98716f98700a]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshit-Shah/dt-bindings-vendor-prefixes-Add-Axiado-Corporation/20250615-091516
base:   8c6bc74c7f8910ed4c969ccec52e98716f98700a
patch link:    https://lore.kernel.org/r/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-6-327ab344c16d%40axiado.com
patch subject: [PATCH 6/6] MAINTAINERS: Add entry for AXIADO
reproduce: (https://download.01.org/0day-ci/archive/20250615/202506151027.IduXJqR2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151027.IduXJqR2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/axiado/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


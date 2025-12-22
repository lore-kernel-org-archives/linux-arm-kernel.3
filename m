Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C45E674B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwbA43KDgyC20TzNC9tB1mz8fW0cPz2US/quckA1tLw=; b=oa2yr1oQL6NEeKwU5ggQ3P33Zh
	rCyc/swZNLZ8TnaUe9vHPeKFPedXvXYA+zrgzpyZBjGQ6q7vQzhMKES6CAag1MY1OoCZXfIVQv4qG
	8KyYj+MY0EWY5pyohHaue5ylh0JEbkwQmCrW+22WobFOFOM3wOld1xEFk+M9CQ5sKE0LQqkAaoRT4
	uMKx9tJVN351tBAiqO/JhCvO8Mueh9fvBfY6RvP3rn4GSVol9SY52Vh0bPxop+V0yWrRPI76f2KnJ
	WNWZHHRbjQrYuRcTIMi5gRD5xbdNT/iYah16OHDBUTtOhYb0kRkjNx8yZjk69eW6l0+19J/dRS3co
	U0HQLLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgns-0000000Drnt-0V5w;
	Mon, 22 Dec 2025 14:22:28 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgnp-0000000DrnI-2bCq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 14:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766413346; x=1797949346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=heEIPZYqTxIS+TzN5UwdxTrbogvJz41Y84YftjfGX1E=;
  b=FkOqfzuH3DXKIBL57BK7gwLbVWndgpkl0ECy2PIHN6kq/A88W+SF+yt3
   OanKJbUSQUzYR9t0XXWAVMv68YIeqLJKuOKqAQ94gqxEXCL+W3kpDRHYZ
   o12tzb3uwbFbtSsJLAap/zrp0qqV9cbXr4HplOyawD5/p/JpzVOlw6cEH
   QLyCvMiT5SLSY3/iUW5bxaSEQ06gdLOc4d3KsCMLjz/ejZk54fnzpmJnM
   ZSwBMaGo8Aj/BDeVPPA06qCY0K9FxvsYc6Kzy/noEMliBLByVYhfrhfow
   Ykeo31cKy+AeyNdGHBYR33Q89SO8tntZU9/6AQ/fFjDbc9QiA05cERikc
   w==;
X-CSE-ConnectionGUID: VGWhMyPxQNiA99rAC2OtnA==
X-CSE-MsgGUID: XXkaDD5zTnuDTcLD0oQ9gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79720566"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79720566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:22:24 -0800
X-CSE-ConnectionGUID: QBXgvF0bRmuzpzT5ABjZzQ==
X-CSE-MsgGUID: aNrEX8sZRRmAjx3gdSn2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204483629"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Dec 2025 06:22:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgnh-000000005VI-498I;
	Mon, 22 Dec 2025 14:22:17 +0000
Date: Mon, 22 Dec 2025 15:21:32 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Robert Richter <rric@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Drop obsolete brcm,vulcan-soc binding
Message-ID: <202512221537.xL09XWuA-lkp@intel.com>
References: <20251215213022.3325133-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215213022.3325133-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_062225_786502_E8C15524 
X-CRM114-Status: GOOD (  11.72  )
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

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-mem-ctrl/for-next krzk-dt/for-next linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-arm-Drop-obsolete-brcm-vulcan-soc-binding/20251216-053906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251215213022.3325133-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: arm: Drop obsolete brcm,vulcan-soc binding
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221537.xL09XWuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221537.xL09XWuA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-mdp.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


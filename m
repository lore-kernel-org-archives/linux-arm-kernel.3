Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0DCC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 03:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z6oY/kUfjo0N/zyNXDq7OxbsjYBosOUEn1bA6PukbhQ=; b=e90PdflyK84lCDEVr340hLeDdC
	LI5Ws4ED5az2GDR5ohI4YaTe/1k85CbWpdwgF2kfCbcyhtbKuGl5/ftN1YXGqzjNAsoS79HoTl0d0
	wwkUi02keWtB4KU0pwVhU+j330N8hN80H0tbhytJl9IbeUh9A6KUyw0RpxgXSv6CCa/g0RPCzdUAp
	GosNiW0gC1mWE8DzcZiktHQwg05pJAEBMDW9ISLO5sgsu8cvEtHENCrpdj9lvpayMKpRdkT9d+xZo
	hZ6WBsZ6iVSKmSasSrG3fkf4dFx+8PebqTFreRLi0c1CSawUbuWrXAW+t3TvVAcweSYiGIqFynouk
	zIA29vpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VAq-00000000nU1-442K;
	Mon, 21 Sep 2026 03:58:36 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VAo-00000000nTZ-0gAN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 03:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789963114; x=1821499114;
  h=date:from:to:cc:subject:message-id;
  bh=V5Dz0iF0fLhKlPe9UXVkmYw6yu6lz1ZLz2hoieM5OkA=;
  b=gRQKWF5+fFOGeJLcgMPVCJ83r3TouisKKhjV5zSenJeemvZwFvwVDkAF
   IzX26Z/4+Fwh6/rFS5PGUFHi4CM5ZZ8wekaS1lQ10XeqyoFo79KrJgmGC
   xTESpS/kLl6ccLwueFTt/rg8htlhoZDA70M/6kOXpjbb/WhpE+BlUf7s9
   MuC84j/eM1YoowbMLbl2D2xn1ZO2hqFacKcXVKfOVUSG7yIifZjlUKsCy
   zxzMdUSrLW3zOhvmwfpeD1yTCBiPteIJFGGEAcaxdqB90t+eVXMSmXbz1
   QNEjVihIG97JVVVLRwpRSbAtMxUc8oWl5Eqajzn3qt80/vlygjWUG5qrM
   Q==;
X-CSE-ConnectionGUID: 8XPvB3KGQFWsqnjkSM8onA==
X-CSE-MsgGUID: udVVJUoESXamtnOzRje+5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="78019459"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="78019459"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 20:58:33 -0700
X-CSE-ConnectionGUID: MVBhTT1tSDGS98EwSJKAbQ==
X-CSE-MsgGUID: DZ2vNYs0RbiHbtFzfhAyfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="280537178"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Sep 2026 20:58:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8VAi-00000000DFo-3nYU;
	Mon, 21 Sep 2026 03:58:28 +0000
Date: Mon, 21 Sep 2026 11:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4/ux500-audio-graph-card2 5/26] ld.lld:
 error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x734): unknown relocation
 (41) against symbol etrap_irq
Message-ID: <202609211120.1ric2KZz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_205834_242904_1F1D9B91 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

Hi Linus,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-audio-graph-card2
head:   ba26e4e9cae9a3e1c396d1f4a34970d7caa166b0
commit: bd19dc64243c585c8cb3c164b77a3f5d42b92771 [5/26] ASoC: ab8500: Remove the nonfunctional sidetone apply control
config: sparc64-randconfig-1001-20260921 (https://download.01.org/0day-ci/archive/20260921/202609211120.1ric2KZz-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260921/202609211120.1ric2KZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609211120.1ric2KZz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x734): unknown relocation (41) against symbol etrap_irq
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xd24): unknown relocation (41) against symbol user_rtt_fill_fixup_common
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0x8c): unknown relocation (41) against symbol rtrap
>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x744): unknown relocation (8) against symbol rtrap_xcall
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xd2c): unknown relocation (41) against symbol user_rtt_fill_fixup_common
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xd34): unknown relocation (41) against symbol user_rtt_fill_fixup_common
>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x9e8): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xc0): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xd4): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xfc): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0x10c): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xd9c): unknown relocation (41) against symbol rtrap
>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x9fc): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xe9c): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xeac): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.kprobes.text+0x84): unknown relocation (40) against symbol __flush_icache_page
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xfb4): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xfc4): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xfe4): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0x100c): unknown relocation (41) against symbol rtrap
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AABCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 06:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAt1Bu8KuaUd0IKHRlqjsmaDl9cU6q2TisUuzYFCDrE=; b=k8C5u/5BRsFNW+IiTEYkt9ISDE
	cB+7KmQfU/7D41FNx8nUhqN8t5M+Gc0fgaIkYIzgI+HA7EepjPlz68gnHULxJdwBKG1KQshbtVjT2
	bQ5j/a5u/BHM16cGdaoCwkZRbp19Wrr03rurjLoI6wygXX2HOY5s8x+a1czPbz/F97QOTgNlwsfX5
	1O4qLskKHwaFENXvP83TwD42LIGrMYu06lprPA/IbcNAC6G67Z61aaeANRO8NIKJ1vwTCUn0A1w9o
	3jmAIcaavHu7CkSYDifvKkSARZ+uQVDc7DlvPdvTke15Ga4BarhRCNdw1pGehKjzWcvD36cXQTARQ
	wcy05ijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOVQH-0000000CFj4-4BPQ;
	Sun, 17 May 2026 06:56:26 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOVQF-0000000CFib-44vZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 06:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779000984; x=1810536984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fGT5I6ToH7UCt6pHUBQr+TnBqyhXcXF5apg8Jg9Ghow=;
  b=MWTQWls4Xq3wD1KG2NHd8FqnA9jjDyxpgog/h4RfxBYOAYtjlUSe06XM
   sEenyzQ6DDSti/ii1MuamJggVGgk0Jm0n2ys4kBu+8OMXt6YZv6qAmbj9
   JgWgq5LDxZQmamFKzW/FHHAIdBX3BndeNTTt3taiuCiZrXN2GJ61Jyl4L
   CD07/dzBLWNdKgo79AyEjVUytpAarFY9+ENLvKkkycAoHVeF7T3SQf+kQ
   yaxC5J6hndcYTrhVMR/TGEddyLrG0baN3NyJeErDOiA7ttkI5NTmwaO86
   FvB9vC9aK59xx/W3j0bTuFgHaz/vbGdDUaWKoG+SZWFDrKJ2X671g7EVt
   w==;
X-CSE-ConnectionGUID: dwbYJMb7R8+wec1stnUadw==
X-CSE-MsgGUID: UzIPPRQbQtOHxAA3xjkaVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83760057"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="83760057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 23:56:22 -0700
X-CSE-ConnectionGUID: r6Sw8oi6S1+ePIGN0LFVzQ==
X-CSE-MsgGUID: iI4sUX0jQWGG/BIglWLPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="262870834"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2026 23:56:20 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOVQ9-000000001QQ-3fum;
	Sun, 17 May 2026 06:56:17 +0000
Date: Sun, 17 May 2026 14:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: remove unnecessary architecture-specific
 <asm/asm-offsets.h>
Message-ID: <202605171438.l6sZ9CCp-lkp@intel.com>
References: <20260517030408.100043-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517030408.100043-1-enelsonmoore@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_235624_080586_907A66D0 
X-CRM114-Status: GOOD (  12.24  )
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

Hi Ethan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm/for-next]
[also build test ERROR on arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next soc/for-next linus/master nferre-at91/at91-next shawnguo/for-next v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Nelson-Moore/ARM-remove-unnecessary-architecture-specific-asm-asm-offsets-h/20260517-110530
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
patch link:    https://lore.kernel.org/r/20260517030408.100043-1-enelsonmoore%40gmail.com
patch subject: [PATCH] ARM: remove unnecessary architecture-specific <asm/asm-offsets.h>
config: arm-ixp4xx_defconfig (https://download.01.org/0day-ci/archive/20260517/202605171438.l6sZ9CCp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171438.l6sZ9CCp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171438.l6sZ9CCp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/lib/ashldi3.S:30:
>> arch/arm/include/asm/assembler.h:22:10: fatal error: asm/asm-offsets.h: No such file or directory
      22 | #include <asm/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> arch/arm/kernel/sleep.S:4:10: fatal error: asm/asm-offsets.h: No such file or directory
       4 | #include <asm/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +22 arch/arm/include/asm/assembler.h

^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  19  
^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  20  #include <asm/ptrace.h>
80c59dafb1a9a8 arch/arm/include/asm/assembler.h Dave Martin     2012-02-09  21  #include <asm/opcodes-virt.h>
0b1f68e836bcf1 arch/arm/include/asm/assembler.h Catalin Marinas 2014-04-02 @22  #include <asm/asm-offsets.h>
9a2b51b6ca93fc arch/arm/include/asm/assembler.h Andrey Ryabinin 2014-06-18  23  #include <asm/page.h>
7af5b901e84743 arch/arm/include/asm/assembler.h Linus Walleij   2024-03-25  24  #include <asm/pgtable.h>
9a2b51b6ca93fc arch/arm/include/asm/assembler.h Andrey Ryabinin 2014-06-18  25  #include <asm/thread_info.h>
747ffc2fcf969e arch/arm/include/asm/assembler.h Russell King    2020-05-03  26  #include <asm/uaccess-asm.h>
^1da177e4c3f41 include/asm-arm/assembler.h      Linus Torvalds  2005-04-16  27  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


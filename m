Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A345BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 06:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6LhMiZXfcDMxEVRgoZkT9kURlvadnHL56KMb/w+3Dc=; b=3McrjOfeArCgmBLAu1zYijhwOv
	faExBAqy/CM5VkTAqQW9jjC65jE4eNfrB1B1XpgAxcZ1wFquvRzUc5GCWsrnPt7Z9zoppE0ejPcF2
	U4Yw+xJ6LNY2obhxqwuBrCdQIBEnhfBIIOjw/ujOhb0frjR0f6tGn5vtYXom/6YvRWLbUdiK8AFAP
	EwLLWs7DKPrzn4xdMGKL1eWXp0MeEXVfjB2el+emkWirqr8bqZBAmQ6cx2WuHqKYXsO8UAPSnvE25
	oBn+3AaeqeTWpPLJEHEY+B0oPSzuod4z5o6JTZGmI9LedyYl0Dtr7UKuC6IzQWsAUbSJRrgZI7q/H
	GIoZPzog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOUxF-0000000CDX7-3yPU;
	Sun, 17 May 2026 06:26:25 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOUxC-0000000CDWV-2ItJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 06:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778999182; x=1810535182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wf1JZP90i3OaZ2KJvbePcH9zwwvdOsWpnrVP4OF5sgE=;
  b=EX7d7by0ro+11/3OJp8XNhAsn8ts+ZZ+JWdUH7ezuf2UO8Kcjj+79RMT
   CsELvtj2fh/aMCKmVocF+IXmFYXNiDtqgOk2NgYFRJ3IYvoQ2vv01omWM
   akl/uZ9+46E7UXGI672vXCOT+zkGn2I3kZdYxXbwzDlPYCRcjuPuIO46n
   dMiVcZmGAx/7mNSknssUegbkMmEiCW4ZHUacd5+S/qDikHxSYpoYE8nlH
   OY55F8TRiTqGt+PDcSmMKsjwlRqkpCOuNXfTu/WjoOyCD+WAMoC70jNOd
   0LITG4ju3wWBfWQNtr0VIqO8r2gDFiIf8RcT1xLvuDbmQcqzzCK/COR8d
   g==;
X-CSE-ConnectionGUID: bKqFJ8eBSTGQMEDHKSC21w==
X-CSE-MsgGUID: lUJgO7xbTkqFohQZV4ilKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79932707"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79932707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 23:26:21 -0700
X-CSE-ConnectionGUID: 246+PfvgSiaPFM/JTF1UJQ==
X-CSE-MsgGUID: 3IqONLX/RoOWyijuLQxZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244073016"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2026 23:26:19 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOUx6-000000001P0-2rDk;
	Sun, 17 May 2026 06:26:16 +0000
Date: Sun, 17 May 2026 14:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: remove unnecessary architecture-specific
 <asm/asm-offsets.h>
Message-ID: <202605171414.zrSQqMbq-lkp@intel.com>
References: <20260517030408.100043-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517030408.100043-1-enelsonmoore@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_232622_636959_11D4131A 
X-CRM114-Status: GOOD (  11.41  )
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
[also build test ERROR on arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next soc/for-next linus/master shawnguo/for-next v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Nelson-Moore/ARM-remove-unnecessary-architecture-specific-asm-asm-offsets-h/20260517-110530
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
patch link:    https://lore.kernel.org/r/20260517030408.100043-1-enelsonmoore%40gmail.com
patch subject: [PATCH] ARM: remove unnecessary architecture-specific <asm/asm-offsets.h>
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260517/202605171414.zrSQqMbq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171414.zrSQqMbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171414.zrSQqMbq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/lib/ashldi3.S:30:
>> arch/arm/include/asm/assembler.h:22:10: fatal error: 'asm/asm-offsets.h' file not found
      22 | #include <asm/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.


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


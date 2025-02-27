Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC264C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 06:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZc2vN8IlbQjjibtUfjXqrocg7VoZV5ctgSpyLETASc=; b=C085+RgmdFKX1WaSrTwTgovULC
	j7EE1xAI497Oaf+oVFhL2wE7u+ATuywtu+tqxz1bbO+UfQWqmslc8kodxPCyetl1oE7ON6njdp7Yu
	Q+pXBABmcIFOVll2HBLlgGqNdtPXP3Ya+1EobJJXQ3xpDQeZSsLnVkOSeaQkyQJGAk6b6en0TO06u
	f4uL1+Km8rlingbSZRzkSBrNp0+LvYJ8vwcbBkGQ8otafnnzQuGU0E3ZIHT1s5pt5WJk1Rt0MuYtF
	IXsxQPpKk2kRSH7nAUuXpbuwjKoPLsMP3UM2ez3AryKy54TgNANphncdOeEywCdedUXOiGgUvNAju
	7Fk3sN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXRR-00000006TuN-1G5p;
	Thu, 27 Feb 2025 06:32:17 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXPt-00000006TlP-00tq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 06:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740637841; x=1772173841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cDXogVH7qIKQIn5aWp/tZGtaiEXuiVz5z4jfmzCT9t8=;
  b=Kp6jV3xyZ9d34SmxNENIYjSOb02WTviOcf309MVPM52nQeoxQqjZB+JO
   OG8/ZF3y0X0gynFjG8y2iLMRHbm5swD68tmb6hWJBincsLcWSCRZy18xS
   Ioyl3xkXGLeJgQjBEHRyhcEIeBO43XJgPwdIKf268TEZfzlEcI4qW9Zgd
   QXYPYh9XOYgnp8A0dCHYjqfl1NY8okaiHxkEn+rFu33EBbNuqasEXtDFw
   395ztX3jU/eXzJGfib4l7kBoMdzko250RYovv5mYFgwkSozNLLVB6pmwz
   Md+iaVx6upNaTsuJvXllcCFUAaUAmosHt80dJ35jhGVblZ7YbIbgVqqwg
   A==;
X-CSE-ConnectionGUID: zisMRbE3Q6OTk/d/FiQ70A==
X-CSE-MsgGUID: F+iADgajRLWNVK+xjeYDMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29116579"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="29116579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 22:30:38 -0800
X-CSE-ConnectionGUID: gI0PRdtTSVu6czkCzvpurA==
X-CSE-MsgGUID: +Fof8z9QS42eu8Wf1ufG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="116959206"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 22:30:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnXP7-000Cxq-2t;
	Thu, 27 Feb 2025 06:30:23 +0000
Date: Thu, 27 Feb 2025 14:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] crypto: lib/Kconfig - Select and hide arch options
Message-ID: <202502271449.k2LZdEgF-lkp@intel.com>
References: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_223041_053939_BFD7DBE7 
X-CRM114-Status: GOOD (  10.66  )
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

Hi Herbert,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[cannot apply to soc/for-next linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-lib-Kconfig-Select-and-hide-arch-options/20250226-125220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/Z76aUfPIbhPAsHbv%40gondor.apana.org.au
patch subject: [PATCH] crypto: lib/Kconfig - Select and hide arch options
config: x86_64-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271449.k2LZdEgF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271449.k2LZdEgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271449.k2LZdEgF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "curve25519_generic" [arch/x86/crypto/curve25519-x86_64.ko] undefined!
>> ERROR: modpost: "curve25519_base_point" [arch/x86/crypto/curve25519-x86_64.ko] undefined!
>> ERROR: modpost: "curve25519_null_point" [arch/x86/crypto/curve25519-x86_64.ko] undefined!
>> ERROR: modpost: "curve25519_null_point" [lib/crypto/libcurve25519.ko] undefined!
>> ERROR: modpost: "curve25519_generic" [lib/crypto/libcurve25519.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


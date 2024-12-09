Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E26E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzEy4+GgJB/XMrazYKYTrQl8xNUP2I3SBGrsSfu0g6c=; b=yEXCW+DkBpKuNksO1MXs0BqVYU
	ofj498Nvj/bBn4gE5omCbcBYpa2jfkSbKsBc09xT+42uSDFzdJbp7y14A6DNKRZA63T9F9Awb2J/j
	zO33ReBHzt1+hlv4wsfO7NrI46IcqaqzrBOHsS37tYAH5sv5ukz77G1d5eVR2XWggBZ5EwVsov6Ya
	I8B3FDHU62rUp0H6C5wKJYO6tj8OqZ2I44pscA7llnfXVyTkaZZolkM/nZ+43lm9JU0POK6Vhxi3W
	zNR3ee2pYxBpvj5cCzs4j6VtwG7GvvnoKcbpyw9pEi797AfhRzR+2ZQBhJ2qI6SIAJ+J7XqKuE2xe
	+5g3TL5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdOA-00000007qHK-2CSx;
	Mon, 09 Dec 2024 13:01:26 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd12-00000007jdD-2Uwd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733747852; x=1765283852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LYTEcPL033S5OYdOqoOU0GJya+KGHL3PTqelirKDtPI=;
  b=bxDl/38cQg5oO3lVwtLSJEiJwBwjSu215mjMHx923PTsEQBhgIusnuFJ
   EcgTaDbhe7KcBgbLzt1Ue2As6ZL4cBPDW9uVh+0tC3pAgZmLTQkr3vAg0
   u5eVe6/xTyY+qksQKQxCl/zzF4FMzTpNupHjXPKgIdZ1Ld2VxLfez+kTe
   N4F6d6Z8jQv7nAKW9HiONlc0OwyghnN0amwO2a3HA3JabUu62H59xINso
   7FH4pKq83RdriL9I+RxOkxzpXpqRVsvkvl9Un2uU7bYyGBatPtNMfbXpU
   1n4g1NgD0PZV6HgbbHvzaKw04uLq33qVmS3p35usabWcPLMTD2wRXIh+f
   Q==;
X-CSE-ConnectionGUID: 3FAP/jBXROeizuTZFah3oQ==
X-CSE-MsgGUID: AaVd8tvuQ1+0GYvaZISJ7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33954482"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="33954482"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 04:37:31 -0800
X-CSE-ConnectionGUID: gDggGBkFT2aWFsMGEIkWng==
X-CSE-MsgGUID: OEqzAqrNRvSllQHKzND+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95260217"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2024 04:37:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKd0w-0004Jz-22;
	Mon, 09 Dec 2024 12:37:26 +0000
Date: Mon, 9 Dec 2024 20:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on
 EXECMEM
Message-ID: <202412092048.tTzJ5szH-lkp@intel.com>
References: <20241209031251.515903-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209031251.515903-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043732_643951_FE01F6DA 
X-CRM114-Status: UNSURE (   9.75  )
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

Hi Anshuman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-execmem-Make-ARCH_WANTS_EXECMEM_LATE-depend-on-EXECMEM/20241209-111533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241209031251.515903-1-anshuman.khandual%40arm.com
patch subject: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on EXECMEM
config: arm64-kismet-CONFIG_ARCH_WANTS_EXECMEM_LATE-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20241209/202412092048.tTzJ5szH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241209/202412092048.tTzJ5szH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412092048.tTzJ5szH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARCH_WANTS_EXECMEM_LATE when selected by ARM64
   WARNING: unmet direct dependencies detected for ARCH_WANTS_EXECMEM_LATE
     Depends on [n]: EXECMEM [=n]
     Selected by [y]:
     - ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


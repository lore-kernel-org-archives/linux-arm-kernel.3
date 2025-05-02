Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEF7C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5unE4LlVBxaBtMwtmQeNBr68p+JcL4vnieS+0D/+dX0=; b=oTCXxNo9U78upQ4ajV/Wm8NkMc
	BiDOtM4Y/bJxG0K23Z8wkmsxb7/aAryi7Nsm9MMOHq+ePpHui5ji6xS4VY110YdAfCicpfM08mSOH
	67kxsK0orzBQj6TksmEbFYrLMmg11bNTuuRyrXjcbqYeLYpN9Bzk+hWBqg+iqnCU7HZkkryja1VTU
	Sj4Gq9SbAZcHuI/aSjVQojnbOQeQqTPZA93dkQlP9NqzpS7FUKvoZTwYaX+Z9+VmMoPMXz1UMvhX/
	z1jR7nOgwRV0LPBZaqqCO70lYLz54QjtwoDeFYDMQS64FukDfoLes5OIWT3GliJXsqgbSg7m31tSE
	J4ZM2I2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnhb-00000001b7q-0oI5;
	Fri, 02 May 2025 10:33:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnJA-00000001Ucc-0jEv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746180472; x=1777716472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e8/ynrXSAkfoRLP48zbKeDqIR8w4XEaL0sjJOL1EGrc=;
  b=eKaXuyUPZNl7dUZ2C6YnI4NjC8GFaCYiVs1uGbyi+5YfC5BNgIoMvOn3
   IySNL5Z0PGbHxFGtepXO6zSBsl8+YwqMsvBcv0X0cvql5CVXJq8v2yciz
   CK9Lyvnagt6Z0cG3waLWmzK31edC9gHOvubnXE3oU+8MxtjAaTTpj5JEV
   L8rVQ5oBSCDfu3C5BnE0vrXssS0njlvKN/mP4WJSDTz8mrihja68or/Jp
   C3kwEqQIURNKLJ67JHw1cKoj7W9Kjt+6Q2XEp2IAHZdJxzYwubw8oziOI
   dfyxhsV95iXifWxLWhQ3n68Di0Rdka/xHh6Dfx0wKZBIw5ZRLO0lNGfPj
   w==;
X-CSE-ConnectionGUID: sr5Bx1CDScO/x/9ONE0yKw==
X-CSE-MsgGUID: czahCZD9SqWpblD0vWVyrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47119331"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47119331"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 03:07:50 -0700
X-CSE-ConnectionGUID: daTlk9jhQiGMA7sg/MUotw==
X-CSE-MsgGUID: dhWxgGsLT2+k10nN15ebJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135131130"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2025 03:07:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAnJ2-0004ft-1r;
	Fri, 02 May 2025 10:07:44 +0000
Date: Fri, 2 May 2025 18:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Paresh Bhagat <p-bhagat@ti.com>, nm@ti.com, vigneshr@ti.com,
	praneeth@ti.com
Cc: oe-kbuild-all@lists.linux.dev, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com
Subject: Re: [PATCH 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <202505021704.jOlZOXSq-lkp@intel.com>
References: <20250501072923.1262414-4-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501072923.1262414-4-p-bhagat@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030752_222018_7E091E19 
X-CRM114-Status: GOOD (  11.77  )
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

Hi Paresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paresh-Bhagat/dt-bindings-arm-ti-Add-bindings-for-AM62D2-SoC/20250501-153150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250501072923.1262414-4-p-bhagat%40ti.com
patch subject: [PATCH 3/3] arm64: dts: ti: Add support for AM62D2-EVM
config: arm64-randconfig-053-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021704.jOlZOXSq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021704.jOlZOXSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021704.jOlZOXSq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:15:10: fatal error: 'k3-timesync-router.h' file not found
      15 | #include "k3-timesync-router.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts

    14	
  > 15	#include "k3-timesync-router.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


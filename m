Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC9EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 02:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBE2MyYD0WOcP53+ZnwtUb0hOP1Z0Zow5LV8/lRCeTg=; b=D5SFLrqWo8miCEQJTg7TPFETMI
	4VWu30/GFGszXVdxU5q9R1Mkeo5bQydL3FRQ9buiVliM/1ftWtqM9NGwX2KsIHvl1Y+Lj4JHen87R
	DwAo3fho6YmMLJkP0yex1eFNOaTkWG/t5NrlHuBoQ7oT5qlDZ4o4VttQwFqi+eGhV23zpPQjEdmo8
	VC7jyvfvGJubf6NVKEHqOzyP7wgVCqdWPGWa43K6fv89bkIcY9j5Xx978Woyg+cGnzBaiEDtSd3Tw
	E2BCSk3RZeE+N4NapI/B3cZrCdNZvJs1cMl44UcrX+8H4u0XyH8kC3P9yUV4G5tYsipaqR6m/EmYX
	6F81i1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAfo6-00000000Y28-3NZ4;
	Fri, 02 May 2025 02:07:18 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAfmB-00000000Xtr-1PO2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 02:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746151519; x=1777687519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/yF8kcn+v95yqfwAfHX+ghDjf2LWtZweUCg4gNHbCxo=;
  b=JLNOdVUGAx1I/sMdMZ/fsSpymCuV/CtBjTFTe97iNWklkuLxrgbhwQXe
   PP7nGR9eRL1DF3wf6yvACmXJO7S28aVhbcGzqNm41Jvy4wgZTLp4fPwFy
   8ckCRi5Ttcnd4ldliymkAYpMmYFduQKfphzWa4qNjqLP/HWts+nAib4+G
   ymakt9bgnG0z+dcua+P/+fIH+FrVN5/jJoTcp4PaOUb1fIQaZlHlzzZew
   EgDQhA97IpD6X+Fa4lcLXAA4FFbJ0GxDk1PuvPHH6odaLccWgC3g8BClQ
   hmJtiWMIfKBhMLOlNusIn7D63iHGOIKPzs0PGOPNUZTauwtrbiywfa3T7
   g==;
X-CSE-ConnectionGUID: 4yumx6zMTKyLEpvMOJKXww==
X-CSE-MsgGUID: yuEQHo1YQfWUwMXOTZ305g==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47718414"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47718414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 19:05:11 -0700
X-CSE-ConnectionGUID: qdJ8JRw5QySAgt1tBZiViA==
X-CSE-MsgGUID: L19U8F8/Se6AJA2eBdsjNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="139676218"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2025 19:05:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAflx-0004Uv-1o;
	Fri, 02 May 2025 02:05:05 +0000
Date: Fri, 2 May 2025 10:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Paresh Bhagat <p-bhagat@ti.com>, nm@ti.com, vigneshr@ti.com,
	praneeth@ti.com
Cc: oe-kbuild-all@lists.linux.dev, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com
Subject: Re: [PATCH 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <202505020921.tGSgIFVU-lkp@intel.com>
References: <20250501072923.1262414-4-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501072923.1262414-4-p-bhagat@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_190519_441922_97F9435B 
X-CRM114-Status: GOOD (  12.74  )
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
config: arm64-randconfig-003-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020921.tGSgIFVU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020921.tGSgIFVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020921.tGSgIFVU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:15:10: fatal error: k3-timesync-router.h: No such file or directory
      15 | #include "k3-timesync-router.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts

    14	
  > 15	#include "k3-timesync-router.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D321BC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mc4P2PQoZ4mkmF3mqFcZLQ7EV/br9cJW+wFoP0+ZcZM=; b=OVA3virTbJvYADh0iqJ1KGnFR9
	6ZaKMwkREEiEJG+ty8wf7A8vxOxHgtHkmPiKzsM+o4eK7cdzulvtbrRjY1V+XDz5dbJmKoRKLR/AY
	UlLoOiyNpB/xdyNw1DEAa8VPh8iy5pYHp/oZzhmCwYEUR40edvcvsSTq60ZDp7Y9fcmlS0ZOiZLLs
	cwZ6PIz8NLMwysgcgQelb7SaVfRj5jmFPEOApI9g9QCjVWCOt98DcyGB3bzCiRp31zOZ9MZZEofz6
	Nw1qfEMwKOV0XKwA/Oz5UooejW7eLjHaIQzx715B+AuCJqKpnkviWb590Mpw65O2tvNUqF57nMr5L
	FTe7fB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxAS-00000000CYS-0Smw;
	Thu, 08 May 2025 09:03:48 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwn6-0000000095R-3awD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746693581; x=1778229581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J1quForL1AyV+mxiU/+Tx5j7sIP7VxLUjzVH0JaG5GA=;
  b=QSrrnWQSGrInAW3NtGyF6D76MKdc0eXAq4tOuM58MXVCvbwoCkpfnJ0a
   5kfdA8KquZc3JaNNFI9R++53yTniJcyDq/ZqwZ7U64GvKZwuGUsT6NBJd
   7hB7iHRnVvcVexRpp0Qcf80eYww/IHQ5Br+fAwqQyFL6uMNigH9OYqTKT
   yjpHWJvUER6ULDPYGOnuM9wYTFrzfSjJmteEls8zVcoSgh7sURquB/rJQ
   eI3jS+ULYRKC6M5tpYPwwqnWst1rAr0jekBA7ZLhfAU+Y7uwDnhuZXdTX
   8zmHo4lconP/2+SrLI1ojztv0do8+Ldjkgr4Cp8jmqjTZQ0uEAIq73IKL
   w==;
X-CSE-ConnectionGUID: IOSAXr0OSYyW8EPwPdzyUQ==
X-CSE-MsgGUID: dUXIT3F5Sx68r5bPTZ2EwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52273881"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52273881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 01:39:40 -0700
X-CSE-ConnectionGUID: oQrkPq5kQgifWHGyg4j/xQ==
X-CSE-MsgGUID: Pw0GmgEXRM65MOnUpmGxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="135925309"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2025 01:39:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCwn0-000AnH-04;
	Thu, 08 May 2025 08:39:34 +0000
Date: Thu, 8 May 2025 16:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Schultz <d.schultz@phytec.de>, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robertcnelson@gmail.com, francesco.dolcini@toradex.com
Cc: oe-kbuild-all@lists.linux.dev, upstream@lists.phytec.de,
	w.egorov@phytec.de, Daniel Schultz <d.schultz@phytec.de>
Subject: Re: [PATCH 4/4] arm64: dts: ti: k3-am62a7-*: Specify Temperature
 Grade
Message-ID: <202505081648.oRdmP2QV-lkp@intel.com>
References: <20250507050847.912756-4-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507050847.912756-4-d.schultz@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_013940_937615_80609455 
X-CRM114-Status: GOOD (  12.20  )
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

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Schultz/arm64-dts-ti-k3-am625-Specify-Temperature-Grade/20250507-131122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250507050847.912756-4-d.schultz%40phytec.de
patch subject: [PATCH 4/4] arm64: dts: ti: k3-am62a7-*: Specify Temperature Grade
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250508/202505081648.oRdmP2QV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081648.oRdmP2QV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081648.oRdmP2QV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dts:14:10: fatal error: k3-am62a-thermal-automative.dtsi: No such file or directory
      14 | #include "k3-am62a-thermal-automative.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts

     9	
    10	#include <dt-bindings/leds/common.h>
    11	#include <dt-bindings/gpio/gpio.h>
    12	#include <dt-bindings/net/ti-dp83867.h>
    13	#include "k3-am62a7.dtsi"
  > 14	#include "k3-am62a-thermal-automative.dtsi"
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

